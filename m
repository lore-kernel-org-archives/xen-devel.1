Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C85606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=JWO7ktr0
Received: from list by lists.xenproject.org with outflank-mailman.1462581.1673619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNM-0006xD-Hz; Tue, 27 Oct 2026 21:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462581.1673619; Tue, 27 Oct 2026 21:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNM-0006vC-9r; Tue, 27 Oct 2026 21:06:32 +0000
Received: by outflank-mailman (input) for mailman id 1462581;
 Tue, 27 Oct 2026 21:06:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNK-0006ZE-MT
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNK-0005yu-36
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:30 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11225-e002-0a2a0a5209dd-0a2a4505a020-28
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:30 +0100
Received: from [40.107.130.81]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11255-4cb1-0a2a45050019-286b8251fecc-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:29 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAVPR03MB9573.eurprd03.prod.outlook.com
 (2603:10a6:102:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 21:06:28 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:28 +0000
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
 b=ART4KfMsLaOtRXPTE2jSBNnYlSja7LjHA/bfuaVSX4m9hyszDlLJxTUCn3raU53sgwezHEcncxHk9urmAspR4Jmm6bSVJxJ4VmTG6f3qLQayZ08YdDRPfyiYAB0eKf+9g1AFD7IM882YX6g8wxqg4vtlUgeDMU2Hduhimp5vUCfC2oq6x/Ew6BcBeS7Vc7VyyLiJXAAPY3Rl6CjftU3kzzSY5Z611QaYLDpj+3EB39moidiKwSw/gTNvHXKUu0WHgBGkmkR1kNyYLc2W3UyEfJNeeHOWOriOUQ7eYNbDQrwH73FUInogliqWBXUmM/AgDCAoZNXTgvg1KZ1My5sbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNFRi8E/OouwXg5Rg4YSbngcg1S9nFeb9I2j8RLHvag=;
 b=cvitjFRcTu7BYYPHXSr/ibYAzjhrSmWQosUWW3bXytoz101Gq+C4MioHDwisUHwvVj2/BLux2YJ6UkWGvZecGuicQN93h5D+zv8+7N/hO127PAPma9FWiQa7vo/MHadQZhDoHGZoE852deJCqscT8gy0kbR99UO9Sd2D1affvizANdgj7WFf65Y8+0eYf51Fs4gwIrpbwWa1ew9hYY7POASMeHvHFbRAkXBZ1bDk990izRq+/bkYEy5lYUhXTp/ZChftDpNvLfqiDUHiwH5wpPODvytfFQm/kOi6S2xHv5eZJCiR+IToljVF+IdxLNsS1gSLbJNG3kDMFTODQNbV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNFRi8E/OouwXg5Rg4YSbngcg1S9nFeb9I2j8RLHvag=;
 b=JWO7ktr08nfKW6h5a+3N4jxsI94R89hCLd8xNgj9VX/27MzoCIe3YWRO+4duZGuKhmTd98FNIfT0ZP1xgfTGtZgRFnT7vTOyZC8DtiKEMls4XUxIsU8ESUM07bJZLdhdrk94VFfc7C20fcyr8GDd628+XawNfqymMRh+7SdMfKB1klfIfXhNT1G9QeuUsrwvJBz+mVZf49Xmef3TYwZfLEqibkIu9enMdbRWz0bHlmyh6ys9tO0eWRAxW31+2gUaA/e1+y8+ygue2/uBoLSoRjCCHiZl8aV2Ys+cCeRIHoJjTLSleaNPIy7LSKefviwBVBlwMy3XwvJqkE7GETVQhQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: [PATCH v13 10/14] xen/arm: smmu-v3: add suspend/resume handlers
Date: Tue, 27 Oct 2026 23:05:59 +0200
Message-ID: <6b6566eae874fcc3a92a0730f0d0e5b84f7745a1.1793129971.git.mykola_kvach@epam.com>
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
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAVPR03MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 582a36bc-8042-4e5f-f8d6-08df346e2b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261026121527099003|261022075727099003|11063799006|56012099006|261009223027099003|261021135927099003|261021123027099003|261021121427099003|261022105027099003|22082099003|18002099003|6133799003|10067099003|3023799007|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	pyopd39vxYoufvudCpOvhQD+mumDzh/3d7NV9oPbmJNA7HaSzSUMIlmHTz4lPCA2s9tJT1sFhapY0VSuUx4bIcdeLkzq5YJ7H3BKXcisdfF7e6nZj7kEXYGNn3jQXkfc8ZWL8/6wMxrwsFLykVtGyqgjVHkfYSl0Ck85FV0jVLf7cUXONXvUigknfz1k4Wc+buDLppF3J5r0NdhRn4Fb0lozpKZMH3vN1pUDY8Emnmz3jeSfL1XCC6+eIezWwLwgK08TzHzVtXIgSxz7Ob1PHxL+vctOIiX7Lig1U54sCcNAqDUcSesqBA8KFTNsfa1woZyyWWJQziCEgvIumFkI+upx/CXdqQJ5+C358o/rlStrxLoNmHEUWVg74O/4JPBMpIHBgSaqYx9u/rAfOzfh1TvjoXlnTeXRxmWBvdnOe/gyimk6vyvqqa/Mz/umq0PG7dflUgXGbzV7KPELaSlQGGBQiKHi3biY9lxR4Z18jJ8NFnw6S9JANAAJkOOIX2GI2TgSH9eWj6OEWI6saDB7Qiyl5mtiNQU59eNhXu/D0jlKRSUm8q5/8dVHAPV0OXegbZjruGHrVsC+hl8J2hVyo1IP6xCukqhEs79g0zqLaFQw+p/3gJSUqbTIfGRR59Na
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261026121527099003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022105027099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YIOFf2SyBdOe1jyDJHv2uo8uBrA8JVvNZaKUla2gU1LHaFml6oj9p/83Ee+F?=
 =?us-ascii?Q?qAM9Cx3FfontizfkwGwQ4lm117opWxsRMiASbR7jgELO3Hb2qdUW3xWP5Erv?=
 =?us-ascii?Q?q89pORs0zyyFmPOfJpuYR8Ymdoin23Ut114FmYiYTZQxGNWfKv9vpEXDkDZS?=
 =?us-ascii?Q?WdWtIWQhsEMB6UBJ+ZKiv+Bw+piw4uSbiVZXSZ9e1wtrBIa5+OCuHZjTEQpu?=
 =?us-ascii?Q?EJKOVzeP3/dcRVPD5Ly44IHJ0fSJYVv/MdRoP11vCOUwK8n5Wk4CjF61t+X4?=
 =?us-ascii?Q?Ri/EPAhI5LlTNvyjlSsNblLxdvcDnkDCHwoFfRjcIBGDbo8UrF7Mfy4kfc8G?=
 =?us-ascii?Q?4FCXnwEpKHcDvWtwVcglDwkyuvMGehswTNDoSJ4IPuZmePeWmPvCW5LpYgHd?=
 =?us-ascii?Q?oi1bJzM2zSeFws/6Ol4lpldr6R/wgDAph0uMoc7AolcaLkOjDj58p2HLWGZC?=
 =?us-ascii?Q?8VES0N2WY/fvtwmmK+oUSv05YCucTHBytMEaBglWx40opGeR/4o/GFgM1sps?=
 =?us-ascii?Q?lq/dQl14WJLi+eFOxYfKB3pvCd10JKKDKNWU3qmBKQeXUbwwJVI5OW6Kz1nm?=
 =?us-ascii?Q?1lgc4yO3nC2TyG6RpKGowN66rONhP4tK/9niuFyC4R6DUsIVOoPQXZY6dli8?=
 =?us-ascii?Q?2KPwZjMA85JmTVw6fv3OVPuEiscjSGNpIBDSJbhiF7lDKiqS0Hm4f7QN2BMt?=
 =?us-ascii?Q?1wSreXBRY/ENbXyHFQPvrGsdXd0zWQYjecZnI4kSaESP0urCKtic0KZIZAw1?=
 =?us-ascii?Q?bIicH/In6QFpP3aQ1IaaSNGZavLwmd/y4xrJp8Gmo2whgdjEOh1EYIiD/dQI?=
 =?us-ascii?Q?HApiqEW9BJHayVD8Fd32CAm5c+DPwcF7HIYjhoxx6aMLNvZKUIl3k6Fv9Q8G?=
 =?us-ascii?Q?xfSHbERpbTNvWh0xgmNCsle4lAILHMyZ37d3MVmWnCAevUcxyBjT4Xq+SVKb?=
 =?us-ascii?Q?xQJ0fR+pYQrbDaye2In31FqNSN5y0hPENInsJseF3xp8j2RkYO3CjPyzQZ0b?=
 =?us-ascii?Q?gkAjlQzbuy0a1e16zOxSB5ij3TBxcuYSYJf4HgqYbBvOnjvk9V6NZXV13rgr?=
 =?us-ascii?Q?Q+QxT4axIYi6RKvNaXHjF51965B220FemKxyw8N7q5gleYcKqEwUHTeq+Z7w?=
 =?us-ascii?Q?1soTK6ZZ3yo6IGDNI+oZn2I/SoXyUH4CDH4nzKXG08eA8hudbHTdHxjwvmA4?=
 =?us-ascii?Q?X3X2HLdIQ/i9w2A5PzE8+T/ofsqjbcCEXcuaUmJjsFjpFBBTTwsOkqF9Tfzm?=
 =?us-ascii?Q?mvNTuYExMpsNTNd8SV0f6Q7S4gIVLd31VN+Cmu2P7GLxHWt6+1FtBNHswVJH?=
 =?us-ascii?Q?/nG5tG2vAGGM9oiCfxD/sAKF+HrFElGcPG5Ud5ijSTmdKrkZSPGK8i2Mj1Ws?=
 =?us-ascii?Q?vXPgtVqUjRamcRdDLjxeOxGblC8tEtE2dz6lUhvdLemxDe4zKP9dfKXOrBDQ?=
 =?us-ascii?Q?JF70XNpwAItq3nlwnGjaecJ/y5iMlfIj3CZ/wGGCgxgl9IYMzE5mOm7ThfJ/?=
 =?us-ascii?Q?JV31rhwAyRxrXKRZqi4woo1+v83njCn4okEySY7Z8lq2q3saVx4T1P7UMtQ/?=
 =?us-ascii?Q?2eYuigwqD30Mzjb9m+8/nOsKnEYi3IxcY0HP12fYXroqBu3CuTJTfhHG5bzK?=
 =?us-ascii?Q?/+5dV56Tt/1iF4yOppOs8dEhdEf+DtpyXG1HHW/9ks/X9lm2beFHvqsKFBcr?=
 =?us-ascii?Q?uYK/meVIS9KiNuKk9iArCdT4gDZbX29AqDjmCCPzPxsi11A9SY8wcn4oIcWP?=
 =?us-ascii?Q?KFBNDZb6mQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582a36bc-8042-4e5f-f8d6-08df346e2b00
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:28.3607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPl/53uRyjKo+Ys32yKHwWtNo4XfEztfKvswRyAnXs/bk3EMhEsgSJ1tyfRatLlyRUhPYjEHtrkLw5yEjCVMWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9573
X-purgate-ID: tlsNG-c201ff/1793135190-724B42A1-E903F8A9/0/0
X-purgate-type: clean
X-purgate-size: 20792
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add system suspend/resume callbacks for the Arm SMMUv3 driver.

During suspend, set GBPA.ABORT and disable the translation interface and
EVTQ/PRIQ, while keeping CMDQ enabled. Save the queue producer indices after
the disable acknowledgements, then issue CMD_SYNC to wait for all earlier
commands to complete. Disable interrupt generation before stopping CMDQ,
and handle any remaining global errors before the SMMU loses power.

If the initial GBPA update fails, leave that SMMU enabled and restore only
the previously suspended devices. For later failures, restore the current
SMMU as well. Before each rollback reset, wait for EVTQ/PRIQ to stop and
save their producer indices. This also covers a CR0ACK timeout before the
normal suspend path has saved the indices. Failure to stop the queues or
to reset during rollback is fatal, since the host suspend error path
allows domains to run again. Check GBPA and CMD_SYNC errors in reset so
an incomplete restore is not reported as successful.

Resume uses arm_smmu_device_reset() to restore the SMMU registers and queue
indices, invalidate cached configuration and translations, and enable the
SMMU. Schedule tasklets for unread queue entries: enabling interrupts does
not report events that were recorded before the interrupt source was
enabled. Prevent pending GERROR interrupts from accessing CMDQ while it is
reset.

Probe also changes with CONFIG_SYSTEM_SUSPEND disabled. Request IRQ
handlers only after the queues and tasklets are ready. If reset fails
during probe, call arm_smmu_device_disable() before freeing resources,
since queues may already be enabled. Panic if disabling fails: the SMMU
may still access the queue memory. The GERROR guard is also compiled in,
but is cleared before handlers are registered and stays clear after probe.
Reset now returns GBPA and CMD_SYNC errors in these builds too.

Clear MSI target addresses on both probe and resume, also without
CONFIG_MSI. Arm IHI0070G.b, sections 6.3.21 and 6.3.30, specify that these
addresses reset to UNKNOWN and that zero disables MSIs while allowing
wired IRQs. The corresponding IRQ_CTRL and IRQ_CTRLACK enable bits must
both be clear before writing these registers. Disable interrupt generation
and wait for IRQ_CTRLACK, as described in section 6.3.16, before clearing
the addresses.

Xen currently does not support SMMUv3 MSI interrupts or PCI ATS/PRI. Active
MSI configuration restore and ATS/PRI endpoint suspend handling remain
outside this patch.

Link: https://lore.kernel.org/r/20260929034510.2023173-1-praan@google.com/
Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
Assisted-by: Codex:GPT-6
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V13:
- Rename __init_or_smmu_suspend to init_or_smmu_suspend to avoid a reserved
  macro name (MISRA Rule 21.1). No functional change.
- Check arm_smmu_device_disable() after a probe reset failure (MISRA Rule
  17.7). Panic if disabling fails, before freeing queue memory.
- Adapt the relevant fixes from v11 of the Linux SMMUv3 suspend series.
- Request IRQs after the queues and tasklets are ready, only during probe.
- Disable the SMMU on probe-time reset failure before freeing resources.
- Check GBPA and CMD_SYNC errors in reset, and make a failed rollback reset
  fatal before the host suspend error path can resume domain execution.
- Leave the current SMMU enabled if the initial GBPA update fails; restore
  only the previously suspended devices.
- Clear MSI target addresses on probe and resume, also when using wired
  IRQs, and document the register requirements from IHI0070G.b.
- Save EVTQ/PRIQ producer indices after confirming that the queues have
  stopped, both during suspend and before rollback reset. Cover a CR0ACK
  timeout before the normal snapshot. Schedule tasklets after reset to
  process unread entries without waiting for a new interrupt.
- Keep GERROR handling available until interrupt generation is disabled,
  then gate its IRQ handler before stopping CMDQ. Handle remaining global
  errors before power-off and allow the handler again once CMDQ is restored.
- Drop Luca's Reviewed-by tag because the patch has changed.

Changes in V11:
- Keep arm_smmu_update_gbpa() and arm_smmu_device_reset() in init text when
  CONFIG_SYSTEM_SUSPEND is disabled.

Changes in V10:
- Disable SMMU interrupt generation during suspend before disabling the
  SMMU interface, matching the resume/reset path which re-enables IRQ_CTRL.

Changes in V9:
- Use CMD_SYNC in suspend instead of polling CMDQ_CONS, so the suspend
  path waits for command completion rather than only command consumption.
- Document that arm_smmu_setup_irqs() is probe-only and that future Xen
  SMMUv3 MSI support will need to restore SMMU IRQ_CFGn registers on
  resume.
- Restore the reference to Pranjal's Linux runtime/system sleep series and
  clarify that MSI/ATS/PRI resume handling is outside the supported Xen
  path.
- Prefix the subject with xen/arm for consistency with the rest of the
  Arm suspend/resume series.

Changes in V8:
- Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matching
  the existing runtime CMD_SYNC path.
- Fold the suspend rollback reset path into a helper and rename the error
  reporting to describe suspend rollback rather than resume.
- Treat SMMU reset failure during resume as fatal instead of logging and
  continuing with a potentially unusable IOMMU.
- cosmetic changes
---
 xen/drivers/passthrough/arm/smmu-v3.c | 308 +++++++++++++++++++++-----
 xen/drivers/passthrough/arm/smmu-v3.h |   1 +
 2 files changed, 258 insertions(+), 51 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227db..58530ef2d1 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -94,6 +94,12 @@
 
 #include "smmu-v3.h"
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+#define init_or_smmu_suspend
+#else
+#define init_or_smmu_suspend __init
+#endif
+
 #define ARM_SMMU_VTCR_SH_IS		3
 #define ARM_SMMU_VTCR_RGN_WBWA		1
 #define ARM_SMMU_VTCR_TG0_4K		0
@@ -903,10 +909,10 @@ static void arm_smmu_priq_tasklet(void *dev)
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
 
-static void arm_smmu_gerror_handler(int irq, void *dev)
+/* The caller must serialize with the IRQ handler. */
+static void arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
 {
 	u32 gerror, gerrorn, active;
-	struct arm_smmu_device *smmu = dev;
 
 	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
 	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
@@ -948,6 +954,14 @@ static void arm_smmu_gerror_handler(int irq, void *dev)
 	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
 }
 
+static void arm_smmu_gerror_handler(int irq, void *dev)
+{
+	struct arm_smmu_device *smmu = dev;
+
+	if (!read_atomic(&smmu->gerror_blocked))
+		arm_smmu_handle_gerror(smmu);
+}
+
 static void arm_smmu_combined_irq_handler(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
@@ -1814,8 +1828,8 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
 }
 
 /* GBPA is "special" */
-static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
-                                       u32 set, u32 clr)
+static int init_or_smmu_suspend
+arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
 {
 	int ret;
 	u32 reg, __iomem *gbpa = smmu->base + ARM_SMMU_GBPA;
@@ -1836,6 +1850,20 @@ static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
 	return ret;
 }
 
