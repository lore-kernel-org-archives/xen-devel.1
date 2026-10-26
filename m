Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E44606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=seQO7xPz
Received: from list by lists.xenproject.org with outflank-mailman.1460927.1671840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqS-0007k6-HB; Mon, 26 Oct 2026 09:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460927.1671840; Mon, 26 Oct 2026 09:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqS-0007jz-E6; Mon, 26 Oct 2026 09:18:20 +0000
Received: by outflank-mailman (input) for mailman id 1460927;
 Mon, 26 Oct 2026 09:18:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xLGqR-0007fn-9i
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:18:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGqQ-00FxNL-Mi
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:18:18 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1ad5-e002-0a2a0a5209dd-0a2a4509ebd2-14
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:18:18 +0100
Received: from [40.93.198.9]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1ad8-be1a-0a2a45090019-285dc609e92a-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:18:18 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by BN9PR03MB6107.namprd03.prod.outlook.com (2603:10b6:408:11c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:18:14 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:18:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9XnjKejJXNqlHkeVtEsD8+MQK3p4oHP2djQIVN+YM00fW/ZRyZwzTKg8+5eRUI1yqaHO/5xRVJfaLhVV4QNXS1o1fr5G5icY9C7dEf+CY5xqWGaDGNIG3nHf2VXPiiSinllGHehtJV13r+l9S+tkhYM7XZU6F3bqg1U2D7RFlC4hnfmJxVqISM8+4cjjDijhJOSF+PgUoJtGqXD/ap99uUffIN4eJ/HFm/rwyRFEBgfnI0v+6oqLQgcXHdtmdEzRFQiSFMAID8AxZNkX9oD52khv+cEsAQS0/0xCryiDmzDjW/aH2sVKrQGGpox70mN2+Tan4Nq6x1CnugsIoIEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QK2huaQ/+7qvVYWQkaTSEYAhJc1eYzXY5Cdn6C9Xnk=;
 b=QWPT2v885hgSWj0DJvaCKcddRC3RlcyNUgqNWTa1m5V5ZgPM2ndOHpzOD/K1h8UIcE0HUCqvbZyFZyVCy+oc1lAYI4+rq3HMa5mtwNrc+1A0bJ8gnEj2ZHdL5nRsJFZ0J47MiibIlSGOn9LLOn2SdOSj6jqUg3rJCsZHDGTJJA15Bdv3OWoVNEV9cWhY50hQ+w0QBeAqohmjBlSRgBrPKoAQ50jzgE6+j/mzwceGVcl1pQ10AYR6GzvTs3gvxvN8tCEj3EsuIqAWAqldosxjWOolhGwrjaoQ3xQzCTAKuDZXZArjjm4sEtWsZPT03AONlcS7ckJ466T7RgK0UJhN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QK2huaQ/+7qvVYWQkaTSEYAhJc1eYzXY5Cdn6C9Xnk=;
 b=seQO7xPz07pffnAEDjTp3ZPiq386E2ACyxEhvAX45pDz537tvyugOwFnhShJpM9RxHSNbvNnDEL1qYkSz/2NfuvAikWrvpyveZFApGsqi0d1W7b953x1TybQUMSVxSb63sKXye5asbo4FOeFj1MZ3ekEXmFDxP8jUmfKnsK/z6Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 7/7] x86/kexec: Zero GPRs before entering
