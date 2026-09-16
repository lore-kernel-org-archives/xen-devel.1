Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBC9C88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 12:07:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423041.1648334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oQC-0001QE-26; Wed, 16 Sep 2026 12:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423041.1648334; Wed, 16 Sep 2026 12:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6oQB-0001Q7-UO; Wed, 16 Sep 2026 12:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1423041;
 Wed, 16 Sep 2026 12:07:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x6oQ9-0001Ol-Sx
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 12:07:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6oQ8-007qg5-OK
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 14:07:24 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aaa8675-8faa-0a2a0a5109dd-0a2a450ab456-24
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:07:24 +0200
Received: from [40.107.209.57]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aaa8679-f2d2-0a2a450a0019-286bd1393e79-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:07:24 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5496.namprd03.prod.outlook.com (2603:10b6:5:2c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 12:07:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 12:07:19 +0000
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
 b=ypAQPKhkhg7pKDPGPk80nCJp3xBU9l7t230wXnISFtBAJWmpWQlybn1v50fxCHBh+g8epMNkAwekgUSNpV5qcArXd9PUuXm1QBFiMZ6D6T5Fk0cC69Bp5xilrGhbyTvuMRcbpkiB9T1g384YSecCLilRJo08nqFov/RMVbq6Px1me/k8ZiEC1OP5sSrlZMSZWawJ10/GQ4MPCI8HiLivb7etSvxLX9F2lL98E6J+nHpn/1p9fUNI/6H5QYbaJQYgtPgUz5ISerhGBiGxN0TM1Uh5Y6DZeVXTVY3RnCjxPiZqAI3Ui+W9f+eif9zvmV+1glL1m5slbp2dOUIwYk8+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vZ4XXFbt5a3v02WEzaqIp/5eYWAcGbB5UTBBruBXWM=;
 b=W4hjqdN40f3y/wXuX5jueYW73YZqXbZwg2HLcFyFf420+wRWn8pocW3Eo40MItqHC19wG87rhwEGDtkdk7JrcM/Masg3g2NuOSO9MciuPo0NS/3gGNUb8yGXQ8FsGxRuwMtmkpGqI33qJSfWQmfT/MuOAWO8qN1iqYoItL6yxfn9J7t+FW9gtFlf0RSTza8MevcNwx1/OxpiITdshAM8Wfcl9DC97quyHShL77PlBJAdzvEn6yhoeRQSG5PHqWxYzEuhDAZsv6R3GwEikB5wpI3gx06wMWb+eHc5vOJ+akJfANylhq2O2BYPeXwKgJgahqZV7VSs/H0UiMgukNEVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vZ4XXFbt5a3v02WEzaqIp/5eYWAcGbB5UTBBruBXWM=;
 b=n2d1ugrYbH2ZEYYsDoMFdNI7dppPOISypr5mMlY2WmLA2Snq5B2RLkI6VIioDRTnbe3a4J/4n2oub3VLk/UEgSRcEXk1OGpgBNkcr+7RHPkspqgFa9Mf4Rodjj/9+TuehSkJ25/aHY7OgZFItiZyPptB2b92rCGx2anaDOQrLXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ebbcd162-889d-4bfd-bb9a-fcdace9ee6ac@citrix.com>
Date: Wed, 16 Sep 2026 14:07:15 +0200
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgross@suse.com
Subject: Re: [PATCH] xen: fix comment typo in xen.h
To: Ruslan Vagner <rusya92266@gmail.com>, xen-devel@lists.xenproject.org
References: <CAF9RqJ439Cm0x9zzruXS5Dnz+5RgsAcJ0Q-gLQLpyTzWFF2ADw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAF9RqJ439Cm0x9zzruXS5Dnz+5RgsAcJ0Q-gLQLpyTzWFF2ADw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0387.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: ab291a0d-8c04-43bf-6e12-08df13eb0e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K0I7O7NjAcxVj/T7bIIxYf4eYf4eu7ybe9WciEYJIsE/a9zWtjgY/ud+F+N841iPcLlnJTV3/BYGh9DKHj9VAwy8iUvhpeACpEWmpJ/GXmZrLNzWFBcuSWP16WYaYy4lnschNFhWo3SAYdi6frJwokyNHl/20qesKUWjmKcWZXZ73scMT0CzFTFtnCvbhkr32L3+qmxiigBu3yT8EmHGqH/rKCPTYdyA+tAwdWqJAbUcDI2btiB82BkH6bKUqcO3TryaT/gfIhxNZj3Vb/kHMZX4ug58+1MAdC2BsKGerlQttDhyYFkL0f3MVhtlbhsZHJlHo2gfzDIYw4WGCqamlmS3V6OMJu4ECyyRtjqIuDFw7JhLTod31jRogXE3zAGlf6t7l1pCqbE5FYRoZpaqJgAoe32VHDae06eA0gVgtYJHqo8fncFCJwKwRB9C63xBw9/7CKboWXJSRIN40OvkRhDiYBZgtcQNP+PKB6fxuKays8jZ/TdtciB7fjC0TA6BGodsq6XFgmFuf5E4jJp6rLv+hv/XM9/zafKgBR3t70WWcodJRdzEl1n/U6qUMZz+dZV6kHY3PIRLIPCkIiObSxb0H15h98J/LNvx9XQ9jqSueooVczlPBTiLMlswvQ7Q+PkC5fwA8BGXKz5sjtJuc2Kf/j9ChTAocW2PUosGHkQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFUwT0J6M1l2OTZtVkxPZTdZNVRJNC95UzZPMXlPSjBzNm1sYm5rU3NzN1V0?=
 =?utf-8?B?eUtlR3lQdnRDbVBoM1VvL1FBRU9SaDdjakxwbGhhRmRTRmpUNHVlSjRYcXYy?=
 =?utf-8?B?ZWNBZi9UZFFWQUJyOEhyejJ2TU81d1NZbUJLSGhhSDVsck1LT21qa3pIK09a?=
 =?utf-8?B?R0Rxd1VZZHh2Y1ZidzJTWjZvckNtUmQ1M0J0YTMzOXZxQnY1NDRsU0lhb21u?=
 =?utf-8?B?RzFHdzUvVWk1VldJdFRQVDdNb0dFRklxTDFBT2RGdFc5OG52bS9DSkUzZVhX?=
 =?utf-8?B?dWxDU1FDUkZjQXh6ZENEWUczdSs1Q0haSnpEbGxvSUxZeHFhYlJ1YldPNFBz?=
 =?utf-8?B?QlhCUVZtb1U2RGlza0o0RXg1b3hYalJRYU9iTERDeWtyMlpEMU9VaktGVWZm?=
 =?utf-8?B?SDVEbFhoOHVkaEpYcmlnZTU1bkNFSzN3WUpKbjdiS251cGdvWXpWTHhLdGcv?=
 =?utf-8?B?TnF1NGQxMWtNQlBTL1ZYLzNZbWFPOW1xL2VTcjRqeXpOOFBMUGRyMHgrdEY4?=
 =?utf-8?B?eFE5ME1hNzNpcldUVHVXSkZGa1oyV3RlN2VUcWlyRzJYLzVma0M3a2xEaC9G?=
 =?utf-8?B?RlZyRVZHNjBKd1lJQnRyTGlTMENzbDlsdzhwRWRHZm5xL2x1MEJHczdGNllr?=
 =?utf-8?B?M3YrazkvLzdRN3FnUjV1MXZyNm5aRnV2Q3JiNW5iZzRiRWtNNmwrMEg2TWdm?=
 =?utf-8?B?Ukp6YUhxTFEzVFBudWRDU3dwcjBKaUJRT29ZWHJQRU43NWdaZE93MzBmNjZr?=
 =?utf-8?B?MW9VbjhDanAxNG11cnp0UHZtTHlZbGFzdkxuL1ZRcDNNdFVRSU1HRnJybFpn?=
 =?utf-8?B?MTJrYUV3VE9tZFY2MmZuWHpEN0U1U2dDRVhsMnJZSEJIUEdGYXhVTmsvb2M0?=
 =?utf-8?B?RFJucUdKdUlUSVdOcUNjMERadE5wSGhiUnR2M2JtR04wUi9iTWpFNVc3M29L?=
 =?utf-8?B?RUgwak1kdlpueUM2emNtWWV6dkxvTkI5K1VXRGkwamhRRWRRSnB4SVlPNFRv?=
 =?utf-8?B?cWs5UUJDalJRaFJSMFJrSnNVSTF0VGNib0FndUhCTmlEb0Y1U1VPMEJ3NkRt?=
 =?utf-8?B?K0N4UDBSWlVHQVVPYWdBN1c3N3Roc3VTQlBac3E0R3FrLysrckM2TVpxNXZQ?=
 =?utf-8?B?dzQ2TWlMTFF6dWxpUnE4WGE1dFhhbjV1NmVEaktSNzNseFVGazNaRXVlQm9R?=
 =?utf-8?B?WElSVVkwb3YwZXM1azFmQWwwTlR4RmRGVXhUTUpXRXdNU3RneGtoNnh1Ymd5?=
 =?utf-8?B?M0VQRjJpNzh3RWw5RHJuY3BhK093RW5mNmlucGNMYkJhVi9FYk04clFuTmF1?=
 =?utf-8?B?QlJRTXJocTVFVUZ3bUFmTEd1OW43Q3hGMW5KRGhwZGwxUWp6bjZZUm81d0NB?=
 =?utf-8?B?cDNDZjh5ODlJbmE2VEJwcHRwWU5YeUhaZ3ZOeTgvNThKbkJzS1Vmb2xVR1dJ?=
 =?utf-8?B?YzkzQUdLclBSekc5Uk5wRzJLTnltSi9TU3NZSVlEZEwyZUhkRkZuUGJzRTB6?=
 =?utf-8?B?UFIzMDdZa1NoeTZCbm14TkpYWnNRZ0ZYWVlTc2lsU0JlNUcvbDJWVEZDaE1p?=
 =?utf-8?B?ODMwdkREcTFzTC8ySUR5amFCMWdPRkJQTEVBQXZhMFpjL2N2TE1yeXpXZGpY?=
 =?utf-8?B?bENVMDZIeldmTHNvbTdVSExOVUNTVTBBejdidm9RV2doR3lXSEVYYTdjeE5E?=
 =?utf-8?B?QTZ6NnFEOHBBeTNxWEdoZVFmdmphWGE1ZUkyRHRqQVZxVzk5Ri9sa1d5NnhR?=
 =?utf-8?B?cXVIMEFxTG8reVB4THo5aGZ6cHRzWUFpVmovakV3SldSR2tCMDk3K29HSitm?=
 =?utf-8?B?d1lta3lSdWpvMEE3QTlha25UL2s1a3dJVGM3dEhwR2hlRUdKK2JYMXNnbHdV?=
 =?utf-8?B?QUFuaGt1bWc1RFdoMTlRQTRTZUR4TnV3TG9xUGpJMGRIK0RpZEN3Y1JGQWpR?=
 =?utf-8?B?SnA0Um5JMndXMk5FUjZmZmIxOUlBTWtaVElZdjR0RXl2eHJWMW9BZzd5Vjcy?=
 =?utf-8?B?MEhkZVFsbXFTZEV4NEtrRldrSWJpT3U3cnFja1V1UFczNnp1d0ZSVGVtcVN2?=
 =?utf-8?B?aWdWaG5VMGZ3M3dVemthTC9WNG5NU2lGTEU1dmhWaS83a09EWmRzZzN4SE00?=
 =?utf-8?B?YkVVbjhHOFhidmNRNGp5QkJVWGhmNVFYc0E0S3NkZG40VUMwdXV4LzZxY0ox?=
 =?utf-8?B?UWowaWtkU2I4bjZ5QXdIeU1GRU1TWGZYWWU2cVQ3ZnIwRVY4OElXUXROU0ZY?=
 =?utf-8?B?SzlodnlZMFowcjVydUhrWmJpWXZTZThTeVYwKzhsVi9QRGFzaytXWlRKcnFn?=
 =?utf-8?B?eVZNai9kbTVhR09nZEg5ekVjMzJjb3I5bkIxMWhaQzQ1bDVUSUh5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab291a0d-8c04-43bf-6e12-08df13eb0e41
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:07:18.9092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7277ZqZnpnnv/47Nv6TR8tXG7hHAc1ghNKemVlGHJVHkiEnZ+TD1FrcdzVaSMRTcRZ907u0RbQEqjTuq77r/aYoObbDPiDA6CAYNqLM7HI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5496
X-purgate-ID: tlsNG-4011c0/1789560444-50CCBCFC-1A6DA991/0/0
X-purgate-type: clean
X-purgate-size: 1430

On 15/09/2026 2:56 pm, Ruslan Vagner wrote:
> Fix the spelling in comments. No functional change.
>
> Signed-off-by: Ruslan Vagner <rusya92266@gmail.com>
> ---
>  include/xen/interface/xen.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
> index 40c9793e9880..f9acb21875cf 100644
> --- a/include/xen/interface/xen.h
> +++ b/include/xen/interface/xen.h
> @@ -94,7 +94,7 @@
>  #define VIRQ_XENOPROF   7  /* V. XenOprofile interrupt: new sample available */
>  #define VIRQ_CON_RING   8  /* G. (DOM0) Bytes received on console            */
>  #define VIRQ_PCPU_STATE 9  /* G. (DOM0) PCPU state changed                   */
> -#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occured           */
> +#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occurred
>         */
>  #define VIRQ_XC_RESERVED 11 /* G. Reserved for XenClient                     */
>  #define VIRQ_ENOMEM     12 /* G. (DOM0) Low on heap memory       */
>  #define VIRQ_XENPMU     13  /* PMC interrupt                                 */

The change is fine, but the email is whitespace corrupted, with the
closing */ moved onto the next line.

I can fix this up on commit, but you will want to double check your
email configuration before sending further patches.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

