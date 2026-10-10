Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83C8CA6017
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:16:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445003.1661535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7s-0005M1-7R; Sat, 10 Oct 2026 10:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445003.1661535; Sat, 10 Oct 2026 10:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7s-0005Lr-38; Sat, 10 Oct 2026 10:16:24 +0000
Received: by outflank-mailman (input) for mailman id 1445003;
 Sat, 10 Oct 2026 10:16:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU7q-0005KM-Vi
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:16:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU7q-0044YC-Cb
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:16:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca1031-2eae-0a2a0a5409dd-0a2a4506baae-44
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:16:22 +0200
Received: from [40.93.196.50]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca1075-195a-0a2a45060019-285dc432211c-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:16:22 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by DS7PR03MB5591.namprd03.prod.outlook.com (2603:10b6:5:2ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 10:16:19 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:16:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVt/0Sq1/kO7btGQRs7eN34zFohMbDr7hWvyUmgMNqZwNWx7mfMuL8kGYTQGINQ79OQUiHeYzP/Ak/y5BhtX/otL3Ab6clCeUkYZt7gyu1cP1NdhXL4WNW9YO6PBnkJ1MH9lRTEifL/6sGvjA0+IXLi2dpSVt+CbDlRk/20jtwlo9Bjx5fxa3RBzJewrGmy766oj7bZJDmTP7rkjPBt1fds4+WpJj41JD1H0BP+8NTjAnz1ZBz6JY3rTTCb3twNz1QDkCfFbILM+dDPmbzEoAjaF3zbk+cXoOrd/MKcDD5xf1uWh1qzomdCRBVg8Izxgn02v6KOEddWOD3Tg0/Xz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpFZYPmjLYrTEbmLk/yLvFaJ1oQ2qJLie7e4rkLRGzY=;
 b=jNxiYzzzQz8Fn9ah1XO/cB+QgpHEbiuXXFJ9oGSLWC0Zff0PcLClc6bkMjx7mUdCdcTCimBiNIy4htmhyAJFqnBIYOqjhaouljZYjntUIIZ6hS670bpGEiQstRYNjiYWd46aWRlt3cbbDUCc3D3dbqs4cIzjPVB8LYiMAm26xE1JQapaHeciHztwi6MqfF6sQYsVX/S6cPhJaEFzCLmjUQ6RcveFkngfv5DWETiobmBEUea+65GwJlAV75pSDYDjyV/aR+UQg0wItd4HSn7Gx7fCU8vEWw+BSCB3aAXBA/eK/DCs+nxJuwYJuxMEOJSZpMUx8GFT11/NNFpw4aIOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpFZYPmjLYrTEbmLk/yLvFaJ1oQ2qJLie7e4rkLRGzY=;
 b=z7x15iiXS7YLCB24wDuBDLVC+EThTn2K1bUMBAB8zeY5Ixz+loWzUFhPKwPvY48TYueNNR9vnmVOh3da+dZKFTL36qGgSzxXXv86oX4uwh3e2AcLjIMsZd56IIkQdMovT16rw9q2vc8NBVVoi1HSUeZ1MN89fFlOnxc8/nBUCbc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: ross.lagerwall@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	stephen.cheng@citrix.com,
	lin.liu01@citrix.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v2 11/13] x86/nestedsvm: update vmrun without pending or deferred
