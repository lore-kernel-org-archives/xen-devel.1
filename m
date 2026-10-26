Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84001606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ev/thFQy
Received: from list by lists.xenproject.org with outflank-mailman.1460784.1671626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEyD-0003VZ-Ea; Mon, 26 Oct 2026 07:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460784.1671626; Mon, 26 Oct 2026 07:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEyD-0003VS-A5; Mon, 26 Oct 2026 07:18:13 +0000
Received: by outflank-mailman (input) for mailman id 1460784;
 Mon, 26 Oct 2026 07:18:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLEyB-0003VM-Sa
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:18:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLEyB-003Mc1-00
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:18:11 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefeaa-bab6-0a2a0a5309dd-0a2a4505b722-44
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:10 +0100
Received: from [40.93.201.42]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefeb0-4cb1-0a2a45050019-285dc92ab773-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:10 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by DS0PR03MB989640.namprd03.prod.outlook.com
 (2603:10b6:8:42d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:18:06 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:18:05 +0000
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
 b=uAuW0GF914EbcsHOHm6rlG78zhlxOaEd9hTww3QEOWCJmFvL3gvTmkZ1gZd7vbvU1Qic7V78LY+4dNnGn1O6HuzYwNxDu6LgqXQOEHaK8PtNsbZpCWPjulf1ikUtzi56D26Co8BudLRVnTP5ON++KhqdiDGzflr1qh5UV2pI7Ff81bbvP1q4DUNCC9vYj1/vEopQ0lY4ZM9eVXzQN/Y7wc7U5tLwF27Wna0bZU5zoch1szJ4kTxaBd9fJaQcoyADCsmm58/4yrqzvvMUxJZtM7iMdR0vK5O7qfCkae1e6Shfhd1FVhNkuYHpdex0vIS5CVmW3y2wyy3oS2FddbDfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZ4b6/zSvCbyu9Tayf7mShTmi92eHn/QkrGHSZfCc2U=;
 b=pKowiQFYZYbwm7WD+Jra9eJCdRejY28qJ4AjhmyVvrNvX+G2JFgOsLQZe7EX4v4qFe5LKLHcEY0/fVDwfR0FD8PfzjkU4cqc05d1An6PbXcCepTAtR8Uhkhf9uoFB4TEFiUkinNfFDgZKaEClzd+f+PVFg8R2b0Q+ufLmr8KL4PAUfvmvIfh8UTajP+8sT4vPrhrX5ASc95NqcMLOnXfAfYj9+0b3aYCO88iHipeoqPLyH5vspc48QleIB1rCHG1QDQwoXL87dfa2ay8QbOj3yDeTWmlT/T+8WX9SNyvB35zuJpdwmtb1WMo14Ch5WrX8SK0dWYDcu2cthl5awdLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ4b6/zSvCbyu9Tayf7mShTmi92eHn/QkrGHSZfCc2U=;
 b=ev/thFQy3XQTQIueRaiouGJTlFqvc9pg54XlwwCDxvkV8BFHUiN91t7a565GYRp5rvbld+oc/GNLCErPNemJS8GH4CAiB9QDOVpp08mcoamk/ZwdBd2qsEOpU3syw2MQ05JNDMjTMHtjxAFDv1R78lFPIROppOYPq+Whwo+OuY0=
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
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH V1 0/8] x86/nestedvmx: Fix nested VMX bugs
Date: Mon, 26 Oct 2026 15:17:46 +0800
Message-Id: <cover.1792997742.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|DS0PR03MB989640:EE_
X-MS-Office365-Filtering-Correlation-Id: 4498ab00-f662-4c6a-51dd-08df33314748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261021135927099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	0qVHgh4OA7liO8xLeZA416A7eE7y3KeaI2Yw02yQx9V0xfw9Eix6KZbWDj0/o84eQbg0pEu40Me0BL3RjubCggdzF4UGwhERKpgtdpAztW0j/PRm1D+KpPpXeyKyXz6Z8FvgIBQOSTm4imwTjyy/ykwZQkgO2C1hZngzrif12RQ3eaFj7LHAJZY5+nGilvU7L9lXlhGRrl9Opsefwm2zPxofZ4Mmma1kTss2rR4RYxLgHjCAqfjm6dMlZNNHMr5UmIQQStmJUbDe5TYFphKMPt9teHMtFVMfRX5AYowE0GzGV8LGtQ7zSkIba5TSQ1JZ6RbG0bBXY1RncYFe9HHCjoMXxwba31qIzL5Cz+NfRMEj6R21Yb/+rXqVQ8Dby70Qg0rs/SXvF/DlnObLeGmHW9qCLbbVNcGZIUmh+G25vtf3q6ln0iZxR2v0sJ/eleTv3Gsq+johkA26aCnqC8q3CMLNrH4CdIKJ6UguXzUNzHgBg+Lil7bnc1axFilJ6CxIR1YmUJz4ysFClmGKhEwnaxKEqcwdnsKdG9X4QP9hmZ07iC7Yed7htGkw9ZIhMWs2nCq/MBngtJhCHzXI5XC9exnrKG+Ng7ew8HdPac349mTJNge9n9arJfo3ZnTdVYfiTYGQC/so0SlEOlwmwHHsv40kxGURxmij5NGrelf/xEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261021135927099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/uM238C/wNqMAmIMjuGX5sE4uOtQwhgDENYlS/SpLEY40tPkEKIMbLq3rjJY?=
 =?us-ascii?Q?2/2K5WyywbjOcpeyMaRWrvtID0nheh2Xi7Y1GUbquDfCZKGscadH+bK7N7nh?=
 =?us-ascii?Q?lM+2cmeIrPhGEJToPvtHWRP/3nhw4dUt+1YplUOUCNzU6JsU+vSMPIs1+Ptw?=
 =?us-ascii?Q?StXF8+LLEt+dclYWqlYeEu8rMyxTP6Ic6z1e7NaWVomF5QY07NJsXJVIAQPG?=
 =?us-ascii?Q?ZYKpbUTIV+85f9SbaoiMzMwJznrGWkDely6HyIOSjl8x4KFDfd4nwXizia6Y?=
 =?us-ascii?Q?xSXk4jzOFCF05r/L0vve1cUT3WwGHrPZc+DPuOvXEhmDKTlbpmGoWpYmEyKw?=
 =?us-ascii?Q?I1VBYcaWeixlbBE+8KCyBUDIWhv/AweZzQW4mlJsjD+7udv9Lw3Aq6lCC1Hb?=
 =?us-ascii?Q?Y6lFmOsQxnG8ZkgDjulK0Dqnw8ccST2TYMbGyWVljVX9Wbw5glpP/47S0QkX?=
 =?us-ascii?Q?r1EZOVSdtylKbRm4wuyALdX1VJJdEPwEdoGGsCcW4eNFDUZAQkx8BL+7eMG9?=
 =?us-ascii?Q?5v9U7VZhEjnAE0ENpiIYxQEOKQSRm5Pt8KP/PXm69sN5Pce1BnMIECwDPDch?=
 =?us-ascii?Q?k1FlHZwIfdEco2xlMvNmbpQ64pMwllDKSQ4K2yW/ZsR9GcVlr6c6cIyie9sY?=
 =?us-ascii?Q?0YwvoLNbW3gOwq3BpBPdyqpYsDBiafp6x7V/z7GjBvTJ1jEeHzhgReXu8Orh?=
 =?us-ascii?Q?jtDOH7hKJrlLS50bpfkgAErRkxWHfOi2zYv7TdVdHoTi77Q/as6kFOhMfj4q?=
 =?us-ascii?Q?CrB7Yt7Sk0Z5MMGFJ0ufiTvPsQYtXdIuHIvFnyW/IXdcS/OrLRuFfHu8jYtL?=
 =?us-ascii?Q?RtSd2bFpgC0PtIg3stS2mEwt459vkt4IRT3Q/Nh06y4GOsPH4fhfeQSV5/w8?=
 =?us-ascii?Q?mU4iYz7ja6aL9cUk3QPiUwLzRtxK9MWSYwR1mqBr15U+l0RzvfSy18kKqigk?=
 =?us-ascii?Q?emqUD3272URojisEB6BAU1mp98nMfpdPmDyMkTDkPdFa1v1uWSInWcoT27dh?=
 =?us-ascii?Q?ZfVBCFZgXTLa8wxKIcbQqVe+RcB6skcOC53KFBNj3JOsDs22yTglgOFWjXL+?=
 =?us-ascii?Q?iv84YwNOK57bRHw7q76r/zwRNq1Oe60/Lc0JRWKTBO6qrzbCcK4nbbyRWw04?=
 =?us-ascii?Q?UXX+mAAkqln2kjqjrb8ZxKgpCCQkOk4wK18wx30/rJV5SvDK2qGfpF3HD/oS?=
 =?us-ascii?Q?TrdWB348m2V/plXlOSGDaQM3aKsrVzODxGH8qd8RxXFc9f6M8WJN/c38Epuw?=
 =?us-ascii?Q?BVTlkGnZbkzYwz0VAg9UNDF13ufw73s9roHyJsDte/aHIzXYO+kJCXG4TQUX?=
 =?us-ascii?Q?TS1m4Is5rYyLXmcLF7DhWDSsUU6MEQhxwW0YU4rEWt3aTrAZUvbO3JRCRnWU?=
 =?us-ascii?Q?IQOU6J4Rk+fj2BUj7IkDrfxX8Y6POtGxYS57GOXcVNZc5A6miytBa0B/Vr7k?=
 =?us-ascii?Q?YSpmHRR8dgyK3lgNjXIo7/8mVau7TiacMXwphOJjF7TSOCI61WtGcECObNYR?=
 =?us-ascii?Q?PE9r44LufBZcgMOuJ/aMze4WKatMcBC2w1xEBZUQrnvCVXn3laV29Z2+i6h0?=
 =?us-ascii?Q?yQeghuSmXjQfWw2hkP+iC1kv/fAH7ixh8M3b0/NIZFRyvBPWg3eyPdns9ueX?=
 =?us-ascii?Q?QZdN05ZMyTEgskY8mZsYgfRY+MfPGMP3EcIxRplOmN5f+0JiA7l96Rxeac6y?=
 =?us-ascii?Q?6fu1eHdtLgW1YwP9KI2GCc/btJyNE3nz2hKpfHwuN1brcLNNHDEbFrIZW4kK?=
 =?us-ascii?Q?/MredomqQw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4498ab00-f662-4c6a-51dd-08df33314748
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:18:05.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Scu2GAfQh69sWJsUyXNIv4vTWInsQcJXzvK5pCcNX2ls6F7dduT4Q06ynoNs+ttmUx7tQxxHRElNIt5mmzs0EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989640
X-purgate-ID: tlsNG-c201ff/1792999090-732B32A1-001E9F28/0/0
X-purgate-type: clean
X-purgate-size: 2120
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

