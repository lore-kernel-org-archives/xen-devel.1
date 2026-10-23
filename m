Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2251606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=SIJ1aRCC
Received: from list by lists.xenproject.org with outflank-mailman.1458909.1670980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7Jy-000096-G1; Fri, 23 Oct 2026 04:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458909.1670980; Fri, 23 Oct 2026 04:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7Jy-00008z-Ah; Fri, 23 Oct 2026 04:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1458909;
 Fri, 23 Oct 2026 04:56:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xK7Jw-00008r-CK
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:56:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7Jv-004l5c-PS
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:55:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae8b6-2eae-0a2a0a5409dd-0a2a4506824e-26
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:55:59 +0200
Received: from [40.107.74.78]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae8dc-195a-0a2a45060019-286b4a4e9860-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:55:58 +0200
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TYYP286MB5665.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:295::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 04:55:54 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 04:55:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nT5uKeO5lUvrTCOto4F3AVpMiwmGSZuwiBzuS0prSfhUsLFfGqmCWc+giqZjHp7UOaCqlJGijDoCUE0qxDBUKvTwZ6espd6Ue8oDisvQppNgQjAKIvfrwnBOG0X5uKhaYSQOrcc0ZYauqFwxjrtjXYJcuQ/AvLuGAppnoWyJzT+tgRKl+L+Ey8s/caHR+ry1Q+SSxaTMSYtNVysVgrsF80aVjB37Yf76x8XZ5xIwND3p5qYN1tAgBsTKSHynMoyRhnQRKM34xLwszlU4h/jSQMwz5ue8RaZXZ0h9+nvTDyyqv7qD6yQ+I8TLiwjF2iBBhI0WmoEJOnOHuGHWrvhfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMDLJE58fBspR1Ur0/K2trhZGV+jlKomdmhc4KMqC34=;
 b=Clof73CyGbwPxZnf/I8qlvfs+MVAzorDgy9sJ6x4kZTQU+hEO3OQ05aJbpwKv4wu1h7eO6h3XWMdvtVi6hVOQ+bEtc0/gxSimewynXS18h3IvF6qyNX5tOnlMDzaeldtNhWdPLINU06eu9CuAjP1j8leU7Z/OSnOzQmz6OurzTqA3vXjWoekab+rUefTbST8QUMInEu+UI5MKJ1oxdSZeDkiEtOUyMpvYePUqQL9k7Yvj7xDlP0KZODwipP0zhGO27XZ8mJQvP2Uv7JyVlj+DaDJSmFkPcK3rVoHkSRC76TvfqHo5j0xB7MZOfn67XQR2247txLYnD+lcIaSFO/UDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMDLJE58fBspR1Ur0/K2trhZGV+jlKomdmhc4KMqC34=;
 b=SIJ1aRCCXSWmGUn/4drpHOiXGeAbfdiOHfTOaeIBu4e63YqJZw8cU4o68ozouQNRDhraR55mm+RN5NCXkh5atPueTrBZxJRtFjsUncw0PnzPjIDsv+jAJBSQ1e5HuA8I3jiWCGKj2dpStFuvzBS8TLwLrce07vIrxGEv/UGwKX8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	jgross@suse.com,
	Ryo Takakura <takakura@valinux.co.jp>
