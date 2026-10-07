Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C99CA600A
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:11:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442653.1660200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEW6v-0006z3-4L; Wed, 07 Oct 2026 18:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442653.1660200; Wed, 07 Oct 2026 18:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEW6v-0006yw-0y; Wed, 07 Oct 2026 18:11:25 +0000
Received: by outflank-mailman (input) for mailman id 1442653;
 Wed, 07 Oct 2026 18:11:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xEW6t-0006tM-LD
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:11:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEW6t-0012q7-1N
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:11:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ac68b33-2eae-0a2a0a5409dd-0a2a4505d320-28
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:11:23 +0200
Received: from [52.101.83.103]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ac68b4a-4cb1-0a2a45050019-346553671815-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:11:22 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAWPR03MB9788.eurprd03.prod.outlook.com
 (2603:10a6:102:2ef::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 18:11:19 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 18:11:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxUoUOMPREnxu2BL0e4HlLcJUeAbNFQW5U6skpwzzI8xzOpsS3U27SOl1O4fHwRFvwNHjkC1AJ2OYusyZlXX1NEoOk+fSgaIbf7WnG1PsbEMYs5NwHOTc3zQ5VRa1B6WevvGsTCifvdMcrV2VGDhw+zFbNYk1nPuopJpAcsRr9Q8yO+gYdJ7PtCmkRzYzZQbuXxFYpya7znBTgmEH0E1XdpzOXIr/SI+a5IW2lqPDeBozF3eSZFYd9484ohSyHvFZFpbOTblv59/jEHWlJ5BPYMEl/xigPbpOMO7PC9iWgxp4zcY5RtoSwo/nPt9aJRSyFpVAPQ1bIWPKQkn0p3UNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT7c5Zm4QjQGT2duyBnbTwAOk8VXrr8iH57eJmZ0978=;
 b=SS0KjzNGqwVMlxizri/1vONlm9qur7XZ/Kj5IKEwHVljxeZlxYkG3D1ftF+TvSS1+hYanfu19Y5uhE5837/NypMnE3nGbR8T/9Ysr8kk9ZRRa1EqZjWB8sATfTJYhwO0OUTXdQE1SpxSdjgXyeQNvT61/cK2326pwznllUanO6ouzuT74XCGVIxq/HHNU8SlTJkO08tQA03JgUcqHbSFSeQDhIgz9UlKHYA1jboMQc1ZIT2xKbjXu+ObZxkar022png2nFkWEs9dxBu5LJ09mzJBICyGDBMeg8IKwi3yadaQbF2LgQciBZmMoq9uoaVHy2LJ35VkQq1L76nWvaaQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vT7c5Zm4QjQGT2duyBnbTwAOk8VXrr8iH57eJmZ0978=;
 b=UURqZKwFwo32gCOBiTrd+B7tsDGDSGcvIa63UguNeojAY8AOzU557nUJpwKemMCcrn2UGM2mqNM1nvtOWsYLDFJU5jtc25+RKhnM+xNQEsnroQ8Zya+uDN1NVbXYwhaqmQb1jwoM0KLNU7Xsm06CN9BIm97kDErWt2iVV0hp1dHjqwvugAW1eJ5cs0r7luOqvAC0Noe2/s9MJ32rhiUfAkO08NuFvf8s16j8qWBU2xlBkE1jLl+dWD76ux1gru6knQp+vdZNxti2Y5nV9EwgXzIcRbhqjv5IJZd8+cjQSAC35WZ3KdHUOZdFP9uwvlmn7dIyZC0ARMBSByO1Ef6FsQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] tools/symbols: leave room for the type byte and NUL when expanding tokens
