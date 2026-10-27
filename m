Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1651C606A339
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=KNdVgEpC
Received: from list by lists.xenproject.org with outflank-mailman.1461876.1672885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbkS-00049m-5a; Tue, 27 Oct 2026 07:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461876.1672885; Tue, 27 Oct 2026 07:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbkS-00049f-2x; Tue, 27 Oct 2026 07:37:32 +0000
Received: by outflank-mailman (input) for mailman id 1461876;
 Tue, 27 Oct 2026 07:37:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLbkQ-00049Y-Hh
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 07:37:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLbkP-0032jn-N0
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:37:29 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae054b0-bab6-0a2a0a5309dd-0a2a450cea50-24
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:37:29 +0100
Received: from [40.107.209.56]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae054b8-f479-0a2a450c0019-286bd1388338-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:37:29 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by PH9PR03MB150476.namprd03.prod.outlook.com
 (2603:10b6:510:419::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:37:26 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:37:26 +0000
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
 b=LGoQakp2plG52f5GTpgZ9RMznxLvea4Zfo5j0GQGBX2worxtMLxtqeVzxsH5OKf4QetnoTXV7TGrvQ0V4HvdPoNzPcRNdoIFbMYmyOAnYFawf7cBkkJHb2DANcW1rOR0K5C+g48TOjlZ2Drtk6khtg2NrtU9TlXqXlkx1wpjIa+HFfCBEXjbj+Lq2PRSxE+KTNCtCmFxo2EZEJeG7u99CKFkXl+wJ76vr66YNkZeytC2WCoFI9ihSLQY7KCDDf94YpYMQ0pg+NvBTP3k1T4t/akCgU0uOHA2PCAyReIunVSu7/7pk8z6/UAvQ1PZUTy8Ho65lj2XLDSLwMjuPXRAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zW+732l9B3YnoxzPySgT67ee/VoumKVrKpfiMot4hk=;
 b=xs76j4S9mXQkG+T3fw2lpIsMp+0exuBZ74bsozTbReaqQ6Py56wxZ394JZRZivvwdvX3AecARMv6+BfQ0BD3zOJ5J28Ad/UhdgQtYJV2emJziUrj7zKyVBZei532nCmVnIjWM5Q3Q7nJbYl8psItEs7BEZdHNrr7w9+QQIOZa9RaiqQzqCIhmiLNvcQ8cVW7RYn8M2dlr+gf9XSKO3+dDmenwAlCldQw9Pw5hsrCDJjeTI138CfBkvQ11l8d7sQGeQRxgLfbaXr1UnahvkTed8JoxajIeKM3XLH8W7Nginhpe980agAL9w94+jKjxNyziciGJQfKpYnGFV5DYGxLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zW+732l9B3YnoxzPySgT67ee/VoumKVrKpfiMot4hk=;
 b=KNdVgEpCuHf2qZEkNuLO5jp5sbwTdU7T/QOlnFZeJjtmifAXvrFhH3CvVn9yqGUokTujVz+qUZuu+bRVxndTLmCybdPLW0imR1gLcmjkPKEtFPc2fdP5mpHGqOBe7roWr90H6xJp5+cdAOrDkW9iXoYRzxCXzzxEFOCYxzr6o88=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2] x86/nestedsvm: remove dead code for shadow-paging L1 hosts
