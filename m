Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6284606A33C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 08:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=hF8Q57xJ
Received: from list by lists.xenproject.org with outflank-mailman.1480967.1684761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhhT-0004b7-V1; Tue, 10 Nov 2026 08:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480967.1684761; Tue, 10 Nov 2026 08:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhhT-0004b0-Rb; Tue, 10 Nov 2026 08:59:31 +0000
Received: by outflank-mailman (input) for mailman id 1480967;
 Tue, 10 Nov 2026 08:59:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xQhhS-0004NS-I7
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:59:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhhR-00HJZq-Us
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:59:29 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af2dce5-8faa-0a2a0a5109dd-0a2a450bd88c-40
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:59:29 +0100
Received: from [40.93.196.8]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af2dcef-b7e8-0a2a450b0019-285dc40882ab-5
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:59:29 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by DS7PR03MB8291.namprd03.prod.outlook.com
 (2603:10b6:8:265::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 08:57:44 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 08:57:43 +0000
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
 b=wvuA/VLn1pljpRxkG0m6G1cAt+JBOK9fqrBEKNXxSp8vIqkNxJhI1XMVve8LKvHGFBigAHbGWluJzgyuizFFTynpuDY1M6EuKjDQQMsKcU/gW3uyd38nklPHQcFM6XUXaxqtj3vfYFhdKVhSGGbEv1SQAGh45rhFIbGQLagWFt/ixbiOKZRSymXpoG0XcVV2N7JNy2fYydo1H3Mfdln1a0oCO1600o5W/btAIcDN47aJc5SwuGGsbgmYFO78HZGU2/abmAFf0/mwq174LH3Bg/13nXbVZQcLfLg8/KUqerjLmWa4oWu1IXclqTtGKUBCK/ss6zsKebkaEHJ2bjm0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G06BPuP26iQhV5ghlblIQ+cCkDhQh0hnH1cGIzgWdJY=;
 b=EH/d1I+epb0/5zUBNFFaxlDzlvIs1DIpiTzy+Y49IM9cpXwzVtNV7sjBwUa9sK7armzdRvAWlRfpGVbU+mEBshiR5gLCLoVGdNHlpypszOgqtVGQgjca7LpHVxeKcpA8FJdJqcnbCA1EHL9SA7+S4XgTr0o9Roryt683dO4IFfbBWicKlTMHEwW3s104Dn2nqxUNFq7+HoYkWSCivZLuK+rfwY8gPv1+DNUCN9za636FlEabQRJCdvzfwEAyQGgV3Cg+574jHVBL4RKMwwSLOP7dgkpIiVfoxYmZyyjfuNqy0jpfboWpBeDjVGALA0X8FX+QkHZ9qur+65UX/+weHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G06BPuP26iQhV5ghlblIQ+cCkDhQh0hnH1cGIzgWdJY=;
 b=hF8Q57xJgN3GrwOi+fa+nyeFrerTy1ee7+/6EUxaBLho7MCWPr0RA8OOWGTxeGKzA96602qQWbXH5Q/8xl3wVKxHTaK/b0ykKQiAHvhEO/EcIj4NrgXMu+mn66K3vviVawOTVjmt/K5z0GOOLBj6zV9BVHsYzIkFVMQYEwiDJUU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/2] x86/hvm: don't let EFLAGS.IF block NMI/#MC due to nested state
