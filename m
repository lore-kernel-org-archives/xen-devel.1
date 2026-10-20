Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37588606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=lqcJtNyK
Received: from list by lists.xenproject.org with outflank-mailman.1455116.1668661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ1vX-0002Gr-4W; Tue, 20 Oct 2026 04:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455116.1668661; Tue, 20 Oct 2026 04:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ1vX-0002Gk-1c; Tue, 20 Oct 2026 04:58:19 +0000
Received: by outflank-mailman (input) for mailman id 1455116;
 Tue, 20 Oct 2026 04:58:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xJ1vW-0002FZ-69
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 04:58:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ1vV-00BjRv-3R
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 06:58:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad6f47e-8faa-0a2a0a5109dd-0a2a450796f4-34
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 06:58:17 +0200
Received: from [52.101.46.55]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad6f4e7-b4ea-0a2a45070019-34652e37ae92-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 06:58:16 +0200
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by CH8PR03MB8226.namprd03.prod.outlook.com
 (2603:10b6:610:2c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 04:58:12 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 04:58:12 +0000
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
 b=hj+6wZzW6mh6Fn8iaYY5KceF1EUPKmR8dlcs6sz+iAvF4Bx+3naTknRAY1atK1WUsQE4wxCrK1PWwp2JzwUXYAZizCfBEZxoByYXJr/jQ5YBuumwLA2qYfjKSJA+DNF4flkgyYWt9oagfwRDe5hNbbcghWQ0dPTDidYlrogWCUOJz38d5T1MRWPSEIOBgjQK6bni1PV1P1OiEEVcPqiLnkozt10bBBuQ9qkslDCdmqk3X2EKD78O2bSUXDqSbpEctsMvv5dR9qwCeoAIBco2/nvQIMgMPfSuOz1MjzmwD/m9A4V3u+btLk58eB5j2U3pk4EnGAJ2jd2WOlQz9w4EKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrKuCQBOMGitDkTfrBt9LwINhwZ8V4yF6Kn3RG5Tj1E=;
 b=tJTrnPi3YyNbMkrX6OiYROKZzfs6q1lICf381OxxmEiAGYkpQxM0BTLLvamD/NZhrTYZwJ2VntzKKvtiuGpIxdnrXVWCiwLmqAJsow6CuKsxhMSXAChzNUYGGuNnmsNoegeCZI5HdAL0bCf6aTpnfaeQuO/vZQSYSW8BXjFHl8yjMAveNe64x65zZNtpQJNaZ8AYCHHqLnAXUbMZJ7vs62+RoNGEWTfaYTpby6kEk9iBI6Zm0hsG3RIwwjSl6xtTmRbwp694g0TAFdsPwiWDsVt4KhdU/0L1m4XqLzAuwUAs/oaBtBJ9TcBXTyOcuI6to/zxQCOpl0P3JL1XN/fsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrKuCQBOMGitDkTfrBt9LwINhwZ8V4yF6Kn3RG5Tj1E=;
 b=lqcJtNyKUUndHdwjrBLZ3CMOArf4dKr4Pd0CQ8xVp7OvOIA44GnMwsTpDNg9HKvrWcFhCduoAEKs7mjluZZ1yoXE5rvPm7+6fiauBAqp7zWE/IwhSuwXsCRuv1EEZ62rdKPhFzSj7zpiZcgEkQyjHryjqdpzS9lS/BmzMNiko6I=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tsczsss,
	Chunjie Zhu <chunjie.zhu@citrix.com>,
	teddy.astie@vates.tech
Subject: [PATCH v1] x86/nestedsvm: Require SpecCtrl
Date: Tue, 20 Oct 2026 12:57:58 +0800
Message-Id: <20261020045758.321952-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JNAP275CA0047.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::8)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|CH8PR03MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 97288d11-fe13-436f-e056-08df2e66be0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	J0LuiWj5Hd78sDHmPRJB1EkPRBMKt8ZResmHWbZy8vP0QUwXvAHpshPnlGpYT/eXfc0HD79lObuOboQoHwWUprC/TWayKiIu2zmjdwQr9LeW2wQfd/pK8iXzv1IWU/iLbZN+Yx55TylR3GrWwTNikBqeMraq2lrOHfGg9oZ0zxQR+lt0jSHRWq7ARoqfqmKe1AKa+428SRYw0CO00s7IGuQfL2/jK3MrrLOUMcmIZc86IpIxmj4MeC8foxfHjVYp9GWIfUusg1baLILzM2mDSHakMcBNdGuGg19dK3VUJpq8b04WsKPjMwmwKK2Zi/UR2e+d6bp9g6vDXebb0kaodJZxVZPTGLBFs0poWrGJ7g4g2/BmUvHTTePKhtIRXSk4tEtONM3IKGB+cpB8ThxmOK8ZQWO2yOD2koHkPXWwEMoQ6rezPN240+df9WfZSMeZg8+1Q6SfaF6cH4URpra/m/8FLJuXk2J+Jx9u4Kfuu3kwHyTM/2eFpjWbcn3d1PuCIBN6W0G3DPOGMwdOO5/Y5dhczpMlB5AGZeTeYVnHa1M0WXPeVpxQSpCm51eEcnUyMO3p3YX/K8C0Wxs/oWC66C1m8l+AWN5mNVcjEUl6G3n/WSMK9vOEZmLIdWKvKseGEGh8s9agGtH8HPiJeFOoHA9lqBmjc3A6PrSPhVLJon8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tXdE0GnWAqyJFC77rmlRjHrbsJyDhkOLqhiYYWn3R8sbT2xLA6kqT7iVf9ER?=
 =?us-ascii?Q?11pDPHUXpjOSBxZq44CCzqmzlVBhC/xTXhOGkvjwRed6d7MleTC8SaQC1G2j?=
 =?us-ascii?Q?X78N39QrPIqO/XZ1dVZkdQvTlQVmdynaTr4Mp6ThZwhwB7XSJTg4QFdRvEUo?=
 =?us-ascii?Q?OAhvDmzJNsRKKy8tjB0R0YdQBbCpgQGctt1nok+1pMj0UC8XdLlLCTNDDmgl?=
 =?us-ascii?Q?3WiHKM0b1xkH3FgS5nfShfKcmWF8YidvPfHWrfoVuPgKxrdSK8FMgN33jDVl?=
 =?us-ascii?Q?2BosN6fJegco3bHYxkmitRVgxFP9m9zBQdE9OFBNaP5MmKPknUAIdc7asg/q?=
 =?us-ascii?Q?c/mO8zQckonWlSDzaDyULd0NEmhB/sXlE//UkwmGg/QnuA4fhvbvRGY2w5w0?=
 =?us-ascii?Q?RQlPFnqs6jzhLsgivME0zPv86HclqrRYNvk+cLu38CWHWw/BVfrVYpVW3sS4?=
 =?us-ascii?Q?a45UJvj/OcvdM682pJx6UkfYx+tEnfmeXwTmTJi5sJLsPdlk3rFVbNbxSCt2?=
 =?us-ascii?Q?rq5EWsqB8SDvFiSo9IpdFzOx0Cm0Qs/RY8S9qGF3+a7p6pbryOiU2kyO16iU?=
 =?us-ascii?Q?kn48mTVcaoCmss9H3edieg5gIZHyRUiBca+rrcUV03CktGQ//m+654HsEc+f?=
 =?us-ascii?Q?KGDC33q2Pnm7fpAvmqYCuDXZ//xM4BuMFKf4hzC9piXQf8SRTqigv9F+tRQZ?=
 =?us-ascii?Q?fhlnj287At5Tbm3Wv2Aa/mM7a8nrxYkSwgPOejG0D1g+X67IEtGEW/9Pcf9T?=
 =?us-ascii?Q?7AA1ZaWwUGuhqrQ6ey4MAI4Ac+ic1UGilDyQKfvFyY7SwnkQlJJvZSKdthPL?=
 =?us-ascii?Q?sIHcOjeGqBRBvgU8FuyJpECvvIXdynFJidpY/hHgsGIIX6D4F8xt+9mrej8S?=
 =?us-ascii?Q?CV8YeSfI1KAAEpSlUANw96bwwlB/M8VkBJjaF9vvgtTI5fZKUHwgwfbpc9E1?=
 =?us-ascii?Q?A0N5SvnzBmRfiGqhMBa9Ji5Zhe8b+LYDHYlq9StY5GBeGId91mMq5M8wpXwk?=
 =?us-ascii?Q?3yK6llyEXf1B3JRVNI2z3Zofqr7Wkf6i8O9RqRjyXuo3b5C7yLw+r+SqWdVm?=
 =?us-ascii?Q?ZtXZVfr1eSVjntuXx+809hTacFvP6tJXJKVegZbWLvtLvo8fMSpGYtk8JqML?=
 =?us-ascii?Q?LzyYoqtOnb6K31R8ueyJuLd3kBxDgV1tfSTpmMgJacAg3NSFnyP7JH0dX+su?=
 =?us-ascii?Q?g40zb37YuyE6ZFAPOBUVexpgQTj64RrnIbsHGbEW5l351Jvsih7BYkGl4J5k?=
 =?us-ascii?Q?SukVnaUY7q0snm5SaY0IaAx1iSiY05NyaKM5XYwzC89PYSDJ4cu7/YeFnP3+?=
 =?us-ascii?Q?Em0JajiAnavCbWZKOF2aqCSm/3UDXcW9zSpFDEdR6+EUkfFxHYxJNHQCiSDy?=
 =?us-ascii?Q?RPBFQNQTTsDBahqMSkBLLs9jNBW0kCuvB9iwQ+RkMobyLhgTOYKa3IMnBg7n?=
 =?us-ascii?Q?/qZXiEu6fuQRSw8qdqdcxXVcTqof8v9RDjGgZNxYf7cfKZZjtmbpMY2/2rxV?=
 =?us-ascii?Q?ok0nO5JX6ROMTQyFa3OcI14BJ9qNU+dq6ru8WzzKoyskZxKrfa1aL8S8nbwY?=
 =?us-ascii?Q?5ZJI0PrD9dxtn74lntuQMDw1oz7yNesnSb1r6vMwCqNhoG0R3vHKy26/Y/nQ?=
 =?us-ascii?Q?eveW8a3HsVLW+8EMSbzZy/DiFZNs2yx3fWY/dBNecaNFl8L4uZPH63C/mVki?=
 =?us-ascii?Q?y1sFImWe3I4ahOizu8OV9wSa2NOIQAFR0DZex5HwL7sAksA/PRPjj4PFh7rG?=
 =?us-ascii?Q?HCfhEEtXNg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97288d11-fe13-436f-e056-08df2e66be0d
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 04:58:12.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3KVQA4MsVZ4Hp7a+7J3agFlX/9V+7zVW1tFn2Sfvhq2CnEMzRgzNyiy2NOeJ6aRKQezR6l+W7TBAZoQH0Ju7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8226
X-purgate-ID: tlsNG-ef75cf/1792472297-A6EDEAE4-0F6ABC08/0/0
X-purgate-type: clean
X-purgate-size: 5571
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Previously L0 did not expose this bit, forcing L1 to intercept and
emulate MSR_SPEC_CTRL accesses from L2 in software, which is
functionally correct but suboptimal. Per APM vol.2 rev 3.44 "SPEC_CTRL
Virtualization", hardware supports combining host and guest SPEC_CTRL
values via VMCB.spec_ctrl with a logical OR while a guest runs, and
saves the (possibly guest-modified) value back into VMCB.spec_ctrl
on #VMEXIT.