Date: Wed,  7 Oct 2026 21:11:03 +0300
Message-ID: <07789bb485f6120e82bc5dc8253ab45056af1004.1791384310.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1791384310.git.mykola_kvach@epam.com>
References: <cover.1791384310.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B8B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63c) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc59912-1f33-48b7-160d-08df249e6309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ivIif4qv+v5/t01lAR2HnPQdOjHfXEw2f0cGXUX9zdSB17xA/xUJDAl57ebipd5XpDKNij3d2LDh0WF1IekpGtZnrYlXE5gphCi4aYQkg4YmOa3J1RdAoHfviIs7xtBMOA+SOuhveeyEFBN2Vo30yrjcq/644iBO4Z7HlHyhUFXAY5+DIOo8MSgd23DgW+g0QZ8cUJRl66dHBJsz5WDugzJe+eheD7jSbT8N0DwYN00xym5MZJDaQT1Ndp1qh5HWSlC+vKzm81noxzjjDvkr7hxmA6/utftM1T9CHmjBE1NpNJOvEHMOxLBDKB0B05N3x3/r8z5u8Y556Kp1R4wbonnq3RD4+ITj06EbeLkKQ9xOHx4Bss+gZBTkET5tDKH3OpNFYqvMU9G95Ebah4JLw1GZQ+5qbsFbxT3bkVK6dafny4kJOFb0uR9uokXTq7ua3aOaKXlrkVH98R7E0zynKM7levCu+ierb14M6KxMS+QFkhlBjrvzaq9mrSOQ37tTaq+yblBLsaCtKF9YT9BLMUc11vNL9WBNziSAf55iNem+p0/HRI3pbusxDWPODNx0UYT7OvUvxUY2/Se8Z7L3zan70LSlinaj4pEMAurJ8QgVWg5UIRqzVB5M8hFVQSNY1EbjK0TKANuPxdSwQ+YjdNPoiUqo7LeUlZAQPs7e42w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uaB7QEbWhfPs6ILWeDW4F4ZFfm0sQ5TTBIR66rtUY439cVJIsOtS+U9ITls3?=
 =?us-ascii?Q?HfOwwobIHOwQHt+OujrhIQ2OXNWVOwe4tvtbmdfBNwgUk07eG1J77GDRLbA+?=
 =?us-ascii?Q?9sfDipm8ZN8ZFRo42sH0hsAlOjoOnTxJWTq6lUa+CKYABNDub8b9G+zAVYhu?=
 =?us-ascii?Q?iTIOrlnp4JwOYEULLy9v796LfHiiLqX503cnr2GwpIoPNm1kyh0/6Q+eJMfh?=
 =?us-ascii?Q?W+XJ5UbHGsAwBrJPF5MRAia0POEiwzCP7NSMmz2PhNp4VqJJw6yHj2uw1IDC?=
 =?us-ascii?Q?8wwmPjrVs2NqTKVQ3pDWw590xpl1boXcU6/4oqS8bs9RBe0GS1BlMc2isOVX?=
 =?us-ascii?Q?pkFfICV2bSrZpK9r2GGu8yO9f6DkDaXY9q4/GkvTYi/Ktx185oX2xdO6z8mt?=
 =?us-ascii?Q?FyuaniUvzxlGjogNSabdRiZ8MIj1ohB1SiBBRmWGRGrb2DF7o3Lcd5XUSW16?=
 =?us-ascii?Q?4yT+Q2MVoP8+vnH1dF3Ldawz8PyRLqLJIpQJFGcE0kTr1O1XQgaqf9pvSrZ6?=
 =?us-ascii?Q?EGCOZ4mUNILcsnJV8M54uamVRNxXXQM5KM5td3Olj4+gIUZYspZ18hhA2Svs?=
 =?us-ascii?Q?npw1JpRn9a/VT0KtEYQkbA3KdkbSGpfvTnHTTKt7gAiriETFiEa/ZrR1V6XL?=
 =?us-ascii?Q?HSe9qM3qPs9Yv5wBz1KiVio6JZ6Bz7UPrL2IYoZFejbGBwJ0gfHApBafKMvx?=
 =?us-ascii?Q?NFyLXALwlOHeeWEvlaP7judUDmzGLsoAiKEt3uLihkSxe/1wJRKNKk9Hf/6b?=
 =?us-ascii?Q?5UzS5pxQxE22xrmQVIO0+gCm5l5qUBuff8oMNlXtmaWgAqfkkk2yjEY/VQp+?=
 =?us-ascii?Q?AXmAyANgdlh/8UiGDTxqaba0CHG61fXGo6WoRMS8ArGdNi9GunyU4dVwDKlk?=
 =?us-ascii?Q?MzMVa5BpZEJ1n7dlq0A2ZaxljBsFE+EUbnDlM+OTmpeN2JG7drkshI3HGIZE?=
 =?us-ascii?Q?Ut4ZSBHRIo70YYxo2ZB03D9y2XpaemLBra5zf+lFt1FtjVTyBypGfWxjtMYc?=
 =?us-ascii?Q?a6VhWT36RpJROSUjrwm7KgAKZ5nFOL3HRr9tgwKFyvFk8qWm5+/T1EQmcnng?=
 =?us-ascii?Q?AaHfrtJ5hhGkrGmXS3oXUI89ANPmmlkqIiMelUgFXA/njOuLdwIWBSNOZM0i?=
 =?us-ascii?Q?h1NuwyQSeAG+j/FN10UghL1DOoT5CK/EHon8/ZgBL1GU1y46dL7PfhQydxtq?=
 =?us-ascii?Q?iJODkHAuyt0jt6sUgX8JRz6CCGV8CDA7aMwXcLqx5EBkQu5VzQVfZdiz7BaX?=
 =?us-ascii?Q?RsPlLAqMcA2xi870Z84mOmswoUJfSF6byQqUIrn9Vmzu+wi+n0o3ICpnNIqb?=
 =?us-ascii?Q?ysC+NTaT2z3jK+lJAxtxUilVk1DGkfoftBMXenNTNSeSiz9D3CKbiVULjIMq?=
 =?us-ascii?Q?lCLD0n9tKBmT5QDSmDsAPjm8zb3RdqLKCrlOpu6BmzVGQ6Q7MgowhmVOxwT+?=
 =?us-ascii?Q?qDe05iTWX9QCxIjq13NSIpyjwEXij7DW5AnmvsLLWUpzTCq9iKdEX7IQe6t5?=
 =?us-ascii?Q?fCWsWCYnZNrJNfhHgRB9HkygiZ+D8/yoRv0dQopo8WGzYv49im/ENoKZhnKP?=
 =?us-ascii?Q?SaTBwOfclZxE73hsu30yhxWTniiPGmHEksOXbZSh5vO1gCA2ymYTPiFhIONi?=
 =?us-ascii?Q?d3UbS+XVtzGmf6lYOolxHBnXsjbf5wqW2eEfloPZ9Apg8oFMypQYUs2u0pgu?=
 =?us-ascii?Q?pPeXZEAjODtfeAl7/cWPyeVXHIZnNfyBCRN93TaZWz8Pfr7WJrCI3AYEfpXQ?=
 =?us-ascii?Q?pPPqFVszEw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc59912-1f33-48b7-160d-08df249e6309
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:11:19.5602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/0IUk6K//J5WX+xMiO3YfQX67aDast6Pcy5s2Wg20O+UB2I60TcKHHQEPCsOjjr6J8NnXzDUesDlK8LksW0bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
X-purgate-ID: tlsNG-c201ff/1791396682-71AAF2A1-652E232A/0/0
X-purgate-type: clean
X-purgate-size: 2302

