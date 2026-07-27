Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B682EC531FC
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 07:18:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371433.1618948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woFav-0007oO-I8; Mon, 27 Jul 2026 07:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371433.1618948; Mon, 27 Jul 2026 07:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woFav-0007oH-FU; Mon, 27 Jul 2026 07:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1371433;
 Mon, 27 Jul 2026 07:17:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1woFau-0007oB-Jg
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 07:17:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woFaq-002iBZ-UA
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 09:17:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a670618-5cb7-0a2a0a5109dd-0a2a4504b28e-4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 09:17:44 +0200
Received: from [52.101.48.52]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a670616-b57f-0a2a45040019-346530340728-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 09:17:44 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by DSSPR03MB989190.namprd03.prod.outlook.com (2603:10b6:8:376::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:17:41 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:17:41 +0000
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
 b=YA7Lpe/kp5C99y/WB+iWPqEbHW035X1/4tI1qO4veXYqixHnn/4NDZdjrs2WH6KIu0A4eKiE3tVi4/ARbXz6ZCQC8TJSVeY//yZDmdISY2Vup2huQZgHEN0L3CPzxrvU5abe+iovTS0CLi6h5TJcglMX2qR3RMbNiadAlfNDs2AXlTPjk8tBCTz3+CvN6jbW8RcvQlA5oIGgC/YFqJmHcLUGqKV/xbMPWDmctM30AFk94G63aamLSwVUTKtgsTv89Gz+DsYIHiVS3CjqM92SMpTw1IwnOEpEItc0x1qYOTbyQhbf32hz86jbu+gCFYEzti16fe0eXcM565c583/zAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAcr0j+yIqsPRmD1tF/qZU0uE3TQSJfmiKWwtMqqju0=;
 b=pqWM5QDIeEHcqbn6OJOEmX29uXyFe5PbIDuFnN7U2CXhye1klYFkw+4w7OnBA7MmQam0VHqj83B+B8S5cr5QjZ3nltCKORd96kwZ+UkAmdNln46qBiJBI+4QYKPywViNb02/2QRq1Nfw6TjHHilAYnMs95h5wgCDd9FPV2pm1hEpT7xo4IOBKJ2EzWQNJcIj0s5GD1fvQMuFL2ehgDAQnR4gk4X0TuJux5fMycK7oUWxYrC+YNsd1mRg2HexoudQBCH8WmcuvS7i4mCdOtCsNTZqrLDJfHlvsZTXIk54ifR2oZLa6oDKwDz6krSwZXL+ckS8TXIX1jyulCZgcVZ1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAcr0j+yIqsPRmD1tF/qZU0uE3TQSJfmiKWwtMqqju0=;
 b=laXjjnIVUfkp5/JrAs3HUEzdyEkj2KjBdokS+9oMxAOdHPI9lJ8wxT69FyanP3lrKBPFzoc2oJ8LhNUQbIxCeL0ZjU1lRy5MPkZJacWMdS/4lpdDC7QA/UXZeCq1I0FGKVsUEBN2x7B7m+Ktsl9kLySvZSi1aWCHX3q+duChexc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH] x86/svm: require VMSAVEvirt for nested virt
