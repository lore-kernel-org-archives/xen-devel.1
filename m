Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB2C606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 10:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=CSbX5Ixt
Received: from list by lists.xenproject.org with outflank-mailman.1492156.1692853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGs8-0000o7-Eo; Tue, 17 Nov 2026 10:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492156.1692853; Tue, 17 Nov 2026 10:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGs8-0000o0-Br; Tue, 17 Nov 2026 10:57:08 +0000
Received: by outflank-mailman (input) for mailman id 1492156;
 Tue, 17 Nov 2026 10:57:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTGs6-0000nu-RD
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 10:57:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTGs6-00GqMl-0L
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:57:06 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afc32f9-bab6-0a2a0a5309dd-0a2a4509dac8-44
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 11:57:05 +0100
Received: from [40.107.200.37]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afc32fb-be1a-0a2a45090019-286bc825e2cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 11:57:00 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB989309.namprd03.prod.outlook.com (2603:10b6:8:392::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 10:56:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 10:56:57 +0000
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
 b=SfF7G9PNLmWyH8CnvKFUGXIu7BosbF1wVvgVz0/rmoDbmhCHV5KvXRPIaUXxudY98asuWIJgO5UlFRyq/Cte3ddc98o4hDHA4t4bxyBi168Wse2fkooN2XSTA/1TPcaP5WixafV5nKF6HS1xIAge0zcvSZ6vGjR4g8L3daJst2A602zlsBNeCathdmiPQ5kdiv3DRJacTy7cl99YO3n1EBONmnb7xpPqU01Md9ORDU7jsehU5qKj6AgeGuCkA5ceqCjIkgJ4t8iL0opLNxlR3BKa93LUQHV33ARQ2/qxUspR2fdg3xeksNBSfOyC32fob+DkE2DiIzDYV98l2fiYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90wODY3mMQoGVMAk3Xo7JZFdx3596KPi5o+W02ER5RQ=;
 b=ydgHzgufHNi4BOYG5gqIogHUm9DmkBZ/Kz/RJaLN+7hFZE3dtuuPCXCdUgidMoYUT5tixbsqPR+8mSvfwwr+j50VnpkQ/0qjK47uDTtZCs/qbOMV2b+WZLPvxm66axYVCV4ndlUVCDHaac5z5nmBNGMICdAp7/FqXV4x5lpesHpDPPYU6TpcS+SQkocvjfjP2DRnvfo3OHlcCga69716RcZBrcLmFwD9fFhYyHf//Ka33/Hs5gZkNhTsnftpMc6qqAn28N2JrdO1/7mgwpeaPt7rrK33BRYBoeiu52IzQh7vSxOZKYD+6DNRXVyZBl+G6eNwZSgsur3NOdOgJAr9ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90wODY3mMQoGVMAk3Xo7JZFdx3596KPi5o+W02ER5RQ=;
 b=CSbX5IxtZYTMuQJCQ5Mvtpr5EwkuOH7REeSnyF0irgBrjYEsjQUxqzpITzhaGg7+4FSPJVICqq698m0PLNY+snMvJajx6Nd91X0jVJZlsSqwbf4tcBRIGBtnu05YTYJmZ2VNV76zhZcQfgXXhoRAe4my8RLeL1zJziR5vBXyAQA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <669abb47-1efe-4bc1-a132-2e935dd25afd@citrix.com>
Date: Tue, 17 Nov 2026 10:56:53 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 2/4] x86/efi: discard multiboot and PVH support for PE
 binary
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
 <20260715062206.328049-3-frediano.ziglio@citrix.com>
 <8779ceea-3f2b-4a83-8d87-44e4737e8148@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8779ceea-3f2b-4a83-8d87-44e4737e8148@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0683.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB989309:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e719ed-b930-4738-a002-08df44997f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|22082099003|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261022115727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	NNHCGeeWhSd8T3y4r5a+8FVpfuRWqGFY+/97KOnroPNfDt69diLDlpfwMHYEmifw7T2jYbsxNvErTO6yBz0dcuDsXid4M3NPjCBD+n0I1D9kce7eEH1Psok5duFeCZtRyY5Zz3XpWRQOFNeuLVkqIqGCAOKOAkmfl+XueBKMICvYyTFb0EluKjOSZ6SZwlFkLYTyUd5EkHwFPDyj4NrGksF6+o7Dr/f1AEXsyf03Hj4STIdCOuzZ5vgpP3LEyIHgihBnHxYY5cnEZMTk/yxJQv+DB/TATArSv95OwXc+vhaklWfct1yHMhGeEkBEcR6s2roCU4dDZ4klBrYFyyJiGieUuVGfsFEIDegHY4GlsYE8kDw96addWUBhPGxyvUbEWMB/nuZhRTGSsXEGHqSf5h+nhRce7/KNHf37010fbyO3wjD2o+0Y2zrDnM3xkbEAVxg3oId78P0FHHuD9xkQW5WFyCj3OJ72MDurkneP0pm797a8ctu3+n3ZA3DrTEXJFh7L8Sh8+H2HhiTYdc6hmRI06JknOAgzPC4EZpQD0ICKhTHu6EWgOs0uaPPS56D4VsxzG5l3fJbq7aXkUTVM1gkE5xPrgCe+l/guUceNilGwMBhjo5LcstDfAJoHzFmkz0pEmxIhaOMk6gxtRaGt7dKIUxsHIMhqhw+uCGlKFFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261022115727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTRIclNvZTNWTTNxZkZsZjFsT2JFSVRTSUdQUVQ5MmgzWmZncDlmV081VVI1?=
 =?utf-8?B?M1dGditJWCtvaFhWUkFhT25ZcnNmWk41NEhET1pLYmt3OVJzUk1PTU0xM1lL?=
 =?utf-8?B?NUMyemJ0SFpJcXNyZWd3UFdnTUZYcC9rbXJ4aDJ1eTFOT09GYmNaRmNPRzZo?=
 =?utf-8?B?NmpTTTNTOTBkUDhFQmV6MU96d05ucDYyVXhZTzJZUEI0M2E3NGhjYndOREg4?=
 =?utf-8?B?R0xjcGVDTGptOVY0UWZJeVcwOXlRcjBzSFR1ZWY2SzNGSjZQamx1eVlXVUJC?=
 =?utf-8?B?YkdmSmJqMXVWejdJQVNDVHdsaUMzWk94Y2VYQWZxNStZM1NVZFhYZzlZeGJs?=
 =?utf-8?B?RHhKNjBtc0c1NVpPbXdwOVJua0tmTWNITEdCL1ZIYkJpcW42dFBBSDAyLzk5?=
 =?utf-8?B?QWhUbWlWUEgwTnBZZlZPQUhVR2J4aUNGNEVrL1EvMnRoRWUzZ3ZETXVVRXp4?=
 =?utf-8?B?SHBselY2NzZvdFpRTTBFZmxUN3dUbUczeWRVTE1BcmNmVy9sUExhYitHYXJv?=
 =?utf-8?B?dnVJOHJGNi8zd0F6MFJuQ1J2VjZpQitxR21PNExrSFNkWWp1TnVYbjI4Y2dt?=
 =?utf-8?B?bzMzUnY2QjBvWUdmeVc4cFduTTcxT3BVcUk0eCtHV0ZOdlh0R1Y1R0l3UFhx?=
 =?utf-8?B?bFZzaEZHSENYSjNzMWR1eVhGVGtUL1VPdnhuUFN3SmVDSWk3TUZabFdOczdu?=
 =?utf-8?B?RUpoVnhTcVlTMDZhNUlMaFlDTXRaVUpTWFlFQWRPekFlbTF1TkpwSU1qMFFX?=
 =?utf-8?B?ZWFBTk9Oc0JpR0gzdlFaZnFNdnBUZGRib1NjdVBxNlB3clNUWWxFazRpM1Qx?=
 =?utf-8?B?bkIyNmJFazhSdE5CY0JDR2xQRUt3TGR0WmdtaFBpeXBLUlFBNklHb0daQWx4?=
 =?utf-8?B?aXVBcnNiOHJuQXpvZ0JvN0tHYmw5OVFyaEJlNFZJcWFzbGdSekRtOWxmU0lv?=
 =?utf-8?B?dFlCeXo2NWtLR2J5R2pJem5MeUdCaWw5eTNaNmZ6SnMvdG1UeEFUQzdmKzBM?=
 =?utf-8?B?TlFIMEtLb0tDU3V2dGsyQUN5WStiRi9tZlBRNjhLS0pEbzFvaUpIdUpxRlJs?=
 =?utf-8?B?eW0rT2dMSHlxaFVEYlhXVkJrUy8yUkpCcXpDdkFKNExNLzlOSGNGbXMxYVBj?=
 =?utf-8?B?alp0NFNHVmxVUFlycE91YmRIT1JxcHJ1MDBwaDU1VGpYYXZwa29SRDNmQVNy?=
 =?utf-8?B?aGlFeFYxc3h5bHNYSkNTVXluQ1l2NzBySFZyZWZxeEJpSVFZK21LblR1L3R5?=
 =?utf-8?B?UlVzaVVnbFN3SEtXNjBHbmVDMkhtK3R0eWhVZlhkc0F0ZzU1TGpwd2NsUTRF?=
 =?utf-8?B?aFBUZ0h2aEFyWnRHL01ZSmcxemt5NzF6azRIazZlTUpmQjVnQ3FRc1cvdTUz?=
 =?utf-8?B?QklYOTMvemxYY1BCZEJxY0xHaXhDc3VNaWllMDZod0tpaFdJNXovSVlRdHp2?=
 =?utf-8?B?OE1BeWRac0lzM3c2NmpHRVNDdEJibjZQTERIeFJ3WHIvdTc0OWJvVkoyVW9S?=
 =?utf-8?B?dnJaMkN4cDBYWVpEZzAwSlNJM1k0RWpnbHBnemZEc1UrZmlvTGtUQ3pKaXBs?=
 =?utf-8?B?RzcrSk5ZVTZIVTRjRVVBRTA2SUZ4dllEemdlNHZvZTRydi9hK3ZZcG5VOU1E?=
 =?utf-8?B?aGNHZllHUGpOczg3Q3hiZ2dWVUx0bWdWZ0JFZFEvVi90a3hwVEszVlByNzV0?=
 =?utf-8?B?MHhvbnU4YzZIWlBObG9ZRW4vYXNKMzJuRUZFL2RIRWZtYWVVanBCNm5XUzBJ?=
 =?utf-8?B?Um1Dc0hBbVBYZHhSMFUrUkplV01IbnF1dThOVStCYXFPWk9DTnVmTlQ1bEVu?=
 =?utf-8?B?Y3dYMURmcXAwZkxXOUM5SFFqbVZzR0thN1N4cHhwL2RkMzJsOEpKc1N2SDNh?=
 =?utf-8?B?ZGJqODcvRXQ5Q1JQaVVmdXgzL3BUZnZqbmxmVHpjWU96T2lpUmtYUVJ4RXQy?=
 =?utf-8?B?WnNicnR3Nk9sTzc5LytBZXI1YWR4eldCQjRlK2RScTZHKys3WG9aS0lRc0lM?=
 =?utf-8?B?MnE1TVpvenFHUWp3R0FFMDR5MmtVUVAyMFBHNVI3TVA4M1hrSWVoT0hWNXow?=
 =?utf-8?B?aWZIV1IxMVFCVWI4YkU5SUJQWjBINnFiN29qZnVlTHRhcFgzMGhSZ2gyUzh5?=
 =?utf-8?B?OXRieTMyRlF5Wi9aNjRjRXVVQ3hNWmtUWXU2Y21KUFQvT3BtckNaWDBmaHk0?=
 =?utf-8?B?VjZFWWJ4WGxVWUx6Y3lWNWc1UkJ6Nnl6c05uejB5QldpV3FoY3pLNUxuN1N3?=
 =?utf-8?B?eitLcWZ1UUtNMGhQMDhGZVJCTXpyakYvYzdvK05mT25SRzEyNW1RS3dZVkdI?=
 =?utf-8?B?NjdyQmNXRi9XQVJtNUovdDFiMkhINTkvdTdVZ2RIbmZkSlNsWVZlTkpmb3BC?=
 =?utf-8?Q?9GyncZqzpT3JaRPw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e719ed-b930-4738-a002-08df44997f8d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 10:56:57.2191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJctDsgZngFQqIj7cKPhkvcMNDfqpTt79kASoT9a9SseC+66N/zO0LphzDjPeDWLTtzikXHHKJVp0EjunZcwRf7T0jZGIZ6CjK3taBjq/pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989309
