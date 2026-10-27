Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F13F606A324
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=LUU8DXxa
Received: from list by lists.xenproject.org with outflank-mailman.1462573.1673551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNB-0005AQ-Gy; Tue, 27 Oct 2026 21:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462573.1673551; Tue, 27 Oct 2026 21:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNB-0005AI-DJ; Tue, 27 Oct 2026 21:06:21 +0000
Received: by outflank-mailman (input) for mailman id 1462573;
 Tue, 27 Oct 2026 21:06:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNA-0004nr-8J
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoN9-007tzZ-L9
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:19 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11240-2eae-0a2a0a5409dd-0a2a450c8962-12
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:19 +0100
Received: from [40.107.162.98]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae1124b-f479-0a2a450c0019-286ba262326c-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:19 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by VI2PR03MB10907.eurprd03.prod.outlook.com
 (2603:10a6:800:270::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 21:06:17 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:17 +0000
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
 b=sw2KQw7ba1lHVghHJDx2WtJad0I+FH/7Wp7Q9KroUfTatcsDDBfL3A7hiAHfztGhwOd05CHQSxmywVTSs1akTpSKqX4Pp973g75H3FxmTW7R5PErkkIP/Ypp0MFeyhQ9jqdrhqWXAEpwAYDUc8SrPsLfbcPYebbZtLL680U5lKd7C3imRtV8vYO8XvzbhbvhvG4oCvsA4MIBSMmM9iHobR3W0DY+vJh/ufWUXj1MtPtep5wSQQimP+6acQ04LZ3aJNpo4BLjcQZOHCJLws1ta/MWTJI6w3ROy9BotZJp81gwdwH1+vN4//dKRf4JtwGltrWKbZKUZEnxRmkX0ygMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsJSjRIECtXvMDO50Vke4Bgv0nquvP569kSMyvgY9uc=;
 b=RGOQPjm24PScUxRb+6SgeVJWqBkPMsYiRhNOCs1wxD2QEwtZCNY9loNzQpqtEndNANzbTVAgO4GQpuScIvncN4kv2htssP5Lj5Drut9yydXY2AjPTU6TfA2zki3MkmcYgj65LNcYAkTVu6UlVIrlh/MOFFVQUUxrzSnbp92IT0qBT06KzdnsfSxhFaa04/ECW0Z7GlP8Ym/2hfH+brbR0thr6Ak20wOpXPJvLT4+W+gp7Fkfaa8pNy/LVD+oA39ISwlJ2EXvkWsvEPi2mQBO80v4+Xgm1Ti+/ZLImh1noUt2uzULV1l80Fi1wMVmhmClCcuNCwgdUI6GAEfMC48n6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsJSjRIECtXvMDO50Vke4Bgv0nquvP569kSMyvgY9uc=;
 b=LUU8DXxa3FVa82NkefVNCCS5N8/yxcawZuqQoh8LzRC6gEWS/EgNdDxBvouSPQMJ/iV+KH8FhpxUKumc86zTMFhKtGGJarDhw5Z5hzzZri0852gvD5EhSurMWDpw6DVjoKKysk2t+QQ7+tI3vrB3qhHB08EEcHFxVOBsPAXw+eylx/Ek3rTz0X+MPb8+QYtIAdD2ibnQzPFqzrTq7+15Te+KCuzD/GT+eUflFdbIxbMvDr3or68gh4x6qvHw8LsBQEMaz3JOV8gfqSBxIhxMWpeEP9gONXCF3OhEZDlW0CSSYTFf+9drKxjCNhgqcMJYp/6PaufvWDRJTXFz8dTERQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v13 02/14] xen/arm: gic-v2: Implement GIC suspend/resume functions
