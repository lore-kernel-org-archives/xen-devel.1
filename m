Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA183606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=cima7LJh
Received: from list by lists.xenproject.org with outflank-mailman.1457884.1670385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJolW-0003mD-Th; Thu, 22 Oct 2026 09:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457884.1670385; Thu, 22 Oct 2026 09:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJolW-0003m6-Qs; Thu, 22 Oct 2026 09:07:14 +0000
Received: by outflank-mailman (input) for mailman id 1457884;
 Thu, 22 Oct 2026 09:07:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xJolV-0003m0-RS
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 09:07:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJolU-001gS8-Q2
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 11:07:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ad9d235-2eae-0a2a0a5409dd-0a2a450683b0-42
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 11:07:12 +0200
Received: from [40.93.201.46]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ad9d23e-195a-0a2a45060019-285dc92e1bf8-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 11:07:12 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by BY5PR03MB4983.namprd03.prod.outlook.com (2603:10b6:a03:1e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 09:07:09 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0522.016; Thu, 22 Oct 2026
 09:07:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCEoVYhJ4o1DmIXLO7OGC6SsKpjneRfw0ybrF7zZURKtdEu0sWq/lp/2HkzJIjC3O+wfYaMvEFBfGTzoo1FeumOpC0MqHlO5yXgJ4wu4Ls2n7d47MCA1q72MWnmI+n3puyIW+Ukn745xmOd1TCLrw3NHJ/6vc851N4LsREohTb0c5cPnKx3myMPsNay2NpQcjLCT8rfd2TLdC5XwU/kSxxGkP2AU+z5XvttV4jiGfvWv4/qZi1Wm6v1U5vcqchSKHkUGgGk+eNYDmFGIknxfHRuuoOflPngM8Cp8BT6Jek0gebv3zZQfCJ74gd8OwHOQkiR+5MCJU1a1/ldx0k3JHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVJ9QDL7TJ6xYiY9YpmuP2JzHHKsIqxTUFhVhiztq4Q=;
 b=L3OsvMgSZZBKvSbiVR07VxkKnM9SRUOOx2LgvNPd5VqzKIjUa26Y//OXuSe4RVgGxX5lbZ/J6vgkfkzXt/USprITCogPP+nis4chQ2Ob1WlAjoGJH+WQ/b+F72tmdp5vu7clg/OoXGZOuv6f7CI2rE9Kxd+yWcypEDwy91xepZGXVwE+nlJs89B0HGQS5uNlBQvJaGpBjV67n3HYThR/aUemm1ww0wwbhOsENvZTl6ZY/hFsWRe1yWi2ttJWltOSuSsK1B1CRfxAxHozYRgbKkXpxz9APGWSwbsyuTCfRtRvolooJtKhgwhkSBybonBcg7gygTMWeVbbDbUDRtbqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVJ9QDL7TJ6xYiY9YpmuP2JzHHKsIqxTUFhVhiztq4Q=;
 b=cima7LJhM5uqVqp3GkuW539dI5/6u4HFCNu32T8E3iUyzCJvHDsZsJvqgNwO9sFvswUbIe2nWZHhj3a1GaHvBeI6lflWRyGw0mzn+IAgoHiiACzT7D4pIfByOZVtfALp9i2qtSdiaRf0UAZhffR5DKq/r3BWRPt6z7IM9ZuBJpw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH] x86/nestedsvm: Record NextRIP with the deferred #VMEXIT
