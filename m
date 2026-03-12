Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67B7FED2F0
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2026 08:49:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1251837.1548684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0bj6-0004Dl-Jk; Thu, 12 Mar 2026 08:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251837.1548684; Thu, 12 Mar 2026 08:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0bj6-0004De-Ft; Thu, 12 Mar 2026 08:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1251837;
 Thu, 12 Mar 2026 08:49:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jNLd=BM=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w0bj5-0004DY-9R
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 08:49:03 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4df6b56d-1df0-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 09:48:57 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB4926.namprd03.prod.outlook.com (2603:10b6:208:1b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 08:48:51 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 08:48:52 +0000
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
X-Inumbo-ID: 4df6b56d-1df0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEF7vyC7LF1rOVy0b3NrWFreJyR0pB6J+eAWm4Q+K6H/+rYla8Oh4TlUAs5Z3lSB/6XkyCxC5U0st63o2B6FlifcR7I5YEnmSVh+KXyAQK9+EyhMRklkOVCtpqf2wQffld9iqib9dgwFj2brbvMm+vwkqH/qDd3pOsxLO3jSAwVfY+67YdiG99vS82lISMdrW+1JfSVFjxeCOOO8N66Gm0jvyuUnyATRu4uVk5+Pm5ybwFmGxVCQXE4UEJUJP+lppUJXb0VQGo47BqABtIbVTZprIvuokJmZ4caWLuUNA7SiXA8T4CX1JA7FQfj0GCxHoDp47RdSKba9BdcXrHH+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O1tRDQ0OEzoxqOQDGf88C+BTZkQUGNGJWGEt8y4v8E=;
 b=eZT0Wt+jvGnEQ9qyr2QPKGvw6ZAcU5XqI9q2ourS9hNzzUE8UYDSAVsBIVAMCkKvfxomd3rI1UqWJojvY4vIvLjacTzmZqTmNjh9coHWvujIu6Mn0fcF9vBpN/r3Egi6j6GeaiD8PlmcDmmDjFqGgI+JHBjUgg+DvY5XFlSk1jHDuaOTmDDL3G2lYBoAQJnKXLL5sB7PknjBxEe/FYhNrHqAPyRksmWqvGqvjs7CP1tzbGjJjp3TrszXZAjdjhuX+X1KoQxAuMuA4RcZcIyHYF15MA5PYk7sV2Jm0rEfou9gVhNOFBSm8eXmtAZg21MyDWlUverhXSYKjKR8C5oq4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6O1tRDQ0OEzoxqOQDGf88C+BTZkQUGNGJWGEt8y4v8E=;
 b=KqSnmKB39BaGPh4NPw/chcva9PHFqRsDJesiqusMnUTYZf74CWUCCjgAAcKrFBzcqcpMR2O1K5lBJfcKSqcKplZ+a662x1aIZSGquCuDzDU41AQbF0+5y/23f0xjk7t5tbc8nAcuXzo7mHdJQL9QKV+1/qn04R194ah/fB2ddZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tests/pdx: allow more tests on 32bit build
Date: Thu, 12 Mar 2026 09:46:38 +0100
Message-ID: <20260312084638.53360-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0046.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 6feedbfc-285d-42e8-eb1c-08de80142ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bRke38gY1881bgqhEpPGnN1P01VzF/NxOJn7t9+80Jc86Ft3BT0yTh17hqXWfHeGygq+UMmikwY3ISPcShFdjZdx/CIQ6MDOeiTjkJ8SeMjzp3Q+PNVbdvpL4BXB8LmIO5MKx1QUaI+QA46KG1ssV1tDzubRWEopPwggFOTZQbwc0jgLSh0zg1/EvP9zKp2Ms4Eez9yAEI4OUsMFSmCa00UEraVVhBS0Ckos5A9LbTCvO6wFQmCzFP59amC6A90n5JqsNbI5rYnGOuZsYJceSlz3X4RHzZ5mW0aSouZXCXd5WJd/nShov8pcqaQXCEoY7hOnIpSJkDbmQD9UDKLwgZ/rxu9bsrEeHrSzoMkerCbJ4UwNwxPC4QzilZOgfJFCo9v2KjoVL47Mp7G112Ej0yzkFIjzTPQhLFOW1aRcXuA3hX/7MIxNIdnoiFnvphJY3cg94elQxwFPU0eABJa/bwbNCRjTNrWixc23zFFnEH/QBkAhjIF5cLskjC80EsnPTUjAR1u6EWSVr+bMvC0zWvswJNn2y185E9f2IIxqdT7zCtiLlsT6ELuqEXMopvC+dWIAWv4ZFnd+h0B5amPqxMa+aEWvu09rGmEUwiIpy+PfIaI/v2xbN92NYbwa25iCeKFXnRQOJoWaHBTwrXt/eCkqr2NH0xXUPGq4BhnomoRxrk2ju4OSScvE2o27E4+POEfKlj6VxEaY63wa9qpt7Kia3d37cOu8XI8yTXBYBak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEJQZFhPK1I4ZlNMRDdVSTNGS3lGa0xEL1ZmNk4vR2ltdEszbkdPVVpCOHRm?=
 =?utf-8?B?R0V2U0liblgwMkpIc2hUaHRPa1pvYkoxNjh3SWVwTFh0SzNGSlBYTEdSemRR?=
 =?utf-8?B?dDRYSWN3aUZaWXluOGFKQkZvWDNBT1JkVktnZnB0UlpldXcxaURYSitTTzRY?=
 =?utf-8?B?SVJFSGh3TmowTkxTSDZRSnlOZ2NPWGRvM0YvTkZxbVI3RzAwbisrNDcvTlF4?=
 =?utf-8?B?Mk9iVFRMM0tCb3IveG12VzBQdlYxSHFKcXZrVW9NcTdlMlNQSVBiVWtPUE9s?=
 =?utf-8?B?Y0ZmNG1RUmswZi9pS0lpKzFoaXl1ckQrYzM1dWRWcHYyWUpoTU5GN0hjc0Jm?=
 =?utf-8?B?dnpBTkoxQzlrTnRHZ3NycjF3Wk1RMTAwamszWDBXUjZTcDAyaXpaOGRGRUFx?=
 =?utf-8?B?K2hRMTk3ZUJOaVZtTDFCd29KR25RTFBCK3krd2hJSldCR1c2Y2N6RjM2bFZw?=
 =?utf-8?B?M3lRYWZiM05EaU1MQWE3eVdPVnlLcEF1YnlUeTNpdnRTdU01MDFCS1l2Q1ZG?=
 =?utf-8?B?K0ZZeHNjdkVkb2EvemNhcDVTMCt6M0NSUjBkb2NCZE1YanduTEV2Ymg1Z0Ni?=
 =?utf-8?B?V28yUGswVkNMbVNEckZjNmsrK1BmVDUyUHdZaTRaSnduOTQvRXJaWGU2OHAr?=
 =?utf-8?B?Rll1VjNBdU8zWTVyaVhKbWtmdUNrUFU1Z2RLdTRjL3p2SkhFZ25lZTlETTNx?=
 =?utf-8?B?TmlDRjY4K3VVMWk0cHZjc0lUN2dOd1EyRWl4UjBtTWNyQXpXZFFSZEFKaUtz?=
 =?utf-8?B?bHVkb3g4TklNM1RSZXBPSmxiS3dvZVlIWXY4N1pRSTlNRlRxb0oyWFkyY2tm?=
 =?utf-8?B?QXJkSmgvdzVxS0NNMkNlRDZib3VDNzRMUmZyanJWOUVaOG4vRW5QQXUzMEhT?=
 =?utf-8?B?Q3RiNE0xMDBrRFRXY3A0NW11ZEhFL3FueklyajFaQUdSOWo3NlhBM1NRUU5t?=
 =?utf-8?B?aExkNkdNQ1VzL0RkN2t6SGcvTlFZbDBDUzUxbFR5TnBVQnZEeXRndXFpWnBk?=
 =?utf-8?B?Skhiblo5TWFVUWdEZThHM2pQbHBrRjI2UlE5R3ZHcVptajQwWUV1WExIVDNq?=
 =?utf-8?B?RmRCTG0xQVhlTFR4bUZzdklPcnhmdEhTVmM5UlE2dDIxcGxSNis4ellhRElC?=
 =?utf-8?B?WDVLWW4vWGE5cFlyVDZleEltdkhnZmdJcHFhb1FXdHNpbDRKZTZIZEg4YWU4?=
 =?utf-8?B?STVZUGgxUy9yYkJJRjNqdFUzZmZPWEFYdUdVbUpRNzZHdi9hdE1PL0dJZTl6?=
 =?utf-8?B?VElpQnpMUVM1VjJHTXkrTDRuaU5uTUgxUFpJQlhWZUpZemRKNC8xdUc3azdl?=
 =?utf-8?B?MzJqZ2U3M1Z3bTVlVjQ3eW1VVTJtVlFMaC9FZlExSzFYUGdBaHRpb0VyQmdB?=
 =?utf-8?B?RHNQclg1azkrcEVLNzFWREZ5Q0JhQWtpUVNJTWh3ZmdoMXR1TzYwdUZlb3I3?=
 =?utf-8?B?eUd5eW1MYWYzamxJay8rSTFIa255Qkt5QUcrL25wWVMyMkYzdjQyWUpVd1J1?=
 =?utf-8?B?YlA5Nzdnc3diYk1FNHJTNnRmbHE4TlpQWkFtVmRlbEZaUStXVkUreisvNUtt?=
 =?utf-8?B?elRtRklkY0NadklkUFdkUVFZYmlOM2NVSHlydzgrVGNneGtDSjhlMko2ck56?=
 =?utf-8?B?UFVWWmpFdjA5dnBtSzhOT0lzMFBVdUZvRmFHSTE0c1FlWWtEZ2JZdUhZUnhT?=
 =?utf-8?B?K1h6UnF4YkwxOGhqVmpIdVRWRVlIbmo2am42dmgzMmNweldXV2NuZEZZaDhm?=
 =?utf-8?B?MThRUEVnUS84RzdNUXZ1WE9lVXIwcUxzSE9DZlZaY2tiTzhidzFFUVRrOVZR?=
 =?utf-8?B?UklSVnIxcWIzQTZuOEt6Snc1RFlKdzdicXFsdi9iaUQyNFlPeXhxRENXdk1H?=
 =?utf-8?B?a2RaZ0RzejZjTitpTi93VEJUTmgxQktjUXhlTktGQUZVd3JzYkRFUGRwcUI2?=
 =?utf-8?B?QnBOdXBQR085dy9Gdm5PQmxYYk1vWkJ6bmJtdVhsZ2RiZFVmV1J2SEdLREdB?=
 =?utf-8?B?Y1FGL3U1ZVZMbkdrVjFmRmxEMkdGTW03TVd0UmhrTS9xQnN0U0FDNzJIVVpp?=
 =?utf-8?B?OWk5NkcxYmxxZGtGUUdaaHBnOVNpY2owSjhGaUsvZEgzMVBYQy9la0p4NTl0?=
 =?utf-8?B?MnJWaWJURHJHWGtNcXlGaUduVjBSeXRYMVNkMjZML0JLOWFMci9HRkZHR0Yv?=
 =?utf-8?B?NS8wNVpQNmlJTlV1cVVrd0xDSnFWSjBuMURHaHBZTHRCK2xhRndaZkUwdUhZ?=
 =?utf-8?B?T1J4N1dlZzNhQ1VzM0Z2ZG1OTEsweGNYR0JCWGh0VE9KS2hzZWFHWm4zZ2Rq?=
 =?utf-8?B?ek5nN0xkRDdHa0FkRUlyYjgxSmx0VjVlS3BNSjNHM2NVMFVFY25aUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6feedbfc-285d-42e8-eb1c-08de80142ffa
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:48:52.7642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D94nBKonVx/nWR2RgwkEkUAZIuidvNzjCPMbIVJFh4ULzEkDgFsOY/L5/cZ+5sAG4Xol98nq36cH3+hnoH2tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4926

The limitation of which tests can be build on 32bit is too strict.  Move
some tests out of the 64bit explicit region, as they can also be built on
32bits.

Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/tests/pdx/test-pdx.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index 066bd3e7e569..d783186577ef 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -77,6 +77,17 @@ int main(int argc, char **argv)
             },
             .compress = true,
         },
+        /* Two ranges with the same high bit set. */
+        {
+        .ranges = {
+                { .start = (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 0,
+                  .end =   (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 1 },
+                { .start = (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 3,
+                  .end =   (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 4 },
+            },
+            .compress = true,
+        },
+#endif
         /* PDX compression, 2 ranges covered by the lower mask. */
         {
             .ranges = {
@@ -132,17 +143,6 @@ int main(int argc, char **argv)
             },
             .compress = true,
         },
-        /* Two ranges with the same high bit set. */
-        {
-        .ranges = {
-                { .start = (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 0,
-                  .end =   (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 1 },
-                { .start = (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 3,
-                  .end =   (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 4 },
-            },
-            .compress = true,
-        },
-#endif
         /* AMD Naples Epyc 7281 2 sockets, 8 NUMA nodes. */
         {
             .ranges = {
-- 
2.51.0


