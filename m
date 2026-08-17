Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4256CC5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 13:08:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393011.1631922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvx4u-0007Pa-Hn; Mon, 17 Aug 2026 13:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393011.1631922; Mon, 17 Aug 2026 13:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvx4u-0007PT-Ek; Mon, 17 Aug 2026 13:08:36 +0000
Received: by outflank-mailman (input) for mailman id 1393011;
 Mon, 17 Aug 2026 13:08:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wvx4s-0007PL-RW
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 13:08:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvx4s-00GwjQ-18
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 15:08:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8307ca-bab6-0a2a0a5309dd-0a2a450aac74-12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 15:08:33 +0200
Received: from [40.107.209.41]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8307d0-f2d2-0a2a450a0019-286bd1293038-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 15:08:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN4PR03MB989380.namprd03.prod.outlook.com (2603:10b6:806:216::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 13:08:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 13:08:25 +0000
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
 b=Q8yZp6L/93Dhb2EinVYmCN+SQYH8JHgqN+Ag8VGTmf/d5b9MH9uup44E5ySsZ5NOMjWlwG2ze+a9JI4DdQoCi7Si2FUoibCD2/NW3KBR4kD7ao4STQYpHVpJFmn1PjE2+mApudsC9epPRMNMr3EGbh5tvGyEiv1coTVb5v8v+Lgq4qYmIim4+KIFV3IcZVbKwHntkgywztLiGuhrOjqm/IFqX8vXK51skltlkawaPtTxEUWbJg9b/aBIBsynyOBfes5623SRpPM+YZUVXrJaDNfkruPrwBXzmqctoAighET+irdSBOiynUGzydjDnXmYaOlLl1/0Bh+PFXo4vLX6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfBim/D1WrHJiuKX4bGy8SY/mlkevzkIn6lffNvC3C4=;
 b=qaAQaQoGfzq1tkh7WDiiH84LzAQfiC9Sh4dd3BFufJfkyPgEw8jHtpPPc6LS6JmIchfuBuR3gxiKRkjBzrHJsdANt/9G7+VPXf5LYYARJsUH8CykHnjlAy6u+C6yzS0nNNTSHopMN7PATCrmJo99pZI6Uj4YAIjjUAXG2fx7NtVvjqAKwcwxyecudQc2+51uBui8sFImLSxPh/NtaAmcs95YWQmMY+f1s8/7n8bo+aZVVXvvwbZja52WO4U/chm2b4o4y9OggdMShNOFqI+Th5J8LZEnTcBkDFPSjsst6vQjHma0+EtNAT4GetWDiTK1YwVnQnZma9DYx/9rGsMziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfBim/D1WrHJiuKX4bGy8SY/mlkevzkIn6lffNvC3C4=;
 b=U5HJSqiJ1INXpErQyQ+UPupUM0uF+jSCCQu/ACO1PN63mnQULy+tk9vI1guKfpmjUnRnx+tgRJ4sxz3n2EevuiwGDAejIyuWVV91BgoM9vf5l86Pol2CAakoKKmU+dIsPocOrDFd4+MZ5Xrh0+mhoyaJMXfAoa2d6Jdv+qfcmqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <732ee2f6-0091-45d3-bf98-e8f21b70ca0d@citrix.com>
Date: Mon, 17 Aug 2026 14:08:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Andrii Sultanov
 <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 2/6] ARM/sysctl: Expose the supported guest GIC modes
 in physinfo
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
 <1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@vates.tech>
 <ee383990-f688-4244-b817-5df4c2f8decc@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ee383990-f688-4244-b817-5df4c2f8decc@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0011.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN4PR03MB989380:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7a3d9b-4445-4c90-fbef-08defc609f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	r8ZNBbEpchyJMIK1triFW5KRe+F2fnzXKaP+rT84OFbpFl5JPYPb9l/bLwtB9ZlIrcurFumiCme42FHT0v5/q+E5Tg+5YBXqNeuKBp7C4jZLPSCOQDQt6Ndrqs6z3kYH/vFHvhETkGU8cKpUv2FqFHSduNdIbT9fMt33pqqKmdSAZzPOYfpR5Cjcp/qgLU6sPuxIo6br25R2TVv0P28w1SKYaZvmrA6nRRTPgaXRaSsY+ZuzK6ms5iahEkASFCDXKMYPzWChzFwUQKpEKPY+gWbYxSePq167DFA9QHyY9+ynxf23+NvWs9DKF27gy+YtgSDGcecMxiI4uwEJwYCU2v8POZZmXjZxoFEEJxHFp3T+eM4RpGc/+wvsTuo+88QSIjFQgI0N1KUZLAHpK62DOGYF9hVTs7OYUM87gfGfLZ8JMivfmMTbZivnECHxIDjQQa9SJXMERzj2U30gexs6ClbWJ8A1DjufERH67hBYAOue+d5mHFq7Oit9XrU0yqRAg3L+XaAxtT3tc8CCJ1bcgDyquh+Zt6km4SUp1LT7gVjHvdVgB6UmpZ8WdOoDe+dtOytDHcp8eJofkANhmDEEMestvSQL91JNun6Ll2/8IPLwZjnwQwZksAnyigwg6rvndp5Yc3htmfvnOMXNIEAKk3bICF8yVWrNjzL64FpBz+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDg1QWc1L2hadHViaWZOWFAxMXlnNFBCczlnYnJzbHEwMllRUzBZZ2tPSEpF?=
 =?utf-8?B?ckhsSnBkNWpYNGpVT21udmEwdmpZZTZ2dWhKTzhvNVQ1c2VFSHlUUlBUaHhn?=
 =?utf-8?B?TkJuTllhbjFWdGJMZVhBT3lwcXV4dmhMQ0VvSkgvQ29HWm5NY2tvZUxHVy9O?=
 =?utf-8?B?R3JFY3FoU1VnNGpOcDdJTHVrbDhuaWJJU0pCMVQvcWZYaGZYSGxoYVVzKzk5?=
 =?utf-8?B?TVFBbHkzLy9nOFBYbHJOUThtbklJU0NLNm9aNlhkcnpXWWNabHp1ajQ0S2FR?=
 =?utf-8?B?SnY3SHNYdHhxZXJIblhpcm9vT3BJUlQ2Nk9ORmRnV2VsK0lTL0lBeGt4RFBY?=
 =?utf-8?B?TjZSdEtodUdUeHdmbHRXUE1zc0d1d0w5YnJJVnljRmNTbmpNajBJYnlQR3BB?=
 =?utf-8?B?eFQwVTllSDZpZVgxOUlSbmpEa1I1RGc4bURORW1XQ3ZnU3hQZThOVndXWXhS?=
 =?utf-8?B?bVdBNitheHh3dkpuTlc0cklTbnp6bHRhL0Z1ZURHTVFCNTUwOGZreDgzSjBT?=
 =?utf-8?B?WGU3MW8xclowR3BDMXhVKzZCZEgzRmRHNjhIdW4reWMzcktMZDU5L0g3d2NH?=
 =?utf-8?B?SU5iQ3J1bjhMdGJxMnZqS2p5Q0R3Ukw4MlRvakNEa1FyS1d5bXQxSlNTTVZB?=
 =?utf-8?B?WlRsR2JaS0pTVUdmeWNJU3F4YjJvelhaVm5WUmQ5QVFZYS9pWTdLbk1KRnd1?=
 =?utf-8?B?UzRwTUV6VzBadm5tYXBhVDdLdWZoeVdMNW1BUlBaTUxDTHp3cWIvdkF0MHZu?=
 =?utf-8?B?WThFVXYyN2VRTkRWNmtUV2dQc3ZYa0ZOWFlDbGRtTVBFWHlSOGtYUVZiUTZv?=
 =?utf-8?B?SVlEWkZaeHlIa0hUTEs1em9OZ3JwWnRsL3FtaUZTVWJvZmxPb2ZXWEg0MjZn?=
 =?utf-8?B?WC80RnBjYU82T0YrcVlmS3JaWWhVZWlzQThyelpEWGR4SjBLUEw2bWV4ekxh?=
 =?utf-8?B?SFc0c0ZiYmNBNE9RTFR3eWRCdEtzNTFmUis2OWh5MFNlTmlRRUM4a0F5bkdI?=
 =?utf-8?B?SlVmbk4wWU8xVkxiVGFNVFQzbjRiNkhjdGd0U1VZZkRPbDROblp5SnViZmxq?=
 =?utf-8?B?MWd0YjNCdFowS1ZERHBjeTFmcGpMakJTSmRnQkhQaHdWQkNobVkyeHJhYUI4?=
 =?utf-8?B?eU5pblJlWnpjeGVnYzFSNkpNbmVIcVliaVFiM1VOSXBLcVI4ME1IRGZTYURY?=
 =?utf-8?B?YjJPbytRa0ZaUmZ3anF0QnVVd2JoSVlFdHFlYXU2RDJIQVRNWVp2YTY2Ymh1?=
 =?utf-8?B?NTFJc3NYTGVGaTNWZThtYzh2ZkZYNjJaR2ZlN0dEczM4cVo5R1FhZnBMaVVp?=
 =?utf-8?B?VUsxQTNWSnlHZzVVVzZ0Ti9TcDhnTm90dk90Y0NkKzhmTUhsYWdnYUpYN1Bl?=
 =?utf-8?B?L2FnRmJ1V2NpVmJjRXIralBvRWoycjBpRVZ4Y2k5ZXJPOWU1bFkyMXlRK1dz?=
 =?utf-8?B?eWFqeGxXRzZNNVEzaXF3MlRzR2IxMzNZSkx4bU5jQ0xOL0JodjdOZENHZndD?=
 =?utf-8?B?UGsrR0dzWlZWRDZlUE5yUmUvRVlmS3RMWUhObzFjaDFpVjU1eitVUHRLSFhj?=
 =?utf-8?B?azYxN051TWNhTHJjWGwrSEdUZGFsREZ1clAyNk5OMVlnSHM0WXVRUFFLaXRG?=
 =?utf-8?B?TUxpTWNYbDVBbmViT1p5eUNwRjBGVWY1SkJ5dWN3eVViS1VxYTcwalNscFoy?=
 =?utf-8?B?TnVSTVFRTEFScUR3WnZKeXlyZFRGa3ZaaEtoeVh1dlJJdXdGd2N2QXN5b3gz?=
 =?utf-8?B?anFiUmVqNlhXSlJ0WUQ1N3Fkc2xvK1VjTkdxQnFieTRZTFBLRyt3MDdIM1Fi?=
 =?utf-8?B?UTFlMTRUczBVdnFtQm5oZ0h1VVlvTkJqbHQ4N2dIYkthMGQrTXQwWEFMblVt?=
 =?utf-8?B?b2NNRnlrUnVuaWVRRHV2VUZZMFBFQjRuL0U1anJJTjBTbXM1TzFsM3VDS0Nw?=
 =?utf-8?B?ODRRcnpPTllDSXRXUlhGUFdBWWQ1ZS9OUkR6U2xic2dEbGhNNkRmOThnang0?=
 =?utf-8?B?aWxYenJoVk9NTjIyL1ZoM2poSTh1aEh5WVhPV3k3WHhwVHJ0ejBoUnhPTStE?=
 =?utf-8?B?ZEJzQW02L3NralNTWWtDZkFZQTFDc0dBZ05uUExKVFBpU3hXeTAwYit6dWc3?=
 =?utf-8?B?dkhsNkoyWTdtbHg4NnR4YUlqMDNlQm80RUxNUUdGN2gwUnRZejdQbndZOE52?=
 =?utf-8?B?VkpnZE9BV2tOSHMvdHE5WXZMN2pKWTdYZ3IzbGxiSk9EWElrRS9FK3N3anlC?=
 =?utf-8?B?Q1MxQ3ptSXVJZFFIQ2o2VVVMSiswUHJnck5SZGo4Y1FWdnBLM2RLUVFJbkdm?=
 =?utf-8?B?bDFFU3kwZy9IUFJCZ1lPbE9SNW1mcnlaR3E1SXJMbml3VFhBMWVUQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7a3d9b-4445-4c90-fbef-08defc609f83
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 13:08:25.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2JxvSrj/7hpeA9yQk97sHq0wqvEU6EM/msaDc9c0bOXT5fSNZV2gDsGi1tG70zbV+kb4d2WguwNN5dYalom5VtOszPSZBTnjc7iOG+ouBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989380
X-purgate-ID: tlsNG-4011c0/1786972113-514C7CFC-1746F484/0/0
X-purgate-type: clean
X-purgate-size: 1717