Date: Thu, 22 Oct 2026 17:06:57 +0800
Message-ID: <20261022090658.151682-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0023.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:16::18) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|BY5PR03MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: 52648f1c-e365-487b-8ea7-08df301bd9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|261021123027099003|11063799006|56012099006|261009223027099003|261021121427099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	f25MBzOm/0yirUGVbRHO0Tllt11aJtoHKb94X6H3ijAPi2Z3n1A1T/HKYY+2kmQkaR5L5FrTEgCcGjk+eczlD4PKFOlqlTr343Eo+ii5c2+MxLG4FqioSMdv6L08ABHi0jevXj0k8T8L9GFJAy8cHp+rtDhk5wvwx83AdfvQ2G/UFhaUFN4dOmfo+mCVF1LDk7pTSaQkJaMb9WSgy1jPe4eWNB37cNABrAF+dBwmdxLxM8x11T//mrjgIKmy4S/Gtt1iGHK2eNlpLCyzqNsjGSfeieDNVAiGkwCmap7vj5fjfkJb3m2pIPzXq7ToWZa66Kuel600ACTqvTLzFhCSIiYNYTd9n8hX1Kfp92p4nVA2DH+k+9TYR1YirMLaQ8kWNqdTtBghAl2MJdziFXjczbM5JyjTPWooHIt3gD0+oAd6jWZaPq+gslvpgfw6aUduFfDsNUDyfiy/TgfEK4A6gWsf/owlQXyqqk4GIE8hFYDNott5X1JgXMrnQ7hSQZXLf4OQ05l3kG9t1fABBqX1QgNbD4ohQm24e92S45ErIQHrcKFdLxO7jsGRBxoBZvH7CEjeG4z86sxxHild+d3GTdEyZLApreujLBwPzkIBhGwlYVyPfQzfhQqvV1bPi1hYwyMrmQJIQ4wp9Wj/+Hc0vSdJNfCeJzbLtSJ2VlqxKZc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261021123027099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ll3s95mIM+6yIq118qMJPOjmbPG7O64Tl0/8RYMIi2DuI1tJnoKuM67qzxmK?=
 =?us-ascii?Q?zdynSCE9JkRsQpfFjvRSQuJ99YRjI/hY0FvVXGmBU14nE/vvudTC6OpBYbrx?=
 =?us-ascii?Q?F88bJMJ1pmNMoOS5teP8wKqRHgAXCrPSNSsOovVtJiuvh/WaHosK2XoOIUZd?=
 =?us-ascii?Q?ExaYmMPaP94/rnaVkCdG3bE3+A++gofrJ6ixSPT25JVgzP307p88uzQ1cGd8?=
 =?us-ascii?Q?LFvnFJXOeHGCq82hqU/bKuqHSH+DY+FvY8/RZZVy5H4eMYIJyJ03SJUPXIZ+?=
 =?us-ascii?Q?y2sbbO1URDhJlx2wshXh+d57GYqJHMx32f2aojIpxaTi+lS3p+F/PF6Ja6QQ?=
 =?us-ascii?Q?jSV2+VRxMuIzgqaJhegG0wHQA9N+yNvOkN9ier2PPwF1wWVfjepymt7jVqCO?=
 =?us-ascii?Q?wZH9oK9z3lDZyRvmCTrPukRFOZBthsZaRmyDC9+QwEYX15R1WDSZPKdET6cJ?=
 =?us-ascii?Q?w9Tw1qtf6LUTWNRLPLkTMUEOY9k3ZO2gxb5BvY7DhOmiqvxOi5QjM99eaGfw?=
 =?us-ascii?Q?w26gv5CQqUY7Gl77PVGi+KyWxZwIoSoFuw7OHUEbLTZDBpzewDqBqMwoyQ2r?=
 =?us-ascii?Q?KxltZnyEuOLdmkyWaUk5RFh+fz3ZaOhhj6NdI+cxv+t3efkc1ozYQY+oVvSz?=
 =?us-ascii?Q?NiP50Ppujc8JSaTWlCzenOUFsGpAcz5znfhhnCDTlCp+Lzp0PFx0DKmuFTHz?=
 =?us-ascii?Q?EYnoJ97SkqcP9aTbR+VHruannBoLqjK+8JZRNtkUZlc6+h1oRIIPG2yTXmOw?=
 =?us-ascii?Q?rIASFjg3Y+xC3JYWRdyLEc7bk1PJM9e7xOfUyNZraXCFKO2bSz2DP2jfk7F8?=
 =?us-ascii?Q?T1z7YgSULXcU+defzXsd0NXwu9YCrl4dGcIZi8JwAkg9cqIljxtXzRQsOC85?=
 =?us-ascii?Q?yZeSGMjpX+pN+N2hDcQTP38JitCdocrfi0xqRyMdq4ARnIjQ+UHi+F8RXceX?=
 =?us-ascii?Q?z7Q5QmiPDBssuKaDVuyFvhal0NqDjB1B1RlSiXLp2FgchiBeBvSdN5VZ02rF?=
 =?us-ascii?Q?ARqXF2wnGAoqYXDUjNXuYn0C+Vmh/MmpgouZjhMjTaz1Umma1QsSDsCl9/Pu?=
 =?us-ascii?Q?rEj6om3nABxSvmMGReq4cHLCg8F8XCS49FfriZLeGP66EHw8M0492yt2iWcT?=
 =?us-ascii?Q?xHoUJ7O0eVnkOZ308aNi3AywtR+T1sNbbUi+GixnHO7soxASONDUOH5zoecF?=
 =?us-ascii?Q?lpe6NXJgw+TLbKtuA3O7S7wZBCBwPQ685Et5Sb4R2ER+ff8z30YK0yP4Ejcu?=
 =?us-ascii?Q?4xrXSQazF4Z5pZWFd2DGDDzf1iy4r8l5RjTFXwKDsER9hLX5rzieqaNZpOPz?=
 =?us-ascii?Q?jf5zDh+oU7saw/m84XzziIK3HQlRRH3tn46jEkw9YUQHs+dX2mn4WK8TDUV6?=
 =?us-ascii?Q?mkiY3drYGuE1QN4Ho2wUdci/03GBerWbXyfHIRkU7qZWRppcgloKEwBQmoMe?=
 =?us-ascii?Q?yc7C0k4wuFDibNjoW3Dw3hOw0ybRCfFU7VvXVvYAo7l+pRlj8zTi2R9nQ5vZ?=
 =?us-ascii?Q?sbKxuVF64HydEDWGQ27/y5Bqs7LmUQJcTLnWSjj4vEaHANnw/CIDUnHfUgGi?=
 =?us-ascii?Q?KKUmkcQYexQne9aZi7bTeyYyGZ3tNr+YrYgLWRIS3SqN13qZgT4bsM/JyUvy?=
 =?us-ascii?Q?dvOD8V+0cJVdZ6skyT9P2XuyI8Tslevr0yydHO/JtrFVSqhKb3oRKJeCbLV0?=
 =?us-ascii?Q?cmOxxiLg5R5XqLpSsRathKNtJIV6h6eCC6MPsz393TUcdZJ6B3RfL8WkIVRj?=
 =?us-ascii?Q?guWqRs0pcA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52648f1c-e365-487b-8ea7-08df301bd9ae
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:07:08.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvpXzBZakVnBD6R8MB03/KpPhNGdhUKmJg8AE9CXkd/+n2uElKNs8Dpihbz3ezT9ijyLZLdI1tU7uSZsAYwgy5W9EW99RwVKzUmvJMAU5lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4983
X-purgate-ID: tlsNG-16d1c6/1792660032-F4C0777B-E5274423/0/0
X-purgate-type: clean
X-purgate-size: 9150
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