Subject: [RFC 3/5] xen/tracing: prepare a livepatch payload and its controling interface
Date: Fri, 23 Oct 2026 13:55:43 +0900
Message-Id: <20261023045543.164658-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023044809.162759-1-takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::11) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TYYP286MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 17593c5d-b6b8-493e-fed2-08df30c1eb0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|3023799007|10067099003|5023799004|261009223027099003|261021123027099003|261022115727099003|261022113327099003|261021135927099003|261021121427099003|261022075727099003|261021133027099003|261021130227099003|261022105027099003|56012099006|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	nDO3I6MIMO6TOcf//tHaCQobfQtVJNh0FF0EZAUY4T+LE5WWpEBG+EkPpqSyqBysj3JYJU48E2XF6jDgjcqQhOD+pIcHLehFyntp9uOlpTo9hSyjBUAyacsF3K6NiFre4lLPPBip6ICUN//wX8oxgTYywjrLMByPQAxYhmBWxbn1d7Tc5dul+6rkCLLWU5eAfTyBLLTCFAQvXE70/V8eh7HFLu5h8Zp91LzfGk15u7ps3WXgZlnauG6oGdhQDU6+0WBhwtUn9TXtZi1In99kmgN0feWk1cfXBg/7Sdz776v8xSzi6g/t5Kno6ZEEut7FjL4YKUVmBdklsKHvPfXiXTXBCl31+UPxbvNPHuMWGtCkS4rq7M1saE36ZX5OlfL+uvbZbFkPqtdcOaHP8inWVUy7EjO314NHbdDvQzFnQDa5iLoZtixcgFBi+YnrUiw6IJfA5PrD9MN+k+5hH0k4LxeDqZlVO2JKmfWOQkMC1W7gaeHB/nJEuLYsRB0Tyni9k+QDZ5QoabT3SV36HHCB7fiBKpves4hshOuCe7Ger78Ac+XVYMj0HegEcHsqylGq9IYzLcS2GmIh5UXW0zsEzlhlCDyRd7b8xOPRaFkEt+gf1rAVlLZDn89yBo0lBeZnQLugvLlsmFmGiKg2AfPYqgXZhdDFssHlaBC2k8Khk4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(10067099003)(5023799004)(261009223027099003)(261021123027099003)(261022115727099003)(261022113327099003)(261021135927099003)(261021121427099003)(261022075727099003)(261021133027099003)(261021130227099003)(261022105027099003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?avrT0iujQZmbFJTYzITm9+H7RWtiMNDUXTbmaobkWNcUQaQ4Y44HL77Qo1lD?=
 =?us-ascii?Q?xLOh3zsws+nhUb1MbtzPSe6jLmCKsKmhhumG7Mv1D0zOz4w3qjWDmsvdx9Ky?=
 =?us-ascii?Q?6WM1KdPOpzhrxAK5k2/RmYHACo4aETNO2hKYI5a8XWTeBtpIKiw+tVIZ1nHk?=
 =?us-ascii?Q?E1GVO+V3VWq7rFFjvwxl8UGdWsfekydT8YUng522/LlUFbmRYEvfoE3C0HXo?=
 =?us-ascii?Q?hRnGUR4LxYrRMOcd+RI0V8aih0T970nOKfzPL1fCxWEKFr5+z9Beg45LTt16?=
 =?us-ascii?Q?5CkTF2IDJmpPtgJHw33IX+Qc0ATvWc95mZPerH/Libvhtn+acEjGGTsJRnd7?=
 =?us-ascii?Q?HLRivlVmQ/le8pgRK8nWI5ZmHH5C7MyrOHN10IcmH/KObX+BXUCXCmR3ocSs?=
 =?us-ascii?Q?l3FImukXVoHcw05FbWLTO5q8FY56L4BTsYM2Y4lZJ7ybPC3QJ6/bpTIGAPrr?=
 =?us-ascii?Q?o5kBW7yQiQNHns3KpeKn5mxIn6Hf668ZzdF5RugV5tstBCj3XpNb/gmlPjdn?=
 =?us-ascii?Q?8MulE2qQ9InjYuIVnY2daxQrE6M+tbWCwFYGycnHaTqWtErt7j6zZyuj8m7e?=
 =?us-ascii?Q?YPS0doOXlybBtx13SWmum1DPqROR1WeejypMIVTK45RtBfJ4Bo4Tb/Ggh71K?=
 =?us-ascii?Q?P2dwZRr5VDNNH9PxCq0VhB2+s8taKGBCckVrA3nMyFHJG40zKiCiV9wkhz/v?=
 =?us-ascii?Q?kaEZhehLwvwelXrQ5fOymOuSJTZ/K/S/3QU/ADeTNOUPM8L3V3kuVE9xmWIQ?=
 =?us-ascii?Q?9/8NThDpGRwHNsqJmGl6QhbZ/1ZJJMLf9nasbtOS2SPIx2cekLR5AA90j+6w?=
 =?us-ascii?Q?YplboZR91BvsRk4ewyiY6wCceA6+oNbw35PHN06YbstQIS9NncZqG+8g0ZgC?=
 =?us-ascii?Q?dG4P0unzFn6hRwMgBelugz46B0oRSA5Q19bf2MiWIEiGiGY1jILg2spVSQ6r?=
 =?us-ascii?Q?JuaiQyz5ppWdhzxpUolXqk7Ya6YfsVMkr/B9pUK2Iw3eTOr2PpoAmbCGzb3X?=
 =?us-ascii?Q?3YX/xO8iCexZckb/ZSRtR0hsY6OhkrJLQWoCH/Xljhw+grFp1c0YanB3XDYp?=
 =?us-ascii?Q?0Gd5VNNR7Ic6f4KKDwQoFDOxid9qShYSYnke4g+qeucniVxGUHlHvkZ0Jxpj?=
 =?us-ascii?Q?HdqTzfBvwkIqFzJAvCFin9MP2CvGVECISmUKbrVo+E0AifMkQRg2MJntBSKY?=
 =?us-ascii?Q?5FbNcaW4NONeFF6jHpZhX1J3XL32Lh5X9UNn8v0ZYYQyJdEmJsurcWeGOFgc?=
 =?us-ascii?Q?5z085ZdtYQ11kS2z7Av1CD4MEsg7s0i/Z+Og9U5nfVFzIQM7GS9h9Ks4xQP5?=
 =?us-ascii?Q?7aKRq2PNDVEQFgGOw/VDJ9KzFVymciScQdKfdqfS9pj7bRRDROzlzGfIWzRy?=
 =?us-ascii?Q?ve+jgEP4W3yW0hEaFqGQ3VTH2xI/8CI1uZTj4HCLxxMtIEcuzdpA3qq51xn/?=
 =?us-ascii?Q?/WkSoIe7wf3qoA/OKndjlpG3C1I3ciaRiS5sJohr+kORtvR5EHxaoTpID5iv?=
 =?us-ascii?Q?5E/hYORv59InrA8TJ881+xzLrV5NIYFAe6/SleG77Q6etXDrvzEzR8BwIvnj?=
 =?us-ascii?Q?0LWHjxh6JJn0kZA8l5TKIEQQR3cvbqHD6/oGthOXb/gL/fm1nbevBc3l5EVU?=
 =?us-ascii?Q?v29l6zyx7x/+B4YUTvVht6eimQWjSE0dRtlT3RZ69JJZX98A+gvRf3X+wSe2?=
 =?us-ascii?Q?axurg9bYpCCBajxRtP2FLqOwuomrpfE8IOkO/b/i+1jeEZLXcAyBWtSeYJQz?=
 =?us-ascii?Q?c60fK3TPpg=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 17593c5d-b6b8-493e-fed2-08df30c1eb0f
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 04:55:54.1452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltpb652elEbHlLMr3VM6f2TrRMIdHiZRzG0bWLfpsKtpsyPz6LC2LVgT2MA4C7YQdeg1dsuH1os5S1m4TuS1Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5665
X-purgate-ID: tlsNG-16d1c6/1792731359-1FACA77B-CC16EB0F/0/0
X-purgate-type: clean
X-purgate-size: 26265
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce a shared livepatch payload that tracers can
use to patch their target functions. The payload will be scheduled
to the TRACE_ON/OFF path which will let tracers to request livepatch
without satisfying the requirements for regular livepatch payloads.

