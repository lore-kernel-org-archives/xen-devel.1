Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BAFC9832F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 08:38:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435769.1654562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6rr-000647-EU; Mon, 28 Sep 2026 08:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435769.1654562; Mon, 28 Sep 2026 08:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6rr-00063z-Aq; Mon, 28 Sep 2026 08:37:47 +0000
Received: by outflank-mailman (input) for mailman id 1435769;
 Mon, 28 Sep 2026 08:37:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xB6rp-00063t-Or
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 08:37:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB6ro-008dZm-7H
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 10:37:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba2752-e002-0a2a0a5209dd-0a2a4504b300-26
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:37:43 +0200
Received: from [52.101.52.60]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba2756-b57f-0a2a45040019-3465343c2d8f-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:37:43 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA1PR03MB7076.namprd03.prod.outlook.com (2603:10b6:806:33d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 08:37:39 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:37:39 +0000
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
 b=L0Q0ah+CsbkZ2owpq92EiISpmqt1tdmbdmQPvQTicX4tOABXnYAwn1BaszipsQfzWyDd7TYIWfezScCJRFBrW0HM0fyRrU4ksfmzou76213zHBNq4Gbo9XJ69qhzfGjo710mwjEuwwxioDiMkG4ZNoQ7/1cjKso4VYaHzlyTaZ7/shiZ8O6AjvS3c/eSB5MyebGVSIjuSweXKjBKnZYbbVURjLo2UFYhWOmPRIJPPbcA2uU1/Gc2eymSPPM2cx5fbPYYbMsAkd7AVMYh/NqapLSrOgYY7d1r9frECCa5myHeoAPA7kLnvbultE18WzZk5x5l4QJqtcGQ/wxI29S1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbkghGTwQ5VphXkcF8TahHFgXhR/bRVR4myxPUPxe0g=;
 b=Lb3uhpbq4xO141+M41/o8U0UrrHsI5dFsuPoMHqNicaEv20i9QEjrBHwCp0d38oceKf3faMY0mP2/Z5OE6Q9apBbQ6Dgm8sm2tDI0uHNXGtNADl93PQ0TaR99r0jSKMwRdH0SaEGia/a0NzxUHAs2YerCYD1mFG2tqDtdowZBn0Qhw8zSviY2TJYD+B3PltBkGdHFgI2ZO6L6vDKkrQq8wTEsoDAdgRPJdFH+T5yXbZ63ni/aPAGxbYnhF7hQ61bEFq5l0friMwy6zWkVy+TdHn0bog97Nq4zOmgSjVmfAfyKJLBZELVxp9p4w0mpQf674IvYFX14NTTg6v15Sjkug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbkghGTwQ5VphXkcF8TahHFgXhR/bRVR4myxPUPxe0g=;
 b=pxppmwVNcU6ok0ISO8AyLICmYqfE1busqG9CfDLQkH5i9w5vs0F490GXT8HcJPAp6bslJ8yCVtJJB+0K6lVITeZ9U/mJWTSOy4F5M6Denjhs8GPbwkFpAVQUWlRtBNW4Xyqnn9ATm2MStHkqoDaQ19VyxNffsJX0F93jdlQM6go=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5c243828-44c2-49fa-8881-c97c4170f232@citrix.com>
Date: Mon, 28 Sep 2026 09:37:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EFI: refine cfgfile buffer allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7e332eec-5c5c-4c1b-aeeb-c65e046b1318@suse.com>
 <525eb684-289d-45aa-91a3-b9edbc73c06a@citrix.com>
 <38f6e47a-77d4-4b13-a4c7-94cad14db6df@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <38f6e47a-77d4-4b13-a4c7-94cad14db6df@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0045.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::21) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA1PR03MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da1edcf-fe8e-4e32-87c0-08df1d3bc103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|17002099007|18002099003|22082099003|4143699003|10067099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	gazQjfohtx675WrDKVsaiZJN3qYfZ8ob3uaV+6tDMjs+9Cf3q0MRatY9oJy++On8ci0UErZejLhI5VhJLM/Q8Oz2QEdLFpH6ASTv7mvdkpNYkFuS4Lda5s/K5tUelyLU+wkLnAPPc5LkxzBYQsMT2/8J0d1u8fklXrnJPnZ787A39k7mnLPeD8kn/FYmb2kRAF0zxs1lXF/8PDsToHTLv6NZin9+ndnCNaLUb5g4+amkLlmHOzmok24rLWVCSyo0ZLAhWpbqfG5o6LcUPXqKeMSKm7gKOA/AzF59UKMv2A8/dfAJdBNmW77PGI42LV0c71rzBJ8p9PRX2KdohaPiC5KQCmgWUNVdempHDg1/LPKJwsob9AIQwvNWfbGzqG4AQYKRmxiUL+SWVk0dfK/cJndOoCAT8p7GG2YNgeFhg9mqBP3s8GaWdGUkLHW4J1gmBiKCOQdRoX23GOjx+nQ8jrivz4gHLVF0UmlLTTQHoIE4Fw7fp5p4+1ujdOyGbMKiMyOAE10Q+S24hY2FfI6a3uEKUiQ2VrigDb9GWo3ezGddLtHVdQAd6KI7hyjvVQTA2MUoBcmEgFmWaWwcPQKyosRr41SLd/kQj83OiP1HEuucOMdxOWSqvd2ehvXI6ThDjWqkzJlJc0q/n2XX3K4+gAkJfYeuqdVDLVWSAkpDmOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(17002099007)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2ErRWtGUDdHNmhIV1VuMFdGaCtVWnc0d052aThsZUxuQ0FHdG5kL3JxeUxB?=
 =?utf-8?B?K1hOQmFud0IwR0ZlQ0dnZDhIUGpGV1EzNXEyR0pxdUtPdDMyN3V5UE1VVFZh?=
 =?utf-8?B?cUtVamtIb2pzbVVvNGdmWFIvQjBRY1hubmRvaDBMQkZDWkNaQVJvQlJmWXFs?=
 =?utf-8?B?M0J6OVFJckpXdC9zRE5MTWxWWTdMbEpnN2JtaUQrZXUrVGdNVHh3SlBoYi9R?=
 =?utf-8?B?aDBpcGdIOXRCU1F1eHdrTU5qNkp2RktvNDlsTjhESmtBdHNyQ0xUTjhkSndr?=
 =?utf-8?B?TFJQZG4yU1c1cm5jWnU0dE9iYjA5aHg2MnJwSXl1NHBFVXNEWXhUNm11YnJD?=
 =?utf-8?B?TEt5bzRvWDQ3VXZzZ0pRQVNHUk1EdXU2YnhBTjkzNFREMHFaK3NSOGpLbTBE?=
 =?utf-8?B?M1dINnVOeWtVSVhialJIWG41Mlh2OElqa2lOL0VSVzZaNldETDRUNFpHVGQx?=
 =?utf-8?B?RFpwQUtXN2JWcDFRYXFDWG5iZjhDREhvenpwS2V3QVBPSVBSTUNmMm9YT01S?=
 =?utf-8?B?UWFFdTF3OFFhVnoyWVIxcC8wM0x2ZEYvWE11elNoZ1hkSmIwak5QNHpIbXRo?=
 =?utf-8?B?TGJJa2ZtVzRpVUJLMkxwVnZ1QlZ4S2dWVTg0cFRwclByczBWNjc1aDNBNTFK?=
 =?utf-8?B?dURGU2xVVE9NaXo4ZEtNY2JBbzNybEZSOTlWVWsralBlbmh4RTlLUVJhSCtk?=
 =?utf-8?B?LzhjTFNjWExiRWwvbDgzaERPWm9pWHUzamMyTWNDZ1Yxci9vWDRsTHltcGxa?=
 =?utf-8?B?WnU5WWllWndFMytwNjFXVndlbS8wc0JaRGRQcTQ2amo1Z0x2V0JEcjEzUXpa?=
 =?utf-8?B?bVBkcjVpdlhkNFRCVmJCZW53MWFHRHhUMXZ3Nk1IeFNsZnJPQUlTNmZCYW04?=
 =?utf-8?B?ZHVwZmZHTkxxSzRwUCtHTkx6NTVGMWJIZWp4UDFubnFoQ0lKU1JxSHpoV3JE?=
 =?utf-8?B?ZzJJSlozTEhncnh2RlN2YWl0QnppNDdDRjJFNmhsNXlxMjBIaDNmTzVZejFX?=
 =?utf-8?B?enkvbGVsT3FsZEpGZURLUzJaZWpxQ1dUbTBJZnl3d3NRMGFtUjU0c0luSGtv?=
 =?utf-8?B?YW03a2dPWEg3c2U1UTVMeGMzSXQvdjJWOWxwKzVxWEwvMjJGcU16VUVLN2Ez?=
 =?utf-8?B?U0xnakhISFlKZXh4TzVxSlBFQW9ZYUJuUDAweWdGaDNJdTk5K29ZWXZiZmZP?=
 =?utf-8?B?Qjc0TTAvRzd5NEtqL1BySlJCWGRZWmxqRlVKQjFzOWJKMUNWNWhJQjJkbUhp?=
 =?utf-8?B?aHV4TlNvaXduTnJQeGplcG1vNWh0L2VjRElWSFE4bTV1eFhoTGhDR3ZjbCta?=
 =?utf-8?B?bVN5ajB3NUR3RzdiVFplbUFEVHVUMVhsSFhTM2ppSVkrNTFCZmtGaHhza1hY?=
 =?utf-8?B?Qy9qVElGREtQUjJYdG54LzBqRE9hNFY3eVJsSENmbEZBSW8yaTdLcHJsa2xX?=
 =?utf-8?B?b0RWY2xFR2hXbE1Dd091SE10OHRnQnBzVDVaeXdURW5lcnR3ZVJWMGxoTHly?=
 =?utf-8?B?eFd6YUE0NjRiRkFlUmFNSXdQeVc4NU5OZ09Da2FCbVZ3SG5TUDBJc3Q0a2hv?=
 =?utf-8?B?VmcwK1JFWUJpZVRKb2xZTE55cWdNMXBOWWF4Y3QxWGZlMVlPUGZVanJIQndz?=
 =?utf-8?B?ejNxNXlMZkVDQjNPYzB3NTB4ejlJMlhzV0VycFRMS09pUjF4VUVsYXl2Vkp0?=
 =?utf-8?B?V0ZQblFjNWRyV01VVVlzWlBwYUl3YVlVRWpRSmpaNndjTEJhVWpwOFltWWhp?=
 =?utf-8?B?ckIzSkJOK0JoN1JmWk5DRXI2a3FjK1NiUytJcmZJWFdiQ3QzYk50R3FhZjEz?=
 =?utf-8?B?eTJRc3NlemswME5NQXN5d3FJU0xtMFNRbVJWcnRQMjdGSnlxQ1IvMWM1NUlq?=
 =?utf-8?B?RWNHTG9HUzFJRGFnRmhIbkFWdmZqZkx0bEhPTi9wMGl1ZWZaWnAzdUhNbUUw?=
 =?utf-8?B?RjZ0VGQzQVl0TTdCU2s1cUZGVVRMWUw0YzAzeWt3K1pYTHJLTDNuYTB2djRC?=
 =?utf-8?B?Si9OVm8xc3UzbWFzMFlmb1c4R3d0ODJuRnlucm0zbDBPNHU3Mzd6Z05QeWox?=
 =?utf-8?B?MzRmc0EzK1ZIZUpqTWtEV0M3dG14ZDRJOGdBSHdiWTV1V09sWllHM2VsQ1dh?=
 =?utf-8?B?cUNEWGtQQ0pqYzNoUG1aNGFjbUtCTFNPUkNDZWJ2d0pndVovZU5sZlRpeXFZ?=
 =?utf-8?B?dWJZT1R3ZStZdE5zUnRCNGRJOFF4U1MvMGJwUjFiN05MSjJ2dW1SS1UxbVNs?=
 =?utf-8?B?RUFuNEFGdG41M2Z5VlN3eFRlNTd2OG9WcVdEcE5DZUdPOTRJc3pPNlN3Nzgv?=
 =?utf-8?B?OVVpT2E2QTJhc3c3YzJEcytNQ2hhMmtXTVQ4d1JIZGYxNDVXOW41cUxHdTkr?=
 =?utf-8?Q?1+bUfDdRhRY9cwQI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da1edcf-fe8e-4e32-87c0-08df1d3bc103
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:37:39.0027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJI7OqNbRVG68if02hm44awfMbk8mlMB93XHwhES406g7yxeVGc9g4epg8g96z0B7EYIpXB8EGdX6PpYhy8ZOoldnGAyJthKsuEq0+aKXhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7076
X-purgate-ID: tlsNG-ebf023/1790584663-530CDB50-D54428A1/0/0
X-purgate-type: clean
X-purgate-size: 1251

On 9/28/26 7:15 AM, Jan Beulich wrote:
> On 25.09.2026 17:56, Ross Lagerwall wrote:
>> On 9/21/26 10:09 AM, Jan Beulich wrote:
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -878,8 +878,13 @@ static bool __init read_file(EFI_FILE_HA
>>>        what = L"Allocation";
>>>        file->addr = min(1UL << (32 + PAGE_SHIFT),
>>>                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>>> -    /* For config files allocate an extra byte to put a NUL there. */
>>> -    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>>> +    /*
>>> +     * For config files allocate an extra byte to put a NUL there.  There's
>>> +     * also no constraint on addresses for them.
>>> +     */
>>> +    ret = efi_bs->AllocatePages(file != &cfg ? AllocateMaxAddress
>>> +                                             : AllocateAnyPages,
>>
>> You could avoid the negation here, unless it was intentional?
> 
> Use of != was intentional, but that's not a "negation", so I'm not quite
> sure I understand what you're referring to.

Sorry, I meant !=.

For the cfgfile, I don't think you need to allocate whole pages so it might be
better to use AllocatePool/FreePool for those allocations.

Ross