Date: Tue, 10 Nov 2026 16:57:20 +0800
Message-Id: <20261110085721.419366-2-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016100058.268266-1-chunjie.zhu@citrix.com>
References: <20261016100058.268266-1-chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cc::14)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|DS7PR03MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: ed20a856-5a3c-420c-ccb4-08df3f08ae86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|10067099003|5023799004|11063799006|261009223027099003|261028144727099003|261026121527099003|261102123227099003|261022105027099003|261021123027099003|56012099006|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	GBdmPRedjdHU+QcFWhb0CWTO0JTbtbpwBWLdARIFru9zBB24KbWTnSI1xnoAC/prFMTMA21KeqiJ1SAzopAdevRgnAvrJZu5vQeyjxgvRSf/2hdxdpw3ncH4LWnsikeYhopqY0BZaG9PieXnCaCPlTJQF/mH9+nF2L9rm1sX7wsBGPFfXcjBnnm5jJmxxIrajwumy8bgplWebLqrmnP2EhJcnp1TmkQpPkYkkLM2UsJB+eaTRHGUYcm7hut7dLJwmZ0BeidDjHVmk7WgU42Srz2MZPe+x8QiGj+QVq7AEKkmQdANGVSMlzKv4ENU1ut+3lkld5OVFKYqPyGzj5v/Ybsbng1jtcTQKVxDRoz0ture7dS5Y+WFX7EMPyZiFFTStu0gqAVt67wVBEMe4CaLLmB8+zAaXGmhpuNh7RlEza1XIvtuA1IXVcK5huN3Mdwdjmy5cQfl9+46LZDTpaZ+ATPIAmHCBlMuL7H0Rs8JWThhtwLv48rqbftFH+7hFvsUm3kY26J72Gn9TO5JM+jIfUzeSK30bOFJFbalniJib7S0Qp1eaAYApsDhyR+kNP7LxBFsk08Vwo/+bx61r4TyI+qIfOaMX/6XXhdSdYByXPZAYl9a+1eoSplOJN2l9pshMuWD/wjfvgIk2alMS7vCxHpgWC5vj19AtpuGsg7gxp0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(5023799004)(11063799006)(261009223027099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261021123027099003)(56012099006)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VJZ7eQTpJLavvkRhXo3TZadxisCmqWFaYNqIjQK4oN8DpajPt3Cdh5IGprcN?=
 =?us-ascii?Q?LUlmvSt290LsAmQoalo7imtxkDuH3HzL8Oy9EPT9hTXeYx7qQ2q9FgMWD/pp?=
 =?us-ascii?Q?0EiFeGd/RnXXYqmVPbn/brnUqH01igP7fAJyJRkw3cgt15ee6L0k7lCh67/5?=
 =?us-ascii?Q?+hNX439Y8TVnRTDZ42feq2x/GNnWQr/zhta+rfwPyr5yAXUpthesmew8OCch?=
 =?us-ascii?Q?qPQlrsKgGNHzWlIfmfIHuvv1RglUYsWJnUrP8gwty0Z58MeMzqECvuWQruqN?=
 =?us-ascii?Q?9797H4lxqYvBZlfk+pAxeVFOgi2TLnKbTw37s/uP/jPd7L6njgd3ffkfU5Mz?=
 =?us-ascii?Q?N9AStcDmSV4mjHO/VtRceMgoZhvDwiQIIyFK62MeLwylloBNt35gNtjD9u2N?=
 =?us-ascii?Q?ngqSAYWWKGu1HKOzZlDO5+CuwkvKx6YXNRfXIlH96rLGSlNeHftijN/wAdcm?=
 =?us-ascii?Q?jmWpKDKibtToQq99ui1WYNTMoBaQsTTecyybI7QWFrj6TKn9PdLNJw/AvEUh?=
 =?us-ascii?Q?51FsuKCcNz8q5QlmgEV7lDwzQQFWHWcVmVuKTjzFiafcb/HBt/Mtqt+i90XA?=
 =?us-ascii?Q?EXkDLMklRjT/HeHGcyELnb8qbp2ystVmsPCRHJDpATQmjUJYFD28Hb82shPZ?=
 =?us-ascii?Q?B1rP3NdZY2cCOeatxU+U6ym9TNVqVTYVnqzNHfKVXsQ66llv1mjbwzcjHtQJ?=
 =?us-ascii?Q?dC/8tszY02+uhY7MuF6KhFtuHqfHJwQSflu7LbPR2GEfsi48ehpbIFO4G9hC?=
 =?us-ascii?Q?VspJsLCcy71ZiX2lQyTJjeW64GRPbmwkP1/gdOcra01EfqRZwY9nwW8Y755+?=
 =?us-ascii?Q?rFL7DaHL01toqAd5Cz02XwNIUL1UEWGIpdrTuUt60U9XYqFb3LpNDtVsLTyH?=
 =?us-ascii?Q?pRvoFMxsV/xZjS5tPPt1Ul0/ugeOea5msVjFkT2184vupZzGtqRz1vREW469?=
 =?us-ascii?Q?o6RqGqS4x+qbFB+xtnfzj3bck+fIlhZ0QSO/8gRVeqvC2s+h05aiMaulkJrl?=
 =?us-ascii?Q?5U1V34/PM03BpXh5oP9wfo0vugr/eESYWMQ0DV99/I5/UWsbLgVPSe+r3fho?=
 =?us-ascii?Q?G4Y5uuW1+mIOxbocMA6Yk4NZpTIzfVP4K9rI3L5KMm9zJEG81gb9hnH6Jqby?=
 =?us-ascii?Q?B+cvMXtgBqF8iRLsrxtQygqoKT39lZyCbIuEzoYsUi6eNCPjkwV/+cj1ZFxv?=
 =?us-ascii?Q?4rynfGBE1HlKzH5bR0EBHZ8C7n9om2qH1hxVifTYzX9wXk8OWCa381iCqdO7?=
 =?us-ascii?Q?hq425IGLKA3UTI2SDzP0Z+0I33awAcbvSO+kuaXmubD2GeABcu2JF+3CYTzA?=
 =?us-ascii?Q?iFQLX9oBUrnhh9Yw8k/AmZt1jgLrtMJQKfDlSxx4DHSgCLxJqH+uVB7lO4wh?=
 =?us-ascii?Q?aivIxfJPqowAlpfFkwcd9abc1r+aC5Q5bfU+iuwW8E3KIFCw3G6ZPEXl/71J?=
 =?us-ascii?Q?n20x9pw1L+WCZYla6vhve3mMG+k808FhAIyuNqCtKHPB+BH6EFKNd/SYO1lU?=
 =?us-ascii?Q?Aso7D7Q2sYdoBajiwHh+FNDPhphFEtIb5IQKNvfnOcJCF03mmUH8W4RrkpG/?=
 =?us-ascii?Q?Z73tM3eAK683ENEDE+0XIznyuRWS9Ufn9OKvG6pz4LOsqVAliv6y+YYeL0+r?=
 =?us-ascii?Q?C0OQtRK3JTbm9h+Hc88zDAQomQV7CAd8zGZYz3+Ywe8KCvENeG+OH/GswVXR?=
 =?us-ascii?Q?lFePgh67XEpFpyvGZ8/cGctkygTlPo/+Mcl0YB8eS8nw0abfZxwBU8hfkE41?=
 =?us-ascii?Q?jrApMCHqhg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed20a856-5a3c-420c-ccb4-08df3f08ae86
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:57:43.5500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RT02sVsy8ZLbwXFh7Om+qowU4xHkDUqa/4epvodNFD5iqKQkbIlipf3VD4NqGOFxJLuqDS76EKz4yasiu3QfMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8291
X-purgate-ID: tlsNG-42698a/1794301169-AA0C59EA-9B82E58C/0/0
X-purgate-type: clean
X-purgate-size: 4180
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