Every tracers are represented as struct tracer with optional callbacks
for managing its state and output. Expose these operations through HypFS
files under /tracing, following Linux ftrace's naming and usage:

 available_tracers: List registered tracers.
 current_tracer: Read or select the active tracer.
 available_functions: List functions available for tracing.
 set_function_filter: Read, select, or clear the target function.
 tracing_on: Read or change whether recording is enabled.
 trace: Read or clear output from tracers.

Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
---
 xen/arch/arm/xen.lds.S        |   5 +
 xen/common/Kconfig            |   9 +
 xen/common/Makefile           |   4 +
 xen/common/hypfs_trace.c      | 741 ++++++++++++++++++++++++++++++++++
 xen/common/livepatch.c        |   9 +
 xen/include/xen/hypfs_trace.h |  42 ++
 6 files changed, 810 insertions(+)
 create mode 100644 xen/common/hypfs_trace.c
 create mode 100644 xen/include/xen/hypfs_trace.h

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 613511390f..a85cab62af 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -61,6 +61,11 @@ SECTIONS
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
+       . = ALIGN(8);
+       __start_patchable_function_entries = .;
+       KEEP(*(__patchable_function_entries))
+       __stop_patchable_function_entries = .;
+
        . = ALIGN(4);
        __proc_info_start = .;
        *(.proc.info)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 7cf6937c2f..ba118276f2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -608,6 +608,15 @@ config TRACEBUFFER
 config HAS_LIVEPATCH_TRACE
 	bool
 
+config LIVEPATCH_TRACER
+	bool "Livepatch Tracer"
+	depends on HYPFS && HAS_LIVEPATCH_TRACE
+	default n
+	help
+	  Enable dynamic tracers. Tracers attach/deattach their callback functions
+	  using livepatch infrastructure. User can select the tracer and target
+	  function through the HypFS interface exposed as /tracing.
+
 config LLC_COLORING
 	bool "Last Level Cache (LLC) coloring" if EXPERT
 	depends on HAS_LLC_COLORING
diff --git a/xen/common/Makefile b/xen/common/Makefile
index f69d47d189..303016f250 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -79,6 +79,10 @@ obj-$(CONFIG_UBSAN) += ubsan/
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_LIBFDT) += libfdt/
 
+obj-$(CONFIG_LIVEPATCH_TRACER) += hypfs_trace.o
+# Do not generate patchable entries for the tracer functions.
+$(obj)/hypfs_trace.o: CFLAGS-y += -fpatchable-function-entry=0,0
+
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
 $(obj)/config.gz: $(CONF_FILE)
 	gzip -n -c $< >$@
