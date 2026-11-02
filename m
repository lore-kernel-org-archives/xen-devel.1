Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7BB606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=rbV9Jt80
Received: from list by lists.xenproject.org with outflank-mailman.1468103.1677124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNpPn-0003rk-Sa; Mon, 02 Nov 2026 10:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468103.1677124; Mon, 02 Nov 2026 10:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNpPn-0003rd-PC; Mon, 02 Nov 2026 10:37:23 +0000
Received: by outflank-mailman (input) for mailman id 1468103;
 Mon, 02 Nov 2026 10:37:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNpPm-0003rX-Hk
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:37:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNpPl-007IZT-Ey
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 11:37:21 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae867df-bab6-0a2a0a5309dd-0a2a450684ec-10
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:37:21 +0100
Received: from [52.101.72.82]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae867e1-195a-0a2a45060019-346548522461-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:37:21 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AM7PR03MB6165.eurprd03.prod.outlook.com (2603:10a6:20b:141::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:37:19 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:37:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVYko8SU2NdwMWoX7EJiJe6XnvSS685H3oNldViJ8G/mX7/WsZgNwjaX74hS+68MTMTHeTVa5pjBojl+Z5FkIZ/AwgSlf1XLGistx34QIekauCewYpphLJwfePBXu1M8KCEfcFRpHpFWdt9RI/ZWsd7hV0O+Nf7H7O6t9QZZkABuF2RbdL8luIM8gHjfEKpSfznT4Nj6Rz4vIjrWTa0yptTFJRKF63+qXPZMqFttxJJlKVbAg3cPy4j9e0HnPx3f6JD1xBJBeAam+b3FUiLh4Q+l8ckHTD1Nf7bTFrAgV2vVaCggmY4eR3kwcRT3EOC3MjDx0k85wZ074N5tSXgTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ca4HOpVLcNuIyEyBUpsPqC7WaTK3GpBsh39cN6RRjho=;
 b=JgfP05Skly3Nt7l4gc5ZEWSiNiNMandN3gy1pTybFpTV8owV2rhIDOBrxsgG5wrosfmZbFrgJh8KwwjQCZY3VvLDn/uZVGLyzTcSMt2EqyKWVSgsj9/JYg28wA57Efzg2FsWu1cpa8grv5wmbIeKVfA8ZRvj6e+lzPzBwJKCEHq2GoSGhtlI0BxXIKIU15AcX8+rFW1jAvP2dU77311dkka23qHl2YiYvdNPcbzMlr9ScpVMsLnKMz6iODZK/Kul3izBp+HlQOXCJqVBiVOH942FQU99FharrjcZqGNzqpF1rc2gsGl45YmqBdSHmrB8wF49kJEo27g3omgSkxV/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ca4HOpVLcNuIyEyBUpsPqC7WaTK3GpBsh39cN6RRjho=;
 b=rbV9Jt80k5fTGbXWMLKuofSqDli+kcyioty3X6av8K6VgAuBkttO2p36jSHOvRwm9D8DNzyQ8v6YyiefDMAI5rvzk2+CcRvWnEImZcGavO/w2/y4CKX79eTSIS8a2yrvJOxpBWB/HXduFmfxQ7rxjgRNVXXrpT7oN0fSTZoR8tb4zqWnagqSznQW14WHywxoYpzuEoeODt2mmCAOW8wSiuvIurkqyZmf5IIJFL2hjznWV4Br4sEXbKnfNIxprcMvt9dKFI7JESgUy2ZSuxE4ypSVPmdVo3nr3JKFqtO8IrBUsnEfj+sfCCVl2ZzHO1vv8LMXmRJSZlJ5Rg/FEN5nDQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <250b2af2-04bd-4ff7-be00-1abfff52dfe4@epam.com>
Date: Mon, 2 Nov 2026 12:37:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cab890c77bfbb016e79f847d6dfddac993079f40.1792406297.git.dmytro_prokopchuk1@epam.com>
 <f50e40f9-6ce0-46aa-916f-fac7e97b7a0d@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <f50e40f9-6ce0-46aa-916f-fac7e97b7a0d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::35) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|AM7PR03MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0a8b86-e3e5-4492-80c5-08df38cd4541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/Z9aQ7CVdkKyZ1f5hiZprfIfuw0r5qqUTFmuuseKwOKoI4iKvvabSXa/Q5DNOnRVO/JHZoLhgzZyehYPQpN0UEyYAn3/kjgWMnK2RXvani9oNMFRzEpMi+KoaT0vty5tUw/K/r+ZlvLiEs5KRI4KGFa5LFhLBjVUbkz5gCCSlDL+VyZ32CO0pN8lsCITT9UxzuCQk5YiSKTgdo916c7liWnCEELtoHVjN6LOPYIvfyRan28iyNewYYevrZwlcVt6lbrz6cJsI5JEq1j0j8s7GOCiZ7uPeNN2inZKR1bP5V3WVd0siteJv1GogGCQeC2uphpBOFcikmxcnxF8QqHC500aMYz8EhpsSI6pG83coC/nAjX01QgfGfsD9LCp2SBI+jJTBSc44pcbYCzbWhIccVXIv2Mor7poMsymePwiOnI2AEGtCMzHsLf8IiCOrWxGgZTUZbVyMH/iIw4kYsGpMEMOSNmNuaf2LrkWBw2t8WcDlpTeZAnXzfJOgJEoAm0Mflsarzkt+M1uTsmZkn+9gfVd5FM/lhAVWT3wtDD3ZYEvOjLP4bQlCG6wYWKdxCwD+peGqOvfoSsDR6qR+MSaxdteinNTU7iIeHh18ARFzU82EVvknPYl35xCC1GnQo0iDOl8XJZlDKqHY+OtfwXPOI99yUNfUUaZ3Qkeh+m56Fw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjlzYkFYWkhMRHBqWEUwN0tydy9RNEZKQThvK1NRbFhISFpkbGFBSDBjTmx0?=
 =?utf-8?B?eDAxeExJTXppTmthSVprNFVFZDhDQU1ONUJTVmd5T1JDZ21NY1VCVy9mQXE5?=
 =?utf-8?B?UDF3U1FERXNDVnJ6QkxmUHE4ZU82WDFiT3ZsVVhoaXE5S01zT09kNVo3Q0U0?=
 =?utf-8?B?S2RZMm4vODFmTzBXSi82a0RIK3FFaDdOWHZWS1ZTMWFZMXJoK0NRY1o3eTZ0?=
 =?utf-8?B?OGxuaGplbUU5SzZyallaVXpoWGNldFlLM2lwWThseHN6VnR1R2plczFGbVh1?=
 =?utf-8?B?OWRLZ05tU0pBTk9aandmSVlMRUhCcURWTUJ1cFpWNVNFOVlINjV3WjhYSHVz?=
 =?utf-8?B?R2VlTGtoNkcrUjVnMG5UYzBUOXNlMUlRZ1VWbFBlVVp6dWtTNkV6S1ZFaUhh?=
 =?utf-8?B?WnRJckZkd1JyWG4rclVvUSsrSWJ6MFhSbWFtVnZqQWRXK0M1cE5HbDhtR09Q?=
 =?utf-8?B?MkRGVzFjdXhzeDJoWm0rWVcxZUVZZ3I5YXphSTNvdlRJUEpIcnQ2NWFjSTlo?=
 =?utf-8?B?V2s4UlRKTzJoRnp1YjJIbTlUWHJGYm9UeGkvQ2oydjhEWWhCdUIvMy9PVllw?=
 =?utf-8?B?RHZYdTZSOE1Mc1ZoVmtWdWoxdTdrMkxtUkkyYzlEbG9JTWVhNVZJd2VRN0NX?=
 =?utf-8?B?eERYT2NvOHdTb3R4QldrYlZvK2JRK3RLb2R6OVVHekd5VS8ycmFFRTIwZCt2?=
 =?utf-8?B?ZkVVSWE5LytDNUpLZ3dkZXZ1QTFuendqMUNMMk00NCtIRmtYRjRGWkdYckh3?=
 =?utf-8?B?MmV5OEpINGpTMmhsWHJOd1Uwb1IzOHYrb3J5THI5U2t4Qjc2QlRlSHdPUGZQ?=
 =?utf-8?B?ZGVoK0Z0VTFTY0hHbFVmUE5hcEtxdzJGTkZ0Y2R4MzlobVQ0d1BwME9IeUkv?=
 =?utf-8?B?UW5kVW1UMHJKeTNtMlVXMHpWTks5SFdIS0xDRS9xWGIrQmNmUkdGOGxNT2tz?=
 =?utf-8?B?RlBZN0ozQzlwUkVGalFkVTMvQ2thelJFMWxXOEFoMHVoQk52cHZjRWdtSEg5?=
 =?utf-8?B?RTdnZHZyNmpUczgyZkYrelIvUnY0SnhyczYwb3lZTDNHYU54SVg1WldCUFBN?=
 =?utf-8?B?WWUvRWlUUW5iUjdDMS92UDhHc2gwSmlUQWpKU0dOSTNPd1FYN0F3NDgvenpl?=
 =?utf-8?B?MmphLzF2MEU1eWJaY0I4cXM5eGVIUjlzSHZ4eFY3dUtQM2doUGNKcDNWNUxv?=
 =?utf-8?B?NG4vaVVoZGZGNkJkZFk2NFJkQzlCQUxLbVdZKzk3Zm0vN2t6RDJiZEVRSnFP?=
 =?utf-8?B?R2FGQ2kzSzZYbXZCc1hvZWVxc1R1M3RPQ3VEVkRaTmVzUDdkWkpOalJqVC9S?=
 =?utf-8?B?bGR3bnRuaVRvVzM4Z0dRbmZFMU0xdDlZb1BQLzQza3Rwc2toRUxXUEVhNlAz?=
 =?utf-8?B?a2FHL3FwZlFyYm9OSGtGclV3OGxIbitJVGN4QUtUcys2RWJ1RXdsMnBUUmVE?=
 =?utf-8?B?enh3QmE0cmpkVkJHYis0ck9kY2t4UTJ6TGdEWE9iZVB1WG51REJnMHRxTU15?=
 =?utf-8?B?RXhQOGpsTEhBa0pBdDdxMVNrZkVBNzhkS3ArRm53ems2bWsrd2pTRDZjODU2?=
 =?utf-8?B?TE5RS1JyQ3BDU1ZSRk9IbXVxc250NnUvSnhIYW9GNWFBUTRSQ001eTJQWTVV?=
 =?utf-8?B?cTZBQi9oNjdudm1heHNyTmRNRkdlT2t6UjQ4N3pSZDNMbDNmcTRudUJkd1BE?=
 =?utf-8?B?SEtOWTRlZktZaXBSeTBCVnZwdVFpTmF1SWpqdGszb054QmtmVHNFZDJWNlVT?=
 =?utf-8?B?WE1aS2NwaiszZkd2clJIcmlzMEQxaml6UHFhdDk0TEpYdHRtMGV3c2htREg4?=
 =?utf-8?B?RDhEQldhSkFvazZCeU1yL3U0NGhyY2JrelorR2RNWi9hdkRhVi9CVmF1aUxl?=
 =?utf-8?B?NitSeFdwMEtWR2EwbWc1eFhPdjBPWGd3UmgyN08zc2hOWlRHUXJGSllGVis4?=
 =?utf-8?B?elRZMWptemU3cjZPV0JaUEFMcFQxQWxSVUE2Rnh3RllJbkw1cTNGa1BiZVpj?=
 =?utf-8?B?WHJISnZaYnVBbWZReEY5Z1hOTmlnNDNDUDFzSXBpZVhDVVoxWlBsekdWSW9M?=
 =?utf-8?B?WjZKQ2JyZjAyWnVuZVVwMUFIbUJNR1dSZ3ZVN3QxaXVtaGpBMUhjbUtOYXVG?=
 =?utf-8?B?MHZJU1BTc0gwUStDZkpBL3hhSzNIMFVRckVjaDRzbVoyTXhmVzRHbWl0QUFp?=
 =?utf-8?B?c3hnelJHbTRoWm1LWE5COVpPSC9lZGJKUU44UjVxd3hsTWdRc29kaWcvdWhv?=
 =?utf-8?B?am1uWEVadFYvRiszbkpsbWE0R0tyeGFnZ3ByMXlCOElBdVFHc0lmTWJlWXhZ?=
 =?utf-8?B?ZkhuL21GTElsMnA2RnpncWNOZVZVMTNRbVVKbGhaTHVVa0dNZUhaRDByZVdI?=
 =?utf-8?Q?PSqSUZZzbw4Sk2oQ=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0a8b86-e3e5-4492-80c5-08df38cd4541
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:37:19.2733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WlborshXSqsWp27ApSUYljtqd4x2/qP8DiGkOv6hj/46Ggdy3sqLHcx0O0zlhZCRYZWwrQfk+rjZe1pV/v5WIsgzXO7G/UGE1N3IudJ1Sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6165
X-purgate-ID: tlsNG-16d1c6/1793615841-1F6C877B-BFBC8F4B/10/78276251493
X-purgate-type: spam
X-purgate-size: 2156
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/26 13:09, Jan Beulich wrote:
> On 19.10.2026 12:41, Dmytro Prokopchuk1 wrote:
>> bsearch(), memchr(), strchr(), strpbrk(), strrchr() and strstr() all
>> accept a const pointer/object but return a non-const pointer to the
>> matched element or byte, matching their standard C library interfaces.
>> The casts in these implementations strip const so that callers searching
>> a non-const object get back a mutable pointer. Fixing this would require
>> changing the public API, so document these uses as deviations instead.
> 
> Imo "public API" is misleading here, as it could mean "public interface",
> which isn't affected here at all. Then ...

Agreed. I'll reword the last sentence to:
"Avoiding the casts would require deviating from the standard C library
prototypes of these functions, so document these uses as deviations
instead."

> 
>> Update docs/misra/rules.rst to note that this class of double-use
>> library functions is deviated on a per-function basis.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Albeit there another minor remark:
> 
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -450,6 +450,14 @@ write or not"
>>   -config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(hvm_guestcopy)&&text(^.*__hvm_copy.*HVMCOPY_to_guest doesn't modify.*$)))"}
>>   -doc_end
>>   
>> +-doc_begin="Functions bsearch(), memchr(), strchr(), strpbrk(), strrchr() and
>> +strstr() accept a const pointer/object and return a non-const pointer to the
>> +matched element or byte, matching their standard C library interfaces. The
>> +casts in these implementations strip const so that a search of a non-const
>> +object yields a mutable pointer. This use is deemed safe."
>> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(^xen/include/xen/bsearch\\.h$||^xen/lib/(memchr|strchr|strpbrk|strrchr|strstr)\\.c$)))"}
>> +-doc_end
> 
> Can't we fold strchr and strrchr here, e.g. as simple as (memchr|str+chr|strpbrk|strstr)?


> 
> Jan


