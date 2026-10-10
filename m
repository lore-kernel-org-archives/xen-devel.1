Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8070CA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:15:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444993.1661507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7K-00041U-By; Sat, 10 Oct 2026 10:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444993.1661507; Sat, 10 Oct 2026 10:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7K-00041N-8y; Sat, 10 Oct 2026 10:15:50 +0000
Received: by outflank-mailman (input) for mailman id 1444993;
 Sat, 10 Oct 2026 10:15:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU7I-00040e-9c
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:15:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU7H-009G2i-Mm
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:15:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca1013-8faa-0a2a0a5109dd-0a2a4504a83e-34
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:47 +0200
Received: from [52.101.52.9]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca1052-b57f-0a2a45040019-3465340945fd-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:47 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by DS7PR03MB5591.namprd03.prod.outlook.com (2603:10b6:5:2ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 10:15:43 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:15:43 +0000
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
 b=rikAVu81sc8AypQ/GgomOr8zPltWuy0Nx9J0dDCULqFTcagxleBO3BMVNa0qYOmd7TWdRhl+xhEQphkt81cSgFR0s/If5X3oCPzvWQ0uloerqG/IhetJU3diS7VVUcQAmHagZhnhptXJye5qBdqte4He0SalNosncQNH7Xmf2R18jK3oRieHnNLIt+tcL6ryX0w5wDSLqX4lHZ1J6tXLqkIDgrUoYetKyOl/YAcbeWfFm/RPfxpjWGl/yDo4lKH/tFvNnzuNr4u17vssrRKJ2F5AVUIo1ffitr21qZm1NmqzsihpV0WgcZOryreJH179El0B/Kln4FXVl81Cn54GXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oexZirZAMZNzftk6MpNV1/OYjX520+aEwGhwJ24lOgU=;
 b=mh1xm3/VzX2QCemhXNqWCv8ZBX8ar11CxpTbp/Xn88tbvV02sMMMpH85Je3gmr5qr1RzsRCkCIlKeuHn+BjiadCYWHPnFm6juzaiqgVGjVagJ/5STcZBO9UKHCpG3mIkrXgvfAFYsx205FXIxcsNQZJCDTcNCdpGDzwBwgHLsGyxQFVx/p5Vo0JQNu9QaWqDnQE/ibxRdm4t8Hi339EDTOaa4LnKfSxwT0UmiFJzB+C2r+PBX8V5dZL+2YKjJLD4hxFNR9WAa5KrbkEFbbdmvPk2H37enxClvJ1DNOOon7TfVkKdylRsgLU2k9uWLXu7HNQpnniJC+fWL8nEH3CDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oexZirZAMZNzftk6MpNV1/OYjX520+aEwGhwJ24lOgU=;
 b=IEFjuhK8V1PYK1KAhzd7vWUEkE8VHkXTU+dY+Km2HPmgzTVOcni+xNXvt+nbnH6C6zuyXkL9l06yRbzUACVGopFlJ3/IaGFvEKVl77rOAJqPEU8VG4rkAOy21uKtjIGGoqvQO+ILHPBpJYeCUniskNIas3Ieyl7jUH9JtgQBU38=
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
	lin.liu01@citrix.com
Subject: [PATCH v2 08/13] nestedsvm: Don't set VMCB(1-2)'s NP_ENABLE and N_CR3 during VMEXIT to L1
Date: Sat, 10 Oct 2026 18:13:21 +0800
Message-Id: <a3e8db38ebb9cb6cfcf06c26e93522b3b95e7566.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0085.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:2b::15) To CH2PR03MB5320.namprd03.prod.outlook.com
 (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|DS7PR03MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 6932c811-ebce-4747-253d-08df26b77113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	3o7iwPtreOMTMhRxr6TwTY0yWrI7CWb6iKT9kzICBSM98J4HMfFScG9F1AONgx5Ovw3bsFkJkp6wRAQmqsmXCGE1lr1kCayu285IgwP11B5y9tPW1g5jL7N5nCyc6bqu2p5nJwJXdyDibFlKvttsXAvSxocK/nRQzhWwObXm/HJKdujZdtTThhrTyQladIH8vpWnvBKBUA+D/6gUiPiQyXtJhqSPr0H56EKp33VWoeASdE6VhVdFjWvekZ2YGY1uD9h2Js+7eg2EtQUC+6MCtLUJYoWBIyV2eZKwMPMfN4+iKitn7mkUcfqDXUj2TSwu+ejxjtW/0KakcW6S8nYUVlpEH2PJmvTD2axC/WLDQeavwhSOOcNJVCwfgJDZAATjf9m4ZfMXyG3Vk4/kF1uI3vhMCiihNEpcXNyQy0tZ+aTN40lk5Un9ZJIuOmBFdTZLQvJmDON+2azypODNXiWG49/HfRLCyhn9lyCSHuayr8HWhopvZYGAVLUFtfqEgTnPIX5BdvRFMsJ8j49bNCvTAKzSqO8rLXFqHsD/R51N3z+H9J1AffjdsjaCOdkCHcL/GNWT7cQWUOQT8u78gYWPZNW+bYk1gAPnic34Bbmj85l5j/JCKnyJIpa+soRKifSmZnD+PZzW9fXoI9vZajfDb80ACpytCaqG7vMqGYlXydU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KYbSiZqNADIVPP/I3nzRN/pASW9khZ7pWcO+e+GneTo3/OzR9oKoIHOjp8F1?=
 =?us-ascii?Q?IO1Oh2zLMjOImYIa/305MiEVEInfK3vi1QJXEa2d+/Eo38OPcbjWbibzTcsi?=
 =?us-ascii?Q?tFn6eDKXSm0GifH71Z64hbVAgPwMy4XbQvdmC7jO8j4cwV42iDs04WkJuDiB?=
 =?us-ascii?Q?3V38HmA93TyMwrPv/ywVlGJYLHpLxTPvVNklFVKJBnWi9RKaODe5dEUmj4xo?=
 =?us-ascii?Q?ZiJ+c6KDcmfJdc6JR814ZNmBpE4KcmXX+LNan5+SnruZb6pD0F3jnW5pdszm?=
 =?us-ascii?Q?LtjdHtEcAvP0LJjpyjRjP4uArmBY64xwDOp+LVuQQziFKHIDUbbMtXSjlRCN?=
 =?us-ascii?Q?asjXY6I9x+IgM1r72ioAqGu3k3krFZG/9iwqyXcWxTFH514fXmINlpEQbVU2?=
 =?us-ascii?Q?RvyXXy07UkltAAhBa7mYKN3qQKy8Oy1787lx1G5OoGIhO3Kg+0Lfwk5kROHl?=
 =?us-ascii?Q?XQvgEhtcQoGut3arHDMkvdBlj994stCJAzIxl7FoEEWj9Cv7d44xTb7325+g?=
 =?us-ascii?Q?LwIDb6JBfjnhbaxuQeOHMRFGbgh/9CZJoh+i4TtB8Wv62rfdoHGF65JaxtaL?=
 =?us-ascii?Q?Tu/XXiLLkKs7Bf2kxQbv0hFFE6e4D7dgGrsGiKkC8SLXWuLcx/FkrylaiJc6?=
 =?us-ascii?Q?cZPUtTXZB7y+rR9gFK5iiP7lr1Gcl9kqEcaiGjRNoyvnLo2AglKxYVkhUzWr?=
 =?us-ascii?Q?q0KVgU8KQg5BgNbk9pkkPzMbsLBO8Vv9xfkF5VBX/yqCP0ixWIgiqBWQWg2N?=
 =?us-ascii?Q?LMVijTTA3D1ABF5kUiyOX9RwvpAyn5IHUNaR3VQb2mpeLbCeNFiOG9ZVUaEt?=
 =?us-ascii?Q?X1udlwB6l74KwpXP87X5CoblfZgrPLymD7cqMukXVHu0xrlEspBpKPIpnI74?=
 =?us-ascii?Q?QxSlf1PSl1UCYxhHGEUF3WTMyhv+W1qT2dLE01Nd/v/YpKiaDkBORbJTFHQE?=
 =?us-ascii?Q?HJsq22u0wYuChwd2eTxlY8E3JbJGH/kaC/gzj/3hVuFn9me6P1F+NpnkcDAm?=
 =?us-ascii?Q?xMp7TX6V6DBdfkaft9MOTmUqQ6fMiKP8ZlnL6U/Ch1AndtAZo/CylzbGGyNr?=
 =?us-ascii?Q?b/0/iwKDg/cFpjY5C/WW091iOMcQser/hglvlqkxv9DZzCFRho7IS8rL8+77?=
 =?us-ascii?Q?f02c2u7wasdyyrBmfJULsNYp2RqxHJ4dfndHPskRdK+GsJggHYn6KcCceQtA?=
 =?us-ascii?Q?FRdhh40T6phRsI/6GIP1BJd42qSiOGCyxIzND8EE6Gct7j89DhBD/AeyV/0I?=
 =?us-ascii?Q?DYKkyiWjxNO9Nkw6UmHvZveDFWPySFNZtnUI1zll6XZffG4GaGOWTBFunlaY?=
 =?us-ascii?Q?/puRPjSrdOhtfwT/xXjWD01gC6IbSl8nMTfZFj1wy9MnS3BMDmAZQ9dNMLCy?=
 =?us-ascii?Q?6FuUYhCun7J2CNeRtBNhWwu0VqF3Klht8b8e0R10a3WC9/3NbArzGWmHRHUX?=
 =?us-ascii?Q?/R5w8jBHbs3P5tukoNcinPpgNW7Leyq4eVTrKfg6svGasxtRLkqDvAsa+AIV?=
 =?us-ascii?Q?aM1sn7uZl7OTLISOTQlEFN3JsRXvkqKbawkXjcARkXvNaX78bH+Nm/vQU2sY?=
 =?us-ascii?Q?H390vV6YMdGlMW1SvoTuu4dq2fPC7GZ7DciDyd8mabBsyxLOgV4mssR3khBX?=
 =?us-ascii?Q?B2gM/hGIBEYYq6Uy3kyH818PTpcQHMnHHV6U0ClzwAcSK4VQ9MJ1O+8a7V3j?=
 =?us-ascii?Q?3ram4LrwKtU7sqH/8evHITPF+7QcCPF4U4A0jzcTUlBpoiTsErNyujE55/MS?=
 =?us-ascii?Q?g8e5PBRtJA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6932c811-ebce-4747-253d-08df26b77113
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:15:43.3494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFg0rfWmK/1YpC+1rZBwWR9xDLdooD2oc4gc4c2RsGfLNqZdG6fsv25IPAl7yNtKq3alUIa84nyZOtMzmf5Ndw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-purgate-ID: tlsNG-ebf023/1791627347-528C9B50-4F32F112/0/0
X-purgate-type: clean
X-purgate-size: 2688

From: Ross Lagerwall <ross.lagerwall@citrix.com>

As per the VMRUN pseudocode in APM Vol 3 3.38, the VMCB's NP_ENABLE and
N_CR3 fields are not set during a VMEXIT so don't do this when updating
VMCB(1-2). At the same time, cleanup the somewhat bogus and irrelevant
comments. Not clearing N_CR3 does not introduce a security hole as
stated since L1 can set it regardless and it is never used directly when
running L2.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 36 +++-----------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 79242bdd9117..d47e57c8a1d7 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1031,37 +1031,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     ns_vmcb->event_inj.raw = 0;
 
-    /* Nested paging mode */
-    if ( nestedhvm_paging_mode_hap(v) )
-    {
-        /* host nested paging + guest nested paging. */
-        vmcb_set_np(ns_vmcb, vmcb_get_np(n2vmcb));
-        ns_vmcb->_cr3 = n2vmcb->_cr3;
-        /* The vmcb->h_cr3 is the shadowed h_cr3. The original
-         * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
-         * hence we keep the ns_vmcb->h_cr3 value. */
-    }
-    else if ( !paging_mode_shadow(v->domain) )
-    {
-        /* host nested paging + guest shadow paging. */
-        vmcb_set_np(ns_vmcb, false);
-        /* Throw h_cr3 away. Guest is not allowed to set it or
-         * it can break out, otherwise (security hole!) */
-        ns_vmcb->_h_cr3 = 0x0;
-        /* Stop intercepting #PF (already done above
-         * by restoring cached intercepts). */
-        ns_vmcb->_cr3 = n2vmcb->_cr3;
-    }
-    else
-    {
-        /* host shadow paging + guest shadow paging. */
-        vmcb_set_np(ns_vmcb, false);
-        ns_vmcb->_h_cr3 = 0x0;
-        /* The vmcb->_cr3 is the shadowed cr3. The original
-         * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
-         * hence we keep the ns_vmcb->_cr3 value. */
-    }
-
     /* LBR virtualization - keep lbr control as is */
 
     /* NextRIP */
@@ -1090,8 +1059,9 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     ns_vmcb->_efer = v->arch.hvm.guest_efer;
 
     /* CRn */
-    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
-    ns_vmcb->_cr0 = v->arch.hvm.guest_cr[0];
+    ns_vmcb->_cr4 = n2vmcb->_cr4;
+    ns_vmcb->_cr3 = n2vmcb->_cr3;
+    ns_vmcb->_cr0 = n2vmcb->_cr0;
 
     /* DRn */
     ns_vmcb->_dr7 = n2vmcb->_dr7;
-- 
2.34.1


