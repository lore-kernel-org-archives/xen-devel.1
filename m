Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E21606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 07:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Wj3YOXdA
Received: from list by lists.xenproject.org with outflank-mailman.1461890.1672903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLc01-0007rS-Na; Tue, 27 Oct 2026 07:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461890.1672903; Tue, 27 Oct 2026 07:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLc01-0007rL-Kn; Tue, 27 Oct 2026 07:53:37 +0000
Received: by outflank-mailman (input) for mailman id 1461890;
 Tue, 27 Oct 2026 07:53:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLbzz-0007rD-T7
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 07:53:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLbzy-0035Jz-Qf
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:53:34 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae05874-8faa-0a2a0a5109dd-0a2a4507d4c6-34
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:53:34 +0100
Received: from [52.101.43.4]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae0587d-b4ea-0a2a45070019-34652b042dd0-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:53:34 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by SN7PR03MB7034.namprd03.prod.outlook.com
 (2603:10b6:806:32e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:53:30 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:53:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tq0sY4dCEfFKLYVb0tRP/CEoaFQEsDlkpa99R/9cXykjdtpFYUu4cy2ble0se0ZssuhhMMzz32JYbTgY2lsa04sKz/t6soq/79QZ5B40PixFLSM0xMBa3/7oB+DrqQKBNQfrhEhzLMhmGjMR1MrqVlWsvFzLVRyY2oIecwliHW8glrKbjSh7TzQdfTKnGhz7lWyDoC9P3ziyPK1R3PS5zomnHDL+ScD9IXityTkLWMiP/L8PDzpviqdNUixJ0xWVV5PPOm35JehxmmG37uXz7KSeZ7ZesGVWB+mb6OHKAv54k0iZZelukG/k3C03nz4Iwphdca1eiQr+a70KrLaCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r041lpjHkU0V4ON9JHKWLIN1qB0Kz/prrrf3gRWQr00=;
 b=bwdVgyfyrIaivl0zrbDNci3Ueb2kbJ7qUOZP8JUsJ0QnfsVwumFQo1M0/IP0YDk4b+dMiJiO3vGzkGS78zAG7Vq/KjgYJChvbR/eZgLGGXZqwR6hMO7mWEOThWTlNyeOQzlpch/FzUHujwV9E3orqfg+UHhOQDh7FkdI7yzPVLTn/02ShqCRwGyGimWt7MvfyrG8u82L5NU4YgOcnZLXQe5C9XrbTs2vv8gOXbWx7lxoeMD+Dw0xlX926r7FpXLsCu/Yx8VXz9AHdp3KsS9KeJ0maAVLrTmI5S+XnX/Zd+/HAJme0JdZWcnaNd19lJ7PESu8n1fZj04cnKAEkklB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r041lpjHkU0V4ON9JHKWLIN1qB0Kz/prrrf3gRWQr00=;
 b=Wj3YOXdAhq47gNvq6+lYTqVtLUDctiWE4qLarhY9n+xwTr342qi/1IkddSSdMaKzNF/gB80JxhzzGmgaXtCI/dzS+ttvTsPgfABIz5MbNxHX7N6bI+/rILBupJu1YmOaV4hoaveGw/62vn69a5XsoSGYM2Yy0zTKUdw1DuJynHc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: teddy.astie@vates.tech
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tsczsss,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2] x86/nestedsvm: Expose SpecCtrl to L1 when L0 virtualises MSR_SPEC_CTRL
Date: Tue, 27 Oct 2026 15:53:17 +0800
Message-Id: <20261027075317.38284-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1792508477.8631fc262581453bbf619ec5b2062170.1a159d4bf40000f79f@vates.tech>
References: <1792508477.8631fc262581453bbf619ec5b2062170.1a159d4bf40000f79f@vates.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0151.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cd::10)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|SN7PR03MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e35aa56-8463-4a6e-d2f8-08df33ff63bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261009223027099003|261021123027099003|261022105027099003|261021121427099003|10067099003|56012099006|261026121527099003|6133799003|22082099003|18002099003|5023799004|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	ftXorj0WnS1PJfV7XAC/pp+BZmapletdizPYACCNN8hb6C1a5ZW+wIth5IR6lLh8rsnImekIb3mHfUf2/E4nfZIt3+x2qmDXpyIwN/2hAvRsHVzlrZxCEIB/sPQq5n/8mHcflvrPp2TJ1a90w9GeDe3fzgf6mgqlK2W6BQ7Ge1Tm+L36BmnLM/6l7VHL758+dvFbO1BmHbAW/SxOyOIVYQtqvUyDJbedP+LwR9CAWhFeaO2Ol8SXky8fVUS4KdOfpgDF2Lcgl5AHapR8yzKiJ+f1YFFVaFiUfLd0tc6pofMH9INNSkmtJ1djSEdMPBXK+qe4MVPCjgp9QUWvl8xqnYHWkNwYvxcogZ4uLQELwmoyqTNbY7mG10pn66+lc0sGettUHvZQyA0RRgpzL5PPMyt3bPp0qgFXhsGbGvuVlMd5h1jN8Gd+IdjBI09+d/RntLPf6tEKIRjyF5aTFLBwI9iIPLe/Y2ndZOej/Rnando+cJLwNsj2akYhZcUTZ+LKMuhyVV3bpKoYVTvhAo0OjCMJ1rPTfPRH/objFNiwrTqByZQuW8ZmmB9HF/O9/MpHX209m+/4zVjNsDyGye1GGJflRWqfd7HR9W1ul0Cjjs1bb8Xb2as8GO7IdcLTZ/lpoA2IPsEfYvigBUF3FWzxeWXjIumVhEFlNYtdpg8q4EI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003)(56012099006)(261026121527099003)(6133799003)(22082099003)(18002099003)(5023799004)(11063799006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sBs1L24qlrTh7wJFN/PkfpIGOXjB6fGqV9MbIMaQ2GWY/BTEA8Y0HNFNPu+L?=
 =?us-ascii?Q?EDeHBc0Yutlqkwg/iCnzFi5OhLWN5S4PIO0yOkIPac9KdIRlKwrsq2SVi+zZ?=
 =?us-ascii?Q?qlZm9oiSBM9zjtn586IFcc6BYZscAYpd9NQONu+/pauP5UUTPZqFm4H9bnat?=
 =?us-ascii?Q?kz+ExvS7CvCuYZ4oRHB4vRHqDGNLJcpd0qaPXZuU2Ts8TcbEnR7KP3Dnv9Zs?=
 =?us-ascii?Q?JFl1GagzGcoVDTpwtbWW2snwQzFTj3uoUvHMDoP6UBr+P7TRiX/c42gj+cY1?=
 =?us-ascii?Q?FTAaeFR8OM6/2aBwvrI5d2qXftfLmHTpST0+gAkjjeHJWlG+qQyH9B4j/07t?=
 =?us-ascii?Q?pxtV4t2sZ+17Rjo7O+o5VSij3RvGjJsmETut8DH+Mz/qQwkfmtkm2SC2/C13?=
 =?us-ascii?Q?R+Heiqwu97lKMMf12PjFvSL2Fzhqz+0gP7kMhUM0PdLeA/VXUFY2i/aMbO/Y?=
 =?us-ascii?Q?ruSXLhYS+nKYPdmlyXNFqaPkp3acVrRQHKmfTrENSCgw8A6ZmRwDIs4PmbQp?=
 =?us-ascii?Q?doQuKuFKVQUyW6pqtSVaLqCEfyniA9EgjJZfEQfKiiOO3PrV2yE8JikrWXmD?=
 =?us-ascii?Q?w3pDcPNshPz7XuDEx6mAA02zThBt18TOiEul18h1RMBkqdEUkV/Ak/vKIQpe?=
 =?us-ascii?Q?/G23WeaiYxQrTvPW/3wAZmo/jR0s566ZWxRWgBgfPOVUUG2tT0P2M/ZUFHmO?=
 =?us-ascii?Q?VmkW98gOJ9bwmqqmqZ+eZ4mW2bIYcja8izizUuOzuq9FMHD0arJQdeOpTdl5?=
 =?us-ascii?Q?OE3Q+Z4aRCav9lxu35gzPY+tGfySoI/bTgvpwGdtRgOWOHJMhGlOK/wSLXN1?=
 =?us-ascii?Q?TQwZ8nGQ/JT2U4P4duLk6ozoFwBwfUvC+0QyRd1jxBeJXzCg/cNiLbw2loMP?=
 =?us-ascii?Q?pTVvnMbIeIDQZdqdD4qFJG/Dwzc5NKhV/aFAnC4NQQ6q2l1MSLMLg5IAnlKL?=
 =?us-ascii?Q?TgdhUXw9oJ/yKJi9N6rfxWSxGXr69yYih4uhp/z77gROVr8eAeZ5ENPil/0Y?=
 =?us-ascii?Q?Kt7HKPKS4ccZ5GR9qtZOrN0ZrMsOyWL+TKsoo6cDDWMOZZ1AbKvoNMVsZmFD?=
 =?us-ascii?Q?md1GRqJLgG2Xjf6TQjbvw03xmewQ1o9ii8okcpUsn7LCS1E13Ii6r61laDjA?=
 =?us-ascii?Q?l53Jb84pYPPZ/FWLPXdmux2ZTWpeyFuqoRXqfvozUm17z46t1x6elu3VcdWu?=
 =?us-ascii?Q?AF2vLfkit40mB+7LNuKLy0TjDH0eJQP7dv1NKoft59JkrZMgVM/m/kE3S/tv?=
 =?us-ascii?Q?9trhMrcUHzCv/yJwGsyrilh/o+72qT5dsLbXdj7HYiXtXfSxKGAd0VfH+pHW?=
 =?us-ascii?Q?Q+HtgHWhrunPs2TJt1er28ildiXSbyPZjXZTlpWgbJAKnkTqyASdv6kyJf7A?=
 =?us-ascii?Q?hV7fUaBjwI/PMA4fCJO7Q9Et1QD+cuf79OsAuadYnyMbYHr6s/wCmrGOw19O?=
 =?us-ascii?Q?hRrZy6Bgkm1JcP01u58DmOfyOkLQm1c1GpWmBA1FQGqfXJOjv5zVlOWKAyQ8?=
 =?us-ascii?Q?whl2sYFfggb0jmN9q7kgaYJeRANkFgFwlG7YO0weO3xuyGedgk//BRUGKo+H?=
 =?us-ascii?Q?rCUqf8p8ww/iSaKPdVsFsEOaZ80agD5ClkX1gGuZyVFH4lvpy+7X4K25wqpp?=
 =?us-ascii?Q?UzEuqltBm3FFfD4mGlzjNg4NxAaAtWFBZYEts7dhMgrkQ4Jp561WFUQNVH/N?=
 =?us-ascii?Q?QlrROqfQQ2gWaS2+yDw8Lq5FMK5PJVq+v95jkZd+NBxsBVGgA73A8Pb4gdiG?=
 =?us-ascii?Q?y4g8NA6qAA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e35aa56-8463-4a6e-d2f8-08df33ff63bf
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 07:53:29.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhdUc3S1rI838XKyfH9qADJEOKLxYa+wWu2J711LEZa8B0DOmIoH9HWlEJ4RbJ4i71GjYJ1OXG/pbps6x9eJOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7034
X-purgate-ID: tlsNG-ef75cf/1793087614-37AD0AE4-9A6D4591/0/0
X-purgate-type: clean
X-purgate-size: 6044
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Previously L0 did not expose the SVM SpecCtrl bit, forcing L1 to
intercept and emulate MSR_SPEC_CTRL accesses from L2 in software, which
is functionally correct but suboptimal. Per APM vol.2 rev 3.44 "SPEC_CTRL
Virtualization", hardware supports combining host and guest SPEC_CTRL
values via VMCB.spec_ctrl with a logical OR while a guest runs, and
saves the (possibly guest-modified) value back into VMCB.spec_ctrl
on #VMEXIT.

Handle VMCB.spec_ctrl across nested VMRUN/#VMEXIT, and expose the
SpecCtrl bit to L1 if L0 virtualises MSR_SPEC_CTRL for HVM guests
(X86_FEATURE_SC_MSR_HVM, which on AMD implies hardware support for the
bit). Otherwise IBRS is hidden from L1 and there is nothing to do, so
SpecCtrl is not required for nested virt.

Update docs/designs/nested-svm-cpu-features.md with the rationale.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
v2:
 * Don't require SVM SpecCtrl for nested virt (Teddy): on AMD,
   X86_FEATURE_SC_MSR_HVM already implies hardware support, and without it
   IBRS is hidden from L1.
 * Only expose SpecCtrl to L1 when X86_FEATURE_SC_MSR_HVM is set.
 * Update the design doc and commit message accordingly.
 docs/designs/nested-svm-cpu-features.md | 12 ++++++++++++
 xen/arch/x86/cpu-policy.c               | 10 +++++++++-
 xen/arch/x86/hvm/svm/nestedsvm.c        | 23 +++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
index 482edca2b5f5..6c1925e062f4 100644
--- a/docs/designs/nested-svm-cpu-features.md
+++ b/docs/designs/nested-svm-cpu-features.md
@@ -114,3 +114,15 @@ leaf 8000000A:edx
 
   L0 uses the hardware virtual GIF to virtualize the GIF of both L1 and
   its L2, which removes the need to shadow it in software.
+
+- 20 `SpecCtrl` *MSR_SPEC_CTRL virtualisation*: Not required for L0, provide
+  to L1 if L0 virtualises MSR_SPEC_CTRL
+
+  Without MSR_SPEC_CTRL virtualisation in L0 (hardware without
+  MSR_SPEC_CTRL, or `X86_FEATURE_SC_MSR_HVM` disabled), IBRS is hidden
+  from the L1 and there is nothing for nested virt to do, so the feature
+  is not required.  When L0 does virtualise MSR_SPEC_CTRL (see
+  `X86_FEATURE_SC_MSR_HVM`, which implies hardware support for this
+  bit), provide it to L1 so that L1 can use the same hardware
+  virtualisation for its own L2 guests, instead of intercepting and
+  emulating MSR_SPEC_CTRL accesses from L2.
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 48a3185eed8d..88f5a949e583 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -845,9 +845,17 @@ static void __init calculate_hvm_max_policy(void)
                                (1u << SVM_FEATURE_NRIPS) |
                                (1u << SVM_FEATURE_FLUSHBYASID) |
                                (1u << SVM_FEATURE_PAUSEFILTER) |
-                               (1u << SVM_FEATURE_DECODEASSISTS));
+                               (1u << SVM_FEATURE_DECODEASSISTS) |
+                               (1u << SVM_FEATURE_SPEC_CTRL));
         /* Enable features which are always emulated. */
         p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