Date: Sat, 10 Oct 2026 18:13:24 +0800
Message-Id: <2ad85517317a823d22ca5fc02fcb7ee1432b9ec8.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0070.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::13) To MN2PR03MB5328.namprd03.prod.outlook.com
 (2603:10b6:208:1e2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|DS7PR03MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: a251c11a-e4a1-4349-4ee5-08df26b786b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	XI5jg4/UDO0KZ4UnRl3rJgGvjmcBSNoEosdZedNvK0A80wP9AUTaqOedpJLfC27zqSsQsmBdmKikWG8KnbewHH/ea8Ddg10WanQYs482tHozLofRnN1eYsKQstsaRv+4hHUAvslpZ0z4xHBIfg8SUiLJkQw9shB/KGdSiAWlJyWXsSfMXKkxi+cV9Fvk7WFGa3XjLDngiS77PZYauPj1w+aMenSBu8gHhbcb4R/xkbi+fI3YctvFMlvyrm4OaDnqUOITCo6cAXKf50VqNCcIL56P7Z1WvUSlClVmqe4I5Q0G+7HGETUEqZJjImNzMgDDgU2k40YQ35565VpwV+lwBGQt5Ifn/7KFG4OmrRe5KgFGAjqqdknMSjkX9oEkEHIca5z31pF77eYCkiKleyu3qB1yLBpWoFVaaDFQNbu0xmDCf3b/oeek1GriIzfuU3rPwMAK07/kwDSLgUtYqr4SfokA/ND66edJ9n/pfzWdCSoSaGvGuxvhS3ArtaehR+KK/2riv8AR3UgDY/6n1yIrn/NlRfETNQVwMkDFKJvtK5x/k29aw1VVXgYWZZ3A9em4kAaEaJHbgRVedl9SS8nsolbM4yD/XCqVLeeVPMSU5nUm/qA8BBVJ6cckfvTqsSJJArgmQ9ZinYzQiteb8ZPjxE31v9yFMRyZa01y+/6RxsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ggxsVFS9APJH6lcoeCURNCJewxQoeT8ehmv17bgxsCOF9v2+wP/kjHL4xh4?=
 =?us-ascii?Q?3rnMG14XqcV8gY6pq6uIPyP4et1vfi2bOOAubALJal5Pajlf7Mu4sdIaS3yT?=
 =?us-ascii?Q?yXiZRQpgcJeRsGmApApGbfXm2IHplf0JlZV0a7rw7VzRewe6R8u/hZ7nDH7I?=
 =?us-ascii?Q?0iwSgyrI4FGeplVOlE3ZKSU4Xp1pKl20My31DVfxtORPG9Bv18dHTFZUA0BP?=
 =?us-ascii?Q?uUurteu0OD5FpfeV3NS15WaMc1UenbWqenpSiUNn5hG2rDjlZ6BiXBbZlsRT?=
 =?us-ascii?Q?I9kVmCZ6KTCMZOipD3qoNk25oo9dmZtpGKo/PuFSxmaXv4FbwRhv3zbZ32gv?=
 =?us-ascii?Q?Lm5B2MS5Cs1thmRhrVcmP+bALtmuxUgHEDhwLpbLngwp2wC0bKqaYzOmKtjS?=
 =?us-ascii?Q?uO8BzqMkvWYnHwcLhZAVMxbB0PVAeZZGWG9HU3eHYeH11tSLcu6QDyBL170o?=
 =?us-ascii?Q?AyeUKxan9fK/FqPYcUXl1NJTkxvh2PAB3Fn5t0l//ly+T/Hp/ZAIBtWWfnc7?=
 =?us-ascii?Q?8Al0lj6odgnw6xj+0VqBlG0O/JeLAYCeIAqKPXbBV9LLtPbi0mDKNPGffnnk?=
 =?us-ascii?Q?55Xa8twNEHqF0csBocQTukI9mvlmm5k3tQMKOojO0o3fhvy2UqP7BrzQI+aX?=
 =?us-ascii?Q?SXsTmMKMEl6NftZJBWDoCBgsDSBFhpcv2uGz7GY2IX6byoDGxrVjffqKL08E?=
 =?us-ascii?Q?JzD49t00+A1JWpvJNvhSMnPhQ1LPk+9MaZdnDTTR4YsC+2OeM8ekLUSj0A9P?=
 =?us-ascii?Q?cO4huWJXUrzvmQAo8zndIrYpdx38LlyeXR56G3EpWT0/xDITDhPcKwgyhjba?=
 =?us-ascii?Q?NmJAICWg+iR4Xrr93HP/js1yV2ui+4HBvZLEproFsj9L++W/t+Nr/Zp3jpf7?=
 =?us-ascii?Q?/sVtFYEMZzhvfoYBF3oOdTEHbQbLGSZqk5ARL3Km378RCl1JUu6m0gHo9+r0?=
 =?us-ascii?Q?xb79ojSIWj5gS+eZkwLMI4ryZ5GSysAbrD3u3/xdi2NDhzPRO8lBmY5sQ0GD?=
 =?us-ascii?Q?Di0MUW9snFs+CRbz+pbFsiFfCitwm8terjPuJMuZUW8MLfybu9VlaSo89Ux8?=
 =?us-ascii?Q?M6wKJ33EfxLGVcVQGxaI+DqVNXJm0lmB+lAamEo/zwjERk9pstt6qhl1Ji4Z?=
 =?us-ascii?Q?SL6ksThDGS8wGOHsBPGMwIxiYWYtlZv14KpAuwYLvKGRPJR6uDs30C3SV08z?=
 =?us-ascii?Q?ARJ8C7kkxdmF2is1maPXtPuQ9VyYYWkIht0xu0z8EsIz0nc3tKRNweCTAAOk?=
 =?us-ascii?Q?J0W+ZFbxNaEvVXCtz1tRb3s2qvp4nspcn+iqX+/zsYMpgp+FwmdxlHJNfCuR?=
 =?us-ascii?Q?FBlCjn+etimIZ+n9wwU9BglIZ5En+b8gXyoLtn2s0BSLnozpJBSsZa595s5o?=
 =?us-ascii?Q?axmOi1UlrcMArix7y4c/AtRkWnKA3//sHph0Jg7CpL2AhWKKgM7bC9Wa64JZ?=
 =?us-ascii?Q?nVQ4NSxj/WGSajgs4leylkQGlgxEv6gAjGGCjxDCmotXwSbrElzsB0LRVRit?=
 =?us-ascii?Q?KaLYRCox+MvyK/E+Xaein984xsiHYt3/VEPgKPyMkSgwzRqYG4I7mFTl+jmp?=
 =?us-ascii?Q?vQSDpKbIwNKRe/SMU0MAsAX4AxQ/93Tu/3Up6StNUpEYlr97LuvTFW1Os/8i?=
 =?us-ascii?Q?okFwv2g3mmtUVIE19Z6w1qJkxARk+uSJFM3aM5epzHRZX21fPIZ7lTvn3iQF?=
 =?us-ascii?Q?NrXsM15YYfZ4KKNXjzBlLi0cnrwHVpklvfyChoS9XjuLCcqiCpk5CcppE2rd?=
 =?us-ascii?Q?9RZLDVC0oA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a251c11a-e4a1-4349-4ee5-08df26b786b5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5328.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:16:19.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4n7zzW0pl2Oh386VaELYDhWxtzR31yOG6cpTLl/yybnQQoU+yBKVdRYsqrtYYnYf5B/w6TZ/ajnmP3JLLLi8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-purgate-ID: tlsNG-16d1c6/1791627382-1FCCD77B-BCF8292D/0/0
X-purgate-type: clean
X-purgate-size: 7105

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
Changes in v2:
 - Fold the nested p2m related part of the v1 "fix up" patch in here:
   nsvm_vcpu_update_nestedp2m() now clears nv->stale_np2m before checking
   whether the host CR3 needs updating, so a concurrent flush that sets it
   again is not lost.
 - Rebased on top of the preceding patches; no other functional change.

 xen/arch/x86/hvm/svm/entry.S      | 48 +++++++++++++++++++++++--------
 xen/arch/x86/hvm/svm/nestedhvm.h  |  1 +
 xen/arch/x86/hvm/svm/nestedsvm.c  | 33 ++++++++++++++++++++-
 xen/arch/x86/hvm/svm/svm.c        | 11 +++++--
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 5 files changed, 79 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index d9613a2a8fed..59d865635fd5 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -28,31 +28,51 @@ FUNC(svm_asm_do_resume)
         GET_CURRENT(bx)
 .Lsvm_do_resume:
         call svm_intr_assist
-        call nsvm_vcpu_switch
-        ASSERT_NOT_IN_ATOMIC
 
-        mov  VCPU_processor(%rbx),%eax
-        lea  irq_stat+IRQSTAT_softirq_pending(%rip),%rdx
+        /*
+         * The nested p2m repair below may need to take nestedp2m_lock and
+         * issue synchronous cross-CPU TLB flush IPIs, doing this with
+         * interrupts disabled can deadlock.
+         */
         xor  %ecx,%ecx
-        shl  $IRQSTAT_shift,%eax
-        cli
-        cmp  %ecx,(%rdx,%rax,1)
-        jne  .Lsvm_process_softirqs
-
         cmp  %cl,VCPU_nsvm_hap_enabled(%rbx)
 UNLIKELY_START(ne, nsvm_hap)
+        cmpb $0,VCPU_nhvm_guestmode(%rbx)
+        UNLIKELY_DONE(z, nsvm_hap)
+        cmpb $0,VCPU_nhvm_stale_np2m(%rbx)
+        jne  .Lsvm_update_nestedp2m
         cmp  %rcx,VCPU_nhvm_p2m(%rbx)
         sete %al
         test VCPU_nhvm_guestmode(%rbx),%al
         UNLIKELY_DONE(z, nsvm_hap)
+.Lsvm_update_nestedp2m:
         /*
-         * Someone shot down our nested p2m table; go round again
-         * and nsvm_vcpu_switch() will fix it for us.
+         * The nested p2m table is stale, fix it here.
          */
-        sti
+        mov  %rbx,%rdi
+        call nsvm_vcpu_update_nestedp2m
         jmp  .Lsvm_do_resume
 __UNLIKELY_END(nsvm_hap)
 
+        ASSERT_NOT_IN_ATOMIC
+
+        mov  VCPU_processor(%rbx),%eax
+        lea  irq_stat+IRQSTAT_softirq_pending(%rip),%rdx
+        xor  %ecx,%ecx
+        shl  $IRQSTAT_shift,%eax
+        cli
+        cmp  %ecx,(%rdx,%rax,1)
+        jne  .Lsvm_process_softirqs
+
+        cmp  %cl,VCPU_nsvm_hap_enabled(%rbx)
+        je   .Lsvm_vmenter
+        cmpb $0,VCPU_nhvm_guestmode(%rbx)
+        je   .Lsvm_vmenter
+        cmpb $0,VCPU_nhvm_stale_np2m(%rbx)
+        jne  .Lsvm_retry_nestedp2m
+
+.Lsvm_vmenter:
+
         call svm_vmenter_helper
 
         clgi
@@ -148,4 +168,8 @@ __UNLIKELY_END(nsvm_hap)
         sti
         call do_softirq
         jmp  .Lsvm_do_resume
+
+.Lsvm_retry_nestedp2m:
+        sti
+        jmp  .Lsvm_do_resume
 END(svm_asm_do_resume)
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 9bb04a043430..e22ef259c171 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -41,6 +41,7 @@ void cf_check nsvm_vcpu_destroy(struct vcpu *v);
 int cf_check nsvm_vcpu_initialise(struct vcpu *v);
 int cf_check nsvm_vcpu_reset(struct vcpu *v);
 int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
+void nsvm_vcpu_update_nestedp2m(struct vcpu *v);
 int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v,
                                     const struct x86_event *event);
 uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 3b0afb828c91..09a2187ac7e0 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -356,6 +356,37 @@ static void nestedsvm_vmcb_set_nestedp2m(struct vcpu *v,
     n2vmcb->_h_cr3 = pagetable_get_paddr(p2m_get_pagetable(p2m));
 }
 
