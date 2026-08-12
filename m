Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4B5C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 01:34:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388720.1629704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtxqq-00056r-K5; Wed, 12 Aug 2026 01:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388720.1629704; Wed, 12 Aug 2026 01:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtxqq-00056j-FR; Wed, 12 Aug 2026 01:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1388720;
 Wed, 12 Aug 2026 01:33:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1wtxqn-00056d-4J
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 01:33:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtxqm-001YjX-7I
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 03:33:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a7bcd6f-bab6-0a2a0a5309dd-0a2a450cdab0-6
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 03:33:47 +0200
Received: from [40.107.74.117]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a7bcd74-f479-0a2a450c0019-286b4a757da2-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 03:33:42 +0200
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30e::6)
 by OSOP286MB4035.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 01:33:36 +0000
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515]) by TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515%3]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 01:33:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDKr78VFXaRwfG6RomMg1nyOEEccmgIFyi6ykrgyK+LkGldrDLjPbQUGvij227RNyuul6AVQUpZ+SldvAli7pCQSgUZHU+MqYMsPx6NbzXRB/AzOWeinAmCZ1jDOSETpanB292zaogqkwIF4QusKmbF90qh5tg80CegwJpCcPI/8m4VFtNaO4V0bKVUEYSzm0zJqOPQtly8WNLa97I3xEndzvDCl9RdFf/bElWyzXVJya49Vr8VTpCM0bIEqoufl4BKAlh1WhDCHYWaorLTvBkO51kRdssTJLjsqkGv7cAX2xX1CJMd5rNCoBkeU0PLIBqnb0YQg75BERxUdGvJrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0GQdb4thSn5vBUqAbO/XA2F59p6uNe+goaa1gaQnNA=;
 b=Du8QA5uN39fiOJgzTR6natTRSlmxV4iIFoE+xXkIB5IES6PLMwC7a9iEzFljzxgYk1W+qKQOsZoAgpFFCOQKZErjtDCGt8BYp1dEv8gM1qBE4GyqcsSnjuTfH2jlwkM11dIbcDbyaPPoihYwCSH7vFYbIpxToiWRhe6l2E5FIKFcTKEFu/JelNFIQLQobCnJz3nVPWFsJvWHDmjItkHYjw43vKPqkR0OQieL9dsL+c/uz24/JZcqegWyD8LQnzaf3lrH+FqvZqM4YKosF1X+yUy9BaeSpmSn+Lc6yuO5vccsicZo1juuuIizbVFcqG2Q68wMDQtRZ3ksy3JZR12eoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0GQdb4thSn5vBUqAbO/XA2F59p6uNe+goaa1gaQnNA=;
 b=hEJVsdjB6ebwovPSbtoVvJzzo5iTX3aYSEjOEvYa7cxnxN5+bEia480f4Kt2z+0EGKT63eyApCUVxC9cJrsDhS/ZO9zEXlYEDTtiyAotFkNiGodsp/KFJOFozvS8qpABuW2srl5/mAk/KJmON0ab9BJ4KozwNePwEAdNePsAdPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	andrew.cooper3@citrix.com,
	taka@valinux.co.jp,
	den@valinux.co.jp,
	okamoto@valinux.co.jp,
	Ryo Takakura <takakura@valinux.co.jp>
