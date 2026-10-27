Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BC3606A31D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=PXLM0fkt
Received: from list by lists.xenproject.org with outflank-mailman.1462578.1673596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNJ-0006IN-8Y; Tue, 27 Oct 2026 21:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462578.1673596; Tue, 27 Oct 2026 21:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNJ-0006Hb-31; Tue, 27 Oct 2026 21:06:29 +0000
Received: by outflank-mailman (input) for mailman id 1462578;
 Tue, 27 Oct 2026 21:06:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNH-0005sf-OA
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNH-007tzZ-4G
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:27 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae1124e-2eae-0a2a0a5409dd-0a2a4508e5fe-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:27 +0100
Received: from [52.101.70.143]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11252-f659-0a2a45080019-3465468f96f5-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:27 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by GV1PR03MB10428.eurprd03.prod.outlook.com
 (2603:10a6:150:168::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 21:06:22 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFlOCO0DEv4D533UiHOU5MV+qW/J6bzMLAK7SokbA6Z/f7Ccv15fiQHo1yX/i7wYVWr5be/88Nuy5GCrgkOgQckVjs3LgQel2nd0STK4mcteqvmNRjflNDmkIMfaTevGBqPmEpIa43rexmjVNnbRtL+vWBVrd9InnBgdQYUo0hfyMNyAq9fIfb4A++/3wmh5vGtdH5uaG4iu7mw6iW8aJ6x/mYKYcXGIt4u+NccwkPs3Z1C9wcaeLx2ZiwgB+nZ4uSDzoCRrLORyIT45hTu3GaVNf70PyX56IbTIBn3FLS8UTIXp9oQvkZ1cV21wwcROjKiRVmrRhqW7KEGznaXWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdpgfDex7pJyiNeN08FNRagArxgc9rcXre8jLdw1tLg=;
 b=OiI8HTxfYEr9QKRAwIr8a1aWUbUV+MmqVskAaYyR88iNqAVb+hW0qaaB7ortUaupBezErhyW9i1AWr9EqFCI/UhKI9lGs6/WytH8MpfufZBUJsJZMODhIf6Qj0Tkmc9TEqYyWWX7RxOVopAjE9qMedqE8vWiPibJ57vx1dLCBkBCaKOWzBdApk0VxxlPWfZOXR9kpBpIyUYnuM/Hipwii61G9mtRkgM+ICM/bx2fjWRgs2WxWNogTQBb13JcEHHgWuJeWB6vamaXR4fCKxqEl5Ed/gz2hcA8HuyCwyVd1J1bniY26fmXviVy6UxA3pF0Ksr6DXDGCU9m9Z+iWzdsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdpgfDex7pJyiNeN08FNRagArxgc9rcXre8jLdw1tLg=;
 b=PXLM0fktfvCLwW6Ufb5eiSE5KS5VV5tnYxRAGP3s/dFfBlwxQw7VVXI5JmgFBKyAIKXbsEKbNJyHJ26qbfVGRUFlWccNDNMJ+jwE+EKNI+QHyRZtrgADBRoSyZUJp97z/VMh1aTY93/w7KzIC8uPHa+NTtsH43Vf5A5lwAOyrXdGr6+bdDBW+lwt5P478f3YKecxiRzwSHHxqBICtDy1ttH0QQtZthgvU2XF0vC7KiC591xK8Mtg/oxXp4V9I+P2acDMmFvlnguOSZQHXUdM6vvA3xYSopsSfJS+O6ovovDjBoXauS97rgtWHL5LuubfU26l5/J2RMNRus+KY4XdIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v13 05/14] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
