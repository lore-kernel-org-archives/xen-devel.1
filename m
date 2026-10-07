Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38291CA6007
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:11:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442652.1660192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEW6s-0006jh-R9; Wed, 07 Oct 2026 18:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442652.1660192; Wed, 07 Oct 2026 18:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEW6s-0006ja-MI; Wed, 07 Oct 2026 18:11:22 +0000
Received: by outflank-mailman (input) for mailman id 1442652;
 Wed, 07 Oct 2026 18:11:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xEW6q-0006Wm-TI
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:11:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEW6q-0012q7-AB
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:11:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ac68b33-2eae-0a2a0a5409dd-0a2a4505d320-26
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:11:20 +0200
Received: from [52.101.65.72]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ac68b47-4cb1-0a2a45050019-34654148161e-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:11:20 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAWPR03MB9788.eurprd03.prod.outlook.com
 (2603:10a6:102:2ef::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 18:11:18 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 18:11:18 +0000
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
 b=PbBfH6jY8/4fr0pyCcc5K9En9PqUd/eft9GL01ElB4JPDW2wCaAXL0gE5ajmeCoEo1TJ8d7zMKaoyzbbl3564gpFUqHCvMj4AJFMtxsxOxYDpi5CjJMm0VtYfph3A16HIX4UdgL7BLlwpd2RAMxWhN5YzRw37036uUqjnjLvaDYi32sOquDJpFUQOEBDq8HUfGxW3AVnOnkbbzfozc+Eg313oBEoiFQoX8PRyQPFs2MjCyBZGfKm0jZgzp3GHHOmP1dh+G8l8rPiFIdr6WDSQoU9RpBib7TM2Z1S0X3xklSdJMCXugf3JUEm2AdexsHU3XNwHtmqbXkYxNeTYNpLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJ/SWrGIpUv/PLRbu/p6/k51GXDlaNdmbUFmS03sfGo=;
 b=Ydnax2fSyFb6nhjX1leLzRUo666C7y3dYNw9gEJJE68kZLO63ly7FOjIn1RVo8VUX3rbzboHpS4v/AlIQh2kH1QUO5/wftJYmt0e0rA09piuJ8rs2fisLPRZoH8y81zUtUbYseWs1cyBC0VeXc00N4dZ0tGUaWXpZUs0zaRtHq4noe+lbEMdCjlnxEeyAo7sE5vPOc1CDfQ4vZ57qzFa70yG678085qYlI45jnPZvAl73FEVHbfiWexS0GnRjeKccj+mB9UgF9MKF3CLjozPuGuWtV6Tkwwf+Va2CKCWaax1g+TNrjjDuwA13hPAULB+mdRvs3Y+iPbSnVYg0ClzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJ/SWrGIpUv/PLRbu/p6/k51GXDlaNdmbUFmS03sfGo=;
 b=VmfoKegU41IM4HMFgvi082651Gtu0tu1+b1fbreGt6/HTo+qu8HgCnriw0Ge8br8tqcGToyQWA+fP83Jkftj6SszYvuCjFL1zHuxPLZmD1zf7b0TX/NNW3aVJ3sRqPpE15i/5KeQ/P9P2ga3c8BC3FC4wVaIvn1gztzQAwyyeRUzEsc/aEn4cwUPslbYLIhfYJLUJMkkzhP7sIn7AaRCSCbZX4VNG2wBF9krcQR4NzIcIU8Rxp78NaP//CAmWZN6AzU19ZoLUfyAHC5je2CWyVuejwcOaoW74NMgPl3OYSPZZqHE/TpYOAccK8xcAXSSOkkwtwGnPYQqA7XxQ5iKMw==
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
Subject: [PATCH 1/2] tools/symbols: reject names exceeding the runtime limit
Date: Wed,  7 Oct 2026 21:11:02 +0300
Message-ID: <f7d04bee801bf4a5d261451822b0e029e8e59291.1791384310.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4539ccd7-a4d8-4cb5-98f3-08df249e6223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hhaFBTVMKT5Lp9L+9BHKYekxkosV0arxSZWoZ3RbNq0I2ptWQkAmFJt3U00ka26gLDmpp3V+lJW+ghy2XDiFZz9D3AO8Eeb/BMWihOacv9eS4Ior14vI75hCRuEFLbLzbrMpcH/xcUrNxpDhFcgmZT3xgw65mdLxF9URWOezSaHcYIEEN0TmANdvnLAcC4UPtTYlkFmZcxQ6eCduLjHZ4YWeIaOpu5G9juJ8FDqzR5iY3tMtHW0akZI2d7FLbqBWTEB4SXbYNE+FcPNnH8eNwx3m7WtwN2DMsrXLGZoQFbp++H8TIv2eZmxDwqtSDbrIYomB+Kv6BE1JL0qpQoSOlbhj+/PL+xtF4fLUpKN//7wSUfsDLEpMkVWb+QpQ7YFpX539dLNgsUH+zW8GDT8sIPVV5UnIzz0WlWnZHD5mR8l1o7zFLeFVMTIJimjxZQwyr7pb98uRzD6V+krK/BVSV1jd+B/5lo6OYzelC9duLSN5pXxh5YqMY7YYMLK4ZBjk+Ev4vNDgbJUl1ZBzTriAj94mG76Ay3pDY+NB7N+fdBuJ+HXgumzZQsE5wGpOwwXev/0pyT8/6sxnyW9OFuzZWZjCeJsRKoU3sBr8vPRW3ipb36+FcIIsoYiw31eXl9w4EWdnAYdRysdbuFzq+2vNYXw4Evo87JanhcJnj2nv2Tw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nHchEU1yBLCXcxysOgqLrWpGwKTBQXVe/F9cHMivU7mMTxm4ihuSh3XBuhZU?=
 =?us-ascii?Q?9SJxVMKLjpDV0xeHGtpaR7AUVwGRlzUusIOJu3HoL8vfI5nJjr8LRakcxCtB?=
 =?us-ascii?Q?XiOyLSyineDdrVUxHUdooWzXojSZ4a/r0Xhsr4Wzhlvv9Uzt/LAQFpBlzfjt?=
 =?us-ascii?Q?+iMkZyCjGAcOxtKtcDdCIA+GlJmYrwjuiqrtXpsIKa2bmB1MxalsbkWy0iH/?=
 =?us-ascii?Q?kerE26xW8FjdGeoJyRch8hQEzND9S3Kz7DztBNMsxUCrjEAqaVXFiSnhpeYG?=
 =?us-ascii?Q?4z8aa7GEAxM4UCI8VnEi25ySJil7u6giuaFlwOpfDM/AmJL1ewnwH25toeG+?=
 =?us-ascii?Q?UgW96taI2Rz1T4LzqpUct68NBAGMY8Z3csFU8oXXnbSRajteiNXrNZ1eL8gd?=
 =?us-ascii?Q?LryWPQek7cRkJxSWB6qDrgpQG2a4pJZQFygTI4UqYzMZ1s7QJDg3Re0gH4rK?=
 =?us-ascii?Q?kE5s2H1HbHznB4ueiVdJw56A4NHu/IHGlowLSMTxsVj6OAyEvBj1PHZBm9mt?=
 =?us-ascii?Q?zRe63YDHm6jSPx7+8g3dIEdTSUjmc17P7ipBv08tiKutx2sKQvfQFks40cQD?=
 =?us-ascii?Q?MHpy9lFEmoAQlulJ0ei2AAUhoJ1G0QctCBV5C375qJiqj2WN7xrujwLkRO90?=
 =?us-ascii?Q?vF0/MlQ5poqfUmKin7YRRnZXnnJI25hZ1BbaS6DsrHubVUH3uS+St+PcJ/99?=
 =?us-ascii?Q?BvNQQaFyKx6j82IPo9Udo8RNxHk9JY2jkYna09ATWs/ob65C6KfJ6iCM+6bF?=
 =?us-ascii?Q?O9AOI2Y9wc5ILBVVVp+2wFpjzUgNVMUJecMGqzp5EQgXSm09BxE5vB3vw+cq?=
 =?us-ascii?Q?TizRKA6IRrJvs4nwoz4y3Kc9KnCbn8mteEYHRh6Y6xLtHvIr7iSpXLOtDhuw?=
 =?us-ascii?Q?iz+tsLK7tYNr/RVk/lBnf4R5pmn8w4GLWrBlfnmf4HX9Pi9AxZB/ingyYygn?=
 =?us-ascii?Q?zJho02BdbGE4Va41QiPB7T71DfLsaqtG/06aI7JWmW4ngtwppUvOZWrOn8B7?=
 =?us-ascii?Q?HMGSzS3CswGMym8sQ+CB9v+egxHW7jwPLKrkq7x9Bk9CXPibJn6IHSR/sLUO?=
 =?us-ascii?Q?GnM+p+4xjtscgQXTUET3QCafT7wCYIrbOeq49dWBVHrdcEpQFA2xGtEw6Jbi?=
 =?us-ascii?Q?3nVFQ/E8shBw7q8n264uP7OjOykxaOcfI39fLU8s4i3+7OUgskCqgJUZ5+Zo?=
 =?us-ascii?Q?Hx7gUpvTiPUxcIlqVxdSyTEO8cB7rhjCv1L6qiiGG4aovRuWA/BfslI2Cgul?=
 =?us-ascii?Q?fIQMho+rh5R7V+MwH26pK1/Ot0ZIAoVqjQpgK34G5gTYATkiX1ZSYlEe8b03?=
 =?us-ascii?Q?4ujKjcrVJtyjl0P4VfgUYBwzq2jZIAlwb7g4BKTw06zt2i9AS9CmFdoUrOaX?=
 =?us-ascii?Q?Qkp80HV82DI5yxie0G7bHVQLk9a6I3sfAKMFU0eWqy4XtnMvAJElTjiIO+oE?=
 =?us-ascii?Q?rNAe/4/1iujslkq6L2eWvwHhatBLdfOmK5XfAjha+560/4lYJWClxSWeWEOF?=
 =?us-ascii?Q?MnZwK8dBZKtO7mHFlnCstjhl27aVfc/CZePMKa3SFylSVK+dqD4cx+VQd+iZ?=
 =?us-ascii?Q?p6q6yqXAaEpDvN1k+5ZVQ4c5ZKUlwpMgaaSGjhbAYUBB29r3k+CtvzqXXxgU?=
 =?us-ascii?Q?E7AWmuw15ORPHPMcSpAm3w3BLTAnd/+hosYNouPBUtUG8yBW/ZVomOFq/nj4?=
 =?us-ascii?Q?Vecdb3f4Mr3j+DPZX0GkQDTaajCHXxRw59xn9T86cuRzZb4cZlkN5Ompi+IR?=
 =?us-ascii?Q?u0M1dAGuOQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4539ccd7-a4d8-4cb5-98f3-08df249e6223
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:11:18.0565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXSbbOQLRxmo8g78XLRtr/5gY6OnFeT/u4s3D/tKGU9N3VBUCLO50YtJmesoGwGf4TiFQctd9aGLvskyx+GaMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
X-purgate-ID: tlsNG-c201ff/1791396680-F78BE2A1-C8F1633E/0/0
X-purgate-type: clean
X-purgate-size: 2507

The symbol generator accepts names longer than the runtime lookup
buffers, which hold KSYM_NAME_LEN + 1 bytes. SYSV input prefixes local
symbols with their filename, so an absolute assembly source path can
produce an oversized name even when the symbol itself is short.

This caused a debug Xen boot to crash on an Orange Pi 5. The expanded
name ending in mmu/head.S#identity_mapping_removed was 145 bytes long.
During the test_symbols() constructor (CONFIG_SELF_TESTS),
symbols_lookup_by_name() expanded it into a 128-byte buffer and
overwrote the saved frame pointer and return address.

The board reported:

  (XEN) [    5.064767] Hypervisor Trap. HSR=0x0000008a000000 EC=0x22 IL=1 Syndrome=0x0
  (XEN) [    5.066709] PC:     65766f6d65725f67 65766f6d65725f67
  (XEN) [    5.067190] LR:     65766f6d65725f67
  (XEN) [    5.074749]     X27: 0000000000000000 X28: 0000000049000000  FP: 6e697070616d5f79

The FP and LR values decode to "y_mappin" and "g_remove", respectively,
matching bytes 128 through 143 of the expanded name.

Reject retained names exceeding the existing KSYM_NAME_LEN limit before
compression. Report the offending name and its byte length, so that the
build fails with, for example (name shortened here)::

  Symbol '...#compatibility_mode' is too long (128 bytes, maximum 127)

A build from a very long absolute source path now stops at link time,
instead of producing an image with a latent overflow. Apply the check
after symbol filtering and preserve unrestricted human-readable
--xensyms maps.

Fixes: d37d63d4b548 ("symbols: prefix static symbols with their source file names")
Assisted-by: Codex:GPT-6.1
Assisted-by: Copilot:claude-sonnet-5.5 # host and x86 build tests
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/tools/symbols.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/tools/symbols.c b/xen/tools/symbols.c
index 9db1c0a20c..e15273a8ad 100644
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -485,6 +485,13 @@ static void build_initial_tok_table(void)
 	pos = 0;
 	for (i = 0; i < table_cnt; i++) {
 		if ( symbol_valid(&table[i]) ) {
+			if (!map_only && table[i].len > KSYM_NAME_LEN + 1) {
+				fprintf(stderr,
+					"Symbol '%s' is too long (%u bytes, maximum %u)\n",
+					SYMBOL_NAME(&table[i]), table[i].len - 1,
+					KSYM_NAME_LEN);
+				exit(1);
+			}
 			if (pos != i)
 				table[pos] = table[i];
 			learn_symbol(table[pos].sym, table[pos].len);
-- 
2.53.0


