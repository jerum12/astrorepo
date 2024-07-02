
// Import the functions you need from the SDKs you need

import { initializeApp } from 'firebase/app';
import { getFirestore, collection, getDocs } from 'firebase/firestore';

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyB7a4R6jeH6bRyFeRpJkvPTpgEu_eMfXeo",
  authDomain: "my-astro-project-c9a10.firebaseapp.com",
  projectId: "my-astro-project-c9a10",
  storageBucket: "my-astro-project-c9a10.appspot.com",
  messagingSenderId: "982852858934",
  appId: "1:982852858934:web:4af9a430252d99016ed497",
  measurementId: "G-6M6SPX5RFM"

};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);

export { db };