Date: Tue, 27 Oct 2026 23:05:51 +0200
Message-ID: <5c1fdca65fcd1862fe7b7ae314c33832ced6c01b.1793129971.git.mykola_kvach@epam.com>
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
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|VI2PR03MB10907:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f9b912-da1a-4e87-622e-08df346e24bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261021135927099003|261022075727099003|10067099003|56012099006|261026121527099003|6133799003|22082099003|20046099003|18002099003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	E+WOl6iEnF0/VMNGox8I2lRKyaafLrBvmWMmCV5EEq12REgbrjoyzFrLOt50g56b/5BeIr/u+k1YAaEXTKvOYiucsOke8FpDdEs2pLs3t8WxxSMJKesITCeO8m0wTtZeggJzxzTHaX3pA4yMP1AZKoV4u3qY7hUlDM/FMrfAfZPIMfkGftBXZChBNfamJqIm3WcNcBBIiwZpZiH8j6qubgE5KEFkxAtUe7/wH7wnOIrPy4F3Fq8p8mwXsCkCdclbboH5YO6vgOJ+Eu7cIqU9xIxRVeHzhW5sD5Gpxqk28mCX8cznZOgbKNManQ9Qa+hKiPyyyy1leA7J3LEIaJAZTI8YDZ+7E+dfNqkcJoAWQB3JiXuBNc4sBT3Xx/LcmgLOkIvzh5Q7BdDZ5bv96P6GoRCSwXDt5QPco0u1uhN7INsZSFsSpi1O4/Yc//QK2aaJ2LClvBjU99sZhHhsxJjbyD6VC/++wiv1R/KexKg9SQXo9vuYkPDegnNiih4wrSigbzD22489QkJplytgw8pFW0yiOhB2VGa3UXlkr7ic86ZcxAI2HETR2clguZredO9fLTg0BhGf3veuXVyUXmWleQWkAg0JTUxXc3AZwfNVwmd56kirNky3FMVguTKMSQfFExvHMLscBiqpsHnE5eVWZQFPATl2Uh/w6pX/S1JHSDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261022075727099003)(10067099003)(56012099006)(261026121527099003)(6133799003)(22082099003)(20046099003)(18002099003)(11063799006)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xD79HIGYHjZpvpJXCABeyQQJ3p+QqYcqb5WpECwPhv2N7f1zPDWgZY7oEahy?=
 =?us-ascii?Q?ZojncOTUWoHxUAv2rwZPmeCxkMjmlhIfN/gjyb90o6hAb0nYnWUbQ+wNBdRZ?=
 =?us-ascii?Q?aGudozXX6A0e25rYnEK0mVZAL5VgS55x1HinVzrbeP9Qy509conefZnbPWp7?=
 =?us-ascii?Q?fGNnzVOdb3kWJk+7tltPS1HXozeGaIFZs8dAJARwWq7I0QNuerp6gkmgpArO?=
 =?us-ascii?Q?v76QcLEzjN4s/RwFdy46pCQW2ORvZ+9P0C3Vt1+lclXaa1KPrDae5yiMI+qP?=
 =?us-ascii?Q?Ds1cdtx4e08r1Rl9b86XBa2lTxcz6w+KJvt5cYd5pMwcOTeCRWo1UjVSGgEk?=
 =?us-ascii?Q?G+Lzyz8OZh1B5rqj56bYiVSW8x5XhYbEYwLI6RUrQvJXv0cT+e5C+f2FmUXt?=
 =?us-ascii?Q?hrnDOLPvtBw59gX4YN9IoWJp5kAzKRKIBdZeac0oRnJzV1SBFHPFK9y33d4q?=
 =?us-ascii?Q?+SwcHpGQvOUc8ICKcT5mga0Ica8RBmGTh0NEOyn078NSWA86uHsM/6MhVsWC?=
 =?us-ascii?Q?Qbn+n9WoEwtNCVM5pnGO7wbyWmncl5YxP3CadVNCag5pz7xk5wndgzm9uuOH?=
 =?us-ascii?Q?Sy4eP3scNxiycy7CvHwt9woYEHBxu1nLXMX9OkRK9RQ6wP8xGOZWdDhnU/2l?=
 =?us-ascii?Q?Z4UAj3PDD9o+bBytBeCMQZM5miJMVYB2sVBSDEpzHEy3L+9m/fFYz0UtsbUl?=
 =?us-ascii?Q?Ow8A6Z4OVh/28+omnYTIGyYkKXj5oPLygE1GOULIb62pGTNWTWHPslrOAV5c?=
 =?us-ascii?Q?+w3jOOJnACF4xs1vS0ZDd7AN+FSI2esqDNIxw/sY8Q4tlH9V3sg27SH1WoQX?=
 =?us-ascii?Q?needmvtaCKvhiZpuvuc0KLWCsftIEdIDMLE/Sv8hLrhZ0VvvLvuUghjmdzGA?=
 =?us-ascii?Q?R3WJ5Yj/+xESbHo1Sz07mUW35fvycS/DDGwlbc6MT6q6BbhyhrsUsFviZwr0?=
 =?us-ascii?Q?Sh8pbCGnswieMFuDKbcCscHhB88+U+i2OdVhUuRl70uPjqSCYM5VxTjEQ0a7?=
 =?us-ascii?Q?zu3dVhMgyCQV4HWQ5SFoKqc04ZQPPqwD+OGNwaOj5510X4IvWpC8Lrv2tS5C?=
 =?us-ascii?Q?pg7ID6zldR88y/0BYyjEHs/mGQznWjxoEjamBdaR46u+tVsEA8Cg2lC0U6ia?=
 =?us-ascii?Q?URlEsRJ3mMyk1r+NQO85mm1R4llJhbaPqgRIdMQkuTLTHecDFWBrP0vJU6yZ?=
 =?us-ascii?Q?TrncRXAloflXHyjTzhY5lRYU64paZIDVCuxjyhnJngW7Id3NqwA5fx7ieETw?=
 =?us-ascii?Q?TXDsv0IA1OuLS7q/nQjIoeEljmeMxEKDoIHm2YQwGtyOkatlOtCksBBBphUg?=
 =?us-ascii?Q?6f+jF2YKW1dA+HZnAkzs4KjIUxaVH8/u/oYn6MHzQVonsaTG2pyM8ihwWW5l?=
 =?us-ascii?Q?XBykwM66H405vMfFJHe/tOGj8mqCDxhUXg9lZM8KgiG5oe5JJdrrz98OD4Xy?=
 =?us-ascii?Q?u+o9TGJuvL7yRNssFvuE7bXqi2Q/HrH4kegidbB28gQh4DUKkG0lJf4O9GWV?=
 =?us-ascii?Q?AICFh0DSItvWJxnyGk3JcJ0ia0lhvqAcbFXnBVcvzY+JLzYy4AA4cGMxBYkd?=
 =?us-ascii?Q?SjwV/h0sCBLkkl1s4kiJq5EBK3asxovboggReav3yNju/jVIxGCHjRyweRM5?=
 =?us-ascii?Q?wxbM8RfEs58+xwdOkyb+4SYAH0eps6XTrEsERJMT9y/aMyXXsESiS70p10TW?=
 =?us-ascii?Q?r48lyvMlocAfBEbeFfBhkT8EHzBP7NANnhRJ+OQs0zqfQn2DxTZZMc0DQnuA?=
 =?us-ascii?Q?iqfZNtcLCQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f9b912-da1a-4e87-622e-08df346e24bc
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:17.8429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msJJPuzd0itY7tyNmshefIWi+focWPkV/euDrz4ew/Stw5e5v+FTc7lf5Mpcc5SRQf07LZfkgGOo9jf2nNn/Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10907
X-purgate-ID: tlsNG-d25034/1793135179-010C9A5B-D00A1D47/0/0
X-purgate-type: clean
X-purgate-size: 15652
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mirela Simonovic <mirela.simonovic@aggios.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Do not save or restore physical pending interrupt state, including
SGIs and PPI/SPI pending bits in GICD_ISPENDR. Before this point, device
drivers must stop normal I/O and quiesce non-wakeup interrupt sources.
Earlier events must have been handled or remain recorded outside the
GIC. The platform must preserve wakeup events throughout suspend entry
and sleep if the GIC loses state. Level sources still asserted after
resume become pending again. Edge events need state retained outside
the GIC; saving GICD_ISPENDR would not cover events arriving after the
read.

