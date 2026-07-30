Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0761DC54FD2
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 09:36:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377369.1623456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpNBE-0007bJ-HX; Thu, 30 Jul 2026 09:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377369.1623456; Thu, 30 Jul 2026 09:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpNBE-0007bC-Ep; Thu, 30 Jul 2026 09:35:56 +0000
Received: by outflank-mailman (input) for mailman id 1377369;
 Thu, 30 Jul 2026 09:35:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wpNBD-0007b2-T8
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 09:35:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpNBB-005SNd-Dn
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 11:35:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b1af2-2eae-0a2a0a5409dd-0a2a450abd52-16
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:35:53 +0200
Received: from [52.101.56.52]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b1af8-f2d2-0a2a450a0019-34653834d0d1-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:35:53 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL4PR03MB8049.namprd03.prod.outlook.com (2603:10b6:208:590::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 09:35:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Thu, 30 Jul 2026
 09:35:49 +0000
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
 b=YRu/Py/WKkNnCoXKv0orvD5i/Bfs8gKi8GKAwEG6wJPSQBDwfN9oD3JU75YEl9lNTS2E7LNPPbuqhGnBMBtRN3HU9AkVTsRPp81p667f0pxBogJl9aXBmSx85C21fzqDHMCwolq6WW56PfWGpVXweqAiFKr9uFSNuLBx/mbiwYbF4MRPIHFU1s7P0uuJoLwRQ/zDSQCp/DTHHoSOo5LUM687qPK41JudcZ8ccQjS07LoQKNmZR+jmnViP16YbHkQDsG23s/aM3uVlZicqYnGdu23IqpMwe5I5/6aTQxQCDvIrH2mtInzX11NMgHCqCy0M7AJFDgD48thIHVC1FnWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXMB2xlutwy0YusPBoRFUDaPN80huiBFLjqYC/f27RI=;
 b=wG9Osfl6vJwfKz5p1896fVlReCCTjGI+xH8VHl4slakJUOEE7OsSRl/RjALsAAUdvCVlbSGoCBqqBtqYGFnBIhcM4TZYvyJUlNOPotQE/qEiJJAn4wDLUxiqHtG6U1Ka/BrxyYG0Pahf1RptukOHGDvCGq/iqLWdUa4Ly3gW2DrTTmPCr33Z+Z2f5QyOYYmWpC4osty0B+RUu8NOLbm2H1mD9bIxTl8CWKitSUgorSxjzM14bbsFplw3OV72thT37hwqqHJ+4VIGoeLfjauW6a5Lyovmh7lzHPRbgt23HGFg5qQbXeuji/YylsF3JH4Q6tY+4B4S5nEp04nT9ltHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXMB2xlutwy0YusPBoRFUDaPN80huiBFLjqYC/f27RI=;
 b=LEcMchRznHpWMUwCZn9DDWjb9BC90wH8sKENw0AY2WAU+MdhG/ncopS/V4PZ8l6PhShE4BjCixX5Wtj0J8LeUDbS6kxXvLeY5Jm4qXmrCn6ejwdx820DEAnAq9vKJg2IVZtyGw5jDycAzh0atIZ79PHxB/C7gfjfwCDoZbYtQ08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dadee869-5ab8-48c3-8eb7-3b760eb6e12a@citrix.com>
Date: Thu, 30 Jul 2026 10:35:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/2] tools/ocaml: Fill arch_config for ARM in
 domain_getinfo{,list}()
