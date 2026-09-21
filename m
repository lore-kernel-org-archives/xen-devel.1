Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DA1C982F2
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 02:29:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427028.1649672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Tlj-0007wH-Cb; Mon, 21 Sep 2026 02:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427028.1649672; Mon, 21 Sep 2026 02:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Tlj-0007w7-6r; Mon, 21 Sep 2026 02:28:35 +0000
Received: by outflank-mailman (input) for mailman id 1427028;
 Mon, 21 Sep 2026 02:28:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ziy@nvidia.com>) id 1x8Tlg-0007vi-TH
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 02:28:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Tle-00H6CK-40
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 04:28:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ziy@nvidia.com>)
 id 6ab09620-2eae-0a2a0a5409dd-0a2a4507b12a-12
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 04:28:29 +0200
Received: from [52.101.57.35]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ziy@nvidia.com>)
 id 6ab0964c-b4ea-0a2a45070019-346539233f7e-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 04:28:29 +0200
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 02:28:22 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 02:28:22 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=temperror header.s=selector2 header.d=Nvidia.com header.i="@Nvidia.com"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxfrvHFGH3yAq6mvYcNLbZ0IqZFUyPWdnkfA/522kXJR0gEeqNt/tqPpfHQS4mx000iSFdPIb44vlQh/XkiT6mdJWFd6rTwtX9PwNlsj4wk2B5QWYTRVGzpOyRXqpcfH3gb2Cgcrl2BS1GFabrbU+vgIIY64VjGT1I54kOiPijYo+nQnYbMHxEzx/ZzyPz901QrlDgsLbcwuuYGswFBMbkmV/575MCAVwLUdSHKsGvMqUSxT+NCjZR+EfMT2HuckozbttfAD5/D/boM627VlxldlHggzFbwA48BJl2SIdPHkcymTmWnPqVSaEVTHqVaVyEm1UxbjFNn/rB882YCAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpMC3DPaCgBSCOyBuao6sjqogivZ56QdijQSKHRf1os=;
 b=eu7FsLlPmwiAuNBwcBYej/R+MzZ6r9fWggo9aWrAMrVk+cltCA8IDWdtzksXWPqmlAdGTn4t68wdX362UEngkBR+82HRiMk/v9BQm+g2k/S+FNdyhJR4Za192W8fdA6iWeBnRqjusOwB3YFtc9cSOAwK8UDNODeExKpY5Z2+9FaoTZnXGmaD1k5rZFKYaLqRO23i4b/hEAOtVGNhJh3usmPQ0CUB0aZbB3JAcSJt1JHXshnfcIcSXAL0Xg05yc3BgsSSnEIAYChUYBlygLhj4wDLB9P4vJWva+Xu9N2ZQAYzAx2d52ioroE80okKmIJ51UxwLko6qwXt7kQPl+yCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpMC3DPaCgBSCOyBuao6sjqogivZ56QdijQSKHRf1os=;
 b=Z0N6nmJU0+AU3bupI5n4kRfItzpwj53epV4JQKpd5OfQF2AKZzNH5ZNE0yG+ShpAstFHZSbIzZkyiD59BcPwAObKyMGKo3YTKOrzU6aqy31V7Zxi8GBBVLX8K6YqNuMDYXzMYpgBt1JxEwAMDEWHjOtvTwj6CPJkAxXTyhtB6V4GQYdXmPwvZbOfH2k1O76jxxWqmuYWm31g390EQskXBiEaH55XTeC/TTnEG949NxFGG7e2qbGFl091RIDPSrcWz4T776y3sCU9E3/ZXmI6auFVqoBAl9TvATrB/wUc+vuOj+P9MR+nnbb1PuuF0+wPi2DzLHlIZLzxpPp1uYfbTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
