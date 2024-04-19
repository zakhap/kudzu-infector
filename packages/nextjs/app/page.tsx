"use client";

import type { NextPage } from "next";
import { ContractUI } from "~~/app/debug/_components/contract";

const Home: NextPage = () => {
  return (
    <>
      <ContractUI contractName="Infector" />
    </>
  );
};

export default Home;