To: Julian Vetter <julian.vetter@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-3-andrew.cooper3@citrix.com>
 <1785400990.8631fc262581453bbf619ec5b2062170.19fb2311930000e099@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1785400990.8631fc262581453bbf619ec5b2062170.19fb2311930000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL4PR03MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 49048f3b-a1bd-4c81-3508-08deee1df0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+vV1CwJ3fX3tkefWv05FgfZSfw2pvuxpc9rXUDDWUd2VngmtXuWJqTJSWqMk20Fl2ezwyePssuxbaXPMyDAgXMsbgrCdr1kjU7cxO3tNqvkQmvBn0gUoLiC4xwXCMV/7r7MufYGFDLylsKON4O/Oc+Qdb0R+sZSyxRfBdLeKeNVOFuPaGD2DGMdmv1TP2kLeJkq/cFp5UhsQUUxvUjLdgHEMm3+XjK1c/17SEGbcMl7407ey936PJMPPOT5bnuSbxK8z5pXe3lLpo5vX/d7HG2a8wq5tAwvl7LUS0lpWEBi4KY6rowSD6qkPBOFTmhVN6I24PgMVFt600aF6GRX3ANDqiQAc+feDpAwzr45/VXkE2Tec1KjGLRTGfQ30UZ3wNkr1L6O0pIighK+7jEhuyoEswSNCods2DRuGdpGH2x/p15kSf0FiIoJZviPjmxixI3fi4958qv/+ZBdpORO/azBlomxJX+uyyUzkpuYa8zYJO1ddkvL2fpHtcZBrMi6x1wg+VkVMmk8PGsHrL+6LDp+Sa7Fe9TkYlMfolcsERzNcTdwQ12tz9rxBObC/8PkF/CRxuPj/DQei/RQRfJyYOuwc7mXMfcIg4Wvz4uV5oBLcin+myfo0jsr3ZvUtZJ3yBQ2tvn3AGGpvJwzhHFEHf0UdKgjW1HUaXHNUKenZaWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEN0ZkFTV1QrZUtMcGd5YWdsM3psT0k4dGllRlF5cElnemVncGdSV04rY1l2?=
 =?utf-8?B?TTJGR0ZJWXhnbGFRdll1TE9pMkZmOUVMRFdmWEZLcFMwZzcya3dqVlh5NlAy?=
 =?utf-8?B?bWUvczYxclgwMGpSdU9tYWxCa2UreGpnbG9WdCtwZyt5ZFdMZVBEWm9YV2lH?=
 =?utf-8?B?SmhNYTNGa0hYK2I4WkhMYlJhM1hNeUd6eWZmTlM5bk1leng2bW1SbnlZdlBk?=
 =?utf-8?B?V21XS0ZlaDRPejlRUHFONlNXTzA5WW1CNVFZWGRYZUU3MVRsNzllRTR5OWdH?=
 =?utf-8?B?VXU2ZURKMEVZTy80RUpUNXI5NlQvYWsrdDhmVjI2cTltREVNM1BFSEJQSGtl?=
 =?utf-8?B?R2czOGh4TmxHTlRWZEpNNmVIVXJPTjl5dGp2Mm5TazdmSE9TZWo4UDlnQk5Q?=
 =?utf-8?B?TXVyYXJqN3ZqTkgyMWt0VFBkMjBWS0ZGcmZkejFpTWpUajBFdGNJYlhkbVBI?=
 =?utf-8?B?SkxCdGZncFF6MGRlM2I4cUlUNGJDaGVVMFVBOVdjd0FQWVFsT2E0aVBrRWsv?=
 =?utf-8?B?YUc2dURLRUZ1UGorZWVTVGgzbWpoQXFGN2lSRWs1MEhBN1Z2QlluVnVXVFgv?=
 =?utf-8?B?TkV1WFFIeWV2ZDlTWGRPZ0h3d3BvWnU3SmpZeUtoLy9wa1R5NWdYRGxQTzlK?=
 =?utf-8?B?T3QzVmg0aWRraitnZXF2N2ZpR3JBdDc4Wk5vdDdPQmhHR0ZNaitIcUFJOVpq?=
 =?utf-8?B?aEZzVjczVEZJbVY5RXpsdWNpejBSK20wNEUzeHB4aEtnU05YdzlEaUNmR3Vq?=
 =?utf-8?B?TXZuZ2MvQUZxcEpjUTl2M3YzbEVPZWc0OFQzWUwwOVVTYkFSajRVS25BeU1B?=
 =?utf-8?B?bTQyREJmU2k2dkNpeVN4OXhzU3REOXA4N1lhSUhFMTVmRk9KMlJSWnhOeUtP?=
 =?utf-8?B?Y29OTEkvV2dIMVlaamZjSzQwMGY1TEM1N0lnNWF2aFRzbFJxQzgva3dzR2dZ?=
 =?utf-8?B?OVF2WTBaY09uM0s2Q0xRVTlJYjRGcWNVTDBSR3JyRXJjMXNtN2s2WGYraThQ?=
 =?utf-8?B?TDJuVWhDRDRYc05UMGpRTC9UQjk4U1NVbjlUajkxU3pIZFBscklEbFJkcDky?=
 =?utf-8?B?Mm1WRjdLTEJteC9iajFlVnVyYTBBaHc2SkVoKzBiSkpzQjJqVkRVNURqWVFM?=
 =?utf-8?B?cExPeXBkbkxjWFdDU2MzZDN1NTBwTGJ2WXFmcWoyTkVlbEY3eTE2KzdPbmdp?=
 =?utf-8?B?U0JnZGVXSkhvazlDRUh5ZXZxcWhhVHVlWkJ3b1IwY2wrSk53Sk9WVVNhcy9B?=
 =?utf-8?B?ckk2T21icG00ME9KMXBTMDBVdk1hcEhCY1dGMGU2cWJrWnBBZGJOZU9MSEs0?=
 =?utf-8?B?ZGczdlgrYzVDcGl4b3JWaWdDVVhHSFdLSUhJbW1GZ1hsYkJQTENFaEptWU9x?=
 =?utf-8?B?TVJVZklKb1U0UU9TZkR6OHlWTFRVV05sanloL3hVWHBCZFZycXBieWVCaWlz?=
 =?utf-8?B?OUg4ejNhVXdrL2ZYcFA5QS9qNEtXaElKZEpVRGIxMXRhU1JHMlJvMU1XaWIy?=
 =?utf-8?B?M1dwWmxUejM5c09mUGNpSGwrUmhoeHBrWW1LWGlOTkEzMGxDSmJkVCtoeStX?=
 =?utf-8?B?ZE9aam01ZklMdm5YN2JsRXlJbTVZVkxwOC9PQS9QUm5oWTNzQ3AwcWdVVlc0?=
 =?utf-8?B?VHlWVUFWRjl0c3BYdmY4SW0xWkhtVE82THYyS051b0h6S2xmWkZQTHg1L0J6?=
 =?utf-8?B?ek5CeHVmT3QvT25lcFZvOUp6T2lCeEdMWW9zZ2x0YjhjUmdwSEdQREJoUXZ4?=
 =?utf-8?B?L052Q2lBdmlIcCt0bDJiTnRZRDFUdWpRSjN1WkQ4V2c4c3lWRlBNSnJPMHdt?=
 =?utf-8?B?MzF0R2Y2WlNaQ0d0OVN6T0k5Mm1uUFA0RGNnRWJTU0xLblIvK0FuZ1ZVSFRX?=
 =?utf-8?B?R0Zna1N0RnNSZ3pKLzIzY0cwZUNPMWhyMUltZ1FNbmx1K0loc0hkWk5qRVB4?=
 =?utf-8?B?dlRQdTkvLzFVcDhpQnNkM0xFRkhmaTNMdW5JSGtldEFnamhBWTVRUUtDc0ZM?=
 =?utf-8?B?Y3p3OUVucEMrRnJFV1c2VTdQd3FlQzkyM0VhUEJqcWxTR29RSXoxTWI5Yy90?=
 =?utf-8?B?RE9PVXZuc3lQQVBZTGovSVRJdDlnUDJkbmtjZWg1QnVhZ1UyTWdiWjhZcEhE?=
 =?utf-8?B?MG1UcVhxRVdaaUtqUTE1NGQ4RjBJVjloNW95M3Z0ZkVDSjlNYkJNc0JGTXA3?=
 =?utf-8?B?S1NGdzd3TVVnNzQyZGJ1ZjlhNzQyMjhLakYrbCtBMmpIbldYR2hXV28zMHQz?=
 =?utf-8?B?NFVIUWpSNmhkcHlHczVKZlJaM3IySTVTSDFnQWVEMjBaUk9ZRktQbWJvVVJE?=
 =?utf-8?B?NGZQTllWVXBib1RlVEY2SHQzTzNpVkdVNFRka3oyL1h0T3lsWG9HRlpWVGJQ?=
 =?utf-8?Q?RqjAHCFcnXK8TjXo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49048f3b-a1bd-4c81-3508-08deee1df0ed
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:35:49.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MteuZ6y2iL/pYq4ZIJpkHbCDMZfVmln7d1Gp8wFRZPH1tOZm8IymSOrppm3JzA/KByvFs7l5pVF8KmYmtpoAr+vIVtqFq2rp92wzkc3imr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8049
X-purgate-ID: tlsNG-4011c0/1785404153-504CFCFC-0C5F6D89/10/73395122804
X-purgate-type: spam
X-purgate-size: 3344