nsvm_vmcb_prepare4vmexit() copies NextRIP from the hardware #VMEXIT,
but L0 also delivers #VMEXITs it creates itself, for which that value
belongs to a different exit.  Such a #VMEXIT saves no nRIP (AMD64 APM
vol 2, publication 24593 rev 3.44, section 15.7.1).  For example:

 1. L1 intercepts #GP but not MSR accesses.
 2. L2 executes RDMSR of an MSR which Xen doesn't implement.
 3. Hardware exits to L0 with VMEXIT_MSR and NextRIP after the RDMSR.
 4. L0 handles the RDMSR itself and injects #GP into L2.
 5. L1 intercepts #GP, so L0 delivers VMEXIT_EXCP_GP to L1.
 6. L1 sees NextRIP after the RDMSR, instead of 0.

Record NextRIP in ns_vmexit alongside the exitcode and exitinfo, and
have each source of a #VMEXIT supply it: the hardware value for a
reflected #VMEXIT, the next RIP for an INT3/INTO which L0 emulated, and
zero for everything else, including a failed VMRUN.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
Assisted-by: Claude:claude-opus-5-5
---
Found with a nested-SVM XTF test, not yet upstream.

This is the #VMEXIT counterpart of commit 9d6b6e4f7394 ("x86/svm: Sync
nextrip during virtual VMRUN").

