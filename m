Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B156C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 17:37:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408955.1641217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Xqq-0000Dj-UV; Fri, 04 Sep 2026 17:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408955.1641217; Fri, 04 Sep 2026 17:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Xqq-0000Dc-Rl; Fri, 04 Sep 2026 17:37:20 +0000
Received: by outflank-mailman (input) for mailman id 1408955;
 Fri, 04 Sep 2026 17:37:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x2Xqp-0000DW-H2
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 17:37:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Xqo-00AuMp-QF
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 19:37:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9b01a7-bab6-0a2a0a5309dd-0a2a450a81fa-24
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 19:37:18 +0200
Received: from [52.101.85.63]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9b01cc-f2d2-0a2a450a0019-3465553f1a63-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 19:37:18 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7745.namprd03.prod.outlook.com (2603:10b6:610:243::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 17:37:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 17:37:15 +0000
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
 b=O5AXKIm81qxT6fHzKwsf061NIYgfxi3Y9K7mGmNisNVQJAwoceDSGNArg8AApNFKyyfKcIwntMhu/LgUtPEEbrqz6ZkkQJAWjBsG04uK061UfSQTsS670gdLNY2Sm7YFheFfMPepEWtkMxBr9NU/aJeXXXFrHNcFENsVl16UNocgwmshjVIIL1Jy9octn892Gjw8xt9/GAeETBVR9YTXLhH3V3Zrpj5nAGwc6UB67WimgFattUzzIRwtih12w6nGVQ1Xx3arl/wFYKITJUWCLnwn1jE1IWyh6aHZZnndXYEoq7eSXiYkT4bGHpBl0r0JSEtMeSqYUJpY2c+PQl8B5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qe4XvzUfjP/2ntOZwR0gFrXJFwGGLI3w3WixppGkrTQ=;
 b=EzO1fU5afBIoTLMLK4aWwYzJBp7jro+nKhlJqlWBG50TeJbXR2dR41jQT3G2FnyhSJjA7+6njOziHOnfRSWIJn7Fo6pgDNYw8TaKRCk9lq4xl1WEzzXY1uhozeOoh/nMccw6O0ms8sOByLTrMsZ1zNj3TQCh/gEWiMbt2/f/xMJTVGiupYwOPuh55vKucRG5xt/CdH5KmZviF/qK35X4RzRCxFK3LNCjoK0PB75f50xFBEZRCYBZ16g0NEXSw0wQHHDvhEl4fTfGmTJ1bGqJJfTpwwgIoUdaBIxed1Zegm30U9wCZW/krCli1QkjFmx3UEXtFtyIKSP1EwOAGoPHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe4XvzUfjP/2ntOZwR0gFrXJFwGGLI3w3WixppGkrTQ=;
 b=CcRsqobKIPc41yr88vewErSjd+TQTSK+j1jcFs5qds2pzqSv6ym7nZSXg9PdEg1VoWE+o/Q8r2AoF1q9QRugVDjNWgF/fBQoCdklLdhs1QLHOPpkJSxIRMF92Fnl9TB8QRLsaDAYPDLuevYk3jmczhGXVm5eemOY1pOUiQfk6KU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e6dd1d8f-ce57-4874-a6aa-bad228e7def1@citrix.com>
Date: Fri, 4 Sep 2026 18:37:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] nestedsvm: Crash domain rather than Xen on unexpected
 VMEXIT
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260904142757.375773-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260904142757.375773-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0221.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b87c727-fc4f-4035-cd77-08df0aab28a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4Ll8b8v/Z6p8nAJy77KNO7h+edmOqghHX75idTNYVDPahFuv0JfYEG8U58xzYSSWXVbGj1JHQP1OZqWGKTsUxgKlsqtt9bhdv4LVtzWa8UxQDCweseck0g60EJK53G53ZB0lOD5Dq4zCRVEKoOQl836Pz6pCsnP8USgCI5XR6Q3Bp6XavFyDzfWgPK/rCqNUfXyBfhDGkKKGF4hcP6nx7Kf6bCCO+Rcum/5QVoufbCoolIp5udg7cn5ih33EOtnttMMykMubW3UEcDh3e4YCDMtFQkziGlZvjAqf4Rnfj6rVgtPs/2QuknkE5k8XVkAENwoGfv3f21R1gD/mxZySl5MK1O1FK/JJy3306B2AZvkB4IwHiLm+sz5mWvxxxhI/F25iPea9rhOQRM/YjKbZedxRJdRLSc5e6H6EroMYbrfsp3IzOFO707TcBkiIT6xCjlghpQuRp/gWst2oPIUAgXwq/ZuYeu73jC8+H9VhSShnNytymC5AllQ23xlzJc7LllxKzEWQt/8hS7X5Y6z0QxFNKkg0M0fXxM9KYA52PAKoKkEvOauo+KFS2GDFtJfOGgwTKfllDM69w0lENzOgh4891/nW5Wi39Q1FNCoCKGnlSlxQeYireresusKVOk25nHVDeD66m2AWU3yyh9pdLg2Ld6am18OJuZjuCsQjIr0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3cvNGZNaXJUUGhHVjBmd0x3N09YK0JaVitrV1ZLTlFmTWNveUFlbTRhZ0lS?=
 =?utf-8?B?VzNmRTBqY1Z6R2tGZXhoVERnS0tKV01IRk9Md2FOdC9vaEhrRlBRWnA2VnVi?=
 =?utf-8?B?dTVkMVY0ajZwR1drUC9CL3BvVHNITitHNms0QW1vbWdlM3NVZnpUaE5HOFVO?=
 =?utf-8?B?MEZDblNUeGJwRlg3cFI4Wk5NU3lPRldWRkxlSEdCSVl6bXFvQTZFTHJrM2Fo?=
 =?utf-8?B?U3ZYbUNIV2lQUDZzdHNvVW9XMm04enNoR0V0ZUhCaDZyMGhjcTJoRzlUUks5?=
 =?utf-8?B?U24zOTExSXBmTmFIeUNpbi9ZME4zdEJabElKZDVlYU15VlBLSXljOEY5bWdS?=
 =?utf-8?B?Q0RKaEloV3FqU05rOWJ6T1JoK0FzMGVrdGxJV05NMC9RNVBVeERua3EzWmx1?=
 =?utf-8?B?cndpenZhSUNXU3BEL3dVenFvbDZWVlpBSWlaTklCOUMxdlhhelNLWmNjTDl0?=
 =?utf-8?B?Uk1uNG0rTkxoT2IyYjA2c2t1Y2VDc3c1U0o0Q2NBQ3VGa3R0OUtjTjYyTzhU?=
 =?utf-8?B?T3luVlFNM2VXREY3c0p6aEZHYUUxMWRjdlZnVXBzL0ZvTTcwQ2JrUm5XS3Zu?=
 =?utf-8?B?bXYrQS8weTU3UW5MTHpHUEYxN3ZkU0ppMjR2OE9PbDdHeWlMcGc2THErS3I5?=
 =?utf-8?B?MmgrR3NIZzRnb0J3TllQM1pHNi9ycS9NN0RMc1NiZzgydXk1dWZmZXBFWlhK?=
 =?utf-8?B?RVMzaElrVVJ3b1lQYWtZYXVoMG5tbmQ0cGpDYmpSbWZwSHk5VXJoTFAxWmFr?=
 =?utf-8?B?a3JnbExPeDRORmlaa1hWSkNaL3EzaXAvUzhRV1ZZRlFVbFo1WUIrS3dXcW5v?=
 =?utf-8?B?dFhhLzBhOEl4bklHZURLSFk0N3JzY0NKQnZINFJINkcwTW1TUEJLREdobUNI?=
 =?utf-8?B?dHdBWHcxY0FqOGx6aVBXZjZiSjNWVEhXU1ZTNXgzS3AyNzVIVnlPamVXdlNF?=
 =?utf-8?B?UmtrTnNtc0Q0d2JuZXZOb0xScDVxV3NUVjBIVTc1aVEvSHl1U1QzdFFCSFhC?=
 =?utf-8?B?SDJVKzlzcGtXV2s4T3c5TVA4N0Q3ZS9SSjBQcUVhc1Z1REpnRDFGYzhaUWdV?=
 =?utf-8?B?YURFdUlzMlgvaURwVldNWTFuYkQ0d2ovR3hIcU1aYjBGQjRNUUhqTlBodGs5?=
 =?utf-8?B?ZmVodUczNGtKYlJVb1BXZmlpNTdjRlJSS2h2ZjdabWp5L09sUW1nT2VxLzRO?=
 =?utf-8?B?YzB4OWdGOVNRbE5lMVZodnpaV0piQjhMRGpHbTd6VG1lSmNPRGVicEJqUU1Y?=
 =?utf-8?B?dnRhclVmOGVhTmFnVmFpbnNFekhNSWkvN2dVR0FEL2dYNzI1eW52WGpOcmVO?=
 =?utf-8?B?cnh4a0RqNXQ2VEVyUEVURGtTUGVUOUFXWjBDcnB1QzloUDQxTHdpYUlJYm91?=
 =?utf-8?B?bE9SekRmNzN6bmlDTExJOHVITGNmcHNaQzhYMmFMdEVpMmIyOFh0TlMzSVh2?=
 =?utf-8?B?dWxpbit5ejFvV3J0ckRUNHVFMTlUQUhKeFBjUytIT25NQVJjY3pNbDdVUUhN?=
 =?utf-8?B?MFpacU1UVTBHcHVRZ1pHUTNwNGxDa3gxWlloNm1VR1h5eGVXb1hZenRxY0I5?=
 =?utf-8?B?RUFlZnBtTVFsZlh4bnQxMkpiYVJPYTJUVGNkY2NRdlVTQ0o1WThPZ2NXOHRz?=
 =?utf-8?B?SGRYaHI3RWtaaUszVVQrYUhZRG11Smh6MENJZTZxNWtzVjFCTlZOR1lBeW1y?=
 =?utf-8?B?VlRNdUZablA1S29ubU84NjB5SWN4SElyVTA3SS95VVYxWTRQUDJTc1lPOU82?=
 =?utf-8?B?MHJCU1lqZGxteWMvc0tRb09Sa0ZRalNLL2U4bWlYa3NXTDVwdVpZTUJqWlY3?=
 =?utf-8?B?SEhGVXducXVtS2Q4dXNxRkFHVlE1cmFtVndhc0d4NC91VEZRQitleXpEZGU4?=
 =?utf-8?B?TjRjY0wwRk1Oai83Rll6TDJodkRFMlFhRGRFaVh2aEtNWE9VaS84TFJDdnlV?=
 =?utf-8?B?Y2NJRUZqdzFiWEU2UHA1N0IxWXN6UDBCcjlTdUNyU3Zlc0x5UVN4ZU0wVHdV?=
 =?utf-8?B?T2JkMUFLeWIwcHJ1WW9rdWZpbm9VSzkwTFhQSURLSUxKNU9wWFBxKysyWERJ?=
 =?utf-8?B?N1FwbTFDZ1U1Y2poODRvWG9mcytMYkEyOE5sWHpRUHBiQjkvL2I4V2lYd012?=
 =?utf-8?B?RzNZUkdRYUJTaHFsU2d3VnVqVW9FSWhVVUU4OVdsY1R2dm50RHVGcFJPRzFa?=
 =?utf-8?B?VS83RkRXaVQrTDhLOXNFR3JwdmxoVFdpaFpMcW9MeGVHWlJJdVN4U0V6RG9B?=
 =?utf-8?B?K2FxV0lBL0lzUnJsY3NwZVpTT2NsQU16djFnWjdSbzZaM2xCTDdWR3FTeWxD?=
 =?utf-8?B?Y1pHWjBhU09rOUI0SndxMmViUjdiT0hCWFVEaW1Ic3BZbCtQMTlGWTJDbGRt?=
 =?utf-8?Q?KMUtr5wpPIfL+M0E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b87c727-fc4f-4035-cd77-08df0aab28a0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 17:37:14.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vw6bwL5AVoSzBOyt6rgA98Rm/3zo+M+hobnfmavin4CT8aqMM5E6IWPY0CD3GGzadjliajKLBKxymbDrG0Ym47ZFORktlnpxzSlj2zPLZAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7745
X-purgate-ID: tlsNG-4011c0/1788543438-530D9CFC-330A8DCF/0/0
X-purgate-type: clean
X-purgate-size: 414

On 04/09/2026 3:27 pm, Ross Lagerwall wrote:
> On encountering an unexpected VMEXIT (e.g. because L1 has used an
> intercept that L0 Xen doesn't know about), crash the domain rather than
> the hypervisor.
>
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


