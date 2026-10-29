Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CEC606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=pNFhG0Wr
Received: from list by lists.xenproject.org with outflank-mailman.1464217.1674960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJd6-0006sx-6a; Thu, 29 Oct 2026 06:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464217.1674960; Thu, 29 Oct 2026 06:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJd6-0006sN-2k; Thu, 29 Oct 2026 06:28:52 +0000
Received: by outflank-mailman (input) for mailman id 1464217;
 Thu, 29 Oct 2026 06:28:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xMJd4-0006qN-Sq
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 06:28:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMJd4-008GBj-9k
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:28:50 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e793-8faa-0a2a0a5109dd-0a2a4507e7d8-18
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:28:50 +0100
Received: from [40.107.208.33]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e7a0-b4ea-0a2a45070019-286bd021ba94-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:28:50 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by CH5PR03MB7814.namprd03.prod.outlook.com
 (2603:10b6:610:213::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:28:47 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:28:46 +0000
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
 b=GftH9fY4Av1SSvC8NJr2nvdtWv8Y4yVwo9C+S8Eou+aR5aPDeIxQUAXQ3hXhoui8W+AbM7sg55sMr2u/UYDEI7X8VM5nqcidarD5t3IOOT/ECtiafUhqspmiB8N4MsgTCWXLvCvwgVbjkpeIW8Rh8GHAn5yXK78iJsUsvp0j7zfmJllqQDfPQmrtTgY9RY6njqM9fecOEZlVlgF14qOG4GaQd5GhR4ZNMX4WEFKUZTvDpOEociBkTp6reTXTenkby75smRJtks5aLzvL1QmbLeoEffc/dDN7IGVzSlNQuCZnsNfNnq3YfD7vHUmMd5yfUcuZMiMMx+NfHRpTRj8uAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZmCapoCbbC98HQoeR/WondHb4MXNQh7OP39+AjyYYE=;
 b=gEGAmQ9MCvGJCtlL8POtXL/J7bXw272zmKoZx4RZ/BXGp9WebYgzFP4tfhMJQE/Au5T9yI2LA2mzsrRNqqhfJLfqj7xyZo32waHTaqAI/hFWJsLGVGEz6bfCFhd2+HA5N4GBpU+DxIvs5QBSdK3kpA0sd6IhF3hSBM2AprmgvE5vfZfVhEbENPP0kuuvbidgP+fkMEd1/doBESHdAmLVc3luRs4WD6/yD7CWWF5uHjd5LnwLil1z96LmRzR/TlcU1uiYhP0aZFNDenyA4i/LOAt9D6QM9MGl6FTIO3LtSL/pWdww7dBzo+HohxrMkOvfh1F9OxBTxSioo1NG+dCtcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZmCapoCbbC98HQoeR/WondHb4MXNQh7OP39+AjyYYE=;
 b=pNFhG0Wrqh38MawNfIQTlLlx0cmAv/f+r1trUeCPjzcgQvRDr1Us9rYScmj2QzR9oS0GATJBt4JxySl0bCMso0J48JFqySV26x2xHyQzgtcpBgeOaisZmto8iXRpHA6HBHz1QLTtCs5o1ildrDr4ZbQP5fSgzIhvx1r3z2aOp4s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	dpsmith@apertussolutions.com,
	Stephen.Cheng@citrix.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v2 7/7] x86/vmx: Fix nested VPID handling
