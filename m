Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD0EC79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:33:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413416.1643661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4KIR-0006pV-To; Wed, 09 Sep 2026 15:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413416.1643661; Wed, 09 Sep 2026 15:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4KIR-0006pO-Qi; Wed, 09 Sep 2026 15:33:11 +0000
Received: by outflank-mailman (input) for mailman id 1413416;
 Wed, 09 Sep 2026 15:33:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x4KIQ-0006pI-AF
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:33:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4KIP-003HI1-Kp
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:33:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa17c27-bab6-0a2a0a5309dd-0a2a4506d522-36
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:33:09 +0200
Received: from [52.101.57.15]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa17c34-195a-0a2a45060019-3465390faec6-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:33:09 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5557.namprd03.prod.outlook.com (2603:10b6:5:2d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 15:33:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 15:33:00 +0000
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
 b=szsjK0mfuc6lLH/T57LuntXlcnQknbX7kPE+clF+SUXzyKC6zofrYqmJaoayrdgeNF4CU2iJHhqdXtbUfK1hAoWvBeEoGjdg3YGSR1xcULbCDEamGdVqeAxeqSGRqvEFVAHg5d6EkFijEr6k2wpUsB8reINm78FK8YrLlmNl8UCdJLx4DISSOTFWBQuGXEc8lm4eAbtTmS5nc4wfvqE0gvI12Y/8fo/K/QjCv657PC+68BmEsu0rcxa8Ad6XVl8GAZAXRpJtvQjIgDRsA97x1SJMAAr5ZeeH86UFypAo6dAG+LQMbU6y4xc4vTp46iTDherpMLeHy+EteV7KVwebBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBKbdE+f+zhhwCRgFByge8UKwgCiEt7GhX475so68Do=;
 b=YFGs2uw7A0GsCzqhOgqtyXmy0737RBlitYwjz5GxBP0wil/vZ1bsuBpvw+yvuYOWhU8FdHI7i6abAdcoLg2NFA2wKRLJN+sSKAkg6ny+06jT2SZrAPk10wX3GufPn227B4m+W3PzFuEfVix7y73c/iUlXOmmA/1mSYJV2WAhVcjxGDZ7KkRJzNEk1Nv2zWWOy5eGdjTfnBHDIgcsjnL9Jjb4EC9ruy3C0xDmXZnfgacGjZj5aJfFh9Z4QNkhZseU35LM9b8kolnL1xBojpd5dU2lNyhBn7KUEsxux07mfuxdA4ZyRexTmaH43oevymTAQBoDvaYaHpamsKUogOLJ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBKbdE+f+zhhwCRgFByge8UKwgCiEt7GhX475so68Do=;
 b=dR51EkET2X8pBdhW+Da/r/AEAm6gvRSYi/NyT89IwaAnAQ9sYRdf4t3BNYu72sGzeP4hAdVMC5x13pHTQsXoA8gypfy7VlABIR9GgDsvLczZwW77M7h8nq4/vrcMmYR+UhzREdKmwix3akug07bnalz/AHaaPPsDVI9+iADx98M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4413f32d-3c76-4248-b7f9-577576bb4ea2@citrix.com>
Date: Wed, 9 Sep 2026 16:32:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH v3] x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in
 additional cases
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@xenproject.org,
 xen-devel@lists.xenproject.org