X-purgate-ID: tlsNG-bad1c0/1794913025-BD6C2034-0836A130/10/78276251493
X-purgate-type: spam
X-purgate-size: 2541
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 9:54 am, Jan Beulich wrote:
> On 15.07.2026 08:22, Frediano Ziglio wrote:
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -57,6 +57,10 @@ SECTIONS
>>    __image_base__ = .;
>>  #else
>>    . = __image_base__;
>> +  /DISCARD/ : {
>> +    *(.text.header)
>> +    *(.init.*multiboot)
>> +  }
>>  #endif
> This has caused fallout: GNU ld 2.47 now warns (once per .xen.efi.[012])
>
> ld: .xen.efi.<N>: stripping non-representable symbol 'start_pa' (value 0x7d2fc0000000)
>
> This is because "start", from which "start_pa" is derived, has disappeared with
> the discarding of .text.header.

Oh.  I'd found this, but wrongly attributed it to a different part of
the series and left it on the todo list.

>
> Question is why we (still) have "start_pa" in xen.efi: I can't spot any reference.
> The sole reference is xen-syms' entry point. The patch below addresses this, but I
> wonder whether I overlook anything.

0b280404c84

It looks as if it should have been ELF-only all along.

I have to admit that I can't quite remember why we have this, but that
it was part of making shim function.  Nov 2017 was from the point in
time where we had no viable Meltdown solution other than shim-ing all PV
guests.

