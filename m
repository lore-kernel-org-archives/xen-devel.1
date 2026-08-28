Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F426C61DCB
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 14:20:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402098.1637511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzxRO-000235-PL; Fri, 28 Aug 2026 14:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402098.1637511; Fri, 28 Aug 2026 14:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzxRO-00022y-M4; Fri, 28 Aug 2026 14:20:22 +0000
Received: by outflank-mailman (input) for mailman id 1402098;
 Fri, 28 Aug 2026 14:20:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wzxRM-00022T-R3
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 14:20:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzxRM-006G3d-7s
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 16:20:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a91990e-e002-0a2a0a5209dd-0a2a4508d768-28
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 16:20:20 +0200
Received: from [52.101.57.38]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a919923-f659-0a2a45080019-346539263179-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 16:20:20 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM4PR03MB6997.namprd03.prod.outlook.com (2603:10b6:8:42::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 14:20:17 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:20:17 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsQRpxPBxrYNBqAmHr6i1pN++h2z1DbPRlS/nUZVNKa5eNwdhCe2YQyXUpqobiuwBBeZkcz/pvB3QnE2gsL1GNOk7gkXAzdTV+VeQB6K2wdnMJO/wp/a4D7SaUJ6Qy8TrlwBVNXkjGyxFdJHovhlVzQnbeR63gpUqVIMQP83HF83/ZmHg4HyxUp6XeKiSRandiBbwsPIB2rCS2ksKowNGrxWF0FPZhhqls+phkh69Nn3XhRBoXoOHuScAZO5jmPSIJUcKd4YHPfQCncs1kDF6XUdJLDIqwVEPNYFQn70jK026QRIJ4Tdl4+dTsg5o3C+p6IGNj2JMczSKq2wjVk4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ny6wV03mQa0avSNSUM5XqRuUeG/cMLeVPOylNxwJFQk=;
 b=rWFWOaBB4aIfnsP9oi6gyvISpNQz+ZTqEmfwj6qppE+HfUW8SdiSQOGZHRzlQAWhj6GUK0UuvaOMXDlRbmgCGGruphAVMiEWSVl/GGNHJc0UfeEwcGEWiN790yPFnbS/Op2n09b9fLokHZNa6YMTnq7YslQrz5HUYPHYM+/paPcm/kBwMeHm3b+ilOhqqbG+VzdyQA6sSiw4+UHWjsUzw52uIuFXC2EqOPGgvaSuXthahaUttlMkaY9Yy9KD1BKFEvzu7DYYInjhKtNlYKoiGVWjPkBTg0YpCN2Ftz9oK0k+sfwKxhHkQZ79vGiY4aw+AK/WdbDp9l7rYx5M3HpfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny6wV03mQa0avSNSUM5XqRuUeG/cMLeVPOylNxwJFQk=;
 b=TCEzjrK7Rl/3+QIlmCYcge451yk3qqjt+o2yirC3RfzBNYdFtz0fWQBuMnwXpPYwp066QN2GQ4LuhZavbU0YziYTfA8TcqTh5t5lwoOn1Ph2XJGH1PM0p1BI21/22GWNgmWS4a8bqGTmlqmkHYlf96V/OVU5+0SKxO6WtgeUqeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v1] x86/svm: Intercept CR0 writes selectively
