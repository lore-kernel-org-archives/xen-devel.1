Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD42CA5FA6
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 14:03:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436048.1654828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBx1-0003W9-Gj; Mon, 28 Sep 2026 14:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436048.1654828; Mon, 28 Sep 2026 14:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBx1-0003W0-DI; Mon, 28 Sep 2026 14:03:27 +0000
Received: by outflank-mailman (input) for mailman id 1436048;
 Mon, 28 Sep 2026 14:03:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xBBwz-0003U8-Ns
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:03:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBBwz-00Ak4S-4e
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:03:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba73ac-2eae-0a2a0a5409dd-0a2a4502a670-2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:25 +0200
Received: from [52.101.43.15]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba73a8-6ca4-0a2a45020019-34652b0f35d3-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:22 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MN2PR03MB4990.namprd03.prod.outlook.com (2603:10b6:208:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:03:19 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:03:17 +0000
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
 b=WBm2PhfFZNIenikSfQMV8Mg1gcFfqZMGlRbTgS9Rt7PAlVK+N9N9LltV1ErNYuPcnKWZbnliA/FK3dWqew6p94GqqYcSdRpALZMKqXgAEeVgiVn0tjXixzgVVCDbACsKEHE7ZzipcDG2siEvtTq1oyNQ6bHcQejOgeXsRtGIZ0Rfjr/yZ1BmBL5567vT/NRvZMiAUhD9ganyty12Hx8F7ehxh3PO4hgi88xyJt6jIA+WyfLtR+e/RK88dBqwAio+870r1tnzwqEKGCf0zIXj0/KgJEni+YO1EfoJWe2eQvhPKwn+f5c2yOvW/9ap8w7KuudSTmvAEnhoyrfNhxn/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DzsBgCZLwDuu4rBUgrSV4kLTJ4xbE8kb75s3QrmVZc=;
 b=sqrgLpM6CqyzrLDWiZt/XYAvJuAXqojN7koMeGXjcWeHE+6G9yBRL0bmKrlJSU2iIZDaodV0CzLnv00Y2fObChQ15r4sgTY4SCi3qgRKJ9Ox4qhNUTUOCvQtJd77Yb4BZvqfIA0bM+NGzXx1+FHQ+4T88KXGQz4zzzRCZX+v4M7jKQzaadi/ttaVUGP2Vp7+ubRW0+1Fu8Kg2qMJPZNh/KAgj25DGC1X7qSDlL7C3n1XSD8RKvS4koSaispCTuLAqMIJbWzvH54hFp7OMrPkggTNmosj4YWpwnb7rOh0lGhUL/VMe6jNTHMREPBkj6ld0K9h4T/1Sb0Yua0FMyqteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DzsBgCZLwDuu4rBUgrSV4kLTJ4xbE8kb75s3QrmVZc=;
 b=hwwx5rV669f4mIxAf4plYYrsXMm66ZKNdrBsp6v6X+kf+q1vf0N351SQn0FmD4OwD5dJIaFiZRFSw5HQ9759aRlV11L1ChvJl/QZtbREKAj1TucpLgtAIi+fuAkvShJlPtS26BHxz+Ieh07+VpyAlJLNTSwHgEh9kDZlBcIjscc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 3/5] x86/svm: Cleanup virt_ext_t type