On 30/07/2026 9:43 am, Julian Vetter wrote:
>
> On 7/28/26 17:48, Andrew Cooper wrote:
>> From: Julian Vetter <julian.vetter@vates.tech>
>>
>> Add the missing ARM logic, populating xen_arm_arch_domainconfig
>> from the raw xc_domaininfo_t the same way the x86 branch does for
>> xen_x86_arch_domainconfig.
>>
>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>> CC: Andrii Sultanov <andriy.sultanov@vates.tech>
>> CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
>> CC: Julian Vetter <julian.vetter@vates.tech>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   tools/ocaml/libs/xc/xenctrl_stubs.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
>> index 441e1d83cfec..fb983709066f 100644
>> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
>> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
>> @@ -444,9 +444,21 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
>>   
>>   	Store_field(result, 15, tmp);
>>   
>> -#if defined(__i386__) || defined(__x86_64__)
>> +#if defined(__arm__) || defined(__aarch64__)
>>   
>> -	tag = 1; /* tag x86 */
>> +	tag = 0; /* tag ARM */
>> +
>> +        /* xen_arm_arch_domainconfig */
>> +        arch_config = caml_alloc_tuple(3);
>> +        Field(arch_config, 0) = Val_int(info->arch_config.gic_version);
>> +        Field(arch_config, 1) = Val_int(info->arch_config.nr_spis);
>> +
>> +	tmp = caml_copy_int32(info->arch_config.clock_frequency);
>> +        Field(arch_config, 2) = tmp;
> Shouldn't the Field() be a `Store_field(arch_config, 2, tmp);`, because 
> the `caml_copy_int32` makes an allocation on the minor heap to allow 
> OCAML's GC to keep track of this pointer if ever the arch_config is 
> promoted?

No (ish).  The Ocaml/C manual is subtly wrong in it's advice about this.

Using Store_field() would be safe, but it has an obscene overhead for a
scalar store, and caml_modify() does a whole bunch of barriers/atomics
which are not necessary on anything which isn't allocated from
caml_alloc_shr() (which we don't use at all).

The buggy construct is:

    Field(foo, bar) = caml_{copy,alloc,etc}(baz);

because C does not provide an ordering between evaluation of the Rvalue
vs the Lvalue.  Specifically, if the Lvalue were evaluated prior to the
function call, then indeed we could store into a stale pointer.

But, using tmp in the way we do:

    tmp = caml_copy_*(baz);
    Field(foo, bar) = tmp;

puts a sequence point after calling caml_copy_*(), and prior to
evaluating Field(), so guarantees to do them in the correct order.

In the Store_field() macro, this occurs by taking (val) into a local
variable, and not because of how it calls caml_modify().


In a perfect world we'd have a Store_field() that arranged for the
intermediate safety without calling caml_modify().

It is also telling that the Ocaml runtime has a total of 15 uses of
Store_field, and we've got more than that in this function alone, let
alone the rest of our bindings.

I do have a cleanup patch for those as well, once we got this bug sorted.

~Andrew