Date: Fri, 28 Aug 2026 15:19:55 +0100
Message-ID: <20260828141955.4009939-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0112.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::9) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DM4PR03MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 02979082-3239-4a1a-b861-08df050f7bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J5KYsVbgbHFuJgmsWIGAJE1TIkYl3LpOE2RyzofuMu8SrpVXtjF5vm46cMbo6KmllUoQMVwVvydeKUnNQrwaH8FLtFxaXxvH8yQFyKOBTz6jOigac3/vXEtZO/xQuVdvyizPmI16NrZdKAFT4J83AXPIdHMNRYny5K+SeHMcK2cS3B9byCdkHjQxGMl4Ex4kTLvyaAAe7iX1keD29p69g+D4sJN2jlQBeVwxknOhNQ6EHPxrNP9QG9mwYgToIGaxZBK5EwsIEAuxKm3AbrQ9gSZCDu7a70f+qQNKKDUZ5d2wamA7CgLjKSv8PFnQsQdzVCA4HzcAzqEIRpdSsdyo7Q6sCStJ3mIeyzRGblCqggijrcaYHOGkEUF/o03NtdsV0is51LDp3J6gfFHuwudDGXFlqzVMcI8j/5iwkNw3Dqk7szhogaHc8j20LgoAU/5n3zUEDaL/WmrhbLfr3DFX2CZaC3zHOaPiZNBdkDtP2XxbP/yq/AzA6WGnGeS+tONITBEwZ4biPaQtelNQDBe4dH0pGFhkOBxUUN71NeHuCqE5cats1iwE4aEblQCnF15TS72qnOfgprKPnZIV5cagvuqPBxksPOPek0pAbJwfPzLdCUdh+nSMoGb70cRZft2DQTP+RmLi9NcwIDvYtbxojre+WwNJ8OO019t/t1qpqhw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5aMgLPvutbD9uJoqlFO+qtU/yLu8NXOVRDJeHOtcvfVgxB5JtEL+a06X9P3k?=
 =?us-ascii?Q?q57RfP/FaMqN1vYFfkg4OZAVM3NmDi2xiNQ6oGmOnSiO1wF32fJOh3+gwlnr?=
 =?us-ascii?Q?u1WjKhdy0tvDRSafOaPVbszDnou+dhujt++K5yihLTx5WqDroQXyoAMSedXx?=
 =?us-ascii?Q?Y77zPVg7FXib0rnWcJxmHG4q1cKFoEwC7z/7k17ovggQk5ki/wYfnaiEpro8?=
 =?us-ascii?Q?Io9gLv5roVa69XMjtXyr5rpVWC82yUW/GuG5WnQtRc7WT8W8aM5X3w3U/GBy?=
 =?us-ascii?Q?iAs8aczEVIHKI2h8zixiePhOGGWotQLlS+M96xwseMw4JfgNsqHRNFgdOYRY?=
 =?us-ascii?Q?gpEwa4ZD3Twam21FO1GwfMSEnzokQdYn2mlbADTyKJfIp8YIuRYJF2YYIDhq?=
 =?us-ascii?Q?DyqCXBDdAZv50kMtBrFnH+PwefPdfimxGKOXiZfb044+Mp3+kY2Tt+JRvlvY?=
 =?us-ascii?Q?c4uiEw/sLHHNBNcbj36B6Qsrty3uX77v5SCIusqDEycQAMvOLKVqvG9urZF1?=
 =?us-ascii?Q?KlOnA+RQWrAqKWG9rn2djGEZXRMiogBNuUZM2AysWh21djSWvXLqJ3EvGh1M?=
 =?us-ascii?Q?t5Sw/TUMqKhCFhED+VFkksErz55QBtUm04pTmrzg9xD7wGSY1MSDcLQv64nv?=
 =?us-ascii?Q?afTozaMtM8HqTxG7tNCuy5RhmcMdyJ93DeWMRo9tDflmFQsyMoxMe8x9wLa2?=
 =?us-ascii?Q?jbdy3pkVFbwyz2TNRSISseueyGOOTGfTysk/uoVkuuQxF30qZEu4yRyCX87E?=
 =?us-ascii?Q?lWPj4LGU2OcgmfX/yEllgWTpT1EexJga+BLQmKxjnlJkTReQ1fB3KRcsayS7?=
 =?us-ascii?Q?aN/UuQaPO4aJ9eL7t6HYj97Ang+lnxVzypNtDTJg3xPBqU6m4p1apkta3omn?=
 =?us-ascii?Q?ZFMg2YKy0hTnujLuCn/PZOvoaFWw2GqjkSO/HugcWDyJ/GBHY4TpTX8qIN79?=
 =?us-ascii?Q?pwwKm+M23xxNzFr02Sm/1+/biLDbTzYNoZ2GS3G2DqPdZnI4jGtWhpjWEy5R?=
 =?us-ascii?Q?F5rv2pvWYMccI420OUZk/IcaNws5s9c7CmYvH747aqHgkBoaiP0RRQs5uk1W?=
 =?us-ascii?Q?mxZFVLD9AraRp1LGIO3U834AK6Kr20SQKddH4427sN048XHVKZrXrqXWAvuy?=
 =?us-ascii?Q?viqZ6RemhxIOJoYbiPoQpKSNTupD49/QMGirSzSj2EqylHmVFIxhN/yBO9WG?=
 =?us-ascii?Q?gO/uEP3no0AWU4iUWa/1kpQiGLq7/D6xCkzIw5HyUVjPjVIRCrEKzrxdc3P+?=
 =?us-ascii?Q?LMZ0pllZR+ZvJij/89tP1JQr/VAfW6cKaWRT8JJCcS5FtRRLbAOsiSkSp/dZ?=
 =?us-ascii?Q?slJYztM0cWe4gzpMdj+Tr808gqv5Sx24dqlMa3+8nD4+J1xdGmArbNH3RGhZ?=
 =?us-ascii?Q?mDpcSnoNpW7893yFqok9lmIUMhgBLSOIPCGcYudh8vcQxT9okD1zVexQJ8Gi?=
 =?us-ascii?Q?M0eMqbB36/t792AyyjXdFdb84ukOWXEERUvpEVMotFoN8UF62b3qgSKsIrHK?=
 =?us-ascii?Q?C9I4KV84pCz6UjmM/nkDvvvl6T5ACXELHrgsRxWA2mrFdmhBhVYufeRk0J+B?=
 =?us-ascii?Q?Uq3ZpYbeM/0zO1OG/ubeNeipByZxcNDhVQVZIKLqUpC9Zrnthwr4UQAqEaed?=
 =?us-ascii?Q?VlsRncPuj4UQP1nOOxTHifg8FYfAESVGhWQV+dbLa5DnWZpgs/549UtwMAhb?=
 =?us-ascii?Q?K4uX1DdAyxGq2jFrKz8PiI15mXlb3vhRsaPcFe2P7jS3vYVlGsxD4z/2nkFF?=
 =?us-ascii?Q?uAC9rNeXymwRfgZ0nc027C1w7Iyr1xE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02979082-3239-4a1a-b861-08df050f7bf7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:20:17.3122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIrY9hicbeEPDw86wnlgQYfF7B8vvLRJlPjYeOIvYJebuesKg451mK4JSrIz5dmeVk/67DAnn85e8TS/nfy7+MgY1rNumGk3yrXM726vR54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6997