diff --git a/xen/common/hypfs_trace.c b/xen/common/hypfs_trace.c
new file mode 100644
index 0000000000..d9e06e092e
--- /dev/null
+++ b/xen/common/hypfs_trace.c
@@ -0,0 +1,741 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/ctype.h>
+#include <xen/init.h>
+#include <xen/hypfs.h>
+#include <xen/hypfs_trace.h>
+#include <xen/livepatch_payload.h>
+#include <xen/symbols.h>
+#include <xen/string.h>
+#include <xen/guest_access.h>
+#include <xen/xmalloc.h>
+#include <xen/lib.h>
+#include <xen/list.h>
+#include <xen/spinlock.h>
+
+#define MAX_TRACER_SIZE 100
+
+static LIST_HEAD(tracer_list);
+
+/*
+ * Only one tracer callback can be registered at a time, targeting a
+ * single function. Multiple callbacks and multiple target functions
+ * are not currently supported.
+ */
+static bool trace_callback_registered;
+static DEFINE_SPINLOCK(trace_callback_lock);
+
+/* Table of patchable functions generated by -fpatchable-function-entry. */
+extern const unsigned long __start_patchable_function_entries[];
+extern const unsigned long __stop_patchable_function_entries[];
+
+/*
+ * .old_addr holds the address of the target function.
+ * .new_addr holds the address of the selected tracer's callback.
+ */
+static struct livepatch_func global_trace_func;
+
+static struct livepatch_fstate global_trace_fstate = {
+    .applied = LIVEPATCH_FUNC_NOT_APPLIED,
+};
+
+/* Nop tracer is the default tracer */
+static unsigned int cf_check nop_get_trace_size(struct trace_context *tr)
+{
+    return sizeof("# tracer: nop\n");
+}
+
+static size_t cf_check nop_print_trace(struct trace_context *tr, char *buf, size_t size)
+{
+    return scnprintf(buf, size, "# tracer: nop\n");
+}
+
+static struct tracer nop_tracer = {
+    .name = "nop",
+    .get_trace_size = nop_get_trace_size,
+    .print_trace = nop_print_trace,
+};
+
+/*
+ * Payload used by tracers for scheduling livepatch.
+ *
+ * It describes the target patch site through global_trace_func,
+ * with its patching state tracked by global_trace_fstate.
+ */
+static struct payload global_trace_payload = {
+    .name = "function-trace",
+    .funcs = &global_trace_func,
+    .fstate = &global_trace_fstate,
+    .nfuncs = 1,
+    .is_trace = true,
+};
+
+/*
+ * Context tracking the selected tracer, recording state,
+ * and references to the payload and target function used for patching.
+ *
+ * Initially, the nop tracer is selected as default.
+ */
+static struct trace_context global_trace = {
+    .current_trace = &nop_tracer,
+    .payload = &global_trace_payload,
+    .func = &global_trace_func,
+    .tracing_on = false,
+};
+
+/* Trim HypFS inputs */
+static char *strim(char *s)
+{
+    char *end;
+
+    while ( isspace(*s) )
+        s++;
+
+    end = s + strlen(s);
+    while ( end > s && isspace(end[-1]) )
+        end--;
+
+    *end = '\0';
+    return s;
+}
+
+static bool tracing_is_on(void)
+{
+    return global_trace.tracing_on;
+}
+
+static int tracing_set_on(bool on)
+{
+    const struct tracer *tracer = global_trace.current_trace;
+    int rc = 0;
+
+    if ( global_trace.tracing_on == on )
+        return 0;
+
+    if ( on )
+    {
+        if ( tracer->start )
+            rc = tracer->start(&global_trace);
+    }
+    else
+    {
+        if ( tracer->stop )
+            rc = tracer->stop(&global_trace);
+    }
+
+    if ( !rc )
+        global_trace.tracing_on = on;
+
+    return rc;
+}
+
+void trace_dispatch_callbacks(unsigned long ip, unsigned long parent_ip)
+{
+    livepatch_trace_func_t callback;
+
+    if ( !tracing_is_on() )
+        return;
+
+    if ( !trace_callback_registered )
+        return;
+
+    if ( !global_trace_func.old_addr )
+        return;
+
+    if ( (unsigned long)global_trace_func.old_addr != ip )
+        return;
+
+    callback = global_trace_func.new_addr;
+    callback((unsigned long)global_trace_func.old_addr, parent_ip);
+}
+
+int trace_register_callback(livepatch_trace_func_t callback)
+{
+    int rc = 0;
+
+    spin_lock(&trace_callback_lock);
+
+    if ( trace_callback_registered )
+    {
+        rc = -EEXIST;
+        goto out_unlock;
+    }
+
+    trace_callback_registered = true;
+    global_trace_func.new_addr = callback;
+
+ out_unlock:
+    spin_unlock(&trace_callback_lock);
+
+    return rc;
+}
+
+int trace_unregister_callback(void)
+{
+    int rc = 0;
+
+    spin_lock(&trace_callback_lock);
+
+    if ( !trace_callback_registered )
+    {
+        rc = -ENOENT;
+        goto out_unlock;
+    }
+
+    trace_callback_registered = false;
+    global_trace_func.new_addr = NULL;
+
+out_unlock:
+    spin_unlock(&trace_callback_lock);
+
+    return rc;
+}
+
+static bool is_patchable_function_entry(unsigned long addr)
+{
+    const unsigned long *p;
+
+    for ( p = __start_patchable_function_entries;
+          p < __stop_patchable_function_entries; p++ )
+    {
+        if ( *p == addr )
+            return true;
+    }
+
+    return false;
+}
+
+static void get_patchable_function_entries(const unsigned long **start,
+                                           const unsigned long **stop)
+{
+    *start = __start_patchable_function_entries;
+    *stop = __stop_patchable_function_entries;
+}
+
+static struct tracer *trace_find_tracer(const char *name)
+{
+    struct tracer *tracer;
+
+    list_for_each_entry( tracer, &tracer_list, list )
+        if ( !strcmp(tracer->name, name) )
+            return tracer;
+
+    return NULL;
+}
+
+static int trace_set_tracer(const char *name)
+{
+    const struct tracer *prev = global_trace.current_trace;
+    const struct tracer *new;
+    int rc;
+
+    new = trace_find_tracer(name);
+    if ( !new )
+        return -EINVAL;
+
+    if ( new == prev )
+        return 0;
+
+    if ( prev->reset )
+    {
+        rc = prev->reset(&global_trace);
+        if ( rc )
+            return rc;
+    }
+
+    global_trace.current_trace = &nop_tracer;
+
+    if ( new->init )
+    {
+        rc = new->init(&global_trace);
+        if ( rc )
+            return rc;
+    }
+
+    global_trace.current_trace = new;
+
+    return 0;
+}
+
+static int trace_set_filter(const char *name)
+{
+    struct payload *payload = global_trace.payload;
+    unsigned long ip = 0;
+    size_t len = strlen(name);
+    int rc;
+
+    if ( len )
+    {
+        ip = symbols_lookup_by_name(name);
+        if ( !ip || !is_patchable_function_entry(ip) )
+            return -EINVAL;
+    }
+
+    /* Schedule removal of the current patch. */
+    if ( global_trace_fstate.applied == LIVEPATCH_FUNC_APPLIED )
+    {
+         /* The requested function is already patched. Nothing to change. */
+        if ( (unsigned long)global_trace_func.old_addr == ip )
+            return 0;
+
+        rc = livepatch_schedule_trace_off(payload);
+        if ( rc )
+            return rc;
+
+        /* Removal has been scheduled. Clear the previous filter name. */
+        global_trace.filter_name[0] = '\0';
+    }
+
+    /* Clear the filter if no target function was requested. */
+    if ( !ip )
+    {
+        /*
+         * Keep global_trace_func.old_addr since livepatching
+         * might be in flight. Only clear global_trace.filter_name
+         * which will effectively update /tracing/set_function_filter.
+         */
+        global_trace.filter_name[0] = '\0';
+        return 0;
+    }
+
+    /*
+     * Schedule patching of the requested function.
+     * A previously scheduled removal may still be in flight, in which case
+     * livepatch_schedule_trace_on() returns -EBUSY and the user must retry.
+     */
+    rc = livepatch_schedule_trace_on(payload, global_trace.func, ip);
+    if ( rc )
+        return rc;
+
+    strlcpy(global_trace.filter_name, name, sizeof(global_trace.filter_name));
+
+    return 0;
+}
+
+static HYPFS_DIR_INIT(tracing_dir, "tracing");
+
+/*
+ * /tracing/available_tracers
+ * Lists the names of all registered tracers.
+ */
+static unsigned int available_tracers_size(void)
+{
+    const struct tracer *tracer;
+    unsigned int size = 0;
+
+    list_for_each_entry( tracer, &tracer_list, list )
+        size += strlen(tracer->name) + 1;
+
+    return size;
+}
+
+static int cf_check available_tracers_read(const struct hypfs_entry *entry,
+                                           XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct tracer *tracer;
+    unsigned int size = available_tracers_size();
+    unsigned int pos = 0;
+    char *buf;
+    int rc = 0;
+
+    buf = xmalloc_array(char, size);
+    if ( !buf )
+        return -ENOMEM;
+
+    list_for_each_entry( tracer, &tracer_list, list )
+    {
+        unsigned int len = strlen(tracer->name);
+
+        memcpy(buf + pos, tracer->name, len);
+        pos += len;
+        buf[pos++] = ' ';
+    }
+
+    buf[pos - 1] = '\0';
+
+    if ( copy_to_guest(uaddr, buf, size) )
+        rc = -EFAULT;
+
+    xfree(buf);
+
+    return rc;
+}
+
+static unsigned int cf_check available_tracers_getsize(const struct hypfs_entry *entry)
+{
+    return available_tracers_size();
+}
+
+static const struct hypfs_funcs available_tracers_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
+    .read = available_tracers_read,
+    .write = hypfs_write_deny,
+    .getsize = available_tracers_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
+static HYPFS_VARSIZE_INIT(available_tracers, XEN_HYPFS_TYPE_STRING,
+                          "available_tracers", 0, &available_tracers_funcs);
+
+/*
+ * /tracing/current_tracer
+ * Print and select the active tracer.
+ */
+static int cf_check current_tracer_read(const struct hypfs_entry *entry,
+                                        XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const char *name = global_trace.current_trace->name;
+
+    return copy_to_guest(uaddr, name, strlen(name) + 1) ? -EFAULT : 0;
+}
+
+static int cf_check current_tracer_write(struct hypfs_entry_leaf *leaf,
+                                         XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                                         unsigned int ulen)
+{
+    char buf[MAX_TRACER_SIZE + 1];
+    char *name;
+
+    if ( ulen > MAX_TRACER_SIZE )
+        return -EINVAL;
+
+    if ( copy_from_guest(buf, uaddr, ulen) )
+        return -EFAULT;
+
+    buf[ulen] = '\0';
+    name = strim(buf);
+
+    if ( !*name )
+        return -EINVAL;
+
+    return trace_set_tracer(name);
+}
+
+static unsigned int cf_check current_tracer_getsize(const struct hypfs_entry *entry)
+{
+    return strlen(global_trace.current_trace->name) + 1;
+}
+
+static const struct hypfs_funcs current_tracer_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
+    .read = current_tracer_read,
+    .write = current_tracer_write,
+    .getsize = current_tracer_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
+static HYPFS_VARSIZE_INIT(current_tracer, XEN_HYPFS_TYPE_STRING,
+                         "current_tracer", MAX_TRACER_SIZE + 2, &current_tracer_funcs);
+
+/*
+ * /tracing/available_functions
+ * Lists the names of functions whose entries can be patched for tracing.
+ */
+static int cf_check available_functions_read(const struct hypfs_entry *entry,
+                                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const unsigned long *start, *stop, *p;
+    char namebuf[KSYM_NAME_LEN + 1];
+    const char *name;
+    unsigned long size, offset;
+    int ret = 0;
+    char *buf;
+    unsigned int buf_size = 0;
+    unsigned int buf_pos = 0;
+
+    get_patchable_function_entries(&start, &stop);
+
+    for ( p = start; p < stop; p++ )
+    {
+        name = symbols_lookup(*p, &size, &offset, namebuf);
+        if ( name )
+            buf_size += strlen(name) + 1;
+    }
+
+    if ( buf_size == 0 )
+    {
+        char empty = '\0';
+        if ( copy_to_guest(uaddr, &empty, 1) )
+            return -EFAULT;
+        return 0;
+    }
+
+    buf = xmalloc_array(char, buf_size);
+    if ( !buf )
+        return -ENOMEM;
+
+    for ( p = start; p < stop; p++ )
+    {
+        name = symbols_lookup(*p, &size, &offset, namebuf);
+        if ( name )
+        {
+            unsigned int len = strlen(name);
+            memcpy(buf + buf_pos, name, len);
+            buf[buf_pos + len] = '\n';
+            buf_pos += len + 1;
+        }
+    }
+    buf[buf_pos - 1] = '\0';
+
+    if ( copy_to_guest(uaddr, buf, buf_size) )
+        ret = -EFAULT;
+
+    xfree(buf);
+    return ret;
+}
+
+static unsigned int cf_check available_functions_getsize(const struct hypfs_entry *entry)
+{
+    const unsigned long *start, *stop, *p;
+    char namebuf[KSYM_NAME_LEN + 1];
+    const char *name;
+    unsigned long size, offset;
+    unsigned int buf_size = 0;
+
+    get_patchable_function_entries(&start, &stop);
+
+    for ( p = start; p < stop; p++ )
+    {
+        name = symbols_lookup(*p, &size, &offset, namebuf);
+        if ( name )
+            buf_size += strlen(name) + 1;
+    }
+
+    if ( buf_size == 0 )
+        return 1;
+
+    return buf_size ? buf_size : 1;
+}
+
+static const struct hypfs_funcs available_functions_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
+    .read = available_functions_read,
+    .write = hypfs_write_deny,
+    .getsize = available_functions_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
+static HYPFS_VARSIZE_INIT(available_functions, XEN_HYPFS_TYPE_STRING,
+                          "available_functions", 0, &available_functions_funcs);
+
+/*
+ * /tracing/set_function_filter
+ * Print and select the target function.
+ */
+static int cf_check set_function_filter_read(const struct hypfs_entry *entry,
+                                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const char *name = global_trace.filter_name;
+
+    return copy_to_guest(uaddr, name, strlen(name) + 1) ? -EFAULT : 0;
+}
+
+static int cf_check set_function_filter_write(struct hypfs_entry_leaf *leaf,
+                                              XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                                            unsigned int ulen)
+{
+    char buf[KSYM_NAME_LEN + 1];
+    char *name;
+
+    if ( ulen > KSYM_NAME_LEN )
+        return -EINVAL;
+
+    if ( copy_from_guest(buf, uaddr, ulen) )
+        return -EFAULT;
+
+    buf[ulen] = '\0';
+    name = strim(buf);
+
+    return trace_set_filter(name);
+}
+
+static unsigned int cf_check set_function_filter_getsize(const struct hypfs_entry *entry)
+{
+    return strlen(global_trace.filter_name) + 1;
+}
+
+static const struct hypfs_funcs set_function_filter_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
+    .read = set_function_filter_read,
+    .write = set_function_filter_write,
+    .getsize = set_function_filter_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
+static HYPFS_VARSIZE_INIT(set_function_filter, XEN_HYPFS_TYPE_STRING,
+                          "set_function_filter", KSYM_NAME_LEN + 1, &set_function_filter_funcs);
+
+/*
+ * /tracing/tracing_on
+ * Enable or disable tracing by writing 1 or 0.
+ */
+static int cf_check tracing_on_read(const struct hypfs_entry *entry,
+                                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    char buf[] = "0";
+
+    buf[0] = global_trace.tracing_on ? '1' : '0';
+
+    return copy_to_guest(uaddr, buf, sizeof(buf)) ? -EFAULT : 0;
+}
+
+static int cf_check tracing_on_write(struct hypfs_entry_leaf *leaf,
+                                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                                     unsigned int ulen)
+{
+    char buf[sizeof("0\n") + 1];
+    char *enabled;
+
+    if ( ulen > sizeof("0\n") )
+        return -EINVAL;
+
+    if ( copy_from_guest(buf, uaddr, ulen) )
+        return -EFAULT;
+
+    buf[ulen] = '\0';
+    enabled = strim(buf);
+
+    if ( strlen(enabled) != 1 || (enabled[0] != '0' && enabled[0] != '1') )
+        return -EINVAL;
+
+    return tracing_set_on(enabled[0] == '1');
+}
+
+static unsigned int cf_check tracing_on_getsize(const struct hypfs_entry *entry)
+{
+    return sizeof("0");
+}
+
+static const struct hypfs_funcs tracing_on_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
+    .read = tracing_on_read,
+    .write = tracing_on_write,
+    .getsize = tracing_on_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
+static HYPFS_VARSIZE_INIT(tracing_on, XEN_HYPFS_TYPE_STRING,
+                          "tracing_on", sizeof("0\n"), &tracing_on_funcs);
+
+/*
+ * /tracing/trace
+ * Print the output from the current tracer.
+ */
+static unsigned int cf_check trace_getsize(const struct hypfs_entry *entry)
+{
+    const struct tracer *tracer = global_trace.current_trace;
+    unsigned int size;
+
+    if ( !tracer->get_trace_size || !tracer->print_trace )
+        return sizeof("");
+
+    size = tracer->get_trace_size(&global_trace);
+
+    return size ? size : sizeof("");
+}
+
+static int cf_check trace_read(const struct hypfs_entry *entry,
+                               XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct tracer *tracer = global_trace.current_trace;
+    unsigned int size;
+    char *buf;
+    int rc = 0;
+
+    if ( tracing_is_on() )
+        return -EBUSY;
+
+    if ( !tracer->get_trace_size || !tracer->print_trace )
+        return copy_to_guest(uaddr, "", sizeof("")) ? -EFAULT : 0;
+
+    size = tracer->get_trace_size(&global_trace);
+    if ( !size )
+        return copy_to_guest(uaddr, "", sizeof("")) ? -EFAULT : 0;
+
+    buf = xzalloc_array(char, size);
+    if ( !buf )
+        return -ENOMEM;
+
+    tracer->print_trace(&global_trace, buf, size);
+
+    if ( copy_to_guest(uaddr, buf, size) )
+        rc = -EFAULT;
+
+    xfree(buf);
+
+    return rc;
+}
+
+static int cf_check trace_write(struct hypfs_entry_leaf *leaf,
+                                XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                                unsigned int ulen)
+{
+    const struct tracer *tracer = global_trace.current_trace;
+
+    if ( tracing_is_on() )
+        return -EBUSY;
+
+    if ( !tracer->clear_trace )
+        return 0;
+
+    return tracer->clear_trace(&global_trace);
+}
+
+static const struct hypfs_funcs trace_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
+    .read = trace_read,
+    .write = trace_write,
+    .getsize = trace_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
+static HYPFS_VARSIZE_INIT(trace, XEN_HYPFS_TYPE_STRING, "trace", sizeof("0\n"), &trace_funcs);
+
+int __init trace_register_tracer(struct tracer *tracer)
+{
+    if ( !tracer->name )
+        return -EINVAL;
+
+    if ( trace_find_tracer(tracer->name) )
+        return -EEXIST;
+
+    list_add_tail(&tracer->list, &tracer_list);
+
+    return 0;
+}
+
+static void __init initialize_hypfs_trace(void)
+{
+    int rc;
+
+    rc = trace_register_tracer(&nop_tracer);
+    BUG_ON(rc);
+
+    hypfs_string_set_reference(&current_tracer, "");
+    hypfs_string_set_reference(&available_tracers, "");
+    hypfs_string_set_reference(&available_functions, "");
+    hypfs_string_set_reference(&set_function_filter, "");
+    hypfs_string_set_reference(&tracing_on, "");
+    hypfs_string_set_reference(&trace, "");
+
+    hypfs_add_dir(&hypfs_root, &tracing_dir, true);
+    hypfs_add_leaf(&tracing_dir, &available_tracers, true);
+    hypfs_add_leaf(&tracing_dir, &current_tracer, true);
+    hypfs_add_leaf(&tracing_dir, &available_functions, true);
+    hypfs_add_leaf(&tracing_dir, &set_function_filter, true);
+    hypfs_add_leaf(&tracing_dir, &tracing_on, true);
+    hypfs_add_leaf(&tracing_dir, &trace, true);
+}
+
+static int __init cf_check hypfs_trace_init(void)
+{
+    initialize_hypfs_trace();
+
+    return 0;
+}
+__initcall(hypfs_trace_init);
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index a76403af59..352a2df62c 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -26,6 +26,10 @@
 #include <xen/livepatch.h>
 #include <xen/livepatch_payload.h>
 
