Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEA3C982D8
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 12:52:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425277.1649324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Y4f-0002nk-MJ; Fri, 18 Sep 2026 12:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425277.1649324; Fri, 18 Sep 2026 12:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Y4f-0002nd-HX; Fri, 18 Sep 2026 12:52:17 +0000
Received: by outflank-mailman (input) for mailman id 1425277;
 Fri, 18 Sep 2026 12:52:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x7Y4d-0002nX-Em
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 12:52:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Y4c-004kqc-RB
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:52:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aad33fe-8faa-0a2a0a5109dd-0a2a4505ecf6-4
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 14:52:14 +0200
Received: from [52.101.193.21]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aad33fd-4cb1-0a2a45050019-3465c1154d13-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 14:52:14 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5250.namprd03.prod.outlook.com (2603:10b6:a03:220::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 12:52:11 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 12:52:10 +0000
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
 b=Y6qs26shRJFp6KryPukZbZG/6k193NLLT48LfZTmJz2i15Da5zUwglqJirgxNOS5GD6AMpr0sWsumUndxBK+7u3Df1rOyE3vbOgOoEnwOiHIrhrobgdqG8tyru3lillOCUTuVjfkP8VZ5dlMOI9NBI8zbo3J8r4oEubNazwUnISlw5sjQUdivIx4LagsmJ8eIn+3Crl5bD3LbmqPb1CgNPv8VVOuU3AKNwKl7jMhQDGNjTT1Eq3CPlkUHmVR6z97FWkTYMPo6DeJNEPL+vwnGe/B8cWaFqkYkeaXiFqbEcjR6v9OT3UMc0eKX6J+D4oRMwfQ06JxWJTIEHa2eNl8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WDCeOiqix8ITahgpJOXT6M0qAhwYtBhqLH5O0uJYcw=;
 b=QT9y+g2DoB5kF7zp0yiEY8DgGNk29ZK7w+cs8TPcEfUuz0oCGgDt8mLiUMGnUOSa7D4GOQdOGfaioP8JK4bBQ1GubsSYVbM6OFyWCnAJz8MY39A3dDmZKbqScUMAX/aEQ3dMdBN1kLj3BkjheKFGdOdIrXu2iblIRvDxAEjDG6PwBPsbqojlL8KOE3dNf6XI4OcrAUI79HYRUyuBX1gWaLNMnNK8mV/N0cCN7dHJgntMmRtx+AL6JTrZIQ5YpeYSygz2J0T72KY6A92HZfnXKnoIhsInAwYdtwKNdubbZQRYRJnKKZ+QLKDsELKf5vGq17yZuZjijtUEl1ni2URYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WDCeOiqix8ITahgpJOXT6M0qAhwYtBhqLH5O0uJYcw=;
 b=RDMuDjGksZ7DjR3rVmqKTJn737rvP55sNc9M4vOOfkQ19r27gmQMtvHCToH1jznz6pSR3nHOerX7GQYcmaK2Aueu7sPMPlIrYYsIHJjZbZRTNxGvfQvuAxgGd8Q3g8M1zU5hZefAm/rEuCOVg3EuFWNjIyGP0T0weP2eQ5k++1Y=
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
Subject: [PATCH] nestedsvm: Don't set VMCB(1-2)'s NP_ENABLE and N_CR3 during VMEXIT to L1
Date: Fri, 18 Sep 2026 13:52:05 +0100
Message-ID: <20260918125205.374168-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0507.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5250:EE_
X-MS-Office365-Filtering-Correlation-Id: 720baa5f-9696-4d29-2c8f-08df1583a75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	/vBGiVJ8bwEfk7QkHjzENd4o5cnqmboiU+UDfS/Q7eTB+cdTLmmr8AYg/Iz0ejJ6zHhu/UQh7YLvCazdZxnO3y5oAYlDCv075intNmosjOxCQ+9iTs+F2CGoXG46n78zXn3C6v6tuD7Tfk9CoLbrI1q5Ga2KenxMu3YgHl8xlPJFDTOF5hmdw30nJbdfpW+upD59vr+4W9rsrgDd7CpjGvinWyWuQfISB5ISrKuOB6NaRCOIG8fx9UEeStLKPG6+h3FqpiupwrPERsCf33A4doWGkMU6/LdXADQF9W0bOX+GcCpfV+nkdSY9egGLcUv5vCK6Oi/yGuzXJGHVqnzY30dqDZQMW6oJGsKZHTNupWaCvlVDl5ahr7zrN3QC5C8doiQdu9jnefqX6Dfi0cU1F9gWXnDU43+mS65Rs9tSB82MLv/dNsZZdDlhfAO4S9FcxY1kBacNKOk6XXINZ03HC1l+Hl3kI0ysm5cL4mxXlt8G9DofSs5ldPwYs3i9om1UbRQmhYsUUAByov4wlOiWThrywABtV99FU67O9XCx4A1UVCKEn2JajYUHX8uspYQF3Cm9VOAvqOU5OdJn7lgeEj6Z/xCuz5Ip7/tUqtP23j+esF0lCwYi44liqrP3VXIgcwDp8vdNCKWAYgOLhTzemdUeqiySCsaRzV+mrVNMat8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1iJXpChjhtHVAJ2lo2rPFk3KaXDAeP9yHfeWUrbMcMlbkWEzwQsqY7d7lNPx?=
 =?us-ascii?Q?JlJn2XmCWxrzapgv1op4vnjduk0O01MxXkC48Zt8Kg5RXXuQnL2/FZD5KfT/?=
 =?us-ascii?Q?MirvnRozA0PCt2/8j3D9kPLxQobsx8mZXZERp/PryUG5oI1IUWJynxDWLUg6?=
 =?us-ascii?Q?Xc9qrXfWTs6+X3r4abiGCgcmk0osRBZXbM+NfzVAC1sKN+qgHjoQdIsBTPIV?=
 =?us-ascii?Q?UgacIU8cgnCBIKEw4FOJL+zBTiUgEmi/nIOFDtQ+qMF1jr73Td17MaHdzRvQ?=
 =?us-ascii?Q?occb2dO5W0cNtD68muQyuu6uNGnFvFS0rR3lwH7Gkmz5r87KFK9BYsmpTm66?=
 =?us-ascii?Q?EpJQ+cNHJeqieDE39YzqkD/mMOO2ExvTcetvv+kQGdD16Ln6JW3aPt1/iked?=
 =?us-ascii?Q?sQdoHIujkO533cttkJL4sWDLmeoiXKE+eZvLsYBPvOKl8R6JS6b2iGtD3Ofw?=
 =?us-ascii?Q?sDPiW0FZT8fXTtCyCekofzihKz9k8RGgKhoUZB33d5FpiWnzBDlbioh3xXb7?=
 =?us-ascii?Q?6iBSE7qATKKATX4PaKwqH0K+TYJNPZTtv0OR8nJu5e+wcKPiN9+5xmTMAZ8w?=
 =?us-ascii?Q?zHrXxHtThwAiapKFMyCDWb4wxsPBV/uCVtmcypW1kmlTAKhnLcoSNo+XCG3N?=
 =?us-ascii?Q?WKlUnPAFFRtpapGvFbNT19ADLr5IVc33fa3jh+OkVDN2HbZrX0VK2G9Mr6fN?=
 =?us-ascii?Q?o6U8VxiXhfbAqs5P3Fgh9IxZjExQS8iE40PkSpFf+qiRXMBsBhmlLa7eqAs1?=
 =?us-ascii?Q?a6a635Gy91jHqwjwPYi7jNeSySt9mC7ZoRlqdQRZv8ZOVfh2WzE64wSWr4Bf?=
 =?us-ascii?Q?iBTiwSWHSPhVVcMSqV8fNtzND1z8Bm6AY+QAeCEPaWewp6ao67YHwq/YWxd8?=
 =?us-ascii?Q?FKjwUUd9AR5k/lUAZkRa0sOLbhbzYYnlGSBBP7XPKJR5QmI0gR2iNwQ/UE1J?=
 =?us-ascii?Q?veUyoi6eMt7BvgD+Q+a5NFqH8+I/VlZKgbhBwk9Mr+45IhBstgSm6p9f7gTh?=
 =?us-ascii?Q?j/oqHefLnbZinQvpJsAvbs+mPkO5F5HnzRbMufl664ypayIRRUGSRH+5Uft9?=
 =?us-ascii?Q?Ob4Qkw9VAUl5kAjwBpXf5Ypao+feq6SxUu75DfyCUqpRWsyxxRQ8YTSkyJLo?=
 =?us-ascii?Q?7un7rEcLr3C/aGUsK8gOenUrgalxIDOrPQaTDwlIZ5f/gL+Ju/6uU0Gz7j8+?=
 =?us-ascii?Q?8DpEo07ih35W4RZJlCdAN2uDcBUQMzW74HHzUtETjs5naRQsoyx+HGL7Mn7w?=
 =?us-ascii?Q?OGRBAlxyZiRolDkcQRCkLIK6B+0pxvOeYV71VeMIuYbvp0vn7nWSWL4TFHMz?=
 =?us-ascii?Q?aa4IzSS/Pjz8bRtZK1wTifXmm9u5rNZTCB1ce07RnqzP2W3udomxz1pf/5wK?=
 =?us-ascii?Q?nvVQKfLG5jnmbh6qCJo8dkhozTU+I7ukmrXzWN5PoLVy8gt4gQXjt/Y3BtKQ?=
 =?us-ascii?Q?BjEd8yNW5WuiJo8yFWZKIb1EjOVsRoLRtXtlF5DoVhoLPqOg9bIyKx2jJwyl?=
 =?us-ascii?Q?kIS+fZNiYIPFOdYMcvq+EvCFWfDUQynhWNx1QY9TE1BHQn2oPFdCTt7976Cw?=
 =?us-ascii?Q?cEh+Xt9gBQIdOScj0pAe7xM/hfcSUKHBE4Y1VXC2saq2eRBscCQmF16cFphm?=
 =?us-ascii?Q?0Lak+w/R1C5WXsIVowk0qJg+8CaAnbplkreav6+S6iucfbEBnkoxo2jan5nP?=
 =?us-ascii?Q?sKb6mFXaNB4/AoZyJUYi464QQwSLnO9uvRRbGoa9Bs0XwAFH6/MMWZDSiNhQ?=
 =?us-ascii?Q?Xn0A/oYd4qLrRr9aRi1DljXxDRKQNy0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720baa5f-9696-4d29-2c8f-08df1583a75c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 12:52:10.4377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bf+yn9iBaN8UO29sdesy6uXtRM5bafIf93gwDOY2LbZnix6R5IblihCQRE68xrsw8Yt9An1dItmAFUfo3sifbzXV4vTVfqt3ImmjO5hLM4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5250
X-purgate-ID: tlsNG-c201ff/1789735934-71CA82A1-DFC3D292/0/0
X-purgate-type: clean
X-purgate-size: 2454

As per the VMRUN pseudocode in APM Vol 3 3.38, the VMCB's NP_ENABLE and
N_CR3 fields are not set during a VMEXIT so don't do this when updating
VMCB(1-2). At the same time, cleanup the somewhat bogus and irrelevant
comments. Not clearing N_CR3 does not introduce a security hole as
stated since L1 can set it regardless and it is never used directly when
running L2.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a8b15d6eae05..c62fca571d75 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1023,37 +1023,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
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
-    else if ( paging_mode_hap(v->domain) )
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
@@ -1083,6 +1052,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* CRn */
     ns_vmcb->_cr4 = n2vmcb->_cr4;
+    ns_vmcb->_cr3 = n2vmcb->_cr3;
     ns_vmcb->_cr0 = n2vmcb->_cr0;
 
     /* DRn */
-- 
2.55.0