>
> Jan
>
> x86: restrict start_pa to xen.gz
>
> With "start" (living in .text.header) now being discarded, "start_pa"
> obtains a bogus value (which also cannot be represented in the COFF
> symbol table). As the symbol is solely used for xen.gz's entry point,

xen-syms.

xen.gz does not contain xen-syms's e_entry.  It is set to loadbase from
the mkelf32 command line.

> limit its definition to the non-EFI linking process.
>
> Fixes: 9f8ebe9f46ce ("x86/efi: Discard multiboot and PVH entrypoints in xen.efi")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With the commit message adjusted, and probably an extra fixes tag,
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -55,6 +55,7 @@ SECTIONS
>  #if !defined(EFI)
>    . = __XEN_VIRT_START;
>    __image_base__ = .;
> +  start_pa = ABSOLUTE(start - __XEN_VIRT_START);
>  #else
>    . = __image_base__;
>    /DISCARD/ : {
> @@ -74,8 +75,6 @@ SECTIONS
>    __2M_text_start = .;         /* Start of 2M superpages, mapped RX. */
>  #endif
>  
> -  start_pa = ABSOLUTE(start - __XEN_VIRT_START);
> -
>    . = __XEN_VIRT_START + XEN_IMG_OFFSET;
>    _start = .;
>    DECL_SECTION(.text) {
>


