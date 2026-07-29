Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3327DC53219
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 16:30:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376413.1623166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp7Ay-0001EC-Ny; Wed, 29 Jul 2026 16:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376413.1623166; Wed, 29 Jul 2026 16:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp7Ay-0001E5-KN; Wed, 29 Jul 2026 16:30:36 +0000
Received: by outflank-mailman (input) for mailman id 1376413;
 Wed, 29 Jul 2026 16:30:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp7Ax-0001Dz-6U
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:30:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp7Ar-008Xe0-FH
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:30:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6a2a86-2eae-0a2a0a5409dd-0a2a4507b9a8-36
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:30:29 +0200
Received: from [52.101.201.30]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6a2aa3-b4ea-0a2a45070019-3465c91e2e38-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:30:29 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB8247.namprd03.prod.outlook.com (2603:10b6:8:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:30:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 16:30:26 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDZeBjffA1wPhbiDUy6/+V4DqDeZsJoHpKK14tIUtZoKlrG22U8d8cnfHHG4/41d3c3jsikGJieakO8v9FNEy4yvTqmyYxkNjBztgn5PhQcATslMdISgC5TeM0RumGxKsy4YEbw7f2CqBhFUiJK/jlOc8KvJbp9ooTxn0AIud0r/qja0keotDtV5BrrEZ2rXxxcPn5vZ15s7ndYH5+H/t0YYmBHLmO5vn2WaTI25w2b10LcucPwZfoL5PYIDVnITJxMvnih4un8nVitpN4MsAg95s/UEKlD0kuitYk35pMq9iXxjxo59sQBMYMPq5MYA6YDLKM/yAgvlcdf0WWQIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkSjBfVN6oNRWkSMgnkxnSRFbQtbE7Z36oBFolKVZWs=;
 b=ZZO8JnFdcrH76J5sEqf9wKfrxnlf0cDwjas5lBNNP26c7AodPKz3wKQraTli1HUp1lQmcjRx9XdFTkrD404zztY5WXZEsV04eeVJG7aVrDwiiI5iNrLEsLFgbxXejbO2+46XSNSp3wiYj+stTMggWN7+v2fbwWpzqhYayWpI61MlqLbtpE9sh28qomdHOOGw9bHBBGY9tUS9df2o+EZ3cv4CPbCt4ck1VhGerxA9KxQKJMopIbd7wVMZ/CaWhOGUmXfZ5q3F7eVo1z68avZyM9kI445SdbDwvwL7zNojj7WDg+BJt3wY1gjgG2KcQ8hFWigXh5dRzdIQ4WWwql67xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkSjBfVN6oNRWkSMgnkxnSRFbQtbE7Z36oBFolKVZWs=;
 b=vUzp/CAXrjLBgQxBcOxPR8lDJhD6PhqiMJLvy0JyjVT1PJZsYvb9K+n8LopkrOY568/FATLy1sCgpP6RczmML/TyxtDC6k717J4xIqYmX+3W0hbcK/pxfBx7kmPbu4Kxny9PWO2Axue6MgC8lW9gtmq5BhbHYgguoRU4vI0Eyqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <04da312f-f052-44ce-8c99-b589fe270289@citrix.com>
Date: Wed, 29 Jul 2026 17:30:22 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] SUPPOT: Define support lifetime
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Cody Zuschlag <cody.zuschlag@gmail.com>
References: <20260729161529.164017-1-andrew.cooper3@citrix.com>
 <20260729161529.164017-3-andrew.cooper3@citrix.com>
 <amopYL9OuFaMODDR@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <amopYL9OuFaMODDR@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4f8c29-c951-416b-8520-08deed8eb1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VPhcEbunGd+Fsb/P8r+TKOX8H1fS/QPErATW7Nffl37ql6lONt7af11zXer8u2wQqGskGlXQRBcClfS5KnFXC+Yu9ySp/QkAOQsW4oRpG/brPf/+wHd9xN6uiJZXR3ovXHEl4WwJVd74WmXtSyMqlfXJl7GAgxZmBx74SsbvdwLGiXLZQs79TdLF230uGZ12L03TkWJPoJpVN7Q6NebMWg1jjWRFf48B6h4pqeKYNklfhX2eq7QPpLon8LjdSsWvFH+HK5FNReA+UgxYNJimswV2EztSNvXbJaRg01thAoSsCpcD2u+UZff0qLoelXUvcHpATLagCNEtlUIV2ikvol1IXff8brFz4fMezM++YfS6FelcBWQduPVBLFt8QgjE8D2hRNst6TaE94/YpNsoJChUxtlaemJfiz/Kp0nEj/xE/ScadJystsMjK04CdZKk/XMlXXlhKnAqxDASJcfnRaBc9S3+aXSGJna8mToiEpOu8WvcPIouiMRbS3nCKgIG0WnOxsdALpb7pYUjL3/ZFgCPeneYXXtku3xYYbwv8bB8PDtF7FXpX3X90zTtxUWl+TXIj1pl+COQrtCZeOU0LFC+OwUZFWCSZ4snfIUIJQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekdML1R2dlIrMXQzNVFCaFl3YXZHWWJraEs4a0JyUGpvYnRPU0tsZDc2c0l5?=
 =?utf-8?B?TUtVVTdVckhCSHR5UHZVQnpYL0ZmM2VNbXZWOTZSRjVVblZ3ZHFTNkFUTzJt?=
 =?utf-8?B?NklsNEd5bVh1eTFtWk5YeW5wUlhHZ2o0K2E2MXhpOTB5ejdUMkpQaWU3b2xG?=
 =?utf-8?B?bDNGaXg5Tjl2UEtrVFZIMFBmM1IvcGxvV3BscGtWc2lGaGhGZjJHR3JBM09y?=
 =?utf-8?B?eU0vL2V3WnU5c1h4SU9Pa0huRWdCeXNrSHFXcXNPMldUSHBYVmhwMHRWaFZr?=
 =?utf-8?B?WU05cE8rQnlkUXlVNVUxMDkvL2ZhVEVtbkpyNCt2Z0NNTFJ5MkRqblU0aDY5?=
 =?utf-8?B?dlREdVgxRzBmWDgzZWs3T0h1U0h6cFNpWnhyc0x2RU1pUzlRUVFFSWdQSkpa?=
 =?utf-8?B?N1NMRmo1VVR1LzlzOGJrMUxCMXhiZ0ZNODF6cDI0b05oNjgxeVRpWHp4blpw?=
 =?utf-8?B?NXRmN3VSRGs1b1gwUkxDbmo5YXRBOFhRWnMreXRiMTlCdlpSUDZkekM5dGxI?=
 =?utf-8?B?QmYrWnp1Z3FOQU1tRW9OTTNRRTRKWVlGZjRFOXZIaVpCdCsxOGUzenhZWUh1?=
 =?utf-8?B?MmdPNjdpS1N1NGd5VjZWSmp2ZVB3NTZvdHpRb2VJWVVHTzVoVjJNQU0zL3dW?=
 =?utf-8?B?dmFwNmpOVnc4Njl3eHBMNno5TE5iMENxaVZoUWtkQWdLb09obEhscDNETlAz?=
 =?utf-8?B?TmtzM0tzcGtkZGFWNitLYVhPSTV1YTBRVFhtYjM0b2ZqUzhtd3IrWFBJQS8r?=
 =?utf-8?B?WEZlS0U3NHpFaXNmU2JJbnNaa1RnenlyY01lMm9SL0pFWERtcGFvTVNJK1di?=
 =?utf-8?B?TFErQUlPRjhhc20yODhGMHhEZW10QW9MZkpQNUNBS1ZUN2MxNWFlTUMrL3dC?=
 =?utf-8?B?OVFmMVg4MmxKZkg5MUdreVkrcHhsRnBuUkFMR0NDZEhKUklSWDl1dVhrbjhE?=
 =?utf-8?B?K1NnaytMYVY1V0l3ajdYZ1Y0enIxM3BNZ0FBTkRMU055N0gzZ3A4R2sveFN2?=
 =?utf-8?B?VVJhakFPYmJWUFJMRjdWWHlvWUoyN0ZpUXZSRTE4b0NiNVlqTlE2UXgwRXNz?=
 =?utf-8?B?bnJaTk5LV0NaV2tENCtLWTVYZStUYkZqMUw4Ly9VWEdjeHlFZk0rZk5TcVF3?=
 =?utf-8?B?bUJyY0RIWEVVTjkwbFVMREg2ZXYrUmFQeUJMeGR2WGpFb0FUU254czFQY2hl?=
 =?utf-8?B?NkNRT0hZUFA3bHg3a2VwYXZZc3BkRWJMYmZuaXVtTkRXTzZsRGQxbVk4bnlk?=
 =?utf-8?B?b1NYSDcwaG5GNzMxYjlCTEs4YmN0aTBka3J2ajFvOEwxdWNjSGw4Y0Zmamtj?=
 =?utf-8?B?MnRjajBUT2EwMnhsRWYvMld5bHdVeThQVzh1TExkdXNXamtIRXY0ZEN3SjRC?=
 =?utf-8?B?Q1U5eVE1VXpRb1pZYzdTd1orMUU4dVNueGtULzVOZmVOemkrYkc4OUtCZ3Jn?=
 =?utf-8?B?K1lYeDNDT0gwM2J1dUNKVUMzRkE0UlpmcTQrNmI2Yi9OYU5Qbm5PNWthYStX?=
 =?utf-8?B?aEl2Ym0rQ0gwWUFKWjVuT09YM1NqOGVqZ2VUMjNLQ0EzczQ4a1F1TkU0VTVS?=
 =?utf-8?B?cnY0Vlg5UnhwZ1Y1dEFRMGJKNmhJa3ZPeHpCdjc5Ykc1ZFcveXYzdk1XaFE4?=
 =?utf-8?B?RHA4VjdnM3dYMWljVnBPNXZLWG5QTVh4NmtvYml3WDBZSlZqL1NucXIwdGVX?=
 =?utf-8?B?eXROQWVrM3llSUZ5anA2Ni9YSG5NS25Ya0IyMUoyNDBrSjRMZ3RmcDl6WUZx?=
 =?utf-8?B?M3FGSUhoQ1JYTjhiS3dLQ0k3STJMUHdFbUlraHAxTFpLeFM4ZFJJZkhCK3Za?=
 =?utf-8?B?MG9IdHI3MTFCeDlVRHlIT09tbVYxVTRGLzh2YjhiWDFNUlVSckdwL3g0Yk1W?=
 =?utf-8?B?djNJZ1BKUUNwUkducmJ4SllQTVBQa2kyeDgzemJsZkdJb2g1YmZNd2hGamdM?=
 =?utf-8?B?SjV4b05oRXdsN3BPZHd4WmIrcjBHbkY0Z09jR1lIdUN4SEdURTgwQUFOVlIw?=
 =?utf-8?B?T3hLY24wMmlhWWpLU3hiaStIR2JkSUFoWFdoVEtCbnFqMTZMaWVUaXU2Z0xC?=
 =?utf-8?B?R0pndExMRlRyQkxidS9qbk5uN2Uxa2hpVm9jM3BVQ2xnWWo3cnVsSy95VUdZ?=
 =?utf-8?B?NFNUTThrTkpGVDhNbko3VkpyV21jQ0E5SXJDTWtHNHE1eWhhNnJ0ZHM1NjBW?=
 =?utf-8?B?MnFnWUdQSTdVOGxlTzN3Q2dMQmFSODhOdXFmUGI1cDFCYmZ5QWRuMFkrcVI1?=
 =?utf-8?B?Y0pXSm4xWk5pUEtlNGcyMHMwRURsY1Fadi9vbTJaWk8yVGVLWHpTZ2ovbjNz?=
 =?utf-8?B?c0xIYVFDbXJDcEpGR0Z0YlZ5dmp6aXQrVmMvU0FrZ2xvNmhCV3ppemxObG5x?=
 =?utf-8?Q?IMcZODKfVhyhd3/Y=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4f8c29-c951-416b-8520-08deed8eb1eb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:30:26.0131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tr0xwINEX9lkdy3/HalDMmZEUMiIG1fsfRe/JcG0UBwMEqi7PGRCvQenF3ujuFT/Z67Da24cOuJLVQXamQGGUxryaoXPT9TETOuwIoYN5Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8247
