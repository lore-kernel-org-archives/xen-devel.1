Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CBCC79F82
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 18:20:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408993.1641226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2YWR-0007Nk-0l; Fri, 04 Sep 2026 18:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408993.1641226; Fri, 04 Sep 2026 18:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2YWQ-0007Nd-UA; Fri, 04 Sep 2026 18:20:18 +0000
Received: by outflank-mailman (input) for mailman id 1408993;
 Fri, 04 Sep 2026 18:20:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x2YWP-0007NX-B6
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 18:20:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2YWO-0007Zn-5q
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 20:20:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9b0ba2-2eae-0a2a0a5409dd-0a2a4503b2c6-34
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 20:20:16 +0200
Received: from [52.101.57.8]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9b0bdf-fae8-0a2a45030019-346539082ecf-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 20:20:15 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7854.namprd03.prod.outlook.com (2603:10b6:806:433::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:20:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:20:12 +0000
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
 b=HymuAomGaQejLO/QPpK6byFpfFTFTRkaGQHAYNUbwm07TguEEf7OiJUG3IK1Jzpfwa+95KxoFqanGBMpTQEPvndKcRY41waYSk7Mx6Lb97cPBPB6diqqMUEthkCmCMIawciHy5j8LS1OvCTG5/TkV+BUA6fptfSmTm6U+FMRmtxteF14a4iP7qUvRtJDfIZblnYGxCmTJRAC9uvE8sXDcht4aBo0oOfa++4zR8CPNLMloanwIex2seOPPXYGMnaNIxF3GTlcS9LL5w3dswWu/VYdJ3YaAUg+Pk+SfQVZsy4Nd8dS8e25Zk5K4A25q4k8zlL28taYfPSxIEvAX/At+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qaKEsLC8SALULxW4bwGJJYR6zksEJVMDAwXSqFpIoY=;
 b=aPfUGAkAGTIXzxlOqPKaejDOHZ7xvgk7xECo9fB5qPBlPTTQ1kLQVZxmYiz2O5IdO0f4AbCYPdXYonFZqbnJm3jpf4vSx+SQYFqJDpuPmcW1r62zXE/V+ClZrXpkEaiuNt2MlzHD/xZS4VXf8sR3NG+s2Uy9f6EyXmCtIW3GhwdsD258+12JG1u/FUYNGHPa2j8z2rZ6APN+5fn7KXfHmxDrweMdSN/tJH3h/BjN1mwTglKgDI3Me+uKV0imYpcAA2MlfC67x/S1Rx9mPy4SRKpy7Q5Zijn+QF986xHYbYOXI7iTIeiP3IB/LqvUT+NX/rjxr/KwLWuAME9vebOBwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qaKEsLC8SALULxW4bwGJJYR6zksEJVMDAwXSqFpIoY=;
 b=rnHaD/2JpGc2wVWmvVSXVrqzwHiuvA/jkicIQUcvu5gl3hXeoCO64cV1J1c1o1CtupDcfyRgfMVQSmo69zoHLDDLzl81wJFtbNAG1TauOPPnl1GNsVsLV/qkK7zMxmBkiZuW+MQrs48BDCP6XTFgj97tjoMhvYCNm5clE213Zn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1dbfedb4-d3a3-4d11-9b24-dea509c38dad@citrix.com>
Date: Fri, 4 Sep 2026 19:20:08 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH v2 5/5] xen/arm: Rewrite arm_smccc_*() to return by value
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
 <20260904111228.3022634-6-andrew.cooper3@citrix.com>
 <9301544B-8F8D-4E27-9BFA-B7244633B41F@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9301544B-8F8D-4E27-9BFA-B7244633B41F@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 4675eb76-891d-4500-d3a9-08df0ab128b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|3023799007|18002099003|10067099003|4143699003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	xrg+soBStrgt7/t6DoU24UxHM1TvP9EK9RZbNYXSD0W8S2hmBbGtc8j9jYbpnZGm/99jScXczXJtvGOTnp23QsOqkcAI4+emkXyJIgOyuOhAIKNAQQBIbNg+yEabPucW4+k0tCPCNCHws4QhxMdbRKx83AHgypUWFupxx4A92KnwVEvG/WL0jMkH5egSgHAuNHPKiRIQ7Qz7pwSUD+LPla7y5B3At+OfAKUIvI93jJUAYQ3xaYhFTB+J1xENppt+VdAt3oJiFrApYYy6nG2AEQ/9FW2xYE/i5Evk2lHFl6tVjUvAG3CyNqNJuROFip+fZNKEeI8c7x9dJH4/D/3cAVv8Fs3On3I6TydAtdc2WDgPB811aGR5N2CsARfCNIUPyL+dicZ8Qvs/Xv7FmqZTK+OfzTxQBoHL90Ku4GaM3UabQiY3i0Y66ZwrhnmEbaarVl0u7stuD4lrXxInOk+02LbD+t1vHwJENrmVXMO+7OJ/rDS8Q59BWe4t5l2n4V2Q0t15MSIAc7lyNd3aEKoepXpz01OG5+fHWK2r1kPuqo+RzJ27JrXb9NZOEKqj1bTBO1q571/GSZk+Oep04i0MhJOzjDGIMYVu9ZfuxbUM28RF0svpg6OhZb8GPJwmiShpy4bRGY0W1D4mPKqUXg0F99t8p667H/AgINxwb4TG0KU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(3023799007)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnJTNHh2TktVT1hzVy9QVGRXMjdnc2J2ZlNSamZKZDdHajBRL0hXMnN0ZWZR?=
 =?utf-8?B?QWlTTkJ2dmk4ZlZtdnVudkZLakMzdDVQTExrd25nWHQyNlkrOE9mOGh4aTBG?=
 =?utf-8?B?d3JzbDA2WGEyY2JVaE15cDRmellBT2NwWDFhRk00QW5JMG9nMWFURjFSMWJJ?=
 =?utf-8?B?bEYxMXo2Z1lmYUQrT3hLZmdEeGVDczhPUGhNdW5qTVRDQjhlRmtuK1RHUFkv?=
 =?utf-8?B?MktSR2JTNlBSVjF3WjRkRVFwalZ1Zk5ncnE3bGc2SzlCNEp5bXhXVXJsd2hD?=
 =?utf-8?B?MThpRnowdnV0Z3hBd2VCR085NVIzSlQzNm54ZjN1dWVFS1I2ZFcwZ3FyVG5r?=
 =?utf-8?B?bGxMSHhrYWFjeG1uNHZMS0RIaWk1aHB4MDU5ZHYwc2RMaFQyRk1xdU5uRTdQ?=
 =?utf-8?B?SzNLT0pSVjdUbHZDWFJ2aUx5N2VjVmxxVlNRV01DRjF3ZFg5SS8ycnZLMDFT?=
 =?utf-8?B?UjROcDNZUkF3b2VCclhzVGM2dkcwc3RzVFJITDJYWXBVc0VNVWxLZlBFbkw3?=
 =?utf-8?B?Y1U4eThwWE5MM1d5RzcyeEUzNGlBenFvSmxQUEQxNktGbzNJZ2tSamkvK1Zj?=
 =?utf-8?B?bHkycGlOTDhMTVhaaTU2ZWMxTXBIUkd5K0xOekh3emJKZGI4VjMwejQ1TlU5?=
 =?utf-8?B?REVnSVJqditIR3c5bENPbnJGUHJGckpNdDRWSVBET0w1aTkrcjFpODdhQnd6?=
 =?utf-8?B?eTJoZ004elY5VHdtTEZMUDNRMU5kZWFkUGFRM2s1QVpaNzFGMjFVVlRobTVa?=
 =?utf-8?B?MjI4V2F0MzdaMjNpZ1lhSUFVbFpqbDBqcUtYWWdEN0RmdGZoYUNjdlpTZmlt?=
 =?utf-8?B?T1I2RWF0TlpmUWdzeTZXSW05NjNmOEFLS0U1OWhTaUdVaEFDU21ZTkw0UmEx?=
 =?utf-8?B?Z295NmRpUlZJdDFQY2tJdk01UDdURmYyK3htZ2ovbEt3cUxJajM0Y2Z6akNv?=
 =?utf-8?B?WG4rTHdSYUl1RVBCV2c2Y3pBdDlNWFl6WnZvaVFqZkZqWWVUQWE0NnlyUmxk?=
 =?utf-8?B?RzRkQ0VJRG9Sek1Hd3NXN3FENXZkTHlCZXhZQXFBQmlodit4YnlyMng1KzBN?=
 =?utf-8?B?YVM5TFJSNDN6bzcwNzQ3OHphaUJybkV1RFNCVTB4cVRmRXRpZGsyems0VTcz?=
 =?utf-8?B?eGxVMi9wS0lpc3NSNjJrL3lBdWx4OXZGMjlMa0lYeFZsKzJiZG9iaXZCb3VS?=
 =?utf-8?B?NU1pUWN4WWtpTXMxeXErWFd1K3ArT0NmWjF1Qnhhd0hOa0RSMWU5ZGRxYStS?=
 =?utf-8?B?Q0VVRjliZHcvWmNhN0ZuZE1KdFJoOC9aZXN0NVVhdm9sbG41ZklubEg5ZWcw?=
 =?utf-8?B?bWlwZ0dNbzhMdnpqRWZKZ1IycnBiTitwYmNVOURMRWYwbUJUVDI4eFp2ZEUr?=
 =?utf-8?B?andqQWhRb2RNbEdPcTZqN3laamkrcFl2NWFZdU5TdTgrZ0dMY3o4eG0yYjV1?=
 =?utf-8?B?emxWUGgvaG82MEVESWF3UmJMT0FDYmdVQjZDNFZoRFhPVE5qS3YvMUdTUjZO?=
 =?utf-8?B?dzJRRUtkdU5aL2tZT3VobitOK2RuS29heCtiWHhrbW9hRVlPald1Vlk2MHNL?=
 =?utf-8?B?eW9SKzA2eC9MM1NQaWF1WkdiQTVyTzFHT2NZWkJxQWhTSHRMUzh1aFkzZU9l?=
 =?utf-8?B?MUtsUDRoNW5Cak9FY1ozWTZlcDZsNHl6aHNnbjVSeHd5TDd5S0JGZFdZLzNa?=
 =?utf-8?B?MllNMExFS3FidHl5SXNrZ01Da2lsSW1WZ0lHdnE2WDArcG9qb2MvSXlIanVD?=
 =?utf-8?B?VUpsRXRRTUc4T2VwTHRLVlZjSlFaVVNVKzE0UmdHMVk0b3dIYVFYdFVLQ2xY?=
 =?utf-8?B?QUg0aUJuUy9QY3FmcVZEQmFFOVkyaHgrNExkYnU5enNSNWNicmZwY0o2TmRC?=
 =?utf-8?B?WmhNUWhlOFZzSkNKWGQ0YmphNitORnpsd29jQ1p6ZmhRMDVQaXE5NlR6VEFI?=
 =?utf-8?B?T0JKejZZajFWTUFIa0QwZmdpR2pic2V0Q1M5TEt6cDVXL2lSemhreHdQUVRT?=
 =?utf-8?B?bFNtYVV3ZzByeVhhNEkwUldSeC9CcFozTEVXK0JlUGF6Z3RDdWtzQzg3QUt1?=
 =?utf-8?B?NjBGdFErVjJJSE5JaktNZVVxeGE1U0RNU0xZbTdoT1VnbUxRY1lvWEhQdW9T?=
 =?utf-8?B?Zlp2QXVnTE42aGI3SmF4T1AxQU9HRUUzaklEeCtONVo4V3VmVVdOZCtQMkRW?=
 =?utf-8?B?R0l1ZjdTaHVMb2lraFNHN0pudnNRR0FQdTdCUmllZEs4UzdEYkVEa3h4RjFh?=
 =?utf-8?B?YUdGdVI2ZlJkbktBVkdWVXBzbVVPWElYWEtIMHFlN3B6ZEo5UVNET0ljK2pK?=
 =?utf-8?B?dTE0UHZqVWZSY2p4MXpRalhXMUNtUGlCakFNVnBSRUl3YkhoUTFXZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4675eb76-891d-4500-d3a9-08df0ab128b8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:20:11.9479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE1jNjxv/fXobqn/iHEIl6NZmHttWLrTT/ZGcXIBdVzgxueuyxBA/tr4S90Md+NYMzGDRLZEbpkrnsqPBwIcyz+2fT6gYgCC9hI/h+4eWes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7854