Date: Mon, 27 Jul 2026 15:17:08 +0800
Message-ID: <20260727071709.196088-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5c::9) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|DSSPR03MB989190:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f42f42c-c6ad-4960-6ab1-08deebaf251c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|10067099003|6133799003|5023799004|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	r2TM/NHZQg3mF8LheWnkJyPgAcPr4gNcMUYz7pVmatNPaJRkmtJMEDEvkHH7w51xVSZFWnMC6lS2LTsfjcnbF7GqWvubBdeZoZitA9tkYUWa4lYtioQSFRFrQ2glL+V1GVHCp027ISmVBpTvuSWYhWfmyjg1U7mXblxf8aMW+0LDTQih9WE9qXwCq3yKiLiFpfGhqLEHPBhzCW06l91FlrHH0gYL8A+Q23kyLsYlvBwcjbcIAUA02bgTEUupI3nHP+RoJj6xNAnu81jLXAg2g4Z+2iMlTycpkpZzmfBL9Q/JU1qR1FyPsgHnsOf0g9ZkQBj2cS64cNMoT4QWBKYxYVzOqgtNj/+9AxEqR7Pw4ojce+4Qyxr+xbJYm18LM2+IoGE9139pK2yAc1loD3cSvyPzquC08wMvdNLCkpXEGEAgkCHAG3R4Zv3g7GCjHef3rOQU8E7uHqR8vCLvc2+i+EcUuxD4Z0eUHq5LS9N6G692i1aIhzQt2MZlFzSDKUVbjoao2s7F5e1IOWQruxWwpz/L92CGESEoFoZq/2eZF5C5+iMWEkeEsQPY0hBmQNd1Rns/vOf2BXA6lNkkFQSCLdI30wG5JuQNScnzikERKUwEZFYZwUBLumdBMyR/XhVcq9HpNM07uNqytJweeBvASfUoL2LWgVKFc3VyK5bhuP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(5023799004)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+QXQqUt49Azw7RvDB6CSfTJgyEabw5GwUj5NslIqMk1IOmqawJPDpgCQPdz3?=
 =?us-ascii?Q?J01rQoaUq5UPZs0Im8EtyTxoIiX5YWcXs+O9V9dP8BHnGAT0agPNv1s14F5z?=
 =?us-ascii?Q?J7NWQRdV6jEzvzXCHHz3Ict6V1xGGj9vRwKY/VLREYLD3z2vM/PcIs6NbrbX?=
 =?us-ascii?Q?9x10j/m25SAMI/pz0oKJw/2pN9A8mWmpMZXQzKwXpQ8MVhYLUlsP9SizNeUz?=
 =?us-ascii?Q?pcpd/08BVTr5FrcIWhptSw8ax3U/CAXVtBWU8JQxHQhX3NpJGk3LTpS0iyew?=
 =?us-ascii?Q?6D51ey5hXxFIQG/m/Ae+Jcd8mBCTb99TnkbfgYsnc9BIx+zHP2T53S39zXsZ?=
 =?us-ascii?Q?d1bvB83MMGjUr6n020i0SWPQrDSfuYoL23p35n7VFHF4MwwGz8/bZjbkMddL?=
 =?us-ascii?Q?/sKzNio5hwR9dF3VunF4/p8PrBv7i9WT81MLmVvNUQ7wswFdKYZd/8xy6fwI?=
 =?us-ascii?Q?/RdxOLssMVWu3RXZSHuuiSlAFG3x2E4sD4SfoHf2n6Q7Cvdv6sEBhuv+xyvl?=
 =?us-ascii?Q?AMAt21OQMBPD1nTdp+ufRQ7OUQszDeD1/Ynpv6IJ5o4G1WwmYUlhyPTOTScZ?=
 =?us-ascii?Q?tUIq51sf0he5iWI2bk04H/XWuDyPNn9cD9K0JyaZ8Hoc7BEk3wCc13kLUL/L?=
 =?us-ascii?Q?kZYIWiHfxvBch2ghdV4SCWiesnAtHISVMKYwPkbBCY3evRtzOiu4/sGTJP2v?=
 =?us-ascii?Q?gUJ/RAMFX77HWUojb7hVYya6pNzGjjueXm8H7kaaUe4DmZuGJoQQ7v0kaLIB?=
 =?us-ascii?Q?se/yR3p9Ho19D6jgfWoV7lmAwZnhiG8hY3wiEh04grYSwNCmzzff01a2vx8g?=
 =?us-ascii?Q?GYux/4irSknC/K5d3XaNKHYvm6Icrn2SdifgN09PDJHLRSPQk7oefuAE5SsS?=
 =?us-ascii?Q?1n0inq6aPS+dFPhD0vILR0w9NbjurRGC8GATS3kuZseeKwcJ9qgpgUzVR51b?=
 =?us-ascii?Q?euxLkt9xCfN41j9AcTUFJbzSxaHMIwK6teALik/muGwmcB77bJyt1II80LSx?=
 =?us-ascii?Q?khT+WuqvS4598cXVjHglgyDAkAev9tOTgLW+7JakptZdUbTu3avzzjqdEfYg?=
 =?us-ascii?Q?fvIr1QL40A2WdBWKVqQdBpfTlPmKYp/5TaTqJw1ILIFuUlKmjB7P33bGk87q?=
 =?us-ascii?Q?irXfT4SWBZ4FKhO5jzXkO6z2cDsUDqPBhaAVzdtfKDnhlQEGVcfqi+6bbRY5?=
 =?us-ascii?Q?ue3E+H+5YyBxzOtumYcSimMvUid1ZcgIMFVP2P23O6+TZwNtWLcbRnDdEZvL?=
 =?us-ascii?Q?TXTArIwExA2l3kshY9tlC4X0btAfXGSZZT2f82AuMEluicfytz68GnueqPzy?=
 =?us-ascii?Q?uKF6GhsRXUEkGJfMqIy222JBM6PlQcNFQdCjV8b80VCNzBQlOzb44GEbl8l1?=
 =?us-ascii?Q?6XCuU5Y1j4+W4ZiwyWRKdfrpG7ZekPeGOsKCfIHIiMwBtNG7xrVgmJDZQkKV?=
 =?us-ascii?Q?ZPCK8i9WAZhYKq5MegL3HVYCdWV01opDHuL4RfNl1pqKxpfVeCzHXovy2n5M?=
 =?us-ascii?Q?BivwPHGBmb5MPmqP/kFLjwujuyxe3Nct8aPeU6PrUsOIwx2d4iCqJART6jVh?=
 =?us-ascii?Q?R2ks+hqB0fRkt/+MuE0tGS/740UtoWBb04NgC7+mMoHbqbbQYKzuV229ICdO?=
 =?us-ascii?Q?W+2MTL7eXLkdBHVc8H/1bFqzbPBbLu5eXKJHsdko6M2H3H5GQSQMCeh5w7f4?=
 =?us-ascii?Q?I0xmFPzUKisOx3yjCr6o6DfPDqafz9//lxLAQ6FWeHGIAiIA2vlCjL5yc0pG?=
 =?us-ascii?Q?fa/bEJdo1g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f42f42c-c6ad-4960-6ab1-08deebaf251c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:17:41.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46j0eYsuCaVPue5w1yAhNmsZj6gW2nnsv6/9FaWtuBkE5qBWnKsaULi+MkrSfvdMrfBYcCdUC/ISRr/qFqaJxF1zeDncfPmwg1H4PLF3T8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR03MB989190
