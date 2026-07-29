Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070AFC54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 11:58:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375594.1622726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2v1-0006IA-KX; Wed, 29 Jul 2026 11:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375594.1622726; Wed, 29 Jul 2026 11:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2v1-0006I3-HD; Wed, 29 Jul 2026 11:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1375594;
 Wed, 29 Jul 2026 11:57:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wp2v0-0006Df-5m
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 11:57:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp2uz-00EJA5-96
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:57:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69eab2-5cb7-0a2a0a5109dd-0a2a4504b24c-36
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:57:49 +0200
Received: from [52.101.193.62]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69eaba-b57f-0a2a45040019-3465c13e88b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:57:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB8094.namprd03.prod.outlook.com (2603:10b6:8:252::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:57:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 11:57:43 +0000
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
 b=nRRKIyZOdLxxJFODuAo1hMadX1EsCJfw8CNAn17FPYyjGOFhIHm5Pj9vbu366T9/NU+dZ0uJWL/NYuSoW0oRK4fPPR+HECOYZPV5DgTreJLdt5NSJ0IqjjKk+zEg7dA/m+mSd5nD8TWqRkx7C3LILZykfGO2ez/H2sNTkX1DsUjVBRqWU9zVlmtU901RviASfLfaRxaxFnM5atRKVnTxKcRJGsqU20iUPRFH7E+OYncrxeJrC0F953hdc/cgU2nfsP3ylQpK/6qRR03si0lKq3xsNcJRJsx/zD5fqJBXr5tlc/A7YdqsgJoC9cpCZziLT0K4cd2fIFjYdWKcQLOnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xmDQakv2nGiAKfN5UkGXPrLg4/XKwX+de6GNTKtdJU=;
 b=RcNDXZCtYZdQocKDjH7tWNZEoP4EhSV2gJ7yCN5ZSCAXUa0c+j34dckYgD4oKjU6LWo985g2Un98GOPGUPgMmwSxR1gpcOTvfBewUkSNyKSEgtXEccKIE5omWPYSDAEmqWUjMK1eLmD8zeoHFjNBFQ5Pkdb+LM+fUr1lHO+7TgocW4BZUotYzmUfxiLV9X67dRgOUQQyQeKA9KgOOqtEDcwDGUmbci17Rev6NqyCCghkIAuhGScvkEc/Tz0ogwtLyf4L81aBvfOrcsfbfIiKkslUzPekihdvkwqFdblPkfnt1k/RHatexbGDgNbI9+N54ac28dKkarrv62pcWov96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xmDQakv2nGiAKfN5UkGXPrLg4/XKwX+de6GNTKtdJU=;
 b=pT7lqAhCgdHtgt9VLTPAQ/mhEECi5K6r2yIAQtt/7X093e33YmPa4yYc2adFMUhA7y+HofJXeUOIsJkWWhp4Wqib6gAzXMB6IhJ6OifWJNjooAlZ5ukRuF7g5tz7dDAbEiNrBoHeQOvcTAlu1YZavi30xEqJLyB6qpFbq+CpDsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <58778d19-4000-4cde-bbb3-e59855bccd2a@citrix.com>
Date: Wed, 29 Jul 2026 12:57:40 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/2] tools/ocaml: Fix crash in
 Xenctrl.domain_getinfo{,list} on ARM
