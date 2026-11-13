Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB3B606A890
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 18:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Hgamg8L7
Received: from list by lists.xenproject.org with outflank-mailman.1488181.1690333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRw0I-0003FQ-EH; Fri, 13 Nov 2026 18:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488181.1690333; Fri, 13 Nov 2026 18:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRw0I-0003FJ-BS; Fri, 13 Nov 2026 18:28:02 +0000
Received: by outflank-mailman (input) for mailman id 1488181;
 Fri, 13 Nov 2026 18:28:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xRw0H-0003Ez-Nq
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 18:28:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRw0H-006ECH-17
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 19:28:01 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af75679-bab6-0a2a0a5309dd-0a2a45059a54-30
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 19:28:00 +0100
Received: from [40.93.201.30]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af756af-4cb1-0a2a45050019-285dc91e5613-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 19:28:00 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7586.namprd03.prod.outlook.com (2603:10b6:408:286::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 13 Nov
 2026 17:24:54 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 17:24:54 +0000
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
 b=GpKWaBv6CbMdpRVxHduudZuYHnH8sXuNrdll1JagYXIocaRzlPVkaHpzH3QBFEtw5DgfR3FCZJmvzDDFWdduqUgErdLjqXXdMb5diJGtju4F69CKrmg6tuPMfdst7ShMaVgn3t51olHqF5d3A9f74iotJhLA7ZwlQ9U1SXNeDI3KEcumaRp9XVmO5HKcBDWD5aC7gx2T3yUqVLMmdYDOi0vGxXC4bYAqNt6+yuk0uPVXusaSBpLDdGkpMcQTnYjF3KydkCE8p6bcfPGHO4UCULaK4AIuUIfHhKUCE6A8RRBuU37e2UQmhmk48gn3sAgpB0gr7pfdlCWEmvXnGFVQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujUoh3DTPndiwqg8qLuRPQyAvO/J67PQolpsbCicH4E=;
 b=lYpKb6gNEWO92u1IxrOVtzVITyF3a1ZT08CJBP1nmGL+1TXm1+ogEj7KO+yC/t7hb9UrssDdtPcyxMgeR8b7NXfLh8C9Dapu0ZdQxjeCsdEGcRGGZAAPG0qOg5vWNFyDeD8G+Gzjg4Z4Jdw+/FmCM/aJl9puEfGKZN+EsUGzk1QvQYxzdp4nTlVZJYo0reTIJUCxZGfExZU/guUMSq9PofZf7HQ6g/cYhZWpEi/a+AtOGAucg7iL4uo0RtK32MBVXALiEog1Uf3VHaOaq/449ZigqkRuX61xhzG22dGscd+0otdHbEFMXZrwcBbRPFL6jD2hamXr3WT2or4iy5kwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujUoh3DTPndiwqg8qLuRPQyAvO/J67PQolpsbCicH4E=;
 b=Hgamg8L7nffpg/V0zXwtFqFPjIa1jZP8x0wmRCxlzZiHDF2Yu71JCnSAEqA65si0eMyTvl7PujinW5+qCZXJl04s7d+Qc1zjbda+JTXDBQvp8wILu9r3WGld+lzPbadZ8LCnK+ELuNFGnXaavhMCbucutCUxapcVDYzG/+E3f+E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] nestedsvm: Don't set CR2 while injecting VMEXIT_EXCEPTION_PF