X-purgate-ID: tlsNG-ebf023/1785136664-51CD7B50-F338F3F8/0/0
X-purgate-type: clean
X-purgate-size: 9859

Virtual VMLOAD/VMSAVE lets an L1 guest execute VMLOAD and VMSAVE
without intercepts.  Without it, Xen has to map the L1-provided VMCB
and re-execute each instruction in L0, complicating security-sensitive
state handling.

Make VMSAVEvirt a hard requirement for nested SVM.  Advertise it to
L1, enable it when L1 enables SVM, and remove the nested VMLOAD/VMSAVE
emulation path.  Any remaining intercept therefore comes from a guest
which has not enabled SVM and receives #UD.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
 docs/designs/nested-svm-cpu-features.md |  11 +++
 xen/arch/x86/cpu-policy.c               |   3 +-
 xen/arch/x86/hvm/svm/nestedsvm.c        |  24 ++++--
 xen/arch/x86/hvm/svm/svm.c              | 100 +++---------------------
 xen/arch/x86/hvm/svm/svm.h              |   2 -
 5 files changed, 41 insertions(+), 99 deletions(-)

diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
index ce168e68e1..798480b259 100644
--- a/docs/designs/nested-svm-cpu-features.md
+++ b/docs/designs/nested-svm-cpu-features.md
@@ -109,3 +109,14 @@ leaf 8000000A:edx
   Using it in L0 reduces the chance that we'll make some sort of error
   in the decode path.  And if hardware supports it, it's easy enough
   to provide to the L1.