To: Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-2-andrew.cooper3@citrix.com>
 <1785325606.8631fc262581453bbf619ec5b2062170.19fadb2d454000e099@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1785325606.8631fc262581453bbf619ec5b2062170.19fadb2d454000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 3972be7b-65c9-4908-2f9b-08deed68992b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	6NEk0JWqtkpEyZlcT+55MHhmWLWM05xeOVwfFRlaTT41Oy4Qii138AgpIPkZN1TOytCLnOzM/xfdKvxh3Gs8Vwf/d4dcUDxMznH3MO1wIdhYNruK/h40K9VJ8N+uZZAYiYHu9BBJRKGU+boYEbUgFo+7kRrFLvGKbDdylbWwd0IsszsGGlfAAa5bFxmDsygkqGa/QjsKCDwsQjDV0/18THGm4rTp+l4XgM4bo6CfFfabmfbs59dtUmw+HypBGXNG7d/cd49hjj7WoESrFO0zFLwM++t9FL5WeCoeivary1rdF1YxTI1xO5wVfoZ5gfsQazfDeQb8uYc0v6/yjAM24mow7vbHjeeAcSiNZzslPuJNrPGepNRnf6JsNzLyzMVvBdRIDfF1sHIqDv0IAVCASx80O2DsamSDt2pw4mJaOcssXBpXosI3dRE2bjLTcqnx+DxyP9SrC6gPSut6xcj+0Sg/KSYBSkHdDZTc+YNFOdxnCwCy4yVpP//a2UKQIIc8l17/eAdaU3dt2Igir+qWNFFu05repbW1KL/UIeaeNsrXwFm3Oaj+D9lbsCSkdOxWhUCTuXKl24QZXMa1VYbto5DueZt6EPN55JIMcLDAxib5bi/OO4JOh4YOSEqQ5WA9OdzK9Y5Eq9b+6bub3Z6+QSwTDRF+EZKMjswcIkCmmVU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFpqRVo2bGJqQUlKaVFvT3JUN3NZVVhIeW9leTk4K0FVNC9ERktyUUszcGpZ?=
 =?utf-8?B?ZjNJbWdBUjk2SFVpdzUwUmswQU05Tmw1MEJGK1luVkFsa2lNbWhnMytPWjVP?=
 =?utf-8?B?T3h2bUZ6TTFvNy9ETTF6dC80Y2xaU3JldElvRFlyWWJDU0MrVG9CeHpITk1r?=
 =?utf-8?B?MEIxb2dQY2NtRVdzbnBtd3dVTkUySHpIaGxoeGdMYzNtNTl0YzNtaWYzZGNh?=
 =?utf-8?B?Q1ZHZ2JwUTF5TDBta3pzOE0xMVdBekFBTG5TbFNQQUZRVnZRSG9jdEErbGZ2?=
 =?utf-8?B?a2dFZUFRTkMxMTVTR2NPTGxBN0JDWW52QzF6WGNhek15NEFXcTdqZjdld2Vr?=
 =?utf-8?B?NWNYRW4rUmYxRnNKdnFzV0hQRGRhUEMvUFJ5U2d3SVhYSEs3bVh0M2ZhR0R2?=
 =?utf-8?B?Sm0zM2xKa0U3Si9vYXZ5a1d0NVdzT3YyVUtpWWJScnpyckRudTNTNDdNWDUy?=
 =?utf-8?B?NkF3ZEVKdDF3cFh5WW5yZkZ1TzJMNEFuQ2ZObXdoUGp2SjV6TXo2OURWVmhU?=
 =?utf-8?B?SjVxT0FuZHNoWVJpQnZTVjA4Z0hnbzJ0MFBsdkdtUkVCaWpXR0Z5b004N2Vj?=
 =?utf-8?B?K2JFWG9jekNFKzEyRDh6em1NYzF1MHNLczdIeExEc2FPNEc1MjdrUmM0WnF0?=
 =?utf-8?B?VTFqcXRmSU9YRG5ueUNOVWVWZkJPZDR6TCtGRE5HTnowL2h3U3doRmFXMFJD?=
 =?utf-8?B?UElBQkMwSXc1cDliVUV3UUJCN0dFdWxyY2k4WGpBb1djZS82ZGpXWTk0S280?=
 =?utf-8?B?NVZzdXZ1ZkdFWVhVbjl4UzZQSUhxVGw5eENBZjRVdDhJTkhOMG9iSE9mSUsr?=
 =?utf-8?B?VWpzNm1mOXhPMUtJUHZYSk55Ly9QQ3QvQXd4TVRWQmpYL2xoWFVHbjBLblI2?=
 =?utf-8?B?bkZoajFXVW5uTVBmdGkzc3J4WlZocXRvaE9rbFVtZHNpRDBaUVpEOWNwRWdG?=
 =?utf-8?B?Um9oNVNoQ05NSXp6RDdYRTg1T2plM2JlN2ZWWndwNXhCdndEK2lLRHRwbFFr?=
 =?utf-8?B?MWNmVW1VS3lYdGlDdWFNNkFGR0JwaUVHTTdKK2EzME1rcmtoM1EyTU9RcXZM?=
 =?utf-8?B?cHllYmZtbWxtRlN3QWh3ZjR5OTRyWDJQdFYyaUhRS1JxYnFuL21QVUtodW1i?=
 =?utf-8?B?a0lzQjc2MlRoSzA5S1A5SEFHODFyWFVTTWZMVEl5aUVtL0hhWXY0R1dzTDFk?=
 =?utf-8?B?S2RRU21kbHhiL2FyN21EenlPdGpqcmgzeXBUY1Y5ZUNwcUl5VjVmaGZ5RDY0?=
 =?utf-8?B?aEdXRFV3WFFsbUw1RDJFQnF4d3EvNjZzNUxKOXlMdUJTSFF1OHNyMUJQcW9Y?=
 =?utf-8?B?VTUvRUN6eVRaMTBhTWlNaU9GRUJJdVVEU05TWVZ3czVWNEtHbmZoMUdRN2xB?=
 =?utf-8?B?c1haaU9rSTFZRGhLeEVOTVlCZW9WbjVZeXc1dS9hTFhoY2wvTm8raXI0V1Er?=
 =?utf-8?B?NXd0RGFpSm9mU0lGeE5XU25PVERGWXFDMnkyYjBESFpDTG5QaFNlVlhldXRx?=
 =?utf-8?B?dzUzUHdUbmVmYmxRd2I3UGJGSXBLSEIyRWxyeFhGb3ZHb21xQ3RjVFBLZW1N?=
 =?utf-8?B?d1hEQkpiRHZOQXRKcHRkbGZyNkRqREJrblVxVVVzVHlHK1pocHFuRjZER0FJ?=
 =?utf-8?B?Q0NXMEhxUUgrUDJ2dklnSW8wVzl5ZEdVZFFXSEY5SmJUUlRUeWVuZlBYdmVx?=
 =?utf-8?B?YXVSYURHSG1vSTlqZ0NmeGJtemF5akg4THA4R0RLZnQzdU00Q0x4WHhMV2lR?=
 =?utf-8?B?ODlEbi9jaXZaTnFZOTQzTmVieXcxYkxDQXBNaG9XdStZdUJKMHZzRTNCNHdU?=
 =?utf-8?B?TWpTR3dmN1pSWUZrQ2t1Z2ZvRmVNTGpITUZ4Mm0vbWMzeEdlSlVUS1QwKytN?=
 =?utf-8?B?aXhpWWhHS25oQlpQblhDd1U0LzBkcXhwRGYyOURKSU9RK25lZmYvNGQ0dlZK?=
 =?utf-8?B?dTVvV1ZtK2I5ZVlkd2g2ZFhTRXlDMWp2UDNoRjhPQndvTHJJN0VXMWxieFVE?=
 =?utf-8?B?UmNjWlh2R1FINlVJUnNhZDFCdFN4T1hJVWJCSXN2U1Z3SDFadDRqZGQ2Z0k2?=
 =?utf-8?B?M0laaTZialgrTFFxWHRDS1gzMnZHL0lCRlVzL2d4Yko1VnhsdEx3RmZwK3BN?=
 =?utf-8?B?TFlzdmExZnVuQldyN01LNHM1bCtOczE1aDUwZ1ZwNWtxdUZpRXk4N2w5TzNG?=
 =?utf-8?B?Wlk5K0RUMTczOCtpV3REMGM4Nlg3eWx3d3N1OFdnKzh4NUM1N04zRExZV3Bo?=
 =?utf-8?B?ejRaRzl3R0FPYXpjRW94TUx3WGM4YzlpVUp6T0o0blB0THNrMFppQUtvYlEy?=
 =?utf-8?B?WVBvcWh5K1Z3STdKV09GU3VYMUpBQ25EQ0pLT2MxWk85a05YMXQvRCtNb2Vp?=
 =?utf-8?Q?dpowrAGdUuTPYddw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3972be7b-65c9-4908-2f9b-08deed68992b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:57:43.6864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts2D2b65wj9vHzC8Pb+t9P3p7+qilMFFu6SB9KDzI75HRuM9v78N4nD0ImbplX53HW7pTWocTP4R9bCErIdLMM3M8EuGr4N+wcDAAeIH3ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8094
