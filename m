Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6628C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 16:46:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417589.1646296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x54Nq-00033y-8n; Fri, 11 Sep 2026 16:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417589.1646296; Fri, 11 Sep 2026 16:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x54Nq-00033r-5s; Fri, 11 Sep 2026 16:45:50 +0000
Received: by outflank-mailman (input) for mailman id 1417589;
 Fri, 11 Sep 2026 16:45:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x54No-00033l-Ih
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:45:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x54Nn-00Ef55-SB
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 18:45:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa43033-2eae-0a2a0a5409dd-0a2a4506ec8c-6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 18:45:47 +0200
Received: from [52.101.85.10]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa43039-195a-0a2a45060019-3465550ab361-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 18:45:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by EA8PPF99A30FA19.namprd03.prod.outlook.com
 (2603:10b6:30f:fff5::854) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 16:45:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 16:45:41 +0000
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
 b=CbHhfhiOnodAAKDLa0Qxr4+TrC5ItPi4p05vk0ffLVVAls4mopNAMA13+BpO93qwbk2EWwr00hVIekWl/4OqkhvUVGutBrIDhfeK1qiuOMEkRFsJEzrTP8vQnVc1aYGXZWE2jjJ0LCFymh4Tf2P+xJnhPt1a1/Gp9mpCLCLkfm2QObV0dQ1XLhAZACwA1grYzxjejGwMYFe6xr30Q6JzM6RqPph0avy7ouiJ4DJXDbzoBYlPLqtFIzxJmL68ch2ZX+spAEKSBGChYPV96twN3gFmCQbwt1Bt/KBFmYN5OaK5PmDfX/VYUjzraCUN2y7/MKy5etEzmWEzGfuGCkyWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+E4okuUBv3tEFdQWmguo7Gu0MYYpNSDHjd8RG+WzuY=;
 b=LNyO5YN02EB8Ya0vKA50Weqff2qFdJ2xTip+KASS+0kuZxteSX27sbdbmXii57Ehj6F368sTGYTQqEuMMcFvZ2uHuSVcLVguMT9twoFa2nusAL8Wa6rsHkFWNnGXvLzB8SDjfLfB4st6x5hOLnLfH26HngZZsUKzGcxBYuNM2fAgTGKY2KqcmpkJlwkmLMrG8/KIsAoDNAr8TqDckbUH/k3Z4y2oBGJ3zBMqjaMfMQGoaeJU4VCy3wQRDLjLe9A3VCiGoILqcCBuVvGrXAGAZlafK1OgOcEBc7lyGxXAz/TlVn+DPs79D3E4odp5AEO2LP8a0X1jTDigeN0GvvytBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+E4okuUBv3tEFdQWmguo7Gu0MYYpNSDHjd8RG+WzuY=;
 b=WQK3Nkat9Jn+B0e/NTHY80vbVWwDA9dqK9lCHPNVyzuVSd0QDC3nVyv4ZZM/EwzjPzdO8WehoDgZ3vPVBjZzf89Sv1MTNvFGYj7jest8Neo3i3Np+lDuDvP1CkFMs+K+/A9yMo0n3nilvr5ZLC009WSbG2bufQar+hMWakw9rMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <89c7c026-3986-440a-b2d1-158eb5f0fbbe@citrix.com>