+static void arm_smmu_clear_msi_cfg(struct arm_smmu_device *smmu)
+{
+	/*
+	 * IHI0070G.b, sections 6.3.21 and 6.3.30: ADDR resets to UNKNOWN.
+	 * ADDR == 0 disables MSIs while allowing wired IRQs. The corresponding
+	 * IRQ_CTRL and IRQ_CTRLACK enable bits must be clear before writing.
+	 */
+	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
+	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
+}
+
 #ifdef CONFIG_MSI
 static void arm_smmu_free_msis(void *data)
 {
@@ -1864,13 +1892,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
 	struct device *dev = smmu->dev;
 
-	/* Clear the MSI address regs */
-	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
-	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
-
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
-	else
+	if (!(smmu->features & ARM_SMMU_FEAT_PRI))
 		nvec--;
 
 	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
@@ -1911,7 +1933,8 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { }
 #endif /* CONFIG_MSI */
 
-static void __init arm_smmu_free_irqs(struct arm_smmu_device *smmu)
+static void init_or_smmu_suspend
+arm_smmu_free_irqs(struct arm_smmu_device *smmu)
 {
 	int irq;
 
@@ -1995,19 +2018,38 @@ err_free_evtq_irq:
 	return ret;
 }
 
-static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
+static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
 {
-	int ret, irq;
+	int ret;
 	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
 
-	/* Disable IRQs first */
-	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
-				      ARM_SMMU_IRQ_CTRLACK);
-	if (ret) {
-		dev_err(smmu->dev, "failed to disable irqs\n");
+	if ( smmu->features & ARM_SMMU_FEAT_PRI )
+		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
+
+	/* Enable interrupt generation on the SMMU */
+	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
+				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
+	if ( ret )
+	{
+		dev_warn(smmu->dev, "failed to enable irqs\n");
 		return ret;
 	}
 
+	return 0;
+}
+
+static int arm_smmu_disable_irqs(struct arm_smmu_device *smmu)
+{
+	return arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
+				       ARM_SMMU_IRQ_CTRLACK);
+}
+
+/* Probe-time only; reset has configured the queues and disabled IRQs. */
+static int init_or_smmu_suspend
+arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
+{
+	int ret, irq;
+
 	irq = smmu->combined_irq;
 	if (irq) {
 		/*
@@ -2028,22 +2070,7 @@ static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 		}
 	}
 
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
-
-	/* Enable interrupt generation on the SMMU */
-	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
-				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
-	if (ret) {
-		dev_warn(smmu->dev, "failed to enable irqs\n");
-		goto err_free_irqs;
-	}
-
 	return 0;
-
-err_free_irqs:
-	arm_smmu_free_irqs(smmu);
-	return ret;
 }
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
@@ -2057,18 +2084,31 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
+static int init_or_smmu_suspend
+arm_smmu_device_reset(struct arm_smmu_device *smmu, bool resume)
 {
 	int ret;
 	u32 reg, enables;
 	struct arm_smmu_cmdq_ent cmd;
 
+	ret = arm_smmu_disable_irqs(smmu);
+	if (ret) {
+		dev_err(smmu->dev, "failed to disable irqs\n");
+		return ret;
+	}
+
+	/* A pending GERROR IRQ must not access CMDQ while it is reset. */
+	write_atomic(&smmu->gerror_blocked, true);
+	arm_smmu_clear_msi_cfg(smmu);
+
 	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
 	if (reg & CR0_SMMUEN) {
 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
 		WARN_ON(!disable_bypass);
-		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+		ret = arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+		if (ret)
+			return ret;
 	}
 
 	ret = arm_smmu_device_disable(smmu);
@@ -2107,10 +2147,15 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 	}
 
+	/* GERROR handling can use CMDQ again once its registers are restored. */
+	write_atomic(&smmu->gerror_blocked, false);
+
 	/* Invalidate any cached configuration */
 	cmd.opcode = CMDQ_OP_CFGI_ALL;
 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
-	arm_smmu_cmdq_issue_sync(smmu);
+	ret = arm_smmu_cmdq_issue_sync(smmu);
+	if (ret)
+		return ret;
 
 	/* Invalidate any stale TLB entries */
 	if (smmu->features & ARM_SMMU_FEAT_HYP) {
@@ -2120,7 +2165,9 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 
 	cmd.opcode = CMDQ_OP_TLBI_NSNH_ALL;
 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
-	arm_smmu_cmdq_issue_sync(smmu);
+	ret = arm_smmu_cmdq_issue_sync(smmu);
+	if (ret)
+		return ret;
 
 	/* Event queue */
 	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
@@ -2163,17 +2210,18 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	ret = arm_smmu_setup_irqs(smmu);
-	if (ret) {
-		dev_err(smmu->dev, "failed to setup irqs\n");
-		return ret;
+	/* Register handlers only after their queues and tasklets are ready. */
+	if (!resume) {
+		ret = arm_smmu_setup_irqs(smmu);
+		if (ret) {
+			dev_err(smmu->dev, "failed to setup irqs\n");
+			return ret;
+		}
 	}
 
-	/* Initialize tasklets for threaded IRQs*/
-	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
-	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
-	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
-				 smmu);
+	ret = arm_smmu_enable_irqs(smmu);
+	if (ret)
+		goto err_free_irqs;
 
 	/* Enable the SMMU interface, or ensure bypass */
 	if (disable_bypass) {
@@ -2190,10 +2238,18 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		goto err_free_irqs;
 	}
 
+	/* IHI0070G.b, section 6.3.16: re-enabling IRQs does not replay events. */
+	if (resume && !queue_empty(&smmu->evtq.q.llq))
+		tasklet_schedule(&smmu->evtq_irq_tasklet);
+	if (resume && (smmu->features & ARM_SMMU_FEAT_PRI) &&
+	    !queue_empty(&smmu->priq.q.llq))
+		tasklet_schedule(&smmu->priq_irq_tasklet);
+
 	return 0;
 
 err_free_irqs:
-	arm_smmu_free_irqs(smmu);
+	if (!resume)
+		arm_smmu_free_irqs(smmu);
 	return ret;
 }
 
@@ -2558,10 +2614,21 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_free;
 
+	/* Initialize tasklets for threaded IRQs*/
+	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
+	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
+	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
+				smmu);
+
 	/* Reset the device */