X-purgate-ID: tlsNG-ebf023/1785326269-522D4B50-BE3F005A/0/0
X-purgate-type: clean
X-purgate-size: 1877

On 29/07/2026 12:46 pm, Teddy Astie wrote:
> Le 28/07/2026 à 17:49, Andrew Cooper a écrit :
>> The Store_field(result, 16, arch_config) sits inside an ifdef x86,
>> meaning
>> that on other archtiectures the pointer is not filled in.  The Ocaml
>> runtime
>> then falls over a NULL pointer (really the Val_unit used to initialise
>> 'result') when the layout in the heap doesn't match the type system.
>>
>> Rearrange alloc_domaininfo() to avoid this.  Similarly to
>> physinfo_arch_caps(), raise an exception if the architecture code hasn't
>> filled in an appropriate tag.  Move the setup of arch_domainconfig to be
>> common logic.
>>
>> In order to simplify the addition of other architectures, remove the
>> arch_config variable (resuing tmp as it's touched exactly once), and
>> rename
>> x86_arch_config to be arch_config so each architecture can fill in a
>> suitable
>> one without needing more local variables.
>>
>> Reported-by: Julian Vetter <julian.vetter@vates.tech>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech> 

Thanks.

> I guess that requires the OCaml user side to be appropriately patched
> to not get data in the wrong order ?

I don't quite understand the question.  There are no changes needed to
the OCaml side.  The problem is that this piece of C is not producing an
object that the type system describes.

Prior to this patch, Xenctrl.domain_getinfo on ARM produces a malformed
object with a missing (NULL-ish) interior pointer.  Attempts to
interpret this object in Ocaml code segfault.

With this patch, Xenctrl.domain_getinfo on ARM will unconditionally
raise Failure.  Ocaml code won't segfault, but the overall behaviour
isn't helpful.

With patch 2, Xenctrl.domain_getinfo on ARM gets you back a good object.

~Andrew