Keep the Distributor and CPU interface control state unchanged during
suspend entry. GICv2 wakeup signals depend on Distributor group enables,
and firmware may check pending interrupts through the CPU interface
before accepting SYSTEM_SUSPEND. Leave shutdown and wakeup setup to
firmware. Disable the interfaces while restoring their state on resume.

CPU-interface active-priority state is not restored. Xen enters this
path with local IRQs disabled and must have no active-priority context
to replay after resume. If any visible GICC_APRn bit is still set,
abort suspend with -EBUSY without changing the GIC control registers.

This does not apply to distributor active state. With GICv2 EOImode==1,
EOIR only drops the interrupt priority; final deactivation is a separate
step. For guest-routed interrupts, Xen can have already EOIed the physical
IRQ while deactivation is still pending on the vGIC/GICV path. Therefore
GICD_ISACTIVER is preserved as architectural in-flight interrupt state.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V13:
- Use size_t for GICD word-access offsets to match the suspend code (MISRA
  Rule 10.3). No functional change.
- Cast the APR mask to uint32_t; it contains at most 32 bits (MISRA Rule
  10.3). No functional change.
- Leave the CPU interface and Distributor control state unchanged during
  suspend entry, including when the active-priority check fails.
- Explain why pending interrupt state is not saved and document the
  device and platform requirements for preserving events.