On 17/08/2026 1:39 pm, Orzel, Michal wrote:
> On 16-Jul-26 16:11, Julian Vetter wrote:
>> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
>> index 32cab4feff..3b0edf4cec 100644
>> --- a/xen/arch/arm/sysctl.c
>> +++ b/xen/arch/arm/sysctl.c
>> @@ -21,6 +24,29 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>  
>>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>> +
>> +    /*
>> +     * The GIC version(s) we're happy creating guests with.  Right now for
>> +     * simplicity it is tied to the active hardware version, but this will
>> +     * cease to be the case if/when the compatbility modes are enabled.
> s/compatbility/compatibility/
>
> GICv3 may support GICv2 and we support libxl guest requesting GICv2 on a GICv3
> host. Why are we not exposing this information here?

Hmm.  That wasn't my reading of the logic at the time I wrote this.

Looking at it again, we probably should be advertising the result of
vgic_v2_hw.enabled alongside the main GIC version.  (Plus whatever
ifdefary is required to make this build.)


The domain create side is even more wonky. 
arch_sanitise_domain_config() takes the toolstack choice of vGIC
versions and asks whether the number of CPUs is compatible, but it's
midway through arch_domain_create() which first notices if the requested
vGIC version isn't compatible with hardware.

There really wants to be an __ro_after_init supported_vgic_versions
(name subject to improvement) which is filled in by the various GIC
initialisation routines, rather than a set of backbacks into disjoint
drivers.

~Andrew

