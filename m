Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DD8606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=g0r0d7yG
Received: from list by lists.xenproject.org with outflank-mailman.1458877.1670961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7Gm-0006z9-M4; Fri, 23 Oct 2026 04:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458877.1670961; Fri, 23 Oct 2026 04:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7Gm-0006yy-Id; Fri, 23 Oct 2026 04:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1458877;
 Fri, 23 Oct 2026 04:52:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xK7Gl-0006uW-JX
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7Gl-00FSjJ-0I
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae804-e002-0a2a0a5209dd-0a2a45018318-40
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:42 +0200
Received: from [52.101.125.98]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae817-5984-0a2a45010019-34657d6216d3-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:41 +0200
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TYRP286MB5946.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2f0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 04:52:37 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 04:52:37 +0000
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
 b=hAxf8XsIn5+QdG2sQfi3C9FjG2nKn4SKJS4k2wUUeuUlZFIxltS4iCAQRcd8HnzbAblhZIXMnMT/rJ7DUbsT+QndkKndxLcEIVvbEmYi0wVletVJY+sz7sifzsqWyzlz6PMyg68jeAP+Yi7HpeCLwT0IQGEjUHj+zDRr08IP01LodbHfXQaoNmRui0lIXzQWlKN7R5Tu0PkH2EVecVwCk9JyhFJ3dLF1KILNTQTTlnl9KfwJLK0cMb8eNTbkaZc+FsztmQjHSmC9X9d6DYPzVDksnvVNEE52H0GWL2CO5jRozSB5lT9v+d4f8dONsHjeTdkZS80kl0ANeNf3prc/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7ltYEKX+cKqsvP9h4OtOTgNQtNgp6o3XIpTxvBpIi8=;
 b=HbzLjZ26tRAajMSU+y3GNU7j2cQS4dQGZGm2sr7DUVD3JwDo7UQ/i2NmIKiO9Yq9742YMVJZqyg86Dx797AV5YKdX5dDUrnQiSZ/KbBvVcKlY98IF8kQqFXoxDzM26pF/ADPj5Gfy5Y89CQIE5lCmNHq5ktuQacvD4QVsWwFnSaVxZoZ0OYgmA3lfw6cv2+n2tsmNfPDB9GkfwUWhhJmvnMCIWe6TwB1P6WuwvHJHxLVvQjrH8Td7xJWVFGVYaw+A8D0uNS1TQmVHlA+ZF8Wk+J6Hgpd4BPeJW3IsTmO6zphaSZH9Kytnzlv/4GN+8efnLkBhOgxnbruY/dIZslDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7ltYEKX+cKqsvP9h4OtOTgNQtNgp6o3XIpTxvBpIi8=;
 b=g0r0d7yGMnKbTDI7j6d9QdEW5/w+RrW8lWxo67jyDEBuAjA+ShgH9obADfY6lg8ZARNHWbj92FlqRowp1uTA80vtnYszCS3jjEvdhojcKnOY2cdJWXSeYC6bLUbh9XjBkShsKM127v3EOCY15ibDASU35AXougVneBFk+4MtoPc=
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
	Ryo Takakura <takakura@valinux.co.jp>