X-purgate-ID: tlsNG-33051d/1788546016-6F4C74E9-49B23C76/0/0
X-purgate-type: clean
X-purgate-size: 2488

On 04/09/2026 1:13 pm, Bertrand Marquis wrote:
> Hi Andrew,
>
>> On 4 Sep 2026, at 13:12, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
>> index 4ed2a40ed0ac..2d0f2db0b256 100644
>> --- a/xen/arch/arm/include/asm/smccc.h
>> +++ b/xen/arch/arm/include/asm/smccc.h
>> @@ -181,21 +174,20 @@ struct arm_smccc_res {
>>  * makes it stick.
>>  */
>> #define arm_smccc_1_1_smc(...)                                  \
> The comment would need fixing on top of this  as current
> one still describes the optional @res argument while now 
> we only take a0 to a7 as arguments and return the structure 
> instead.

Are you happy with this delta?

diff --git a/xen/arch/arm/include/asm/smccc.h
b/xen/arch/arm/include/asm/smccc.h
index 2d0f2db0b256..c7763acd7f7d 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -159,15 +159,14 @@ struct arm_smccc_res {
  * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
  *
  * This is a variadic macro taking one to eight source arguments, and
- * an optional return structure.
+ * returns four values.
  *
  * @a0-a7: arguments passed in registers 0 to 7
  * @res: result values from registers 0 to 3
  *
  * This macro is used to make SMC calls following SMC Calling
Convention v1.1.
  * The content of the supplied param are copied to registers 0 to 7 prior
- * to the SMC instruction. The return values are updated with the content
- * from register 0 to 3 on return from the SMC instruction if not NULL.
+ * to the SMC instruction.
  *
  * We have an output list that is not necessarily used, and GCC feels
  * entitled to optimise the whole sequence away. "volatile" is what

The overall comment now reads:

/*
 * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
 *
 * This is a variadic macro taking one to eight source arguments, and
 * returns four values.
 *
 * @a0-a7: arguments passed in registers 0 to 7
 * @res: result values from registers 0 to 3
 *
 * This macro is used to make SMC calls following SMC Calling Convention
v1.1.
 * The content of the supplied param are copied to registers 0 to 7 prior
 * to the SMC instruction.
 *
 * We have an output list that is not necessarily used, and GCC feels
 * entitled to optimise the whole sequence away. "volatile" is what
 * makes it stick.
 */

~Andrew