Changes in V10:
- Limit GICC_APR<n> active-priority checks to APR bits visible from
  the Xen CPU-interface view.
- Avoid touching reserved GICD_IPRIORITYR/GICD_ITARGETSR words when the
  last implemented interrupt block is partial.
- Restore distributor configuration before restoring interrupt enable
  state, so GICD_ICFGR is written while the corresponding interrupts are
  disabled.

Changes in V9:
- Skip saving/restoring GICD_ITARGETSR0..7 because SGI/PPI target
  registers hold no state (read-only on MP, RAZ/WI on UP).
- Add a runtime GICC_APRn quiescence check after disabling the CPU
  interface, and restore GICC_CTLR before returning -EBUSY.

Changes in V8:
- disable cpu interface + distributor before suspend
- change 0xffffffff to GENMASK;
- cosmetic changes;

Changes in V7:
- Allocate one contiguous memory block for the GICv2 dist suspend context.
- gicv2_resume() no longer unconditionally re-enables the distributor/CPU
  interface; it now writes back the saved CTLR values as-is.
- gicv2_alloc_context() now returns 0 on success and panics on failure,
  since suspend context allocation is not recoverable.
---
 xen/arch/arm/gic-v2.c          | 232 ++++++++++++++++++++++++++++++++-
 xen/arch/arm/gic.c             |  29 +++++
 xen/arch/arm/include/asm/gic.h |  12 ++
 3 files changed, 271 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 87eda9d322..67caf1c70a 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -118,12 +118,12 @@ static inline void writeb_gicd(uint8_t val, unsigned int offset)
     writeb_relaxed(val, gicv2.map_dbase + offset);
 }
 
-static inline void writel_gicd(uint32_t val, unsigned int offset)
+static inline void writel_gicd(uint32_t val, size_t offset)
 {
     writel_relaxed(val, gicv2.map_dbase + offset);
 }
 
-static inline uint32_t readl_gicd(unsigned int offset)
+static inline uint32_t readl_gicd(size_t offset)
 {
     return readl_relaxed(gicv2.map_dbase + offset);
 }
@@ -1108,6 +1108,225 @@ static int gicv2_iomem_deny_access(struct domain *d)
     return iomem_deny_access(d, mfn, mfn + nr - 1);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represents block of 32 IRQs */
