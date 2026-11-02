Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12458606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ya2vB7vA
Received: from list by lists.xenproject.org with outflank-mailman.1468180.1677266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNrI5-0002uE-PV; Mon, 02 Nov 2026 12:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468180.1677266; Mon, 02 Nov 2026 12:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNrI5-0002u7-Me; Mon, 02 Nov 2026 12:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1468180;
 Mon, 02 Nov 2026 12:37:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xNrI3-0002u1-SN
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 12:37:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNrI2-003hBk-NS
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:37:30 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae88408-bab6-0a2a0a5309dd-0a2a4509b9da-8
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 13:37:30 +0100
Received: from [40.107.200.31]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae88409-be1a-0a2a45090019-286bc81fa488-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 13:37:30 +0100
Received: from BN0PR04CA0136.namprd04.prod.outlook.com (2603:10b6:408:ed::21)
 by DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 12:37:25 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::93) by BN0PR04CA0136.outlook.office365.com
 (2603:10b6:408:ed::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 12:37:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:37:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:37:25 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:37:25 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 2 Nov 2026 06:37:23 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIdQIJuLMZWPVvUsg3m9tSVdEvFWvR8IDBBLq/2CVuAS8mwjYfY9CdbSevI7fHWJ4LwPqapEZpKvgAtyIiOIr/IAQthD35U7tfTBeiLrIHiylmG/klMOzlFyUm86vGuzco7D/BMrPX4zDIhgChYy1tZAO7IrOWN0/obUqbnN+wzVH7VrqyFCp5+2brO8NShJhQ1MyK7NWZbGgDKQ6I4RZNykEuCD7PIDXd1xWarI8xL39l0OHUS86kBIaGiPhcoF3QdbqXriXme6lU1y7cOl1X2gnvsDlGGWwJFazcAu/uPcrDFku6JX3ONZsvWGpgrf/ByPyIEbffaHFWv3XDXNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwsENutMZcZA6Xm4+m4gpEJa8/UogDlocvKWkkhzqkM=;
 b=OSt3SOguljgAhJ9f6Crkskf4bWrevsN4Vfo1NlJnfr2u6IvIK3wxW67jrb44QWLvZbABs7GH1wfy601ZiKbzX389+1wZMhX43i998Pd17nlQVtNGi9zPVKUUjoeiuNA+fFcWo2VjDDoYBm8kLeMqvSKHzLQxVmGwFuYIh3eEA0B/ch/B/nW6ceQo7UlOD+8er2fiHJktgNer6Hw5VOyGlKUxciKAzliZitsNzXWeNDKa0RfVzdg29y19VkE18tVqXw564tgjJHo98BLQhZKvIJtIRt72tJ4seph3EcJGNp4E0pNBvPfzumEWFX1J1ngpUKR/TEyTIFtlPaKpAH1I2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwsENutMZcZA6Xm4+m4gpEJa8/UogDlocvKWkkhzqkM=;
 b=ya2vB7vAtGttqW7pOtzNea9AAda3zDr7UplgbiQvfWVuw0cO17xaIOwTNt9WXeFCwidjklaj9rEDsDxkFqZtuKM7sJ0oi+hyzDdeRPrP59+8zrFiD0azA1zPlTtbor4ZkP1g2qFKmMdfRVXfV9f9sOjFFnnT1QU/gt74DCO2RVg=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fa88c197-61dc-4e32-a8a7-cee501527c9e@amd.com>
Date: Mon, 2 Nov 2026 13:37:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dt: Skip non-RAM reserved-memory regions in
 make_memory_node()
To: Kuan-Wei Chiu <visitorckw@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>, <marscheng@google.com>,
	<jserv@ccns.ncku.edu.tw>, <eleanor15x@gmail.com>
References: <20261028211737.17629-1-visitorckw@gmail.com>
 <d25a667b-5126-4c57-b379-c31c4e7645c6@amd.com> <auUS_7jNO-0ONE1e@google.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <auUS_7jNO-0ONE1e@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|DM3PR12MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: ed310b8e-38fe-4cc8-c803-08df38de0cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	bAo1wxmnJTGs1DCx7xwr83z3ZuKyv3jl0lObsctvHzbsWlExL5xCAGsSj/WITzFFpdWmbG3m96u7WKsVU7j9Ap5VI969Jp0lmdCVjWAGBHv4P2KSd6FKg5dP9sOt43uNbLmGrT8Ke3aRx4Rri730KeZC37eodcD/T+qRVMEzMl0A6qSRU5/q9MUCWy7xXPUQchawMTS8DxtilLqZXKPrXwoXHdpPcnMqIAm1HrmAqi+CY19H8O4ZXMKXA6a0haIOwCQIHCIQjaesB34gLkfoCzID7MfH6jlnwa2htzaeXDQeNaWTLVj2BCkGXgzxBkWdWvY3wak809ioQQcBFdiElv8m0cUmQB8FTd6jC4e6H+RfXWTVLsPvtSV1sC7T2kLkwUDKqdt/HdejoeNaTCtW+38RqOO0/vtkq4U046DnSEpZHSo+1E6xwmaNZaKEZXMwS58CDCBKEPvnopNPEk2iniVMavOWXiprxwjCM9cIG0MT/uoluVjem4RD6ZMZ5T6mTDiVnQx7UpV3MShNiMEp2/yFD6qU3jC6Q4o0HONdhv8AD77PkmWB+3sit/MOLJvn7RsiC4xiGZ6o6/8ZTcEYSEwnBweAJpK8ll5L8BdGDeStBVNoVpkcC1LpwYFzhH9DCYPY1gA18P0ih04LTibf7QEN3ELqZwX4DQFcM+dwz68=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PLDYdcdfOzccnkEBl2UFGHXa+Dti0Ogap0aSa2rS8toAArigW1eD9OelwwRCScAjhk1xeukVXBEqb4XNHH/ldRj7Zto2wf7GAalSEHTrQIWnczAhwtMu8S10G7mx6XRaTYcQ+r2tg7GsPl1MHH10ZwXUHecOlIudwmJCcLXd5lATTFifUFVBYYJiwJPStzMxOIAptjsGplZ4Wcflu13lGW3LnmEhkpwyKyZTFs63xF1+X9zpmLIl5pkxYrzGcOIpcnYRQKGLSfqQ4eWEQf59jICTipwp3PyUyzHyldJw4FclFHdo0NIE/SRmft8jB7NZdOLGKZ9HAG1n2sCk7XssiVS2KMfpRvLx57uqu4Uq05LzzFlYnOK35myAQ2UGknFwDnxerNec/mbXLCUmeUV/xPm+Y5XBtvTdwFMB4InNfIieop8V+hVSbCbHzcxeNOaF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:37:25.5954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed310b8e-38fe-4cc8-c803-08df38de0cab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9416
X-purgate-ID: tlsNG-bad1c0/1793623050-3B0DD034-F019A7E3/0/0
X-purgate-type: clean
X-purgate-size: 2305
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 30-Oct-26 22:58, Kuan-Wei Chiu wrote:
> Hi Michal,
> 
> On Fri, Oct 30, 2026 at 12:04:58PM +0100, Orzel, Michal wrote:
>>
>>
>> On 28-Oct-26 22:17, Kuan-Wei Chiu wrote:
>>> Xen creates a second /memory node for Dom0 from
>>> bootinfo_get_reserved_mem() without checking whether those regions
>>> belong to host RAM. However, /reserved-memory can also describe
>>> on-chip SRAM or firmware regions outside system RAM. Listing them in a
>>> /memory node causes Dom0 to register non-RAM addresses as system RAM,
>>> conflicting with device MMIO mappings.
>> Hmm, I always thought that /reserved-memory is to exclude regions from memory
>> described under /memory. That's what Xen assumes too. map_range_to_domain() for
>> example does not call iomem_permit_access() for such regions because we assume
>> it's RAM. Can you provide more details of your board e.g. the device tree? Is
>> there any documentation I could use to confirm that "reserved-memory can also
>> describe on-chip SRAM or firmware regions outside system RAM"?
>>
> Hmm, your reply initially made me wonder if this was caused by a
> non-compliant downstream device tree on our side, so I checked the
> DT spec and upstream Linux.
> 
> The devicetree spec does not seem to explicitly mention whether
> /reserved-memory regions must fall within the range described by
> /memory. From a quick look at early_init_dt_reserve_memory() in Linux,
> the comment there also mentions not worrying if a no-map region is not
> memory as it will not be mapped.
> 
> In upstream Linux device trees, there are cases like
> arch/mips/boot/dts/mobileye/eyeq5.dtsi and eyeq5-epm5.dts, where
> /memory starts at 0x40000000 and 0x802000000, while /reserved-memory
> defines an on-chip sram region nvram@461fe00 with "nvmem-rmem" outside
> /memory.
> 
> Our board's device tree is not upstream yet, but it follows a similar
> pattern where /reserved-memory defines "nvmem-rmem" and dma pool
> sub-regions inside on-chip sram outside the dram range described by
> /memory.
Thanks for confirmation. I can now see:
https://elixir.bootlin.com/linux/v7.3/source/Documentation/devicetree/bindings/nvmem/rmem.yaml
so indeed /reserved-memory may describe non-RAM regions. I'll get back to your
patch then.

~Michal