+
+        /*
+         * SpecCtrl is only meaningful if Xen virtualises MSR_SPEC_CTRL for
+         * HVM guests, which implies hardware support.
+         */
+        if ( !boot_cpu_has(X86_FEATURE_SC_MSR_HVM) )
+            p->extd.raw[0xa].d &= ~(1u << SVM_FEATURE_SPEC_CTRL);
     }
     
     guest_common_max_feature_adjustments(fs);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index e896c9a0f29f..0c4ce9312415 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -417,6 +417,16 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     /* TSC offset */
     n2vmcb->_tsc_offset = n1vmcb->_tsc_offset + ns_vmcb->_tsc_offset;
 
+    /*
+     * SPEC_CTRL: When in host mode, the host SPEC_CTRL value is in effect
+     * and writes update the host SPEC_CTRL register. On a VMRUN, the
+     * processor loads the guest SPEC_CTRL register value from the VMCB or
+     * VMSA. For most guests, processor behavior is controlled by the logical
+     * OR of the two registers.  (APM vol.2 rev 3.44
+     * "SPEC_CTRL Virtualization").
+     */
+    n2vmcb->spec_ctrl = n1vmcb->spec_ctrl | ns_vmcb->spec_ctrl;
+
     /* Nested IO permission bitmaps */
     rc = nsvm_vmrun_permissionmap(v);
     if ( rc )
@@ -988,6 +998,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
+    struct vmcb_struct *n1vmcb = nv->nv_n1vmcx;
     struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
 
     /* Cache guest physical address of virtual vmcb
@@ -999,6 +1010,18 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Pausefilter - keep it as is */
 
+    /*
+     * SPEC_CTRL: on real hardware, only the guest's own SPEC_CTRL bits are
+     * ever saved back to the VMCB on #VMEXIT (APM vol.2 rev 3.44 "SPEC_CTRL
+     * Virtualization"); the OR with the host's bits is a transient
+     * execution-time effect, never written back into the guest register.
+     * Here, n2vmcb->spec_ctrl was seeded with n1vmcb's bits OR'd in at VMRUN
+     * time (see nsvm_vmcb_prepare4vmrun()), and will still contain them if L2
+     * never wrote the MSR itself.  Mask those back out so L1's own SPEC_CTRL
+     * doesn't leak into, and persist in, L2's saved state.
+     */
+    ns_vmcb->spec_ctrl = n2vmcb->spec_ctrl & ~n1vmcb->spec_ctrl;
+
     /* Nested IO permission bitmap */
     /* Just keep the iopm_base_pa and msrpm_base_pa values.
      * The guest must not see the virtualized values.
-- 
2.34.1