Symbol records in the compressed stream are stored as [type][name]: the
symbol type byte is part of the compressed data ("include the type field
in the symbol name, so that it gets compressed together"). A compression
token can therefore expand to a full record, i.e. the type byte followed
by an entire legal 127-byte name: 1 + 127 = 128 bytes.

write_src() expands every token into a local buffer to emit the token
dictionary, and expand_symbol() appends a terminating NUL to the result.
The buffer was char buf[KSYM_NAME_LEN + 1] (128 bytes) -- room for the
type and name, but not for the NUL. A token covering a full record
overruns it by one byte.

Allocate KSYM_NAME_LEN + 2 bytes, so the buffer holds type + name + NUL
(1 + 127 + 1 = 129 bytes). The previous patch limits names to
KSYM_NAME_LEN bytes, so no token can be longer than this.

This is a host generator overflow that occurs even when every symbol
name satisfies the runtime limit. It needs a token that covers a whole
record, which only happens with a very small symbol table. Real symbol
tables do not trigger it, and Xen itself is not affected.

A host reproducer supplies 64 identical 127-byte names of type T at
successive addresses. The original generator reports:

  SUMMARY: AddressSanitizer: stack-buffer-overflow xen/tools/symbols.c:307 in expand_symbol

The overflowing object is reported as:

  [1184, 1312) 'buf' (line 341) <== Memory access at offset 1312 overflows this variable

The fixed generator processes the same input successfully under
ASan/UBSan with no diagnostics.

Assisted-by: Codex:GPT-6.1
Assisted-by: Copilot:claude-sonnet-5.5 # host and x86 build tests
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/tools/symbols.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/tools/symbols.c b/xen/tools/symbols.c
index e15273a8ad..f6319d6259 100644
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -338,7 +338,8 @@ static void write_src(void)
 	unsigned int i, k, off, ends;
 	unsigned int best_idx[256];
 	unsigned int *markers;
-	char buf[KSYM_NAME_LEN+1];
+	/* Type byte, longest name and terminating NUL. */
+	char buf[KSYM_NAME_LEN + 2];
 
 	if (map_only) {
 		for (i = 0; i < table_cnt; i++)
-- 
2.53.0