Date: Fri, 11 Sep 2026 17:45:37 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] Add basic b4 config file
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
References: <1789133309.8631fc262581453bbf619ec5b2062170.1a090a7c48d000c4f3@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1789133309.8631fc262581453bbf619ec5b2062170.1a090a7c48d000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0391.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|EA8PPF99A30FA19:EE_
X-MS-Office365-Filtering-Correlation-Id: c1da27eb-c50d-474c-530f-08df10241dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|5023799004|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NBlRRGVnZz+GawAYV8QrVC9JC9ZEbBQPz7F9aCeneNjeUikSCrgtH2yABUtjajEgkdhilb5bk7UXfubieyyinLsRWYDF9gPP0VYAskhcYaSHksrXeO9sfvv/QFCcuLTFcBdlpIifF7PQVnK4GtiMtfMTas/71d/LFhRrpJcFZDDGwQYnHa0GNzN9wwliB4Coql+2FDTP41k8nWE2STwvYVsy7dTMwdvmgcD3zfHczMLtyZ+p0GwUtJnooIIPwRdBfW6V1k/hd19W01TnO4P3eM8+vD535lFlozWQL7IZySIbOqtzjpIyLVBKpbsD/bn05qfntnwPyvXJDRMkVp969css/9w48fkMcgmD4xDIOwtfTUPOO/EnHiMct2niqIG1tkYm96PT9UEXeI0ba7KL/N1pNtQ76l5eZL+SufzaE5dCqo5vGxw+fNHZyk+scM6I+/CJUeULiNmVbgh7jkjWjklW7b6Z0//mMqXYR8uXhHFSHbVEgGZRgRQfiZX9/kRBCRXD1H9oVBqIc0uTNKUXiXFyXeE4A6Tsju5wvD0AQ3PIx6lYlTfzK0CH8ftWnnMZNNJepNEaDwierxQayRzmOQRIFzEEn/7EJ95CVsolKHE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(5023799004)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2ZSOHlET3NrTTlJNG5ES1NhSm51eitPOHFjaGhBcDMyYndiRTcyNDVwL0Zv?=
 =?utf-8?B?OFpNaGk2cmVyb09BcE1JMUp4eTRqeGpxOWt4aHdBZVk5SnQ3SVkrSk45eS8y?=
 =?utf-8?B?WUNOWlo4UnBSbXo3cFhMb1BUNEhObFRpeWppU0VEVG5iMDcwdEVLZXR6bGpq?=
 =?utf-8?B?UGJVbEQ4YlJ3WU5nQ2F0aHppOEp2ZkprSE9pT1FNdkZ5NmpRSDRpTTNaUVZS?=
 =?utf-8?B?Vi9TdE1wSVBNU1J4dkFCSG1NNmt5azFLSERuazM2V1dhTmVHb2lSNEZPUnRY?=
 =?utf-8?B?VGwzOFNTMHd5TDZwL0xURlFHdFRta1NCSU9NTTFWSkhnUmJUZStCTTBQS2FS?=
 =?utf-8?B?VlVLNEgvUGxOS3dJZzhvNmMvSjluUHQ2Y0gyRFpmRUdWQXpyTWhML0xsR0VF?=
 =?utf-8?B?TzBsaWswYllqdnZKVjkxVWxzMXlDenVHa3VQYWZLVXF4MlpEQnR1NitreDUw?=
 =?utf-8?B?M2lrZHdoQ25TOHIxbXpYWHVTa0prWkJDQ0dCWEVWR3FUOWNTOTBwa0thdHI5?=
 =?utf-8?B?VmIzL3dVL0RmNkVpeGEzOEM1MUwwMHpMT0JONVRzdWN6UHpDOXJaUmJvUjNL?=
 =?utf-8?B?V0RRUXNMMVJwZ2RNNnRLc0JZenZjVERRVHVjOUpBMThIY0ExYUdsaE9WbkRF?=
 =?utf-8?B?Q2ZTVTlHTzY3Y1RCYWt4Y3BPU0J5Nkh0S2lnaS9ERUxhbmE5NEpGS3JLNTdq?=
 =?utf-8?B?Qm91VzFKUStGa0Job3dhYVBielNaL1NDMHdEUEVNbmpaVXVKeHRVZ1NWR2Q1?=
 =?utf-8?B?TXBMckRPMDVlazdpSkhVL05qV1o2ek9MMUZic0hzOTcyVWhRUGliKzZpbVpD?=
 =?utf-8?B?NlhZNVc3TG9kbGNobHpSYzdFNlo5VkFodkl5R0VNWUJlVUtja2k1cFJuaHh4?=
 =?utf-8?B?MVdrdk9aT0N1R2RBQURGWi9tUTh2MXFwenFqdk5CaDBVQS9NaUVoNFR6Rldl?=
 =?utf-8?B?YVFURVAyOFd6RXpuRUNhZXErT21TWHFVckVyV1BoZTc0NWlFNmJwWXNpN3VD?=
 =?utf-8?B?R2EyQXZEWXFYQzVrUFVhRWFCckF2OFRBU3hVaVByQXFJQzN1b2J5R3lyeXI5?=
 =?utf-8?B?cUFWZHhKQTJoN2NXL2F5QlU4YWcvVmJyVlhBc0l2dEV1Y01CMTFmV3JwTDNJ?=
 =?utf-8?B?SGdaS0R1Umk2QlZVU3VIT3Y5YmpTeENoSkRBaVRLb0pnYzlQY3MxcFd0WW4z?=
 =?utf-8?B?Mm1CSWVtQWw5TG93WEZHa2M5TEZlb0hCVEZuUEpwN0FRR01ONzVrM0RqeHM2?=
 =?utf-8?B?TThsUCthOWY3U3RPVWpGblBIbzdYUFAvZFhwdEVYbG93N2RJVU9ZL2VRazNY?=
 =?utf-8?B?NEZaRjR3RkVxTnZLNGVKbUhENEF1dHFkNmVrV0U1TFp0cXhIMjdmVDNTNUlv?=
 =?utf-8?B?aUpBVVIrZnY5MUsyQXhpT3k3WGc2dVRkMEtaQlRBZTRncmNJU2I1cGxrbnUw?=
 =?utf-8?B?dk9rN09ma2JjbmREZ1I2eVVZenlVclRXYzhMNE9neGwva21UWExGcjhvZlA3?=
 =?utf-8?B?Q2NQc2xwTkltclJ1MkMxZHhiMGFoYkJrMTlGSkJhS3FkWWE3ZWJHZ01GUUxV?=
 =?utf-8?B?cHBEZ0lNTU1LZGdwNDZFZUFKU3NPWGF0TldlLzQ2eHJWZUhYd3VybStJdG50?=
 =?utf-8?B?VXBZU29YbmVKTnJGeUNTTFd6Y3A1WEp5eStGSzZJMmZPQmV0eGdzdnNidko1?=
 =?utf-8?B?WFFGVm12WDBpVHJSNTZYRUVjR1lqcjUwNG9YTmNqeEVCbUp0NThXakhwL21p?=
 =?utf-8?B?MWQxK2sxMno4YThyMFY1ZmtWUE5UQngvYlk5TGpueXZTSzZJRVVML0FLTnh3?=
 =?utf-8?B?MERkZ2hmdWNuYVNmOXZ3a21rUkVCa0I0VS9RNURIWFVyblhuaEl2RUt3TXRh?=
 =?utf-8?B?VkNvcFN5T0h6OXZqSjdDV01kVVcrWUZWc3YvMmJCVWRJU0xPUW9DdFRJR29I?=
 =?utf-8?B?dUhDMEZrWnJLaElveW5xeWtSTmtGSUViWVhsWjhXV0I1dzRkN3FqeElWcmZ4?=
 =?utf-8?B?LzFIZjBVaElKRjQyT0VWbklUT3c3cGVOeUdhZUNmWUg4ODJjd3k2YnFUMFJY?=
 =?utf-8?B?QWg0L09zRDR3Z1RSTjM3ZFBaV2lnRk5vZXpQZmllQTRDZlAzLytaL2lwVTVL?=
 =?utf-8?B?MlI2LzNOWGdmRnFXM2JFSHkxVGl2dXE1a2dINFlRbCtzNHpod2czK2pJelBG?=
 =?utf-8?B?cHpJRldtTXdsWUhHVkt2eGFmdEhsUEtkOGs4QkNsREgwS1dlSWFVdmxIeEVs?=
 =?utf-8?B?TmlYV1FhTlZTV0hMOEc3YUVDNlg3WlhjYmllSmUvUFUyaG5XSkllWVhxWitW?=
 =?utf-8?B?cklFS3Q0SXA1cjI4NW80QTZiNkRDN29ZV2lJakJwd3AzWGdaWmI2cFhnc09O?=
 =?utf-8?Q?/khZ0ywAB5Ml411o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1da27eb-c50d-474c-530f-08df10241dbb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:45:41.4285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVOXaUattfE2a1vwH8q7WbbeA5CbvAiLvZaxbyP2qqzLlMkOqc7iFessCdpI554AR5Yt1TcN+sr8PNFt/BL63zP79e6IO92LzUNFj8zAWlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA8PPF99A30FA19