X-purgate-ID: tlsNG-c1860d/1787926820-D5B4987B-91DF2DF6/0/0
X-purgate-type: clean
X-purgate-size: 3508

Xen does not need to track when the TS or MP bits change so opt to
intercept CR0 writes selectively. Aside from potentially reducing a few
VMEXITs, this fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE
and L0 intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so
L1 never sees any CR0 writes.

Since CR0 may now change behind Xen's back, sync it on VMEXIT so that
the emulator sees the correct value.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c  | 7 +++++--
 xen/arch/x86/hvm/svm/vmcb.c | 8 +++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5f5d903d872d..8da879a5af67 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1640,7 +1640,8 @@ static void svm_vmexit_do_cr_access(
 {
     int gp, cr, dir, rc;
 
-    cr = vmcb->exitcode - VMEXIT_CR0_READ;
+    cr = (vmcb->exitcode == VMEXIT_CR0_SEL_WRITE)
+         ? 16 : (vmcb->exitcode - VMEXIT_CR0_READ);
     dir = (cr > 15);
     cr &= 0xf;
     gp = vmcb->ei.mov_cr.gpr;
@@ -2517,6 +2518,7 @@ void asmlinkage svm_vmexit_handler(void)
     hvm_sanitize_regs_fields(
         regs, !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l));
 
+    v->arch.hvm.guest_cr[0] = vmcb_get_cr0(vmcb);
     v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
     if ( paging_mode_hap(v->domain) )
         v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);
@@ -2882,7 +2884,8 @@ void asmlinkage svm_vmexit_handler(void)
         break;
 
     case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
-    case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
+    case VMEXIT_CR1_WRITE ... VMEXIT_CR15_WRITE:
+    case VMEXIT_CR0_SEL_WRITE:
         if ( cpu_has_svm_decode && vmcb->ei.mov_cr.mov_insn )
             svm_vmexit_do_cr_access(vmcb, regs);
         else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 975a1eaef806..7ee91937b10c 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -56,7 +56,7 @@ static int construct_vmcb(struct vcpu *v)
         GENERAL1_INTERCEPT_HLT         | GENERAL1_INTERCEPT_INVLPG      |
         GENERAL1_INTERCEPT_INVLPGA     | GENERAL1_INTERCEPT_IOIO_PROT   |
         GENERAL1_INTERCEPT_MSR_PROT    | GENERAL1_INTERCEPT_SHUTDOWN_EVT|
-        GENERAL1_INTERCEPT_TASK_SWITCH;
+        GENERAL1_INTERCEPT_TASK_SWITCH | GENERAL1_INTERCEPT_CR0_SEL_WRITE;
     vmcb->_general2_intercepts =
         GENERAL2_INTERCEPT_VMRUN       | GENERAL2_INTERCEPT_VMMCALL     |
         GENERAL2_INTERCEPT_VMLOAD      | GENERAL2_INTERCEPT_VMSAVE      |
@@ -76,11 +76,13 @@ static int construct_vmcb(struct vcpu *v)
     /* Intercept all debug-register writes. */
     vmcb->_dr_intercepts = ~0u;
 
-    /* Intercept all control-register accesses except for CR2 and CR8. */
+    /* Intercept all control-register accesses except for CR2, CR8 and
+     * CR0 (covered by selective write). */
     vmcb->_cr_intercepts = ~(CR_INTERCEPT_CR2_READ |
                              CR_INTERCEPT_CR2_WRITE |
                              CR_INTERCEPT_CR8_READ |
-                             CR_INTERCEPT_CR8_WRITE);
+                             CR_INTERCEPT_CR8_WRITE |
+                             CR_INTERCEPT_CR0_WRITE);
 
     svm->vmcb_sync_state = vmcb_needs_vmload;
 
-- 
2.53.0


