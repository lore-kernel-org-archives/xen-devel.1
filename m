Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DC6C55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 16:24:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382449.1625814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHw6-0000LT-LN; Tue, 04 Aug 2026 16:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382449.1625814; Tue, 04 Aug 2026 16:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHw6-0000LL-Hs; Tue, 04 Aug 2026 16:24:14 +0000
Received: by outflank-mailman (input) for mailman id 1382449;
 Tue, 04 Aug 2026 16:24:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrHw5-0000LF-9z
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 16:24:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHw4-004PPT-94
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 18:24:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a721222-bab6-0a2a0a5309dd-0a2a4507e9c4-14
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 18:24:12 +0200
Received: from [52.101.56.9]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a72122a-b4ea-0a2a45070019-346538092921-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 18:24:11 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CY1PR03MB8122.namprd03.prod.outlook.com (2603:10b6:930:106::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:24:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:24:06 +0000
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
 b=o5HjOoN19iTNgrpzWynhldcyWuud6gq1aKxxzdPOCPQmw/neYkIkwNWTNkQxEbHjbtcSLbvfCYGCfl1i3hkZkanDoLt1Ua95grraSkFtuoyHWPvE1ZdzvmUHhoFsoKLAr7mhatzQWVO4c6H5P9C+qx3eBoY9MDdiTBQXUcVKDEr5qPtEeRi1omcaizTDmaoyddaBLUuUL4HRrna/zHk9FJ5dFgB0tEJhLX2Wyyz9URQ1G/v+m2lKgjB7XkTwUX5MHs53jEhFXXLXJfEydYYCGpR07twuGi0hEiTHF5U7RiblP308D9bREqcdSQkxGfCocdJ1jfdNLTzEsk5jGWuizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvSlvUKUmqXgm62iNIgXSG22mwHOiYmM2XvdHRKiLC4=;
 b=xmkZGyiJ+ibdNfbC+CVQhcV6gvlaerMVS/MGGojJ30T1efgIZocG44uG6IWa2JWai+QuW6K6tnCTbNE5sLqgMgrPbYVoUhz721u5jrJWRr17/3TKg6GTsq1VVshxtQ4y9GiU8Q0d9U0XspNQAC7atZTCeXQHfXswKsiLzMSrGpHeNaoDh5VZufMo2RPv9oo95Y9DHAupEUccsCEl4HL5Sj5tvciHjqZFo8RoGZR4l99b53/DELbzhs+5lVBZmg2EDQuEEjqcErBGQaosPrXpT8K5KPjTBHCPPk3m2SdW74a2sMhh4s31/213jbbPxKAy1cX9z735JI7XOdXgzOJBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvSlvUKUmqXgm62iNIgXSG22mwHOiYmM2XvdHRKiLC4=;
 b=OaKiMiaay/c7vjseqfCRwwn6Kfnp/fUrAwHIzgwz7vuTRmO2iSNWKR/iSdY9eGBMXnjw7YDnF7kZQKvV6Dk3kvpDJK3epl2O61TuuJv89ER21aWGDbj9iNlstgRkgiKiYhLz0q0iWifv5MQuZdbPwOL6p5UX7nXs/m5Gx/34MBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d995b0c4-a916-4470-9aec-aa90087680ad@citrix.com>
Date: Tue, 4 Aug 2026 17:24:02 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <freddy77@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
To: Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
 <20260720154832.1907401-2-marcus.granado@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260720154832.1907401-2-marcus.granado@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CY1PR03MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 623b78f5-6dad-426d-b514-08def244cdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DyZzO+oyIP5mfa8/V5cC3JKALHkhSo6pi7YozT8lVN7S3yokXgEXaHQxDucw+y8CpxxjqF+VG6jsdBur6Wb9POAn1c16jZUnjcstu5a+6OV8fg3lFWs2eSoqnleOFbcbklWT97jhuhMN9nS2bjZ12JEZiyEZfgjSi7xm/qfvhHg/gStVPZJw/4SmdhAcDtHZKSzLdxMRsi4Q1oPDUty9p7SV5/PipPT5d4tbbvhh7f80Ky4vzbkX2snZxIWjc6zsq6N9XicSPdN05NR69bUlPl9pG9J3RGssL4nxq2rSw2l2q5H5nLq3ckmHu7of3XCWYACSP5d/IHF1joRTJRdSEbTwCvTPWroqS08OFcRfxd6q+2GwmQYTehLRWECYJWcMCnTYTXlOqw6BcOPpTGbTPfnLop4RNjTNYj9Uy/SwoiZ7ASwLsiJ8zmg2ZgpIsd+LgeLEs75GLOQmFwDkveJkCEeNRp0hTIQoo33hVfiw648KBCn/hUa6Lb21yeXNWU5H+yMCrWaDX2HMHQ7oNbl3EZSA3ul2DkcfA38k5+bAw91dxFStl5HTi1vIcy9AQV9ARuB8o/OQR5EI+3iqWGHlSweybyQwEP3ClbJI3xzXH9GXDVdXKnIETlPm3dnZ+6LRff56AnKm2z4YzIPjdDC9vPrcQgojeqoqgs40grP8zbI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JHUFlPQ1NTVnU2Y3R2WUsyeVlYSTB0SmF5UlJwYnYvTzdJdHRuNTB5UVoz?=
 =?utf-8?B?L1cyL1NKd243T2JFbEJGS1NPbXZyWmNaaXNreDFPV0R3eFl0OGpMQy9jekZB?=
 =?utf-8?B?OGp1YTdmVFBURGJIbHdOMCs5Vi9oc1VtK0tXZU1FbkI1QTM5dmNTdjkxQ3Rw?=
 =?utf-8?B?ZWJqcWFiTE9wak9qRFNwUWIwdWlPRGkzaU50d2x1Y2hoYVNqRVljV08vaGw2?=
 =?utf-8?B?YWoxNmdUamZqNTBVS3pLMHNBaDAwVFhHcUZzWHM5UTc0WWdoUERWS3NqL25a?=
 =?utf-8?B?Nlk5ekFad1VNUkI4WDBsM2psU1BoZ0c0ODBoU3V5bXVwdEpmUHUwVDFWV0cv?=
 =?utf-8?B?K2xFTGwrU1dvck96VTF1aDZEV0ljcklZUWg3Z0xXN2pMakNBMWR4L3E4Z1VL?=
 =?utf-8?B?VE1FUTYzRWRxNE1LcithNy83N0V4bDhqbnBabXRheWRtTkw2aDlySm4wczhx?=
 =?utf-8?B?RXhtUm1pMnBHTkdyQnVQeHlhaGJqZGwvOEhnWExDQ2tpRmpkeXF1NWJSaFJK?=
 =?utf-8?B?RG5DVjhXZkxDQmU2WkYxNnBwdE1BV2dwM2wxT3FtdVRlQUUzSS8xNWNnS1d2?=
 =?utf-8?B?QXhRbXJTeklMSzhaNG4zeDl6QmF3Y0FYd2Iza2ZCaVVqSzNFYnlwVk9LVzZ2?=
 =?utf-8?B?YlVLb3ZHT0ZFV0hEWjlpQTJDL2JmclNsa3IvZENXTkhzVGpKczBPbFcwblpq?=
 =?utf-8?B?K0R6cFBsYXYzejFOazJuVENzajJpWDByMjFTRERQclNqSE1aY3grTTFXVmY3?=
 =?utf-8?B?NnA5SUVPYzc1aFdoNTRlV3ZJU2Yrc0ducHc0UTNhNHNCK3hCSWFVV1lDNjFU?=
 =?utf-8?B?Sm9Ways5czF2V0N4SDJoWHFrWUJyY0RDU1JZK2grQ011NUJkZWFaYW0yUzdB?=
 =?utf-8?B?MGMwcjhuY3RoV2pLakZMNGdpY2FLanhna09YODd5WjRSd2lLcnFLd202eDZ0?=
 =?utf-8?B?SzMwUjJPaUtEcVh4ZEpRMVVIdlFSMEUwMUFKcXFLRXJMc21McGJSd1lOSWdV?=
 =?utf-8?B?OWtwb3ZoOTdwd0NKc3BsdCtza2hWZ1VoNGpMTXBBbkZxVTF0dTB5UlNsL2pC?=
 =?utf-8?B?Q1c4Wmo4YitFSlBXejBTTW4wL2tHclY2NmpTOVBCL1VKemx4ai9GSjJwYkZx?=
 =?utf-8?B?N0NOdFNmcFRseDNBc0RIUGxVQjVvclZTdHJ4QktmWFVxWEtnQUNVNzJmZVgw?=
 =?utf-8?B?U050dDJGa3RwT3dkR0ZweVM1L0VmYW05L2RJL2wxd0ZlcjlxdFBaeHZZaW1o?=
 =?utf-8?B?QWVySVQzdHFmYlEwZmFtSHdOanVrODhOSkliZUU2VmJtK25jNFo2T1pLa1Bx?=
 =?utf-8?B?ZjhnYWYrZ1dkZHBjaWZOd21VZytUZ3UzOHhURzdoU2s0RkU4UzQ0OWJWQVJt?=
 =?utf-8?B?ZG9kMkJrZzN0aUdmaEVKczNpYmxWVDh2Z1VnVXI4SzVwR0tmdHNGaUFwb2g1?=
 =?utf-8?B?dXNWdzQrN0d5NTh6UG1GYTRpNVRkRjRJN3ZTajhMMkhYaGI2OWJxa0RCbHhG?=
 =?utf-8?B?dmNwbVhrdW1ydGIxK3NtZndFTmNEQlAycjZ1Qm11MjFrQUEwWFFjTUxudjVm?=
 =?utf-8?B?VkRiM2xITzNDS1lKa1lObzRQVG1QV21mWW5rRkJ6akZBN21laXZXWVRWREFj?=
 =?utf-8?B?Z05Vc05PK2hFdjVuRVVMdXZ0Q3dyWmVCUnZPYjVkRjNpNk9rK0diQ3FGUzJC?=
 =?utf-8?B?TllSMUd1b04zNDFyOFYycWhDa0czckFzSEgwNlBqbC9NTDZXYTNwMWthYXJO?=
 =?utf-8?B?QjN1MitFTWRYb0VzNWNWUm1EZ2xJY09MM2duYVZLWjlMeEpUeTUrTU1rZGhn?=
 =?utf-8?B?cmFSTVZOWmlMS21ORUhlUUFtYjd5L2pNNy85UkgxOGp3eDhUWUpNTkZZL3RI?=
 =?utf-8?B?MkRzTXBDaXZ4U2ZPS1lJeDIxOE43dEZBVWg4R3VkSUdVbE5wNlZHS0ZVUitu?=
 =?utf-8?B?TktoNjBUOFNIZ2xUSllhWFFRSWJMc3g0cHNCUlVwbzcyMnNhR0VxUVQrVXAy?=
 =?utf-8?B?Zkg1QnJ4YXE0Yy9YZ2kwWjR1N2RRZGY4VDBJM05sdmpJOVI0OXNVMDFBazcv?=
 =?utf-8?B?NzlvUTVmcHpHMUV5R1Uzcm5nOHAxekNBODRNbUhtdVlENEVOVnlTdUs1VkRL?=
 =?utf-8?B?ZUMvRXNsZCt3UktCNEloQmpNOHFvYkE5TWROU3hBRVIwOUdnM2ViUlFwOEYy?=
 =?utf-8?B?MWZybFV5S3N6TFYzakg2WWFaanlLdTN3MWhvaTNuY1pGQ29KZkNPZTVtSEhp?=
 =?utf-8?B?cCt4T1gycWpQSHJJbURmcEJXd1hnaVE1Q3MyRzVxUG1aRkdHN0s2OFlyaXZv?=
 =?utf-8?B?ajJvcDNVdVNCMHh2cnNRWEpUa3E1NjdlcWFrYXFmc3psRXFFZFdsdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623b78f5-6dad-426d-b514-08def244cdc7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:24:05.8860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUL+HsUlYKFVgCcvQJnbI07EDNdGByHWMOBYvW7oaqJjJ/toQXvMixsXS50i9bhiSEf2blL/eaQgOFAInm5ys2dpAj3KdDNBBmRMrd5rY1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB8122
X-purgate-ID: tlsNG-ef75cf/1785860651-366DAAE4-0C74E280/0/0
X-purgate-type: clean
X-purgate-size: 2147

On 20/07/2026 4:48 pm, Marcus Granado wrote:
> diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
> index 1319ce1f1e..7469c95139 100644
> --- a/docs/specs/libxc-migration-stream.pandoc
> +++ b/docs/specs/libxc-migration-stream.pandoc
> @@ -359,6 +360,68 @@ tail.
>  
>  \clearpage
>  
> +PAGE_DATA_LZ4
> +-------------
> +
> +A PAGE_DATA_LZ4 record carries exactly the same information as a
> +PAGE_DATA record, but with the page contents LZ4-compressed.  The saver
> +may emit it in place of a PAGE_DATA record when LZ4 compression has been
> +requested.
> +
> +     0     1     2     3     4     5     6     7 octet
> +    +-----------------------+-------------------------+
> +    | count (C)             | (reserved)              |
> +    +-----------------------+-------------------------+

This reserved field in the original PAGE_DATA was earmarked for
compression information, but that was on the expectation that we'd be
compressing the whole record in one go.  We're going to need to figure
out that part first.

A complication with compressing in a single block is that we end up with
disjoint ranges for any PV pagetable, and for holes in HVM guests,
although Frediano's foreign-copy work could be adjusted to arrange for
the pagedata to be contiguous.


Another question was about the choice of algorithm.  Yes we could use
any algorithm, but CPU time in dom0 is at a premium and we want to
favour speed over compression ratio.  LZ4 does this.  ZSTD might be
acceptable too.  The others are unlikely to be a win.

While this is going off topic, it's worth at least mentioning.  Another
optimisation I had in mind was to remember the last version of a page
that we sent, and on subsequent iterations, XOR the current contents
with the old contents.  I posit that plenty of dirty pages will only
have a small amount dirty compared to the previous send, meaning the XOR
of the two will be mostly zeroes, and run-length encode very well.  The
downside is extra memory overhead on the source side, so it's not an
automatic win.

~Andrew