-	ret = arm_smmu_device_reset(smmu);
-	if (ret)
+	ret = arm_smmu_device_reset(smmu, false);
+	if (ret) {
+		/* Reset may have enabled queues before failing. */
+		if (arm_smmu_device_disable(smmu))
+			panic("SMMUv3: %s: Failed to disable during probe cleanup\n",
+			      dev_name(smmu->dev));
 		goto out_free;
+	}
 
 	/*
 	 * Keep a list of all probed devices. This will be used to query
@@ -2575,7 +2642,6 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
 
 	return 0;
 
-
 out_free:
 	arm_smmu_free_structures(smmu);
 	if (smmu->page1)
@@ -2855,6 +2921,142 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static void arm_smmu_save_queue_producers(struct arm_smmu_device *smmu)
+{
+	/*
+	 * IHI0070G.b, sections 6.3.9.4 and 6.3.9.5: EVTQ/PRIQ disable
+	 * acknowledgements make committed entries visible. The caller must
+	 * wait for these acknowledgements before reading the producer indices.
+	 */
+	if (queue_sync_prod_in(&smmu->evtq.q) == -EOVERFLOW)
+		dev_warn(smmu->dev, "EVTQ overflow detected during suspend\n");
+	if ((smmu->features & ARM_SMMU_FEAT_PRI) &&
+	    queue_sync_prod_in(&smmu->priq.q) == -EOVERFLOW)
+		dev_warn(smmu->dev, "PRIQ overflow detected during suspend\n");
+}
+
+static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device *smmu)
+{
+	int ret;
+	u32 reg;
+
+	/*
+	 * The queues have been requested to stop, but a CR0ACK timeout may
+	 * have skipped saving their producer indices. Wait for the queue
+	 * disable acknowledgements before reset overwrites those indices.
+	 */
+	ret = readl_relaxed_poll_timeout(smmu->base + ARM_SMMU_CR0ACK, reg,
+					 !(reg & (CR0_EVTQEN | CR0_PRIQEN)),
+					 1, ARM_SMMU_POLL_TIMEOUT_US);
+	if (ret)
+		panic("SMMUv3: %s: Queue stop timed out during rollback: %d\n",
+		      dev_name(smmu->dev), ret);
+
+	arm_smmu_save_queue_producers(smmu);
+	ret = arm_smmu_device_reset(smmu, true);
+
+	/* The host suspend error path allows domains to run again. */
+	if ( ret )
+		panic("SMMUv3: %s: Failed to reset during suspend rollback: %d\n",
+		      dev_name(smmu->dev), ret);
+}
+
+static int arm_smmu_suspend(void)
+{
+	struct arm_smmu_device *smmu;
+	int ret = 0;
+
+	list_for_each_entry(smmu, &arm_smmu_devices, devices)
+	{
+		/* Abort all transactions before disable to avoid spurious bypass */
+		ret = arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+		if ( ret )
+			goto rollback_previous;
+
+		/* Disable the SMMU via CR0.EN and all queues except CMDQ */
+		ret = arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
+					ARM_SMMU_CR0ACK);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out while disabling smmu\n");
+			goto fail;
+		}
+
+		arm_smmu_save_queue_producers(smmu);
+
+		/*
+		 * At this point the translation interface is disabled and the
+		 * SMMU won't access translation/config structures, even
+		 * speculatively, as per the IHI0070 spec (section 6.3.9.6).
+		 * CMDQ is still enabled so that a CMD_SYNC can complete any
+		 * previously issued commands.
+		 */
+
+		/* Ensure all previously issued commands have completed. */
+		ret = arm_smmu_cmdq_issue_sync(smmu);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out waiting for pending commands\n");
+			goto fail;
+		}
+
+		/* Stop IRQ generation before gating the handler and disabling CMDQ. */
+		ret = arm_smmu_disable_irqs(smmu);
+		if (ret) {
+			dev_err(smmu->dev, "Timed-out while disabling SMMU irqs\n");
+			goto fail;
+		}
+		write_atomic(&smmu->gerror_blocked, true);
+
+		/* Disable everything */
+		ret = arm_smmu_device_disable(smmu);
+		if ( ret )
+			goto fail;
+
+		/* Other CPUs are offline and the IRQ handler is gated above. */
+		arm_smmu_handle_gerror(smmu);
+
+		dev_dbg(smmu->dev, "Suspended smmu\n");
+	}
+
+	return 0;
+
+ fail:
+	/* Reset the device that failed as well as any already-suspended ones. */
+	arm_smmu_reset_for_suspend_rollback(smmu);
+
+ rollback_previous:
+	/* An initial GBPA failure leaves this SMMU enabled: do not reset it. */
+	list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices)
+		arm_smmu_reset_for_suspend_rollback(smmu);
+
+	return ret;
+}
+
+static void arm_smmu_resume(void)
+{
+	int ret;
+	struct arm_smmu_device *smmu;
+
+	list_for_each_entry(smmu, &arm_smmu_devices, devices)
+	{
+		dev_dbg(smmu->dev, "Resuming device\n");
+
+		/*
+		 * The reset will re-initialize all the base addresses, queues,
+		 * prod and cons maintained within struct arm_smmu_device as well as
+		 * re-enable the interrupts.
+		 */
+		ret = arm_smmu_device_reset(smmu, true);
+		if ( ret )
+			panic("SMMUv3: %s: Failed to reset during resume: %d\n",
+			      dev_name(smmu->dev), ret);
+	}
+}
+#endif
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
 	.page_sizes		= PAGE_SIZE_4K,
 	.init			= arm_smmu_iommu_xen_domain_init,
@@ -2867,6 +3069,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
 	.unmap_page		= arm_iommu_unmap_page,
 	.dt_xlate		= arm_smmu_dt_xlate,
 	.add_device		= arm_smmu_add_device,
+#ifdef CONFIG_SYSTEM_SUSPEND
+	.suspend		= arm_smmu_suspend,
+	.resume			= arm_smmu_resume,
+#endif
 };
 
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
index ab07366294..93986886f2 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -613,6 +613,7 @@ struct arm_smmu_device {
 	int				combined_irq;
 	u32				sync_nr;
 	u8				prev_cmd_opcode;
+	bool				gerror_blocked;
 
 	unsigned long			ias; /* IPA */
 	unsigned long			oas; /* PA */
-- 
2.53.0