Subject: [RFCv2] xen/arm64: livepatch: enable attaching callbacks
Date: Wed, 12 Aug 2026 10:33:18 +0900
Message-Id: <20260812013318.21860-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::18) To TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:30e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYP286MB2946:EE_|OSOP286MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: ded35872-9952-4967-0434-08def811bacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|3023799007|56012099006|6133799003|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	8n7L+jV0+PkOP71f3MDKgF82l1dxmk2oVLqysFDvrruk2Z27kaXjIujpI5O2eaU+qgnDF0x07VWF39wl7AGzzhkBZrBpaWJgVhVrK3Xw7roVfRksSeNwTkeToAHNtrBFi399THc9lDScNvtzSOD04cNo6AJ6sQMUzwbhGfB3ZfQ6IgqoSkJ+AUmM44Bogy/2a9jbZUAP2kXDvHgIu7ecLSQv5pMk88juQzWixUYw/xI+RQKPAoJ4QI4HxcXxoS8SaoUUteF/XDO5uOskVyzQPF1GjObx0ZHh1cuI/qtM04SimoXJXWi4j0HTZwtNATZFbjQbuQJhkjo6hHpr3EAmRMpYSj2NMdzU3H27qXj1SyJFBOL83sn8GMDDuhnEIrCWBbgNg8KrYQrUwhSQEhNr/TVHMDSfnmq5sUAbSQVtrwW+AQPlCxUD+uhGzg+8BtVVtUdv+3G5x3ZReVH53cLLOE/cQOVG6L7D4b8t+sr/N3vxJKtcY3MWXiRUd8i/Z9HS6B1ynqSqwnLIorXViImFV4jouBH/wpF5p+7MYdueJ1xcILHRbQtrKmSKfGS+Oqu+OStEPuD1vtR/yIWdxDRh197bQ2Ee/ae6RkoMh9JqhR1cYjheL8Ts0uG8bvG/4e/F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(3023799007)(56012099006)(6133799003)(5023799004)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xzlt6gxBhejqqw15Y2Wsc5rHnGmnXiPEDjeB7lTYT2d1meDtgukAGe72CIru?=
 =?us-ascii?Q?Kq2ch6B4CzUrU51PTberqZjrchiFv4SdNOqGSA1XEJQU4ZLJbC0eRdnk7ivi?=
 =?us-ascii?Q?cK5Ru0axfI2fAwR5GwXZErgdDuTWfhiPu5u44Wa9S9JJ6QWewUYPlhoEYghr?=
 =?us-ascii?Q?D8iutTEVXCT02XR3mfGttFIFlC75dxOx8+E9b+eckJZo/XNjBM1YaAVXFOhQ?=
 =?us-ascii?Q?7huMOxhjuIHSDoRSEfUCy532sD6y89wbRjUvi7zCTDDCM/gwwyBelM8nvPBt?=
 =?us-ascii?Q?Es0MFYvB9TltO7rwzF47Qh2D76+1In6HjQy54eP7fZjJ3kT8mFOc5lu4osDl?=
 =?us-ascii?Q?/xw3GkUSQmw4SU/XjfUlddDC+yElLLlrxL0H2eHvvlmj+KaNtyfG9bzVulID?=
 =?us-ascii?Q?fMIvrcW1AZsQPh7GZiCl560ZStsliDnfMRXbwKMjHkqqejNjt5zkQJt7rhl/?=
 =?us-ascii?Q?tbZzvSDAATofZtKzu9BR7rL9LbKIHfoa+M7rU9U3b1D8E9ua+bC5Bm+HvAXM?=
 =?us-ascii?Q?8mRHF1JnMbOTB5KLdoHMatRFgcgNxX4WxWViDJlJXbrtQd1QaPDieznUZHVH?=
 =?us-ascii?Q?0SAOW9N3p2FNTVibAalGMXv2WUioiYz/l7JxFX8gM6mz1w7y3t3Ki22sdJiF?=
 =?us-ascii?Q?FGXA7sy/1OOd1ytA1Nn7OFcPt925gtfS+9I8qVDb8kWT4/d1Ydb3HVRkMsZv?=
 =?us-ascii?Q?I7RMtqJgZTxYw9mmQrsL0LMKwipbf6nyckosipbo538cSaLKhGIgunnffl1P?=
 =?us-ascii?Q?0FnqNMPs20reWAoy7WSnPkq20k/aAgmRlMcisYliqKky4kqaqkLNMwGnlz4U?=
 =?us-ascii?Q?8Mvw1nF4CxLycBw8MIhrQvRTbnYJc9yMRyXFgj7FnB34DQiB/Yb0+BBmEn9D?=
 =?us-ascii?Q?IlhVjcUnMX6ovk11nj43seJFlf9DAMUY3+oxD3/Wr2+/xmH43mLBd4EFi11u?=
 =?us-ascii?Q?v7f7nEBGEbV5obkCqeYCkBWPmLP7PLxANX/8wIke3pmTkqUBuc8UPLgVK4vW?=
 =?us-ascii?Q?LiJ9atwTP5dgeEyVO2+oP6N4qcWFXxhfqx0ClNXm0cdank/PLBTNgafP2NzG?=
 =?us-ascii?Q?hu7ADIfK6FpIpscghvgZal5p+la2FcYkgTsJ3ThMQZ0yOVovPYCK+mMBd10E?=
 =?us-ascii?Q?3bLGcyKL0+TQlNXx3DD7w/FTdH2uGovwlbEzHYfY50uJEDNQMe72xhHxzppl?=
 =?us-ascii?Q?MDXON2naGpcE4zuvdZvN6p4qbUAjBKpND6zl5bVr09bW19Fw435K6fl2fAcs?=
 =?us-ascii?Q?C8nZbKJMwylpeY31l4gI1t2fJqLeMjfJmCm2S3FsiIsC7aPfvd49ckclLprn?=
 =?us-ascii?Q?p7LK4OwzAxZL6HNZZicwC+zTlXLrXWL01QmVbSowa3wihxiH/+OPS3egcoyO?=
 =?us-ascii?Q?GZDR2q80QOgbz5me70t9TuO8wshIdXHRJPeSF8FpmIMnvL4DjPFXyDLFweOv?=
 =?us-ascii?Q?XZOjVdmZ8eXapzyP3ov2rilMF/ClHgZ+Dk33QGgLcAg5i8CIQO1hEilqrg2o?=
 =?us-ascii?Q?XCdK2NBNC1f/bHcfuC3dJHqU7CVZG+1baAtO3DIPUB/AsCEnYlkW3XwEt1Z+?=
 =?us-ascii?Q?+RBd2esRwvdqr5xaNhP9/+ilRc3rYqQpTX3oTKMmGvPls6OtUfauu73o256C?=
 =?us-ascii?Q?FKYxQwbnmtXODCfzdE+QcDQVwwTqLPUvBSy78UyB3WRFbCeVpjFbWTbNjd8W?=
 =?us-ascii?Q?/vdyJUsm7nAWGwIeUQhH8ewSSQG2yO+p2grSDXK4UsEp31WORLeRfIjYM5ex?=
 =?us-ascii?Q?LIH2NQVf5g=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ded35872-9952-4967-0434-08def811bacc
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 01:33:36.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcn7MphEFEkQh7iBvkLUShab2abtZelSAYuHDeXjo8v1xUd6KZjiWM9zmppoEVesmnvFu7sNxh31n637jpMJrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB4035
X-purgate-ID: tlsNG-d25034/1786498427-770D9A5B-9AB78FA3/0/0
X-purgate-type: clean
X-purgate-size: 17483