+struct irq_block {
+    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
+    uint32_t ipriorityr[8];
+    uint32_t isenabler;
+    uint32_t isactiver;
+    uint32_t itargetsr[8];
+};
+
+/* GICv2 registers to be saved/restored on system suspend/resume */
+struct gicv2_context {
+    /* GICC context */
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+    } cpu;
+
+    /* GICD context */
+    struct dist_ctx {
+        uint32_t ctlr;
+        /* Includes banked SGI/PPI state for the boot CPU. */
+        struct irq_block *irqs;
+    } dist;
+};
+
+static struct gicv2_context gic_ctx;
+
+#define GICV2_NR_APRS          4
+#define GICV2_APR_BITS_PER_REG 32U
+
+static int gicv2_check_active_priorities(uint32_t bpr)
+{
+    unsigned int i, apr_bits, nr_aprs;
+
+    /*
+     * Xen writes GICC_BPR to 0 during CPU init and does not change it. Per
+     * IHI0048B.b, a write below the implementation minimum reads back as the
+     * minimum supported BPR value. Table 4-47 maps that Xen-visible BPR value
+     * to the visible GICC_APR<n> bits. Avoid reading APR registers outside
+     * that visible range.
+     *
+     * This covers both GICv2 with and without Security Extensions.
+     */
+    apr_bits = 1U << (7 - (bpr & 0x7));
+    nr_aprs = DIV_ROUND_UP(apr_bits, GICV2_APR_BITS_PER_REG);
+
+    ASSERT(nr_aprs <= GICV2_NR_APRS);
+
+    for ( i = 0; i < nr_aprs; i++ )
+    {
+        unsigned int bits = min(GICV2_APR_BITS_PER_REG,
+                                apr_bits - i * GICV2_APR_BITS_PER_REG);
+        uint32_t mask = (uint32_t)GENMASK(bits - 1, 0);
+        uint32_t apr = readl_gicc(GICC_APR + i * 4) & mask;
+
+        if ( !apr )
+            continue;
+
+        printk(XENLOG_ERR "GICv2: suspend aborted: GICC_APR%u=%#08x\n",
+               i, apr);
+        return -EBUSY;
+    }
+
+    return 0;
+}
+
+static int gicv2_suspend(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+    int ret;
+
+    /*
+     * Keep the CPU interface and Distributor control state unchanged.
+     * Firmware may use them to detect pending interrupts and wakeup events
+     * before entering system suspend. Local IRQs are already disabled.
+     */
+    gic_ctx.cpu.ctlr = readl_gicc(GICC_CTLR);
+    gic_ctx.cpu.bpr = readl_gicc(GICC_BPR);
+
+    /*
+     * Check the active-priority state for the group Xen drives through the
+     * CPU interface. GICC_CTL_ENABLE enables Group 0 without SecurityExtn and
+     * Group 1 in Xen's Non-secure view with SecurityExtn, and in both cases
+     * the relevant state is visible through GICC_APRn. The APR layout is
+     * implementation-defined, so only test the bits visible from Xen's CPU
+     * interface view instead of reading every possible APR register.
+     */
+    ret = gicv2_check_active_priorities(gic_ctx.cpu.bpr);
+    if ( ret )
+        return ret;
+
+    gic_ctx.cpu.pmr = readl_gicc(GICC_PMR);
+
+    /*
+     * Do not save PPI/SPI pending state. Drivers must quiesce non-wakeup
+     * sources and handle or retain earlier events before this point. The
+     * platform must retain wakeup events outside the GIC if its state can
+     * be lost, including edge events during suspend entry. Level sources
+     * still asserted after resume become pending again.
+     */
+    gic_ctx.dist.ctlr = readl_gicd(GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+        size_t nr_regs = ARRAY_SIZE(irqs->ipriorityr);
+
+        if ( i == blocks - 1 )
+            nr_regs = DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
+
+        irqs->isenabler = readl_gicd(GICD_ISENABLER + off);
+
+        /*
+         * Save distributor active state as part of the hypervisor-owned
+         * physical interrupt state. In GICv2 EOImode==1, EOIR only drops the
+         * priority; final deactivation is separate. For guest-routed
+         * interrupts, Xen may have EOIed the physical IRQ while the guest/vGIC
+         * side still owns the deactivate step. Therefore GICD_ISACTIVER can
+         * legitimately remain set even though transient SGI pending state and
+         * CPU-interface active-priority state are expected to be quiesced here.
+         */
+        irqs->isactiver = readl_gicd(GICD_ISACTIVER + off);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < nr_regs; j++ )
+            irqs->ipriorityr[j] = readl_gicd(GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < nr_regs; j++ )
+                irqs->itargetsr[j] = readl_gicd(GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            irqs->icfgr[j] = readl_gicd(GICD_ICFGR + off + j * 4);
+    }
+
+    return 0;
+}
+
+static void gicv2_resume(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gicv2_cpu_disable();
+    /* Disable distributor */
+    writel_gicd(0, GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+        size_t nr_regs = ARRAY_SIZE(irqs->ipriorityr);
+
+        if ( i == blocks - 1 )
+            nr_regs = DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICENABLER + off);
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < nr_regs; j++ )
+            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < nr_regs; j++ )
+                writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->isenabler);
+        writel_gicd(irqs->isenabler, GICD_ISENABLER + off);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICACTIVER + off);
+        writel_gicd(irqs->isactiver, GICD_ISACTIVER + off);
+    }
+
+    /* Restore distributor control state. */
+    writel_gicd(gic_ctx.dist.ctlr, GICD_CTLR);
+
+    /* Restore GIC CPU interface configuration */
+    writel_gicc(gic_ctx.cpu.pmr, GICC_PMR);
+    writel_gicc(gic_ctx.cpu.bpr, GICC_BPR);
+
+    /* Enable GIC CPU interface */
+    writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+}
+
+static void __init gicv2_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gic_ctx.dist.irqs = xzalloc_array(struct irq_block, blocks);
+    if ( !gic_ctx.dist.irqs )
+        panic("Failed to allocate memory for GICv2 suspend context\n");
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #ifdef CONFIG_ACPI
 static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
 {
@@ -1315,6 +1534,11 @@ static int __init gicv2_init(void)
 
     spin_unlock(&gicv2.lock);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Allocate memory to be used for saving GIC context during the suspend */
+    gicv2_alloc_context();
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
     return 0;
 }
 
