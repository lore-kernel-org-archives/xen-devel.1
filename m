Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20342606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 02:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=PzudfJyu
Received: from list by lists.xenproject.org with outflank-mailman.1467558.1676637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhMQ-0003ir-0v; Mon, 02 Nov 2026 02:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467558.1676637; Mon, 02 Nov 2026 02:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhMP-0003ij-UG; Mon, 02 Nov 2026 02:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1467558;
 Mon, 02 Nov 2026 02:01:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xNhMO-0003id-B8
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 02:01:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNhMN-007l1T-OJ
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 03:01:19 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7eed1-8faa-0a2a0a5109dd-0a2a450599e2-46
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:01:19 +0100
Received: from [52.101.70.72]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7eeef-4cb1-0a2a45050019-34654648ba53-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:01:19 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB9024.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:01:15 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:01:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUSBJLgn6IIQDkHO9EF+pw8FU4efZ8X/u56jLsVgvchwVc8tmzjYtFpteQ+qwN9voLpx1ndXBu4lDW59FuH4ZPp8aTzIN5Usp0hPrS1j+0EHwiXk745/4yIIs68EsZrWgNzoEDpeECSu3bJOIaMoIXQ0xtB5eQ9EIVuDw0hRN+SaAOA2mYEIu2LWoa8tfRL5rBc6vPVHQpjUBz6EYs5Px2oFTANPlMpDABGWArQbtyzK+wOXSKsfPqTpdRmjzKn4WAOtijDw5ygUyLhAcRgX5BHaKdrB+kDbqrfC3CGvvjR2uDFV2TZDRYqp6QToebKvRpmmXHk5Lw0UCo5d50DaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wk7KRVs2QZr05uX3Khp+MEse8kHs5gu+Lpo8+j89BdI=;
 b=UXe+ybDhqvqSs9uNSY1eQrOGB+3Kz/hagAHD44vztxIlh9GZBt1lAQxu90XbxpROcyI7on0wgQADF3enn1ga7WuJfpUzmjdGfhACptEQQsUYXMfYHeLyx3pSEB56UhEtembfOziHkQswCEDlB0Wf7bEUhNSjAjCcHOUxnV5hpfUYm6p43YxwRDmoktPM9++vHnEswASfXc1NR+SZ5s78OA1rxneYmDF3L19yVopzWeRIJCUhSzA3GnRWxkiSsckjWHyvXImlgoNJGl7Im16FysYLRJU8heKvpNXrAn0CFy7xOZY79D8DcsdjAIIZ/MzFKQdmaowFxHNx73HTnwoL9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wk7KRVs2QZr05uX3Khp+MEse8kHs5gu+Lpo8+j89BdI=;
 b=PzudfJyukf9TTtfA5L6DaYp9maj9jiRIZ5cgRLablnvDc5JYSiYJn2WGlkV/8IX/yBicFUTrdPDMTc9ksSXHyw4ZhGgiv8OJe+iwiwWN5EHNfxo8u231jvWvD5x+JHATBu0vBl8jrXFwtybJg6GmVcbgxaauwuYNClVpy+E0PjAYXVzxpfhp8GYVrc5S0O2iqSizPRI59rJ5uVv0BuR+ojk7gYNmENyOU1FkdXJT5/CxKJ74qJjfH3jsBTN4tCEnJtZ7lILTvhhYYir2eLVZmlnJSn67uHuhGpv4QwLA1DZk1/7TxHH5ux7pM7BDZMvkTl46YIsoGMBV+hlih7t7tg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8a95512f-2b7a-47e8-beb9-7c763dfaf101@epam.com>
Date: Mon, 2 Nov 2026 03:01:13 +0100
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v4 22/22] doc/arm: vIOMMU design document
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <da2b9469ffb63d8bb63c2b9bf14ebecfd56dea22.1791328190.git.milan_djokic@epam.com>
 <1396633e-8e1b-4ceb-82e4-f5b0b40eae0c@gmail.com>