From: Zi Yan <ziy@nvidia.com>
Date: Sun, 20 Sep 2026 22:27:59 -0400
Subject: [PATCH v5 03/17] xen/grant-table: stop setting PG_private on pages
 for grant mapping
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-remove-pg_private-v5-3-bb68b6a21869@nvidia.com>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
In-Reply-To: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
To: David Hildenbrand <david@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zi Yan <ziy@nvidia.com>, Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 xen-devel@lists.xenproject.org
X-Mailer: b4 0.16.0
X-ClientProxiedBy: MN2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::16) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: d3dac128-597d-4394-e183-08df178801eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	36kkqR4p5YHKuN1SERPlBIsWYUfE9RFpZ5J4etwUmJVpKUH3zsMuomA6AO3t6mKX7KbAV6Dv5xyYzTyKFgqolwMOMSU/mXU17776DcbsZ5EU++dcUjizE0KpjyORdod6p3BUPJ7Q25uheQ/XHNPxzSMg+BuI4ZgTk9TefDPFRneyBWMBfUWhwk4sygZIJhwLzHiZC1CV9s71N4KAvuiLUoz3sEg9OzTy4j36gegADSd6JhBGKCEvipvQAl/VyVymogchy7ZSaXQMth7f3ybi+L/Wv3zVuevdsdSjsLHo5C9kQugpsXystEKdMz/vaM9SQJQA485gN6CgHGBfKd/oW2r4rgMT49xN6TXtDM26TRgb1J0X+8TtfrU4R64RNCifVNREO1a4zNfv4mR7fZjPLOTvxmhwDQNxiKyg+drzMVb+H1ajTYavRyQLKJvvqjBuFpkQrSg2RrElUhIIPSIi3NdMOWxXqPt8lwFsQYn1cd6VDHeADOqGKiPdBx2//I+reHvDBOSKenoY3HMiYYY2XtFsIOzOTKoOZPMlm+FF2GVkaT6IOjKAg5bYpyzRM2z8dTy4inkt9CC/eanyRoZ5Zbw6yzHfQ/zZDsLrVgCtdNMwtvKj0pUXKOtw8fZSYscd8V19YOw1sZtilHyRMpwV0xaqzRDSoKNVeBeR3QuHJ/unHA0lLe+tarY0++miEnL7h3+sU903iB9L+yq24UhYgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1lqYmhQVUl5ZTRqVW5FT0JmUDhjbXAyRXlUL2I2S3dBUXg0OHJjNUlmQy95?=
 =?utf-8?B?TUZzTmw0clBtbWVCVW40bTBnVkw0emFPWHgzUGN3WXc0b3p6ZWJoNDAyRFQy?=
 =?utf-8?B?V3EycTVFSXBKSWhmQ2piY1NaaHd0bERiNWJ1Y0NUSy80WnhWaWNLN3FXZ204?=
 =?utf-8?B?SENvcnE2T1NoL1AwUTBBRTVXekpPSnNXN2NSTDJRdWwxNjJFb0J1aXh2TFF3?=
 =?utf-8?B?OUlFeTYzdXIrb3BvbEN4ejJ0YnRhSThjMWlGaDVBamlGUTNqbVVHbmx1eEM3?=
 =?utf-8?B?bTQ0N3RkVFNpd3puT2ZCelVWN3o0S3hDSUQwRDUwWmtRcVYrbndFY1dKVGpG?=
 =?utf-8?B?cWtmUVhtOFhCVU1uRWVVbzh6dldMbjZ0cWlkdTFNdWNVTlAyRFltMTI2TXBD?=
 =?utf-8?B?RUp5Z0JhUHlzbVRnc3JVaXVUcU8xZmh1WmJ4VlFFMitlZGVCemdFb2FYRkRa?=
 =?utf-8?B?RGVWYWZ3aTh2c1N1b1k1YVJ5eFY0cUFFbmVvU2NKd1R5ZEZwWENmUThSaFFk?=
 =?utf-8?B?K1Z4bVJyOHNjR09ZN2tGRmhQcUd5Y0NMTnpzZkpKdkdFc3FjUzRYT2UweFhY?=
 =?utf-8?B?Tm9zMU9DZUxhRXlRYVl0UXlieVdla2tYSHhKbEdPd2xkRzJzMGhXVFpSRDFm?=
 =?utf-8?B?cUxPL1JDMmhMVUErSGkyWDVBQkphS3lWTzhJMUNlMWYwc1FLTEwraW9qSEF0?=
 =?utf-8?B?Nzl0NUx6U241VXhRcFY0YkZmWkVKcWMvTDhsVHZWRGxQOWFxS0U3K0FSVjgx?=
 =?utf-8?B?TzVNak5VRW1FUDVWUlRRV1d6bFZkVWJRMllqUzNVektocnNlcVhJM0dqMW95?=
 =?utf-8?B?SGlUQnpPRXZGbTRadTFEQWRidlkwMEpQQ25meWt5bVdtNzd4bnhzM1FKL1JF?=
 =?utf-8?B?SEIySjd0K3JWdE0wQXdQeGVVOExFTnd1cDVuQytmTEROa0ZNQ0s0VGpWYWZQ?=
 =?utf-8?B?Ry9TbzBlY0p1dlA2aXNOMDRYQUxvTGVGSm9Qc3NUZjJJUzJvRWVIQnB0TG8x?=
 =?utf-8?B?THdQNVNoZXkzQjRldGlJK3pKNHFoNllhRnhTcmt6WWNyMmpZR1ZBODd4WnBu?=
 =?utf-8?B?cklqRDBVZE4wZExFOENmZ1ZvNS85clI5QS9ETDM4RHBnd09HRklYTmVVenZa?=
 =?utf-8?B?WFBUMWprb3lobUkrZ0Z2c2g0Z2d2WGp0TWoxRE5WdjV3UE9rektyVFVWaDZG?=
 =?utf-8?B?cU9pUmsvZU5YaHUxQW5iUVZrdkg4dDN4ZWM1SzhpdWZwYUVUd1ByQXlEVHFF?=
 =?utf-8?B?cXViOXdvcFV6Rldnei9mVHdFaHE4QVRtZTdQS0VrZ0svV25nTVYyL2NKVFB5?=
 =?utf-8?B?NTNmOGkySFgybzZrcytLOUkrZFptUUxaY0dVQ0kycUh4cVpSeDJITXZJWGVM?=
 =?utf-8?B?dmJianlaNW92U3hqK2dKazZpRXNGOVMzaENXSkVoL3FiWWdqVWtHWnFGNis2?=
 =?utf-8?B?ZmZsQXRleXFuYWdqMTRCMElBN3BBd0wzVEtYeHBhYU9XKzVmU0VlVHVuVGVK?=
 =?utf-8?B?NUVDZUdlSE1iNmthaENqcVJTZXBPM0pKQ1pTdFR4akdSWDc3VTlpZTdidUhh?=
 =?utf-8?B?RVBzS0NGR29uY3pVNUQyM0ZFL1VybnQxdnR3Qlh6V3JqOTc1MGNIYytTK3hC?=
 =?utf-8?B?ZmxpZXlKSWhsbitLVW5yTHZ6Rkp4YTl3UmNXQmlMZGF2ajNOUGNOWENwQWZi?=
 =?utf-8?B?VmZiazBUV2RkSGQxQkF1RExRU3k5dS9HYnh2MUhRNUM1Q1pTaDdUcDZ5U09P?=
 =?utf-8?B?Ny9QanJzbUVEdjdINUFJbk85c25OS01CODAzakdickYyeGp5dmRMNWNZc2V2?=
 =?utf-8?B?RDhDcTBlNnBXaDhTdFllWE8xMUJqQnlNRHJDNVB4OERFSGdxVXQxcy9kY3hm?=
 =?utf-8?B?Qko4YmFWakJjcHNLRVprUzJGdnd3UDdUd0JlUjBGcm1nOHJtQWxyQ1FaWFB6?=
 =?utf-8?B?bGU2bDcxV0t6MHprdHJyczNnMzVFMGJZRnZRSnBjejNUOEVqb3Mvdnp5MTB4?=
 =?utf-8?B?aFN2TWRNMXgzRDl4eGkzNXBpSHJMSEdoWDZsbTcvTzMwTW1WYUNmRDFhNUdu?=
 =?utf-8?B?L3l6TU53c3FnS0hoNk85ZVczemtQakJlS25Ucy9oeGFLOGoybCtkUExrcEpI?=
 =?utf-8?B?V1h3aDNPcTdLMC9ldythSXZidGU3dW03a2xsQ0JuS1lza3EzbzRSZldBTHY1?=
 =?utf-8?B?SUpFeW8yU1o5dit6Wm9sMm1VRDhpcHRwU0poMlRkZjZ1UlA5cEFnMDUrcHN3?=
 =?utf-8?B?b1JvT3dsWWNmMDFzMWZ1VVJ1TWZydmoyYzRBVFdNZWNtcWxxMUw4Ykp1N1Ja?=
 =?utf-8?Q?oEYSwmZT8r+icpO+ej?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3dac128-597d-4394-e183-08df178801eb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 02:28:22.6170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnizZyuJDDjv7oxstG8ppNpr2WexaCqnVhUrv82Iszs9S8SGxiz7xwhWCXJT2rEI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719