X-purgate-ID: tlsNG-16d1c6/1789145147-FDC0F77B-5E99F403/0/0
X-purgate-type: clean
X-purgate-size: 1912

On 11/09/2026 2:28 pm, Baptiste Le Duc wrote:
> b4[1] is a convenient tool for mail-based contribution. A config file[2]
> tracked in the tree lets the project ship a few defaults that match the Xen
> patch submission rules.
>
> This aims to help new contributors who have never used a mailing list avoid
> mistakes when sending their patch series.
>
> The tree has no scripts/checkpatch.pl or equivalent, so there is nothing
> for b4 to run per patch. Disable the needs-checking pre-flight check so a
> series can be sent without first running b4 prep --check.
>
> [1] https://pypi.org/project/b4/
> [2] https://b4.docs.kernel.org/en/latest/config.html
>
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

I don't use b4 for preparing series myself, but I can see how this would
be useful for newcomers.

> ---
>  .b4-config | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/.b4-config b/.b4-config
> new file mode 100644
> index 0000000000..1ca1f0625e
> --- /dev/null
> +++ b/.b4-config
> @@ -0,0 +1,13 @@
> +#
> +# Common b4 settings for sending patches to the Xen Project upstream.
> +# https://b4.docs.kernel.org/
> +#
> +# See docs/process/sending-patches.pandoc for the patch submission rules
> +# these settings implement.

I doubt people will be reading this file to discover how to send
patches, and that piece of documentation is in the process of moving
into the handbook.

I suggest dropping this sentence.  All that's going to happen to it is
becoming stale shortly.

> +#
> +
> +[b4]
> +	send-series-to = xen-devel@lists.xenproject.org
> +	send-auto-to-cmd = echo
> +	send-auto-cc-cmd = ./scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback

Where did this come from?   Because it didn't come from Xen's version of
get_maintainers, which is a long way removed from Linux's

~Andrew