Date: Mon, 28 Sep 2026 15:02:46 +0100
Message-ID: <20260928140248.1543013-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MN2PR03MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c91021-1645-464f-22b5-08df1d693f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|10067099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	yto/h1SElvrMrEWjbr26b0jTMqmXC/yjA98xSNc5Z9Nd3Q3FAg6Dw4eVJ6hc2jtYJq0F5utbUMg1nHyXDRNVrvaDL/E1igrIjdUxMqIH/PTEd8dNLYC2hgIVTERsoQhVx02t1xYTRj2C/vg270v3KoeGiCmTS/dHBfaHI/xxst/EM2DrjXOuWtvtsRj4gsaY1SAp/9v+AsnLHH/tx/hjT3iAnOTJG5lQhscRlI5EtWLUhIFGktIkzQOnHSXmIS9qLy/wXXFhVoEQKYaAqpFKazFHoKS/ok5TT5t2LmTE5endT8FI0+fJxbLXC1tjmGuZEHxOOudolCXpaDOLOVA3vjccD37yTVFkMhrk/yqRIV59OugkDhSwECRZke29s2IfvmdkYZqnuvSxsRyVvN0d45yXYDMRS1C4elsM8A+nmmefmQBc/uk0+ax12A37c6YXZK2XsIndi3EwPUS2cWqkBjgVy+aoEX/rAzIL+6luOWNJMV/h7ra3e+jQjDbXWR20yP5Y6dEBbU6DRLSMyq6YUx6w2q49MBcQsWfqWkQV3fFPSzDYWGxIOHcRJzkkVXBN0kk8UAcWIdQ/aH0CAi1Wteduwo7jxhJUp63hsjOlxPwENh3L8GCyPqwKOPFR7mc2uCc/qKhSPnTYT6ZXSu5TsqHNcvqwYH5b6Nb6MNZj6EY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E2Oa2dPnB8XsnHyQpsvjIb+qEHP3Ypn+5f1mfKwW7DDbyLd4Tb79vN0E9loG?=
 =?us-ascii?Q?1Etbjd4d/ePnYbrlCWcvKMNNRmtj2oJUdqzDSe2NQxi8vEeQPBSQPdvmbbGa?=
 =?us-ascii?Q?KeiE7jeVCwrqLKVJBwodL8eB6NuvC/ZjTm9RZBWK1xZ7c4aVVqQEwZ5raHSN?=
 =?us-ascii?Q?TaYCCqRawwdGh9QHt2xKLFVfxKHMDITlmr4m10D2t+mTTEL7KzsibM4SwmEv?=
 =?us-ascii?Q?dP2vLaF5UwakLCEK81kfSRDUiuDaMrpVWfQS7W5mD/3yvXRrWNrxk21xuVwM?=
 =?us-ascii?Q?xAfFuYsxRJR7iEa+uqkjWiRNJIs9nE5IrHlX6l/5lu1gt6pK72eL8FkSzqNY?=
 =?us-ascii?Q?8dbfBN690REQTErNLokjr7GJqUmRm1hyPlIJAjTf7A/ZyockjSPw09UrkyQ+?=
 =?us-ascii?Q?G4oj+7dC8ZGCFn7dcRtxV7vFPc5Tml6N682j0PZOIzAnTy983zAye1g2BQf8?=
 =?us-ascii?Q?rkvcmj5/JtmMYCGRZ4OMT3hK1ky8kkKazjIY+CXZYjrKaXfhODEwVA2yPZ9y?=
 =?us-ascii?Q?yMr/nNtvETz6Edz/LkKaumLKMznAokro9/QIwFij8WFEOqb1QhGDC6n+UVsW?=
 =?us-ascii?Q?SeMoU8c81Dmzsa0FvdvaYKZ9g+nWDXlDVZWTw9JUy2Zz9WA23zvPgTVVPaNv?=
 =?us-ascii?Q?YOEFtxP9ViMvPEgzmCF6V9kyjVPuqtt9TDvLjNcVojPB3syRkjLlzSyFzwO6?=
 =?us-ascii?Q?Eeq7yYsk0ttx1QWmmM+HveBoAsuRKCO93E5HoMmIOn+d4prMQDI2BrEBL82m?=
 =?us-ascii?Q?V9i+1vPibLMJ4ZsIEmUPGZQhVgnuriUGzjNfBWKwH/uhcs7oJH6Mq3aqVQOj?=
 =?us-ascii?Q?rUnU0dDeZr1k2T6fwHomBxA3tsgsXH5wZ3/l4qo84pfQoVDLDnPzohT3t35r?=
 =?us-ascii?Q?t0GV91K8LfKQMTz17eAFiIba6mr4izN/AjOlkYzfzTeb2zBUpDg2sTomM8DO?=
 =?us-ascii?Q?EFQkbo4j6SVEsi/usW0DM2m5S5yFW4KB86uZNHmLyHRfiPy/KQoavwD7PHPy?=
 =?us-ascii?Q?dlDsUM4OVVfWmIKu6RVBd352xkKlOkYVpnXwMCJIw7pBbRnE/iodyBzTd0Es?=
 =?us-ascii?Q?OxKzE8CxET0gEV58wnL6WN0IofzOZzM2fD7jRys1yEL4UBY5A3VpSSrX4FLj?=
 =?us-ascii?Q?q9NeXq/mVswjI5+7OstfwlxYFi+UryRy82CEL1aDhBOJDfwQ7IlnqN5/NicE?=
 =?us-ascii?Q?YeMxBaCHjEgu9ljvVsuq1XUam2TF6ED7ddSK/4OY40pLoRBpBDZ8OmlyquCJ?=
 =?us-ascii?Q?LsiM/NSpiQ812WFE2bA/vB1AYXz2n8CGPIjXvh+aeD8i9qbFtV5x2pj7oQhI?=
 =?us-ascii?Q?i+5Fd9Fjg6QnmCUB47EujrUQOFFL66Pru2f68wxYLVGvpRdamWkQUix23o2N?=
 =?us-ascii?Q?/SFBBbkDfNeQ5y/e6eUqpFvz2vegbnNu8z1bz8C0SfKYEbfeCB/V7WKre/4b?=
 =?us-ascii?Q?pef+ChopbOC46MeepafGZiUrKSX9Z1Ann7RLOfq87Z1WRcY0THoWTz9WHCUi?=
 =?us-ascii?Q?ZwnSXn5zTHoUtbjvGmXCPbyzcb94nQG9SdolWzK42I70jWWt4YEZSMdc8BI+?=
 =?us-ascii?Q?xgNTC6r9Q6b3ZkfflONyMkYuBU8nlzZUk3vABHYcVPF+gJBza2lUlA/sYwgU?=
 =?us-ascii?Q?agnJMFigmR7ebc2SQUA1OxHdz5NEsI8/3tipgcEZgz2/HlpQNNWDSISIzHPx?=
 =?us-ascii?Q?dVzEWpbbTFZHdUF4gmvsUNEnA7gDkt4j4O4XhuJbAft5LVxRVMkz6OnyWeUj?=
 =?us-ascii?Q?STx10hJGiO4+93+76uQ6KxUkcynpRxg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c91021-1645-464f-22b5-08df1d693f04
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:03:17.7476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbLIdLbqsr03yUfS1R+FAoc3HNsn0TjTpxz3tgu1Wk0VGGRv3gbBoEVWm7U1KGFJYQHo0fhK56/d69AdeMIb4Ckxz4bKSZqmUMpHgJn1aqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4990
X-purgate-ID: tlsNG-720697/1790604202-F2EB32AC-3D7DC30E/0/0
X-purgate-type: clean
X-purgate-size: 4300