Content-Language: en-US
In-Reply-To: <1396633e-8e1b-4ceb-82e4-f5b0b40eae0c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AM8P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::13) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 23684029-35ed-44f9-a655-08df38852d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|260925022911599003|260925021311599003|260925021911599003|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261026135527099003|261021121427099003|261021123027099003|261021133027099003|261021130227099003|261021135927099003|261026121527099003|261026140227099003|261026130827099003|261022115727099003|261022113327099003|261022075727099003|261022105027099003|10067099003|32116099003|22082099003|18002099003|6133799003|3023799007|4133799003;
X-Microsoft-Antispam-Message-Info:
	+oD9EkDpq8NAQbvIB6UhTuPUFPr/Uy4DgYBHZ6mhvmeI0VXxu4ayGItHWoRl0Sv+ceE0OSQOUh7YQKBEbua9kGtSztgk1+V0DA50h3vEz2yoJNcbTtwUyhl3Rl6zlY2JXemJ+mJ30Ermnr6H3F2HH2U4q7LkY/odP6V8S1RROQnHvS5mlnRbRiAkl7BmZRH6LqJPAZ0GUbERJzuC05vwyHibCTlLK8MqrXf3++Zu13lxmD66eq6sEOcSG5BfakUaCtHX6SQaHF5uP5Mdc9zBYm+jmtGHpIqNNCIhHYMGN6mYmRZoapw2T1Je3Swv2l6lMaRZJwoaf4IQLGlYUb3kagPF+2yEm7ZWumF6F6L3KPEHiW/44HjjXt+/szi+c1ItJw6LAikEY//YDmOD6GvGw1Ims2A/oNUViIZC0lK/XGUIZhV4qwisgzw+IAFEfrQud5LLzonZAy6Wl2qhfuWZtsXpyGQEu7/L6RlM1EDQh61qb6TRMgrO2FkUIlabaePpTq5EQBphBHHfZADUqDxNdIUeqoeRKbvKDFblsbdg1MzffaE3+SlY6iHiEVPhLUgWEg8Z6opwmJhFDW0x8F5KkVQtzGZOsHIROVujfNiHobX1PXh42oGs4fGuWy/zbMYy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261026135527099003)(261021121427099003)(261021123027099003)(261021133027099003)(261021130227099003)(261021135927099003)(261026121527099003)(261026140227099003)(261026130827099003)(261022115727099003)(261022113327099003)(261022075727099003)(261022105027099003)(10067099003)(32116099003)(22082099003)(18002099003)(6133799003)(3023799007)(4133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0t1ZnpTU21LY20vdUZ6b003cEY4T0ROY0ZHNkpmeE9HVWU2UGNST1FpMEtT?=
 =?utf-8?B?ZkdEb0ZZaXB2MDY4eXVXRWRLcUptQUdzQ1FPQk5nMFNVRHErVWNKSm5HK0tL?=
 =?utf-8?B?TmorT0F5VTdxQ3J2Tit3NkVGOFc1b2pFTDFuTEFsWWVvakNrY0JjZ3gxQ2xh?=
 =?utf-8?B?OC9JNmhQOWEwTkkrc3FBUXBPeDR3ZllQYW9yZDdKQkVyT2RKUUNtL2ZOd3hM?=
 =?utf-8?B?RkVXVm93NnJWcjZIdnlZNjlzb3pKUzkvMEoyK2phYm0vWS91QW5jYkkzQjRu?=
 =?utf-8?B?UjVsU2FyL2o4eEFBWVZ6Rld2S3BUUDc1WVY3WkxXSnBicnNwZzhNeVVjZ2Nw?=
 =?utf-8?B?Y0lSSngzeFJrR3lUeTVIaXl3WmVTdXR0NUJjZWJZQ1FDd04vNTFZVWNEelR4?=
 =?utf-8?B?OWlBZWg5ZUVneTMvdE1iMHRkdTdvbjV2cGRqem85M0t1OEx5bmM3dkVpSWhG?=
 =?utf-8?B?K2RwdTh4MjEvb1VUalgyYWZ0d3JGenNRditSUHd0eXhZZWI2aUh0a21xVjhl?=
 =?utf-8?B?TmpEQk1oQzhtVTRXYVlQOFJFb1cyRDAwdmJOdyt0K28yVWdRYUVBbDhGUklQ?=
 =?utf-8?B?TEZNVjIxZ3FycjZxV1V2YkVXTHpPUGZRdWdJN2NjUWV5Ry92L2JBV016cDdr?=
 =?utf-8?B?MEh4UnpmSElyL0RhRXI0ZGRoLzIyUUhOZHFDT2hFRWxSdW8rSFoyYUo3RVhW?=
 =?utf-8?B?clQvbWlIUGI1NmhrM3pST3A5TlZQZ0JWbXVlRG9DYytIY1lDSnFaRUtOa3hN?=
 =?utf-8?B?QlZWUnRnWnp1empYc1g2Q0VzZ2F1OFdGY1d2ZkVWVm1seVBmeUplRXBlTFBy?=
 =?utf-8?B?ZjhHNmFkSm5qZzZ4U2hmSTEvektwUkZ0STV6V1lJZjJqRnJQZkkvNzN3MWpU?=
 =?utf-8?B?ZjhhRzVpbVp3WDRhRC8yWXlrZTIxUzNXNnl2Y2wrUGpXUHRpcFJoOVYyZW9J?=
 =?utf-8?B?Ym1MQnF4V1pIZ2ZHUlFYTDdYb2VUODNTMmQvQ21ncXYzMEp0ckxKbU1weWFG?=
 =?utf-8?B?R3pmcWUwN0JiSlp0TkhxUFgwck5nVGJSVUt3V1djSVl4dTRVc2w1Z2FLUStY?=
 =?utf-8?B?eFdVRUhLV3NWQlZPOXI1dXJZZ1NtZExqemQwVzg5bUJxRUhJUEJ6K29Kc2hZ?=
 =?utf-8?B?YkFSbnBITzFXb1czVDZyMlVBK2lmV25qVlFWZmtVVDRBWlloS0hkTnZONjhh?=
 =?utf-8?B?b1plVlFlRllIK0ZoOHNwU3VNLzlaSFdqS0h3Y0NxZjNYSjVRZE1TdENYUGE2?=
 =?utf-8?B?RUttVGlCRm5CZG9vR0dlMDhMWE45b3VPZUJnYzdOMk9YdFFoSEx3dU8wVUtT?=
 =?utf-8?B?aUU3VVBNWGw5eHZhaVRjVDdIbzNpVENtMGJvclNTdHhGMnhNQ1pPZ3RUSnJZ?=
 =?utf-8?B?OFVoUTIyVXhGOG1ab0k4WEdGWWR5VkRnVk5xSVhiQ0FBU2h6MUpoc2psRlRx?=
 =?utf-8?B?c1k5U0ZaV1dydVhsbHJTZERBUE1QcUJFVXd4ZzNZZ3JmdDY4SXRVSlhOZ2Ro?=
 =?utf-8?B?YmtLZzJDam1hTDZxcXYwakhVSHc5Nk51SHJnMlRHRGtZVWNIL244VTZ3K01U?=
 =?utf-8?B?NngwQU1yditINW05THhkK05rY3NwWUN5bStwZWorbml3b1U1MU9GcEJWVXA2?=
 =?utf-8?B?ZzltOGRub2ZuSm03RUl1c2JKZVJtVUQrbkY3UXBsdlhRbC9rcjBRYVJGY0J4?=
 =?utf-8?B?QUlpUk5pSzFINU9KanZwb3Q2TEVQTGZlb1dWengxUVZOUkxoT3F5b1Y4elZx?=
 =?utf-8?B?SnJ3K2x2RVlmejZVZE5uZTRxQ09hYlhtaXRtRTZYT1A2ZDRBMnc1OE5DRElV?=
 =?utf-8?B?N01TWXpGSm5BWDZObS9VaFE0MzNDNEN5dStEb3ViMExZMjMxT1BFQVZNQ2Fq?=
 =?utf-8?B?dVBRSTZORjhuekl4bm9DVzhnZVJ5V2NaSzUxdUhJQzAraVRSVHFEZEhDcEVn?=
 =?utf-8?B?MW9iVHZuT3R3NndrdXU3MkNLSU5ySzM0a1pBTDAvYkpHN3JUbFp6cDdnSG9q?=
 =?utf-8?B?MkZoZEdQL0J5d3hZcjFBTXpkVW9YdlliRENPTDdSUC81NllrU0FOVVFGeUdz?=
 =?utf-8?B?RVdEVzVCZC85UEdSWVlEeGdocGd3ZzZwbldSZ1BQL0Z5K0xFVVJjZllMOGlo?=
 =?utf-8?B?NndYVDdlcVlrUmFDL3c3RzJhVmV6bGV2Q0QyaHBqdTZ1dnZKYTAyNEI2MFVO?=
 =?utf-8?B?TnYxTTZpMDVTZ2FOUWNmMWZjcHo4YmdqclE4d1J2K2VVNUdkeThDZ1BuMkU5?=
 =?utf-8?B?RElyR0NTQVAxNm1ZV1h5Y1ZML3hOeTU3bUF6bTN1WndmcU9Pb3NKRjdqNEJi?=
 =?utf-8?B?WU5sZXFGeXgxenVtMXNOME5kWTJTVGRXak0vNGZsbkNlUlZuemhmQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23684029-35ed-44f9-a655-08df38852d36
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:01:15.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dcfA4toTOXUmmYENcn+aycI78ArKc3eLFvu25GfDzN9fZR9EW0YnOV9OqOUsRi0eYZKsJ7hrNEIty2Xs22+GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9024
X-purgate-ID: tlsNG-c201ff/1793584879-F68B62A1-EE82842B/0/0
X-purgate-type: clean
X-purgate-size: 22338
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksandr,

