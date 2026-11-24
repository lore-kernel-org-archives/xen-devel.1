Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A97606A685
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=VVEAf4I7
Received: from list by lists.xenproject.org with outflank-mailman.1500757.1696806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVnRa-0000Ky-Ml; Tue, 24 Nov 2026 10:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500757.1696806; Tue, 24 Nov 2026 10:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVnRa-0000Kr-K8; Tue, 24 Nov 2026 10:08:10 +0000
Received: by outflank-mailman (input) for mailman id 1500757;
 Tue, 24 Nov 2026 10:08:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVnRY-0000Ka-Uf
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 10:08:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVnRX-003gXJ-Vv
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 11:08:07 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0561fe-e002-0a2a0a5209dd-0a2a4503b13c-38
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 11:08:07 +0100
Received: from [52.101.56.57]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b056206-fae8-0a2a45030019-34653839d62b-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 11:08:07 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB998613.namprd03.prod.outlook.com (2603:10b6:a03:403::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 10:08:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 10:08:04 +0000
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
 b=yFmtmbr+TI6U5NOocxhddt86YqV+gL8GIzS9IAb9YtDZ7u3iGVOnlptg56kNYlyj8yyPfa+vp7E+OudbYvIO9HC6XfeGdhONly5cYos1wn5C3E985eu5yD2wADundHVwKajcbI+R6EXnLBSI9J4eNmoQ6O3NnwaNLku6DCfPWif97eREcc5D+fM7o6RxgQWBAMeMaOsb/tytqbRUY1VFyOG+pIvcgO178U99XDH4K92XjTyeVxdYGbidaVdGXSPFd6+EEZdy9vg1tIrl3K6PhOV98n3Vna3TJfEpcFE9L6z9Ez+eyA1HX9ez18WO4NLEVj1ioVbTcfM2xq/AlosxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yhy7L1a4w3PXrlYFYjK79zIaY4Fz7RLviE5Hqlimw+U=;
 b=c1Mc4PiUAgTrc7SVt+oFQjDdhgGYE1RnOgZdCe4G7eDz2d6hZNDqQFTzgSXPQIWMVXa3UTBEwhpfljY0/9QOeKW2vyH1wpff+IaLwGbV/rh1kzNbikmYAxRawJg3sSuzi49iSiFs+lbLTqHBtabDTXQ/4LS5QOlbcK1sYVedpOQuKyXKSFYCN04vi4hRMseAx3fVd4JA3pAWLmABQaZivHJI84ok4EohKhX8TPTFc8fDqf88oWI8tPkYtR/BmIIrTZ9FM+S9Tyhc3K2jvApy5hUJcqr7CdyQ7GV7uNfDgK1gelPYzE/8j1OKQOAhxzYzY0jeDBTgoVHGc//OShNEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yhy7L1a4w3PXrlYFYjK79zIaY4Fz7RLviE5Hqlimw+U=;
 b=VVEAf4I7Ueu6bJzNvvO/U2SvnSfX4qDxtfGf7pKQuX9igBGKft8Y6Fkq3lPrKPFAvrR0WhR2z/9A066qUgHHj6RkjgOd6khgx/94C1+Uv6UZtur1lD5XL5gEOziNiVa/aVxyMD1IJPkYe7RLgHmu/7iX1TaSnPDsqc4Awt1NuLc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <68424a54-af97-45cf-8e62-dfda08adb754@citrix.com>
Date: Tue, 24 Nov 2026 10:08:01 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86/mkelf32: correct off-by-1 in empty PHDR checking loop
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20510674-1b6f-4e2d-a2b4-277b5650157f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20510674-1b6f-4e2d-a2b4-277b5650157f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0512.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB998613:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f5e064-661a-4338-884d-08df4a12d492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261028144727099003|261102123227099003|261021121427099003|261026140227099003|261022105027099003|5023799004|11063799006|56012099006|10067099003|261022075727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xonC9D8gLqUVC1hGVEVydIUwGAjNnyy3hUdUAEU2c2jEXRPyCWrbv+f4rCBKqj3j9W6V0pZM6hiq4UdKLvm1fi1ljTjTcUnIRxGRxwp3alZb+YKC/eESS/ANmwL6BcK3//J/+duX/1GjjK/LJpuMiQH5+BkMrVoiuV0zafx14cGSM4vPDxwT8zV0ZYDlIUEIJ6coxzVqN/CBdjx62g6wQH8NvC0nV2/BGxEhjH8Ps+30KFfl3ySbkpODnyN0VpPgQB8hAZ/ikzDg6UhkxcZm+2PuhlXmKXdFqalIlBPRdMmZ+MahCMDEaFGHA3C/qQQpFzEp3B/CY0vbTL117BJVisYcbiAilmmnMOvhK6B1WIgQcMRdkYvqp97m9y407SAzSf4sgtF6APhS6of4RdW/NT5jzbSa5RZKY0GFdhwqHZDTgrL7RB0v+dbdDfiGK/y4KU4dYVew3EZKCSTDg30HiZgJ3fgL31xm7fs4M6A1cBq9ll1Z6hvNpz1ItCiuVxULFZZ1EU8FLriwQMtWYRgdEWQGlOslgx3uDN+2H8ejCbcqxZMoGGT8CM8EYAlSv6xf3JU18ITeEmK6ZPPn75PZRZEqW7e2J9N0zO746n3piMI5kq64AAWkgqBGzEjBLGh4n/v8nYe/fb6epmo2TGC2IsHpg4Q3NjdoaXyKSjUW7VY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(261102123227099003)(261021121427099003)(261026140227099003)(261022105027099003)(5023799004)(11063799006)(56012099006)(10067099003)(261022075727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGJ1RlhMMVJKRmRFelI5c2s5VjJGZmxTT282dnlObVdGM3lWNkE5U1cwOElI?=
 =?utf-8?B?UXExNHFibWtwaGp1dy95a1JvdDdSKzhTZnJhWnBYc2lyUWFhNGR3eXpIRVYv?=
 =?utf-8?B?N0dNc1cwQkNqeEZaS1oxak51V1B0cit5RHFDbCswMW5FbkdCMFBzR3BRWjRG?=
 =?utf-8?B?Nk9rYTBRM3BnWm1rbmx0ZEFMNGNjeW9DZ3JhWVRObW83bDQrRVFZOStsSTBQ?=
 =?utf-8?B?UW9USnMycW1FVWg5TGdrM2dadVBQeHRyZjYzemd1RTJzMXcvaEwyeXRld3RR?=
 =?utf-8?B?SkdnTGxMdEpYdy9NOE5jdndGdG1lM1RYV0E1Y3BVOUxMOEZCT1A5SGFZTmcw?=
 =?utf-8?B?SmVyWmc5UFFLeHlCeTd1clpGMlo4SFUxQzFEeGgzQk4veTNYTnBsOHpLN0Vz?=
 =?utf-8?B?OEtwTzZOMmh2S1pYTHFDU1NDOSsycFBHV3pESXU2VDhodzQvbmVOK3RjR3pE?=
 =?utf-8?B?ZFFWdm5mN014RTBxZUNTTkpvNUtMeVFraEh3b0FJSHZpOFVaZUsyRXRHMW9V?=
 =?utf-8?B?QnJpZzZhUzRHL1dlL1ZrVXVnNm4raXhIOW52Z3Y2TTM4djlxdHh5bzlvbk9J?=
 =?utf-8?B?WC9rNk5TaE1GRG03NXVGMDFjN0VpbGhjRW55eW80U1o1KzNZR3BvS04rRjV6?=
 =?utf-8?B?OXE4bFpvODZrdDQvNHRudmtEZms4Q0RmeXpQZ0tpWjIxSG5xY2g2N0lIdUFJ?=
 =?utf-8?B?T2ZESU5VT2ZFUUJ0RjVkK3dva09nWC9abkQ3ck1qY1pOQWNjTUllV1hBTWVr?=
 =?utf-8?B?L1orbnpqc2srcmNjNG91R0gwV21iMEYrbSs5OXF1Z2MzejhBNVVtcERlYzJ1?=
 =?utf-8?B?bjZ6OUJuVlluUHZYbmdKbGdPK0hPNnZpajJ2a29JY0IwOWtIZzhiTzJ0NUpO?=
 =?utf-8?B?U3pSbWRwZENraGIyeDBKdUlVRWNnN0JEU2E0VGRUL1VQZ29pVzVHUUI1TzUr?=
 =?utf-8?B?NkM3Q0ZWUkhPaHEzbFc2QmVoNXhmazUvMWF4V2hBV2Z4SG9QQlZyaC9zc2Y3?=
 =?utf-8?B?WjVvaHFZcUdTd1FxemZjYmtmZEZyU0tweTBEQnN6a2hjc2xTNThuMDdIQWhq?=
 =?utf-8?B?cXJ2d3A2T0NhSktBeFR4QitTcDJBbDdiVitrYlNjc21NWG4raDRwMG5PNVh0?=
 =?utf-8?B?blVORE84SlR4TmhFWEcvQW43V2k1QlkxMlNaYkROTFJ0WTc3NHNFajY0OFZJ?=
 =?utf-8?B?dGhyQklwVVRIZFliazFEUFkxNWlJOHUrMm9vcFpzeEUxSWdDRzJlZzArdEhU?=
 =?utf-8?B?NlZscVNBUHBRdVB6eCtFR0xyWEM1NUJxOHl6NWFLa3lSZVA5NFIxWk1qd2VD?=
 =?utf-8?B?MGNRRDE3WDlndVRlZ0Y2dEVhbXRLRTRJdkQ2SEpCRzN3c1hRVlFOQlBiVGxn?=
 =?utf-8?B?ckFxRWNPZ29SN2pqN0dndTZVQml1ZnpNUzlCZWtNanVocTMvUzhuQTdXZWha?=
 =?utf-8?B?RktHOFhGbmVjbzNKaE96L29yK05SUUdTMjF6U2xxcTJ6c2dpYzUzYjFUZmVC?=
 =?utf-8?B?d1FHNlZZMVUvQ3Q5S2dLRXM0ektFMjkxMjZjOUM2cHFXSEw4ODhNOEJtR3Bm?=
 =?utf-8?B?WGhFeDFWYmxpRmlFbHlXclBLN01LQTRvUjVrdmhCZm1wM01aV01ZaE11T0Zu?=
 =?utf-8?B?SlN6SHB2cnhHT3JldlpuY1B4MlpTUlJIakJVdHBPaVJqNjVVRjlybmpGTy9H?=
 =?utf-8?B?dHpCNGpQZVk3ejlRYkJJY3hkWFF1ejZEWVpxZndid2xMZmQ1elN1czREY3JD?=
 =?utf-8?B?aWcrK0VWZ25NRlNkcEdrejQrV210dWthUXAyei9VNnk0WFgzbXFKczIwUk9F?=
 =?utf-8?B?aVduTjNSdnlyR3lPUWJVMHRxWHllK2R1OE5WQjBqVmh4aGFtS21IYXg5aVZE?=
 =?utf-8?B?UkhFandBemtMR3RLMUMrcG9GOU90YTlONFJ2MlF0ZmYyMGhHZ2lUZlZQdGtH?=
 =?utf-8?B?a3ZVYUx5aUZKNTdHMm1LVkRyL0lQUDlyMDNxcC9MTVNRMkpXU2dqU2hWVHVP?=
 =?utf-8?B?VkRCNGw1bVhXM0RDODZyQkEwR1d5bVdkVm12WDZ2YW1OQ1lHdEpiSFBPM1pO?=
 =?utf-8?B?UnRZY0k2U1p2THFTc3pzc0xKVy9QZGROc0F0ZGU0UFdHekhIa3g3MXlGNk5x?=
 =?utf-8?B?VEVTOUpuN1NJMWJoK21Nby9HdHZFSVZ4RHhaYWp3bm5KN2pjeVBaeUw4THNt?=
 =?utf-8?B?Wk0wYnhKbE5jeCtqajlBSUJRNmNwUEgyU01uZm1JWE9PSm1YSENpWXB1aFM2?=
 =?utf-8?B?ZEYxeno2U2c5Y3F4MVZtSGtaMFNuNWhSTmczbVozY3RiWlYxVEhMUEdFUldp?=
 =?utf-8?B?bnJoNzI3OVgrUEpCcmlQTnI3dXUwMHNtTUtBZkNxVysvY1lHS3o1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f5e064-661a-4338-884d-08df4a12d492
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:08:04.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a49l4ah043Ap0MuFxsZXW2JjTfCD6kLo4zxHvSdmQor09UGT9tmc15U3C3ORNGHpbbncvQXv72CInT/Ns+IndGLFs295CYR5bTTlqWjTjKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB998613
X-purgate-ID: tlsNG-33051d/1795514887-6ECCB4E9-4774AE01/10/78276251493
X-purgate-type: spam
X-purgate-size: 415
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 9:57 am, Jan Beulich wrote:
> To read the trailing PHDR, we need to seek to its start position within
> the file, not its ending one.
>
> Fixes: 54279f87ecbc ("x86/build: make linking work again with ld incapable of generating build ID")
> Reported-by: Roger Pau Monné <roger.pau@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

