Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B448D606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=CB+9YH/Y
Received: from list by lists.xenproject.org with outflank-mailman.1455079.1668624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ0AJ-0000T3-Nz; Tue, 20 Oct 2026 03:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455079.1668624; Tue, 20 Oct 2026 03:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ0AJ-0000Sw-LM; Tue, 20 Oct 2026 03:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1455079;
 Tue, 20 Oct 2026 03:05:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xJ0AH-0000Sq-V5
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 03:05:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ0AG-00G7Zo-9i
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 05:05:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad6da5e-e002-0a2a0a5209dd-0a2a450c8fcc-16
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 05:05:24 +0200
Received: from [40.93.195.26]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad6da72-f479-0a2a450c0019-285dc31aeb7c-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 05:05:23 +0200
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by LV3PR03MB7432.namprd03.prod.outlook.com
 (2603:10b6:408:1a5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 03:05:20 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 03:05:20 +0000
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
 b=FErW5QHXosfYnH1RgkUSTQ8yOJHFvCMqPjtG6UZiyB3RFXw6LOW9V9q7++JfVMVIoopwHiSN8Z6iunFA2U400u9VjtMbdEEignvEML/q1vWnS9sgui7m5lJIfgg9il4vlI/PSssLs4h98YVLX3gC8fYX52V1iB5KNmbFqvIuPCoWiUPvz2ZXa3dHoxrFtM9H7tvKuvwoLBAZyd9cdO3L9C+64ulrXtqMWBWTn/AUJK5L+3hxl04/IJ9fnhIrR/8luTJ1jWI9zKMRJQXR4O7lqXCQCAPtN1i85okVVP1jbGL/mFR7W8brf7cQ/4nC4/MxEVGKr38Pt9iP/dbQYgESXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Whm9uRPOF4Hbvb1JS/w5hT4zxkjRsYJdS4cbIT+zFDU=;
 b=F4CItEqE6zx0EXmHn4/y62x/bhPguVO5UEYBYbqfnlotCLA9mk8yPk/ox5qOZBPNVl8R2kDILzIqImLqjtUMGzuCQc663ET5xj4HHONDGzgY3c/EjS5tkITkXf/qcUvsVe02tLVcgm7hhssV2288de6Si6cMlMjm44ZKP/0MinHggbiyRacGfAs69Q5FmKuCUXwDagwALukbqahv6aR+MJXGWR6g8fS8ohejG9odUGLDMpxg8n1lT0XgvQiZ2eC9Bm6TVTOvhlmCbg6XzuKjlhfwxBNWOxlbt1in4pB503k95zjE7HA5GiPXoj3S0HXLgd7OveoPRIBFvzkX8wM9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Whm9uRPOF4Hbvb1JS/w5hT4zxkjRsYJdS4cbIT+zFDU=;
 b=CB+9YH/YjxlTGXomimENvn0ksW3QTvayx//1G4V1nJtBY0h1WSvWkZVcSeJesvT6YIThDW10nSlMWW5CSFM2OAkVJ8LgszdhzcrwSOngafYsCl/3nCMZpfOLZgNp+im1wXv6Ej8HcX9WvO+FdxKcvEpR1ZU8GJIxfh4K3euaOkU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v1] x86/nestedsvm: remove dead code for shadow-paging L1 hosts
Date: Tue, 20 Oct 2026 11:05:09 +0800
Message-Id: <20261020030509.308211-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|LV3PR03MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa5a97c-65b8-4fc9-50eb-08df2e56f979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|10067099003|18002099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CiOR5PvdZpWp55hl7u2qr3BdAY2Hcu2414lJYQzBhjghhYV5g5C+eD00j8sOB9fjuc0OJga2gBSZ+jE33cDhd5ZlC401BXJACm/FTS8wWaJ2qiDTCR6Ls+WbDhfZ/PEhGIoT/2T2vyIBnxCB//YaBPptCQrk40tmkSgeby9Al9+iHqJYse8meV0ws8Sm0tyEDQBBJoWok+VUiciI5MwqfFWIfppliEVlATx08luirYoGM9UlId7hf/3zOyK5gWU/1XNqdlYbTT233LyYv245hWixe/dugZuFu2/cD77CYMHH7veZW6Qful48wTZtc5t9xi00aFXhW4y7XevTGu0x3Dm0gjCtDLw4u/nuzYeGWISdp+iFPs599Fv+yesfdZdok1JkY95NGsY3dAL9bPS5weOUv6VzTtOICH77R7fjPGavPn6Jk+eSWheTB+QAxyTwqADepKTwB9sw1pHgZscv/RV0+l/DbJmmbR1YJvzR6AzZaFUwUphCd+6t5RLW1ZPJKqPW2qTUUNU6vbWO5CxHAp0TPyQCbfenO5eE3qdPK6bx3/njw4B0CWtSf1P7BOTbBgGM93lBeuN2ox6roq9M8tK9SjGJGAxp1K9eGW3eBSqVlc/3OnE30mUbTHu8JltFcuhfPzVdsNpyX61LNLaTXq6e2Q90POGc5trCy+xEaUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RqH7xEFr5x+gPyJNIC2gZTc2zt/x7iJZDxKUo8WwoF/GfY73of6XN5IGuiGf?=
 =?us-ascii?Q?mSlpmEhOOk4alZquq+SJkRSjwxH8ady3zmFOiM5MfP5fOtTz+K9dAQItvIU6?=
 =?us-ascii?Q?a8rqmtBDDbp0yHKNV05q1vF/wWV1levPT4630AeUKQUxTxiKE+rF1n861zGl?=
 =?us-ascii?Q?WwflfWIRNYtOu02eH5/vNWckIoH5SCQWvh/HrDdgpqTSIKtRzeHOX0rKC9Z5?=
 =?us-ascii?Q?fJfJz850skiB92ljf9+CInRhajAQ9clFT4Q2HD0b/dVebRMjI1WIYq3e5VHL?=
 =?us-ascii?Q?Ap0VSVTbTuoODVKV75rUmhabGU4gil5HnUDDzaOsDytZFwraKqkx7SVvvdFD?=
 =?us-ascii?Q?HgO28yAZzPfE35jpECSkl0ukXMFt2WGpWAebaOWDsY2Y+jedEzEvyR6B3Lsc?=
 =?us-ascii?Q?7DF6QSAKRfdceoTCoOGi7v1FIm3IxTr7VucT+GYfrXmIx1ZWltfeC9LY0lE8?=
 =?us-ascii?Q?dO1Ph5dnqd0l89LzjqzEgT73xT17hd3zCQ69ymKGvAcYluzLrNYxbMnZfs5M?=
 =?us-ascii?Q?YrrpVZNr7QWGWIN4N7VBJFc5EsbR6D3EyCSTcT++3Vy2fuvpWYKCaNFBEztB?=
 =?us-ascii?Q?GYbCZkPALjOTKgeMBlx+SW6pf29roWgpTKVitVn0upIuSLDyb9GqlC+tLxgT?=
 =?us-ascii?Q?lwgrRCXaKrALAouazTY2cxmhq4d4cJDoZ4BCYOetc6rWuyD3XsvMlB/RbczG?=
 =?us-ascii?Q?33omApEBOciK6FwkmHrfIS6KXMEfdSx5n2KaUQ1aFnxcjPzd3nqC30/pt/Xj?=
 =?us-ascii?Q?ePX1RcgEKEWE6T83MSs+Suw8ItyM8jk5D1Ijwhz9gL7CfPs5AbO88WzFIltJ?=
 =?us-ascii?Q?CvuvqQKYod9F5fifmHrk64m4VWEonrpAtfruwBKL4P0funqSZHHginHyLzrw?=
 =?us-ascii?Q?585lsmKEjrM1SHyygt0Cmo11fc0J4ULfpNEdiaMT1c+mEdO9byROPiv0JR94?=
 =?us-ascii?Q?errGEFrZBcdfk9p3K5hzrQmu+x5JexhPu0BrHo0/cvakAA3/C/FbjqbqLUsn?=
 =?us-ascii?Q?/lI8m1RXrmRcqoz5tA/dQLMGUWk7ljXWIrYXLgkwWlsUHeNKhJCw262Dlmqb?=
 =?us-ascii?Q?1c9os5zemlfH85nQ+f3m/30C++6OCsVkL2hPqAApyAnijO5LTsJXrAtnejj8?=
 =?us-ascii?Q?mYsbTHBsTmZl/5dmYtWYstoHkClATSU2sCAG+VwH2IrC0oQlUr6q2Wb0JBhZ?=
 =?us-ascii?Q?2SEeiSegSRgC3drMMJR94sjmKZy/CYHYMEiPTt/WMisW1ExLgy/sS7M6QDuJ?=
 =?us-ascii?Q?Wd46qh2DFes9pOjjJmQHbRJqPoFSmbWfIYZ2W5h585eCSqDtHhgUgluhV0an?=
 =?us-ascii?Q?r0nEklVHWsWk/AJRpC5YR46SlU9/xCJllZyjwuu39ex2n1Jim9LrkZ2IiQ1+?=
 =?us-ascii?Q?0dJ6vhPxAYbdemCiJniRLbW5EuQkIQwfDFLaVbZYV+WzU+SgpFdVobr+pciU?=
 =?us-ascii?Q?TqMA2rLEqNd6H8AYCSne6tULo2whPTDSBIS5bWYdmppT2j2ixVcduZpODRT2?=
 =?us-ascii?Q?Wu4Ewt6keTsp3rYFSqQxp8xHLwGKnoZ5ueXd86foqvYgW9XS6DODbRyWuKb6?=
 =?us-ascii?Q?J6i3oFat+lvnq/ult90gpG+BcNhXYTcpC8cn22SOwfvRHJ62g6J1PRgLLY4G?=
 =?us-ascii?Q?eZzr56ysnoNxU2MPWjvZxZPnQ8/hSEI4PblGEg7Xk6dXcxRbKoK7vxwm3lP9?=
 =?us-ascii?Q?Amdjpyf2AMEZwCbNmBXT4AAgGTZxp3dW3rWTxNnA40LvWitwNArL6vRSrebF?=
 =?us-ascii?Q?bY3eQ3xwsw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa5a97c-65b8-4fc9-50eb-08df2e56f979
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 03:05:20.0764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dHIx6uoprbvB67teEZAR+Vbuu4qPcK0MwWilJvnJxa0l6V7h/l3FEpDnM+Nm5T373Q8w/BqwmeXBqkimjrukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7432
X-purgate-ID: tlsNG-d25034/1792465524-76CDBA5B-FEC71AD0/0/0
X-purgate-type: clean
X-purgate-size: 7370
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Nested virtualization is only permitted together with HAP:
sanitise_domain_config() rejects XEN_DOMCTL_CDF_nested_virt without
XEN_DOMCTL_CDF_hap.  The L1 domain therefore cannot be in shadow paging
mode while nested virt is enabled, and paging_mode_shadow(v->domain) is
always false in the nested SVM code.

nsvm_vcpu_hostrestore(), nsvm_vmcb_prepare4vmrun(),
nsvm_vmcb_prepare4vmexit() and nestedsvm_check_intercepts() still carry
incomplete, never-executed handling for the "host shadow paging + guest
shadow paging" case.  Drop it, and guard the remaining branch with
BUG_ON(paging_mode_shadow(v->domain)) to document the invariant.

In nestedsvm_check_intercepts()'s #PF handling, test
nestedhvm_paging_mode_hap() first, so the reachable "host nested paging +
guest shadow paging" case returns NESTEDHVM_VMEXIT_INJECT directly.

Also drop the now always-true paging_mode_hap() check from
svm_nested_features_on_efer_update(), and the stale "shadow-on-shadow"
TODO in paging_update_nestedmode().

No functional change.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 65 +++++++++++---------------------
 xen/arch/x86/mm/paging.c         |  1 -
 2 files changed, 22 insertions(+), 44 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index dc2b6a42534a..748c821d40f8 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -304,21 +304,12 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
         /* host nested paging + guest nested paging. */
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
     }