Date: Thu, 29 Oct 2026 14:26:59 +0800
Message-Id: <1e256a5695a7c4c5fcba052ec820cf3dd7bfc8f7.1793254779.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793254779.git.chunjie.zhu@citrix.com>
References: <cover.1793254779.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JNAP275CA0020.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::20)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|CH5PR03MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: aaaeb7d7-48bf-4fc5-fcf9-08df3585e2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|5023799004|11063799006|56012099006|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	f5IUm9M4pD+Oerf1YjL2hvpKINLmP9YWJPjxNCUqMm3uGaS5VHMgy7mQgyEuGsfF1y6dSaphZqfbIjF9BNiUjP9BBt9lSeU0X3VZqmtCcrMg0l/EQNKq+AI4Qs3Zq90YktX6HDWoQFhiQ+gbdWkJaw6wVJ3twGqFgIOVT/WG5sHyXOTPu+D7gtcd9E4b74RRj6FL6P6B0bxkTwVgRtCAvFKPzpYJiIqy7D8IfVoxj+/kcar97YUxmlHuwTdABQvm3usoZQWmVLiZX6q0izHl+4CpOyXeyub5v8F1/7QaIScs+x48qX25oBI9zGOsXllYH7bKzie+SKv5La41sLaB1kxhKOE2TupmhJJhYxdnS8ksOV7J0mFwRjQxmXt4lDyG2pjCC5WP2wOQhtS/xnUsUkDTB21hQKzTEr9d1TRfq26a2seJejh9GXTbKrENXHlFrllEAKO5cxcxhu0UuFkkPkDnhH2eLBnxNBItl0cz0m7fHmunWLdRyKJv1UpZ9m3EafHoi2Dv6wyAZwNQNZWOYiR0gDIQMLGCb923PymvBUGfdo1qBVhCCHE99rOjaxuvdWNVQL0vObrzf6vdKWLBti4+rm91yyfJv01v2ultScCXgbG0cb3O91I3cxEmUoossyzgTSrzZ/9PuQEscGNiTW+OylCuexyxR72jmm6Dn/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(5023799004)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bFMbDpXW4lYnAoFBfyWWFNA4T4muUre2/7kO+C8kDIqTte+o5y//qTSrYiVj?=
 =?us-ascii?Q?ai5utvKe/Mz1C+oJsuQeJsO5E5LTdaTs1P7lCL3RQp5eXItDqF67rGJPloAp?=
 =?us-ascii?Q?wpr9QwypTyrOkm2luxnWoLYF2PQ543qbSf+hliSVHc7alSyOSL4+JhSfdeZl?=
 =?us-ascii?Q?+fOYnmiBZPZH6/0GsVhc9riApUjVoCxyBjISjD/+joALNE1xvhdwlhqwguzw?=
 =?us-ascii?Q?XHpQpSKPUdOfbxNWQrW8Y+gVO5xMVLQs9G5WNIDDJZF6CL7kKLVVkgUzy5qU?=
 =?us-ascii?Q?1JVFdAt2WL0NTgy++8/EiQVmtAtOjzD5GRUDmsjJouzvtUxv7UXCE26IItqK?=
 =?us-ascii?Q?8LbjMcJVDlaSaFYYb9TAayepo3mr2ShCpjboaLdwMGyBxjEGsMe3TVXdIL2o?=
 =?us-ascii?Q?bcn+PWai2KTrHdgO454b39qI0ePixdIlH7S8Rq3isxdoBhdIxVFLhum30KAD?=
 =?us-ascii?Q?vIK+UEjdBv6JHsYi+3bbptFE9uQu3pJlT/hommAyfky7DACjsovvh6EFnbW/?=
 =?us-ascii?Q?RSUiDDTxEc/M8MEyR21m69v014KsgR/SDcoe/25bAnEkckevne2pRmBP4U64?=
 =?us-ascii?Q?CD1Q+SnkTd+7CtrvGy9HqATNxzWKU5XV7QqV/XxscH2c96p8wATCeIpaj4kx?=
 =?us-ascii?Q?YBOBeI/q2OQsJfbBy1kJyko4GmYGw+3h/qLZk9rDR69/OccKDhQWCP1xf/3h?=
 =?us-ascii?Q?eW+OPHCeyToGz3wXXm610DzHjPi0fVNwsijkWh39LcVVb+uqoX2WXicvQtHm?=
 =?us-ascii?Q?TQ1FpxPaYJsftWONJG9DZaYWYRl4Wh/08SSlcopK6LN/BpD9tOr0nZGF5FEF?=
 =?us-ascii?Q?yAPjjw5E6d5+UGHTXUERmKFqKLmtkCuyYUPFTBDxaE2UKJLKmt4+gAnfnu3e?=
 =?us-ascii?Q?4SAZwGaXkL1xpBcMtvwMt1jr3wzZsEPID/lY2N4vxN3hgz2UcRpd8wWU1GjN?=
 =?us-ascii?Q?TiAvhY4WAxa8mOTCWEpVgXFieTNLbdjKuS5h6HL7E0wd1tpV3fVkOsJZhvmR?=
 =?us-ascii?Q?/sN5+wKVn63ZRFOapsaaoxbu7QMFo95xTyahjVQIBlJR+gQ+t9P4KSR3VHY+?=
 =?us-ascii?Q?jSTuZKOD2pq0Xxue8Kl34pOLWxG5quggSdo2pJL4a7NJE3mEzKRBpG1kCOkm?=
 =?us-ascii?Q?JUPY/+R/hZIU3kxFsUwsoLD0gGxQFb8u4gk77j7Z3RD7/r4FFySptkgMIWu2?=
 =?us-ascii?Q?MtE7yV/1XFdmyjxX4IQBKIMhW29rdNU0/m6/OEcU5zAbfj6AYJFG9aLApnwo?=
 =?us-ascii?Q?bdkoAN3BeBQSmZRYhEBAHikgvfPUZxNMYAhRIls8EZVGujc5rqRZtFB9hgkS?=
 =?us-ascii?Q?Mw0sHPARUOOyor8gi8ZwyD3pKypTzCkr9nmfH69BaFqar/yhUuA1qmF7z0vB?=
 =?us-ascii?Q?0KdqUnPcZyuCqw95Mj+qzX8glbRvd4t+e4Tmv2isp7Xs0HJgenYRA+EgFOMx?=
 =?us-ascii?Q?+rPTLbcRFuHed0q7342NmwIEiw4Jv26XScuuuiLaisHIuC7Sxkv8fXHlLlmZ?=
 =?us-ascii?Q?V2mgTTjqpZt4NXGGVCdaecpNG3gdKZUzBc/svJxFyFgSHu2cYP4eIjrpMHsA?=
 =?us-ascii?Q?bCDMptlYG8ZiAZi4IEuO17c+bX7EOshVW/C5xxeQ3CUfT0+JWhmPGdeeweGr?=
 =?us-ascii?Q?bHbFZ1LJD/gp0QGeRby4o0nIWM/aK/yPvbp6SdM9wb6RRcnsb8JtcfnMIzUS?=
 =?us-ascii?Q?Inrsfqeyqnv0fge4WWb8pGn5Wa1rnjaG4tLiic1trCUe3s0DaZFRPsUwFYvk?=
 =?us-ascii?Q?dD7UJpJrlA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaaeb7d7-48bf-4fc5-fcf9-08df3585e2b9
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:28:46.5868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCaIkismC4uo/KeKmUHadq7MVPxR7xzcCWoIuO5drW1YGxaFRGbUMi2zedeGbNHahqZQqQkbeZKRzu35QJfxFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7814
X-purgate-ID: tlsNG-ef75cf/1793255330-A68D9AE4-A747E11B/0/0
X-purgate-type: clean
X-purgate-size: 4125
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Some nested VPID problems:

* nept_get_ept_vpid_cap() ORed NVPID_CAP_BITS into the low half of
  IA32_VMX_EPT_VPID_CAP.  The VPID capability bits (INVVPID support
  and types) live in bits 32 and up, so the low-half write advertised
  unrelated EPT capabilities to L1 and never the intended INVVPID ones.
  Shift them into place.

* virtual_vmentry() only tracked the L2 VPID when L1 enabled VPID.
  When L1 does not use VPID, all of L2's linear mappings are tagged
  with VPID 0 and must be invalidated on every virtual VM entry, so
  flush the n2asid in that case as well.

* vmx_vmenter_helper() jumped over the whole ASID/EPT invalidation
  block when the CPU lacks VPID, which also skipped the EPT
  invalidation that has nothing to do with VPID.  Skip only the VPID
  part.

* Nested virt only can be enabled on any HAP-capable hardware.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c       |  4 ++--
 xen/arch/x86/hvm/vmx/vvmx.c      | 11 ++++++-----
 xen/arch/x86/mm/hap/nested_ept.c |  2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3c7374a9ff42..00fe2ada4f86 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4942,7 +4942,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
         vmx_pi_do_resume(curr);
 
     if ( !cpu_has_vmx_vpid )
-        goto out;
+        goto skip_vpid;
     if ( nestedhvm_vcpu_in_guestmode(curr) )
         p_asid = &vcpu_nestedhvm(curr).nv_n2asid;
     else
@@ -4974,6 +4974,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( unlikely(need_flush) )
         vpid_sync_all();
 
+ skip_vpid:
     if ( !paging_mode_shadow(curr->domain) )
     {
         struct ept_data *ept = &p2m_get_hostp2m(currd)->ept;
@@ -5016,7 +5017,6 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
                      inv == 1 ? single->eptp          : 0);
     }
 
- out:
     if ( unlikely(curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_MASK) )
         lbr_fixup();
 
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e37f59bea7ce..8b1efed8efa9 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1264,12 +1264,14 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
         __vmwrite(EPT_POINTER, get_host_eptp(v));
 
     /* nested VPID support! */
-    if ( cpu_has_vmx_vpid && nvmx_vpid_enabled(v) )
+    if ( cpu_has_vmx_vpid )
     {
         struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
-        uint32_t new_vpid = get_vvmcs(v, VIRTUAL_PROCESSOR_ID);
+        uint32_t new_vpid = nvmx_vpid_enabled(v) ?
+                            get_vvmcs(v, VIRTUAL_PROCESSOR_ID) : 0;
 
-        if ( nvmx->guest_vpid != new_vpid )
+        /* Without VPID, every virtual VM entry invalidates linear mappings. */
+        if ( !new_vpid || nvmx->guest_vpid != new_vpid )
         {
             hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
             nvmx->guest_vpid = new_vpid;
@@ -2872,9 +2874,8 @@ void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr)
 
 void __init start_nested_vmx(struct hvm_function_table *hvm_function_table)
 {
-    /* TODO: Require hardware support before enabling nested virt */
     hvm_function_table->caps.nested_virt =
-        hvm_function_table->caps.hap;
+        hvm_function_table->caps.hap && cpu_has_vmx_vpid;
 }
 
 /*
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index e116d8254824..abae483713d3 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -101,7 +101,7 @@ uint64_t nept_get_ept_vpid_cap(void)
     if ( !cpu_has_vmx_ept_exec_only_supported )
         caps &= ~VMX_EPT_EXEC_ONLY_SUPPORTED;
     if ( cpu_has_vmx_vpid )
-        caps |= NVPID_CAP_BITS;
+        caps |= (uint64_t)NVPID_CAP_BITS << 32;
 
     return caps;
 }
-- 
2.34.1