Linux ftrace allows registering callbacks which is useful
for debugging and tracing events. On Linux, it is done by
reserving NOPs at function entry points at compile time
which can later be patched to branch to a trampoline.

This patch introduces similar callback feature adopting
linux-like approach of reserving 2 NOPs at function entry
points. When user requests the feature, the NOPs will be
livepatched as:

     mov     x9, lr
     bl      xen_livepatch_trace_caller

where xen_livepatch_trace_caller serves as a trampoline
for saving original lr of the traced function and other
relevant registers before calling the registered tracing
functions.

The tracing functions are called with arguments of:
ip: ip of the traced function
parent_ip: ip where the traced function was called

One can request the feature by specifying the section
for struct livepatch_func as .livepatch.traces.

Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
---

Hi,

This is a continuation of the previously sent RFC[1].
Thank you Andrew and Roger for the feedback!!

Here are the major updates:
1. Reserve function preamble like Linux using -fpatchable-function-entry=2.
2. No per-callback trampoline generation.
3. Let common code decide whether a patch is a replacement or a preface addition,
   and let arch code provide a handler for each case.

For 2., Andrew suggested avoiding manual generation of trampolines
using the attribute "no_caller_saved_registers". I considered the option
but figured out we still need to save lr before jumping to tracer
function and it requires a trampoline (as far as I understand).
Moreover, the function attribute seems to be only supported on x86...
So I decided to make a common trampoline like linux[2].