Date: Tue, 27 Oct 2026 23:05:54 +0200
Message-ID: <25db7c4451729a8c6e35b5e8f7a473c42eeac7a9.1793129971.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793129971.git.mykola_kvach@epam.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|GV1PR03MB10428:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3f1c6b-2459-47c7-930c-08df346e26f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|261026121527099003|3023799007|5023799004|11063799006|10067099003|261021121427099003|261021135927099003|261009223027099003|261022075727099003|261022105027099003|56012099006|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	YJJ3Q7OfqoXsfm7+weJrnrLhgpcnWBUu31ZjyQsnWY8bpoE3aw4BAZKVpcpHVZDVv2txCeRnC6Ak0okHe0FftVCUErnMAGJ3/OKbGI0l6gN7OMruXd/XQi7fG3OUwjT3AoUp+o8nbobVpvn1HgGe9a1J/+ReQLuHvJFegNXLDLXprbaL5Eh082toWJTsRovTFHCBQRmeSLOwpGEObkDAzL+O0XY8E9JYMsbOlj3kJ0ZtF2ks25r2W+EL6F23dEzUz8JSH/ba0wZhkUIXtuAISm+GEZTAj4GHnbeEib1nkRT/DVzhgl7IVBWEetpf/bPZMsE+Tt2Ulqh2DDC5fwlYjhEHtzctFTO49KPifU54w30Ra3431vEFoVXOg6raCKPbiSD5Vuro/vJ6SRH6BbxP+6yjq4CoMTiMDHT9ZgJe5tsL2VmLvxi7j/j2B13FnJO6HOnMgbkd393CCc2j+7k/bjWEqocASSRvK5fSoHcD3dncsEFJcvcvc1NsuiuGEzQ7JAs+VbC9mJIQzCHQFgYYsYhpIlA8/Zs7ZwY45IxjQIKZnGH3DEtq4hXPnBBD0avNzbzNtSR8Y9goXjZ+yu9kZDFPBQvX1oIzB9X4AOe9eltjRullcUmp5v3S3Y1E438U2fhH3rCy59wRYGrH0t33NIWcdFUyVnsVm25Wy7NO8JI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(261026121527099003)(3023799007)(5023799004)(11063799006)(10067099003)(261021121427099003)(261021135927099003)(261009223027099003)(261022075727099003)(261022105027099003)(56012099006)(261021123027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5LeaDi9A8sZQRDJTRjtDhLGL1lgAv6Y/Xj9/ZJ0wKMgLuMQ5+wKlfCjjCAdC?=
 =?us-ascii?Q?j8k1uLz/Ws+i0B9YfZfjVlQn6ei3Zeh2Ono3eiNyReviuT3Qe59PWvEm81US?=
 =?us-ascii?Q?VRFxGqrsQvxYOaZZp8vLhDjo3gCKkg/uuL9cJ2fEWt8z0jGQlMwQvuR1Ry2V?=
 =?us-ascii?Q?BjTUgBKh36w3ctRm7JBOIA10QVruvIaJt7V2RBCqO3Mv9FajxdcF4hBwHWj9?=
 =?us-ascii?Q?8Cr+NmSqqQzdzpj7GCrii/7qQ3oGtmON3WO2ofFx401qZDekWkn3wMAw3Y/C?=
 =?us-ascii?Q?ibcnY7N0muEBqMAiFMxyeOUzDVedJzu0j8U96bZ2Wm2Yx3PBE5lBQCiMbK+h?=
 =?us-ascii?Q?L7DMq3op/Lv6RwCW2LZG6pCj0bh0OphQMJUhKFtES74L9cHiymay9XMZW47+?=
 =?us-ascii?Q?71TffJkhzo7IfRKjUqfcExEfIS9tQxy6nEVrsYZy37/vnkgyzTEHHjf/UCNQ?=
 =?us-ascii?Q?6MWPNkLJusuGXsSrvORazv+sN/705loH8SNC2+cnRfAAyn8alBzxnCRV07aq?=
 =?us-ascii?Q?DukbubM3vKsrkt7xrsgCmhP/a846NW5fsByzdUeJApZ87TxZvzgRBQvV/wQN?=
 =?us-ascii?Q?QSCOjFaCaQhU9e/rqTj8eXXvivIO7QNRXcygPAD/yygbNmZP7D0LC6nzcsBJ?=
 =?us-ascii?Q?nbFq8u22eIH/NrJYjb1eQ7xMkf9McLxYDc1f2uLhYsz24iFb8iUrb93KSthV?=
 =?us-ascii?Q?ptddT1zP5xdZJ0znQ5O2JmNAaD1auo6GWnb+Hw66cwsXOCOGyyXIO7AEZPvM?=
 =?us-ascii?Q?/5vakOgzwNajx1ZgDzI8kBZ26KvyI62CLvU8Dh1zi7KS2w6RAjj9xiLEmK4/?=
 =?us-ascii?Q?ITkB9E4HuViNIbd2nUCqCPeky2YnMzWdjtkmzW1KclWPoCeicoNJ7qD4tmS9?=
 =?us-ascii?Q?6ekOHGbZYyOyEtyYyop8xo+EUfPmh9cbCr8t6r4BzQac9o8873j6qRM5PVqC?=
 =?us-ascii?Q?27XlFYh2Ez1ZNZzq55hbKtmqhk4YssaCiULYqNKI1BnCIymYguTw1JWVigIx?=
 =?us-ascii?Q?Hrzw7gYj+Y72i9XIvCYeZ+R4X4Z/8nIp15QmJDpypzE0VyBzpX4ZtMc16Szz?=
 =?us-ascii?Q?ju7DvyP/+33i8/2jiwP9IuHWnmq03rgedTCLcsQvBi/8K7ZufwnLgkYQ7WF6?=
 =?us-ascii?Q?cDLwiGOe7iDU7JaOz39mt1mQ8xfGMq9xts/JzaEJMlmVFH/z/Lt/MfT5oNCw?=
 =?us-ascii?Q?LLS4xtZjGgCDInWNHH6g3GSqgOkQhvWJumNBGKRRTv6Lt+8GBK4ENueAmHCO?=
 =?us-ascii?Q?PMRikP8o+p/P6BuVNi1XyzEFaiQTK32xaV46fdkLWZ80OurCiK8SkVvbT2m3?=
 =?us-ascii?Q?uS0Na/H9F6bGUJRpibBybEfanAY1pwvPrTC2FUh84IYGh9CKwULhDAn0rebD?=
 =?us-ascii?Q?/noCDwCw/0PTvpWeKV6H8L7UcFhyh7jqMD/RpGq5Zg8YHVpv1SPY9X+S1zXC?=
 =?us-ascii?Q?K1IOtuYol8s85YixixQymb1dQqtogEzuUkyri1JO2BVfxW+P06WChg+nYSmS?=
 =?us-ascii?Q?TcEjoM+F9pHwktJmDgrxcrinWQAVspfUVo9pK0olW6NMhMQpOEJ0lZQ8Fpxk?=
 =?us-ascii?Q?sUUdZoZmpNQ7QHAJUGlEPARMnw6aM0QaJlULtLoHzSPcAEkoSVmLNv9ELSVc?=
 =?us-ascii?Q?9tRUpWn9xw2xPjreOHk7h/c41vKyf9cVlwSJe9xia2zAduPo8h84RPhc57H7?=
 =?us-ascii?Q?SH7MeoN1348GEVR+sWicYB60baIqbfv97Yxg4okJdC0jjbB5wnZYK/fC12Vb?=
 =?us-ascii?Q?Hfr3N6UwtQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3f1c6b-2459-47c7-930c-08df346e26f4
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:21.5863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE2fpkzQeOmCEu79me0685WMy6c3QC6RlBUBDpaLldf1y9Iu1JKVX3/7fiBhmqbs1Qilfuwwil+kGgBps2jHSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10428
X-purgate-ID: tlsNG-c1860d/1793135187-CF95A87B-64F3F3FC/0/0
X-purgate-type: clean
X-purgate-size: 22789
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Before continuing suspend, also verify that the physical CPU interface
has no Group 1 active-priority state left. Use ICC_CTLR_EL1.PRIbits to
decide which ICC_AP1R<n>_EL1 registers are implemented, so Xen does not
read an unimplemented AP1R register.

Have gicv3_suspend() panic if the Redistributor does not set
GICR_WAKER.ChildrenAsleep before the timeout. Clearing ProcessorSleep
while ChildrenAsleep is still zero is UNPREDICTABLE, so Xen cannot safely
undo this transition and restore the CPU interface. Keep error reporting
in gicv3_disable_redist(), including the CPU.

Check active priorities before disabling the CPU and virtual interfaces,
while local IRQs are masked. Return directly on failure, without changing
the interfaces or requesting Redistributor sleep.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V13:
- Use uint32_t for the CTLR argument of the active-priority check (MISRA
  Rule 10.3). No functional change.
- Cast saved CPU register values to uint32_t to avoid implicit narrowing
  (MISRA Rule 10.3). No functional change.
- Rename the SPI/eSPI helper parameters from is_espi to espi so they do not
  hide the is_espi() helper declared in asm/irq.h. Use the same name for
  the GET_SPI_REG_OFFSET() macro parameter (MISRA Rule 5.3). No functional
  change.
- Rename nr_irqs to nr_block_irqs in all SPI block helpers and in
  gicv3_suspend()/gicv3_resume() to avoid hiding the global nr_irqs (MISRA
  Rule 5.3). No functional change.
- Panic in gicv3_suspend() if the Redistributor sleep request times out.
- Log the CPU at error level on a sleep timeout.
- Check active priorities before disabling the interfaces and return
  directly on failure. This is safe because local IRQs are already
  masked: Xen's IRQ handler cannot acknowledge new interrupts, and
  pending interrupts alone do not change active priorities.
- Capitalize the comments noted in review.
- Use fallthrough instead of comments in the active-priority check.

Changes in V10:
- abort suspend when the physical Group 1 active-priority state is still
  present, deriving accessible ICC_AP1R<n>_EL1 registers from
  ICC_CTLR_EL1.PRIbits;
- re-enable the redistributor before restoring CPU and virtual interface
  state on the suspend abort path;
- panic if the redistributor cannot be re-enabled on the suspend abort path;
- avoid saving/restoring reserved GICD_IPRIORITYR and GICD_IROUTER entries
  for a partially populated last SPI block;
- disable Distributor group forwarding while preserving affinity routing
  state before restoring Distributor configuration;
- disable SPI/eSPI forwarding and wait for RWP before restoring
  GICD_ICFGR<n>.Int_config.

Changes in V9:
- fix the suspend-context comment typo and split dist_ctx declarations;
- restore ICC_IGRPEN1_EL1 on the suspend error path;
- re-initialize GICD_IGROUPRnE during resume;
- restore GICD_IROUTER only after re-enabling ARE_NS during resume.

Changes in V8:
- use right rdist base for prop/pend baser and ctrl

Changes in V7:
- restore LPI regs on resume
- add timeout during redist disabling
- squash with suspend/resume handling for GICv3 eSPI registers
- drop ITS guard paths so suspend/resume always runs; switch missing ctx
  allocation to panic
- trim TODO comments; narrow redistributor storage to PPI icfgr
- keep distributor context allocation even without ITS; adjust resume
  to use GENMASK(31, 0) for clearing enables
- drop storage of the SGI configuration register, as SGIs are always
  edge-triggered
---
 xen/arch/arm/gic-v3-lpi.c                |   3 +
 xen/arch/arm/gic-v3.c                    | 456 ++++++++++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
 4 files changed, 464 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 1a893d3ab2..3dd07db007 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -519,6 +519,9 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
     switch ( action )
     {
     case CPU_UP_PREPARE:
+        if ( system_state == SYS_STATE_resume )
+            break;
+
         rc = gicv3_lpi_allocate_pendtable(cpu);
         if ( rc )
             printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%lu\n",
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 7e4b485f11..a653c5d14b 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1128,12 +1128,12 @@ out:
     return res;
 }
 
-static void gicv3_hyp_disable(void)
+static void gicv3_hyp_enable(bool enable)
 {
     register_t hcr;
 
     hcr = READ_SYSREG(ICH_HCR_EL2);
-    hcr &= ~GICH_HCR_EN;
+    hcr = enable ? (hcr | GICH_HCR_EN) : (hcr & ~GICH_HCR_EN);
     WRITE_SYSREG(hcr, ICH_HCR_EL2);
     isb();
 }
@@ -1240,7 +1240,7 @@ static void gicv3_disable_interface(void)
     spin_lock(&gicv3.lock);
 
     gicv3_cpu_disable();
-    gicv3_hyp_disable();
+    gicv3_hyp_enable(false);
 
     spin_unlock(&gicv3.lock);
 }
