Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D145D606A685
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Ak6k2sx7
Received: from list by lists.xenproject.org with outflank-mailman.1500509.1696650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVXWc-0002CD-RJ; Mon, 23 Nov 2026 17:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500509.1696650; Mon, 23 Nov 2026 17:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVXWc-0002C6-O7; Mon, 23 Nov 2026 17:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1500509;
 Mon, 23 Nov 2026 17:08:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xVXWb-0002Bk-6U
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 17:08:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVXWa-00Etgl-H5
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 18:08:16 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0472ef-2eae-0a2a0a5409dd-0a2a4507aad6-40
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 18:08:16 +0100
Received: from [40.107.209.9]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0472fe-b4ea-0a2a45070019-286bd1098bdf-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 18:08:16 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV2PR03MB512397.namprd03.prod.outlook.com (2603:10b6:408:3af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:08:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 17:08:13 +0000
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
 b=amTjviAAdKTZ4huX/RawN+6f2O8uZlq88w76xfhYnGiiTwqaEVKyJRWWvMFiYq3g9v1L2XR3Fp+NfufvKBpOaYybnorDrop3SIuTXy7Rafhi2eek2HgvvEOAxULgHsHwzr4bJQf16OQBVvtU9CSmTmh7Iibt44Ain/Qi8aVIGVVyNIPDdX7EdCqAKwtpVxNKgg3VPcBWQxzqdtge/yGrrmVMHKhSp9gy+naWVa+D3EYT91R9pYjJftMwTtywmXODZgbFcmTecVcpEVrJ648VIZLwIri4Qb0UdjfSktvUOrSSaj+xuLxonLootabWFu4kiuRAdntZjT3GZTvR26D8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LlF8MUnIACbNMTrEfLFvvJkZq9l1lQMfkPwsAXPsvE=;
 b=zURRZjsUVQeClvpAEyiErTBj+m00r8OdDQN2dyW7qAWC1Tb24FQng5RG0Ais+A+D80xGnOWsD8iOsc0WRDCE1Tz9d/bUeP8CYQmeagmVfWbOyJFlUkAhJKp8xVgTmAiAJbMuf4igy1AMD8wI9+b0LmrjLpCW9ZHPamWbG3W7nVjGMK/6tCKLds+1Sq0+z9ANPSCtJnz0uv4MCCn02Y8ap7OOfCtxO8ULrG6sJUX2YWB9juTgihyH7HURe6L5frWyF7ogcr+lj1xrfDBqqNt7Vijc56E/7K5rtGHA7fU9BHonTmZb5I3H7kdZLkNiKCPwg7RYXjpeCy4w6myCMNFRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LlF8MUnIACbNMTrEfLFvvJkZq9l1lQMfkPwsAXPsvE=;
 b=Ak6k2sx7PH/U3pxJGH9kDWOw6GgTWWTcfPOa+E+uj4kMZ/AjJ3Fl1NMwl9obOfvgfEwdGMYezNhGdDafMAKr0Fel6heiWm5wSeLjZOH0I0ahxVBeSq+Dgjqsb3XNmU2wU8k2wgWTONIvvonyOG+0rtZtOYPDfJO3js35EjU2pmY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3ad769e5-aaba-438d-8288-3e4f2994d344@citrix.com>
Date: Mon, 23 Nov 2026 17:08:09 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 2/3] x86/amd: Drop cpu_has_amd_erratum()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261119144453.529009-1-alejandro.garciavallejo@amd.com>
 <20261119144453.529009-3-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261119144453.529009-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV2PR03MB512397:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdf1d16-c6d0-4031-1547-08df49845b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|4143699003|11063799006|56012099006|261021123027099003|261021135927099003|261009223027099003|261021121427099003|261022075727099003|261026121527099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AEUiLl2o1YsX4ohprLhS1W4InOm9O+FOQtMTzsyn6J4H/tBUNuQ4OxFJZGNGQeTvcxJaCFngRaVwpGGDuG7hs1On5wTAemAk5sCAxl/VUsfJKmDjiE3/rxCHu9ehIDXJjJs+gsiTkgllSHHNXlGGjw13TVBwywjJeLqcmoz5G9zF3Zpf4JIMfoKBXBFJOh1sruFYvpjPvez4wjOvs7Ta21bJbcuvqGkvV2LI5eQEhZuuWUhK8ahd8QEALE7DL63+ffFZIAEo9NXmPesmuzSo7o0bgaSl7bYcNl1i5S5lQgPAykbM0KIXGzEzoOdi8bhqWz+JSPFJt60pCZdOadNNIPCcNVdzM58MLN/lhM7gwtpWvG9N/B65BeI28rzZ8YuOQ0CMB4b0yagUWY/Zk5fJccrQgzLzYNYVcbZ5qQGuYJNreKL7/Ygcpr5iUmKCQRJG/ch0C7Vfbg40A6LzHi2SADzsVhzvcoHEGDl9pv6h5Q9L49AEkoignzlWIqF+m8dgz43Fj4EbHk4bgZUvAF3kfFg06/daa1771vvcSu03aRWBJzchlNeWYNYRRhU0VYZJPwcg1qCSpQ3BHiV6nMoYm3SAgp/c8eeRvHMoec9iha1NAIzNpBzgwXO24Hm/UttRigE9nwoXBCd9Unh3ZvbnZCyvox/SipbNI2gY2Dj9RR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021135927099003)(261009223027099003)(261021121427099003)(261022075727099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rmx0eXVqdmdNb29oTVl1amZzNXZFQ1dLQ1o2RGUyODQvMmliOXpoSHZHWGxM?=
 =?utf-8?B?UkxLK2cydmRWM04zOTlUSytEcU0yT1FUZi9sSU45TWFoT05jN2ZHYTVMYzFQ?=
 =?utf-8?B?M3FIemQ5WEx0a05ZVmZZaXNQVnRrV1BoYm5YT3JwWVZGMUVMR2pZa3FSK2Fr?=
 =?utf-8?B?VTVNSExtQ0JEWjg0b2tIOVVsS1B3YVN1V1dkZlljczQ3aW5hWDRMRHdWbGw5?=
 =?utf-8?B?UWtGVnZUaVhFcFpOUnN6ajdsVVI3TWx2UFRrQU9QYVdwcUx1dXIwMVNFUzZO?=
 =?utf-8?B?a05WZUlCekZuMElaWnA1Sy9LeldyRHFLemVpT3k0UFNiWWtMK3pkU2NyMXd3?=
 =?utf-8?B?emFsWElxL0tvZVVvQmVWL2huV3ZzanNMcS9mWjdCOVp0MVJEaEE3OWFhYXMr?=
 =?utf-8?B?TmpqZ0d0R25XblgwSG1jRkhWcUVPRzc5Q0hmeFlrdVBMSWZmNjRMdllUYy9P?=
 =?utf-8?B?RTd6ZGtnVy9jMmlWeUZWN2thajBicU9MREZZbnJKMjVOT1R1aTR0QlBlMWFE?=
 =?utf-8?B?M2h1RFNNK09YRHJhNno3Vm5iSFVqdlNicFgrMGd0RHRXL3lJNDZ5b0JueGg5?=
 =?utf-8?B?QTRuV1l2VkR2NytDWXkvMXdWdCt5RkdXeHA1MVpIRVFIdzBkTkVyZktPZktk?=
 =?utf-8?B?NXFaR2lRS3ArK2Y4ZEQ0cncvWkFxcldkNFp0bkVmS2VHb1dRQndXalN4N0ww?=
 =?utf-8?B?M3BYZC9zQ2lRSTBjUXFxVWttUFdQSzBEMG54Wkk5TERVSzV0MUtudnhoM2w5?=
 =?utf-8?B?UURqZ3gvVmUxQ2ZRVFlpa2VCM3U2MUJYaDVqMzVVejB2blpwNU9WVDJybEc2?=
 =?utf-8?B?bzRMMU1FNTVoZE4xSTgxampqV2IzemFieEhiTXFHU1VRZUg1bGpyUnNyS3A4?=
 =?utf-8?B?dm5DYzkrNXdyeGVOb3lOcTNmbUpJTkE4a1R3Qld5UG9hMlRHVTZBb3ZWUFdE?=
 =?utf-8?B?QWFLNU1UOTlNRTYrN1ZGNTBBTy95RmtmME5UbENsdTNna2ZQa2VYK1ZQdlpz?=
 =?utf-8?B?dG5WV29CNW1tNDU3Z1htQlVkWDFXTXEyZG56VjROZDlUVTZyTG43YzFnM0xk?=
 =?utf-8?B?aCtyUTl3QWlCai9sMjR6M1VrWmNzV0Z4a3pac21kdEptcmxERWJOSWxjSXNm?=
 =?utf-8?B?UGk1RURxYUkxNkRRTExKdDdsdm9iMkUyYXVMUkxXdktERU5lOCtDTXZsdld2?=
 =?utf-8?B?MnNKbCszWWFnY1RLMWpkYzc5M1ROQ0FtMnpKN3RMQ0M3Q0gwNWVaSEU1Ykxv?=
 =?utf-8?B?ZWNuM3NFVXdyUDA0ZzFpZ1pNelJYUlB6cGdNRFJFOG5aNlYza1dMSGJZVnpP?=
 =?utf-8?B?QTlJaTJFOFNRWDE5amNlbG1RWmpCSk12SjVSWW1aQnVjMllmOTlrcVhJRmo3?=
 =?utf-8?B?UW5PWTV2YUxsakNyZnhyeUtnWmppYTZOd0YvdnZlWjhEOFBvV0JBcjlHMUZi?=
 =?utf-8?B?ZTFaSHMwdHBCM0oydWxWY09icStoTWpLWGJiQ3Z4dlA0bVk5Q21mQnpuVHpY?=
 =?utf-8?B?MDNYUTkvVnViV3FsZ3cybjRDZW8vUTZKSXlWTTJUQWZlOVFZbVU2L2pkZ01E?=
 =?utf-8?B?U2FrbU1kL3dUcjhzc1JOSmp6MGxkZUg2NzQrVCtsK1M3WEhKZXk2ZWpqYytC?=
 =?utf-8?B?Mjg5QXozNEVpeGlJYVRvVmcwS3RrQmFmM2czbncrdFAyYXcxeWlMTlg0SXhS?=
 =?utf-8?B?dkdOTFEvSlkwbzl2ZjNXc2lOc1NpUzc1YVlOSmUzdDczZHJiK0F6K0lhUnJE?=
 =?utf-8?B?RkQvUXF1SFc0NUJRbHN5Y1h5VjV3bWpLN1U1TGljaWpUMWt6Zm1LRS9JQi9r?=
 =?utf-8?B?SU02aHN1cjZTYThqa3NSUTFtTXBqK3g3ZG5jU0FiWlhpRWJoRlpFZG5qVTZP?=
 =?utf-8?B?bjZpYWNiVUFaNzlmZlo3cUZwSXBKZGtUUWNBOWIwbXZyMjdKbWc5dHJ0WDc3?=
 =?utf-8?B?WWpWejdyOXNnTzl6UE56S1Jpd1QycENSTGVuSTQ3dzhOeVBaVGgyUFRTR2Yr?=
 =?utf-8?B?MEMzRDRyc1VRZmFDdzZBaFBDTE9vanNhVkNHbFNOWldVRHZpR3NxcG9CQUJm?=
 =?utf-8?B?Y3JFSWFrSE1VdGZXUjFpandaNGhWbDB3aEFrNk5wQUZNVmhvaXV2dk51R2Z1?=
 =?utf-8?B?STZiNHNsME0rTG9mamFXaXRHNE1RU0UrZHFRR0ZTOVRDU01ibWpVV2hJZXRz?=
 =?utf-8?B?NTRDWTZieEJGaXVTWXRpZFZrbVl6NXpmVEFhcU9QSGlHaGo3ays4UEMwRUp2?=
 =?utf-8?B?cVlSNHhOZUpobWlBYVhuMld0N0l6eWV5QkZmWGJUbm1WSXhHVW5zeEdJTm8r?=
 =?utf-8?B?MlpjY2tQMVovMGs4di9sL0dBbEhSOUFrN1I2RUFhZmJ3WXgySTk4dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdf1d16-c6d0-4031-1547-08df49845b99
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:13.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XsQhMzLbrTv+AQFuosm/eksENhbkdcofsKjGSWWGbaTzBxnf303MnMNiLU0XCe4UO59Lh21AHyTutsFfBAO56Nzr/jZqnfp5EKzltPhDjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR03MB512397
X-purgate-ID: tlsNG-ef75cf/1795453696-35EC6AE4-DF1164B5/0/0
X-purgate-type: clean
X-purgate-size: 3383
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 2:44 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
> index 762b1fbf7a..3ed133fcd5 100644
> --- a/xen/arch/x86/include/asm/amd.h
> +++ b/xen/arch/x86/include/asm/amd.h
> @@ -6,43 +6,31 @@
>  #define __AMD_H__
>  
>  #include <asm/cpufeature.h>
> +#include <asm/x86-vendors.h>
>  
> -/* AMD errata checking
> - *
> - * Errata are defined using the AMD_LEGACY_ERRATUM() macro, which takes a
> - * variable number of family-specific model-stepping ranges created by
> - * AMD_MODEL_RANGE().
> - *
> - * Example:
> - * #define AMD_ERRATUM_319                                              \
> - *   AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x10, 0x2, 0x1, 0x4, 0x2),      \
> - *                      AMD_MODEL_RANGE(0x10, 0x8, 0x0, 0x8, 0x0),      \
> - *                      AMD_MODEL_RANGE(0x10, 0x9, 0x0, 0x9, 0x0))
> - *   
> +/*
> + * AMD errata Xen works around, each named after its number in the Revision
> + * Guide for the families it affects.
>   */

These could really do with some information about what they are.

/* Sequential execution across the non-canonical boundary causes hang. */

> +static inline bool cpu_has_amd_erratum_121(const struct cpuinfo_x86 *c)
> +{
> +    return c->vendor == X86_VENDOR_AMD && c->family == 0xf && c->model <= 0x3f;
> +}
>  
> -#define AMD_LEGACY_ERRATUM(...)         __VA_ARGS__, 0
> -#define AMD_MODEL_RANGE(f, m_start, s_start, m_end, s_end)              \
> -    (((f) << 24) | ((m_start) << 16) | ((s_start) << 12) | \
> -     ((m_end) << 4) | (s_end))
> -#define AMD_MODEL_RANGE_FAMILY(range)   (((range) >> 24) & 0xff)
> -#define AMD_MODEL_RANGE_START(range)    (((range) >> 12) & 0xfff)
> -#define AMD_MODEL_RANGE_END(range)      ((range) & 0xfff)

/* Incorrect code bytes fetched after a world switch. */

> +static inline bool cpu_has_amd_erratum_170(const struct cpuinfo_x86 *c)
> +{
> +    return c->vendor == X86_VENDOR_AMD && c->family == 0xf && c->model <= 0x67;
> +}
>  
> -#define AMD_ERRATUM_121                                                 \
> -    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0x3f, 0xf))

/* L1 TLB multi-hit causes #MC. */

> +static inline bool cpu_has_amd_erratum_383(const struct cpuinfo_x86 *c)
> +{
> +    return c->vendor == X86_VENDOR_AMD && c->family == 0x10;
> +}
>  
> -#define AMD_ERRATUM_170                                                 \
> -    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0x67, 0xf))
> -
> -#define AMD_ERRATUM_383                                                 \
> -    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x10, 0x0, 0x0, 0xff, 0xf))
> -
> -#define AMD_ERRATUM_573							\
> -    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0xff, 0xf),	\
> -                       AMD_MODEL_RANGE(0x10, 0x0, 0x0, 0xff, 0xf),	\
> -                       AMD_MODEL_RANGE(0x11, 0x0, 0x0, 0xff, 0xf),	\
> -                       AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0xff, 0xf))

/* FSINCOS instruction may corrupt %rip. */

> +static inline bool cpu_has_amd_erratum_573(const struct cpuinfo_x86 *c)
> +{
> +    return c->vendor == X86_VENDOR_AMD && c->family >= 0xf && c->family <= 0x12;
> +}
>  

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, subject to rebasing
over the correction in patch 1.

~Andrew