This series fixes several bugs found while running nested VMX guests
(L1 Xen running an L2 guest) on top of Xen:

 - Patch 1: stop leaking L0's widened access bits into the EPT violation
   exit qualification reflected to L1.
 - Patch 2: implement the missing nhvm_hap_walk_L1_p2m2 hook on VMX; the
   NULL hook causes a #UD and host panic when L0 emulates an L2 access.
 - Patch 3: emulate L2 accesses that hit the APIC-access dummy page
   against L1's vLAPIC instead of mapping the page directly.
 - Patch 4: reflect EPT holes hit during L2 emulation to L1 as EPT
   violations rather than injecting a bogus #PF into L2.
 - Patch 5: load L2's EFER on VM entry and restore L1's on VM exit, so
   L2 neither sees L0's LME nor fails VM entry with invalid guest state.
 - Patch 6: invalidate EPT caches after flushing a nested p2m, to avoid
   L2 walking stale paging-structure caches into freed pages.
 - Patch 7: retry a nested page fault if the np2m changes while L1/L0
   p2m are being walked without the np2m lock held.
 - Patch 8: fix several nested VPID problems.

Chunjie Zhu (8):
  x86/nestedvmx: Preserve hardware access bits in reflected EPT
    violations
  x86/nestedvmx: Implement nhvm_hap_walk_L1_p2m2
  x86/nestedvmx: Emulate L2 accesses to L1's LAPIC page
  x86/nestedvmx: Reflect EPT holes hit during L2 emulation to L1
  x86/nestedvmx: Load L2's EFER on VM entry and restore L1's on VM exit
  x86/p2m: invalidate EPT caches after flushing a nested p2m
  x86/nestedhap: Retry nested page fault if the np2m changes during walk
  x86/vmx: Fix nested VPID handling

 xen/arch/x86/hvm/hvm.c                  |   6 ++
 xen/arch/x86/hvm/vmx/vmx.c              |   5 +-
 xen/arch/x86/hvm/vmx/vvmx.c             | 110 ++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h |  11 ++-
 xen/arch/x86/mm/hap/nested_ept.c        |  19 ++--
 xen/arch/x86/mm/hap/nested_hap.c        |  52 ++++++++++-
 xen/arch/x86/mm/p2m.c                   |  17 +++-
 7 files changed, 200 insertions(+), 20 deletions(-)

-- 
2.34.1