-    else if ( paging_mode_hap(v->domain) )
-    {
-        /* host nested paging + guest shadow paging. */
-        /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
-    }
     else
     {
-        /* host shadow paging + guest shadow paging. */
-
-        /* Reset MMU context  -- XXX (hostrestore) not yet working*/
-        if ( !pagetable_is_null(v->arch.guest_table) )
-            put_page(pagetable_get_page(v->arch.guest_table));
-        v->arch.guest_table = pagetable_null();
-        /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
+        /* host shadow paging + guest shadow paging cannot happen */
+        BUG_ON(paging_mode_shadow(v->domain));
     }
+
     rc = hvm_set_cr3(n1vmcb->_cr3, false, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(X86_EXC_GP, 0);
@@ -580,8 +571,11 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         if ( rc != X86EMUL_OKAY )
             gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
     }
-    else if ( paging_mode_hap(v->domain) )
+    else
     {
+        /* host shadow paging + guest shadow paging cannot happen */
+        BUG_ON(paging_mode_shadow(v->domain));
+
         /* host nested paging + guest shadow paging. */
         vmcb_set_np(n2vmcb, true);
         /* Keep h_cr3 as it is. */
@@ -596,16 +590,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         if ( rc != X86EMUL_OKAY )
             gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
     }
-    else
-    {
-        /* host shadow paging + guest shadow paging. */
-        vmcb_set_np(n2vmcb, false);
-        n2vmcb->_h_cr3 = 0x0;
-
-        /* TODO: Once shadow-shadow paging is in place come back to here
-         * and set host_vmcb->_cr3 to the shadowed shadow table.
-         */
-    }
 
     /* DRn */
     if ( !clean.dr )