+
+- 15 `VLoadSave` *Virtual VMLOAD/VMSAVE*: Require for L0, provide to L1
+
+  Without this feature Xen has to intercept the L1 hypervisor's VMLOAD
+  and VMSAVE instructions and emulate them by re-executing the real
+  instruction on a mapped copy of the L1-supplied VMCB.  That path
+  handles a complex, security-sensitive subset of state (the hidden
+  segment descriptors for FS/GS/TR/LDTR plus the SYSCALL/SYSENTER
+  MSRs), so on faithfulness grounds we'd much rather let the hardware
+  do it.  When present, the instructions execute natively in the guest
+  without a #VMEXIT, which is both simpler and faster.
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5273fe0ae4..f151623f5e 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -837,7 +837,8 @@ static void __init calculate_hvm_max_policy(void)
                                (1u << SVM_FEATURE_LBRV) |
                                (1u << SVM_FEATURE_NRIPS) |
                                (1u << SVM_FEATURE_PAUSEFILTER) |
-                               (1u << SVM_FEATURE_DECODEASSISTS));
+                               (1u << SVM_FEATURE_DECODEASSISTS) |
+                               (1u << SVM_FEATURE_VLOADSAVE));
         /* Enable features which are always emulated. */
         p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
     }
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index b06124c2c9..794fb6e589 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -562,7 +562,10 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Keep the host values of the fs, gs, ldtr, tr, kerngsbase,
      * star, lstar, cstar, sfmask, sysenter_cs, sysenter_esp,
-     * sysenter_eip. These are handled via VMSAVE/VMLOAD emulation.
+     * sysenter_eip. These are not transferred by VMRUN/#VMEXIT; they
+     * are moved directly to/from the L1-provided VMCB by the guest's
+     * own VMSAVE/VMLOAD, which run natively (VMSAVEvirt is required
+     * for nested virt).
      */
 
     /* PAT */
@@ -1097,7 +1100,10 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Keep the l2 guest values of the fs, gs, ldtr, tr, kerngsbase,
      * star, lstar, cstar, sfmask, sysenter_cs, sysenter_esp,
-     * sysenter_eip. These are handled via VMSAVE/VMLOAD emulation.
+     * sysenter_eip. These are not transferred by VMRUN/#VMEXIT; they
+     * are moved directly to/from the L1-provided VMCB by the guest's
+     * own VMSAVE/VMLOAD, which run natively (VMSAVEvirt is required
+     * for nested virt).
      */
 
     /* CR2 */
@@ -1547,9 +1553,14 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
      */
     if ( nsvm_efer_svm_enabled(v) )
     {
+        /*
+         * VMSAVEvirt is a hard requirement for nested virt (see
+         * start_nested_svm()), so it is guaranteed present here.
+         */
+        ASSERT(cpu_has_svm_vloadsave);
+
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
-             paging_mode_hap(v->domain) &&
-             cpu_has_svm_vloadsave )
+             paging_mode_hap(v->domain) )
         {
             vmcb->virt_ext.fields.vloadsave_enable = 1;
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
@@ -1603,9 +1614,10 @@ void __init start_nested_svm(struct hvm_function_table *hvm_function_table)
      * docs/designs/nested-svm-cpu-features.md for rationale.
      */
     hvm_function_table->caps.nested_virt =
-        hvm_function_table->caps.hap && 
+        hvm_function_table->caps.hap &&
         cpu_has_svm_lbrv &&
         cpu_has_svm_nrips &&
         cpu_has_svm_flushbyasid &&
-        cpu_has_svm_decode;
+        cpu_has_svm_decode &&
+        cpu_has_svm_vloadsave;
 }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 38c61db1d7..637c29daf7 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2134,95 +2134,17 @@ svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
     return;
 }
 