+void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
+{
+    struct nestedvcpu *nv;
+    struct nestedsvm *svm;
+    struct vmcb_struct *vvmcb, *n2vmcb;
+    struct p2m_domain *p2m;
+
+    ASSERT(v != NULL);
+
+    nv = &vcpu_nestedhvm(v);
+    svm = &vcpu_nestedsvm(v);
+    vvmcb = nv->nv_vvmcx;
+    n2vmcb = nv->nv_n2vmcx;
+
+    if ( !nestedhvm_paging_mode_hap(v) )
+        return;
+
+    p2m = p2m_get_nestedp2m(v);
+    nv->stale_np2m = false;
+
+    /*
+     * This may happen if we've handled VMEXIT_NPF at the same time as a
+     * nested flush IPI from another CPU.  We've got a different P2M so the
+     * host CR3 needs updating.
+     */
+    if ( svm->ns_vmcb_hostcr3 != vvmcb->_h_cr3 ||
+         n2vmcb->_h_cr3 !=
+         pagetable_get_paddr(p2m_get_pagetable(p2m)) )
+        nestedsvm_vmcb_set_nestedp2m(v, vvmcb, n2vmcb);
+}
+
 static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
@@ -511,7 +542,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         /* host nested paging + guest nested paging. */
         vmcb_set_np(n2vmcb, true);
 