Subject: [RFC 1/5] xen/arm64: livepatch: enable attaching callbacks
Date: Fri, 23 Oct 2026 13:52:22 +0900
Message-Id: <20261023045222.163817-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023044809.162759-1-takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::12) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TYRP286MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1247ef-7435-44d3-8283-08df30c1759b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|6133799003|10067099003|18002099003|261021123027099003|22082099003|261022105027099003|3023799007|261022075727099003|261021133027099003|261021130227099003|260925021311599003|260925021911599003|260925022911599003|261021135927099003|261021121427099003|261009223027099003|261022115727099003|261022113327099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BIeYR45+uszKnZ2XZjVnfSfsVNvxU3SAZcsvIPDS4C9cKKL87xPOx3FNNJC9Ra7T1EGZgsVMhxcza5MLfgxrf4uP27hP10vWeaHvGDi7jpIa5vHesA+0gAc4jlWvQyiVtBxc4Vr1GBdUAjswwv3eN22cTdN9Sc36eY/AVVc5n4x/wdI3YoobbGQYyFvSdX8x/4hkPsvSD/EJC2EAIiYCPprOECuCss5w9keld38CC8oHiD9h9oZV7EDXDmuVc4pNmuwIgxPvnJ2sjNvgTG+ogny8tVF6HNuVCPclpoMYa0/lCzy1aH2PGV6QfARwuhrOgwPBnPIUHtBOiADZ07sUWXQEA6wTlR6goedEwK7AnLEOqz0xS+4dkALbFYAgVpT9O3nhqzG/SBVrPhkISwTkrB8DiifEjqQgFQe+wBTiaapbeO1aR1KYBRbJ9ezUo3qg3m9Safe3+FdnzVzjhNw0+xKSrR1ScqUV6XGCFt1KS8SQfRDd2zLUVEGouuZqZR5DT52naai5wXHtSUGnm+Yixw69FJjUtSGuFoIsHDCkWYNB98rvvDhm3kxy7w8d8witHQV9Ztd35uhjdEnAP55xj/AN9+3W9x1OMUIU45K6tpOBwiwj2nE1sdqMlouG6D+4vAUi12SgZuw6cVUfhYQn8LBsId8XRq8B/hQnTDQ8YVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(261021123027099003)(22082099003)(261022105027099003)(3023799007)(261022075727099003)(261021133027099003)(261021130227099003)(260925021311599003)(260925021911599003)(260925022911599003)(261021135927099003)(261021121427099003)(261009223027099003)(261022115727099003)(261022113327099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WZqNCmFqko6fYBtQwSszb07Xq/enqZq3AS/UEXJ7VbpV1xGuqyQmqMb23pKj?=
 =?us-ascii?Q?loH1IgZyNp8+7yfqAXAqhdouMuDXKMktRR8DgbnwVatP7yNuJ8Fx/rq6IhYY?=
 =?us-ascii?Q?teInlSxUIdIKYLF2EkT5U/UAL0qIFOItboUeTfHYPvAJ4pAED5NL1HiCh3Gj?=
 =?us-ascii?Q?BbzdfOOkpnVGJqaENOc4l2XY/BnXJCf8JyH4kA5IeizIyBKvZuEOvYJ9ELe1?=
 =?us-ascii?Q?VoSsHvyoeGJaeujBaTTc39RK5hNvhXcOchZJUXCkZGo0ScJDSEGdOfMpQdcO?=
 =?us-ascii?Q?KRY8WXNa9L0rsis0YcmqAlnOz9V63o0vR53pY3RB+KGi+vaNhOo9wl78w97T?=
 =?us-ascii?Q?cQo2LZX6bnOQyfbmLvqb2zAteTTogmpwKiFZMo2ziRosh/+dDojqtfB/QvxT?=
 =?us-ascii?Q?ECz0OiVNNSF6NzEERKaKjXeS03lcNjTA6SeYdxKwz100ep4IuJjgd00tl0Hx?=
 =?us-ascii?Q?biDgl8+w4NRH1XwrrBRWPPQ6hzpAnl3rfJD60zkqCghgFIKdQmlgPHZ6TDQY?=
 =?us-ascii?Q?+pwiqNXcG6hJYRyPRwE4Fb/mwrwa4xnbqA4Oz/cd3af/pwzaSuq3Oc8XkcCl?=
 =?us-ascii?Q?w89zEsdV8wgAxBtBlrOIy1x54hsYF3YFh1UWIH/pvt6PCxauZn9no6nmUNCi?=
 =?us-ascii?Q?6cInHKkIR/Fn7Z2//8y/KZ7PBztgRUmwddjIYQvkYzFrIqkrPvH5e1bI7hXB?=
 =?us-ascii?Q?NOla9/QMB6RsEottn2l0TfX0zYnzaur4d9D1B6Qs6GkGILZ1FP2YgAKbK4lR?=
 =?us-ascii?Q?g2LbXiO35JAz7w/Xm8QC6ZfbCG35018FicPXRCQ/TLohcnrusCSuTPhLgWpq?=
 =?us-ascii?Q?AE7/LT2or17KgPJFuNs+8pWfbVaarqorRD3xLFH/ArLmpREBnPqre9kTyG+b?=
 =?us-ascii?Q?3CkNFY0S/7koiKihYJ3JsG3EZOlGmQ0hCq7SzV9uvu4WIF9EVk3ZZjv5bqsb?=
 =?us-ascii?Q?fKmU6FJAASZluAWhoedx7KReAoqJJ9fy0GCmZUw3A31X4tRpeoP6MDb01kS8?=
 =?us-ascii?Q?JkWEr2Qr33ow1AN+2SY6M32BSrEvr3EHZjc1bcfGPWr76CIF7R9HakG3WIn1?=
 =?us-ascii?Q?R4Mz5/0/0FwgcTvDqQaiF1sSy44x35TRVRC5qAB7NdojO3ckfUwOqCbaRtEf?=
 =?us-ascii?Q?gZZp/OltV8yUyd73Yx8f0FhTiAO+EQ9/iuPut21ZHuac+tP0IphMVxZeLEKd?=
 =?us-ascii?Q?tqkxf4XzQF3iJn3UEhW9aA06nWAvfKikYXmYZLzTkB8XohngYCvQa09d3WrV?=
 =?us-ascii?Q?qRdo9keYx4AZOArPZ2tr0M5WmG7qYvIc+H+EMnxVmVdKu+4W7Fe0x40D/bcf?=
 =?us-ascii?Q?61k5Z18tZOhOfvNbL/XHi2b4dLxy28SW/lBulsMtHoF7EepxssBscpLe9UTY?=
 =?us-ascii?Q?yU/LFYp9klg3z4361kodJ0uEVNeDwcYkWWyTnYL3byOOA5O7J4gy1g+pJGQ5?=
 =?us-ascii?Q?/EnF5xGXeSNmdQ/rDQxkkjHuGeoC3soU3wSwRKOYWC8FnYo8iA0+sySsiXbV?=
 =?us-ascii?Q?YrtlCb1PTz3u9Iy1k2nSJLJLJiunMtaPHiTJDq3AaX5F/q0yLjGuqXAtS3F5?=
 =?us-ascii?Q?ob/vfYs0eWa6gyV6RwPbl/zGUXNZIfNt5BvZsLz18Gp+yhjNiKGrXs2Wif4c?=
 =?us-ascii?Q?ZW7QdZJwG3wVSKReQ0sKNVIkvhuxW8tdZuAavYiS3Nxv+PUyZ+iKYwnqif0f?=
 =?us-ascii?Q?iPerjlsRat3GGUMKrSsAoJtrpLJtVpIgMFitFO2NxOjteqPjzP5htmKlpqxa?=
 =?us-ascii?Q?pR7m6R02rw=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1247ef-7435-44d3-8283-08df30c1759b
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 04:52:37.0674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hJDebCg+WYZRMeZ5nn1V3AWPX9tkniGm+8HMYql6P1pmWC4OwcYQujBbddB5cINzBtLLGl64A1qaW4XnePAdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5946
X-purgate-ID: tlsNG-d62444/1792731162-1FC69757-54FF4759/0/0
X-purgate-type: clean
X-purgate-size: 15814
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Linux ftrace allows registering callbacks which is useful
for debugging and tracing events. On Linux, it is done by
reserving NOPs at function entry at compile time which
can later be patched with a branch instruction to a trampoline.

This patch introduces similar callback feature adopting
linux-like approach of reserving 2 NOPs at function entry.
When user requests the feature, the NOPs will be livepatched with:

     mov     x9, lr
     bl      xen_livepatch_trace_caller

where xen_livepatch_trace_caller serves as a trampoline
for saving registers before calling callback functions.

Callback functions receive two arguments:

  ip: Address of the traced function
  parent_ip: Address where the traced function was called

One can request the feature by specifying the section
for struct livepatch_func as .livepatch.traces.

Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
---
 xen/arch/arm/Kconfig                  | 13 +++++
 xen/arch/arm/arch.mk                  |  3 ++
 xen/arch/arm/arm64/Makefile           |  1 +
 xen/arch/arm/arm64/insn.c             |  5 ++
 xen/arch/arm/arm64/livepatch-asm.S    | 68 +++++++++++++++++++++++++++
 xen/arch/arm/arm64/livepatch.c        | 34 ++++++++++++++
 xen/arch/arm/include/asm/arm64/insn.h |  1 +
 xen/common/Kconfig                    |  3 ++
 xen/common/livepatch.c                | 68 +++++++++++++++++++++++++--
 xen/include/xen/livepatch.h           |  8 ++++
 xen/include/xen/livepatch_payload.h   |  7 +--
 11 files changed, 205 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/arm64/livepatch-asm.S

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index b9c5c40678..37fdbcc416 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -286,6 +286,19 @@ config PCI_PASSTHROUGH
 	help
 	  This option enables PCI device passthrough
 
+config ARM64_PATCHABLE_FUNCTION_ENTRY
+    bool "Reserve two NOPs at function entry for tracing"
+    depends on ARM_64 && LIVEPATCH && $(cc-option,-fpatchable-function-entry=2)
+    select HAS_LIVEPATCH_TRACE
+    default n
+    help
+      This option compiles Xen with -fpatchable-function-entry=2, which
+      reserves two NOP instructions at the beginning of functions. The NOPs
+      will be livepatched with a branch instruction to callback functions
+      registered by user.
+
+      Enable this to use livepatch tracing feature.
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index dea8dbd18a..940f1217c4 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -19,6 +19,9 @@ endif
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
 $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
 
+# Reserve entries for livepatch tracing
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
index 0000000000..4f94e791a3
--- /dev/null
+++ b/xen/arch/arm/arm64/livepatch-asm.S
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/arm64/livepatch-asm.S
+ *
+ * Trampoline for livepatch tracer.
+ *
+ * If livepatch tracer is enabled, function entries are placed
+ * with two NOPs. arch_livepatch_apply_trace() will be livepatching
+ * those NOPs to:
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
+         * ip: Address of the traced function.
+         * parent_ip: Address where the traced function was called.
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
index 39159ba8b5..17753f4463 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -14,6 +14,10 @@
 #include <asm/bitops.h>
 #include <asm/insn.h>
 
+#ifdef CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY
+extern void xen_livepatch_trace_caller(void);
+#endif
+
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state)
 {
@@ -492,6 +496,36 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
     return -EINVAL;
 }
 