References: <1788956067.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1788956067.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bc1b9a-7f66-4c97-301c-08df0e87a1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|5023799004|11063799006|56012099006|3023799007|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4GVOfrcJiz7zoC8abEnqTX15rEq/xTD9xMjh/p2Zi9+3VLDol+cGRvTi998FzFzIzafhpuWb9F8QnR9kx6RataiiCzH6pl90CtsxBTyiQdqEikBigVLtkurqQsufBdlvkx3HSgKBgL/FTgiVDowf/3+vReoIxr75UzAvZaN3o877foS5ghJ2GxI89ntQ2smvC/Z577MCSei2XwLaEy5EdMhh32QLW8QQA5D/I4JyWRMU8AEDkFWPAsqfQcPxUQX2pCD0WQjg4H3bmRAlXHENv6hHyX9Z4nINW7GSsxnCnNiRM93epPw623E9Up/UYW++S6RlxXl0p7YoGWv1LpVfly9nw+hbjZS4ljcJZNyRafKToip/nfjYZCGzu8/96LJnjd37KQ9W+1IlGz89z1cas/JOBYRRz7ZP/5Xe+aFVhrg22okkmIUMlrrvvV6zxl69BQhTUwYRlIs/Ixi/AqgUp8LQWWS9jeFu0FXhiKF2tKns/2YATnHFxuTdrxLGVDrxWGN0tbadEDfDNeaKqLbtpJAC/QWxsEh/dtXrvHfmzEXV1veU/5U87+SU5Z7JgxhzZWDgJldBMQ5RRTEvaDlgEA9e6Fo9L72gi7X3b55Z9+xoq+R/7A6bjhnQaviSUFv2vi/+9Oz3IKKP9MHLkN6GwU+rGHXreKzWFepx8XEJ2Ig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(5023799004)(11063799006)(56012099006)(3023799007)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEhKajFCL1RSOER6ZWp4cEd3MExyVnQ1aDI5TFpIZDVFOFVkaWg3YmJ5Ylcy?=
 =?utf-8?B?THUrNkhxd2poZ0c0QjBESXhQM3NwLytjVVFnV05hZllrRmlEYjB1d0dBazJP?=
 =?utf-8?B?OXVKdTMySjlwVmNNaWxMd2pGQWNYeUZuRzc2eE1UVlpLRkVkcVVUZzNuMHJm?=
 =?utf-8?B?TnpkYVNFV09jWjNpQ2t4dEc3dmtZSVpzY1ZBRVkwK1pVSzcrZ0hQMTlsK1p2?=
 =?utf-8?B?d1AvN3dPQWRWcWFmQjBTZEc1MTNXK1hZVG14TUJaWktMYzN0TFQrLzdVWU9Z?=
 =?utf-8?B?L0kwMWFpSFBKVExiV3V0WjdiNmFtR1J4bElCUjFOZ0JpeUR6ekpzd0M0Q1cy?=
 =?utf-8?B?TWNlbnREUjlsMzd6bVl4Y2VhUHdVdDdqcTRhWmNYZ0FDMXBzcm8xZW5CUllC?=
 =?utf-8?B?VzcrQndJZ2JVZkcxeVJzS2RZb2dGZjV1R1c3NWR2citzeWpnM21ONzFVYXpt?=
 =?utf-8?B?S3VNa0xjUjR3TXNzbVRkb21WUEpYaUNraG9FYm1DM0FiQkl2TzJseHJkL0pv?=
 =?utf-8?B?NytwdHBZc25YcHY5Q0l5aXNZSWR1czlBOEFVeERqTmx1WFZpMzdxbS96RlJI?=
 =?utf-8?B?c0QyK3l1YVF1aDJmVVNqeXNZeDdLOFd6RUhjSU5ZZGVSL2hkSDYvQ252S2Vk?=
 =?utf-8?B?Yk9Ebm1rdTN4VXFNcHUyNGZDdGVzdFJrOXUrdy9KSUlubk1lRzZaU2wraTFp?=
 =?utf-8?B?TjdNZEkwdE5IOTVpUFBwVkJGWTVWbjFkNWRUa2VLM3UwaVRaY041RUErWHM5?=
 =?utf-8?B?NFJGTFVYNVBURjR3Ynp5eXFEQU5KVGYyaThjYzFrZ0N5MGlFYlhtaUtldkxv?=
 =?utf-8?B?ekpMZlNlNzE2Wm5RMGFObkdlakFYNHM1c09Fbmhmd09ESjYweVh3VFBJV053?=
 =?utf-8?B?Zm1ZRTNXeUVHb1ZXRFdMMWdXZEd2U0d5OTIvRzlRSW11YnNFUkpqMkhqNkc5?=
 =?utf-8?B?VUp4UDQzdnFvMXJCTVhrYjZQcHRnUnAzb2xqbWEyVGhDdmxobGJQT3pOQ2hq?=
 =?utf-8?B?Q2ZlRlIxZFg4UnFETkJTVGY0elM2UDRscGxtYXFJWkFDbDV3cCsrNGJRRXZH?=
 =?utf-8?B?NVNNcjdxNHNBck1KRkVPWENQQU5CNzZxSnRRYlcvNU9nelA1WDhBeWd6akZB?=
 =?utf-8?B?ODM3NVZCT2ZNK3NGU1o1ak41Mm0veFZiZVpweThSMnd4YkVvMEJCQ1lsdUdp?=
 =?utf-8?B?b09kOVZqQ1JqSXhOTHZzbmJHTjFGYzVUM1NBRjVpbUJzWjQ5dXFXemZzSzdG?=
 =?utf-8?B?L1d6dVFsdUpRTkljWW0rN2N3U29wU0JBYkxuVTR6YXh3emhJZWNHbGh0WlND?=
 =?utf-8?B?akhWSW8zVTIyMFJGZzd3ejZiWGMxdk1kZUNEMC9uR0xkN092U1pYem82eU41?=
 =?utf-8?B?UGplVXp4Q3lWeCtOVjVNZFNiMHJOSmx2b3IvSUROUWpNekQwWENOMk1HR1cr?=
 =?utf-8?B?WWFLc3dnVUtzZFk2dm1qaGJTT1MxVndJUmhYMHZDemF1Sng4L1lYa2ZGQksr?=
 =?utf-8?B?N3kzcTM0YnkzTzZ0dk1DYnZjSnV4aC9oNittV3VHMnFWd1YrUkFiVDEvZFlE?=
 =?utf-8?B?Sm5jaE1BMmZCeE15SHdxaVdhTDFHazloR2lxVHVHYXZmSHhaSjhzRjFkK2Rq?=
 =?utf-8?B?OWFoQ1RLMXAzbWlCZ3gxMzhlWnJ1SDhkejh2WS9pRU1Dd3hWVndma3E0NWtL?=
 =?utf-8?B?RWJ2R1BEWTc1Y1puVWl5VFhobUNZWTF4MXVETEFpRE4zci8rb1hpYW0zNVVE?=
 =?utf-8?B?dFV1K2U3ZFRoSG02YkVVMmtMUGJHTkoyd0tXV3ZFam1vLzJGUThhSVo4a2Vz?=
 =?utf-8?B?S3Y4MlZsR3N4ZEV2OFVtVDBuT1gyY2lOS3lEK3JPdXgwdzRYL2FEYkhhRjVF?=
 =?utf-8?B?bnU1aytXazZCSlBSUFVqUUpkS3dVSGxPZDJadi82NW9BbXl6T0dtWHJJU2hq?=
 =?utf-8?B?bGdEOS9EdTVRa2VKU2s3dDFESFRoQkZMZUh1TDhUN3VDcmVvTWU0TTNkUkpx?=
 =?utf-8?B?aWdGQnl4am50QWNwWlBDallwYktvU1UzalI5aDRiK2xzekhQc0R5YnkreDhK?=
 =?utf-8?B?WGhlMDFvWWNSQ3M4N0RFLzc2T1VlREpQdWNCaWg2ZjIwNzZXaHRrM05HMWtE?=
 =?utf-8?B?b29Xak9IaW1DSUV3NHVNelVoNEM2ZHBxWC9QQVdaMVNmaVNQMHlpTDB2cWo2?=
 =?utf-8?B?bWI4ZGZCRXAyUzlLVjhyNlRWajJwdmluY2R5Z1NXMUs0T3FnLytxdVdRTGZ0?=
 =?utf-8?B?TGljQkx3OWdwZ2xQUjNNY3RMOTRrcjFNOHlsR1lSbVhONG9KdDhXbzFhdXpB?=
 =?utf-8?B?K2REbUxkSTFiWVpTVkFjaW0rMnlwM2hCUE5UdVFnSVpOdHdQNFpadz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bc1b9a-7f66-4c97-301c-08df0e87a1d4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:33:00.9195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7v4XUE+2uyMpdRckarmLahSBrK8X3fVIneUyINkh8uCG8BxTtZpCNdgJQFXyHuzy6xn+b99JfnMhle3WFliRxNKnAeV5pXVD7ioL4AbTfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5557
