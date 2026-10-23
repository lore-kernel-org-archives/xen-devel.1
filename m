Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0123E606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=jGQB/OGf
Received: from list by lists.xenproject.org with outflank-mailman.1458923.1670997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7MN-0001XA-3y; Fri, 23 Oct 2026 04:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458923.1670997; Fri, 23 Oct 2026 04:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7MN-0001X3-19; Fri, 23 Oct 2026 04:58:31 +0000
Received: by outflank-mailman (input) for mailman id 1458923;
 Fri, 23 Oct 2026 04:58:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xK7ML-0001Vg-Ek
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:58:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7MK-004lKN-Rm
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:58:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae96c-8faa-0a2a0a5109dd-0a2a4507bf10-8
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:58:28 +0200
Received: from [52.101.228.79]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae972-b4ea-0a2a45070019-3465e44f08f5-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:58:28 +0200
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TYYP286MB5665.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:295::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 04:58:22 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 04:58:21 +0000
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
 b=E+dj1esqJJFrUPP9yd6LpRA4OnidB04JDaYWQFpTTpLR4pxjxYKKZ6GmOo0TFYalLyfXdMbe8fjXDgwieA/v764r/26517ItxO7NobmlKgBNPjWG5ja7vpjSSaaBbLXougpV7cFmBb6qVwfXzRyHAdl1sAFrYkpOi/DlWX+Tde8AkxPd/7fGYoh7OfUQCPOfBsdUJgCeqwRA/mqsqjjC7SDjhiXYLlQFISzYaeH2SNAtivZROnPBmnenp1+m5d0c1Qk0bm15CjJk04GJfS1JtBsEFPRonZFrokikU7WXrDG6rh8IBlgfGoshZB9GOyXC9/l2Zfb2umTCLKdnfBlbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlKIeSunT1jOHyfhh+rhjOJdcYlWVJgHKK+gdl4jasA=;
 b=cXXVvr4QzT4SqdvSuI7MxlMU9DLQP00OJW2OcRmkfleHL/BpJZmUsVoueFhz/SZ1zFsIkFq/OvL0Xi6lTgk4denuQDONU8e8FID7lNxg+p+l53byenjkJRDNkxrMAd99b8hhU6UKhfQS1kVo2FfqrdowzpzSLVFvyJfLu5DCpbyM7nugYZSAkgPXP+uFjVWQ2F/PqHkmoQekBYjK2oLqCHNUAuWdHqvGSSCSxAUND2duHQLar9t0t/TZLj2hBTwShW4wBl0iFg1hkwDS/MQRtWefTjw1kXKTlO77BDNH3crCo8HDTv5YQhKl8empmB/RC5jTz1WOmI51D7yDH/7VJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlKIeSunT1jOHyfhh+rhjOJdcYlWVJgHKK+gdl4jasA=;
 b=jGQB/OGfk0Gvr5sdu1CrAh3VUBxoRFhtO/XBBSydO2rqHoUHwkZ+hw+CIZo3DnRdz9lY7r5F4niEdvSicu7nysMwgvKex3Ogg0jr5Bmx5QPDUWJ91mZSZCWCSuwI3pRnRJT9xkrkB9NZ/PWsIOJLIr02ADbtwpTYR8HZE0/MVVg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: roger@xenproject.org,
	ross.lagerwall@citrix.com,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	teddy.astie@vates.tech,
	Ryo Takakura <takakura@valinux.co.jp>