+#ifdef CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY
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
+#endif /* CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY */
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
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b289e444f..7cf6937c2f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -605,6 +605,9 @@ config TRACEBUFFER
 	  to be collected at run time for debugging or performance analysis.
 	  Memory and execution overhead when not active is minimal.
 
+config HAS_LIVEPATCH_TRACE
+	bool
+
 config LLC_COLORING
 	bool "Last Level Cache (LLC) coloring" if EXPERT
 	depends on HAS_LLC_COLORING
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 7515a040ad..70f601846f 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -198,6 +198,41 @@ static const char *cf_check livepatch_symbols_lookup(
     return n;
 }
 
+#ifdef CONFIG_HAS_LIVEPATCH_TRACE
+void __attribute__((patchable_function_entry(0, 0)))
+xen_livepatch_trace_dispatcher(unsigned long ip, unsigned long parent_ip)
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
+            ((livepatch_trace_func_t)f->new_addr)((unsigned long)f->old_addr, parent_ip);
+
+            goto out;
+        }
+    }
+
+out:
+    rcu_read_unlock(&rcu_payload_lock);
+}
+
+#endif /* CONFIG_HAS_LIVEPATCH_TRACE */
+
 /* Lookup function's old address if not already resolved. */
 static int resolve_old_address(struct livepatch_func *f,
                                const struct livepatch_elf *elf)