On 10/10/26 17:16, Oleksandr Tyshchenko wrote:
> 
> 
> On 10/7/26 03:08, Milan Djokic wrote:
> 
> Hello Milan
> 
> 
>> This document outlines the design of the emulated IOMMU,
>> including supported features, security considerations
>> and future improvements.
>>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    docs/designs/arm-viommu.rst | 502 ++++++++++++++++++++++++++++++++++++
>>    1 file changed, 502 insertions(+)
>>    create mode 100644 docs/designs/arm-viommu.rst
>>
>> diff --git a/docs/designs/arm-viommu.rst b/docs/designs/arm-viommu.rst
>> new file mode 100644
>> index 0000000000..c68e771711
>> --- /dev/null
>> +++ b/docs/designs/arm-viommu.rst
>> @@ -0,0 +1,502 @@
>> +==========================================================
>> +Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
>> +==========================================================
>> +
>> +:Author:     Milan Djokic <milan_djokic@epam.com>
>> +:Date:       2026-02-13
>> +:Status:     Draft
>> +
>> +Introduction
>> +============
>> +
>> +The SMMUv3 supports two stages of translation. Each stage of translation
>> +can be
>> +independently enabled. An incoming address is logically translated from
>> +VA to
>> +IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
>> +the output PA. Stage 1 translation support is required to provide
>> +isolation between different
>> +devices within OS. XEN already supports Stage 2 translation but there is no
>> +support for Stage 1 translation.
>> +This design proposal outlines the introduction of Stage-1 SMMUv3 support
>> +in Xen for ARM guests.
> 
> Look like this doc does not mention the stage-1-only fallback.
> 