BOUND's #BR is raised by the emulator as a plain hardware exception
without an instruction length, so it still reports 0 rather than the
next RIP.

Chunjie's "x86/nestedsvm: rework nested VMRUN/VMEXIT handling" series
also changes nestedsvm_vmexit_defer() and nsvm_vcpu_vmexit_inject();
under it NextRIP would become one more value passed alongside
exitinfo1/2.  I'm happy to rebase on top of it, or the other way round,
whichever merge order is preferred.

 xen/arch/x86/hvm/svm/nestedhvm.h         |  3 ++-
 xen/arch/x86/hvm/svm/nestedsvm.c         | 32 ++++++++++++++++++++----
 xen/arch/x86/hvm/svm/svm.c               |  8 +++---
 xen/arch/x86/include/asm/hvm/svm-types.h |  1 +
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 9bb04a0434..963390e8a9 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -28,7 +28,8 @@
 
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
 void nestedsvm_vmexit_defer(struct vcpu *v,
-    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2,
+    uint64_t nextrip);
 enum nestedhvm_vmexits
 nestedsvm_vmexit_n2n1(struct vcpu *v, struct cpu_user_regs *regs);
 enum nestedhvm_vmexits
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 2b998e26bc..241912e1ad 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -154,6 +154,7 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_hostflags.bytes = 0;
     svm->ns_vmexit.exitinfo1 = 0;
     svm->ns_vmexit.exitinfo2 = 0;
+    svm->ns_vmexit.nextrip = 0;
 
     svm->ns_iomap = NULL;
 
@@ -696,6 +697,7 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     if ( inst_len == 0 )
     {
         svm->ns_vmexit.exitcode = VMEXIT_SHUTDOWN;
+        svm->ns_vmexit.nextrip = 0;
         return -1;
     }
 
@@ -717,6 +719,7 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     case NSVM_ERROR_VVMCB:
         gdprintk(XENLOG_ERR, "inject VMEXIT(INVALID)\n");
         svm->ns_vmexit.exitcode = VMEXIT_INVALID;
+        svm->ns_vmexit.nextrip = 0;
         return -1;
     case NSVM_ERROR_VMENTRY:
     default:
@@ -782,6 +785,7 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     }
 
     ns_vmcb->exitcode = exitcode;
+    ns_vmcb->nextrip = svm->ns_vmexit.nextrip;
     ns_vmcb->event_inj.raw = 0;
     return 0;
 }
@@ -789,10 +793,26 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
 int cf_check nsvm_vcpu_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
+    const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    uint64_t nextrip = 0;
+
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
+    /*
+     * An exception intercept saves NextRIP only for INT3, INTO and BOUND
+     * (AMD APM vol 2 rev 3.44, 15.7.1).  The emulator raises BOUND's #BR as
+     * a plain hardware exception, so only INT3/INTO can be recognised here.
+     * As in svm_inject_event(), truncate it outside of 64bit mode.
+     */
+    if ( event->type == X86_ET_SW_EXC )
+    {
+        nextrip = guest_cpu_user_regs()->rip + event->insn_len;
+        if ( !((vmcb_get_efer(vmcb) & EFER_LMA) && vmcb->cs.l) )
+            nextrip = (uint32_t)nextrip;
+    }
+
     nestedsvm_vmexit_defer(v, VMEXIT_EXCEPTION_DE + event->vector,
-                           event->error_code, event->data);
+                           event->error_code, event->data, nextrip);
     return NESTEDHVM_VMEXIT_DONE;
 }
 