@@ -551,6 +586,9 @@ static int check_patching_sections(const struct livepatch_elf *elf)
 {
     unsigned int i;
     static const char *const names[] = { ELF_LIVEPATCH_FUNC,
+#ifdef CONFIG_HAS_LIVEPATCH_TRACE
+                                         ELF_LIVEPATCH_TRACES,
+#endif
                                          ELF_LIVEPATCH_LOAD_HOOKS,
                                          ELF_LIVEPATCH_UNLOAD_HOOKS,
                                          ELF_LIVEPATCH_PREAPPLY_HOOK,
@@ -696,7 +734,14 @@ static int prepare_payload(struct payload *payload,
     struct virtual_region *region;
     int rc;
 
-    sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_FUNC);
+#ifdef CONFIG_HAS_LIVEPATCH_TRACE
+    sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_TRACES);
+    payload->is_trace = !!sec;
+
+    if ( !sec )
+#endif
+        sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_FUNC);
+
     if ( sec )
     {
         if ( !section_ok(elf, sec, sizeof(*payload->funcs)) )
@@ -721,6 +766,13 @@ static int prepare_payload(struct payload *payload,
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
@@ -1460,7 +1512,12 @@ static int apply_payload(struct payload *data)
             continue;
         }
 
-        arch_livepatch_apply(func, state);
+#ifdef CONFIG_HAS_LIVEPATCH_TRACE
+        if ( data->is_trace )
+            arch_livepatch_apply_trace(func);
+        else
+#endif
+            arch_livepatch_apply(func, state);
         state->applied = LIVEPATCH_FUNC_APPLIED;
     }
 
@@ -1509,7 +1566,12 @@ int revert_payload(struct payload *data)
             continue;
         }
 
-        arch_livepatch_revert(func, state);
+#ifdef CONFIG_HAS_LIVEPATCH_TRACE
+        if ( data->is_trace )
+            arch_livepatch_revert_trace(func);
+        else
+#endif
+            arch_livepatch_revert(func, state);
         state->applied = LIVEPATCH_FUNC_NOT_APPLIED;
     }
 
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 5dc8c61d37..ae34c938d6 100644
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
+                                       unsigned long parent_ip);
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