Date: Mon, 26 Oct 2026 09:20:17 +0000
Message-ID: <20261026092017.3880869-8-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261026092017.3880869-1-kevin.lampis@citrix.com>
References: <20261026092017.3880869-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|BN9PR03MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: e181fa3e-754d-4807-0866-08df33420f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|261021121427099003|261022115727099003|261022075727099003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	uIvWDk9UndiEjk2u5LAvsCwUGqvCOO+OxHMLsyhQl7iBKR0ub+8X7ss0qLXLtjDrYm67ihn6vMjTJcMxEVdwuh8jlRsJJHyqHlZ+57QPqB7jsLFTuOQRJAS58EAjPDuUHzYUcK54b3OHPg8nQLXaqHKr++39qxZ0MDoSJH8hr2I5zff9CzxYB7LtzwOpCXMHeyD9yKdqrLg87wlaJStGz1EwyqMhYve4s19XrGKQC7I5BSNYJUGaIKO8yg6bsdUv6TGldoia1uFydRL7s1ViNnS/VkbPek27FIyBmJK11Mi+c6gz1x2BK/Cwb/tmKC8fBf3mcOEZmbNVF1mgyb3lLPIDtJfUrNcrGsbmY1PmFNhmE5xet950xo1n7HIiUSS8DOBd/pFVEA3gswLCHH9y8D9H/8fWVF7V8+quqygVCwUnNg958tWFruIQxQ8qEk2sl1ea4js4irgbU8xwuSgPBW0v1Wvj4VDPEUWdyOPQCfQmcj+hJYK3iBAaFKdRfWP8qRMVR2s52RDxZWMidRcKkbpQIkalfHg5Hw5Ms0fdXqlKnhU8H5BxR1I7Wyf9CUr0KBLwsMLXw5Ksia0Xi+yjuYXV+jn1cEgiIazh7fmQDkyR+2YOd3iiXgwrlEhS57pE2ovNjflJvnkvB+lq6qizRAweJZKHFMv7J07bvhjXuzQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(261021121427099003)(261022115727099003)(261022075727099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vJA1LYvBcYQkvFhencQEKSlACzELstY5LHdLEMh1/FsT8NqXR5reNkDMCxNj?=
 =?us-ascii?Q?yI7DJew1CXQvJTfI5EM7Xy1DEmbBf9JbtlYq0gkIrp7QnLDsXD5K3u8mzSvH?=
 =?us-ascii?Q?DewLavI4/ckOvFWvPczv3D/mK3Uu7BqoF+D/jPPLR8maRffMnO18qeLjg8eE?=
 =?us-ascii?Q?0RsFk9h5McArCE7pWLTLvYH3uqp8OFJsRNIS7v0PeuGvOWtiNyofIbFmKrGu?=
 =?us-ascii?Q?RlmD1JNy8FA3MO5qdfftrjLXud3q6SxJQEYk44JxyQhKicZsSqmEklL7zH5r?=
 =?us-ascii?Q?qIkuoTj5HlIsrYozq8wRAwoI6PBifIqgPR8Far7ETFADMWZRluYwM8T932xp?=
 =?us-ascii?Q?FxI5XeewqmC0YSEHUO8InXJ//nQ54FNxoopACFxEZU+e24MKk9383SRJBy0b?=
 =?us-ascii?Q?wP02TrVeWJ9XTfvuzT/yl/nr8vt4ZxaAuFZLZYfUQWQYibAVHcXeJLpuj1/z?=
 =?us-ascii?Q?1Osa9q+tTogrkRzwn4LCN5Y1cl57yn6xM7Z+mQwjWCwL5HMk1SZ7lSWFziIR?=
 =?us-ascii?Q?EZ8KA54nVUW0o65rc9k1i+SFypwuAv1RuLmALuL6XWef/yPVD32r00NRrv+/?=
 =?us-ascii?Q?znuoFhJEb397I9b8a/hMygXVyCD0avhxxliyPp77zpDGx6Xi5Rr3tMIHC8Mb?=
 =?us-ascii?Q?ZSiW8myDvPrQRNip7ToZS8x9NYydSU/fAGhHkMMPalARwYiOjIgrfb/eM8cV?=
 =?us-ascii?Q?+uZ+EK5IVKaR5As29QG/jQmA9GvD3KQKQg7YaBCdVzem/+CFCq3aSBNK4+fH?=
 =?us-ascii?Q?+3zWI/ki4vIkn8sJUEEZ9A4RUolTyo1bGTs1ajjA+dPzjpxv4Q0i86IYCgXP?=
 =?us-ascii?Q?xGMTdyA1pAAPfaRhgeSAwwWTRUCrKqHBDl7cAtbCuwXglgCWE/WFY1PLygMe?=
 =?us-ascii?Q?QAPmtN5uSiPP/o30C4NH3LAhnwTv4TI3dhJDb6LHy3RLN2SxX6HuvpAdsJjn?=
 =?us-ascii?Q?XxOoTTGRSx99VplZ479eqmVwJIC+fybGtDqzlqupTGAn3AOYZr0W+RW9DUxb?=
 =?us-ascii?Q?YA2W8wVVJzZUZLRXswYslx8eVozo/Jlt5mcm0pSsUJ6YG3MLyo9GqL7RaKb2?=
 =?us-ascii?Q?7xYOsCvcTRXsS0a0OtpGv6BNcKp0ojJlaPzwX2DZ3/vH01AX0geLjSAN6ktm?=
 =?us-ascii?Q?R+mge1YI8IIlkyA+ZkhBI9i8eXYna5Y8rVRwyiO+v6aOWHbsVISaZwieVguV?=
 =?us-ascii?Q?puMyYsoGqcHvU9qyTwfiBXjeh1hRagg8QbStPHcResZipnbtK15uxdpECbQ2?=
 =?us-ascii?Q?JLi81qijEckLl0YSHDmSjFPK8dGmqt6ghKeopkF25HsANNGYa46EEVabZQuV?=
 =?us-ascii?Q?kLC9y5RqyZ+yttqqD9+J+DZd4M31FJXDlFFwSdiIWsEyKWHsS2/RzX2wsjuY?=
 =?us-ascii?Q?wEZDrFLEUBffUu1gJbR48pnLvavhusk2QGgJzhewITuZrFqUVNoez5215M1l?=
 =?us-ascii?Q?0zo2ceM+GMKhsxHz202I1+4Vdtrb1JQIMd25C+UhbC80UZ1xRPAcv2xc+4/4?=
 =?us-ascii?Q?PS7TaISkC6dMzLm4kME9mFKQkR/xw9AdxoLVtJKwqBSiNLBUUcgPxIsJYvu+?=
 =?us-ascii?Q?sW20+j00l6jCdwH9lTUjdC55UeqCcpZaVE09OuG2iayCvhb4ckpswl4gdQfr?=
 =?us-ascii?Q?XjDlekiubJknLTP+75XOYnjD3RNBKKH/Jzd3SCIb542E+wPV3x4drVqevpgK?=
 =?us-ascii?Q?EvZgD9MKgNZE3nJ/Dg/7wGBlpJBcB4hhNtrcRUm+x2sbzsewB+pK/J6jaI+f?=
 =?us-ascii?Q?Vqvz0+Lmiw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e181fa3e-754d-4807-0866-08df33420f8f
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:18:13.2550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9qeM3kVQR0/LWFTu4VCwUxx44XmNe7HAOEVzEt0mZgj23SrUWGPntT1UXqxGoM3Qq6HKL2JJXg7A5v6qv+XnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6107
X-purgate-ID: tlsNG-bad1c0/1793006298-FD26A034-BB5DCE56/0/0
X-purgate-type: clean
X-purgate-size: 1903
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Purgatory zeros these general purpose registers before jumping to the
new kernel. When doing kexec on an EFI kernel there is no purgatory so
we need to zero the registers here instead. This change shouldn't affect
the functionality of legacy kexec.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- No changes

Changes in v2:
- Move the 32bit lines to the correct place
- Reword the patch subject line
- Fix indentation
---
 xen/arch/x86/x86_64/kexec_reloc.S | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index 0f163862b858..ed1cf15e6c94 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -111,6 +111,20 @@ FUNC(kexec_reloc, PAGE_SIZE)
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
         jnz     .L_call_32_bit
 
+        xor     %edi, %edi
+        xor     %eax, %eax
+        xor     %ebx, %ebx
+        xor     %ecx, %ecx
+        xor     %edx, %edx
+        xor     %r8d, %r8d
+        xor     %r9d, %r9d
+        xor     %r10d, %r10d
+        xor     %r11d, %r11d
+        xor     %r12d, %r12d
+        xor     %r13d, %r13d
+        xor     %r14d, %r14d
+        xor     %r15d, %r15d
+
         /* Jump to the image entry point */
         jmp     *%rbp
 
@@ -127,6 +141,7 @@ FUNC(kexec_reloc, PAGE_SIZE)
         lea     compatibility_mode(%rip), %rax
         push    $0x10
         push    %rax
+
         lretq
 END(kexec_reloc)
 
@@ -204,6 +219,11 @@ FUNC_LOCAL(compatibility_mode)
         xorl    %eax, %eax
         movl    %eax, %cr4
 
+        xor     %edi, %edi
+        xor     %ebx, %ebx
+        xor     %ecx, %ecx
+        xor     %edx, %edx
+
         /* Jump to the image entry point. */
         jmp     *%ebp
 END(compatibility_mode)
-- 
2.52.0