Require the SVM SpecCtrl feature before running any nested virt
guests.

Update docs/designs/nested-svm-cpu-features.md with the rationale
for requiring and exposing bit 20 (SpecCtrl).

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 docs/designs/nested-svm-cpu-features.md | 13 +++++++++++++
 xen/arch/x86/cpu-policy.c               |  3 ++-
 xen/arch/x86/hvm/svm/nestedsvm.c        | 26 ++++++++++++++++++++++++-
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
index ce168e68e1b3..6999fcf1bb72 100644
--- a/docs/designs/nested-svm-cpu-features.md
+++ b/docs/designs/nested-svm-cpu-features.md
@@ -109,3 +109,16 @@ leaf 8000000A:edx
   Using it in L0 reduces the chance that we'll make some sort of error
   in the decode path.  And if hardware supports it, it's easy enough
   to provide to the L1.
+
+- 20 `SpecCtrl` *MSR_SPEC_CTRL virtualisation*: Require for L0, provide to L1
+
+  L0 already relies on this feature to virtualize MSR_SPEC_CTRL for the
+  L1 hypervisor itself (see `X86_FEATURE_SC_MSR_HVM`).  Requiring it
+  as a baseline for nested virt (first available on Zen2) means L1 can
+  rely on the same hardware virtualisation for its own L2 guests,
+  instead of having L0 unconditionally intercept and trap/emulate
+  MSR_SPEC_CTRL accesses coming from L2.  Providing it to L1 is
+  basically free once it's required of L0, and it removes a
+  significant amount of "CPU without the feature" fallback code that
+  would otherwise need to be implemented and maintained for nested
+  virt.
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 42dccdce5290..4d6de5dd5d0a 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -832,7 +832,8 @@ static void __init calculate_hvm_max_policy(void)
                                (1u << SVM_FEATURE_LBRV) |
                                (1u << SVM_FEATURE_NRIPS) |
                                (1u << SVM_FEATURE_PAUSEFILTER) |