nhvm_interrupt_blocked() reports why an interrupt is blocked, but both
callers, nestedsvm_vcpu_interrupt() and hvm_interrupt_blocked(), treat any
reason as blocking every event source.  EFLAGS.IF (hvm_intblk_rflags_ie)
doesn't mask NMI or #MC, so NMI/#MC get held pending needlessly, e.g. when
L1 sets V_INTR_MASKING and L1's IF is clear.

Have nhvm_interrupt_blocked() take the intack and report no block for
NMI/#MC when the reason is hvm_intblk_rflags_ie.

nvmx_intr_blocked() used hvm_intblk_rflags_ie for vmexit/vmentry in
progress and a valid VM_ENTRY_INTR_INFO.  Those block every event source
and have nothing to do with RFLAGS.IF, so report hvm_intblk_arch instead.
This doesn't change behaviour as all callers only compare against
hvm_intblk_none and hvm_intblk_tpr.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
v2:
 * New patch.  Handle the blocking reason in callers, as suggested by Ross.
 * Report hvm_intblk_arch from nvmx_intr_blocked() so the NMI/#MC exemption
   doesn't affect VMX.

 xen/arch/x86/hvm/hvm.c             |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c   |  2 +-
 xen/arch/x86/hvm/vmx/intr.c        |  6 +++---
 xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++--
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd05777..8fd095a4f8e6 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3897,7 +3897,7 @@ enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
     if ( nestedhvm_enabled(v->domain) ) {
         enum hvm_intblk intr;
 
-        intr = nhvm_interrupt_blocked(v);
+        intr = nhvm_interrupt_blocked(v, intack);
         if ( intr != hvm_intblk_none )
             return intr;
     }
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 66b77c6efe7d..a93681e9bbcd 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1496,7 +1496,7 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
     uint64_t exitinfo2 = 0;
     ASSERT(nestedhvm_vcpu_in_guestmode(v));
 
-    intr = nhvm_interrupt_blocked(v);
+    intr = nhvm_interrupt_blocked(v, intack);
     if ( intr != hvm_intblk_none )
         return NSVM_INTR_MASKED;
 
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 6c220c4c2e49..38be2387739d 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -142,18 +142,18 @@ enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v)
     {
         if ( nvcpu->nv_vmexit_pending ||
              nvcpu->nv_vmswitch_in_progress )
-            r = hvm_intblk_rflags_ie;
+            r = hvm_intblk_arch;
         else
         {
             unsigned long intr_info;
 
             __vmread(VM_ENTRY_INTR_INFO, &intr_info);
             if ( intr_info & INTR_INFO_VALID_MASK )
-                r = hvm_intblk_rflags_ie;
+                r = hvm_intblk_arch;
         }
     }
     else if ( nvcpu->nv_vmentry_pending )
-        r = hvm_intblk_rflags_ie;
+        r = hvm_intblk_arch;
 
     return r;
 }
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 02d9c44373ff..3e03a08a4818 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -682,9 +682,17 @@ static inline bool nhvm_vmcx_hap_enabled(struct vcpu *v)
 }
 
 /* interrupt */
-static inline enum hvm_intblk nhvm_interrupt_blocked(struct vcpu *v)
+static inline enum hvm_intblk nhvm_interrupt_blocked(
+    struct vcpu *v, const struct hvm_intack intack)
 {
-    return alternative_call(hvm_funcs.nhvm_intr_blocked, v);
+    enum hvm_intblk intr = alternative_call(hvm_funcs.nhvm_intr_blocked, v);
+
+    /* EFLAGS.IF doesn't mask NMI or #MC. */
+    if ( intr == hvm_intblk_rflags_ie &&
+         (intack.source == hvm_intsrc_nmi || intack.source == hvm_intsrc_mce) )
+        return hvm_intblk_none;
+
+    return intr;
 }
 
 static inline int nhvm_hap_walk_L1_p2m(
-- 
2.34.1


