Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E64606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=DBOxwmb/
Received: from list by lists.xenproject.org with outflank-mailman.1505076.1700041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWwCk-0003dy-BV; Fri, 27 Nov 2026 13:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505076.1700041; Fri, 27 Nov 2026 13:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWwCk-0003dr-8s; Fri, 27 Nov 2026 13:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1505076;
 Fri, 27 Nov 2026 13:41:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xWwCi-0003dl-GV
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:41:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWwCh-001aA9-MC
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 14:41:31 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b09887c-2eae-0a2a0a5409dd-0a2a450cad66-10
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 14:41:31 +0100
Received: from [40.93.196.33]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b098888-f479-0a2a450c0019-285dc4217891-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 14:41:30 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6469.namprd03.prod.outlook.com (2603:10b6:a03:398::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 13:41:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 13:41:26 +0000
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
 b=h1PH9TANz1j+Im14/aG8Tnc1wqSuZBSjES9Ca40mR1k11wdyMoFpa752v2SGqC1iNLJzmEcB5GiWrPv1PNiF0AzTVNPyohThNCyAqv/z7ABZakPO71X4Cn/xrvqMVnQaLGCLsjMUe2RoT803uiHbpVnAQHpJ6uDYJJ5ScAaNhafNrVGGtB1tKzABpg4fMzZJ8EDX5Ye/ICHwt4Nx1nEroUKUapXFmPy9a8eQKEh8GMhyP8AOd22zdJsqCAUpLKbYOFdixPvgXsN1TLHlwgiQQDE/a8cJGQ+5BeGPIhuZoLPf56BCR6vyIGfR8NNKJlR5rOSTW0szKKuCRwcctRzhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm1xLWl/yZUNvJNFrwbb8wnO+3695AqStrKImnLH2yc=;
 b=m25lcnHjK6+AqwXttrpvfg6Ve2pUC26oc4suv7EASzW4vQX7XgYKGXMmzl5p2TrYgjQ6e7hatoOHui4xWrlKNm0/8VL8U1rCf79WmNMk0sT+pmYHgnM0wuYtSuykZuWs0ok01wEtZtqtdKpV9gTzVr44ErlRhGudvGv7sYnIK2NlCjwfmglaQoCVCqy++bUi5hZPSz7UGlla+9h6YwqWqdB2fsCyLkyuIjLnlT9huUuch9jW/496RJxmfQ8pUWbc00mv+ncbjXg0dvizVdgWBQodOjUVhaT/V/leerGBAvuea7g06DxNfldekGC2WxiY4sXpKoMcZ3njhLEEVe784w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm1xLWl/yZUNvJNFrwbb8wnO+3695AqStrKImnLH2yc=;
 b=DBOxwmb/Zn3jIHEtVwmR6tPCRL8oO3OMRsFOu7kXqhGATtCBXN7Mx6kbHZ+YLoDvMcP2BFQUEkTpJxeb/g+kozBlzJZWQRG7OKPs1SB7DzkwBX960pZ9TYY96ClnnhZC+AiTR+UOp1ka3NSR09eQusaXBmsTn1jhHfE7pvXglOA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7fc6d36f-0ecd-4dcb-9745-56501cd7f387@citrix.com>
Date: Fri, 27 Nov 2026 13:41:22 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, roger@xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] xen/riscv: implement udelay()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Anandu Padinhare <Anandu.Padinhare@electrifex.com>
References: <MA0PR01MB92178FEAFBB95A225781351CFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <MA0PR01MB92176C8ABCF9CDCDD772D4C9FD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <1795785333.8631fc262581453bbf619ec5b2062170.1a21d259bfe000bb85@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1795785333.8631fc262581453bbf619ec5b2062170.1a21d259bfe000bb85@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: babfc640-6872-486c-0a27-08df4c8c224a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261026140227099003|261026121527099003|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Rg+3REeOy5Fu5VwvP3DDcVT+ppCKDrZf9pRIrQAjID2Vn+PzAOqs7P/GX+9RT0AbfyDw9HVJ2wcDks8ubOgnZq0R0NrTjMMi8591fF/zqvTAPVWtP4filcYfwbO2TPaLpOxinapPyKcC41I32O7kaXcmf5DNq5rU8qopEZjikVyG+aF/DM/jS1FNeJbT1PKwLh5Y15B9o/loSvfotEboyIpull9XuSw3182gfnn2g70/VlK0vrGWh+SxxTlhXNnXTFfVT0FfffhLqfFW61NuO95nST98+LW0h55iOeiuQJrKe7OIAhAO85JBn0uZcz9SVvlamGTj99IFO+pN2Bc1yZGwfeWpz0lzNjyrUx51DjZgCAgBROSHdH/zHyG8otI5J0ch0yrYFCi3OmBqCJd/4FzKOofSkZlYbtHLt4jDRgMiEaHQVCp16VJfF8a83W2ERAKxF/FQMJCLp4mTYsmC/X/e4h0369Srj7GzKWTUz8Xtp3CP6TezG4kFWq+OELyxAJNogNKaAKjL9luOZqNz299dkLYtAeBTfMQhNWemwyzhfhZzb7iqutfuqrzEWyMFnxo4gGQuMaA0iVcFLqEZCSv+vEwB4ARGMxens0xJ/C7IAs72wiFrACUy1sP48MSAU79QVqGsvMWhJTFn3Uhwkzqsk/4FCiIyVoxCTozAJjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261026140227099003)(261026121527099003)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmJNWkVLWlAvayt4K0t0Lzh5WGFlMjg5b3NVK0NpdmhZSmd1V2I2VXFjN09T?=
 =?utf-8?B?andYYUU0RWw2ald5TU5ydU5HK2VKVSt4c3o5Y1h6MDR6TXFaZkN2SFRXM1ZE?=
 =?utf-8?B?OXQzYlRkT29LKzJiRGhCRkQwajN1Vnc3VDNWTFM4U0M5dldTT0lvWEpJRUhk?=
 =?utf-8?B?aW5Senp1VGdOcE50VHhQZVFZWHJqS280ZmVzaEFjdDF1UDBuVy9Ja0R6VENM?=
 =?utf-8?B?UDhYb1B0TExGZHFKVXR3ZFVjL2djdEFGU3E3OTFXanh2MmRyVy9lamJ6dFJ1?=
 =?utf-8?B?U3pzRnhDT0VqalFrTWg4ZWw2UWtLWnYvc250cU9GcGt1YUQ0ZmdlSFdJellr?=
 =?utf-8?B?K2UvbnlXUkVyYlM1Z1VLUnZQM1hJanhCZDJIcityUVZhNVhlRWduTDBabVhZ?=
 =?utf-8?B?TE8yWU1RYTRSYjh1WXptbWQzNHZtdEJxU2RYWlFXUC9kbVpkaFNDUjFpRU9o?=
 =?utf-8?B?MkxDamJaUVdOcElpTW4rbkpVaW9qZ1BkaWh2bHFXcldJbnJwbDR5NlpuK3Iz?=
 =?utf-8?B?cVJaV1ZwLzd6WEpxRWpycGNzeWJRUi9aMVJ4WjdxTXZRVkJlUXlUZ3Z4Yitr?=
 =?utf-8?B?akF6REJmQ2wycE1jRm5oa2NyTG1XSEx5bWYrYk1ZVklqNEtjMTM2cC9RL1Vh?=
 =?utf-8?B?d3gyUEVZa3lraFplbUlucFlqWDFmVE1sTWFJWk13b0htVmw0MEUyQ09uMy9H?=
 =?utf-8?B?T1pwTU5rOS94eGZCc3Y5SngxeUR0U2RHQ0VPNDRYUTRWaGc1MnVvNGhVOVVU?=
 =?utf-8?B?OGE1VEV1VU1VaUpvR3h0dkFxMWRzM1N6L1hWQXNBTzJPYjMySldSM3RnREFJ?=
 =?utf-8?B?a21iUmNVbDA4TGsycGZxNUhlVUNqQ09WUmRrcWNzYkhvaHEzN3ZlSXVnelU0?=
 =?utf-8?B?V05YdE1NRkhwZkVpTnB0NHAwR1VoU1FldmlPdlhJZldBeGdhV05GY3NRaHkv?=
 =?utf-8?B?V055QzFKT0w4ZjE3M3A1OG11QkNrQW1hUzNkdFZubVREVFpmOXFJdW96b3VX?=
 =?utf-8?B?emdKWCtmQ0xTK1N6R0k0QWxrRk1qOG51MjlMd3RTeVI1TVgzcHU3Wm03dlpv?=
 =?utf-8?B?TVRUanRyeDIxc0kwSG5DYzI3bFdvaTZycG9zZ1RzaE4xT3h2M0lDWHFOM2d6?=
 =?utf-8?B?UVl1b0NqSjNpbnlCSjVHSnhVYkk1Q1hRZkxHcXhzYUYyYVRWdlhvTEY5cWp6?=
 =?utf-8?B?MVdDZG5memM3VGlqYmw1QXZNdTNxNG9JWXNxMGF3MEMxZW9OZGZKYllScG5z?=
 =?utf-8?B?NDdkMm9wSFFYa0VDdzJOdTAyWktmQUp2NWJJZU9uejhuRDBmS0N6aVYwbUdx?=
 =?utf-8?B?UnlJNUw1U3dESCtWRHJjSFdEWjQvQ0cwUzVWaDdleEw2WGQzTUpVaXJEVjlj?=
 =?utf-8?B?b1I1eUFFbWRic1dTOXQ5bUF0Ly83M29TZHZHT1JMWXJSVjJQdngvRythQ0xJ?=
 =?utf-8?B?L1RIN014MG1qVHhleExXOWltaVFQcjFiSHJ6QlM2U3pwOSsyNlF3MEM2aHhG?=
 =?utf-8?B?Q0JCdTBUUmE3T1BDK3ByYWhlMGc5c215NEtYVXVOVnFyeGRJNER5YWZQQW4w?=
 =?utf-8?B?RUsrb2h1SW81QUo5UDZGUDAvR29UcHdJeGhkaU9BMjM0dlFYZE5PdlljcEgv?=
 =?utf-8?B?aXFLVXJZWTBxZVhWb08yR05OdStlRTR1Uko1RG45eFJScisxb3IrU2tBTWRV?=
 =?utf-8?B?SWpLdjdaYzFVTmFUV1RTdVZSeVR3aGFxVnlPczVJT3JTU3hXUUZDOWVrYnBi?=
 =?utf-8?B?SkFNbktJNkpieU9YYWtzUmN0aVVXRVArMXBVbFZKN1ppc3Y1OEludG1IZlhY?=
 =?utf-8?B?ZDhEOGE0RGxhczlNc0NiYVRKRnF0bW04NThTbzhqU3dsT2RiRVRaQjk4aG5F?=
 =?utf-8?B?R3UyeUhCQzBvaDZicGNqVkpmVzlLNVVsZUp2akRtTzlORElTbWc2MHBiYi9C?=
 =?utf-8?B?SERQdVorUEo3UHI0U28zeGdFMWZYN01tbis1WVNSL2FBTGw4M3hZaXcxSWNq?=
 =?utf-8?B?T04yUWFyQ1BieU9EcWdzVjFmT2tmTWh0OU5naFBQSmd1NUNqM2Y0T0VJWWta?=
 =?utf-8?B?RHgxKzBDMGhibkZ5SCtuMzFsK1MzMEZFblZWcjF0ZEpLa2lZcnY3WnRWZUZj?=
 =?utf-8?B?amVZZm40anQyYVpWNTE5N2V0azF6U1hkKzdLK0RacHBQMFNBU1djWjRUV1Y5?=
 =?utf-8?B?UnByNjUyamdoZWUxUXRxSVd2VmxDNFpEeDRBRG54OUdGbUtWUTh4eVRZWkVX?=
 =?utf-8?B?LzdPSUxJSmdYVVNINWRvY0xGRGY3RUVtUEFqQk4vYkJqa1Z3ME1IN2gvelBI?=
 =?utf-8?B?cjB6YTN5WDFYREhxQis2MWFNQlovK3ZUSVA4cjJ5aHpQZ0NibmlCZi80QkVX?=
 =?utf-8?Q?YeDkw2cWvv0dzTPE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babfc640-6872-486c-0a27-08df4c8c224a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:41:26.5982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8PwP1aFI1Xpw1uNQaoeiKGRqIngEqZF+YpvX0NeR8Y6FhuunajA7L4pDFsny7fehhwi5dAaufUmyzYTYa70kFMyU/RsbdP6bMAjVoePcNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6469
X-purgate-ID: tlsNG-d25034/1795786891-5093EA5B-395A2BAD/0/0
X-purgate-type: clean
X-purgate-size: 754
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/2026 1:15 pm, Baptiste Le Duc wrote:
>> Convert the delay to timer ticks once, multiplying before dividing and
>> rounding up so that short delays aren't cut to zero ticks, then spin
>> until that many ticks have passed.
>>
>> cpu_khz is only set by preinit_xen_time(). Before that it is 0, so the
>> tick count is 0 and udelay() returns without waiting. This is also why
>> the loop doesn't use get_s_time(): it divides by cpu_khz, which is a
>> division by zero before then.
>>
>> Assisted-by: Claude
> Nit: according to sending-patches.pandoc the form should be Assisted-by:
> AGENT:MODEL, e.g. "Assisted-by: Claude:claude-opus-5-5".

We're in the process of changing that.  Don't worry too much about the
format.

~Andrew