Rearrange the union to drop the .fields infix, rename bytes to the more
common raw, adjust types where appropriate, and simplify some names.
Adjust the users accordingly.

No functional change intended.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 11 +++++------
 xen/arch/x86/hvm/svm/svm.c       |  2 +-
 xen/arch/x86/hvm/svm/vmcb.c      |  2 +-
 xen/arch/x86/hvm/svm/vmcb.h      |  8 ++++----
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 13a2144fdba4..1ef4c5c83f16 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -457,8 +457,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     /* Pending Interrupts */
     n2vmcb->event_inj = ns_vmcb->event_inj;
 
-    n2vmcb->virt_ext.bytes =
-        n1vmcb->virt_ext.bytes | ns_vmcb->virt_ext.bytes;
+    n2vmcb->virt_ext.raw = n1vmcb->virt_ext.raw | ns_vmcb->virt_ext.raw;
 
     /* NextRIP - only evaluated on #VMEXIT. */
 
@@ -1556,11 +1555,11 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
      */
     if ( nsvm_efer_svm_enabled(v) )
     {
-        if ( !vmcb->virt_ext.fields.vloadsave_enable &&
+        if ( !vmcb->virt_ext.vloadsave &&
              !paging_mode_shadow(v->domain) &&
              cpu_has_svm_vloadsave )
         {
-            vmcb->virt_ext.fields.vloadsave_enable = 1;
+            vmcb->virt_ext.vloadsave = 1;
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
             general2_intercepts &= ~(GENERAL2_INTERCEPT_VMLOAD |
                                      GENERAL2_INTERCEPT_VMSAVE);
@@ -1582,9 +1581,9 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
     }
     else
     {
-        if ( vmcb->virt_ext.fields.vloadsave_enable )
+        if ( vmcb->virt_ext.vloadsave )
         {
-            vmcb->virt_ext.fields.vloadsave_enable = 0;
+            vmcb->virt_ext.vloadsave = 0;
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
             general2_intercepts |= (GENERAL2_INTERCEPT_VMLOAD |
                                     GENERAL2_INTERCEPT_VMSAVE);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 05e25764f4b3..8a7a58317d60 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1933,7 +1933,7 @@ static int cf_check svm_msr_write_intercept(
         vmcb_set_debugctlmsr(vmcb, msr_content);
         if ( !msr_content || !cpu_has_svm_lbrv )
             break;
-        vmcb->virt_ext.fields.lbr_enable = 1;
+        vmcb->virt_ext.lbr = 1;
         svm_disable_intercept_for_msr(v, MSR_IA32_DEBUGCTLMSR);
         svm_disable_intercept_for_msr(v, MSR_IA32_LASTBRANCHFROMIP);
         svm_disable_intercept_for_msr(v, MSR_IA32_LASTBRANCHTOIP);
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 753f5d295064..694166bc5f39 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -291,7 +291,7 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
            vmcb_get_sev(vmcb)    ? " SEV"    : "",
            vmcb_get_sev_es(vmcb) ? " SEV_ES" : "");
     printk("virtual vmload/vmsave = %d, virt_ext = %#"PRIx64"\n",
-           vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes);
+           vmcb->virt_ext.vloadsave, vmcb->virt_ext.raw);
     printk("cpl = %d efer = %#"PRIx64" star = %#"PRIx64" lstar = %#"PRIx64"\n",
            vmcb_get_cpl(vmcb), vmcb_get_efer(vmcb), vmcb->star, vmcb->lstar);
     printk("CR0 = 0x%016"PRIx64" CR2 = 0x%016"PRIx64"\n",
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 2fc10caec136..34308f3b19f2 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -353,12 +353,12 @@ typedef union
 
 typedef union
 {
-    u64 bytes;
     struct
     {
-        u64 lbr_enable:1;
-        u64 vloadsave_enable:1;
-    } fields;
+        bool lbr:1;
+        bool vloadsave:1;
+    };
+    uint64_t raw;
 } virt_ext_t;
 
 typedef union
-- 
2.55.0