-                               (1u << SVM_FEATURE_DECODEASSISTS));
+                               (1u << SVM_FEATURE_DECODEASSISTS) |
+                               (1u << SVM_FEATURE_SPEC_CTRL));
         /* Enable features which are always emulated. */
         p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
     }
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index dc2b6a42534a..46fff4fab5d3 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -481,6 +481,16 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     /* TSC offset */
     n2vmcb->_tsc_offset = n1vmcb->_tsc_offset + ns_vmcb->_tsc_offset;
 
+    /*
+     * SPEC_CTRL: When in host mode, the host SPEC_CTRL value is in effect
+     * and writes update the host SPEC_CTRL register. On a VMRUN, the
+     * processor loads the guest SPEC_CTRL register value from the VMCB or
+     * VMSA. For most guests, processor behavior is controlled by the logical
+     * OR of the two registers.  (APM vol.2 rev 3.44
+     * "SPEC_CTRL Virtualization").
+     */
+    n2vmcb->spec_ctrl = n1vmcb->spec_ctrl | ns_vmcb->spec_ctrl;
+
     /* Nested IO permission bitmaps */
     rc = nsvm_vmrun_permissionmap(v, clean.iopm);
     if ( rc )
@@ -1022,6 +1032,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
+    struct vmcb_struct *n1vmcb = nv->nv_n1vmcx;
     struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
 
     svm_vmsave_pa(nv->nv_n1vmcx_pa);
