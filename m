Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A019606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=OcVXuOUw
Received: from list by lists.xenproject.org with outflank-mailman.1485596.1688756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRT5x-0000LC-DQ; Thu, 12 Nov 2026 11:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485596.1688756; Thu, 12 Nov 2026 11:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRT5x-0000L5-AP; Thu, 12 Nov 2026 11:35:57 +0000
Received: by outflank-mailman (input) for mailman id 1485596;
 Thu, 12 Nov 2026 11:35:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xRT5w-0000Kp-TA
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:35:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRT5w-006aDd-9x
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:35:56 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af5a495-8faa-0a2a0a5109dd-0a2a450ba724-26
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:35:56 +0100
Received: from [40.107.201.5]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af5a49a-b7e8-0a2a450b0019-286bc905f80c-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:35:55 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by SA1PR03MB6515.namprd03.prod.outlook.com
 (2603:10b6:806:1c6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 11:35:52 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 11:35:52 +0000
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
 b=P2ObQk1lBVR40v48CrqKZqT5pdKb6ejlGmTbg1hwC+pL/3PW6oW46cRLaZ+QYzcn+tu2Nv/JoAp940V14bIGD296Bp0pZ8aMU5/12sX4BseB/OGnFIQoL5Xp6CokyCmiqOdz7wxwUrZiYY6e49wTn7O4mTnMsMAaizu7WyRvjmC73yl15um1yFAcFR/DPL6h30RomcCKaPnMPxX2NYZAXaL/oJnh8E/4/vg/CWmoIQ5ILLEcuNXEz9VdIrDdKhX9IA4o+bCOFeujAjeP5P4bc0qxFQcXsMFpd+WX6jReicbact2nV0bVo4UDLh/xJObxJHkKdJm68Uwheuyvx5YC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMo5vpeOVq9//sBvP0tuvNSyKs5W1YD/Ile27b2SDkA=;
 b=XIvx4ao+20NrfmDimrIFJ7WtROzbR2W1+jBsOIObpIZChahXTFBOebUnLh9zctSkPVIPpE8IBY2bxjfYaQBgNx2XL92FtG57UKV9Fjr0VNMOtqzTGc6qnTj6QzwTwpaDbppYVmBCTG4OQIzxTCJOwg+LXifSKwTBVMZxxN8nE/juTOBax5naoiwnwjfwGmnF8kIUHh0H0DJKUBZOe+mKOYjPxyTUDFDg/qniBGAVa9MFC8qaemMqe8/sqHfoGl8puG2+di8H7OUgRtD2ls5yI8/gx0b7wxjL8zI5gjJZr7MoMnre/z7G6jrQ/z/gzdoxEnGAvHCKx6SfT+wrxc1n+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMo5vpeOVq9//sBvP0tuvNSyKs5W1YD/Ile27b2SDkA=;
 b=OcVXuOUwDsL61s1BwbBs6EHieNvWunHexktnxc1miOTI1Z04SKrrDyN7QN2nfrFdqqQAXDnlTte9YCZ+eDNq/uZDAFXWCqzA0it4F1Mun1/O5vw7TdyTf8caE5JYmUReyN3hWjdPThBKGkklTl1KPwLZpwcCJFvmUr/QrI4h3i0=
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
Subject: [PATCH v3 1/3] x86/hvm: don't let EFLAGS.IF block NMI/#MC due to nested state
Date: Thu, 12 Nov 2026 19:35:23 +0800
Message-Id: <605e5007fc5cf68418ca637c61d7567ac9224e52.1794482561.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794482561.git.chunjie.zhu@citrix.com>
References: <cover.1794482561.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JNAP275CA0059.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::12)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|SA1PR03MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 25df47eb-c987-43b5-4b08-08df40b11b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|5023799004|22082099003|18002099003|11063799006|10067099003|261009223027099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	U8Rof8uEr5+qLlr26eyf2Ek3uSpNNpXultxtXsX2g7CGuxVsv9POiyMOcu+gTJ3UcclkMa5nMnLs0Wab7M77NtKetDJFK7V4mLym7gdtXPgQ4btzA0SH9UVGjjeHhKEuQdbl5DqhuyxNeBnhkbIVswcMpnAipOjrqktKIv3jZc5TqBZE8/YO4/zxsODUv+Yj3KIXFRl8EuLXzl5ReXJXEC3OgX2/TFvz1BtMXXxFKzrqvsy3OtAKvYXfiHjyXYxm13Caay6hN7TjxJ5CWisJ0QbSCPpry6v9OPR+kbCAkV9PNwoQ+WWJ4TkBeCp5lUMNraDLxb0arBGLrsfXh5L2NE9jbcrjldkb3hAF7eSbuGNFDuQnkRbvVUG+axwwgs06iZ6YU1kRjPjzYf6x7nvHhkCchkKC3KjYTq5twvbyNDN5jpyS0fI+/8Y/uLX2Ytfk6pGeI2g9uFgiMLRMsDeCX5iY3hUqMuiQUYD6B+r5hWUeDfBmk5T9TDyuKWqZCmUx1RU0ua9RZI+ltdlbhFJDgqjfuexFwAFKbVa30cgmyoDbriWwiwFOYsZjqZE7TLXU88MNI0jG1t5M68vtZvcYWOuVabHk733OC/LEm8EDgqqHHRGty6ymJ1PDHAU1D1gIEwlqp+ZJ0ElvhsezolcXEY+fvMfOg1m0Abew0fRgHHc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(5023799004)(22082099003)(18002099003)(11063799006)(10067099003)(261009223027099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dxut17T8es1bQE7vorD4gc1+Gg8HaJJthtCTiG9C65A3ipJaCIgiWC4LVVUQ?=
 =?us-ascii?Q?4ZFC9fPbD2UbvVqy0S6nRKn9q2Q9WV+J/m1juyAPInUQEpQZ0gbD1Ik05Gxz?=
 =?us-ascii?Q?QA73g1W6sFMtPxf+yTB5qdW+HWh//nIhViZLap5LJsI1+vg53kp8cCAla15b?=
 =?us-ascii?Q?YrQyKkDt33y2gVpOtGLoaIdLvzzd6SPzcSsswiQx+N1OhTO0Ent4DZL4loHp?=
 =?us-ascii?Q?MNkWjGoDbKrp0hfhZiIVBKH4c8pp/LRDrBLen0CF51QJmmh36wqVJbSqZ1wz?=
 =?us-ascii?Q?uuhoV8lk1FaP8fY54pleySbS6+tSOT3iflMhhRKAao4NZ92a7i+Cz9XdASWk?=
 =?us-ascii?Q?LsmW+IyVbmj3/Q8KnGfUi/Ys0UOmyZ6w1gM2hUTp876PuUH+mNdmwAwYj8Is?=
 =?us-ascii?Q?t7cwT2DVVRmOzRcVJev2GCpG0+e3ZN6mBc0k6K9HYQdVBjLzlWkzUqx6MpN3?=
 =?us-ascii?Q?SeV97ydkH0OQhoO1uZ67jkA2vT3EoI58ZNyzuZ6rSKnkuBX2W1MWJx5PByaX?=
 =?us-ascii?Q?jIpGP+tDPEss0Pfu5Wwu/hCp/6WsNdDMwP1mA88bNufNWPEclU3Z1FiPjHrW?=
 =?us-ascii?Q?yAkRs+V8d9Rwc9iqugEGZt3j6SpwUvicXpNnn4lBgTMt4WOJjNByUfkPQuFm?=
 =?us-ascii?Q?grqxCjot9wVLD07LDkl4AmFHInxEaNGI9hfUDMSoGSnkOFLit7cEtNXsGD+V?=
 =?us-ascii?Q?m4+EgMBNDMNk3ThoagF3KUbbZeIfMyG9zrcI2GGyhxswgUZku3dVcz6oOpy1?=
 =?us-ascii?Q?3gf0BXZ5zfHvQTPZSJvgtomLXrRZtA2X5bXt+3+Jfk1W8GgpC6VjVvwqu5m4?=
 =?us-ascii?Q?I1HV9m0xGw3A5X3JGdKU4iWVJ3U14euqgA2rK0HC6VyuyTpKZPDRaJB33Dcm?=
 =?us-ascii?Q?rRFoD4q9K8raqq8BfS2vq7inFm7ls+6n4IYfr9YLRywsNptiFFNQpIu73MWn?=
 =?us-ascii?Q?e22Q+7dqVIwtK0OX5yXYiz2gWNBS3le2MT+uO2ash86qBlIOwyhEt0z1dEbU?=
 =?us-ascii?Q?WaxDO4g5+nqrNo/gVoyl8f3ajdCFswjQ/W8sfyAohXCgVrvZwoah6Ql/uafP?=
 =?us-ascii?Q?hzRDSVrw9mdj9boMtwGc+8Qm4jshVpjuiLgwHzOTVf9KItoQqQig1b4jXkbc?=
 =?us-ascii?Q?PzkKHsLfAjDPNNPGyX48DDKfXrrDDvLjJuTnfddIz3E/JCsvBnAOesBMwFzx?=
 =?us-ascii?Q?3Q5OK68Gi+LfNI5GeFJ684l5D9Gjd15dMI6MKnrJl+hglmXP3JtQO5aGlYju?=
 =?us-ascii?Q?muAjh0fbpWud5NofavT3YngBPifvo+QJgsssVkVFJvuPEXwbeKC/HpNuCKMF?=
 =?us-ascii?Q?ZIwFSmDdgHmPT3aGk34WbjTjxYlM7P/Xf03qFydlPobE8rYULfKB48c7mca/?=
 =?us-ascii?Q?Iqp+oqN/9h515/Epv0A1YO0ZRmqQeY6I8s7uwbWBua4s20YbfrfLd4jrNP8u?=
 =?us-ascii?Q?ECtBUS/qor1UiEnraNcQSiN1HWv7aYj9xlRePwtH8BU3ob6BwSjW4j8oepy9?=
 =?us-ascii?Q?1XiBGB8JfK8EO1WgumPCAMW/jcQshXFwAtY7cIk+87oOR+3r1qhIJXg46Hnp?=
 =?us-ascii?Q?YHXD6t9UTbQ3S7sB7VtTQydxaBxCyktzWLnVluJmU6JPNy+o7M0MQDhr2QK3?=
 =?us-ascii?Q?ANjfPf7ooPbvf46JJVTzaiHB8beBZEgeIfQUB2k2n66T0WB12HGG2Yze1RQg?=
 =?us-ascii?Q?oqT7h6JV5+iUOr4sW6itGoEEwKal2mUGqlNHgxuG7+m+wMrAqw8m4N329Lx+?=
 =?us-ascii?Q?oJaqdwEmLQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25df47eb-c987-43b5-4b08-08df40b11b8e
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:35:52.8270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ol+Bedm5UfE8WTcIu4XlW7Xprg8AEIQBIIwGd6rLKK+0DRo3ovQ9/xHQBgaW0aWJD774A/IzIZ3hZvDaavbtng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6515
X-purgate-ID: tlsNG-42698a/1794483355-ABED69EA-4BCD6019/0/0
X-purgate-type: clean
X-purgate-size: 4583
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
v3:
 * Use nhvm_interrupt_blocked() in nvmx_intr_intercept() instead of calling
   nvmx_intr_blocked() directly, so the NMI/#MC exemption applies to VMX
   too, as suggested by Ross.
 * Rebased on staging.

 xen/arch/x86/hvm/hvm.c             |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c   |  2 +-
 xen/arch/x86/hvm/vmx/intr.c        |  8 ++++----
 xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++--
 4 files changed, 16 insertions(+), 8 deletions(-)

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
index d970869cfd96..40c7717c5572 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1417,7 +1417,7 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
     uint64_t exitinfo2 = 0;
     ASSERT(nestedhvm_vcpu_in_guestmode(v));
 
-    intr = nhvm_interrupt_blocked(v);
+    intr = nhvm_interrupt_blocked(v, intack);
     if ( intr != hvm_intblk_none )
         return NSVM_INTR_MASKED;
 
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 6c220c4c2e49..a6099420fda5 100644
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
@@ -167,7 +167,7 @@ static int nvmx_intr_intercept(struct vcpu *v, struct hvm_intack intack)
          hvm_interrupt_blocked(v, intack) == hvm_intblk_tpr )
         return 1;
 
-    if ( nvmx_intr_blocked(v) != hvm_intblk_none )
+    if ( nhvm_interrupt_blocked(v, intack) != hvm_intblk_none )
     {
         vmx_enable_intr_window(v, intack);
         return 1;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 9bf2064925fa..b10937e229cf 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -678,9 +678,17 @@ static inline bool nhvm_vmcx_hap_enabled(struct vcpu *v)
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