@@ -1358,6 +1582,10 @@ static const struct gic_hw_operations gicv2_ops = {
     .map_hwdom_extra_mappings = gicv2_map_hwdom_extra_mappings,
     .iomem_deny_access   = gicv2_iomem_deny_access,
     .do_LPI              = gicv2_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv2_suspend,
+    .resume              = gicv2_resume,
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 /* Set up the GIC */
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index c4bda435bd..30087b5938 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -464,6 +464,35 @@ int gic_iomem_deny_access(struct domain *d)
     return gic_hw_ops->iomem_deny_access(d);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+int gic_suspend(void)
+{
+    /* Must be called by boot CPU#0 with interrupts disabled */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+
+    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
+        return -ENOSYS;
+
+    return gic_hw_ops->suspend();
+}
+
+void gic_resume(void)
+{
+    /*
+     * Must be called by boot CPU#0 with interrupts disabled after gic_suspend
+     * has returned successfully.
+     */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+    ASSERT(gic_hw_ops->resume);
+
+    gic_hw_ops->resume();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_gic_callback(struct notifier_block *nfb,
                             unsigned long action,
                             void *hcpu)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 9af05da6aa..d01249069f 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -307,6 +307,12 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/* Suspend/resume */
+extern int gic_suspend(void);
+extern void gic_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* SGI (AKA IPIs) */
 enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
@@ -458,6 +464,12 @@ struct gic_hw_operations {
     int (*iomem_deny_access)(struct domain *d);
     /* Handle LPIs, which require special handling */
     void (*do_LPI)(unsigned int lpi);
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Save GIC configuration due to the system suspend */
+    int (*suspend)(void);
+    /* Restore GIC configuration due to the system resume */
+    void (*resume)(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 extern const struct gic_hw_operations *gic_hw_ops;
-- 
2.53.0