@@ -1063,8 +1083,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* LBR virtualization - keep lbr control as is */
 
-    /* NextRIP */
-    ns_vmcb->nextrip = n2vmcb->nextrip;
+    /* NextRIP is set by nsvm_vcpu_vmexit_inject(). */
 
     /* Decode Assist */
     ns_vmcb->guest_ins_len = n2vmcb->guest_ins_len;
@@ -1219,7 +1238,8 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
 /* VMEXIT emulation */
 void
 nestedsvm_vmexit_defer(struct vcpu *v,
-    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2,
+    uint64_t nextrip)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
@@ -1232,6 +1252,7 @@ nestedsvm_vmexit_defer(struct vcpu *v,
     svm->ns_vmexit.exitcode = exitcode;
     svm->ns_vmexit.exitinfo1 = exitinfo1;
     svm->ns_vmexit.exitinfo2 = exitinfo2;
+    svm->ns_vmexit.nextrip = nextrip;
     vcpu_nestedhvm(v).nv_vmexit_pending = 1;
 }
 
@@ -1359,6 +1380,7 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
 
         case NESTEDHVM_VMEXIT_ERROR:
             exitcode = VMEXIT_INVALID;
+            vcpu_nestedsvm(v).ns_vmexit.nextrip = 0;
             break;
         default:
             ASSERT(!nestedhvm_vcpu_in_guestmode(v));
@@ -1478,7 +1500,7 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
                                      guest_cpu_user_regs(), exitcode);
     if ( ret )
     {
-        nestedsvm_vmexit_defer(v, exitcode, intack.source, exitinfo2);
+        nestedsvm_vmexit_defer(v, exitcode, intack.source, exitinfo2, 0);
         return NSVM_INTR_FORCEVMEXIT;
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 71e48351f2..cf9e3ef1ab 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1618,7 +1618,7 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     case -1:
         ASSERT(nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v));
         /* inject #VMEXIT(NPF) into guest. */
-        nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa);
+        nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa, 0);
         return;
     }
 
@@ -2556,7 +2556,7 @@ void asmlinkage svm_vmexit_handler(void)
         enum nestedhvm_vmexits nsret;
         struct nestedvcpu *nv = &vcpu_nestedhvm(v);
         struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
-        uint64_t exitinfo1, exitinfo2;
+        uint64_t exitinfo1, exitinfo2, nextrip;
 
         paging_update_nestedmode(v);
 
@@ -2581,6 +2581,7 @@ void asmlinkage svm_vmexit_handler(void)
              */
             exitinfo1 = vmcb->exitinfo1;
             exitinfo2 = vmcb->exitinfo2;
+            nextrip = vmcb->nextrip;
             nv->nv_vmswitch_in_progress = 1;
             nsret = nestedsvm_vmexit_n2n1(v, regs);
             nv->nv_vmswitch_in_progress = 0;
@@ -2588,7 +2589,8 @@ void asmlinkage svm_vmexit_handler(void)
             {
             case NESTEDHVM_VMEXIT_DONE:
                 /* defer VMEXIT injection */
-                nestedsvm_vmexit_defer(v, exit_reason, exitinfo1, exitinfo2);
+                nestedsvm_vmexit_defer(v, exit_reason, exitinfo1, exitinfo2,
+                                       nextrip);
                 goto out;
             case NESTEDHVM_VMEXIT_FATALERROR:
                 gdprintk(XENLOG_ERR, "unexpected nestedsvm_vmexit() error\n");
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index beab9a3af2..fafbd646cc 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -74,6 +74,7 @@ struct nestedsvm {
         uint64_t exitcode;  /* native exitcode to inject into l1 guest */
         uint64_t exitinfo1; /* additional information to the exitcode */
         uint64_t exitinfo2; /* additional information to the exitcode */
+        uint64_t nextrip;   /* NextRIP to report to the l1 guest */
     } ns_vmexit;
 
     union {
-- 
2.49.0


