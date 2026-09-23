Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4B8C982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:43:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429995.1652623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JV4-0002Ma-V8; Wed, 23 Sep 2026 09:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429995.1652623; Wed, 23 Sep 2026 09:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JV4-0002MT-Rk; Wed, 23 Sep 2026 09:42:50 +0000
Received: by outflank-mailman (input) for mailman id 1429995;
 Wed, 23 Sep 2026 09:42:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x9JV2-0002MN-Ld
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:42:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JV1-001bLn-U0
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:42:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab39f0d-2eae-0a2a0a5409dd-0a2a4501b722-10
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:42:47 +0200
Received: from [52.101.53.42]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab39f15-5984-0a2a45010019-3465352a10e6-4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:42:46 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB6927.namprd03.prod.outlook.com (2603:10b6:a03:43d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 09:42:42 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 09:42:42 +0000
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
 b=kNF9K4mfQkj9VY7IINHw7ErCkPI5yf6Rt879yaXBnOmwk9om7XXBbIKh18mx4iMoe6dzINC7JyxpOcvI7QfKyE7zHrlt0+zo4tjsu0PZVuzNI3lmTZRwvxLW7qYUuS2i+Gq2AefIQT3X33Wo06gDWoxdcGz+M8GoMxUHZNk1k4JJ5tyW87r/6cHYPw9enKaxz3xKOkXYatxy35lwr1F5PyIzIw/z4GfVZLaeKUSSbzMsf8DwnwkqlYt1yYTahj5TthAIHPy5w3eWYl11yEZ59fDBjnBaZUDEAJpgM35AlNbeKXsRBf/1RmyZaXYk8NiXiRYvwSkhXpyf1wPsinuATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucfh9PR/hUVZ5CYzSpg5fpcKc3g4PNqj1US1IT1dzZA=;
 b=Nd8os1vdyqgiAjFnMzq6F3aVdlo9pxRmp9BFdDX+UFWm1pSOOR/T935LBtj+l5wKm0MYtcerItMNIeE7hT0sadvrBh+PXom5fHA+WGY/fOMQWB0m6PvP/gnAjG4v+BqcHfv7hxnD8kYTPh0W7aJc8I2F31dwEkpAJWnA9BQCp15B3bnQbrYHhU8EAkoTtzOralgVces0/RiRy8iITRvfvLWG8uQk7TDEcYo1UxZqkht90D0DJV8tL4U1+wtA9LN90IZXEaTdqkqcqfClqcUJHpzQXBv9KoMZreTcEfp4ooA3ySRMELMzJGeaMAoeqo4O01Crgikl0TvcdGTfAfHxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucfh9PR/hUVZ5CYzSpg5fpcKc3g4PNqj1US1IT1dzZA=;
 b=zv83rE46KJfiZMyQsv9FiQebQNYHlIGjQxi4RiDI3rRlZ5ZvIIwNjMy/+57mEIbk9WMA11GGnET/DJQwwhYfZf5/rl7D7Loa6YHqgAJvcUY93VlGTOFSRfdFo/2oHx2AzeRkDpd3m+pGPayRocH48VT8oeXdNe7T2M/SXCXgk9U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f8f887ba-2528-461c-bcce-54afdecf8336@citrix.com>
Date: Wed, 23 Sep 2026 10:42:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] x86/nestedsvm: fix up
To: chunjie.zhu@citrix.com, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com, teddy.astie@vates.tech
References: <cover.1790146987.git.chunjie.zhu@citrix.com>
 <b72ef69715f9e7e6a797045b0091489842d5e563.1790146987.git.chunjie.zhu@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <b72ef69715f9e7e6a797045b0091489842d5e563.1790146987.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0021.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::12) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f058b63-a0c4-4db4-7ea0-08df195703b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RBhO/zh5pxGgKsx5tiNWXx+KH9VnBcCEiPSP1u2TBkGvVs0HXeNopOA+COwZNTg9iyk09LnZuVmBu0Kzd/cutnU2vLDAwNZFsAR7IC3N82zWciIw3Jnk2HvVLd0/EEEzInyGESiOk6OZMPSsArewCt7phs2T+C7jdO17d7EYrmAqzr/HL0PPNghfWd5sfiwx4XalQXmNV7YCOelh9PRvoSEpyphtL4wcZpaQFx0qclqraDbil7QcsJxKF7h1eaw/8lT8iFOg3+ghCRDCv1V/IIBHt6Rym5bqQDrA2Y880ble297VYpA1jb2NkaUwXXgNH8t71RbOIzBDstrc7M9wMZGwV4k8EYaPJyzaWiRd8m1J8PyYwototOqavLxvgCtE68H3lvmQwq3zsQkIWaAZZOzjuzI6atNQ9JmgdBu3h01wvMPmZS23DBRh8utSMpFhAN0go+8yMJo1IhdZon3NWg28EeMeIj48yOO+9yu2emT3/VJiF1p7aQqggRpvUFw0/QKmg5ZuYU94FYDuXZTURsDI3Lx2crQzFwuqt2y0MWe4KXiiMlqSLMeZnU+zn9qhqu9pZDdWHg6Lh8Lj5WHaK8tVNymp35bu8xx/Jqfr6szrSGYJq8lozGrtZ1aBewnFHjfrt1hpKAIsvNb/xU3wLbrQ+aZNiXRdkMO2EQjp43s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUhUVEVIVXBlS25kV0pjbjlVZzZWYVF3UUpKQ3hQZFFURXA0emo2OTBuZXdz?=
 =?utf-8?B?MlBYUjVPVVpzT0FCeXZDSC9HS2hiMWVDYWFGZmcxV1VHajBXVUo3L2VGSjJn?=
 =?utf-8?B?Y08vL0dmU08xaVFORUJXSFBOaU9kYmdCOWVnRlpvSHpwdnZ4R2k1VzlIbCtp?=
 =?utf-8?B?WlREQUtVNFV2L2RPNHVKelZUb0grQUZrRFVJYjBaeXBzL1o3Umt2R05ndnpr?=
 =?utf-8?B?M0t1NUV3OGExK04vTzBuS2tWVGVJald4bFZkeENvc25uYUlKbzlVU0NxU1kx?=
 =?utf-8?B?L0pOYWt0YWZ4TTBsYUtiWTJkYTN4cFhzaDJrcXBhNHd6OVVqUmR0S3JVa0da?=
 =?utf-8?B?b0xZY1ExWGF2Unk3QnJRRzFCQUV5OWtnWVB5aENnSk9zallPcmRRL00zeXBK?=
 =?utf-8?B?K1FKUWdRU3V6Yi8yMDgrYUNscG9yb1B4OTFKWDhxRDhXRFg5RnJwT3V1QWYv?=
 =?utf-8?B?OWIwRmhDWkF5bzJ0WWRuNHYwZXlJWHFuQXhTRTg1a3gvcnBxU3NONktmbjZt?=
 =?utf-8?B?MFdoM1ZocnFPbnRJeFZhaTh2bmQrclVSM2Q3U0ZmSlhSY2NTb2pUemhsQzg3?=
 =?utf-8?B?bmZ1em1UM05ZR2FRbFhCbll5dTBxdExDQTRjY3BFZHM4dTJpRG51ano1ZmYx?=
 =?utf-8?B?M0J4RHc3TE1zQUNDRFZsZjQwOU1rWHBBcndIZGt6WERLTWxLTndSckZYdVBE?=
 =?utf-8?B?dEFsTkU3OWhCV2V5YzlGSHk5SEdyMytQd1VxWUNlYWhiZWI0SGdQZlJvNjh0?=
 =?utf-8?B?aDhIc0FiYWFwcE55MHJ2dUtSME04dFZNVE9uNE1QMEl3UEpUTWR2aFJWWE5n?=
 =?utf-8?B?cnBTR2gzN1FHZGhZWlFGV1RwcWwvTitEWHV5dDBQS1pLYWRvdkRQdTJ1WUpv?=
 =?utf-8?B?R2dNdXFjZERoVmJwRk9iOUFzSGtDWHk4ZlJJMjBHZVRtbWlGcTdDRzcybU1R?=
 =?utf-8?B?dGFKdE1maUJKOHpwQy8yTmFvZE4wYnNES1RmS09Mb0FPbTJiMGtPZ2Vwb3hm?=
 =?utf-8?B?WEtmUEVtQm5KOVpsb0phZGozbWZkMVFuRi9ZUFdPSllId1NhMWpYQjFnU09y?=
 =?utf-8?B?ZHpqWU91bEVVUG5kd2lnWjc1KzdUQy9mcUNIdC8rT0VET2ZqS29vb3E1L25x?=
 =?utf-8?B?VzlORXJnRFkydG1mbGY3N0JvS0lKQjB6R0ZoQXZWR043N1VxUmt1YmkrYXRy?=
 =?utf-8?B?L0p0S0daVUdoZW5MOHN1cW1wZ2oyNjIxWEFaVVNsMWZjSnlTRU5iSzRQbnIr?=
 =?utf-8?B?TUJZaTZFMmxDZUpQUzRPZEM3MThSNmx3NDVVUnFReDVxY2tQa1F4UitBY2pE?=
 =?utf-8?B?ZHJ2UWJuV3Fyam82RitEYmF1b2lJbzh2aThYc0htZmpweG1YMC9iUDdPTUhX?=
 =?utf-8?B?eGVQc2dtRkpWRXFmK2tzc0xkdlhDa05Ba0FYUURFL2w5Vk9kRnB2Vmk3UjVR?=
 =?utf-8?B?dm9YZGEzSHF1dDJIbmdKbEJ6dnMzbEY0a1N3WkdoMFRZUFF3cGRSUWpzNmNJ?=
 =?utf-8?B?OVZKTWs4a1VtaWw2M1REQllLWWVvVzJvWmFpcGNkWVU5RkVuN3hoTUN0ZWJJ?=
 =?utf-8?B?bU16cVBodmhCWDlGUGJiQTIwSkQ2eXZ1dEJGT0dJN2pNZ0tBbm5sL3dtc0t5?=
 =?utf-8?B?aVg5Umh2cUJ6c2FtMmFEb2M2YytMZFBzLzFyNjRqZDZrY1NOUTNodEN4Q0t4?=
 =?utf-8?B?dlc2WXI2amd5V3hMUlZBOXBVYytwaCtKL3dvb1pvLy9BbkM1clpMcW4xWEJO?=
 =?utf-8?B?VmlPNkgzOGhzVjFSNHNSNzcrd3dIdGx4Mms1cG00eHlQckEwVzVMZFhlOGZP?=
 =?utf-8?B?K2kwS29wWStIdktiN2NrWWZHTmFPMDAyWXk0Ky9KR0UxY1JZWTQ1WmZBM1NO?=
 =?utf-8?B?Y0xKYkpHckFIUDFYRnJUQnhPNGRKQU4vanpJdnRBazNzdVlSeUMramZuaFM3?=
 =?utf-8?B?Y1hGSWpmOHdLZnlVYkpnTFA2cERYWGJ0YVhTcDZWQWcxaUxERERrRjcvQXZL?=
 =?utf-8?B?YnB2WVZVNmR2Mmhob3FnRUxyenBySzdYQSs0Rml4UUF1MzQ0ZUtpM3JtdTNp?=
 =?utf-8?B?RHdCdlE2dlNvbkRMSHRwOFd5M1lTZWVRdFdmWG1LN3J5c0hKNzR3elFSR0tE?=
 =?utf-8?B?VUo5NkV2bU5GaHhwOTlzU01aWnJHYmpVY09GeHZqSFArVXh2aHFxcTdFVHFE?=
 =?utf-8?B?R2p2bnhMOWNmd1VXbVN0bFhYVFRTOUorbStJdk1Sb3VSOXk1alNmTDZ1ajUx?=
 =?utf-8?B?RC9rKzErVGVUMjhQeWR2dW5qZVpIcG9OSlRpb3pqMGJoSEdvVmdNQTkyT1Zj?=
 =?utf-8?B?OTY3V2tZVFlhZnZwWWxLazVlc1JCa25ieTJXVnJrU203c3d0ZkJnMHl6TGEx?=
 =?utf-8?Q?yx9nGSgLzR5g2D0A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f058b63-a0c4-4db4-7ea0-08df195703b9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:42:42.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjnRtKOx6krCj9T0XrZ7pPp4WPbKn6M+0Zp2auVUEz132/cELeEC++kK2zzprjAI0DkOr0ag9sHX5Nwzw1A9zD1KOaQnLO0VX55viZK/GB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6927