-        nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
+        nsvm_vcpu_update_nestedp2m(v);
 
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
         rc = hvm_set_cr3(ns_vmcb->_cr3, false, true);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5aeffd5e416f..cb09e924dcd3 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2129,6 +2129,8 @@ static void
 svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
                     struct vcpu *v, uint64_t vmcbaddr)
 {
+    int rc;
+
     if ( !nsvm_efer_svm_enabled(v) )
     {
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
@@ -2142,8 +2144,13 @@ svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
         return;
     }
 
-    vcpu_nestedhvm(v).nv_vmentry_pending = 1;
-    return;
+    rc = nsvm_vcpu_vmrun(v, regs);
+    if ( rc )
+    {
+        if ( nestedsvm_vcpu_vmexit(v, regs, VMEXIT_INVALID, 0, 0) ==
+             NESTEDHVM_VMEXIT_FATALERROR )
+            domain_crash(v->domain);
+    }
 }
 
 static void
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index baf266ab8013..772d1959e5a5 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -129,6 +129,7 @@ void __dummy__(void)
 
     OFFSET(VCPU_nhvm_guestmode, struct vcpu, arch.hvm.nvcpu.nv_guestmode);
     OFFSET(VCPU_nhvm_p2m, struct vcpu, arch.hvm.nvcpu.nv_p2m);
+    OFFSET(VCPU_nhvm_stale_np2m, struct vcpu, arch.hvm.nvcpu.stale_np2m);
     OFFSET(VCPU_nsvm_hap_enabled, struct vcpu, arch.hvm.nvcpu.u.nsvm.ns_hap_enabled);
     BLANK();
 #endif
-- 
2.34.1


