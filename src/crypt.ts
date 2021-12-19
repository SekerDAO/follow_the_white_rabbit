// run 'npm install eth-crypto --save'
import EthCrypto from 'eth-crypto';

const encrypt = async function () {
	const privateKey = '0x'
	const publicKey = EthCrypto.publicKeyByPrivateKey(privateKey);
	console.log(publicKey)
	const address = EthCrypto.publicKey.toAddress(publicKey);
	console.log(address)

	const encrypted = await EthCrypto.encryptWithPublicKey(
	    publicKey, // publicKey
	    'what you seek is in the data that we call - 0x43C6529292C68Af8330776b260d852F007876cF9' // message
	);
	console.log(encrypted)
	const decrypted = await EthCrypto.decryptWithPrivateKey(
	    privateKey,
	    encrypted
	);
	console.log(decrypted)
}

encrypt()