Example payload file:

#include <xen/lib.h>
#include <xen/livepatch.h>

static void my_tracer(unsigned long ip, unsigned long parent_ip)
{
    printk("livepatch: do_domctl was called "
           "(ip=%lx, parent_ip=%lx)\n",
           ip, parent_ip);
}

static struct livepatch_func traces[]
    __attribute__((section(".livepatch.traces"))) =
{
    {
        .name = "do_domctl",
        .old_size = 4580,
        .new_addr = my_tracer,
        .version = LIVEPATCH_PAYLOAD_VERSION,
    },
};

I would appreciate any advice or suggestion, Thanks!

Sincerely,
Ryo Takakura

[1] https://lists.xen.org/archives/html/xen-devel/2026-06/msg01442.html
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/entry-ftrace.S#n36

---
 xen/arch/arm/Kconfig                  | 12 ++++
 xen/arch/arm/arch.mk                  |  2 +
 xen/arch/arm/arm64/Makefile           |  1 +
 xen/arch/arm/arm64/insn.c             |  5 ++
 xen/arch/arm/arm64/livepatch-asm.S    | 81 +++++++++++++++++++++++++++
 xen/arch/arm/arm64/livepatch.c        | 30 ++++++++++
 xen/arch/arm/include/asm/arm64/insn.h |  1 +
 xen/common/livepatch.c                | 58 +++++++++++++++++--
 xen/include/xen/livepatch.h           |  8 +++
 xen/include/xen/livepatch_payload.h   |  7 ++-
 10 files changed, 198 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/arm/arm64/livepatch-asm.S

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 843a43897e..8d94232248 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -276,6 +276,18 @@ config PCI_PASSTHROUGH
 	help
 	  This option enables PCI device passthrough
 
+config ARM64_PATCHABLE_FUNCTION_ENTRY
+    bool "Reserve two NOPs at function entry for tracing"
+    depends on ARM_64 && LIVEPATCH && $(cc-option,-fpatchable-function-entry=2)
+    default n
+    help
+      This option compiles Xen with -fpatchable-function-entry=2, which
+      reserves two NOP instructions at the beginning of functions. The NOPs
+      will be livepatched with a branch instruction to tracing function
+      registered by user.
+
+      Enable this to use livepatch tracing feature.
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index dea8dbd18a..e3cad65bef 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -19,6 +19,8 @@ endif
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
 $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
 
+CFLAGS-$(CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY) += -fpatchable-function-entry=2
+
 ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
     $(error You must use 'make menuconfig' to enable/disable early printk now)
 endif
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6491c5350b..7f52b10e66 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -12,6 +12,7 @@ obj-y += entry.o
 obj-y += head.o
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
+obj-$(CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY) += livepatch-asm.o
 obj-y += smc.o
 obj-y += smpboot.o
 obj-$(CONFIG_ARM64_SVE) += sve.o sve-asm.o
diff --git a/xen/arch/arm/arm64/insn.c b/xen/arch/arm/arm64/insn.c
index 6b97a84ba7..dc3ddc6351 100644
--- a/xen/arch/arm/arm64/insn.c
+++ b/xen/arch/arm/arm64/insn.c
@@ -218,6 +218,11 @@ u32 __kprobes aarch64_insn_gen_nop(void)
 	return aarch64_insn_gen_hint(AARCH64_INSN_HINT_NOP);
 }
 
