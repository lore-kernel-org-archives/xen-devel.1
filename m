Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DA6C54F4D
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:53:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374949.1622301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok7F-0000D9-GR; Tue, 28 Jul 2026 15:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374949.1622301; Tue, 28 Jul 2026 15:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok7F-0000D2-DO; Tue, 28 Jul 2026 15:53:13 +0000
Received: by outflank-mailman (input) for mailman id 1374949;
 Tue, 28 Jul 2026 15:53:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wok7E-0000Cu-Cz
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:53:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wok7D-00Bkuq-Pg
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:53:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a68d050-2eae-0a2a0a5409dd-0a2a4509e126-38
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:53:11 +0200
Received: from [52.101.57.21]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a68d066-be1a-0a2a45090019-346539151283-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:53:11 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by SJ0PR03MB989404.namprd03.prod.outlook.com (2603:10b6:a03:3eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Tue, 28 Jul
 2026 15:53:07 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0245.009; Tue, 28 Jul 2026
 15:53:07 +0000
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
 b=YFApPQ1kCHnw1V5NxcMJENnkO6fNopja4zBITe4TQktJ8FuHy7t2aKc9hmzjNniQGrs8dC+TJiuNeVRz3nMtyqwKREsSKyUCVgDemr+BLlgw3XTnpY5OM5cULEJI9/IHvhCRrOknbRpNyMfHYLxCyaU+q3nfrAmUr+oUbSG2yZ8GyliCaN7sWYVRhc4w1Q8lI7Z1c87W4iv6e5bX0KnmULT7AuDJM51N3rtv6kX+6Tvc1Zj26PWTMwCWopg8zOgP4R/wXCdxkhc8C0E+bhGvpSAwSW07BQk2tNvgSq8madMpbtN9YyFi8KvvLNWMAfj5+YzqzReU4NJ2W2rCTLjC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVi732cu1rQbmzHKuByGEaSRP6ebxV9seoMEFUNT5DA=;
 b=Obs9s3qOu8hF6p+9FdSnNcxUZ7KG0bmrlseFnG1ig6CXozQs90WFEGe4NuzkXgpLlR9s2ObEZWNcrx9xx5jevTNNKVbnADJCGIwRJuI+0gFTUkB95mMLDbhy7dEa3RkG+ddcqUCb8uNqzdBpFLyR39tgMQ3TTfq+h298pHgvODTBGAOLdDsP1RAdHsMoXWlZ5WCBRCibOZwvcttmQrBoozsX/Im+kmH2oFAA7fgajlZf9XfDbrN+mmh938Txtz5DKKrf3jkg9Q5BtfK/FU/kA6xI0SYALiWimT4wUTdk4zMIYn598dEMkj/ghGLq25vhlt8hoD8+Fof+SSsNFlvRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVi732cu1rQbmzHKuByGEaSRP6ebxV9seoMEFUNT5DA=;
 b=iN2sVoVhBwEcfINwNPmq4rEBZvZtDUAf+0VjhYt+KWOMLUE1SvZFHrGY05oghZLrHoMPpQUMKzzpzkwSJ3MzrYC4moI0RwObBOVnJpd3yY1Ul9HT5sB4nx3hoiKX4G+X+BDweimAY1M3f9hT3E8BajaPV2/TQ5vHjNt67DNRadA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ae1b0ff3-7e47-4893-85c6-8cf6ab0b9d6e@citrix.com>
Date: Tue, 28 Jul 2026 16:53:03 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] tools/ocaml: Fill arch_config for ARM in
 domain_getinfo{,list}()
To: Jan Beulich <jbeulich@suse.com>, Julian Vetter <julian.vetter@vates.tech>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-3-andrew.cooper3@citrix.com>
 <b9380d60-8e2e-456d-aec9-d5bb38050cb6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b9380d60-8e2e-456d-aec9-d5bb38050cb6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::8) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|SJ0PR03MB989404:EE_
