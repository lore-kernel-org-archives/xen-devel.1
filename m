Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA041606A327
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=dVRXO1I1
Received: from list by lists.xenproject.org with outflank-mailman.1467567.1676657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhN6-0004Tz-J3; Mon, 02 Nov 2026 02:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467567.1676657; Mon, 02 Nov 2026 02:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhN6-0004Ts-Ep; Mon, 02 Nov 2026 02:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1467567;
 Mon, 02 Nov 2026 02:02:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xNhN5-0004RT-7h
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 02:02:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNhN4-00Fi8p-Km
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 03:02:02 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7eef9-e002-0a2a0a5209dd-0a2a450aab00-16
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:02:02 +0100
Received: from [52.101.83.110]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7ef1a-f2d2-0a2a450a0019-3465536e321f-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:02:02 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB9024.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:01:59 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:01:59 +0000
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
 b=GDa2RI/nSJ/+0rBk1f+3cPgvOjsJ7Umms7D3xyYRWNTarw3Eqy16xxmgAtWzFgS+1Wu035HGUcg7jXW4+TXRK9Zia+Wxmbx/VXPn0af/M82wxKw8gONfCk3+IN4hUBAjBre28JSocRlH5pYaE61OrT3GtFTDDfe8+b/NRQ8RIWTcPnVuHagjpTCC9J+IS7j5HcURs6fEpijoXJ4E/X0OyQliX6DH4sAk+6/0zL3lKk0SCYkIQViDrCi3U6jhUbt/PimJzfsW0BHWm9crwb1P8leJ6daS60eaf9bKbQyitwM/uHqUB8bW1FfrZibPLdSkfZiCtWA443BfnNfSiqP2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EsK/WzkCLVQ9Z8a/nTEAKlBdSIdPGwUe8Qt4OvtfSY=;
 b=RSsa98ji6kXbkTb0eg+azhb+yCeQuFZLudPfkvzgOBaIdvdqI2yIKSdxK3Urs25iB30O4oQh4nckejzZtyqIqOhl+6Evg4P2asqFfBEYdFipWtSUB/enEA4Xf5WtgVmK+EmDdm8PoZpvzaB5lM4es8HRRIbJVxxtE38DuJqt3mgsTPwjnllOMkbZO3uVsw2UxFmPPkba2ylAjDOitF9Raai/HRETZLftbyK7QWIyOVHZscHwx0n5QXXQuO3QhA3dasuAixbtc3Js49bndKlMHJNBUDPKAohP1A712sI4USaLsCoaLng/xQEeQblYX9ZhIfsIrJHgyZJVoX2O0uwP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EsK/WzkCLVQ9Z8a/nTEAKlBdSIdPGwUe8Qt4OvtfSY=;
 b=dVRXO1I1yUTBEbQiRMRsR7gI4hBd7IUSR4wEZX0xcnCatABli7UPBSrSg+lnoafweXOHJIAVSBkird+rhMsM/boyC22FGpoRrvZmPINQb/svEnP13GXMmlziLk0Eytg+Cky/XoefjyfClhonFysFQshjHg5acnva9F1o0Xo+B+LGK3t1I1IRWdCS4Y0fOSYcP50wk37YpEKvYQArTh2TGjFx8X2DvyQPwWIDMtVAcmeIMcVzysaIiZatyDlRyQYRycgLjsW8ieG1YKKv2pgiMEPZWTDBhaPYBAdFo68FMsiRwDYFx6Aahl9IhEWpmQl1npRd5J/JLDnOtVIpgU4EsA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0dde4c33-cc9c-4b9a-a158-48cff857c177@epam.com>
Date: Mon, 2 Nov 2026 03:01:58 +0100
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v4 20/22] xen/arm: vIOMMU vSID->pSID mapping layer
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <a559fb6eca6befc043ab9a7eacf36f470ed01050.1791328190.git.milan_djokic@epam.com>
 <d997e441-5697-4b13-8a49-e07838d83de1@gmail.com>