Yes, this is missing. I will add details on the stage-1-only mode.

> 
>> +
>> +Motivation
>> +==========
>> +
>> +ARM systems utilizing SMMUv3 require stage-1 address translation to
>> +ensure secure DMA and
>> +guest managed I/O memory mappings.
>> +With stage-1 enabled, guest manages IOVA to IPA mappings through its own
>> +IOMMU driver.
>> +
>> +This feature enables:
>> +
>> +- Stage-1 translation for the guest domain
>> +- Device passthrough with per-device I/O address space
>> +
>> +Design Overview
>> +===============
>> +
>> +These changes provide emulated SMMUv3 support:
>> +
>> +- **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support
>> +  in SMMUv3 driver.
>> +- **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1
>> +  handling.
>> +- **Register/Command Emulation**: SMMUv3 register emulation and command
>> +  queue handling.
>> +- **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to
>> +  device trees for dom0 and dom0less scenarios.
>> +- **Build Configuration**: Introduces a Kconfig arguments
>> +  (CONFIG_ARM_VIRTUAL_IOMMU, CONFIG_VIRTUAL_ARM_SMMU_V3) for build-time
>> +  enablement.
>> +
>> +Depending on the domain type, the emulated IOMMU model is the following:
>> +
>> +- For the hardware domain, the host layout is re-used. The number of exposed
>> +  IOMMUs to hardware domain is equal to number of physical IOMMUs
>> +  present (1-1 mapping).
>> +- For non-hardware domain, a single vIOMMU device is exposed to the guest and
>> +  mapped to one or more physical IOMMUs through a Xen-managed translation layer
>> +
>> +The vIOMMU feature provides a generic framework together with a backend
>> +implementation specific to the target IOMMU type. The backend is responsible
>> +for implementing the hardware-specific data structures and command handling
>> +logic (currently only SMMUv3 is supported).
>> +
>> +This modular design allows the stage-1 support to be reused
>> +for other IOMMU architectures in the future.
>> +
>> +vIOMMU architecture
>> +===================
>> +
>> +Responsibilities:
>> +
>> +Guest:
>> + - Configures stage-1 via vIOMMU commands.
>> + - Handles stage-1 faults received from Xen.
>> +
>> +Xen:
>> + - Emulates the IOMMU interface (registers, commands, events).
>> + - Provides vSID->pSID mappings.
>> + - Programs stage-1/stage-2 configuration in the physical IOMMU.
>> + - Propagate stage-1 faults to guest.
>> +
>> +The stage-1 context is shared between streams assigned to the same device.
>> +This follows the Linux SMMUv3 driver model, where the IOMMU domain is associated
>> +with the master/device, while the individual SIDs are represented by separate
>> +STEs pointing to the same translation context. This is considered sufficient for
>> +the current SMMUv3 driver model, although the SMMUv3 architecture does not
>> +forbid having separate translation contexts for different SIDs.
>> +
>> +vIOMMU commands and faults are transmitted between guest and Xen via
>> +command and event queues (one command/event queue created per guest).
>> +
>> +vIOMMU command Flow:
>> +
>> +::
>> +
>> +    Guest:
>> +        smmu_cmd(vSID, IOVA -> IPA)
>> +
>> +    Xen:
>> +        trap MMIO read/write
>> +        translate vSID->pSID
>> +        store stage-1 state
>> +        program pIOMMU for (pSID, IPA -> PA)
>> +
>> +All hardware programming of the physical IOMMU is performed exclusively by Xen.
>> +
>> +vIOMMU Stage-1 fault handling flow:
>> +
>> +::
>> +
>> +    Xen:
>> +        receives stage-1 fault
>> +        triggers vIOMMU callback
>> +        injects virtual fault
>> +
>> +    Guest:
>> +        receives and handles fault
>> +
>> +Register access
>> +---------------
>> +
>> +Guest accesses to SMMUV3 registers are trapped via MMIO regions. vIOMMU emulates
>> +a subset of SMMUv3 registers relevant to currently supported features.
>> +Unsupported registers are handled as RAZ (Read-As-Zero) and WI (Write-Ignored)
>> +for the register read and write operations, respectively.
>> +
>> +vSMMUv3 is a partially emulated resource for the guest domain. Some
>> +feature register bits (SMMU_IDR) are reflecting what the underlying HW actually
>> +support while the rest is preset in the emulation layer to limit guest from
>> +using features which are not supported by the emulation. Also, implementer
>> +identification register is fully emulated, providing generic ARM implementer
>> +ID values, to avoid activating errata/quirk paths in the guest SMMUv3 driver.
>> +
>> +Supported SMMUv3 Commands
>> +-------------------------
>> +
>> +The vIOMMU implementation currently supports a subset of the SMMUv3
>> +architectural command set required for stage-1 translation management.
>> +
>> +Commands are submitted by the guest through the virtual Command Queue
>> +(CMDQ) and consumed by Xen, which translates them into operations on the
>> +physical SMMUv3 hardware.
>> +
>> +Some commands are fully handled by the emulation layer, while others are
>> +currently treated as architectural no-ops because the required behavior
>> +is either implicitly guaranteed by Xen or not yet modeled explicitly.
>> +
>> +Emulation handled commands:
>> +
>> +- CMD_CFGI_STE
>> +- CMD_TLBI_NH_ASID
>> +- CMD_TLBI_NSNH_ALL
>> +- CMD_TLBI_NH_VA
>> +
>> +No-op/Implicitly handled commands:
>> +
>> +- CMD_SYNC
>> +- CMD_PREFETCH_CFG
>> +- CMD_CFGI_CD
>> +- CMD_CFGI_CD_ALL
>> +- CMD_CFGI_ALL
>> +
>> +Command Handling Model
>> +----------------------
>> +
>> +The guest submits commands through the virtual CMDQ interface.
>> +
>> +Xen:
>> +
>> +- Validates commands
>> +- Translates virtual identifiers (vSID->pSID) where required
>> +- Programs the physical SMMU
>> +- Performs synchronization
>> +
>> +The physical SMMU executes the resulting invalidation or configuration
>> +operations.
>> +
>> +Unsupported Commands
>> +--------------------
>> +
>> +Commands associated with currently unsupported architectural features
>> +are not implemented.
>> +
>> +This includes commands related to:
>> +
>> +- PRI
>> +- ATS
>> +- Address/Range TLB invalidation (currently, all TLBI commands perform complete
>> +  domain TLB invalidation)
>> +- Advanced stall/retry semantics
>> +- CD runtime update/sync
>> +
>> +vSID Mapping Layer
>> +------------------
>> +
>> +Each non-hardware domain-visible Stream ID (vSID) is mapped by Xen to a physical
>> +Stream ID (pSID). The mapping is maintained per-domain. The allocation policy
>> +guarantees vSID uniqueness within a domain while allowing reuse of pSIDs for
>> +different pIOMMUs.
>> +
>> +* Platform devices receive individually allocated vSIDs.
>> +* PCI devices receive a contiguous vSID range derived from RID space.
>> +
>> +
>> +Supported Device Model
>> +======================
>> +
>> +Currently, the vIOMMU framework supports only devices described via the
>> +Device Tree (DT) model. This includes platform devices and basic PCI
>> +devices support instantiated through the vPCI DT node. ACPI-described
>> +devices are not supported.
>> +
>> +Guest assigned platform devices are mapped via `iommus` property:
>> +
>> +::
>> +
>> +    <&pIOMMU pSID> -> <&vIOMMU vSID>
>> +
>> +PCI devices use RID-based mapping via the root complex `iommu-map`:
> 
> I failed to find iommu-map generation in libxl or dom0less.
> 