@@ -1035,6 +1046,18 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Pausefilter - keep it as is */
 
+    /*
+     * SPEC_CTRL: on real hardware, only the guest's own SPEC_CTRL bits are
+     * ever saved back to the VMCB on #VMEXIT (APM vol.2 rev 3.44 "SPEC_CTRL
+     * Virtualization"); the OR with the host's bits is a transient
+     * execution-time effect, never written back into the guest register.
+     * Here, n2vmcb->spec_ctrl was seeded with n1vmcb's bits OR'd in at VMRUN
+     * time (see nsvm_vmcb_prepare4vmrun()), and will still contain them if L2
+     * never wrote the MSR itself.  Mask those back out so L1's own SPEC_CTRL
+     * doesn't leak into, and persist in, L2's saved state.
+     */
+    ns_vmcb->spec_ctrl = n2vmcb->spec_ctrl & ~n1vmcb->spec_ctrl;
+
     /* Nested IO permission bitmap */
     /* Just keep the iopm_base_pa and msrpm_base_pa values.
      * The guest must not see the virtualized values.
@@ -1678,5 +1701,6 @@ void __init start_nested_svm(struct hvm_function_table *hvm_function_table)
         cpu_has_svm_lbrv &&
         cpu_has_svm_nrips &&
         cpu_has_svm_flushbyasid &&
-        cpu_has_svm_decode;
+        cpu_has_svm_decode &&
+        cpu_has_svm_spec_ctrl;
 }
-- 
2.34.1


