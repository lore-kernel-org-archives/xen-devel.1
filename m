Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16837C4453C
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 17:20:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368679.1617927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmabo-0007Fp-03; Wed, 22 Jul 2026 17:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368679.1617927; Wed, 22 Jul 2026 17:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmabn-0007Fi-Td; Wed, 22 Jul 2026 17:19:51 +0000
Received: by outflank-mailman (input) for mailman id 1368679;
 Wed, 22 Jul 2026 17:19:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@virtuozzo.com>) id 1wmabm-0007Fa-HG
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 17:19:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmabl-0054SF-UL
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 19:19:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@virtuozzo.com>)
 id 6a60fbb3-5cb7-0a2a0a5109dd-0a2a4504896c-2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 19:19:49 +0200
Received: from [52.101.84.111]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <den@virtuozzo.com>)
 id 6a60fbb5-b57f-0a2a45040019-3465546faf6c-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 19:19:49 +0200
Received: from AM9PR08MB5892.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::16)
 by PA6PR08MB10526.eurprd08.prod.outlook.com (2603:10a6:102:3d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 17:19:47 +0000
Received: from AM9PR08MB5892.eurprd08.prod.outlook.com
 ([fe80::94bb:633f:1f55:4bbd]) by AM9PR08MB5892.eurprd08.prod.outlook.com
 ([fe80::94bb:633f:1f55:4bbd%2]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 17:19:47 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector2 header.d=virtuozzo.com header.i="@virtuozzo.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQUKciMWDIq3xVTB6br1LQX6XVPI9DHk9CBgJndPAoXSdUOKLjvnDpWEaXuTxHOEzBl49Kd+AQvarO3YhuBJmd+XdYAHTEUsN1tZhZln9ufmeMr1fKUdtdhXyKXjqcZx/p/0ilLXwpPG3YiU1Z/sDjzSsMDPfZ43GQJyKJ8hvHhUK8NDduOTJgMMQtz2O3JDD7upDlUproOFKv14/tE9eImMYG/0H9fdss0Qz8E1QXwEXaBPYNFFkpYB07TPWNDLdBT3GNfMIjnHvyvYECnknDjh0PMAklqqYcRhXWNYXahye23jIRFyX4bGz1yFnsHwxgPGmAp54JBA/Q8+EPA2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mfm9NXIWVTQgGbPugzT8H+LawEEKM942vZhuo4NZw4s=;
 b=UCEOSRNPpazXsWZIYF5/L+GqaWNzPHFFoGb9IqMACmvZ6YlurEvi9eH3J6OrtUaHRNPiSvZJmwzuvMrWDYWVMt7HFWzzC9Bgsq3a5kHx/4J+xCG3kcTuyhnUEvFPpPjXbRcx89MGH7OnrgZQEMf1wSjdV2fXKwONvwa8vx1plsyE12IHfjgXm6IS1vO4I3PJj5yYQlhtWuAV/boMZwthbuuiJZ4EEqfq1OJJgL2vkcyKa2+Wd3ctigz5B6LCD7h90Pwvbt/LK46hrrhVjFuYrMoa5BaHAxyK7rqE2MClaJjkvU2rOX961GhbJdy5JrnfYelerClYAM6SRQI+408i7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfm9NXIWVTQgGbPugzT8H+LawEEKM942vZhuo4NZw4s=;
 b=0WcNNWYhiDBcIafEHE6GydVdpeYibK4EbEpfyueER22dem34rAgpWk5cfW3FKtkZpl3/FpTghrHthlV9K6WIb+FdLyW2RbBYw36Lnw+z1seYodH3gM71y27w+RkP7B+dfOHiAi6GmNEjvMPiDUYwbsnXl1YDp16D031GZw0bbufoPxq/ipbtm6fEQZMWTyHiBtN2ACgTaYbgityfk+FvVScAZzAN9tfHAYIWev2ZW525Ys7S4R6MzsyIQ6ZA1m82SDJEBCDeB6yyh+Vi1CDIt6oeambQftvYxjr7uZDs9p7+fD9X9oXXulLj6c8LU0XJs35ikoOJFgx1LNVddJ/DHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Message-ID: <a0f4e27b-dc78-4aa4-9b76-bb7fafc8d38d@virtuozzo.com>
Date: Wed, 22 Jul 2026 19:19:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] block: add missing coroutine_fn annotations
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>
References: <20260720-co-v1-0-fabb4db3c204@redhat.com>
 <20260720-co-v1-6-fabb4db3c204@redhat.com>
Content-Language: en-US
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20260720-co-v1-6-fabb4db3c204@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF00000139.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::898) To AM9PR08MB5892.eurprd08.prod.outlook.com
 (2603:10a6:20b:2dd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB5892:EE_|PA6PR08MB10526:EE_
X-MS-Office365-Filtering-Correlation-Id: 211fc75a-2077-4566-2c58-08dee8156e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|23010399003|1800799024|22082099003|18002099003|6133799003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Q1gk0aBDJA6HtnNwXZUMOrAeV7JkZ+zU8Jwx1dtEQGdYmrA/EM6p1M3ovOq2ItPBz8/itX1t3aCcI+SWu0eltZjLJlMP2uvUkJgXn24T05DuVHp3oK4AR44lU1HNwe+mVMKO92BoLLj/7bMF2NQBVJdcOfSnDzI5LyMWesqzqEGFwf2J/J7w/4I5qRnBCElNc9RfAeHrJwJUlFTbM7JSOn5GAhsFm3AbuD/4JLP1JsHQX5pMJxtqIVmPQTx7ZpXU/2YXggLUK6INGG1hXWkroA9arJ8PP5GMtibYN8Kx8ZRlnNb4NqzwXSPSwIuc0310lIFE8WL7fYb60jftLXBzFRD3L0ZW9pXjRpEK4Tq0o8JWYrQbl6DdFNilIsxYiO1BnTFLMyW238n4IJy5UP1WflWF2XUe9XX8jpbBixgkpMvbzuea5Gl13s37lmPSmyD0qStjBH43Wcdake9JCD0dFsHqxVLIX7XSeBGv9yDEySESNe1+9h9seYgGBqzjGuARDCzb1PNdcwXBqJYDqhFBYUaUugvm9WgzO/HVftZZrQIc7rECP84yMSyJJ1AK85yybHgKcK52qds66Fbqh5m0t1cOc6TeJnUoFiM2HNyXjMTiF9HNrgyuWuorJjPKtGRGRtr/44kPlRFfaTP3cbA2XCtFwc7d0mVNJJe2+PtOHxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB5892.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXNQcGl6YTVCbFpZNWpWRGlqdUJoeU5TWUpnelkvTVFXdDZ5VGZBQlBZUUJW?=
 =?utf-8?B?WVZ4S0R6cEJ0OExCZngvckk3azJlay9FcUw1dVVESzlRZyt6WWNCeTRtR1RV?=
 =?utf-8?B?NEtDT3I4a1k3c1BpQldibVFXc1lvajhNZmkyVTkra0UyMGpVRDBoRWplWXp5?=
 =?utf-8?B?ajNpTy95RVgwc0JnMGFjQUQ0Wkd4SEJCalNKaXFXQStPNi9BUzJtNWdZMm5a?=
 =?utf-8?B?REVYWGl4REpxSmRVL1pzcU13Zk16ejlRL2N0WnVoeW1zQ0hYdVRCT1k0N0NS?=
 =?utf-8?B?OUlHYTA3WGRrd0ZCaGVCVEhjdmxCTFl1K2RKYldTOTRNN2tLOGJ1d2tLY2t3?=
 =?utf-8?B?Y3REQ1pGNU4zTzY4S3VWYytiNTZ4d3BoTndKUGdPR2dEVEdLOHhTalkyZ0FW?=
 =?utf-8?B?K09qWEIyU3BIVG1tdHJWMmJMS0cyYWVKSUZpc0pHWU9GUUJaWGE0cjZYNG0y?=
 =?utf-8?B?ZVVwZHk5WGFFSjQvQVI3Wnk0NHRYWmRxYlJqUXBpSFYrSHFURWpUL3BsNXBr?=
 =?utf-8?B?SXZVZEwwbmFsKzdHUzljbHBPS0hVdUJHWE5zWkEvVDNrNUJsSGJELzN4SDdK?=
 =?utf-8?B?d0pvNVlFdWNNU1hwQjNSbFhlTC9wSGtvY05oR0ZIbjVXTkI1RlBKVk5kR2ZX?=
 =?utf-8?B?VkV2OCt3S0txb2IwdHlPY05TRGprWUpUbXByeFV2MTVhem52NHg5YmwwYjdD?=
 =?utf-8?B?ZFM4eVovcDhMOE81SC9ZZ0RnaXVTaHJqdkxoalVZWmxaSndRWDRNd01zTm5O?=
 =?utf-8?B?blQxd1RUaWNvM2l2aHEydDFpVUtHbk9mN3Nkd3NjTXp1OG1tc2E1ak9NZmE4?=
 =?utf-8?B?c084WDUxdXFYK2lEOE5qekt6SGM1L2RTMFhibWR2WEhqL3RUK2ZzZ0pLdmFo?=
 =?utf-8?B?c2xZMFk2ZVR5K0wzRGdvOUVCNDVkNEM0TmxENGwvMUxFcUZjbGRNZndKRHpZ?=
 =?utf-8?B?eXZ1UnB2UnYwSjhsUDRBaHY4cWFHcVU0S01XYzg2STZOVmEwWDlOek9nZkhE?=
 =?utf-8?B?K0tsMTZaT2Vya2kreHdJVmNWZEdIbUtUYythazhFNnRENzFkd1orS1RyVTEz?=
 =?utf-8?B?aTRzWVJKM0IrSzlxTXJIRDJiRFpMa2Vaa3h4YmhPcUxUSElmTzVLZ1I2Szds?=
 =?utf-8?B?cGZ3UWVub09NKzJ1TXMwRHlrRjZzYmJuZ0FsM1RDRnNmYnB3eWJaeDZIOFVk?=
 =?utf-8?B?bGgrQ3hLc1FrUVdBT0wwSGx4UzZBRWhVSDY0dHlha2NKWlpNck5iUFhEcTRa?=
 =?utf-8?B?YnMrQ3VCMGdrTkhBWTJ4dU0rdHBQTlBnUmtob0p0NnByUTR5WE5uTDdGWlN3?=
 =?utf-8?B?Ryszc2FuQ2RhdTEvWlBYam5Qd0wrQVpURjVRZjVqVW5yR3ExTDNYL1Vwa0RP?=
 =?utf-8?B?aFNqMThKQ0lNQjFjcmdsdGd0SFRuRXErQ0grbHAvOVdqd09nMnU1b0pnYk81?=
 =?utf-8?B?YkdiM2xVTmplNjZZcXI0YnFISW9NRmJ1MVNRenJVMU4xWjBuM0hhWFVUYlpq?=
 =?utf-8?B?SVlubGdldWtZZGpjMkJNRHYzbnQ3Y0U3VHZab0hpMXFqaDVUSjV3N3RxR2hi?=
 =?utf-8?B?Ry9tLzVaaytVM1ZWYVRrM01oYkNXcU1TamQrZkh6NG5zbW1QYncwOTE4cFNz?=
 =?utf-8?B?T3dRUHlwSmZ4SDVhd3Y0SWo1alFndTRicDlmeHFabm9oRjNpZzRmeklFdG44?=
 =?utf-8?B?NFc4UXRDMUdGV1R4MFZTU0hGZENaaldWSnRZL2QrRngydGFmYU93SVUwdUhs?=
 =?utf-8?B?dDZzSUhCV21sS0VIKzBFVXNVR3AyS0xxejZUS0E2dlhoTEE3cUdBM0ozRW12?=
 =?utf-8?B?SjBsUE4xZ0gzQTYvbmIzWGNjcTBmd0grbGYwalkrUWFLN0J0ZXlXelpkRzU4?=
 =?utf-8?B?OGttbllxQm9xZjYrSDNDdkp3K3YrRlZCZzNFdDZ0REVrc1l0L1hWOTYxekxj?=
 =?utf-8?B?a0FmTDF6V2pJLzNycDdOeFZnWVhOeE84TG1ERmRwSWFiVzNOdUxQQ0NnWmx4?=
 =?utf-8?B?ZmRqS2V1T0tUQ0U3alk5TmVmWG9uMmpZQkxFTTlyZVJNckxCclpaM2VxZ0dt?=
 =?utf-8?B?eHIrVEcyczVGdHFqTitlOTBMWEJrMWhvTHdsaTVUdFJkVjBua1E5dC83WDNU?=
 =?utf-8?B?VG4vR2VqZW9kTThOS1ByL3NENUpPZ2E0ZU1lY2tpS21BVU40QXhBUWhWb3dU?=
 =?utf-8?B?Zk1oMHY0OE1YQnNqUTFlL0Iwcm1hcEk3T1cwM3lRK2lmMGhBOTdUUmR3Ukx5?=
 =?utf-8?B?M2NsejlJdWlsaDJ4d1ZZM0NxVW5hL2pWQ0JBQ1V1VnQ1ckY2cEhRRjJ0M3hT?=
 =?utf-8?B?Z2VkTmdaNUcxbFpaWkVrc1JxaTZYdmRPTWM4S2ZhSGs4U2VONHBZK21VUm9S?=
 =?utf-8?Q?ADiwV/l1Iw5IgLX+kmDETXZAWfxoC+ns3vsZRTdRmo0Pj?=
X-MS-Exchange-AntiSpam-MessageData-1: FpSx6ul67Cni8Q==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211fc75a-2077-4566-2c58-08dee8156e44
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB5892.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 17:19:47.6705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lt2KJpuFGZ4cSYvIKamUtbcRIEeLKzoWnhvwI/o5OUeyQuCT/9TKSUcboKVDbES98tvan+G+QZqb1KPnRbEJQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10526
X-purgate-ID: tlsNG-ebf023/1784740789-524CBB50-42DEC65D/0/0
X-purgate-type: clean
X-purgate-size: 5488

On 7/20/26 09:55, Marc-André Lureau wrote:
> The functions call coroutine functions or are called by coroutine.
>
> Add an assert() in qcow2_do_close() code path which calls a
> no_coroutine_fn bdrv_graph_wrlock_drained().
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/block/blockjob_int.h |  2 +-
>  block/crypto.c               | 13 +++++++------
>  block/io.c                   |  8 +++++---
>  block/parallels.c            |  5 +++--
>  block/qcow2.c                | 11 +++++++----
>  blockjob.c                   |  3 ++-
>  6 files changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
> index 4c3d2e25a20..34e172874fa 100644
> --- a/include/block/blockjob_int.h
> +++ b/include/block/blockjob_int.h
> @@ -150,7 +150,7 @@ void block_job_ratelimit_processed_bytes(BlockJob *job, uint64_t n);
>   * Put the job to sleep (assuming that it wasn't canceled) to throttle it to the
>   * right speed according to its rate limiting.
>   */
> -void block_job_ratelimit_sleep(BlockJob *job);
> +void coroutine_fn block_job_ratelimit_sleep(BlockJob *job);
>  
>  /**
>   * block_job_error_action:
> diff --git a/block/crypto.c b/block/crypto.c
> index 36abb7af468..8a34d92fded 100644
> --- a/block/crypto.c
> +++ b/block/crypto.c
> @@ -56,12 +56,13 @@ static int block_crypto_probe_generic(QCryptoBlockFormat format,
>  }
>  
>  
> -static int block_crypto_read_func(QCryptoBlock *block,
> -                                  size_t offset,
> -                                  uint8_t *buf,
> -                                  size_t buflen,
> -                                  void *opaque,
> -                                  Error **errp)
> +static int coroutine_mixed_fn
> +block_crypto_read_func(QCryptoBlock *block,
> +                       size_t offset,
> +                       uint8_t *buf,
> +                       size_t buflen,
> +                       void *opaque,
> +                       Error **errp)
>  {
>      BlockDriverState *bs = opaque;
>      BlockCrypto *crypto = bs->opaque;
> diff --git a/block/io.c b/block/io.c
> index a916b236c3c..99dd16864a3 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -346,8 +346,9 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
>      assert(data.done);
>  }
>  
> -static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
> -                                  bool poll)
> +static void coroutine_mixed_fn
> +bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
> +                      bool poll)
>  {
>      IO_OR_GS_CODE();
>  
> @@ -397,7 +398,8 @@ bdrv_drained_begin(BlockDriverState *bs)
>   * This function does not poll, nor must any of its recursively called
>   * functions.
>   */
> -static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
> +static void coroutine_mixed_fn
> +bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
>  {
>      IO_OR_GS_CODE();
>  
> diff --git a/block/parallels.c b/block/parallels.c
> index 7a90fb5220b..46a6e8f2743 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -142,8 +142,9 @@ static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
>      return off / s->cluster_size;
>  }
>  
> -static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
> -                            int nb_sectors, int *pnum)
> +static int64_t coroutine_fn
> +block_status(BDRVParallelsState *s, int64_t sector_num,
> +             int nb_sectors, int *pnum)
>  {
>      int64_t start_off = -2, prev_end_off = -2;
>  
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 19271b10a49..161626fa3cb 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -1287,9 +1287,10 @@ fail:
>  }
>  
>  /* s_locked specifies whether s->lock is held or not */
> -static void qcow2_update_options_commit(BlockDriverState *bs,
> -                                        Qcow2ReopenState *r,
> -                                        bool s_locked)
> +static void coroutine_fn
> +qcow2_update_options_commit(BlockDriverState *bs,
> +                            Qcow2ReopenState *r,
> +                            bool s_locked)
>  {
>      BDRVQcow2State *s = bs->opaque;
>      int i;
> @@ -2126,7 +2127,8 @@ fail:
>      return ret;
>  }
>  
> -static void qcow2_reopen_commit(BDRVReopenState *state)
> +static void coroutine_fn
> +qcow2_reopen_commit(BDRVReopenState *state)
>  {
>      BDRVQcow2State *s = state->bs->opaque;
>  
> @@ -2905,6 +2907,7 @@ qcow2_do_close(BlockDriverState *bs, bool close_data_file)
>      g_free(s->image_backing_format);
>  
>      if (close_data_file && has_data_file(bs)) {
> +        assert(!qemu_in_coroutine());
>          GLOBAL_STATE_CODE();
>          bdrv_graph_rdunlock_main_loop();
>          bdrv_graph_wrlock_drained();
> diff --git a/blockjob.c b/blockjob.c
> index f3b11cc7a19..f3ad6a93125 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -338,7 +338,8 @@ void block_job_ratelimit_processed_bytes(BlockJob *job, uint64_t n)
>      ratelimit_calculate_delay(&job->limit, n);
>  }
>  
> -void block_job_ratelimit_sleep(BlockJob *job)
> +void coroutine_fn
> +block_job_ratelimit_sleep(BlockJob *job)
>  {
>      uint64_t delay_ns;
>  
>
Reviewed-by: Denis V. Lunev <den@openvz.org> (parallels part)