-static struct page_info *
-nsvm_get_nvmcb_page(struct vcpu *v, uint64_t vmcbaddr)
-{
-    p2m_type_t p2mt;
-    struct page_info *page;
-    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-
-    if ( !nestedsvm_vmcb_map(v, vmcbaddr) )
-        return NULL;
-
-    /* Need to translate L1-GPA to MPA */
-    page = get_page_from_gfn(v->domain, nv->nv_vvmcxaddr >> PAGE_SHIFT,
-                             &p2mt, P2M_ALLOC | P2M_UNSHARE);
-    if ( !page )
-        return NULL;
-
-    if ( !p2m_is_ram(p2mt) || p2m_is_readonly(p2mt) )
-    {
-        put_page(page);
-        return NULL;
-    }
-
-    return  page;
-}
-
-static void
-svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
-                     struct cpu_user_regs *regs,
-                     struct vcpu *v, uint64_t vmcbaddr)
-{
-    unsigned int inst_len;
-    struct page_info *page;
-
-    if ( (inst_len = svm_get_insn_len(v, INSTR_VMLOAD)) == 0 )
-        return;
-
-    if ( !nsvm_efer_svm_enabled(v) )
-    {
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        return;
-    }
-
-    page = nsvm_get_nvmcb_page(v, vmcbaddr);
-    if ( !page )
-    {
-        gdprintk(XENLOG_ERR,
-            "VMLOAD: mapping failed, injecting #GP\n");
-        hvm_inject_hw_exception(X86_EXC_GP, 0);
-        return;
-    }
-
-    svm_vmload_pa(page_to_maddr(page));
-    put_page(page);
-
-    /* State in L1 VMCB is stale now */
-    v->arch.hvm.svm.vmcb_sync_state = vmcb_needs_vmsave;
-
-    __update_guest_eip(regs, inst_len);
-}
-
 static void
-svm_vmexit_do_vmsave(struct vmcb_struct *vmcb,
-                     struct cpu_user_regs *regs,
-                     struct vcpu *v, uint64_t vmcbaddr)
+svm_vmexit_do_vmload_vmsave(struct vcpu *v)
 {
-    unsigned int inst_len;
-    struct page_info *page;
-
-    if ( (inst_len = svm_get_insn_len(v, INSTR_VMSAVE)) == 0 )
-        return;
-
-    if ( !nsvm_efer_svm_enabled(v) )
-    {
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        return;
-    }
-
-    page = nsvm_get_nvmcb_page(v, vmcbaddr);
-    if ( !page )
-    {
-        gdprintk(XENLOG_ERR,
-            "VMSAVE: mapping vmcb failed, injecting #GP\n");
-        hvm_inject_hw_exception(X86_EXC_GP, 0);
-        return;
-    }
-
-    svm_vmsave_pa(page_to_maddr(page));
-    put_page(page);
-    __update_guest_eip(regs, inst_len);
+    /*
+     * VMSAVEvirt is required for nested virt, so once a guest enables SVM its
+     * VMLOAD/VMSAVE execute natively and are no longer intercepted.  An
+     * intercepted VMLOAD/VMSAVE therefore means the guest has not enabled SVM:
+     * inject #UD.
+     */
+    ASSERT(!nsvm_efer_svm_enabled(v));
+    hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
 }
 
 static int svm_is_erratum_383(struct cpu_user_regs *regs)
@@ -2950,10 +2872,8 @@ void asmlinkage svm_vmexit_handler(void)
         svm_vmexit_do_vmrun(regs, v, regs->rax);
         break;
     case VMEXIT_VMLOAD:
-        svm_vmexit_do_vmload(vmcb, regs, v, regs->rax);
-        break;
     case VMEXIT_VMSAVE:
-        svm_vmexit_do_vmsave(vmcb, regs, v, regs->rax);
+        svm_vmexit_do_vmload_vmsave(v);
         break;
     case VMEXIT_STGI:
         svm_vmexit_do_stgi(regs, v);
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index cfa411ad5a..56a1a4840b 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -52,8 +52,6 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
 #define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
 #define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
 #define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
-#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
-#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
 #define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
 #define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
 #define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */

base-commit: 644ea6f84510af27ee1847e981df945a94068479
-- 
2.49.0


