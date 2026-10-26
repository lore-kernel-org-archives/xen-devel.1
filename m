Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40978606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=y9/hJRXH
Received: from list by lists.xenproject.org with outflank-mailman.1461152.1672113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJ6H-0006Rz-CY; Mon, 26 Oct 2026 11:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461152.1672113; Mon, 26 Oct 2026 11:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJ6H-0006Rs-87; Mon, 26 Oct 2026 11:42:49 +0000
Received: by outflank-mailman (input) for mailman id 1461152;
 Mon, 26 Oct 2026 11:42:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xLJ6F-0006Rm-Td
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:42:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJ6F-002y8W-AV
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:42:47 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf3ca9-8faa-0a2a0a5109dd-0a2a4508ca28-32
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:42:47 +0100
Received: from [52.101.48.39]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf3cb5-f659-0a2a45080019-34653027c449-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:42:46 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6598.namprd03.prod.outlook.com (2603:10b6:a03:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:42:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 11:42:41 +0000
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
 b=sW7fkIPRyvszBsgYAJJoiLiXx30Jo//QbG2ibJ68RoUToum2rvrBMbH1dqpY1Di9K6PM7RHz5UuI7CJJZLXoFE/0kCWoXwiGqgPSehVxpGxwm+1uXF4FKdLwXGAOLeQsy02/N0fYdoOaQrqnUIE0ZnGpNGa9RpkfuHuJI9C66Ui3y+gcyibWxKCYzYt2q+m4ZqDLXj2oswWWVtMWDxOYUOie3RYyi2asT1FJjJW+yhISD3nEib8s8zN0Xr/zDqm6OtjxBpqNB0vE5Fm3k1pZSleoOTc7q4I3sCFDdsGph1Awh8/JKH05rAJhLSCJ6jaoSYeseLFxRjzCf6+czgXekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FukvoVM4ETQ9fcfHekUbRmCsHm3zWnmvZr0oaIU+IKE=;
 b=b98Wz+JYtJMxy10qsGunVaUPiz7dGeacOcq6yRpzbqAX09duCSAyaoNlWtvAbdGu/agVMxpuhnHKqwu3FY9a73K+XY9jH6MbobBDUf2dtG1Iuuf+oazs582LGHBrkL2nWTxUwGvDPMwZPHKQhU93yYOiJOaOWqwVctXf3cwX7zk5XTRWHZPnutC8FO5I7mfSkkzo5AHdm7K8qk2qDG47sA6ZQvrGNKEYaHVJtNmIrxiQwrAlWg7YcrauW5v7M/CGxF2W/VX0DaHvVQvgDxoPgFG3Gc9kGIaaxBUSVxDU6mH3uktizaDy+E6/V0sIQOrQUJF674nGXIp3/W0HUnLu7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FukvoVM4ETQ9fcfHekUbRmCsHm3zWnmvZr0oaIU+IKE=;
 b=y9/hJRXHvpDXqv8nyhk1Hq/UYkOVwu3iuSj92xBS0MXdQ5qPWC2PltHmp7m6sVgWcfRQGEG1zE7NOJlelzlcadAqCfNYOYO0AirZXmfab+rtfLAKsm13bk/9ARjqWtQ9QdzdeYsCo5LyZBGCwCD6HPh3tSdaJz9/vkPiVGfT73A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <97d772f1-322f-43f6-a793-fdbba16c7f04@citrix.com>
Date: Mon, 26 Oct 2026 11:42:37 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger@xenproject.org,
 ross.lagerwall@citrix.com, sstabellini@kernel.org, julien@xen.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 anthony.perard@vates.tech, jbeulich@suse.com, teddy.astie@vates.tech
Subject: Re: [RFC 5/5] xen/x86: livepatch: enable attaching callbacks
To: Ryo Takakura <takakura@valinux.co.jp>, xen-devel@lists.xenproject.org
References: <20261023044809.162759-1-takakura@valinux.co.jp>
 <20261023045808.165276-1-takakura@valinux.co.jp>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261023045808.165276-1-takakura@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0608.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: 3796448b-2cca-4e64-08a0-08df33563e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|4143699003|11063799006|56012099006|261021130227099003|261021133027099003|261021121427099003|261021123027099003|261022105027099003|261022115727099003|261021135927099003|261022113327099003|261022075727099003|261009223027099003|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AR3xJEjv0zGvWOA+by6aPIFRlVCPyHeifvkVDNNxbgddGtiiqWUqqXWsnLUoHaR/PUhd7ilvDbZwczDcEcFzt9DaPI4YqJZoosTVQuxaGLfP4KEKiXRxXI75cIvjKtzSo4liD7/UoTqXEvB0SqAE8Giu9WqD3V9ymCZ2zSnyirTWUQBXDIUCIRdUXNMfGX6efnw1HeZKqzHoNtIcC6acXWi7DA7mLYgqTx/ncA9seN1fKVJjTs3XjxhR3ZZFWRQYMK/Slx0l22MfkHjU4/1NhlIDMb0NDLoEXYAYtUyC96qzdKgs6pSOEQe3D6wgC3pQr3lMaQVTjT/6hsbfiG5lnswuDTGZ3e7QXm+8geLpXGyax/irBdQFh5Xu0QUaD/F+Ehc+qr97P2WNsTSG1Sw2hUZ37UylFsIq/6EANvyCFTomAv0N0cbJaB7L7brlIGQOfbtBudnig/S1nljnq7uI8RngErKgiBCsiQuso4fM25jN7Zn5EEd7lW1XhEAzh9HACX2G5VQUCX8DfjZXE0BI2VmpglYjuENsrwM9XVIVDqUYpL2TYhYoK0wlEKJHU1NZWJtq6zTxYKmBPIwgMN6skc+s+RsZ/2hDPpMw4MqOwn0j6tMNC6OXTZ5GBA1qr3WilMHAnPVZa5FqY7ibDnA/5HVVO+SuqL/i6dfZKHGAk2c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(261021130227099003)(261021133027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022115727099003)(261021135927099003)(261022113327099003)(261022075727099003)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHk1NU1NalkrV1I2WkFZT1d6L1phTnJoaEVGdno0VlNwSmZHQ3MzK0ovZGR3?=
 =?utf-8?B?R05QVlZBNzNRVG1qbW1FVS94UmdaaFA1WnBkQjM0RHg0cTZoVDk3dEtVRmJ1?=
 =?utf-8?B?d0h5d21leUUraTZFUDhHNTBtSjQwMm9CdGNYL215dmlrY0tBKzA4TUFEOWtM?=
 =?utf-8?B?MnpGK0JScGFPY0sxMWJDWnZkOGU2aVdCM29iVEhlZ3FENW03cHlHcU5VS1p1?=
 =?utf-8?B?RHFnL1E5bDNWUmQ0T0w0ZE5QMEppMnRaV0ozN3l4SzNQZURRRlhkbnY3dzZw?=
 =?utf-8?B?UXJWTy9ERTVYQVFhR0lXM3EyaVNIbUdQdHk1dEhNVHpjcDZ6cXd2WkN3WVVU?=
 =?utf-8?B?RXF6MFphZWhGc0VqemU5U0VLOUZMenRDRkVRZEVNZWhsb3dSYkpCU2YyV0JK?=
 =?utf-8?B?d2hyT1dpVzMrclhzR2dndmxEVGExSXczdDluaE9yUmZoWTBpMjk3YXlOSzdF?=
 =?utf-8?B?eWI4d0s5UkQ2NG1GSCtLYUMyMDdXdXRQM0ZSRUtiY2xuNFN2Z1hEYWVqR1FL?=
 =?utf-8?B?OXNJSS9DTkwxYTNFNi9HRndWbXhKVnpUL3ovbGJHRlcxMnRXRG1TQ085ZFl2?=
 =?utf-8?B?b0ZPS1RWNHJBSTFqa2lHRFZlY1I2WG9GaXloenk5OGJYU0laQlJjMGY1U29z?=
 =?utf-8?B?YWZVOWxrcWhCSGszNDJqajZvSTRna1pNaWNEOGxaSGV6SVhZTFl6elBiZnRB?=
 =?utf-8?B?WWdxWDY3V1lwWmVRU01FbjdyUXBvTnhONjVzL3UxNmxKUlk4M2w3dnNjbStv?=
 =?utf-8?B?Z2l4ZG9vVHd0Z2dNVndITmsvZCtUd0hVTnJjRm9lU0R1bGZma2ZxTC9hcXo2?=
 =?utf-8?B?YmFKeU4zbXgycFB3cmgrVVFoWGZ3Y0Q2MDVyc1VXNHpRS00rVE5ZNHZ3ME1a?=
 =?utf-8?B?Z0djNkhpUEdockRIVzFrdXJ0NDlKMmN2WXpnU1RzNGlGc3ZCckhRWE5xWnpS?=
 =?utf-8?B?ZkxBWmEwRkNsNXhOcHNtMklzNFZRNXdTc01leGxUSVNOSStzcGpFT0hmdFJo?=
 =?utf-8?B?WSs3QlZYYUFNazNVRmZRTG1HbGJoR3RTR29DSWlLV0JoZi80QjF0RHI2VkUv?=
 =?utf-8?B?RTBqT3BnM1ptVXJsbjNkNml5S2dHN3pXSnBtOGhLMTIrcUxvRHFRSEFKWmg1?=
 =?utf-8?B?Qm1lMERodGthektIK0JTaGZDZmNKOXYzUU9aZVRQeTU0ZzN5WDBzVVNKQTRl?=
 =?utf-8?B?ZkxwOVBrdDh2V29KckJUR2VnNjY4clZ2Q240SEhpb1hZdVFKZlhqaTBtSE43?=
 =?utf-8?B?MEMzZWtCWlMzSnVFem9kSlpxNVBaOHJVSjBzZ3N5RnVhUVhiR21EMjJMY3Jo?=
 =?utf-8?B?QWl3WFVURHpGWUlJZXphSDJyRXY5WUpBQnc2L3I2VHc0SDladXdIZ3FaVnhX?=
 =?utf-8?B?UGYyaW9jRlQvY0lGajdza2ZHS1JVbmJMOFpuUVFaYVhoNElKMmpvYmJCY0Vm?=
 =?utf-8?B?SUNLbGc2QStyK0JoM3B5WnkrL2RndVlZSXFVbnA2U3FFUDZlamlqbEMrQjIw?=
 =?utf-8?B?ZDNTdXc5SVlHeDBYRjBaWFlWbHRVRHhBbU03RU5kZ2NWWTlPL216ZFRRVEVD?=
 =?utf-8?B?WGtTcmhLVWZ3ODE2cmNHSEJPOTZaRHZ2bHhZMXVrVzFaWGQ1a3pjYmh2T2FH?=
 =?utf-8?B?TExFSVJ6MFM4UEZKR0E0WE5XemdpZUdUckVHeFpQWllNaVJaT0NCUDQ5Y0l6?=
 =?utf-8?B?U0JQNGJ0VFIxMWJiNzZ3RTR6RWlBQlV0SUdzdklrSTlhRUlaVlNVWDNzVFBO?=
 =?utf-8?B?VGpqdUE4Zi84Zjk4eXkxSWcvZTZxWlNrbUxiMGJiL0FzZFdXakFGa2dyR0g2?=
 =?utf-8?B?ZTVyWlFDQy9NNzhkTnNNUHBESytrL2FJcTRLUlFLckcrRXRHNFp0aXVMOUFW?=
 =?utf-8?B?dzVNNGZBYzY1MnEyYjVjYjVueWNDOGs1VS9iUDFRTmE5V28xVGcwTXhKQkd0?=
 =?utf-8?B?UlJDc0hhYjR6R05ScGdiK3owdSsrdDA5Z0dIRnlkaVJRRTVxSWtBUXl5eXZG?=
 =?utf-8?B?WWZYZWhHdnNhS3Z4d1FFQmhmemhIaTYwenVJZ1d6S3VDZ0pscEVDS1k0NVh6?=
 =?utf-8?B?b1M4OWh2WlAvdUQ5U2VneCtUM2xxbUUvUXV1aFF3eXNPTTRxd0FCaHd3NVgw?=
 =?utf-8?B?ZmRzRzhsNG9oRmxIdDBrN0tKMEhZNkhmRFNMNE85Unl1aXMzUS9IV1FETEM2?=
 =?utf-8?B?dVc2d2FocUJrYTR0VTFMU3pTalV2M2huWmp5R3FaamJxa0x0ZFA1SlNZN2tZ?=
 =?utf-8?B?eDIwelpQWFlybDZVczJXSE9jTHNkdGszUTJMSzNMWGVIS1BPUGI1dDNtd3lO?=
 =?utf-8?B?WkpSQnBMYjgvbHJ3VzRWTEdJY3ovVXhRWm1jUmRmaUcwbVNLWkRGdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3796448b-2cca-4e64-08a0-08df33563e55
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:42:41.7150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hOItfT0t++zAYdNDDmYkzG/inSDFhxJjIbEild4Q5PJmcAxG4V1QrRFfF+Dtf7a5EJJ2hdbxTYfSNKaouXCIF1Ykb9dFVnFUvKvKNvdUD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6598
X-purgate-ID: tlsNG-c1860d/1793014967-CD94A87B-1F5DB433/0/0
X-purgate-type: clean
X-purgate-size: 5085
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 5:58 am, Ryo Takakura wrote:
> diff --git a/xen/arch/x86/livepatch-asm.S b/xen/arch/x86/livepatch-asm.S
> new file mode 100644
> index 0000000000..005765b476
> --- /dev/null
> +++ b/xen/arch/x86/livepatch-asm.S
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <asm/asm_defns.h>
> +
> +        .text
> +

You need ".file __FILE__" too.  IIRC this is a workaround for a binutils
bug.

> +/*
> + * xen/arch/x86/livepatch-asm.S
> + *
> + * Trampoline for livepatch tracer.
> + *
> + * If livepatch tracer is enabled, function entries are placed
> + * with five NOPs. arch_livepatch_apply_trace() will be livepatching
> + * those NOPs to:
> + *
> + *     CALL      xen_livepatch_trace_caller
> + *
> + * 0(%rsp): traced function + 5
> + * 8(%rsp): return address to the traced function's caller

Somewhere in this comment needs to say that all GPRs need preserving.

Except...  Looking at arch_generic_hweightl(), my notes about
__attribute__((no_caller_saved_registers)) say GCC >= 7 and 8 is already
a minimum for the (broken) patchable function entry, let alone the fixed
one.

So I think you don't need an ASM trampoline at all.  I think you can
merge xen_livepatch_trace_caller() and xen_livepatch_trace_dispatcher()
and just tell the compiler to spill all ABI registers.

Also, the xen_ prefixes are redundant.  Just name the function
livepatch_trace_caller().

> + */
> +FUNC(xen_livepatch_trace_caller)
> +        pushq   %rbp
> +        movq    %rsp, %rbp
> +        pushfq
> +
> +        /* Preserve general-purpose registers. */
> +        pushq   %rax
> +        pushq   %rcx
> +        pushq   %rdx
> +        pushq   %rsi
> +        pushq   %rdi
> +        pushq   %r8
> +        pushq   %r9
> +        pushq   %r10
> +        pushq   %r11
> +
> +        /*
> +         * xen_livepatch_trace_dispatcher(ip, parent_ip)
> +         *
> +         * ip: Address of the traced function.
> +         * parent_ip: Address where the traced function was called.
> +         */
> +        movq    8(%rbp), %rdi
> +        subq    $5, %rdi
> +        movq    16(%rbp), %rsi
> +        call    xen_livepatch_trace_dispatcher
> +
> +        /* Restore the saved state. */
> +        popq    %r11
> +        popq    %r10
> +        popq    %r9
> +        popq    %r8
> +        popq    %rdi
> +        popq    %rsi
> +        popq    %rdx
> +        popq    %rcx
> +        popq    %rax
> +        popfq
> +        popq    %rbp
> +        ret
> +END(xen_livepatch_trace_caller)

Just in case there's a problem doing this all in C...

No need for pushf or popf at all.  Flags are undefined at function
boundaries.

Please drop the q suffixes; they're all unnecessary here.

The ret needs to be RET for speculative mitigations.  (It's emitted as
JMP which will be turned back into a RET on safe system.)

> diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
> index 5158e91f7e..1dfcc3e750 100644
> --- a/xen/arch/x86/livepatch.c
> +++ b/xen/arch/x86/livepatch.c
> @@ -19,6 +19,10 @@
>  #include <asm/nmi.h>
>  #include <asm/setup.h>
>  
> +#ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
> +extern void xen_livepatch_trace_caller(void);
> +#endif

You don't need ifdefary around declarations.

> +
>  static bool has_active_waitqueue(const struct vm_event_domain *ved)
>  {
>      /* ved may be xzalloc()'d without INIT_LIST_HEAD() yet. */
> @@ -365,6 +369,35 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
>      return modify_xen_mappings(start, start + pages * PAGE_SIZE, flag);
>  }
>  
> +#ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
> +unsigned long arch_livepatch_trace_entry(unsigned long addr)
> +{
> +    if ( (is_endbr64((const void *)addr) || is_endbr64_poison((const void *)addr)) )
> +        addr += ENDBR64_LEN;
> +
> +    return addr;
> +}
> +
> +void noinline arch_livepatch_apply_trace(const struct livepatch_func *trace)
> +{
> +    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
> +    const void *new_addr = xen_livepatch_trace_caller;
> +    uint8_t insn[ARCH_PATCH_INSN_SIZE];
> +    int32_t val = new_addr - (site + ARCH_PATCH_INSN_SIZE);
> +
> +    insn[0] = 0xe8; /* CALL rel32. */
> +    memcpy(&insn[1], &val, sizeof(val));
> +    memcpy(site, insn, sizeof(insn));
> +}

Why noinline?  These are out-of-line anyway by being cross-TU, but in a
theoretical world where we had working LTO, I don't see any problem with
them being inlined.

> +
> +void noinline arch_livepatch_revert_trace(const struct livepatch_func *trace)
> +{
> +    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
> +
> +    memset(site, 0x90, ARCH_PATCH_INSN_SIZE);
> +}
> +#endif

This wants to be a 5 byte NOP, not 5x 1-byte NOPs.

I see that GCC is still doing the slow thing.  Clang is doing it's code
generation more sensibly.

Use the add_nops() function.

~Andrew