Date: Fri, 13 Nov 2026 17:24:44 +0000
Message-ID: <20261113172444.720081-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0202.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::9) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: a3129b0d-69c0-4783-09ec-08df41ab0858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261026121527099003|261009223027099003|261028144727099003|261021123027099003|261022105027099003|11063799006|261026140227099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	hxWmhuqof40iHSaJMWCm6BW/f3fLzpQ31uht+fnsukl3Yx2i+upNzKLfljSwOyIsFvW5VeiAAqJASNQpRHczYOS4bTXlxdZqZiRXYALhHyi5YIqBe/7/BBuiiiQfotMg8AU/IX9KQEOg0QejphYAP3a7WWiEu3a3ZjrKKdoZzRLxWubS3SAqFsTgtXU1IaeGx55JJYQG+NcpX0ej5/QdnMHQUtyD+q90ufLwjrz+wCqHckcfUm/eXHZ9BR3YgQ/A9Lxvc/g6bI1rpxdYQE7yPXXRq22YzOzddLCzt8Hk9Ch3+IXrKqly7vFyi+l4TiGQ0aK336/0QqH5rL4KMvfcafSTP1DseW12XuwjPt+S8FSdzQ36ofbOe3VtzPFZyaG3yEZHudM0FMpYisUoQfx3BDaQgUR4ECb0ksC/icVGV6mw09frAFIyH1zte+3LDY25uDR6f1M0KJmSZ0KNfjqd5YoHtCkDmzqA5ZPcs+GK5h3QbBEhh0PPWe73jqhp7GLVlDaDGX0IwYV6Y+yPpPMdqaDM+ahP6OOm8SOUckrCoUbTsf+E/H0xkmkZ0CRMAqR13CtrsncYd+fXOCflsO4siCDut0GxLnW3KBXRCTm5SU0FMabwQfzwXADjvi/K+1FykZb+YG+kErIB4BedKHSBfiyrK0o3cxDashOD5N6iQzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261026121527099003)(261009223027099003)(261028144727099003)(261021123027099003)(261022105027099003)(11063799006)(261026140227099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8G2MDqARK/uStZgUQgXcj81b7yS02GHfoMVaS4rI++zSyL2kabfp/XDqAsVC?=
 =?us-ascii?Q?fqKY8xbCA0kqktJBzyGitTFerYiT7h42FCVkH5p0HLiO3+s+E6MUNLTcqhr2?=
 =?us-ascii?Q?dIFE5FGvBcnGwWNk0RM6/tFRU2YEi4CkcmUFVynJ3G4hu4/mwYD5ikILuoR5?=
 =?us-ascii?Q?5+GOPOz85Oi7UkfDzG9CYoF7Q5vb7WH1HxsqQ7ami6IE1xz5dC135LyciSO5?=
 =?us-ascii?Q?iSeAyTcV+vDcTCas2NOWdX95T2iyI2S7UxWmZ9GKKTlIlsOpot4nte0d1sMn?=
 =?us-ascii?Q?H25iFzS2/D1nGdj2c5x0YPUwEqKpf07F8GWfZw1yVMg0un3V2e1X8fs5LVkC?=
 =?us-ascii?Q?lHW0rSm8abi8GKoS73RmK9jNH8O9U7hSerDkpVsQPiBSzGsejXiLPv/xzkCa?=
 =?us-ascii?Q?maQAO0Eh4mwqGSqFVByJvMO0RnslRtWLDa2oyHUGWxFa1cT/sjpbs0YgB2pr?=
 =?us-ascii?Q?hnrjRt4GtW46UIE9lQ5YQs8qu2kf76kC38Zb4wHW5oPYr4Vv5y+/sNYxYL75?=
 =?us-ascii?Q?H8e/3He1P2tipSMC2xE+pa6Ew+t9dVxLQsbGaJxLDbDXNgto9X8gxYWVCy2n?=
 =?us-ascii?Q?S5uYPPQKbIbqa/tbvmXTpFCesiwDEv0cwWhpuGQKcfWdnArs/+tSsclwjY2x?=
 =?us-ascii?Q?o0eEcR177TJFZ3TJBrZwt+LvdbKrxrnIz5d7tJYMSmpGsDwVBaJojQ8wA0Y/?=
 =?us-ascii?Q?QcjC1T6ldckCyUhiAGqd/qnqRFFR6Uon/3KfuMK5XQxLnFZzRmuvuEMPUQ6D?=
 =?us-ascii?Q?DjP2tcpAjqvWAGWf66O1RiIP7ZcZy45jEqhD1rchj877+hiBUEqVkQq62Yjh?=
 =?us-ascii?Q?3JG9xLeSlv68F9r9KURHriFHaVcss0OvQHVv0KODpFXHy3UqhX1iG4h9zEUl?=
 =?us-ascii?Q?oT9tJ7Y+HC4djWB8L/pII8Y9lFxljO2swE6ZotSd0RuL5IyvEw1sZMXHx8Y9?=
 =?us-ascii?Q?EuHBvPH6WtEtBCeV5yiV5B4A9A2Yh5LIref8Niqvmt8fMX3dzC7Cwvdl4liN?=
 =?us-ascii?Q?T6rinmUroceBUZCUPzyYG4ZE8WqpIWc0Nf5+3GrfCcMi+w4bJjlMWLh4YwwY?=
 =?us-ascii?Q?J9WuwTno0jgyPU5SzZF8+AUyVUoWJdq7RLcWH58jQ90YzHurnGqfdLLDuyfX?=
 =?us-ascii?Q?ufXaezNZ8pe2HJefG5AW0cNvldUiorPZEJ4RmBcygz6eAKejocrPQVI1CPKa?=
 =?us-ascii?Q?2ODbfzLY7KGYNV9/kNsKZsl8ihc0yfFq9PFtw4fTqjQR1eg/AyaNKmBZSCg4?=
 =?us-ascii?Q?gbv2BNOtXDJ1cA8n1KRhx2tqqNeAbTLqbOuXVVJb6EPeWycLvr9ieHOsHZmc?=
 =?us-ascii?Q?jYTwSZCOP9blQpP4RlDPFoFIiXClnWx/pSCganBF3XAKt66N1lVZNOlNnIkV?=
 =?us-ascii?Q?mqCTscIVgdY0dVi0Ahe6+zQg5Fq32qrIGdJpEVBedxuc4tpNb+/ilijjz+jQ?=
 =?us-ascii?Q?YcSsTF09A4qEoYfMR+/Ydj0ceF0sNQ+Na7+BfnC4/9h7vWXj+mi82nihNazf?=
 =?us-ascii?Q?FlErPZ9sM2N/XAppa96wUckYiBRIHrAuvnh0xh7fabfg03BM7I7BFtjVSkfO?=
 =?us-ascii?Q?mvDYcP2YYZEXDtFSo8AhDp1ZyEIqtjONZaW3vZlkqor4AlkvIu/kJ5vOtjGz?=
 =?us-ascii?Q?cZOPvyr1K1gfIYZ/Lh7o5izaodARJRtZcd4hQVrRhljMy4LZSWwmp3owKgOC?=
 =?us-ascii?Q?ReFWfRzJmVBZ73tvFRSWml3jk/lH967SC7qp7H3y/veHAjtTwnc7yUPW7y+r?=
 =?us-ascii?Q?4/MKEOhUSYlXEEUI6URlwwZQuFm5/jo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3129b0d-69c0-4783-09ec-08df41ab0858
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 17:24:54.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpE34XFYbQlGrO8nEFM6wp30dZFuIYkav5IvDSep6csGXSGLvqkDHyB17rcqH3itiFF2EWamxCV6h12VIrLtEyZcbm3YfSoTxze4l+zTy2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7586
X-purgate-ID: tlsNG-c201ff/1794594480-F7CB82A1-2D2FDB57/0/0
X-purgate-type: clean
X-purgate-size: 1035
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

According to the APM, the #PF intercept is tested before CR2 is written
so don't write CR2 while injecting VMEXIT_EXCEPTION_PF into L1.
The faulting address is available to L1 in EXITINFO2.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 81cae929dd05..366178ff54a7 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -741,8 +741,6 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
                 ns_vmcb->exit_int_info = ns_vmcb->event_inj;
             break;
         case VMEXIT_EXCEPTION_PF:
-            ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;
-            fallthrough;
         case VMEXIT_NPF:
             ns_vmcb->exitinfo2 = svm->ns_vmexit.exitinfo2;
             fallthrough;
-- 
2.56.0