@@ -1088,8 +1072,11 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
          * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
          * hence we keep the ns_vmcb->h_cr3 value. */
     }
-    else if ( paging_mode_hap(v->domain) )
+    else
     {
+        /* host shadow paging + guest shadow paging cannot happen */
+        BUG_ON(paging_mode_shadow(v->domain));
+
         /* host nested paging + guest shadow paging. */
         vmcb_set_np(ns_vmcb, false);
         /* Throw h_cr3 away. Guest is not allowed to set it or
@@ -1099,15 +1086,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
          * by restoring cached intercepts). */
         ns_vmcb->_cr3 = n2vmcb->_cr3;
     }
-    else
-    {
-        /* host shadow paging + guest shadow paging. */
-        vmcb_set_np(ns_vmcb, false);
-        ns_vmcb->_h_cr3 = 0x0;
-        /* The vmcb->_cr3 is the shadowed cr3. The original
-         * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
-         * hence we keep the ns_vmcb->_cr3 value. */
-    }
 
     /* LBR virtualization - keep lbr control as is */
 
@@ -1320,16 +1298,16 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
             /* host nested paging + guest nested paging */
             return NESTEDHVM_VMEXIT_HOST;
         }
-        if ( paging_mode_hap(v->domain) )
+        else
         {
+            /* host shadow paging + guest shadow paging cannot happen */
+            BUG_ON(paging_mode_shadow(v->domain));
+
             if ( is_intercepted )
                 return NESTEDHVM_VMEXIT_FATALERROR;
             /* host nested paging + guest shadow paging */
             return NESTEDHVM_VMEXIT_HOST;
         }