X-purgate-ID: tlsNG-d62444/1790156567-1FC69757-282F0547/0/0
X-purgate-type: clean
X-purgate-size: 4193

On 9/23/26 10:20 AM, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> ---
>   xen/arch/x86/hvm/svm/nestedsvm.c | 19 ++++++++++++++++---
>   xen/arch/x86/hvm/svm/vmcb.c      |  9 +++++----
>   xen/arch/x86/mm/p2m.c            |  5 +++++
>   3 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index 82e01e513e69..91872af8aa7b 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -355,7 +355,7 @@ static void nestedsvm_vmcb_set_nestedp2m(struct vcpu *v,
>       vcpu_nestedsvm(v).ns_vmcb_hostcr3 = vvmcb->_h_cr3;
>   
>       p2m = p2m_get_nestedp2m(v);
> -    n2vmcb->_h_cr3 = pagetable_get_paddr(p2m_get_pagetable(p2m));
> +    vmcb_set_h_cr3(n2vmcb, pagetable_get_paddr(p2m_get_pagetable(p2m)));
>   }
>   
>   void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
> @@ -373,6 +373,7 @@ void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
>           return;
>   
>       p2m = p2m_get_nestedp2m(v);
> +    nv->stale_np2m = false;
>   
>       /*
>        * This may happen if we've handled VMEXIT_NPF at the same time as a
> @@ -383,8 +384,6 @@ void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
>            vmcb_get_h_cr3(nv->nv_n2vmcx) !=
>            pagetable_get_paddr(p2m_get_pagetable(p2m)) )
>           nestedsvm_vmcb_set_nestedp2m(v, nv->nv_vvmcx, nv->nv_n2vmcx);
> -
> -    nv->stale_np2m = false;
>   }
>   
>   static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
> @@ -1024,6 +1023,20 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>       struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
>       struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
>   
> +    ASSERT(v == current);
> +
> +    /*
> +     * The physical VMCB fields covered by VMSAVE/VMLOAD may not be in sync
> +     * with v's vmcb if a context switch happened since the last VMLOAD.
> +     * VMSAVE below would otherwise capture stale/foreign register state
> +     * into the L1 shadow VMCB.
> +     */
> +    if ( v->arch.hvm.svm.vmcb_sync_state == vmcb_needs_vmload )
> +    {
> +        svm_vmload_pa(v->arch.hvm.svm.vmcb_pa);
> +        v->arch.hvm.svm.vmcb_sync_state = vmcb_in_sync;
> +    }
> +
>       svm_vmsave_pa(nv->nv_n1vmcx_pa);
>   
>       /* Cache guest physical address of virtual vmcb
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index 5354c4f1b85f..2f7053ed7eec 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -357,10 +357,11 @@ bool svm_vmcb_isvalid(
>           PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
>   
>       if ( (cr0 & X86_CR0_PG) &&
> -         ((cr3 & 7) ||
> -          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
> -          ((efer & EFER_LMA) &&
> -           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
> +         ((!(cr4 & X86_CR4_PCIDE) &&
> +           ((cr3 & 7) ||
> +            ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) &&
> +             (cr3 & 0xfe0)))) ||
> +          (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
>           PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
>   
>       valid = hvm_cr4_guest_valid_bits(v->domain);
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index 027b9ae69be3..d1fafc479c78 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1517,7 +1517,12 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
>       np2m_base &= ~(0xfffULL);
>   
>       if ( nv->nv_flushp2m && nv->nv_p2m )
> +    {
> +        p2m = nv->nv_p2m;
> +        if ( p2m )
> +            p2m_flush_table(p2m);
>           nv->nv_p2m = NULL;
> +    }
>   
>       nestedp2m_lock(d);
>       p2m = nv->nv_p2m;

This seems to have combined several bug fixes from our internal patchqueue (I
know because I wrote some of them...), some of which have already been posted
to the list.

It's not clear why they were submitted as part of this series.

Ross