@@ -1979,6 +1979,448 @@ static bool gic_dist_supports_lpis(void)
     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represents a block of 32 IRQs */
+struct dist_irq_block {
+    uint32_t icfgr[2];
+    uint32_t ipriorityr[8];
+    uint64_t irouter[32];
+    uint32_t isactiver;
+    uint32_t isenabler;
+};
+
+struct redist_ctx {
+    uint32_t ctlr;
+    uint32_t icfgr; /* Only PPIs stored */
+    uint32_t igroupr;
+    uint32_t ipriorityr[8];
+    uint32_t isactiver;
+    uint32_t isenabler;
+
+    uint64_t pendbase;
+    uint64_t propbase;
+};
+
+/* GICv3 registers to be saved/restored on system suspend/resume */
+struct gicv3_ctx {
+    struct dist_ctx {
+        uint32_t ctlr;
+        struct dist_irq_block *irqs;
+        struct dist_irq_block *espi_irqs;
+    } dist;
+
+    /* Have only one rdist structure for last running CPU during suspend */
+    struct redist_ctx rdist;
+
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+        uint32_t sre_el2;
+        uint32_t grpen;
+    } cpu;
+};
+
+static struct gicv3_ctx gicv3_ctx;
+
+static void __init gicv3_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv3_info.nr_lines, 32);
+
+    /* The spec allows for systems without any SPIs */
+    if ( blocks > 1 )
+    {
+        gicv3_ctx.dist.irqs = xzalloc_array(struct dist_irq_block, blocks - 1);
+        if ( !gicv3_ctx.dist.irqs )
+            panic("Failed to allocate memory for GICv3 suspend context\n");
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    if ( !gic_number_espis() )
+        return;
+
+    blocks = gic_number_espis() / 32;
+    gicv3_ctx.dist.espi_irqs = xzalloc_array(struct dist_irq_block, blocks);
+    if ( !gicv3_ctx.dist.espi_irqs )
+        panic("Failed to allocate memory for GICv3 eSPI suspend context\n");
+#endif
+}
+
+static int gicv3_disable_redist(void)
+{
+    void __iomem *waker = GICD_RDIST_BASE + GICR_WAKER;
+    s_time_t deadline;
+
+    /*
+     * Avoid infinite loop if Non-secure does not have access to GICR_WAKER.
+     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
+     *     When GICD_CTLR.DS == 0 and an access is Non-secure accesses to this
+     *     register are RAZ/WI.
+     */
+    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
+        return 0;
+
+    deadline = NOW() + MILLISECS(1000);
+
+    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, waker);
+    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) == 0 )
+    {
+        if ( NOW() > deadline )
+        {
+            printk(XENLOG_ERR "GICv3: CPU%u: Redistributor sleep timeout\n",
+                   smp_processor_id());
+            return -ETIMEDOUT;
+        }
+
+        cpu_relax();
+        udelay(10);
+    }
+
+    return 0;
+}
+
+#define GET_SPI_REG_OFFSET(name, espi) \
+    ((espi) ? GICD_##name##nE : GICD_##name)
+
+static void gicv3_store_spi_irq_block(struct dist_irq_block *irqs,
+                                      unsigned int i, unsigned int nr_block_irqs,
+                                      bool espi)
+{
+    void __iomem *base;
+    unsigned int irq, nr_priority_regs;
+
+    ASSERT(nr_block_irqs && nr_block_irqs <= 32);
+    nr_priority_regs = DIV_ROUND_UP(nr_block_irqs, 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, espi) + i * sizeof(irqs->icfgr);
+    irqs->icfgr[0] = readl_relaxed(base);
+    irqs->icfgr[1] = readl_relaxed(base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < nr_priority_regs; irq++ )
+        irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < nr_block_irqs; irq++ )
+        irqs->irouter[irq] = readq_relaxed_non_atomic(base + 8 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, espi);
+    base += i * sizeof(irqs->isactiver);
+    irqs->isactiver = readl_relaxed(base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, espi);
+    base += i * sizeof(irqs->isenabler);
+    irqs->isenabler = readl_relaxed(base);
+}
+
+static void gicv3_restore_spi_irq_config(struct dist_irq_block *irqs,
+                                         unsigned int i,
+                                         unsigned int nr_block_irqs, bool espi)
+{
+    void __iomem *base;
+    unsigned int irq, nr_priority_regs;
+
+    ASSERT(nr_block_irqs && nr_block_irqs <= 32);
+    nr_priority_regs = DIV_ROUND_UP(nr_block_irqs, 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, espi) + i * sizeof(irqs->icfgr);
+    writel_relaxed(irqs->icfgr[0], base);
+    writel_relaxed(irqs->icfgr[1], base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < nr_priority_regs; irq++ )
+        writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
+}
+
+static void gicv3_restore_spi_irq_routing(struct dist_irq_block *irqs,
+                                          unsigned int i,
+                                          unsigned int nr_block_irqs, bool espi)
+{
+    void __iomem *base;
+    unsigned int irq;
+
+    ASSERT(nr_block_irqs && nr_block_irqs <= 32);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < nr_block_irqs; irq++ )
+        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
+}
+
+static void gicv3_disable_spi_irq_block(unsigned int i, bool espi)
+{
+    void __iomem *base;
+
+    base = GICD + GET_SPI_REG_OFFSET(ICENABLER, espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+}
+
+static void gicv3_restore_spi_irq_state(struct dist_irq_block *irqs,
+                                        unsigned int i, bool espi)
+{
+    void __iomem *base;
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, espi);
+    base += i * sizeof(irqs->isenabler);
+    writel_relaxed(irqs->isenabler, base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICACTIVER, espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, espi);
+    base += i * sizeof(irqs->isactiver);
+    writel_relaxed(irqs->isactiver, base);
+}
+
+static int gicv3_check_ap1r(unsigned int n, register_t apr)
+{
+    if ( !apr )
+        return 0;
+
+    printk(XENLOG_ERR "GICv3: suspend aborted: ICC_AP1R%u_EL1=%#"
+           PRIregister"\n", n, apr);
+
+    return -EBUSY;
+}
+
+static int gicv3_check_active_priorities(uint32_t ctlr)
+{
+    unsigned int pribits = MASK_EXTR(ctlr, ICC_CTLR_EL1_PRIBITS_MASK) + 1;
+    int ret;
+
+    /*
+     * Xen enables physical Group 1 interrupts through ICC_IGRPEN1_EL1,
+     * so only the physical Group 1 active-priority registers are relevant
+     * here. Use ICC_CTLR_EL1.PRIbits for the physical CPU interface, not
+     * ICH_VTR_EL2, which describes the virtual interface. ICC_AP1R1_EL1 is
+     * only implemented with at least 6 physical priority bits, and
+     * ICC_AP1R2_EL1/ICC_AP1R3_EL1 with at least 7.
+     */
+    switch ( pribits )
+    {
+    case 8:
+    case 7:
+        ret = gicv3_check_ap1r(3, READ_SYSREG(ICC_AP1R3_EL1));
+        if ( ret )
+            return ret;
+        ret = gicv3_check_ap1r(2, READ_SYSREG(ICC_AP1R2_EL1));
+        if ( ret )
+            return ret;
+        fallthrough;
+    case 6:
+        ret = gicv3_check_ap1r(1, READ_SYSREG(ICC_AP1R1_EL1));
+        if ( ret )
+            return ret;
+        fallthrough;
+    default:
+        return gicv3_check_ap1r(0, READ_SYSREG(ICC_AP1R0_EL1));
+    }
+}
+
+static int gicv3_suspend(void)
+{
+    unsigned int i, nr_block_irqs;
+    void __iomem *base;
+    int ret;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    /* Save GICC configuration */
+    gicv3_ctx.cpu.ctlr     = (uint32_t)READ_SYSREG(ICC_CTLR_EL1);
+    gicv3_ctx.cpu.pmr      = (uint32_t)READ_SYSREG(ICC_PMR_EL1);
+    gicv3_ctx.cpu.bpr      = (uint32_t)READ_SYSREG(ICC_BPR1_EL1);
+    gicv3_ctx.cpu.sre_el2  = (uint32_t)READ_SYSREG(ICC_SRE_EL2);
+    gicv3_ctx.cpu.grpen    = (uint32_t)READ_SYSREG(ICC_IGRPEN1_EL1);
+
+    ret = gicv3_check_active_priorities(gicv3_ctx.cpu.ctlr);
+    if ( ret )
+        return ret;
+
+    gicv3_disable_interface();
+
+    ret = gicv3_disable_redist();
+    if ( ret )
+    {
+        /*
+         * Clearing ProcessorSleep before ChildrenAsleep is set is
+         * UNPREDICTABLE, so do not try to restore the CPU interface.
+         */
+        panic("GICv3: Cannot safely abort suspend after a sleep timeout\n");
+    }
+
+    /* Save GICR configuration */
+    gicv3_redist_wait_for_rwp();
+
+    base = GICD_RDIST_BASE;
+
+    rdist->ctlr = readl_relaxed(base + GICR_CTLR);
+
+    rdist->propbase = readq_relaxed(base + GICR_PROPBASER);
+    rdist->pendbase = readq_relaxed(base + GICR_PENDBASER);
+
+    base = GICD_RDIST_SGI_BASE;
+
+    /* Save priority on PPI and SGI interrupts */
+    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
+        rdist->ipriorityr[i] = readl_relaxed(base + GICR_IPRIORITYR0 + 4 * i);
+
+    rdist->isactiver = readl_relaxed(base + GICR_ISACTIVER0);
+    rdist->isenabler = readl_relaxed(base + GICR_ISENABLER0);
+    rdist->igroupr   = readl_relaxed(base + GICR_IGROUPR0);
+    rdist->icfgr     = readl_relaxed(base + GICR_ICFGR1);
+
+    /* Save GICD configuration */
+    gicv3_dist_wait_for_rwp();
+    gicv3_ctx.dist.ctlr = readl_relaxed(GICD + GICD_CTLR);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        nr_block_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, nr_block_irqs,
+                                  false);
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, 32, true);
+#endif
+
+    return 0;
+}
+
+static void gicv3_resume(void)
+{
+    int ret;
+    unsigned int i, nr_block_irqs;
+    uint32_t dist_ctlr;
+    void __iomem *base;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    dist_ctlr = gicv3_ctx.dist.ctlr & GICD_CTLR_ARE_NS;
+
+    /* Disable group forwarding while preserving affinity routing state. */
+    writel_relaxed(dist_ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    /*
+     * IHI0069H.b 12.9.9 says changing GICD_ICFGR<n>.Int_config
+     * while the interrupt is individually enabled is UNPREDICTABLE.
+     * Disable SPIs first; 4.7.1 defines GICD_ICENABLER<n>, n > 0,
+     * as the per-SPI disable mechanism.
+     */
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_disable_spi_irq_block(i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_disable_spi_irq_block(i, true);
+#endif
+
+    gicv3_dist_wait_for_rwp();
+
+    for ( i = NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i += 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        nr_block_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.irqs + i - 1, i, nr_block_irqs,
+                                     false);
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + i * 4);
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.espi_irqs + i, i, 32,
+                                     true);
+    }
+#endif
+
+    if ( dist_ctlr )
+    {
+        for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        {
+            nr_block_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.irqs + i - 1, i,
+                                          nr_block_irqs, false);
+        }
+
+#ifdef CONFIG_GICV3_ESPI
+        for ( i = 0; i < gic_number_espis() / 32; i++ )
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.espi_irqs + i, i,
+                                          32, true);
+#endif
+    }
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_restore_spi_irq_state(gicv3_ctx.dist.irqs + i - 1, i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_restore_spi_irq_state(gicv3_ctx.dist.espi_irqs + i, i, true);
+#endif
+
+    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    ret = gicv3_lpi_init_rdist(GICD_RDIST_BASE);
+    /*
+     * If LPIs are already enabled, assume firmware or the still-powered
+     * redistributor has valid PROPBASER/PENDBASER and skip reprogramming.
+     * Return -EBUSY so callers can ignore this case.
+     */
+    if ( ret && ret != -ENODEV && ret != -EBUSY )
+        panic("GICv3: Failed to re-initialize LPIs during resume\n");
+    else if ( ret == -EBUSY ) /* Extra checks, just to be sure */
+    {
+        base = GICD_RDIST_BASE;
+        if ( readq_relaxed(base + GICR_PROPBASER) != rdist->propbase ||
+             readq_relaxed(base + GICR_PENDBASER) != rdist->pendbase )
+            panic("GICv3: LPIs already enabled with unexpected PROPBASER/PENDBASER during resume\n");
+    }
+
+    /* Restore GICR (Redistributor) configuration */
+    if ( gicv3_enable_redist() )
+        panic("GICv3: Failed to re-enable redistributor during resume\n");
+
+    base = GICD_RDIST_SGI_BASE;
+
+    writel_relaxed(GENMASK(31, 0), base + GICR_ICENABLER0);
+    gicv3_redist_wait_for_rwp();
+
+    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
+        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 + i * 4);
+
+    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
+    writel_relaxed(rdist->igroupr,   base + GICR_IGROUPR0);
+    writel_relaxed(rdist->icfgr,     base + GICR_ICFGR1);
+
+    gicv3_redist_wait_for_rwp();
+
+    writel_relaxed(rdist->isenabler, base + GICR_ISENABLER0);
+    writel_relaxed(rdist->ctlr, GICD_RDIST_BASE + GICR_CTLR);
+
+    gicv3_redist_wait_for_rwp();
+
+    WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
+    isb();
+
+    /* Restore CPU interface (System registers) */
+    WRITE_SYSREG(gicv3_ctx.cpu.pmr,   ICC_PMR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.bpr,   ICC_BPR1_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.ctlr,  ICC_CTLR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
+    isb();
+
+    gicv3_hyp_init();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* Set up the GIC */
 static int __init gicv3_init(void)
 {
@@ -2053,6 +2495,10 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    gicv3_alloc_context();
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
@@ -2092,6 +2538,10 @@ static const struct gic_hw_operations gicv3_ops = {
 #endif
     .iomem_deny_access   = gicv3_iomem_deny_access,
     .do_LPI              = gicv3_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv3_suspend,
+    .resume              = gicv3_resume,
+#endif
 };
 
 static int __init gicv3_dt_preinit(struct dt_device_node *node, const void *data)
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index f6ece8f972..ae2476426c 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -16,6 +16,11 @@
 #define ICC_SRE_EL1               S3_0_C12_C12_5
 #define ICC_IGRPEN1_EL1           S3_0_C12_C12_7
 
+#define ICC_AP1R0_EL1             S3_0_C12_C9_0
+#define ICC_AP1R1_EL1             S3_0_C12_C9_1
+#define ICC_AP1R2_EL1             S3_0_C12_C9_2
+#define ICC_AP1R3_EL1             S3_0_C12_C9_3
+
 #define ICH_VSEIR_EL2             S3_4_C12_C9_4
 #define ICC_SRE_EL2               S3_4_C12_C9_5
 #define ICH_HCR_EL2               S3_4_C12_C11_0
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 2081b2fe8f..1cf3758386 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -92,12 +92,15 @@
 #define GICD_TYPE_LPIS               (1U << 17)
 
 #define GICD_CTLR_RWP                (1UL << 31)
+#define GICD_CTLR_DS                 (1U << 6)
 #define GICD_CTLR_ARE_NS             (1U << 4)
 #define GICD_CTLR_ENABLE_G1A         (1U << 1)
 #define GICD_CTLR_ENABLE_G1          (1U << 0)
 #define GICD_IROUTER_SPI_MODE_ANY    (1UL << 31)
 
 #define GICC_CTLR_EL1_EOImode_drop   (1U << 1)
+#define ICC_CTLR_EL1_PRIBITS_SHIFT   8
+#define ICC_CTLR_EL1_PRIBITS_MASK    (0x7U << ICC_CTLR_EL1_PRIBITS_SHIFT)
 
 #define GICR_WAKER_ProcessorSleep    (1U << 1)
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
-- 
2.53.0