+#ifdef CONFIG_LIVEPATCH_TRACER
+#include <xen/hypfs_trace.h>
+#endif
+
 #include <asm/alternative.h>
 #include <asm/event.h>
 
@@ -232,6 +236,11 @@ xen_livepatch_trace_dispatcher(unsigned long ip, unsigned long parent_ip)
 
 out:
     rcu_read_unlock(&rcu_payload_lock);
+
+#ifdef CONFIG_LIVEPATCH_TRACER
+    /* Call tracer callbacks. */
+    trace_dispatch_callbacks(ip, parent_ip);
+#endif
 }
 
 #endif /* CONFIG_HAS_LIVEPATCH_TRACE */
diff --git a/xen/include/xen/hypfs_trace.h b/xen/include/xen/hypfs_trace.h
new file mode 100644
index 0000000000..11c4bba491
--- /dev/null
+++ b/xen/include/xen/hypfs_trace.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_HYPFS_TRACE_H__
+#define __XEN_HYPFS_TRACE_H__
+
+#include <xen/init.h>
+#include <xen/list.h>
+#include <xen/livepatch.h>
+#include <xen/symbols.h>
+#include <xen/types.h>
+
+struct payload;
+struct tracer;
+
+/* State tracking the selected tracer and target function */
+struct trace_context {
+    const struct tracer *current_trace; /* Currently selected tracer */
+    struct payload *payload; /* Payload used for uploading tracers */
+    struct livepatch_func *func; /* Target function and tracer's callback address */
+    bool tracing_on; /* Whether callbacks may record events */
+    char filter_name[KSYM_NAME_LEN]; /* Name of the target function */
+};
+
+/* Operations registered by each tracer */
+struct tracer {
+    const char *name; /* Name of the tracer */
+    int (*init)(struct trace_context *tr); /* Called when this tracer is selected */
+    int (*reset)(struct trace_context *tr); /* Called when this tracer is being deselected */
+    int (*start)(struct trace_context *tr); /* Called before recording gets enabled */
+    int (*stop)(struct trace_context *tr); /* Called before recording gets disabled */
+    int (*clear_trace)(struct trace_context *tr); /* Clear recorded events at the user's request */
+    unsigned int (*get_trace_size)(struct trace_context *tr); /* Required output buffer size */
+    size_t (*print_trace)(struct trace_context *tr, char *buf, size_t size); /* Format recorded output */
+    struct list_head list; /* Linked to 'tracer_list' */
+};
+
+int __init trace_register_tracer(struct tracer *tracer);
+
+int trace_register_callback(livepatch_trace_func_t callback);
+int trace_unregister_callback(void);
+void trace_dispatch_callbacks(unsigned long ip, unsigned long parent_ip);
+
+#endif /* __XEN_HYPFS_TRACE_H__ */
-- 
2.34.1