PCI-related vIOMMU support is excluded from this patch series to reduce
the number of patches, this is outlined in the cover letter. It will be 
submitted as a follow-up series. I've kept the relevant design details 
in the documentation, but the implementation will be provided separately.

> 
>> +
>> +::
>> +
>> +    <RID-base &viommu vSID-base length>
>> +
>> +PCI Topology Assumptions and Constraints:
>> +
>> +- RID space must be contiguous
>> +- Pre-defined continuous pSID space (0-0x1000)
>> +- No runtime PCI reconfiguration
>> +- Single root complex assumed
>> +- Mapping is fixed at guest DT construction
>> +
>> +Constraints for PCI devices will be addressed as part of the future work on
>> +this feature.
>> +
>> +Security Considerations
>> +=======================
>> +
>> +Stage-1 translation provides isolation between guest devices by
>> +enforcing a per-device I/O address space, preventing unauthorized DMA.
>> +With the introduction of emulated IOMMU, additional protection
>> +mechanisms are required to minimize security risks.
>> +
>> +1. Observation:
>> +---------------
>> +Support for Stage-1 translation in SMMUv3 introduces new data structures
>> +(`s1_cfg` alongside `s2_cfg`)
>> +and logic to write both Stage-1 and Stage-2 entries in the Stream Table
>> +Entry (STE), including an `abort`
>> +field to handle partial configuration states.
>> +
>> +**Risk:**
>> +Without proper handling, a partially applied configuration
>> +might leave guest DMA mappings in an inconsistent state, potentially
>> +enabling unauthorized access or causing cross-domain interference.
>> +
>> +**Mitigation:** *(Handled by design)*
>> +This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to
>> +STE and manages the `abort` field - only considering
>> +configuration if fully attached. This ensures  incomplete or invalid
>> +device configurations are safely ignored by the hypervisor.
> 
> 
> Please see a potential bypass issue in commit #11/22
> 

