Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357BF606A32E
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=xV78Ts1W
Received: from list by lists.xenproject.org with outflank-mailman.1480957.1684733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhfi-0003OI-3B; Tue, 10 Nov 2026 08:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480957.1684733; Tue, 10 Nov 2026 08:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhfi-0003OB-0d; Tue, 10 Nov 2026 08:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1480957;
 Tue, 10 Nov 2026 08:57:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xQhfg-0003O5-Ou
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:57:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhfb-00GiLK-4u
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:57:40 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af2dc6e-e002-0a2a0a5209dd-0a2a4501e106-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:57:35 +0100
Received: from [52.101.193.12]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af2dc7d-5984-0a2a45010019-3465c10c9c29-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:57:34 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by SJ0PR03MB6421.namprd03.prod.outlook.com
 (2603:10b6:a03:398::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 08:57:31 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 08:57:30 +0000
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
 b=UA6sf4nmSn6EB0DgT3kDcvbtKDv3C/Fx0XI2ogIMQq1vOS7DgIRdU0aNCxdSQJhLUJSF81EdHSPFFRVV1kyPHskvK3licYtgpuk9tGXAtzlfYwnfdvWQ4rOSYPjwXQi77ZdqE5oqyb3wapryndOZsDuAxUFbfUcJbZQc/MGMJFtgVBszgzfh6GHJKOFXAbnx1brl9sIuej1eSU1TgIxgTbq4qmEx3NETJycpoXRISI9ec2TyNdRqvkWImvH7FVBAPUuZp3F10eklQgf9g32tUcQf+B006R40O0GKEAqI6XfLKmfHgEmxh7nfVV+uYJ3K9IjhMnmkp+fN3xpTVRzVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMtK0X0bIaM1TGTZGInrJiUVBhpSRuIuK9DAWB9rtSc=;
 b=TlMrfKkcoL82zDuC1JqJCU4+AsWoDTtcNatmyvFuHlxga2+sLkDm9F7SIQUT0MuO961vUy3LWBHDSe8/JAnm66qPVRt5mo4xTlHYL71B0+KbydwQzwDmOofaIZgePpWrPl9dRG4hSUs4TO8QjuF0yxkBxlHlootvIUC2cJS5dHIA5WZ5+KDqjOBA9n/bLQhEPFTU+fFAwGvcWsNDMRgLFBFhKRFPzJC0Ji2fWVIzEM3ylVovdDFI8cgb8FD2n2wBP9PArmBccTGZV9hFRKqmkYqrqhBH5RzyNSv4hwXOhz2Wr08qfgw5IFFyA5qRfhsKF+mglwR1P2IfMxf1snMkcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMtK0X0bIaM1TGTZGInrJiUVBhpSRuIuK9DAWB9rtSc=;
 b=xV78Ts1WVjxVU2dhoYaJBLP7WHlu+ig1LEoLQyNOx3T0PN1vcSmFJj7jUFbXTl8Z7U2fg/larFBZX1zAkQRddTNukhQ6EGgMGeG0AroyZ6yAki/LVd+gN/z18JjPnavH8N4xDLneKxIRMyD6fCf4FHJhtESPHQuFKGaYuZtAohw=
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
Subject: [PATCH v2 0/2] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING
Date: Tue, 10 Nov 2026 16:57:19 +0800
Message-Id: <20261110085721.419366-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016100058.268266-1-chunjie.zhu@citrix.com>
References: <20261016100058.268266-1-chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|SJ0PR03MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aade15f-90ab-47c8-0e1e-08df3f08a6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|5023799004|11063799006|22082099003|18002099003|10067099003|261009223027099003|261102123227099003|261026121527099003|261021123027099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	qDv9p2LS75mUHODlFcGu7eDYi+8pUWJ4lm3TciMg/F3Ji7PBHhsb4JWCw6M2mfT8iRQvc3Ct+wz5MjwZpfhuPJNN9PbbjDpzXHP90twCZffhbe9IG1xppLDYr2yMqPtItIrnRZhj3/MzkbfqpO+siNNIt1O+UYZ22HNMesY0uqTxToAL5rh7SlxN3IlwUERK2VKBwZlNwNvSGHg/RLPFtGImXxD1cUglILALz29DLPLvfhO0qccJCOe7eBGP4pa/zCUcyn7qZJwD5SfrmOr8t5w8H14gwrVCGD1DxJapKlhViN1rNgOaNSDWgFJOBFGvRYewIWgktuxNwjdh0LBOFSgD21vS2EekSVL99nrYCQnWbwIHX+gJ5A5vQdHQYO7NL5KJ01rFWxTTW4ZMHJQ0l7HQvYhY/sYJfvks6La6BMwE3euTzKduSZLr51mGW/61U7GnaHGXCk0i/j8DK6LKmq2m3roWzVmCp5FR0tAzztgWm7aAEBrJvicUu5tIb3KzYwvOQLkizdg2v91fUcn6wwdl/mvZrOfzz3sTOGEi/eLuEMgpVdJw5ToH8q4dj4xoJRzfAYxUPeBAPvj+IQZfR1hptpx6LwjRPzSgCFcb2Ayv6tFJSZ9H6ElYul6VHV0hc822jcdZlAzuGZ3tOgouXO3YFMZKQaF10JtMt4qZ2Ts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(10067099003)(261009223027099003)(261102123227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ysz689mhmB8GygVCF51eIfLGAU0so71OuQLRuYBQ7kD6hK0ujKL/mrxC1is?=
 =?us-ascii?Q?evMJ/RlQm4lL9A6ZYmRu4g/AedcRLZViCAbN4bZ8sh84oPJ+5xjezYdM76RI?=
 =?us-ascii?Q?mLuENbfPjDRABcybSBZbXASViH2oHCj+zN+NAU6iVd//Fl593s5RKz5q+apA?=
 =?us-ascii?Q?kiMb7QbD+Bfnn6NzEeYC1BWJFL6IDlZbuUXxBdhgoLuf/mKbiBFmyvLlprEE?=
 =?us-ascii?Q?9xe3yXTdUGdzOndzS/CIP4JyYovH8EjZFozH9L5jMoquwOLNEmuXszo/S2DL?=
 =?us-ascii?Q?mIQph/e1ffKmTIdpsN5LaRWXfXs2EU2xA9DRkMp6Wu1wPdRYv38XAnRHD5bb?=
 =?us-ascii?Q?tCOZVOcdvpVBJS6a3u7aUoQP3hPPpgAwpV1CyDXNL69QGAxiqhqx0GrX1Uco?=
 =?us-ascii?Q?MoqsxtNO9s3NWrWse9BqHcqHXpA0llZcSlwfatHpiTCODGg9njc8DP6MuSos?=
 =?us-ascii?Q?c8PtMuyv0JMrTT4nodfCkVr1EdVIcmAoP8i+GboRoU2PEkrw+u/NlgDfIqLq?=
 =?us-ascii?Q?bVUSpN+Jbj7nlGZHrb//BnzvbSkwKJH7/Y0hzkyE5M0ke1TtD8ptRcw0Pebp?=
 =?us-ascii?Q?kfbSqzTcimFY6ke4NVuUZDDPnOEdKMKHwlStrSjl8LF0COdqxQhHC2ejoCGh?=
 =?us-ascii?Q?5m3Z1j+T3gd3t1COR0NsBO7TC0OFZLDZUE9uyNyqKDB+p6hZf3JNYy6Y88gP?=
 =?us-ascii?Q?Yg5rcXw7Zfv9awj6G8zKihMC/BzyvF2pefuuYvWqNHLT8PYu0BM1rzujcWwh?=
 =?us-ascii?Q?es+pL9SHCI0GIaACgsihByS2V8oqAuMTjPq/erFvj9bf599QqkaWwfc+yaIR?=
 =?us-ascii?Q?ib4ahCwK7CYgUmwuyZcuZGwanNZyMkiTCkDIw6nc6zSOS4YjNfsP8xMjeZmE?=
 =?us-ascii?Q?Ep+RlftLVUWDEKAnswn3FfVk0LKfUS1eLNttpCir0dL7LUwyW9gTTzoTd1yM?=
 =?us-ascii?Q?PH4O+sO5ZEk09ZE6Qjxv6ssYYy6Ks/ov997lVpUHs7pJP6L8iYBL2D/cY9lI?=
 =?us-ascii?Q?Z8RLF+g8tm9BiCmf5B+bo1jxsRCtiRMeFOBuwVFvJ2c3o+AF8os1QqcpVcvL?=
 =?us-ascii?Q?SxEXaX5RNLn1GiE70i+QDYoM1Rrcv8r3jdXNmeRz72nr8dHpDWeb9i9yJV/3?=
 =?us-ascii?Q?X14iHzABZpBxEiboJzkOUd4VDWgNQYy8RtnUIyW/apx9lGXcw6QxVNzTkVZm?=
 =?us-ascii?Q?s6HyP1ufTSwY2gy93x0O/gVjxjgClnd001+buWvvdz7Gve1F4HlZzaj1yuOz?=
 =?us-ascii?Q?I8F5fs1VDEmf58BNrVyxnU+8rdtBRlMUl4TVW3FNBjAO1GbkNh9YzYjK3Il+?=
 =?us-ascii?Q?5X+8NWiDM8ReEhsiHkWG066BmjqsIneYzIzk5wNYG9MeOQDx4Zd7J9t5lryR?=
 =?us-ascii?Q?M7n4CjL55CYxqwIGTcGSpQ38uWdkUnJRPa07m96tBhisW+7cIUm/gKHetWkJ?=
 =?us-ascii?Q?Lc9jIKBuy/rJhy1d025nek8GSMS+cbAoq0yvQE1s+RS4GSKVeuPw9VnAY3on?=
 =?us-ascii?Q?xiPHMEERu8Uw8fPVfZkfkFoCgjkFPIqDoOu2G53BpC80M27hkHnVsYXURZ9F?=
 =?us-ascii?Q?HnzCFM/C3mglkM7ut9fSe2EL/nuM6k0fV1q3rLhBYBUuAhdmKReP5x7uyi+o?=
 =?us-ascii?Q?14IVlQF8jWbdrX9GYo2elCaaBxBsb94Yhlm4vVWlJQdmlEeQzCeHrxrWUqKO?=
 =?us-ascii?Q?95swp76Sqi4emO3ICSyfHjmGJ2BlxzM/HWnkosuPo2VetM9M1Fcsf8Xsmad3?=
 =?us-ascii?Q?RXLYRT3K9w=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aade15f-90ab-47c8-0e1e-08df3f08a6f3
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:57:30.6096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBB0ys33Uu0hKey8BR9IH/IV0Yr8NUawmeqE4fIm1D3KrevNUCjoQlLBfl75lAD24NSsGAtpI5vvq3XRIkHiQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6421
X-purgate-ID: tlsNG-d62444/1794301054-BF66C757-A8718C73/0/0
X-purgate-type: clean
X-purgate-size: 1261
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

With V_INTR_MASKING=0 in L1's VMCB, L2's EFLAGS.IF masks physical
interrupts, but L0 always runs L2 with V_INTR_MASKING set, so an
interrupt would exit to L0 and be forwarded to L1 even with L2's IF
clear.  Patch 2 fixes this in nsvm_intr_blocked().

As Ross pointed out, that check must not hold back NMI/#MC, and the
callers of nhvm_interrupt_blocked() already ignore the blocking reason,
which is wrong for NMI/#MC even with V_INTR_MASKING=1.  Patch 1 fixes
that first.

Changes in v2:
 * Move the check into nsvm_intr_blocked() instead of
   nestedsvm_vcpu_interrupt().
 * Add patch 1 to stop EFLAGS.IF from blocking NMI/#MC.
 * Report hvm_intblk_arch from nvmx_intr_blocked() for states that have
   nothing to do with RFLAGS.IF, so patch 1 doesn't affect VMX.

Chunjie Zhu (2):
  x86/hvm: don't let EFLAGS.IF block NMI/#MC due to nested state
  x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING

 xen/arch/x86/hvm/hvm.c             |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c   | 14 +++++++++++---
 xen/arch/x86/hvm/vmx/intr.c        |  6 +++---
 xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++--
 4 files changed, 25 insertions(+), 9 deletions(-)

-- 
2.34.1