Content-Language: en-US
In-Reply-To: <d997e441-5697-4b13-8a49-e07838d83de1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::26) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 912f2a21-a0de-4858-cdf9-08df388547cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fFCbf1UJD06644Eu1lWOBi1dliw/Qv06VjCHBM+InLOlnUXT9Loitg9bgS4/4jB/oud2AfPJyLtEedJKDhHGTHIoaNlh8PNEj+fMcE02hfiQI/OcfcdWTU0kJVAZe9NCUo40291jAJL6W+aQuhL9H9ovTGOhk+/V693mQOhplXyVrr/a2FD7CSNjAGyLwIANsVfVmVBWstiPPtx/WOor+wFJTe0iH03zMRDtOz1EkeShPY8OR9N+X8qpG7OikPav8jjURDR05voGcyqVyB50SnU8QxjwXD6kFIBGXTzbTHhijl2BEKuGS52axlEfWynekgNyVpuTp52WP5mzt7awInJ+uAfWDxyX1bpPn3rt8fqT9InpXdK5LjrVFneUEPevwyw99HgIwoxlVo7B8xgt0j2uVAc084kjGP8oTNMMjUPxozGYXYYBrrhkmWSQs8ar0FR/UzYVuCFk9qXlWgURwdkcLwO6XAeJh1lm9Y2Lgno6hhCNDbI+GmO1+ro6iORV1INEEkrIisg7yraCUi4TnbBQ7dtNymeSVgAofWbYrw46yoga63Sb5DjIjD7LCkqYLlu30YhIPSyZZAnYhPTfqLN5vKZcm93gw+I1zYLQheFWe5WIJNByi9wC4I4ZVi/FV1Dv2st9/+ASYW4S3fITkV8wuAlLbtx4b6ryjc6jBV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkxiUkVzbklmb1FVRjhNempLM1pGWFRXZTlFcUVOMmlmOWRLRDhua3pOY3Zh?=
 =?utf-8?B?SWNHa2hrTjBGNEJORWVGMW4rNG43RzBQK0NCMnE3emR1aVFYenJYdlVsNS9W?=
 =?utf-8?B?dVV0NU1xM210ZGU3Ry82T3g0M3ZDTEwzL3ZSZmZTUFNHYTZlZi9xc2xkMVBh?=
 =?utf-8?B?cFRqTzNZSXdBcHNHcUh4UUZFY3gxR1VQZm9mdU1sd0JTaHJpTW9GQ3EveGxU?=
 =?utf-8?B?Mnc5bVdFdlNJQU8xSHVyeXVmUjVJQ3ptUS9rTGk0TEZDcDVyQzhtQTM5aGpQ?=
 =?utf-8?B?Qk11R0Q1cUJPTkErWUZraFY1RzZpeVBmOWkrbkJsOTVZei9hcDJXcWQzUUFu?=
 =?utf-8?B?Q1Q2eHFsN0dEOGU0cVBLZ3NPMExxVUJTUnNseUVkeCtZU0NQWE1MaWJBcXl4?=
 =?utf-8?B?Ym5tMkw2dXVBb1RjVXZNYllBSUhQRkdIM25OQ0ovVkxOSEo1anhwRDRIN001?=
 =?utf-8?B?VjdwUEpBM0JUT05sdlZQdU5OU1VPSG9KWThHaDhNeVJCZXExUXpoTWVVT3RE?=
 =?utf-8?B?c1UxSWlxcGRqRUlNUC92T3llbXA5aW1xR0k2eTQzSkFSL2ZMTFV0QXZDWjFk?=
 =?utf-8?B?aDk5WE96Mm8zSDZCY01jU3JuYlM5YkozWklDQ0YyNVN2Qm1yeEdjRTRNYWNr?=
 =?utf-8?B?bUtEdGN1TTZWUGpkQVZpek5IUnhMdTV6TW9rTkdyYmhMcjA2MGlKdlgveXIy?=
 =?utf-8?B?ZFIxM1MxV3pCT1NEd2VLL2dDZkxMWjAzSVQyYlM1LzlncThPWVN0WGRhR1Rl?=
 =?utf-8?B?V3RKUEdkcjZ6NnR4bU1xUTMvM1ltQUxOMmtVK3l6SXRYWTNmNVM1ZHQ1aFZP?=
 =?utf-8?B?UUlxMHkvUWNUQ0V1SDJMZEhXRTV3ejZHdU9rdXVTQWJRdGNHZnZhaEVzeEZU?=
 =?utf-8?B?OWxYUHorNW5iZE0ybDNDUEhFZzN3d0FQNEZjOVFlSkRCdjI3WkRXWG45UUxv?=
 =?utf-8?B?NCtVTTR6M2lDbm5VVXNodkJqeGRiLyt6T3JIU3UyV2JuYXV6YzJDWkI4cU4z?=
 =?utf-8?B?U0pCaHVGN0JTN3J1dWQ3SVNHUDRPUXB5ZlBkeUNMdWtGRmNpeW1lUW1qSUhy?=
 =?utf-8?B?RisrSDBoMVByYVJrL3paeTdhRzhSUFVEZk1nUXUwdW9YK1dzeGEwS0VYK05j?=
 =?utf-8?B?NFBzRUttdUF4TXRwUE1SZ1ZsaWZQZzNKZDB6R2crQTRhTG9HUHphdmtrVFJk?=
 =?utf-8?B?cVpobGRkVEdhQThkcVBySm9HMVNnbE41dmQ0bFh0RHRxSUc4R3JXV3FoSEhT?=
 =?utf-8?B?dDlCd0x2d2R1MTF2T28vcDRCcVdnQ1JpTFdXclBUa0NkZHRiWVcyUUZlQ1pK?=
 =?utf-8?B?VGlqRnV6V2UwTEdwZGcrU1Zld3hGOExGbDRvWkxDMUVPSnAyUnlOZ2QzRDR3?=
 =?utf-8?B?SDJhTnBmOWdrS1Byd1IyRi9aMHVVYzBEV0c2TFB1SnIzWW5QM2NJNXVQQlhB?=
 =?utf-8?B?cEZSWlFoZVFiWHNDdWU5TkZrbDBhaHA5Vk5tcmVYN09WaHdnUDY3S1B4MzdP?=
 =?utf-8?B?MjM3dnVXczE3czZyVzBBV25qM2RFbFZ3RjQyMGNJMVVSeG45VVJQQ1ZlUnhS?=
 =?utf-8?B?V0ZmWXBjcnNBb3M2ZXl3dDhYcXh0UCswZTdJVlFrdXhheFhycVdJOUlBUVRj?=
 =?utf-8?B?b1NEYWQyeDVtYWx4NFRCRG9HNWRxQU5IcExlVDMydVhENnErVTNWQzN6MXZE?=
 =?utf-8?B?Nm9YZ0hHeUt0ZG5zK0dFMHhxRDBBMVh3dzZyRlRxWHlYRzNRUTNtYk5WbWJC?=
 =?utf-8?B?MTRjSjFtNU9VNGhZbEtuQjhqdmtGY3hGYm5OYXk3SDJWRXBraXJaSUNFL1Zq?=
 =?utf-8?B?UnhHMVR2UGJnakhxK0gyOTExZEF2SzR6OTZncDVITXhXaDlyZ08xT1pBOUZM?=
 =?utf-8?B?YkQ2MFBzVW9qSjhENTk1cEZXTXJTMklHZWtvNGNPTll0ODJ4dm5haXZuT0pM?=
 =?utf-8?B?d2daNEcvN0NSZlR0ZFdydVk5eXpBc2F0N294eENxSzlYSndBZGNtTTJhNFVJ?=
 =?utf-8?B?V0dkV0dLYkVwZmMxUGRkazNBMkVnd1dUenNSZkxZRWdjMU9uL3IxMUppdnND?=
 =?utf-8?B?RDVUNnFmOUZBb2YzN2xVb1pDck4xa00wWVR3UmV6RmkxUUVLTFBxVXVPamVJ?=
 =?utf-8?B?TWlrVlFCekJVVENWazJFTGF4cDVVaXJqRGdubEJQeGszNXVpS0N6aGc4YWxI?=
 =?utf-8?B?VUYvQTJFMDlOUHRqamo1SE14Z2lVQ0hUaVJmTm45Q0JNTmZHVjlkMTdiYk40?=
 =?utf-8?B?bW5QbWpyVkFWb0xLQ20wZ1Y4eGZnbE8vemd3STFlTGNiVlVaYW0xYU9qN0JV?=
 =?utf-8?B?Tm1vU3d4YzFidW4wZVltb3czSDdVUTNaUUhPdWRqOCs1T3BuRmloUT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912f2a21-a0de-4858-cdf9-08df388547cc
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:01:59.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpMwS2k1FOsglMcz+zltACVlftS6c0Jxggm45wuP7YumxTL3SrfOH6sVoaz7bAu27C4aJrjOqtUJfKTw2mtklw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9024
X-purgate-ID: tlsNG-4011c0/1793584922-51EC2CFC-620A3937/0/0
X-purgate-type: clean
X-purgate-size: 18341
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksandr,