X-purgate-ID: tlsNG-16d1c6/1788967989-F74C977B-1474F329/0/0
X-purgate-type: clean
X-purgate-size: 2570

On 09/09/2026 1:12 pm, Teddy Astie wrote:
> When settings HVM_PARAM_IDENT_PT, skip domain pausing when :
> - there is no vcpu
> - unrestricted guest capability is used
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Regarding checking for hvm_paging_enabled(v) (proposed in v2 review), we can't
> as hvm_paging_enabled() is vCPU specific, and vCPU 0 may have a different value
> to another one.
>
> v3:
>  - rebased patches with staging
>  - adjusted formatting
>
> v2:
>  - rebased patches with staging
>
>  xen/arch/x86/hvm/hvm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 9a4147b62e..2981a61cee 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4237,11 +4237,14 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>              rc = -EINVAL;
>          break;
>      case HVM_PARAM_IDENT_PT:
> +        v = domain_vcpu(d, 0);
> +
>          /*
>           * Only actually required for VT-x lacking unrestricted_guest
>           * capabilities.  Short circuit the pause if possible.
>           */
> -        if ( paging_mode_shadow(d) || !using_vmx() )
> +        if ( paging_mode_shadow(d) || !using_vmx() || !v ||
> +             vmx_unrestricted_guest(v) )
>              break;

The comment isn't really correct, and using vmx_unrestricted_guest()
isn't really correct either.

How about this instead:

        /*
         * IDENT_PT is needed only for Nehalem-era VT-x, where EPT is
         * available but Unrestricted Guest is not.
         *
         * The identity pagetable is configured by the toolstack or hvmloader,
         * and the param needs to move in the migration stream in case the VM
         * lands on an EPT && !Unrestricted system.
         *
         * Nothing, besides recording the value, needs to happen other than
         * for VT-x EPT && !Unrestricted VMs.
         *
         * TODO: Unrestricted Guest should be a domain property not a vCPU
         * property.
         */
        v = domain_vcpu(d, 0);
        if ( !using_vmx() || !paging_mode_hap(d) || !v ||
             vmx_unrestricted_guest(v) )
            break;


The case of no vCPUs isn't very interesting; in that case, pausing the
domain is free.  We can at least note that the data is in the wrong
place, even if we don't fix it yet.

~Andrew

