import { NFTStorage, File } from "nft.storage"
import fs from 'fs'
import dotenv from 'dotenv'
dotenv.config()

const { NFT_STORAGE_API_KEY } = process.env

async function storeAsset() {
   const client = new NFTStorage({ token: NFT_STORAGE_API_KEY })
   const metadata = await client.store({
       name: 'PolygonXeasyA#075',
       description: 'This artwork of an owl made out of polygons acts as a ticket for you to enter this event',
       image: new File(
           [await fs.promises.readFile('assets/PolygonXeasyA#075.png')],
           'PolygonXeasyA#075.png',
           { type: 'image/png' }
       ),
   })
   console.log("Metadata stored on Filecoin and IPFS with URL:", metadata.url)
}

storeAsset()
   .then(() => process.exit(0))
   .catch((error) => {
       console.error(error);
       process.exit(1);
   });