X-purgate-ID: tlsNG-ef75cf/1785342629-A70DDAE4-363F0934/10/73395122804
X-purgate-type: spam
X-purgate-size: 1913

On 29/07/2026 5:25 pm, Roger Pau Monné wrote:
> On Wed, Jul 29, 2026 at 05:15:29PM +0100, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> For 4.22 only.
>> ---
>>  SUPPORT.md | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index 7c42de4c1602..b945fc83afde 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
>>  
>>  # Release Support
>>  
>> -    Xen-Version: 4.22-rc
>> -    Initial-Release: n/a
>> -    Supported-Until: TBD
>> -    Security-Support-Until: Unreleased - not yet security-supported
>> +    Xen-Version: 4.22
>> +    Initial-Release: 2026-07-30
>> +    Supported-Until: 2029-07-30
>> +    Security-Support-Until: 2031-07-30
>>  
>>  Release Notes
>> -: <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
>> +: <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.22_Release_Notes">RN</a>
> Will this wiki page get created?  It's still not there, and given we
> are moving out of wiki usage, we might want to put the release notes
> somewhere else?
>
> This is likely for Cody/oleksii to decide, since I assume they are the
> ones that create the wiki page.

Yeah, we need to find an alternative here.  OTOH, the rendered version
of support.md is so hard to find I'm fairly confident it has 0 users,
hence repeating what we've done in the past.

Also I typo'd SUPPORT in the subject.  Fixed locally.

~Andrew