Subject: [RFC 5/5] xen/x86: livepatch: enable attaching callbacks
Date: Fri, 23 Oct 2026 13:58:08 +0900
Message-Id: <20261023045808.165276-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023044809.162759-1-takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0169.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::12) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TYYP286MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 487dcbf5-bfa3-4399-7c81-08df30c242e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|3023799007|10067099003|5023799004|261009223027099003|261021123027099003|261022115727099003|261022113327099003|261021135927099003|261021121427099003|261022075727099003|261021133027099003|261021130227099003|261022105027099003|56012099006|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	QH2In2uHRTEs9GYp84KyKDtTL3lGi9Vqjv4w1EFWZ+s3z+ea77b/y9Yo7qf0ItTwpUiuE7KbF48Ovxggk7C5dBOjvF3NXURDrWqFVT0ZrytO2X3SjtiAWX+LmsonJ7ePgloR5dJKJbE+IIaw+O51EKa29VVgD2vTlIIX4jcoor8L8uIWB19YtuIUQuYASZLncCfWUPCaGh9n8uFAmQSlRgWpdtQDmRkal3bjxq8AgCLoBJkFUiKJojteWelTZ6lffArqx1XpMpJzhGJAQBz6V0paUZ5HkuGwcy3jRXuwFrkv6dmv6u8fmAzzo0XzfZEDItafkQaif1cFKE84Dr3Xj8lYkV0aP2dA+VRBvJUSuuaYD7tEJbnvaDEEVck4/9FgQh9gFILX8f6cRkSbF7oVOuDtZvTUqMq1HYtPHDLla2QdQ7envFu3/FmYh32srl6tFMdLUzJa/tvPxEbqf1KJmLAQRV600n6W/CSCGpZEZptokt2EIvUdM/ZNtY8FVCdAQ6OsdoSvMTdI6BqXe2Xjeim+/tNliOm82NEOEkwZyEf/lIkUzc/zG3H9k/q4J8jpPE9++5KlUm4hWnvND1V58MS7+dKTHRYmPaTZ3Mp7Frc4TpXG0S7MFZ5kSS7Lg2qdsJ2vGncKkpYaWebiRqFUpJOVN4sZUh1Z4dgUdPR5mAs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(10067099003)(5023799004)(261009223027099003)(261021123027099003)(261022115727099003)(261022113327099003)(261021135927099003)(261021121427099003)(261022075727099003)(261021133027099003)(261021130227099003)(261022105027099003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jOKD2MKU1bu7vHg76AmZDNBghNg9I9AZT1XKOmlNieYuPFEaj50+Uy6LTTL5?=
 =?us-ascii?Q?ZyuafUqjbDfK4vk617FYCGlruRZhBPxcUP1GyInlYS+fAZkLd68ZGKnm2nEB?=
 =?us-ascii?Q?ZTVaiy5Sifj3yCfG2DIKiXtXGjJoF4lxVHv0ylcDzsLbaaNjqdyQ1bejg0oe?=
 =?us-ascii?Q?mTualmYczU2N1mxoAi4UDexAbPZDtmgntHKQD8JBFUMNGYDhTIQTFJJtGzOk?=
 =?us-ascii?Q?uPOLccz63jWEUks10023dq5+/x2A0NU2yUULtJUEw0VJ7ml8JPAEUeJ0E4Lx?=
 =?us-ascii?Q?Qf8dbfpBwhQA56AfrpJiR5YWk2YxxLvG6lTXr2VEboXSoX6PEShsibuLFokC?=
 =?us-ascii?Q?AVeczsNFDDs0Ok7wAg+h6K7mduJkoUuhQz1SN1RpUo1cEXxVgd66NHl5uBtN?=
 =?us-ascii?Q?m/l4C2EZWzwAVBqYsftevXTgyixIQRabTsQQwCettXCS/Qr7shNxZQaBMlua?=
 =?us-ascii?Q?Xo4/0iGlWzWBUnPTXHr5d+6l3GWrOH/TRu7TifQiOLYnt6igsxhnDNptggro?=
 =?us-ascii?Q?CJtRie2JLO1z7tmKS3cpck7X28G4NmBJaahSj31LCzTe0T+9HTLDWGItawR8?=
 =?us-ascii?Q?JPsEveSWcwUTEqeKUsx0MFWK2RuVpPeKaavT/V1/dg0bF2ZF0UqIoyXrSr/0?=
 =?us-ascii?Q?I+D91Mw7xQUUZ3tMp5ucx3Rj3QuHB9L8UqyR8/ynjZcm4iHOVZlgBy1hqeUT?=
 =?us-ascii?Q?xXhuJq4Kwmu9/64TKHyjzT69E0MYuv4qTLVpNd+w4TGe83fl2wPEkZy7takI?=
 =?us-ascii?Q?PPHw3g+G0X07exZIwtvV+qO+jSdVw5cPOBWHepO+fHShVb1Yyq51djaW1Mpe?=
 =?us-ascii?Q?AUsU5SP2PdehVAGQaP+FcQvLTx4u2lA022c6pJm/GGGS+DooG50Um6/eKxT/?=
 =?us-ascii?Q?3QAK7Y6ldcZN7VJqOCTCmsMwfjtkutNHD8I93NgZ+oq2a5Z00BjUZ7VzRl5p?=
 =?us-ascii?Q?YZCC0N6XJnqcP7RmVfkLpD9BztTxiUcPM0x2UzKanExv3ollUkN5kbWtu4pq?=
 =?us-ascii?Q?oIGqYJOCcqSSi0Vr6L7fCE4tEJL1SWNh18X2yHDSYqQcfj27VTkBqbgY45dP?=
 =?us-ascii?Q?5ffIwW0n5BuFFRIEfSpJYS3x7uJDz0mHjrv2BCLO83EKYbd5q0PjjYj6Htr9?=
 =?us-ascii?Q?ebd/bD4eHxQIKrUTr1caOok9ZjbLOYOZrd2c6yJoFXuzhhMPzTpuatfw4pcv?=
 =?us-ascii?Q?+1jtBSeqrhIN9lN8JLSJNylzobG+GxZ3v4WQY1C/gLmRWPX5tGORVCu5+H9M?=
 =?us-ascii?Q?6HK9OMTmHfq95mtoKkP2QjNjeClareGJdKZR54w7tJFoQPAUOVIwF4C3olfq?=
 =?us-ascii?Q?66O21MiHI2M62WWcOn7Q2qAkn+Z3Me68mikFfeJvLKtrwYpKemFmjrW0T2//?=
 =?us-ascii?Q?PQ5i+37q5iBGzxzvUjO+3CZ59xyWZgktpC8qDGIHPkCh1nU5/gkrUJd7gKEU?=
 =?us-ascii?Q?ZhwTdWrUdWgnBuu7oqH6PCYApAaQpd58USkJp3/v8/NyDr6wXe3wVCZA69h9?=
 =?us-ascii?Q?qQA2A4xjSwmMCJBj6lzF4PdKzj1g63GfDz4DojNDNAduLTmjhD0e2ZpatGYl?=
 =?us-ascii?Q?KQO4Td4Mg8J4nkbnrwhqZIxMLn13xnC4Pv52pzOc+MS9XmOURmm3QPLxqk8A?=
 =?us-ascii?Q?zoBmFu0+ffs1B5AjsQoaunuMJw21oXvThsh/innS4JMBCAjLNtLfH21z9ZJt?=
 =?us-ascii?Q?U03zG3f4kNaFRBIT1I0hmCJ4Q+CRYf4OJ8EGVBv+iHYBVEFTtk1QOZod3FUL?=
 =?us-ascii?Q?OIxXhVxpCA=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 487dcbf5-bfa3-4399-7c81-08df30c242e5
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 04:58:21.4674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k21OgQlIRV8XNNNgPZOfEjxDKF1ZUUXke2HPyAFav/RX7WPy730Qb4+HhMAQL1DuvPb1i2noey+jKbwgn9Eejg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5665
X-purgate-ID: tlsNG-ef75cf/1792731508-358C1AE4-F122782A/0/0
X-purgate-type: clean
X-purgate-size: 9681
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add x86 support for attaching callbacks following
the ARM64 implementation.

It reserves function entry(5 NOPs) and replaces them with:

    call    xen_livepatch_trace_caller

xen_livepatch_trace_caller serves as a trampoline for saving
registers before calling xen_livepatch_trace_dispatcher where
callbacks are invoked. Callbacks receive:

    ip: Address of the traced function
    parent_ip: Address where the traced function was called

One can request the feature by specifying the section
for struct livepatch_func as .livepatch.traces.

This patch will also let x86 use the livepatch tracer.

Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
---
 xen/arch/arm/arm64/livepatch.c |  5 +++
 xen/arch/x86/Kconfig           | 13 ++++++++
 xen/arch/x86/Makefile          |  1 +
 xen/arch/x86/arch.mk           |  3 ++
 xen/arch/x86/livepatch-asm.S   | 60 ++++++++++++++++++++++++++++++++++
 xen/arch/x86/livepatch.c       | 33 +++++++++++++++++++
 xen/arch/x86/xen.lds.S         |  5 +++
 xen/common/hypfs_trace.c       |  4 ++-
 xen/common/livepatch.c         |  2 +-
 xen/include/xen/livepatch.h    |  1 +
 10 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/livepatch-asm.S

diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index 17753f4463..b4ae381ef5 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -497,6 +497,11 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
 }
 
 #ifdef CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY
+unsigned long arch_livepatch_trace_entry(unsigned long addr)
+{
+    return addr;
+}
+
 void arch_livepatch_apply_trace(const struct livepatch_func *trace)
 {
     uint32_t *new_ptr;
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index e5535ac484..bfb6a4d78e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -355,6 +355,19 @@ config MICROCODE_SCAN_DEFAULT
 	  Enable if you have a Linux-based dom0 with microcode attached to the
 	  initramfs.
 
+config X86_PATCHABLE_FUNCTION_ENTRY
+	bool "Reserve five NOPs at function entry for tracing"
+	depends on LIVEPATCH && $(cc-option,-fpatchable-function-entry=5)
+	select HAS_LIVEPATCH_TRACE
+	default n
+	help
+	  This option compiles Xen with -fpatchable-function-entry=5, which
+	  reserves five NOP instructions at the beginning of functions. The NOPs
+	  will be livepatched with a branch instruction to callback functions
+	  registered by user.
+
+	  Enable this to use livepatch tracing feature.
+
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 2be90ea098..06b39b7530 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += io_apic.o
 obj-y += irq.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
+obj-$(CONFIG_X86_PATCHABLE_FUNCTION_ENTRY) += livepatch-asm.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index cd0602a79a..31af1a15c4 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -129,6 +129,9 @@ endif
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(objtree)/include -Wa,-I$(srctree)/include
 
+# Reserve entries for livepatch tracing
+CFLAGS-$(CONFIG_X86_PATCHABLE_FUNCTION_ENTRY) += -fpatchable-function-entry=5
+
 # The GNU assembler will interpret '/' as a comment start marker instead of a
 # divide for some ELF targets.  Pass --divide when when available to signal '/'
 # is always used as an operator in assembly.
diff --git a/xen/arch/x86/livepatch-asm.S b/xen/arch/x86/livepatch-asm.S
new file mode 100644
index 0000000000..005765b476
--- /dev/null
+++ b/xen/arch/x86/livepatch-asm.S
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <asm/asm_defns.h>
+
+        .text
+
+/*
+ * xen/arch/x86/livepatch-asm.S
+ *
+ * Trampoline for livepatch tracer.
+ *
+ * If livepatch tracer is enabled, function entries are placed
+ * with five NOPs. arch_livepatch_apply_trace() will be livepatching
+ * those NOPs to:
+ *
+ *     CALL      xen_livepatch_trace_caller
+ *
+ * 0(%rsp): traced function + 5
+ * 8(%rsp): return address to the traced function's caller
+ */
+FUNC(xen_livepatch_trace_caller)
+        pushq   %rbp
+        movq    %rsp, %rbp
+        pushfq
+
+        /* Preserve general-purpose registers. */
+        pushq   %rax
+        pushq   %rcx
+        pushq   %rdx
+        pushq   %rsi
+        pushq   %rdi
+        pushq   %r8
+        pushq   %r9
+        pushq   %r10
+        pushq   %r11
+
+        /*
+         * xen_livepatch_trace_dispatcher(ip, parent_ip)
+         *
+         * ip: Address of the traced function.
+         * parent_ip: Address where the traced function was called.
+         */
+        movq    8(%rbp), %rdi
+        subq    $5, %rdi
+        movq    16(%rbp), %rsi
+        call    xen_livepatch_trace_dispatcher
+
+        /* Restore the saved state. */
+        popq    %r11
+        popq    %r10
+        popq    %r9
+        popq    %r8
+        popq    %rdi
+        popq    %rsi
+        popq    %rdx
+        popq    %rcx
+        popq    %rax
+        popfq
+        popq    %rbp
+        ret
+END(xen_livepatch_trace_caller)
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 5158e91f7e..1dfcc3e750 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -19,6 +19,10 @@
 #include <asm/nmi.h>
 #include <asm/setup.h>
 
+#ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
+extern void xen_livepatch_trace_caller(void);
+#endif
+
 static bool has_active_waitqueue(const struct vm_event_domain *ved)
 {
     /* ved may be xzalloc()'d without INIT_LIST_HEAD() yet. */
@@ -365,6 +369,35 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
     return modify_xen_mappings(start, start + pages * PAGE_SIZE, flag);
 }
 
+#ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
+unsigned long arch_livepatch_trace_entry(unsigned long addr)
+{
+    if ( (is_endbr64((const void *)addr) || is_endbr64_poison((const void *)addr)) )
+        addr += ENDBR64_LEN;
+
+    return addr;
+}
+
+void noinline arch_livepatch_apply_trace(const struct livepatch_func *trace)
+{
+    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
+    const void *new_addr = xen_livepatch_trace_caller;
+    uint8_t insn[ARCH_PATCH_INSN_SIZE];
+    int32_t val = new_addr - (site + ARCH_PATCH_INSN_SIZE);
+
+    insn[0] = 0xe8; /* CALL rel32. */
+    memcpy(&insn[1], &val, sizeof(val));
+    memcpy(site, insn, sizeof(insn));
+}
+
+void noinline arch_livepatch_revert_trace(const struct livepatch_func *trace)
+{
+    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
+
+    memset(site, 0x90, ARCH_PATCH_INSN_SIZE);
+}
+#endif
+
 void __init arch_livepatch_init(void)
 {
     void *start, *end;
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8f943e11ea..1f7d052c30 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -126,6 +126,11 @@ SECTIONS
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
+       . = ALIGN(8);
+       __start_patchable_function_entries = .;
+       KEEP(*(__patchable_function_entries))
+       __stop_patchable_function_entries = .;
+
 #if defined(BUILD_ID) && defined(EFI) && !defined(BUILD_ID_EFI)
 /*
  * No mechanism to put an PT_NOTE in the EFI file - so put
diff --git a/xen/common/hypfs_trace.c b/xen/common/hypfs_trace.c
index d9e06e092e..314cce09bc 100644
--- a/xen/common/hypfs_trace.c
+++ b/xen/common/hypfs_trace.c
@@ -141,7 +141,7 @@ void trace_dispatch_callbacks(unsigned long ip, unsigned long parent_ip)
     if ( !global_trace_func.old_addr )
         return;
 
-    if ( (unsigned long)global_trace_func.old_addr != ip )
+    if ( arch_livepatch_trace_entry((unsigned long)global_trace_func.old_addr) != ip )
         return;
 
     callback = global_trace_func.new_addr;
@@ -194,6 +194,8 @@ static bool is_patchable_function_entry(unsigned long addr)
 {
     const unsigned long *p;
 
+    addr = arch_livepatch_trace_entry(addr);
+
     for ( p = __start_patchable_function_entries;
           p < __stop_patchable_function_entries; p++ )
     {
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 352a2df62c..295a3ebd57 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -224,7 +224,7 @@ xen_livepatch_trace_dispatcher(unsigned long ip, unsigned long parent_ip)
         {
             f = &data->funcs[i];
 
-            if ( (unsigned long)f->old_addr != ip )
+            if ( arch_livepatch_trace_entry((unsigned long)f->old_addr) != ip )
                 continue;
 
             ASSERT(f->new_addr);
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 1b927af8ee..0e5af5fdc5 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -130,6 +130,7 @@ void arch_livepatch_apply_trace(const struct livepatch_func *trace);
 void arch_livepatch_revert(const struct livepatch_func *func,
                            struct livepatch_fstate *state);
 void arch_livepatch_revert_trace(const struct livepatch_func *trace);
+unsigned long arch_livepatch_trace_entry(unsigned long addr);
 void arch_livepatch_post_action(void);
 
 void arch_livepatch_mask(void);
-- 
2.34.1