+u32 aarch64_insn_gen_move_reg(uint32_t rd, uint32_t rm)
+{
+    return 0xaa0003e0 | (rm << 16) | rd;
+}
+
 /*
  * Decode the imm field of a branch, and return the byte offset as a
  * signed value (so it can be used when computing a new branch
diff --git a/xen/arch/arm/arm64/livepatch-asm.S b/xen/arch/arm/arm64/livepatch-asm.S
new file mode 100644
index 0000000000..92858bcaa9
--- /dev/null
+++ b/xen/arch/arm/arm64/livepatch-asm.S
@@ -0,0 +1,81 @@
+/*
+ * xen/arch/arm/arm64/livepatch-asm.S
+ *
+ * Trampoline for livepatch tracer.
+ *
+ * Ryo Takakura <takakura@valinux.co.jp>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+/*
+ * If livepatch tracer is enabled, function entries are placed
+ * with two NOPs. Once user requests a functions to be traced,
+ * arch_livepatch_apply_trace() will livepatch those NOPs to:
+ *
+ *     mov     x9, x30
+ *     bl      xen_livepatch_trace_caller
+ *
+ * x9  = traced function's original LR
+ * x30 = traced function + 8
+ */
+FUNC(xen_livepatch_trace_caller)
+        /*
+         * Registers to save/restore:
+         *
+         *   x0-x8          Function arguments
+         *   x9             Original LR
+         *   x29            Original FP
+         *   x30            PC to return
+         */
+        sub     sp, sp, #96
+
+        /* Save function arguments */
+        stp     x0, x1,   [sp, #0]
+        stp     x2, x3,   [sp, #16]
+        stp     x4, x5,   [sp, #32]
+        stp     x6, x7,   [sp, #48]
+        str     x8,       [sp, #64]
+
+        /* Save LR, FP, PC */
+        str     x9,       [sp, #72]
+        str     x29,      [sp, #80]
+        str     x30,      [sp, #88]
+
+        /*
+         * xen_livepatch_trace_dispatcher(ip, parent_ip)
+         *
+         * ip: Instruction pointer of the function being traced.
+         * parent_ip: Instruction pointer of the function which
+         *            called the function being traced.
+         */
+        sub     x0, x30, #8
+        mov     x1, x9
+        bl      xen_livepatch_trace_dispatcher
+
+        /* Restore function arguments */
+        ldp     x0, x1, [sp, #0]
+        ldp     x2, x3, [sp, #16]
+        ldp     x4, x5, [sp, #32]
+        ldp     x6, x7, [sp, #48]
+        ldr     x8,     [sp, #64]
+
+        /* Restore FP, LR, PC */
+        ldr     x29,    [sp, #80]
+        ldr     x30,    [sp, #72]
+        ldr     x9,     [sp, #88]
+
+        /* Restore SP */
+        add     sp, sp, #96
+
+        /* ret x9 */
+        .inst   0xd65f0120
+        sb
+END(xen_livepatch_trace_caller)
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index 39159ba8b5..bb6d8affa2 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -14,6 +14,8 @@
 #include <asm/bitops.h>
 #include <asm/insn.h>
 
+extern void xen_livepatch_trace_caller(void);
+
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state)
 {
@@ -492,6 +494,34 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
     return -EINVAL;
 }
 
+void arch_livepatch_apply_trace(const struct livepatch_func *trace)
+{
+    uint32_t *new_ptr;
+    uint32_t insns[2];
+
+    new_ptr = trace->old_addr - (void *)_start + vmap_of_xen_text;
+
+    insns[0] = aarch64_insn_gen_move_reg(9, 30); /* mov x9, lr */
+    insns[1] = aarch64_insn_gen_branch_imm((unsigned long)trace->old_addr + ARCH_PATCH_INSN_SIZE,
+                                           (unsigned long)xen_livepatch_trace_caller,
+                                           AARCH64_INSN_BRANCH_LINK);
+
+    memcpy(new_ptr, insns, sizeof(insns));
+    clean_and_invalidate_dcache_va_range(new_ptr, sizeof(insns));
+}
+
+void arch_livepatch_revert_trace(const struct livepatch_func *trace)
+{
+    void *new_ptr = trace->old_addr - (void *)_start + vmap_of_xen_text;
+    uint32_t insns[2] = {
+        aarch64_insn_gen_nop(),
+        aarch64_insn_gen_nop(),
+    };
+
+    memcpy(new_ptr, insns, sizeof(insns));
+    clean_and_invalidate_dcache_va_range(new_ptr, sizeof(insns));
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm64/insn.h b/xen/arch/arm/include/asm/arm64/insn.h
index ab290030ab..a83d8de0e4 100644
--- a/xen/arch/arm/include/asm/arm64/insn.h
+++ b/xen/arch/arm/include/asm/arm64/insn.h
@@ -82,6 +82,7 @@ u32 aarch64_insn_gen_branch_imm(unsigned long pc, unsigned long addr,
 				enum aarch64_insn_branch_type type);
 u32 aarch64_insn_gen_hint(enum aarch64_insn_hint_op op);
 u32 aarch64_insn_gen_nop(void);
+u32 aarch64_insn_gen_move_reg(uint32_t rd, uint32_t rm);
 
 /* Wrapper for common code */
 static inline bool insn_is_branch_imm(u32 insn)
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 7515a040ad..6f3c3274ab 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -198,6 +198,37 @@ static const char *cf_check livepatch_symbols_lookup(
     return n;
 }
 
+void xen_livepatch_trace_dispatcher(unsigned long ip, unsigned long parent_ip)
+{
+    const struct payload *data;
+    unsigned int i;
+    const struct livepatch_func *f;
+
+    rcu_read_lock(&rcu_payload_lock);
+
+    list_for_each_entry_rcu ( data, &payload_list, list )
+    {
+        if ( data->state != LIVEPATCH_STATE_APPLIED || !data->is_trace )
+            continue;
+
+        for ( i = 0; i < data->nfuncs; ++i )
+        {
+            f = &data->funcs[i];
+
+            if ( (unsigned long)f->old_addr != ip )
+                continue;
+
+            ASSERT(f->new_addr);
+            ((livepatch_trace_func_t)f->new_addr)(ip, parent_ip);
+
+            goto out;
+        }
+    }
+
+out:
+    rcu_read_unlock(&rcu_payload_lock);
+}
+
 /* Lookup function's old address if not already resolved. */
 static int resolve_old_address(struct livepatch_func *f,
                                const struct livepatch_elf *elf)
@@ -551,6 +582,7 @@ static int check_patching_sections(const struct livepatch_elf *elf)
 {
     unsigned int i;
     static const char *const names[] = { ELF_LIVEPATCH_FUNC,
+                                         ELF_LIVEPATCH_TRACES,
                                          ELF_LIVEPATCH_LOAD_HOOKS,
                                          ELF_LIVEPATCH_UNLOAD_HOOKS,
                                          ELF_LIVEPATCH_PREAPPLY_HOOK,
@@ -688,7 +720,7 @@ static inline int livepatch_check_expectations(const struct payload *payload)
 static int prepare_payload(struct payload *payload,
                            struct livepatch_elf *elf)
 {
-    const struct livepatch_elf_sec *sec;
+    const struct livepatch_elf_sec *func_sec, *trace_sec, *sec;
     const struct payload *data;
     unsigned int i;
     struct livepatch_func *funcs;
@@ -696,7 +728,12 @@ static int prepare_payload(struct payload *payload,
     struct virtual_region *region;
     int rc;
 
-    sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_FUNC);
+    func_sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_FUNC);
+    trace_sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_TRACES);
+
+    sec = trace_sec ? trace_sec : func_sec;
+    payload->is_trace = !!trace_sec;
+
     if ( sec )
     {
         if ( !section_ok(elf, sec, sizeof(*payload->funcs)) )
@@ -721,6 +758,13 @@ static int prepare_payload(struct payload *payload,
                 return -EOPNOTSUPP;
             }
 
+            if ( payload->is_trace && !f->new_addr )
+            {
+                printk(XENLOG_ERR LIVEPATCH "%s: Trace new_addr is NULL\n",
+                       elf->name);
+                return -EINVAL;
+            }
+
             /* 'old_addr', 'new_addr', 'new_size' can all be zero. */
             if ( !f->old_size )
             {
@@ -1460,7 +1504,10 @@ static int apply_payload(struct payload *data)
             continue;
         }
 
-        arch_livepatch_apply(func, state);
+        if ( data->is_trace )
+            arch_livepatch_apply_trace(func);
+        else
+            arch_livepatch_apply(func, state);
         state->applied = LIVEPATCH_FUNC_APPLIED;
     }
 
@@ -1509,7 +1556,10 @@ int revert_payload(struct payload *data)
             continue;
         }
 
-        arch_livepatch_revert(func, state);
+        if ( data->is_trace )
+            arch_livepatch_revert_trace(func);
+        else
+            arch_livepatch_revert(func, state);
         state->applied = LIVEPATCH_FUNC_NOT_APPLIED;
     }
 
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 5dc8c61d37..a893f134e0 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -26,6 +26,7 @@ struct xen_sysctl_livepatch_op;
 #define LIVEPATCH             "livepatch: "
 /* ELF payload special section names. */
 #define ELF_LIVEPATCH_FUNC        ".livepatch.funcs"
+#define ELF_LIVEPATCH_TRACES      ".livepatch.traces"
 #define ELF_LIVEPATCH_DEPENDS     ".livepatch.depends"
 #define ELF_LIVEPATCH_XEN_DEPENDS ".livepatch.xen_depends"
 #define ELF_BUILD_ID_NOTE         ".note.gnu.build-id"
@@ -86,6 +87,11 @@ void arch_livepatch_init(void);
 
 int arch_livepatch_verify_func(const struct livepatch_func *func);
 
+typedef void (*livepatch_trace_func_t)(unsigned long ip,
+                                        unsigned long parent_ip);
+void xen_livepatch_trace_dispatcher(unsigned long ip,
+                                    unsigned long parent_ip);
+
 static inline
 unsigned int livepatch_insn_len(const struct livepatch_func *func,
                                 const struct livepatch_fstate *state)
@@ -120,8 +126,10 @@ void arch_livepatch_revive(void);
 
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state);
+void arch_livepatch_apply_trace(const struct livepatch_func *trace);
 void arch_livepatch_revert(const struct livepatch_func *func,
                            struct livepatch_fstate *state);
+void arch_livepatch_revert_trace(const struct livepatch_func *trace);
 void arch_livepatch_post_action(void);
 
 void arch_livepatch_mask(void);
diff --git a/xen/include/xen/livepatch_payload.h b/xen/include/xen/livepatch_payload.h
index c6dc7cb5fa..3a81abe0de 100644
--- a/xen/include/xen/livepatch_payload.h
+++ b/xen/include/xen/livepatch_payload.h
@@ -52,9 +52,10 @@ struct payload {
     size_t ro_size;                      /* .. and its size (if any). */
     unsigned int pages;                  /* Total pages for [text,rw,ro]_addr */
     struct list_head applied_list;       /* Linked to 'applied_list'. */
-    const struct livepatch_func *funcs;  /* The array of functions to patch. */
-    struct livepatch_fstate *fstate;     /* State of patched functions. */
-    unsigned int nfuncs;                 /* Nr of functions to patch. */
+    const struct livepatch_func *funcs;  /* The array of functions to patch or trace. */
+    struct livepatch_fstate *fstate;     /* State of patched/traced functions. */
+    unsigned int nfuncs;                 /* Nr of functions to patch or trace. */
+    bool is_trace;                       /* Is a trace payload. */
     const struct livepatch_symbol *symtab; /* All symbols. */
     const char *strtab;                  /* Pointer to .strtab. */
     struct virtual_region region;        /* symbol, bug.frame patching and
-- 
2.34.1


