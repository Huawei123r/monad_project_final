

const { ethers } = require("ethers");
require("dotenv").config({ path: "../.env" });

const counterAbi = require("../out/Counter.sol/Counter.json").abi;
const myFirstTokenAbi = require("../out/MyFirstToken.sol/MyFirstToken.json").abi;
const myFirstNftAbi = require("../out/MyFirstNFT.sol/MyFirstNFT.json").abi;
const simpleDexAbi = require("../out/SimpleDEX.sol/SimpleDEX.json").abi;
const todoListAbi = require("../out/TodoList.sol/TodoList.json").abi;

const counterAddress = "0x299Cca24361b9a5437494c34622F5BB65312CdD1";
const myFirstTokenAddress = "0x46E4cb3B7763a5819B94F18FB1B14fb9B5208790";
const secondTokenAddress = "0x11C3F7863d7A2cee3BCE4e68B381493b1589EB3d";
const myFirstNftAddress = "0xf8b5d80c2dBebCD3c59Ce62FB5515D97e7412E8a";
const simpleDexAddress = "0xe0cba59A3186Fe5f3c9053e82d2855BFD537c850";
const todoListAddress = "0xdf07ea1f7f4b042584475235A829afc2b43485E7";

const provider = new ethers.providers.JsonRpcProvider(process.env.MONAD_RPC_URL);
const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);

const counter = new ethers.Contract(counterAddress, counterAbi, wallet);
const myFirstToken = new ethers.Contract(myFirstTokenAddress, myFirstTokenAbi, wallet);
const myFirstNft = new ethers.Contract(myFirstNftAddress, myFirstNftAbi, wallet);
const simpleDEX = new ethers.Contract(simpleDexAddress, simpleDexAbi, wallet);
const todoList = new ethers.Contract(todoListAddress, todoListAbi, wallet);

async function main() {
    console.log("--- Interacting with Counter ---");
    const initialCount = await counter.getCount();
    console.log("Initial count:", initialCount.toString());

    console.log("Incrementing counter...");
    let tx = await counter.increment();
    await tx.wait();

    const newCount = await counter.getCount();
    console.log("New count:", newCount.toString());

    console.log("\n--- Interacting with MyFirstToken ---");
    const balance = await myFirstToken.balanceOf(wallet.address);
    console.log("MyFirstToken balance:", ethers.utils.formatEther(balance));

    console.log("\n--- Interacting with MyFirstNFT ---");
    const initialOwner = await myFirstNft.owner();
    console.log("Initial NFT owner:", initialOwner);
    
    console.log("Minting new NFT...");
    const mintTx = await myFirstNft.safeMint(wallet.address);
    let receipt = await mintTx.wait();
    let event = receipt.events.find(event => event.event === 'Transfer');
    const tokenId = event.args.tokenId;

    console.log("Minted NFT with token ID:", tokenId.toString());

    const newOwner = await myFirstNft.ownerOf(tokenId);
    console.log(`Owner of NFT #${tokenId.toString()}:`, newOwner);

    console.log("\n--- Interacting with SimpleDEX ---");
    console.log("Approving DEX to spend tokens...");
    tx = await myFirstToken.approve(simpleDexAddress, ethers.utils.parseEther("100"));
    await tx.wait();
    const secondToken = new ethers.Contract(secondTokenAddress, myFirstTokenAbi, wallet);
    tx = await secondToken.approve(simpleDexAddress, ethers.utils.parseEther("100"));
    await tx.wait();
    console.log("Tokens approved.");

    console.log("Adding liquidity...");
    tx = await simpleDEX.addLiquidity(ethers.utils.parseEther("10"), ethers.utils.parseEther("10"));
    await tx.wait();
    console.log("Liquidity added.");

    const reserve1 = await simpleDEX.getReserve(myFirstTokenAddress);
    const reserve2 = await simpleDEX.getReserve(secondTokenAddress);
    console.log("Reserves:", ethers.utils.formatEther(reserve1), "MFT,", ethers.utils.formatEther(reserve2), "SCT");

    console.log("Swapping tokens...");
    tx = await simpleDEX.swap(myFirstTokenAddress, secondTokenAddress, ethers.utils.parseEther("1"));
    await tx.wait();
    console.log("Tokens swapped.");

    const newReserve1 = await simpleDEX.getReserve(myFirstTokenAddress);
    const newReserve2 = await simpleDEX.getReserve(secondTokenAddress);
    console.log("New Reserves:", ethers.utils.formatEther(newReserve1), "MFT,", ethers.utils.formatEther(newReserve2), "SCT");

    console.log("\n--- Interacting with TodoList ---");
    const initialTodoCount = await todoList.getTodoCount();
    console.log("Initial todo count:", initialTodoCount.toString());

    console.log("Creating a new todo...");
    tx = await todoList.create("My new automated todo");
    await tx.wait();
    console.log("Todo created.");

    const newTodoCount = await todoList.getTodoCount();
    console.log("New todo count:", newTodoCount.toString());

    const todo = await todoList.getTodo(newTodoCount - 1);
    console.log("New todo:", todo.text, "| Completed:", todo.completed);

    console.log("Toggling todo status...");
    tx = await todoList.toggleCompleted(newTodoCount - 1);
    await tx.wait();
    console.log("Todo status toggled.");

    const updatedTodo = await todoList.getTodo(newTodoCount - 1);
    console.log("Updated todo:", updatedTodo.text, "| Completed:", updatedTodo.completed);
}

main().catch((error) => {
    console.error(error);
    process.exit(1);
});