On 10/9/26 16:15, Oleksandr Tyshchenko wrote:
> [You don't often get email from olekstysh@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 10/7/26 03:07, Milan Djokic wrote:
> 
> Hello Milan
> 
>> Introduce a vIOMMU mapping layer to support passthrough of IOMMU devices
>> attached to different physical IOMMUs, including devices with the same
>> Stream ID.
>>
>> Add a new generic vIOMMU API, viommu_allocate_vsid(), which allocates a
>> guest vSID and maps it to the input pSID and the backing physical SMMU.
>>
>> Once the mapping is established, the guest uses the vSID for stage-1
>> commands, and Xen translates the vSID to the corresponding pSID before
>> processing the command on the physical SMMU.
>>
>> Implement usage of the new API for dom0less guests. Allocate vSIDs when
>> creating the guest device tree and replace the original pSIDs with vSIDs
>> that are subsequently used by the guest driver.
>>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/arch/arm/include/asm/viommu.h       |  12 +++
>>    xen/common/device-tree/dom0less-build.c |  33 +++++--
>>    xen/drivers/passthrough/arm/smmu-v3.c   |  10 ++-
>>    xen/drivers/passthrough/arm/viommu.c    |   9 ++
>>    xen/drivers/passthrough/arm/vsmmu-v3.c  | 109 +++++++++++++++++++++++-
>>    xen/include/xen/iommu.h                 |   6 +-
>>    6 files changed, 165 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>> index 5ae21042f0..3d0eb92655 100644
>> --- a/xen/arch/arm/include/asm/viommu.h
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -34,6 +34,16 @@ struct viommu_ops {
>>         * Called during domain destruction to free resources used by vIOMMU.
>>         */
>>        int (*relinquish_resources)(struct domain *d);
>> +
>> +    /*
>> +     * Allocate free vSID/vRID for the guest device and establish vID->pID mapping
>> +     * Called during domain device assignment.
>> +     * Returns 0 on success and sets vsid argument to newly allocated vSID/vRID
>> +     * mapped to physical ID (id argument).
>> +     * Negative error code returned if allocation fails.
>> +     */
>> +    int (*allocate_vsid)(struct domain *d, uint32_t id, uint32_t phandle,
>> +                         uint32_t *vsid);
>>    };
>>
>>    struct viommu_desc {
>> @@ -54,6 +64,8 @@ extern struct list_head host_iommu_list;
>>    int domain_viommu_init(struct domain *d, uint8_t viommu_type);
>>    int viommu_relinquish_resources(struct domain *d);
>>    uint8_t viommu_get_type(void);
>> +int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
>> +                         uint32_t *vsid);
>>    void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>>                                const struct dt_device_node *node,
>>                                const void *iommu);
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index 7280bcf72b..673bcbbd1c 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -31,6 +31,8 @@
>>    #include <xen/static-memory.h>
>>    #include <xen/static-shmem.h>
>>
>> +#include <asm/viommu.h>
>> +
>>    #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>>
>>    static domid_t __initdata xs_domid = DOMID_INVALID;
>> @@ -332,11 +334,12 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>>    }
>>
>>    #ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> -static void __init modify_pfdt_node(void *pfdt, int nodeoff)
>> +static void __init modify_pfdt_node(void *pfdt, int nodeoff, struct domain *d)
>>    {
>>        int proplen, i, rc;
>>        const fdt32_t *prop;
>>        fdt32_t *prop_c;
>> +    uint32_t psid, phandle, vsid;
>>
>>        prop = fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
>>        if ( !prop )
>> @@ -346,10 +349,23 @@ static void __init modify_pfdt_node(void *pfdt, int nodeoff)
>>        if ( !prop_c )
>>            return;
>>
>> +    /*
>> +     * Assign <vIOMMU vSID> pairs to iommus property and establish
>> +     * vSID->pSID mappings
>> +     */
>>        for ( i = 0; i < proplen / 8; ++i )
>>        {
>> +        phandle = fdt32_to_cpu(prop[i * 2]);
>> +        psid = fdt32_to_cpu(prop[i * 2 + 1]);
>> +        rc = viommu_allocate_vsid(d, psid, phandle, &vsid);
>> +        if ( rc )
>> +        {
>> +            dprintk(XENLOG_ERR, "(DOMID=%u) Failed to allocate vSID for "
>> +                    "pSID: %u, pIOMMU: %u", d->domain_id, psid, phandle);
>> +            return;
> 
> As I mentioned in prev commit #19/22, in that case the guest DT keeps
> the host phandle and pSID while the domain creates normally since the
> failure is ignored. I think, we need to propagate the error and fail
> domain creation. What do you think?
> 

Agreed. Will be updated.

> 
>> +        }
>>            prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
>> -        prop_c[i * 2 + 1] = prop[i * 2 + 1];
>> +        prop_c[i * 2 + 1] = cpu_to_fdt32(vsid);
>>        }
>>
>>        rc = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
>> @@ -362,7 +378,8 @@ static void __init modify_pfdt_node(void *pfdt, int nodeoff)
>>        return;
>>    }
>>    #else
>> -    static inline void __init modify_pfdt_node(void *pfdt, int nodeoff)
>> +    static inline void __init modify_pfdt_node(void *pfdt, int nodeoff,
>> +                                               struct domain *d)
>>        {
>>            return;
>>        }
>> @@ -371,7 +388,7 @@ static void __init modify_pfdt_node(void *pfdt, int nodeoff)
>>    static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>>                                     int nodeoff,
>>                                     uint32_t address_cells, uint32_t size_cells,
>> -                                 bool scan_passthrough_prop)
>> +                                 bool scan_passthrough_prop, struct domain *d)
>>    {
>>        int rc = 0;
>>        void *fdt = kinfo->fdt;
>> @@ -394,9 +411,9 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>>        node_next = fdt_first_subnode(pfdt, nodeoff);
>>        while ( node_next > 0 )
>>        {
>> -        modify_pfdt_node(pfdt, node_next);
>> +        modify_pfdt_node(pfdt, node_next, d);
>>            rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
>> -                            scan_passthrough_prop);
>> +                            scan_passthrough_prop, d);
>>            if ( rc )
>>                return rc;
>>
>> @@ -483,7 +500,7 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>>                res = scan_pfdt_node(kinfo, pfdt, node_next,
>>                                     DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>>                                     DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> -                                 false);
>> +                                 false, d);
>>                if ( res )
>>                    goto out;
>>                continue;
>> @@ -493,7 +510,7 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>>                res = scan_pfdt_node(kinfo, pfdt, node_next,
>>                                     DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>>                                     DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> -                                 true);
>> +                                 true, d);
>>                if ( res )
>>                    goto out;
>>                continue;
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index e44f872d2d..297d2e5e7b 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -3048,7 +3048,7 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev)
>>    }
>>
>>    static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
>> -                             u32 sid)
>> +                             u32 sid, const struct arm_smmu_device *smmu)
>>    {
>>        int i;
>>        unsigned long flags;
>> @@ -3064,6 +3064,9 @@ static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
>>        list_for_each_entry(io_domain, &xen_domain->contexts, list) {
>>                smmu_domain = to_smmu_domain(io_domain);
>>
>> +             if (smmu_domain->smmu != smmu)
>> +                     continue;
>> +
>>                spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>>                list_for_each_entry(master, &smmu_domain->devices, domain_head) {
>>                        for (i = 0; i < master->num_streams; i++) {
>> @@ -3292,14 +3295,15 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>>    }
>>
>>    static int arm_smmu_attach_guest_config(struct domain *d, uint32_t sid,
>> -             const struct iommu_guest_config *cfg)
>> +                             const struct iommu_guest_config *cfg,
>> +                             const struct arm_smmu_device *smmu)
>>    {
>>        int ret = -EINVAL;
>>        unsigned long flags;
>>        struct arm_smmu_master *master;
>>        struct arm_smmu_domain *smmu_domain;
>>        struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>> -     struct iommu_domain *io_domain = arm_smmu_get_domain_by_sid(d, sid);
>> +     struct iommu_domain *io_domain = arm_smmu_get_domain_by_sid(d, sid, smmu);
>>
>>        if (!io_domain)
>>                return -ENODEV;
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
>> index 407e68e62d..6c97acb049 100644
>> --- a/xen/drivers/passthrough/arm/viommu.c
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -75,6 +75,15 @@ int viommu_relinquish_resources(struct domain *d)
>>        return cur_viommu->ops->relinquish_resources(d);
>>    }
>>
>> +int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
>> +                         uint32_t *vsid)
>> +{
>> +    if ( !cur_viommu )
>> +        return -ENODEV;
>> +
>> +    return cur_viommu->ops->allocate_vsid(d, id, phandle, vsid);
>> +}
>> +
>>    uint8_t viommu_get_type(void)
>>    {
>>        if ( !cur_viommu || host_iommu_list_incomplete ||
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index b71511c2eb..53fd7f2d63 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -85,6 +85,8 @@
>>    #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
>>                                        FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
>>
>> +#define MAX_VSID   (1 << SMMU_IDR1_SIDSIZE)
>> +
>>    /* event queue entry */
>>    struct arm_smmu_evtq_ent {
>>        /* Common fields */
>> @@ -132,6 +134,14 @@ struct arm_vsmmu_queue {
>>        uint8_t     max_n_shift;
>>    };
>>
>> +/* vSID->pSID mapping entry */
>> +struct vsid_entry {
>> +    bool        valid;
>> +    uint32_t    vsid;
>> +    uint32_t    psid;
>> +    struct arm_smmu_device *smmu;
>> +};
>> +
>>    struct virt_smmu {
>>        struct      domain *d;
>>        struct      list_head viommu_list;
>> @@ -156,6 +166,7 @@ struct virt_smmu {
>>        spinlock_t  cr2_lock;
>>        spinlock_t  strtab_cfg_lock;
>>        spinlock_t  irq_cfg_lock;
>> +    struct vsid_entry *vsids;
>>    };
>>
>>    /* Helper functions */
>> @@ -545,6 +556,49 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>>        struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
>>        uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
>>        struct iommu_guest_config guest_cfg = {0};
>> +    struct arm_smmu_device *phys_smmu = NULL;
>> +    struct host_iommu *host_iommu;
>> +    uint32_t psid;
>> +    struct arm_smmu_evtq_ent ent = {
>> +        .opcode = EVT_ID_BAD_STREAMID,
>> +        .sid = sid,
>> +        .c_bad_ste_streamid = {
>> +            .ssid = 0,
>> +            .ssv = false,
>> +        },
>> +    };
>> +
>> +    /* vIOMMU->pIOMMU identity mapped for HW domain */
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        psid = sid;
>> +        list_for_each_entry(host_iommu, &host_iommu_list, entry)
>> +        {
>> +            if ( host_iommu->addr == smmu->addr )
>> +            {
>> +                phys_smmu = (struct arm_smmu_device *) host_iommu->iommu;
>> +                break;
>> +            }
>> +        }
>> +    }
>> +    else {
>> +        /* vSID out of range or not mapped to pSID */
>> +        if ( sid >= MAX_VSID || !smmu->vsids[sid].valid )
>> +        {
>> +            arm_vsmmu_send_event(smmu, &ent);
>> +            return -EINVAL;
>> +        }
>> +
>> +        psid = smmu->vsids[sid].psid;
>> +        phys_smmu = smmu->vsids[sid].smmu;
>> +    }
>> +
>> +    /* vSID mapped to invalid physical SMMU */
>> +    if (!phys_smmu)
>> +    {
>> +        arm_vsmmu_send_event(smmu, &ent);
>> +        return -EINVAL;
>> +    }
>>
>>        ret = arm_vsmmu_find_ste(smmu, sid, ste);
>>        if ( ret )
>> @@ -565,7 +619,7 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>>        else
>>            guest_cfg.config = ARM_SMMU_DOMAIN_S1;
>>
>> -    ret = hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
>> +    ret = hd->platform_ops->attach_guest_config(d, psid, &guest_cfg, phys_smmu);
>>        if ( ret )
>>            return ret;
>>
>> @@ -1164,6 +1218,9 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
>>        smmu->addr = addr;
>>        smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
>>        smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
>> +    smmu->vsids = xzalloc_array(struct vsid_entry, MAX_VSID);
> 
> ^^^ is 65536 × 24 bytes = 1.5 MiB per vSMMU allocated contiguously even
> if, lets say, the domain has two devices?
> 
> And the hwdom allocates vsids[MAX_VSID] per pSMMU even though the hwdom
> never uses it (vIOMMU->pIOMMU identity mapped for HW domain) if I got
> the code right.
> 

That's correct. We can avoid allocating the vSID array for direct-mapped 
domains, since it is not used in that case.

For non-direct-mapped domains, we don't know in advance how many devices 
will be assigned to the domain. I'll replace the array with a linked 
list to avoid allocating unnecessary memory.

> 
>> +    if ( !smmu->vsids )
>> +        return -ENOMEM;
> 
> Leaks smmu when the vsids allocation fails.
> 
> and failure of vgic_reserve_virq() (non-visible in the context) leaks vsids.
> 

These are memory leaks. I'll update the error paths to free the 
allocated vSID and vSMMU structures.

>>
>>        spin_lock_init(&smmu->cmd_queue_lock);
>>        spin_lock_init(&smmu->evt_queue_lock);
>> @@ -1254,8 +1311,9 @@ static int vsmmuv3_relinquish_resources(struct domain *d)
>>        if ( list_head_is_null(&d->arch.viommu_list) )
>>            return 0;
>>
>> -    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list )
>> +    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list)
>>        {
>> +        xfree(pos->vsids);
>>            list_del(&pos->viommu_list);
>>            xfree(pos);
>>        }
>> @@ -1263,8 +1321,55 @@ static int vsmmuv3_relinquish_resources(struct domain *d)
>>        return 0;
>>    }
>>
>> +int vsmmuv3_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
>> +                          uint32_t *vsid)
>> +{
>> +    uint32_t i = 0;
>> +    struct virt_smmu *smmu;
>> +    struct host_iommu *host_iommu;
>> +    struct arm_smmu_device *phys_smmu = NULL;
>> +
>> +    if ( list_head_is_null(&d->arch.viommu_list) )
>> +        return -ENODEV;
>> +
>> +    smmu = list_first_entry(&d->arch.viommu_list, struct virt_smmu, viommu_list);
>> +
>> +    /*
>> +     * Find the physical SMMU corresponding to the device-tree phandle.
>> +     */
>> +    list_for_each_entry(host_iommu, &host_iommu_list, entry)
>> +    {
>> +        if ( host_iommu->dt_node->phandle == phandle )
>> +        {
>> +            phys_smmu = (struct arm_smmu_device *) host_iommu->iommu;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if ( !phys_smmu )
>> +        return -ENODEV;
>> +
>> +    /* Get first free vSID index */
>> +    while ( i < MAX_VSID && smmu->vsids[i].valid )
>> +        i++;
>> +
>> +    /* Max number of vSIDs already allocated? */
>> +    if ( i == MAX_VSID )
>> +        return -ENOMEM;
>> +
>> +    /* Establish vSID->pSID mapping */
>> +    smmu->vsids[i].valid = true;
>> +    smmu->vsids[i].vsid = i;
>> +    smmu->vsids[i].psid = id;
>> +    smmu->vsids[i].smmu = phys_smmu;
>> +    *vsid = smmu->vsids[i].vsid;
>> +
>> +    return 0;
>> +}
>> +
>>    static const struct viommu_ops vsmmuv3_ops = {
>>        .domain_init = domain_vsmmuv3_init,
>> +    .allocate_vsid = vsmmuv3_allocate_vsid,
>>        .relinquish_resources = vsmmuv3_relinquish_resources,
>>    };
>>
>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>> index 253f8bb6cb..c94ee4f08e 100644
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -312,7 +312,10 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>>    #endif /* HAS_DEVICE_TREE_DISCOVERY */
>>
>>    struct page_info;
>> +#ifdef CONFIG_ARM
>>    struct iommu_guest_config;
>> +struct arm_smmu_device;
>> +#endif
>>
>>    /*
>>     * Any non-zero value returned from callbacks of this type will cause the
>> @@ -391,7 +394,8 @@ struct iommu_ops {
>>
>>    #ifdef CONFIG_ARM
>>        int (*attach_guest_config)(struct domain *d, uint32_t sid,
>> -                               const struct iommu_guest_config *cfg);
>> +                               const struct iommu_guest_config *cfg,
>> +                               const struct arm_smmu_device *smmu);
>>    #endif
>>    };
>>
> 

BR,
Milan