Yes, this will be addressed in the next version.

>> +
>> +2. Observation:
>> +---------------
>> +Guests can now invalidate Stage-1 caches; invalidation needs forwarding
>> +to SMMUv3 hardware to maintain coherence.
>> +
>> +**Risk:**
>> +Failing to propagate cache invalidation could allow stale mappings,
>> +enabling access to old mappings and possibly
>> +data leakage or misrouting between devices assigned to the same guest.
>> +
>> +**Mitigation:**
>> +The guest must issue appropriate invalidation commands whenever
>> +its stage-1 I/O mappings are modified to ensure that translation caches
>> +remain coherent.
>> +
>> +3. Observation:
>> +---------------
>> +Introducing optional per-guest enabled features (`viommu` argument in xl
>> +guest config) means some guests
>> +may opt-out.
>> +
>> +**Risk:**
>> +Guests without vIOMMU enabled (stage-2 only) could potentially dominate
>> +access to the physical command and event queues, since they bypass the
>> +emulation layer and processing is faster comparing to vIOMMU-enabled guests.
>> +
>> +**Mitigation:**
>> +Audit the impact of emulation overhead effect on IOMMU processing fairness
>> +in a multi-guest environment.
>> +Consider enabling/disabling stage-1 on a system level, instead of per-domain.
>> +
>> +4. Observation:
>> +---------------
>> +Guests have the ability to issue Stage-1 IOMMU commands like cache
>> +invalidation, stream table entries
>> +configuration, etc. An adversarial guest may issue a high volume of
>> +commands in rapid succession.
>> +
>> +**Risk:**
>> +Excessive commands requests can cause high hypervisor CPU consumption
>> +and disrupt scheduling,
>> +leading to degraded system responsiveness and potential
>> +denial-of-service scenarios.
>> +
>> +**Mitigation:**
>> +
>> +- Implement vIOMMU commands execution restart and continuation support:
>> +
>> +  - Introduce processing budget with only a limited amount of commands
>> +    handled per invocation.
>> +  - If additional commands remain pending after the budget is exhausted,
>> +    defer further processing and resume it asynchronously, e.g. via a
>> +    per-domain tasklet.
>> +
>> +- Batch multiple commands of same type to reduce emulation overhead:
>> +
>> +  - Inspect the command queue and group commands that can be processed
>> +    together (e.g. multiple successive invalidation requests or STE
>> +    updates for the same SID).
>> +  - Execute the entire batch in one go, reducing repeated accesses to
>> +    guest memory and emulation overhead per command.
>> +  - This reduces CPU time spent in the vIOMMU command processing loop.
>> +    The optimization is applicable only when consecutive commands of the
>> +    same type operate on the same SID/context.
>> +
>> +5. Observation:
>> +---------------
>> +Some guest commands issued towards vIOMMU are propagated to pIOMMU
>> +command queue (e.g. TLB invalidate).
>> +
>> +**Risk:**
>> +Excessive commands requests from abusive guest can cause flooding of
>> +physical IOMMU command queue,
>> +leading to degraded pIOMMU responsiveness on commands issued from other
>> +guests.
>> +
>> +**Mitigation:**
>> +
>> +- Batch commands that are propagated to the pIOMMU command queue and
>> +  implement batch execution pause/continuation.
>> +  Rely on the same mechanisms as in the previous observation
>> +  (command continuation and batching of pIOMMU-related commands of the same
>> +  type and context).
>> +- If possible, implement domain penalization by adding a per-domain budget
>> +  for vIOMMU/pIOMMU usage:
>> +
>> +  - Apply per-domain dynamic budgeting of allowed IOMMU commands to
>> +    execute per invocation, reducing the budget for guests with
>> +    excessive command requests over a longer period of time
>> +  - Combine with command continuation mechanism
>> +
>> +6. Observation:
>> +---------------
>> +The vIOMMU feature includes an event queue used to forward IOMMU events
>> +to the guest (e.g. translation faults, invalid Stream IDs, permission errors).
>> +A malicious guest may misconfigure its IOMMU state or intentionally trigger
>> +faults at a high rate.
>> +
>> +**Risk:**
>> +Occurrence of IOMMU events with high frequency can cause Xen to flood the
>> +event queue and disrupt scheduling with
>> +high hypervisor CPU load for events handling.
>> +
>> +**Mitigation:**
>> +
>> +- Implement fail-safe state by disabling events forwarding when faults
>> +  are occurred with high frequency and
>> +  not processed by guest:
>> +
>> +  - Introduce a per-domain pending event counter.
>> +  - Stop forwarding events to the guest once the number of unprocessed
>> +    events reaches a predefined threshold.
>> +
>> +- Consider disabling the emulated event queue for untrusted guests.
>> +- Note that this risk is more general and may also apply to stage-2-only
>> +  guests. This section addresses mitigations in the emulated IOMMU layer
>> +  only. Mitigation of physical event queue flooding should also be considered
>> +  in the target pIOMMU driver.
>> +
>> +7. Observation:
>> +---------------
>> +vIOMMU `CFGI_STE` commands can trigger serialized STE programming on the pIOMMU
>> +while `xen_domain->lock`, `devices_lock` and `cmd_queue_lock` are held, with
>> +local interrupts disabled. STE programming may issue multiple polling CMD_SYNC
>> +operations, each with a one-second timeout.
>> +
>> +**Risk:**
>> +An abusive guest can issue CFGI_STE commands that cause multiple CMD_SYNC
>> +operations to reach their polling timeout. This can keep a pCPU with interrupts
>> +disabled for a significant period of time, delaying interrupt handling and
>> +potentially degrading the responsiveness of Xen and other domains running on
>> +the same pCPU.
>> +
>> +**Mitigation:**
>> +
>> +- Implement pinning or otherwise maintaining the lifetime of the required
>> +  objects before releasing the relevant locks, allowing the
>> +  serialized STE programming to be performed without holding locks and with
>> +  local interrupts enabled.
>> +- Consider redesigning the SMMUv3 command processing and locking model in
>> +  future improvements to avoid performing potentially long-running pIOMMU
>> +  operations while holding locks and with local interrupts disabled.
>> +
>> +Performance Impact
>> +==================
>> +
>> +With iommu stage-1 and nested translation inclusion, performance
>> +overhead is introduced comparing to existing,
>> +stage-2 only usage in Xen. Once mappings are established, translations
>> +should not introduce significant overhead.
>> +Emulated paths may introduce moderate overhead, primarily affecting
>> +device initialization and event/command handling.
>> +Testing is performed on Renesas R-Car platform.
>> +Performance is mostly impacted by emulated vIOMMU operations, results
>> +shown in the following table.
>> +
>> ++-------------------------------+---------------------------------+
>> +| vIOMMU Operation              | Execution time in guest         |
>> ++===============================+=================================+
>> +| Reg read                      | median: 645ns, worst-case: 2us  |
>> ++-------------------------------+---------------------------------+
>> +| Reg write                     | median: 630ns, worst-case: 1us  |
>> ++-------------------------------+---------------------------------+
>> +| Invalidate TLB                | median: 2us, worst-case: 10us   |
>> ++-------------------------------+---------------------------------+
>> +| Invalidate STE                | median: 5us worst_case: 100us   |
>> ++-------------------------------+---------------------------------+
>> +
>> +With vIOMMU exposed to guest, guest OS has to initialize IOMMU device
>> +and configure stage-1 mappings for the devices
>> +attached to it.
>> +Following table shows initialization stages which impact stage-1 enabled
>> +guest boot time and compares it with
>> +stage-1 disabled guest.
>> +
>> +NOTE: Device probe execution time varies depending on device complexity.
>> +A USB host controller was selected as the test device in this case.
>> +
>> ++---------------------+-----------------------+------------------------+
>> +| Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
>> ++=====================+=======================+========================+
>> +| IOMMU Init          | ~10ms                 | /                      |
>> ++---------------------+-----------------------+------------------------+
>> +| Dev Attach / Mapping| ~100ms                | ~90ms                  |
>> ++---------------------+-----------------------+------------------------+
>> +
>> +For devices configured with dynamic DMA mappings, DMA allocate/map/unmap
>> +operations performance is
>> +also impacted on stage-1 enabled guests.
>> +Dynamic DMA mapping operation trigger emulated IOMMU functions like mmio
>> +write/read and TLB invalidations.
>> +
>> ++---------------+---------------------------+--------------------------+
>> +| DMA Op        | Stage-1 Enabled Guest     | Stage-1 Disabled Guest   |
>> ++===============+===========================+==========================+
>> +| dma_alloc     | median: 20us, worst: 5ms  | median: 8us, worst: 60us |
>> ++---------------+---------------------------+--------------------------+
>> +| dma_free      | median: 500us, worst: 10ms| median: 6us, worst: 30us |
>> ++---------------+---------------------------+--------------------------+
>> +| dma_map       | median: 12us, worst: 60us | median: 3us, worst: 20us |
>> ++---------------+---------------------------+--------------------------+
>> +| dma_unmap     | median: 400us, worst: 5ms | median: 5us, worst: 20us |
>> ++---------------+---------------------------+--------------------------+
>> +
>> +Testing
>> +=======
>> +
>> +- QEMU-based ARM system tests for Stage-1 translation.
>> +- Actual hardware validation to ensure compatibility with real SMMUv3
>> +  implementations.
>> +- Unit/Functional tests validating correct translations (not implemented).
>> +
>> +Migration and Compatibility
>> +===========================
>> +
>> +This optional feature defaults to disabled (CONFIG_ARM_VIRTUAL_IOMMU=n,
>> +CONFIG_VIRTUAL_ARM_SMMU_V3=n).
>> +
>> +Future improvements
>> +===================
>> +
>> +- Implement the proposed mitigations to address security risks that are
>> +  not covered by the current design
>> +  (events batching, commands execution continuation)
>> +- PCI support
>> +- Support for other IOMMU HW (Renesas, RISC-V, etc.)
>> +
>> +References
>> +==========
>> +
>> +- Original feature implemented by Rahul Singh:
>> +
>> +https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/
>> +
>> +- SMMUv3 architecture documentation
>> +- Existing vIOMMU code patterns (KVM, QEMU)
>> \ No newline at end of file
> 