X-MS-Office365-Filtering-Correlation-Id: 170234d2-defb-4902-4b09-08deecc0514f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|6133799003|10067099003|4143699003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6pfrUjJ2xyB86vVFEOB4vdbD44WlapMBYK7ne5ChCIT94OUVn9oHyb5DpORcSv8nLfz08Yf5koL34xbpvpR4lk2GE2YGCVB2gu4Z+ySKk4j9bPJD8xSK1ZyRiSCsnLxfHWUx0sT4x4NvMfnG8j5x9W/rotCtg+uA+pzz8ScnICjJhV7O1umgHKtXehEJ2ImGwyk9R75denmW8jF9Rgd8jPHUnG9E9pknjdDMhnSeBypav128HodntcVBi341TVdYm7k358JyQfI+4fyf7wzdUPYU2OiUNqUCD149EvdNMmBP66KLEqWdTNZOKx4yFDvhzZQHATCaLgFuqOknaNBG5JtAYxfp4b2MLkYIoXJ1WQ9STDPZgV1M/biTvL0r8oEZzALcgvJAB15afg8aMguVNufesNpYfoPtsSvPeBFUZeWhWjI5hE4sY5vt0Tmyk3mkZdA3KKP03wWeIx3Xq8QZVDZifgPRK+JbuRYgOMNb/KEWjym2DChI7jyTM2cSAOwHbb5SZcAdwDTd3n2i/zMeepfy0TQ9V04a28waMs1mqRypxaYBM4rAa9eVecuvRIzzK6DWZCpd9WLNUcywjUUXnTyBp8UyB2gTb6L88COtGk2RP36AfuFJogpBL6ROkw4/yNIBJudrEfn4Bx4PBI/f/3rpLXsg7E5yKpmVENufHt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(10067099003)(4143699003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVVOQitmMldFY1JSV1I4YjdjdmRqVXpzaVcvUnhzT2c0KzdqbjFOVmJPY3JJ?=
 =?utf-8?B?ZlZMK1BmM2RSRHJTdzJ1YnR3MG9oSDgwY2VabWVvdmVxa3grZjh2Y3cwZ1lj?=
 =?utf-8?B?RmNnSjd1U3R3bEowVWlhdnl0N2hyWEVpUzlYcnFPQjc2d3hDM3RiSzBqM29t?=
 =?utf-8?B?d1AzVkdkQmE3SHN5N0tzSHB4OC9sTkZaK2VKZmZpRmNtb3JWT1M4U21OeTlH?=
 =?utf-8?B?R1FqbERKbUtqcmpRVW1mcFdlbHNVZ0lwQmo3Qml2V29VOXVFc3pkZ0Y0enRv?=
 =?utf-8?B?MUdTTC94SUVsQWNNSm9ONURtakZIL21TbHA0V2t2Z3c5VzZhQ2RmZEVKYk43?=
 =?utf-8?B?Y0RDcXVQSjFiejFIMGZzM0w1VXV1d2F4by9vMGFWZzlWeHdzU05ITkUyc0c0?=
 =?utf-8?B?Mll4Z1BCL2RoRUZOR1RQTnFYQkJvRE1qVkcxd01BUGJQNDM0VnJTTk1ZTVVL?=
 =?utf-8?B?KzgyekJqZ0hhYTBGeXRnVnl6ZklYL2RybnZOT1BhdHMrdGQ1RTV3RjJKT3cx?=
 =?utf-8?B?NE5MSUNiMjlQZ1BsKzFYZXd4SWpLV2dJWjZEWmRCcWQ5dGZOOG85MTU1SVZu?=
 =?utf-8?B?ZDlVL2RKOHhpSysyNFM3My9VYmJPdGFieU14dVFlWkJMNGR3bnZXMnBUSG0x?=
 =?utf-8?B?cGhUR1dFcmlWcGRBUUxxMHlTOGFzQ0dTUGJyVHFNNzlFZ3BldzJlUmdqWWpC?=
 =?utf-8?B?WFpFcGE5dFh2eUdibmZOOGk3cHlJa2ZhQXpWNXdzdVpuZW9RQ1BZeXYrcEFy?=
 =?utf-8?B?bUwrV1dsSTZmdUttL3ZCK3NhSDU4WUU1cDhXZkRLaUN4NnJKV0pvc29yeEx6?=
 =?utf-8?B?QVk5VWhacmhEdysvbkp0WU9vN29HQVpXN0lOVC9mTk40YWszTW1iSml1VkJZ?=
 =?utf-8?B?REo0ejRRWExnMUN1MUtkMlZhWFgzbWEyY0FSUm8zdHBIMGFxN3NVczJZWjQ0?=
 =?utf-8?B?QzNJMSt3K3c3S3JZdUFCaGthVkxKV21KM1AzS0pCSTRNY3lRaUNMNXdmd05L?=
 =?utf-8?B?OVFqWG9takI2ZWdsY01QNzJuODJPLzhHb1VZTjdKNEd6bTM5MGE3eUZtQ1Ux?=
 =?utf-8?B?QkRTNTZkTm1xekR3dmgza0RoYUpLYU15RVZyelgzSkszS3JoYU9BOERncTgv?=
 =?utf-8?B?amVGdzlkdjFma3ZZOU91K29JcW1uQk5YYzBGZWtDTzhpSEpWejRUUUw4d2VI?=
 =?utf-8?B?blFJR1pwNC9QZVptVWNHSU9rZVR5UUs1eXJMcDZNNWpzaWhIemZrWFdRaGxL?=
 =?utf-8?B?UC96aVVTOVoya3BzRGd5ajFJWEFERlg3Q01BQTdmQnlES2JBWEUzUHVwNTRR?=
 =?utf-8?B?RFJQdnM0cnVsUWhTaEg5SVh5Sm9RSXR1VmZQRWo0UE5rQVVoUWlVY3Z2VzBM?=
 =?utf-8?B?V2EvYmtsTExuZHVucjdkNktvQ3FZTFVNZXJPdUtrWWlLV1ovMmZJUDhqc2Jx?=
 =?utf-8?B?TzFraWdSUUxpY2xwNUVSRG1sSDNqZDk1akdCRkliT2IvRlV5ZVFkdy9ROGJl?=
 =?utf-8?B?ZmhjVk4vQXo4aEJHRGplVWZkT2VXM3VlWVhtQ1l6U25CTFpvYUdTcDBZZit2?=
 =?utf-8?B?dXpjeTArUnRPM3NBSkNUTVo4K0g4amFjS3dRMlRZNzdUWGovNTQzdlVSQW1W?=
 =?utf-8?B?M3ljSkZPZnpLeUdCVzJjNTVLZFlPYzhSOXViRGtOanRpWTRmeko4a2FhcHJV?=
 =?utf-8?B?Qk1UVHo4WWF6aW1QaEl5c3Z3ekFtaS9nR2p1K2VPOWtaMWxHd05VNW5OOENP?=
 =?utf-8?B?QzEvNjNpdkhvR2FKVCt4dklDdkQzZko5NWI0dTc3d0N2dDVNRGFWcHFTakkr?=
 =?utf-8?B?eEJNVnQrVE1SdWNtQ0RwRU1IeGNzYS9lQW1ZTVdHTHhRdldKT2podzFHZ1pl?=
 =?utf-8?B?RnRqTnpXaHE2QkJ0UHRCTVpMVmV0MjdCbXIyN1RUZmMwWWZqb3BkRXFURUJW?=
 =?utf-8?B?eGNOaG96c1JLL2ViZWRYTDdBd0hpdUN4cEJlRzBFcnNTOUtjS2ZseUltTFU0?=
 =?utf-8?B?RTA4Y2JQMCtMczJyNXVsTWZWVnUxTks2dHlsQjlZbk9vZW9qUVBpeFRZNTZy?=
 =?utf-8?B?T1hrN2o2dzFheVRjemFUNVgwQWladTN5cmRXV3l1QWphWU1FV1lzQ2trQkF6?=
 =?utf-8?B?dG1vRDRTYzU0czhxcUx0eWwvU0Z2OEdWZDNOeVVqUDFSRi9DVXVheG1qa0Nk?=
 =?utf-8?B?TnQ0SlJWbGxaNjZxRWdwTXRYOUpueEJueG5tV3dFNmhQYlRodnd2c3J3OE94?=
 =?utf-8?B?Qi83RDlnbkRNK2ZhODlvVUlmUjhIZ2t2cWJoWVBtRXMydDNRVHY3emkzaG1C?=
 =?utf-8?B?UWpPRzZlWFJ6cFlOVDVwelRYM2dKeFkwaFc5WW1OYTVZSzN2VU1SUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170234d2-defb-4902-4b09-08deecc0514f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:53:07.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMEhoeUu47eKQHUCfZdyS5wb5+lK4bjuY/rVxcfLWFT1Xa7LYylYU7l+mVu9gqeRwOuj+ci8HU6kgz+5hoeeXe6boLh3a1dg2CnHgQes/TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB989404
X-purgate-ID: tlsNG-bad1c0/1785253991-BC4CB034-88B411CE/0/0
X-purgate-type: clean
X-purgate-size: 1229

On 28/07/2026 4:52 pm, Jan Beulich wrote:
> On 28.07.2026 17:48, Andrew Cooper wrote:
>> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
>> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
>> @@ -444,9 +444,21 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
>>  
>>  	Store_field(result, 15, tmp);
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
>> +
>> +#elif defined(__i386__) || defined(__x86_64__)
>> +
>> +        tag = 1; /* tag x86 */
>>  
>>  	/*
>>  	 * emulation_flags: x86_arch_emulation_flags list;
> I know nothing about style rules or conventions here, but simply from
> looking at the diff I came to wonder: Is this mix of tab vs space
> indentation deliberate?

No, unintentional.  I'll fix up locally.

~Andrew