Date: Tue, 27 Oct 2026 15:37:11 +0800
Message-Id: <20261027073711.30963-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c7cfb94a-1424-4ed8-bd3f-0216edb2c799@suse.com>
References: <c7cfb94a-1424-4ed8-bd3f-0216edb2c799@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JNAP275CA0072.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::23)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|PH9PR03MB150476:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c322a45-7a4e-48d9-dc2e-08df33fd2581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|11063799006|56012099006|261009223027099003|261021121427099003|261022105027099003|10067099003|261021123027099003|18002099003|22082099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	HMz1Jk3Vid6PachHFuDAwpJ7mZ3OSgcNzmhgXj8fpgqZqV99xji0lYg6JksQE/ToHJU8BIYrTrdjFqkAT3xXDubNLf2fg2JiSzbiCThdl+w9Aj5vaN/USRNpNlCK86R0/gEMTBxVOOlh0zF1e9UBfaoAPkQTQJ60WfuQsXPxMtA/VnV11Z7+2qu07I8pCfO5MZxCXi7E1ZbY2jbI2J1Skjl1KD6wUpLh24FnII8s6LYY0wIDV2D9/0LXQanZowlM/wBVfUlMXvlEupD+3PFKzH6u05n8OM06poJS2hnRPVihAfEndQdHm6QVJLblmDXz0ucUc8GMSe+UcNZQuwvi6QsQGbUDN70SnWCjt2KaPqwB8PMQ8+gZmPsOspCTdY4LppdIHJVcJ0EUGbizsN0AQQm+DAtIq3O8lsfjj2t2iXm1xqwnKGr910zg7zb1MaplLEBW5VyAXrToGCjNdYVTfGBrmT2P2yG/LYZNoi7VfdB2cgl5XQggS7WqIfj9+KDex4vYI8EPah1RIP9hubhSci34zPFh54YjvnqOosjHEUiJitvcTOvmRkyGExfAYj2JE65/8lMFZOgPZi1HaTjdl4uwnuE5n4+6EMpMUg/Rkv7GDCV0S+I/hTrYFF2ffTQuo8cG75O2Nrj4zYYShA92snLrwsGpThdXn0tHVuppfeg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022105027099003)(10067099003)(261021123027099003)(18002099003)(22082099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LGVSVqb68P0KkSBpqpkNACUP3w+DTQOPhqqyKMBGMXUdff477FWtir3frQZm?=
 =?us-ascii?Q?m1I8dpBhiyRrTjjPsuwjpak0Q5QSDmjiVXiZ2xuX77WVvKHkMb5GOS4JCulY?=
 =?us-ascii?Q?GRuqSDjLg0D7/o4RNrRyqBom9EgpEUzAjwM5QnVc07Ugwmh5m9qShI6KeFjQ?=
 =?us-ascii?Q?OpTSF2OyDYIowVcmn0oGY7IB0E6F39aBUU7xfb5BHe0l3O5R3JMrG1CTvZH8?=
 =?us-ascii?Q?WXcWfdFIQ18EFIdugQe1dnCUTp2v7l3GGSjXFqBxHbEeLbE/1NFdFg1rr9iy?=
 =?us-ascii?Q?jka8umxtn/bh80ecmLXklqU4VjKyqrjdhaceRD9YHP8QOE4Q23Bz0zCctIm+?=
 =?us-ascii?Q?/hYF+RYZsuOGkkaJ5hOhqaF9Ox/Lpogvc5542vefNnyl6VOGwsX352DfZa5/?=
 =?us-ascii?Q?1F0TjfMytIVZAxrLd68OLHFTNd9JO2YOh13EV60ciypOtbJt2KViS/xLG253?=
 =?us-ascii?Q?aTGDMKlZTxOoENoCVmDt1YRyHLIG6x9ikq9DyEHSMvT5Aa8PB/D1laOsTaSO?=
 =?us-ascii?Q?clUzrX5SKqsmm/g0emzu0CYTnbF6kLl9Zk/Swm+MeqU85eDpCwM4pzNp+vka?=
 =?us-ascii?Q?W7vSi4FUG2SvVPT+j38Ce6V0+/I9aKrSrvNoAZHwyP9MeAsZagdMXjw0saMS?=
 =?us-ascii?Q?mRBAPiWePuLI/rPFJkVaOjne96IEvaQyfk7qnh1axmWtyc8ngHJsajeFbDhn?=
 =?us-ascii?Q?hXpg/JPIVUzFQ0RcpMIkphzc+wo+dVye/uiI58GltP5y7J4MGQKN7iC2q5v0?=
 =?us-ascii?Q?ISApOYFsrnlv2t1iHm1s8h2vmQzazJJKQfqFLfI/zX2W5sMPhyYe61tmtKws?=
 =?us-ascii?Q?CSyd3YKF3OwBhUA2V09rzJACXSYqmK6RsmCE/dHyCA0J4YXXvcgRH2HfM0+P?=
 =?us-ascii?Q?Qu3/hJx4Rtl4KP8ypzXxVZaWaW/s2ztJziq7V+k292xNn3UT46vr+4QoMP5Q?=
 =?us-ascii?Q?5tMR87DKdS6aMTdG7pNxRmw3bIZNlqH1gafr4BzqVHM2dnORJMX5sYNNXe/a?=
 =?us-ascii?Q?ftnPSNi+CvWsokguvvmGjHaCma7SYUozy7cOqxOXuMV4J4cKRF6lTzJq0sUn?=
 =?us-ascii?Q?bbFY/tJg3t2ohMEeOk5xOIsDXPqw1Wt9Jvo3Qv6XJv0YqCJ9MPM+Knktm30I?=
 =?us-ascii?Q?qezHp+/TC88SI1Y1O3bnJjQM7SXEhri7Zkdt42V9i61uyaVyGZHxRrSyV4Wt?=
 =?us-ascii?Q?aMXy40+Sl47thJJYI5AKqIgPFRd/iUXNAkcJw5REltxfFbJnspjMtWTBKMZJ?=
 =?us-ascii?Q?2NdupdxDCEiBHgiRmeP30OoD5iAtckZAdRDn3wpnvCMckGFblrW8BLJF0sG6?=
 =?us-ascii?Q?xmjsBHCYHTC/b8b3Xqz9Z3mUXBwYxRVlPYZQ5mIHKLKGVuielFrJwCaEHQeq?=
 =?us-ascii?Q?FQhKkX8VgBSr9FflhVurkpph9AIsx5Ryk7uD4DhoxrOQJm8PbSfILGYkIgbq?=
 =?us-ascii?Q?WCDk1uAseQF4OEIRRTob/b+0eCvZsR1N07ng9vLkmNnhHYVLQnQnqtT5YfZc?=
 =?us-ascii?Q?m57YIX2DAZI1EAtH4SWDrmWFj5Bb9/Qm0jPtkYELqbN5q9fc1byOuoSHswNQ?=
 =?us-ascii?Q?yf9HRIdPabgsr9Y6zfgtO67EyE6SqhB4fc0ECj2ZAlSybSGkxJ8IASJjz2yd?=
 =?us-ascii?Q?UgbHOfSv5OVKAwTXvL4wBu+VdXQRwH0qm1N+OlHgYGgBGm3ZBFd6fon41VPd?=
 =?us-ascii?Q?KxCZ3IpZf2xqZEb6IXw2LtBy2d+dbQxQcO5eJ2wsa/vofmMMGPZ3euUztB5g?=
 =?us-ascii?Q?YZcWlqtGLQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c322a45-7a4e-48d9-dc2e-08df33fd2581
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 07:37:25.9962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmpGn2d9dePB2MGz52/b2AxbqHeILDEXmD02TtDgTGwPt0SC3HPqENVUyPTgUaji+tUN3KEaY0D4zw4iyOjKUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB150476
X-purgate-ID: tlsNG-d25034/1793086649-77ED2A5B-0966C5ED/0/0
X-purgate-type: clean
X-purgate-size: 10465
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Nested virtualization on a domain is only permitted together with HAP:
sanitise_domain_config() rejects XEN_DOMCTL_CDF_nested_virt requested
without XEN_DOMCTL_CDF_hap, since shadow paging is too slow to be usable
as the L0 paging mode underneath an L1 hypervisor. This means the host
(L0) can never be in shadow paging mode while nested_virt is enabled,
i.e. paging_mode_shadow(v->domain) is always false in this context.

The nested SVM code still had incomplete/speculative handling for the
'host shadow paging + guest shadow paging' case in
nsvm_vcpu_hostrestore(), nsvm_vmcb_prepare4vmrun(),
nsvm_vmcb_prepare4vmexit() and nestedsvm_check_intercepts(). Remove it,
and assert the host paging mode with a single
BUG_ON(paging_mode_shadow(v->domain)) ahead of the guest paging mode
checks, so the remaining comments only describe the guest mode.

In nestedsvm_check_intercepts()'s #PF handling, fold the two identical
NESTEDHVM_VMEXIT_INJECT returns.

Also drop the now always-true paging_mode_hap() check from
svm_nested_features_on_efer_update(), and the stale "shadow-on-shadow"
TODO in paging_update_nestedmode().

No functional change.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
v2:
 * Move the BUG_ON(paging_mode_shadow()) ahead of the guest paging mode
   checks; comments now describe only the guest mode.
 * Fix comment style in touched comments.
 * Fold the identical NESTEDHVM_VMEXIT_INJECT returns in the #PF case and
   add a blank line before the next case.
 xen/arch/x86/hvm/svm/nestedsvm.c | 125 ++++++++++++-------------------
 xen/arch/x86/mm/paging.c         |   1 -
 2 files changed, 48 insertions(+), 78 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 2b998e26bcff..ea30c777451d 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -237,27 +237,10 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     hvm_update_guest_cr(v, 2);
 
     /* CR3 */
-    /* Nested paging mode */
-    if ( nestedhvm_paging_mode_hap(v) )
-    {
-        /* host nested paging + guest nested paging. */
-        /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
-    }
-    else if ( !paging_mode_shadow(v->domain) )
-    {
-        /* host nested paging + guest shadow paging. */
-        /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
-    }
-    else
-    {
-        /* host shadow paging + guest shadow paging. */
+    /* Nested virt requires HAP, so the host is never in shadow mode. */
+    BUG_ON(paging_mode_shadow(v->domain));
 
-        /* Reset MMU context  -- XXX (hostrestore) not yet working*/
-        if ( !pagetable_is_null(v->arch.guest_table) )
-            put_page(pagetable_get_page(v->arch.guest_table));
-        v->arch.guest_table = pagetable_null();
-        /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
-    }
+    /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
     rc = hvm_set_cr3(n1vmcb->_cr3, false, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(X86_EXC_GP, 0);
@@ -517,10 +500,13 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     v->arch.hvm.guest_cr[2] = ns_vmcb->_cr2;
     hvm_update_guest_cr(v, 2);
 
+    /* Nested virt requires HAP, so the host is never in shadow mode. */
+    BUG_ON(paging_mode_shadow(v->domain));
+
     /* Nested paging mode */
     if ( nestedhvm_paging_mode_hap(v) )
     {
-        /* host nested paging + guest nested paging. */
+        /* Guest uses nested paging. */
         vmcb_set_np(n2vmcb, true);
 
         nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
@@ -532,13 +518,14 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         if ( rc != X86EMUL_OKAY )
             gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
     }
-    else if ( !paging_mode_shadow(v->domain) )
+    else
     {
-        /* host nested paging + guest shadow paging. */
+        /* Guest uses shadow paging. */
         vmcb_set_np(n2vmcb, true);
         /* Keep h_cr3 as it is. */
         n2vmcb->_h_cr3 = n1vmcb->_h_cr3;
-        /* When l1 guest does shadow paging
+        /*
+         * When l1 guest does shadow paging
          * we assume it intercepts page faults.
          */
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
@@ -548,16 +535,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
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
@@ -1030,35 +1007,35 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     ns_vmcb->event_inj.raw = 0;
 
+    /* Nested virt requires HAP, so the host is never in shadow mode. */
+    BUG_ON(paging_mode_shadow(v->domain));
+
     /* Nested paging mode */
     if ( nestedhvm_paging_mode_hap(v) )
     {
-        /* host nested paging + guest nested paging. */
+        /* Guest uses nested paging. */
         vmcb_set_np(ns_vmcb, vmcb_get_np(n2vmcb));
         ns_vmcb->_cr3 = n2vmcb->_cr3;
-        /* The vmcb->h_cr3 is the shadowed h_cr3. The original
+        /*
+         * The vmcb->h_cr3 is the shadowed h_cr3. The original
          * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
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
+         * hence we keep the ns_vmcb->h_cr3 value.
+         */
     }
     else
     {
-        /* host shadow paging + guest shadow paging. */
+        /* Guest uses shadow paging. */
         vmcb_set_np(ns_vmcb, false);
+        /*
+         * Throw h_cr3 away. Guest is not allowed to set it or
+         * it can break out, otherwise (security hole!)
+         */
         ns_vmcb->_h_cr3 = 0x0;
-        /* The vmcb->_cr3 is the shadowed cr3. The original
-         * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
-         * hence we keep the ns_vmcb->_cr3 value. */
+        /*
+         * Stop intercepting #PF (already done above
+         * by restoring cached intercepts).
+         */
+        ns_vmcb->_cr3 = n2vmcb->_cr3;
     }
 
     /* LBR virtualization - keep lbr control as is */
@@ -1260,40 +1237,35 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
         return NESTEDHVM_VMEXIT_HOST;
 
     case VMEXIT_NPF:
+        /* Nested virt requires HAP, so the host is never in shadow mode. */
+        BUG_ON(paging_mode_shadow(v->domain));
+
         if ( nestedhvm_paging_mode_hap(v) )
         {
+            /* Guest uses nested paging. */
             if ( !is_intercepted )
                 return NESTEDHVM_VMEXIT_FATALERROR;
-            /* host nested paging + guest nested paging */
             return NESTEDHVM_VMEXIT_HOST;
         }
-        if ( !paging_mode_shadow(v->domain) )
-        {
-            if ( is_intercepted )
-                return NESTEDHVM_VMEXIT_FATALERROR;
-            /* host nested paging + guest shadow paging */
-            return NESTEDHVM_VMEXIT_HOST;
-        }
-        /* host shadow paging + guest shadow paging */
-        /* Can this happen? */
-        BUG();
+
+        /* Guest uses shadow paging. */
+        if ( is_intercepted )
+            return NESTEDHVM_VMEXIT_FATALERROR;
+        return NESTEDHVM_VMEXIT_HOST;
 
     case VMEXIT_EXCEPTION_PF:
-        if ( nestedhvm_paging_mode_hap(v) )
-        {
-            /* host nested paging + guest nested paging */
-            if ( !is_intercepted )
-                /* l1 guest intercepts #PF unnecessarily */
-                return NESTEDHVM_VMEXIT_HOST;
-            /* l2 guest intercepts #PF unnecessarily */
-            return NESTEDHVM_VMEXIT_INJECT;
-        }
-        if ( paging_mode_shadow(v->domain) )
-            /* host shadow paging + guest shadow paging */
-            return NESTEDHVM_VMEXIT_HOST;
+        /* Nested virt requires HAP, so the host is never in shadow mode. */
+        BUG_ON(paging_mode_shadow(v->domain));
 
-        /* host nested paging + guest shadow paging */
+        /*
+         * Guest uses nested paging and L1 doesn't intercept #PF: it is
+         * L0's business.  Otherwise (L2 intercepts #PF unnecessarily, or
+         * guest uses shadow paging) hand it to L1.
+         */
+        if ( nestedhvm_paging_mode_hap(v) && !is_intercepted )
+            return NESTEDHVM_VMEXIT_HOST;
         return NESTEDHVM_VMEXIT_INJECT;
+
     case VMEXIT_VMMCALL:
         /* Always let the guest handle VMMCALL/VMCALL */
         return NESTEDHVM_VMEXIT_INJECT;
@@ -1566,7 +1538,6 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
     if ( nsvm_efer_svm_enabled(v) )
     {
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
-             !paging_mode_shadow(v->domain) &&
              cpu_has_svm_vloadsave )
         {
             vmcb->virt_ext.fields.vloadsave_enable = 1;
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 4bb8d169de1c..7c6df8d5d07c 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -932,7 +932,6 @@ void paging_update_nestedmode(struct vcpu *v)
         /* nested-on-nested */
         v->arch.paging.nestedmode = hap_paging_get_mode(v);
     else
-        /* TODO: shadow-on-shadow */
         v->arch.paging.nestedmode = NULL;
     hvm_asid_flush_vcpu(v);
 }
-- 
2.34.1