-        /* host shadow paging + guest shadow paging */
-        /* Can this happen? */
-        BUG();
 
     case VMEXIT_EXCEPTION_PF:
         if ( nestedhvm_paging_mode_hap(v) )
@@ -1341,12 +1319,14 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
             /* l2 guest intercepts #PF unnecessarily */
             return NESTEDHVM_VMEXIT_INJECT;
         }
-        if ( !paging_mode_hap(v->domain) )
-            /* host shadow paging + guest shadow paging */
-            return NESTEDHVM_VMEXIT_HOST;
+        else
+        {
+            /* host shadow paging + guest shadow paging cannot happen */
+            BUG_ON(!paging_mode_hap(v->domain));
 
-        /* host nested paging + guest shadow paging */
-        return NESTEDHVM_VMEXIT_INJECT;
+            /* host nested paging + guest shadow paging */
+            return NESTEDHVM_VMEXIT_INJECT;
+        }
     case VMEXIT_VMMCALL:
         /* Always let the guest handle VMMCALL/VMCALL */
         return NESTEDHVM_VMEXIT_INJECT;
@@ -1619,7 +1599,6 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
     if ( nsvm_efer_svm_enabled(v) )
     {
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
-             paging_mode_hap(v->domain) &&
              cpu_has_svm_vloadsave )
         {
             vmcb->virt_ext.fields.vloadsave_enable = 1;
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 65455a686787..277d84fb4cb8 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -924,7 +924,6 @@ void paging_update_nestedmode(struct vcpu *v)
         /* nested-on-nested */
         v->arch.paging.nestedmode = hap_paging_get_mode(v);
     else
-        /* TODO: shadow-on-shadow */
         v->arch.paging.nestedmode = NULL;
     hvm_asid_flush_vcpu(v);
 }
-- 
2.34.1