X-purgate-ID: tlsNG-ef75cf/1789957709-A60C5AE4-179AF199/0/0
X-purgate-type: clean
X-purgate-size: 2085

gnttab_alloc_pages() stores xen_page_foreign in page->private. On 32-bit, a
pointer to an allocated xen_page_foreign is stored; on 64-bit,
xen_page_foreign is stored inline. Checking page->private != NULL is enough
to tell whether a xen_page_foreign needs to be freed on 32-bit and
page->private is zeroed unconditionally on 64-bit.

It prepares for a future commit that remove PG_private.

No functional change intended.

Assisted-by: LLM
To: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/xen/grant-table.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 69922be28b54c..993f89f048e21 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -863,10 +863,10 @@ EXPORT_SYMBOL_GPL(gnttab_free_auto_xlat_frames);
 
 int gnttab_pages_set_private(int nr_pages, struct page **pages)
 {
+#if BITS_PER_LONG < 64
 	int i;
 
 	for (i = 0; i < nr_pages; i++) {
-#if BITS_PER_LONG < 64
 		struct xen_page_foreign *foreign;
 
 		foreign = kzalloc_obj(*foreign);
@@ -874,9 +874,9 @@ int gnttab_pages_set_private(int nr_pages, struct page **pages)
 			return -ENOMEM;
 
 		set_page_private(pages[i], (unsigned long)foreign);
-#endif
-		SetPagePrivate(pages[i]);
 	}
+#endif
+	/* Data is stored in page->private on 64-bit */
 
 	return 0;
 }
@@ -1031,12 +1031,11 @@ void gnttab_pages_clear_private(int nr_pages, struct page **pages)
 	int i;
 
 	for (i = 0; i < nr_pages; i++) {
-		if (PagePrivate(pages[i])) {
 #if BITS_PER_LONG < 64
+		if (page_private(pages[i]))
 			kfree((void *)page_private(pages[i]));
 #endif
-			ClearPagePrivate(pages[i]);
-		}
+		set_page_private(pages[i], 0);
 	}
 }
 EXPORT_SYMBOL_GPL(gnttab_pages_clear_private);

-- 
2.53.0


