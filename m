Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D5606B7E9
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 00:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=NSlCK5IF
Received: from list by lists.xenproject.org with outflank-mailman.1486645.1689177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRfG5-0006uW-CM; Fri, 13 Nov 2026 00:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486645.1689177; Fri, 13 Nov 2026 00:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRfG5-0006uL-7h; Fri, 13 Nov 2026 00:35:13 +0000
Received: by outflank-mailman (input) for mailman id 1486645;
 Fri, 13 Nov 2026 00:35:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xRfG4-0006uF-7E
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 00:35:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRfG1-003LYa-Kf
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 01:35:09 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af65ac0-e002-0a2a0a5209dd-0a2a4508ade2-44
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 01:35:09 +0100
Received: from [40.107.200.43]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af65b3b-f659-0a2a45080019-286bc82b90a5-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 01:35:09 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 13 Nov
 2026 00:30:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 00:30:05 +0000
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
 b=nfDHMAikeS59W0QBfTN2TFFg9vGaUZxlNycEL8InWGTGkxFedXLhYjw+diHEtE7at7Zm0sFrNb5bJ0eDuH7iNo/2zq1tw+O0OymIRgcOak7k2UpwjFODDF8WpU6y5nT3WXtD1IRjoo2rijajxXaVrQ97meKmNXTJwXRgiZxwWA8/smQL4tfgzhNGyTcjdWeGe3oKV8QrRWJINzCgKCpPp8GW6z3ezai6AUwzu1HK0zXj/uNjsi9ULnvTGkGN2P4lqymO1bEXoftz3g2QyRp2zkvT4s6xYlK4tGAC9ejTTFI48Fph8hjD7e/Lo0DCquZhi7r3bLYg2CpGwD706Ns/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox7gu5Yl0QKUOJP+ftfYSQXRcuwXsrkfVVEblZDsG34=;
 b=FnVZ7tozR87e+xoZ3KaqK39NrnHJDN8cfYIGj16t1DJ089pR16ItpA3GvdY1swosVpuyVKIJsB9BtjkWM11p8Sl/1+E0etUaX8Y6cnXZuVR1IaQuivuw2y9/m/t50lhu7z9K12QxnK8U1usUKSiJomfwnJ/rWd/L5THDhI66XjO8YIGc8T6l3afmAP7xue+iNQaT/ms1S2iS22ixvbaltXDSXhEvo5QDdmlGZCC+2qGERf/dFaI6YDL59vDu/bEzHwCfcft0zEZKeeqYgoiizt+VhlEozYAhAawfpCUGDrvd25EpOJdfR4/YFfH+XQPU9MUNyOwBS9pDYE4wkMZn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox7gu5Yl0QKUOJP+ftfYSQXRcuwXsrkfVVEblZDsG34=;
 b=NSlCK5IF82i9A63yUP/VXDqm0GpbFijDJoIm/X57mrLbSd3juCJX9jVC0DKUDqXr+BogkTdsr7+mh+KSxNa/FI2/0H8QLbMzxYniezDKdqtVOPYF5343Mz9LQfRkfMsNyWv/Qvv3/r/Emb5/x3rNOFtgnkRnawspf8z6ZHhAc4o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <73b67813-7556-4a00-a92a-23316a634d39@citrix.com>
Date: Fri, 13 Nov 2026 00:29:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org
Subject: Re: [PATCH v1 04/28] x86/hvm: avic: add domain state initialization
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-5-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261105013347.719392-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P309CA0003.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:45d::28) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0bb631-d5f5-4cf2-40cf-08df411d4359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|10067099003|56012099006|4143699003|11063799006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	rag7K9ymgws7AsSrfUDR1NlRuGYN9hswJF+pORaL5ycwoaphY+zQE4Qy4bXiAN6+a5KgeYB25nZGfv1Wgbgn7jeXi3QzD04VBG3bA4uYFSs7yONNz3+SBdrg6qj+8u7KPbKURovLYo1Rf2CWZz61yPDue1uD7/cxshZhyD7dDz4YBcRoITZHMhF5lidwhel8LVp1DNRiFU6cKVXPhIgU6AdkchjTNy1diGupLDf5iCEtSsjW1jeriX9+lN6xXn9jsdaPFdAiAqQwt8/6f90eY80Z9+CKa0ZBygQTxB3sJxd4JiMyvKAeu6DVKzdt+HwVeMW++u1253F+iQB6cKAOGacNvnZoCeGoNwPWhRNeRCGn1K2bGMMTd4niAR0SXHz7Y03/dqoG28goW39rnMH8u7++xy7KzSLTPGIZQLY2GkrkXrWQU1udfMLQBToszd1pjEw/XvW4VgVwXVE3qj7QLtvg97Q6gN3CM3GwPo5h9L7UJC/mCHr/GD0rIcl/yzq6jcYtdeCWXtO7qkW3b1y8GS6ER6WQ/Bb5WvCscQcyZbdVsZ8DGMW98/DBnTtfi/m1OqWhU4dpH+bpET3LUlDvy/MDA+Sbczcod0NhPpDDJzulwbW37zv17UXBUMg3YLfHuwo3gTN74oCwfvqlu2rXOms1zSMiFKIcVhozeNZVTrY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anY2Tnc5ZnVzT0ZmdEJjWTBwS0I0WlZvMkdtQ0o4VWV4akQ1cEI5TE5DRStB?=
 =?utf-8?B?VlVZNFhuMjY4U20vQ3lyalN6U1ZEMnJLcm1DTVZBYm5UK1laOGV6UUdIWFo2?=
 =?utf-8?B?UEE4ajlaSS93SDJiczY3ZnR5aXlKZUg0eS84cTNrM09KTWVjMmp1YlRzdXJP?=
 =?utf-8?B?VFQ3bTdjdEFwTWRHWEVyVnRtY3hDc2Ixa2xuTTd0dDdLZ21hV205Vk9IQUEw?=
 =?utf-8?B?RVFHMVViMVZZTHlDUExPTjE5YjdYRVdxUldhZXIxbHpJQkRMNjRvbWhSMS9B?=
 =?utf-8?B?WDYrOGlpWFlzbWRwbHY3ejUwMTFJakIwYUdxbGI1S29oMUpWTnE0NHo2bmQr?=
 =?utf-8?B?bTFVSmxLSTBiSVdrbnNySEZDTkJvNzAvcHczQVdWZjE3S1ZWWXk1MzRDZmtH?=
 =?utf-8?B?d0ZFeVRxMVk2UExwRm5JSTEvNVJ1b1h3L1hZVHpyZXUxbVpaS1NTb0Zod1Yw?=
 =?utf-8?B?Q2g0dERqMVlYSmVINWNPaVgyT3FKeUNhK1BzbVBPOCs0djA5anVZblBLUDBi?=
 =?utf-8?B?M0t5Z281ZmJoMnIxdnA3NW5hU09UaU9GMkhmM1JIOWxZM25OV09hR2NQTzB4?=
 =?utf-8?B?bGNaUk02M3o4OGY0Y3NFblJUdE9DVzlXc1M0RlpOWXE4ZEpCTVJZN0lYVDhz?=
 =?utf-8?B?L044TjRjVlVuTXo3YW5TVno3QU9YMVB4RVU1bnBnZTUyYitKOUg0WTIvcStv?=
 =?utf-8?B?VHUwN3Arc2N6THF6TjRGY1duclJhUlNING1XczlJNkZkS2ZGMW1FOElFMUhF?=
 =?utf-8?B?TDc2Tm9FUjJQUWFQdGhlY2dzZTB4OGV2OGlva1dVNnRCMXVjMzdrc1pkZHQx?=
 =?utf-8?B?MElSTVFGNWtCYmFjTVV5Vy9sdlVwRzRvbHJYeWVNVFphLzNwb3E2L3N1OSsr?=
 =?utf-8?B?QVptc3lYT3RMTSttWis2bW5LcjErUk5yQ0ovZHYwMVJJZzhUQ0FuVHpzMFc3?=
 =?utf-8?B?MmpVZXRTYVU2cUJBUVJWdmRCOGgyT05CRnVoemRxWWJJOUxzT1BSMlNtbmVo?=
 =?utf-8?B?RXBnTzgyZml1Wk84NTZSemQycmNDckJqSzNFMHlQVERHV245ZForU2l1V2JQ?=
 =?utf-8?B?U2tteEVVcUxsVmcyU2IwOW05VE10djR6eFhzZ2x1OXNFY1liWmh5SmtRYVYr?=
 =?utf-8?B?eTIxVlUvUWZWaWNtRS95L1lnS0VQaTJFVTNUUTltb2F4Zlh2dUN0MHZvWHpx?=
 =?utf-8?B?dGhXbXAwdW4vVnMxNjZEYytHYUgvVmcyZFppeWh4ZHg4T3FsS3VxL3BHakE3?=
 =?utf-8?B?OVh5QzFxYVBVaU5CemRKQUZxTG1NMmZoakY4RnJFODE2TTBkVklzMjBDUmw5?=
 =?utf-8?B?aXM2N2ZXMkpDOEpYQ1o5bU16ek8wWEhFL3JvQ0MzczlxZGtjd1lDc2J5TDZT?=
 =?utf-8?B?NUhHbmRDTVJjVnYwMFBtZDJrRUJPNVJsSERnT1VSSDNBK0tObGpvZytvN09W?=
 =?utf-8?B?cHZDVmdYcGJ0Z0pQeXdOU1ZRM3A0Y2prbERPRlJ4UE9Cak9ma0hoT2d3Wmdw?=
 =?utf-8?B?ZXk4VWZQNkdSRStIVXlnUWlYQk9KWnFwb3dadGIrRlB0cnZmVFZFb2pTM1Rl?=
 =?utf-8?B?b2VnTEpydFc3NFdHOG04cEsrdFlWVEw2UzZBMTV3ZXhXYWVQcTkxUFRVS3Bo?=
 =?utf-8?B?RU8xRU1LT2o4b1R1RHg2eWxMZGs4Qkl5Q0FwUENnRnFVdXN0R1h4OWlwMzlS?=
 =?utf-8?B?VkU2c1RWbU5XSHNTMll6UnY2aDBsQ3Q3dmlzQjdvWlR0N1gxYWt2NGNDWEZw?=
 =?utf-8?B?dFdmaVlBampnRXd4N1FPYW1Xb2FoZzNzc241aWNNWk55WFkvZ3h5K0E5M3or?=
 =?utf-8?B?Sm5DaHNqV01IcUZiL3VrS29pWFE5SjJqTjFZcEpCSy91SU1ITE9uRVFRRGNo?=
 =?utf-8?B?K09ybjJyUVhPVndZbmlyMlUwT3ltZUJ1UWFZYThqUEIvZjlrOGRTSmE3MG1t?=
 =?utf-8?B?ZzAzcktieHZldldaTm0xMDQweVIxbmUrL1djLzkrWUdZMnJYRWZYeXlqRmNP?=
 =?utf-8?B?T3o4Z2RNcVJ3NnFPTTM4R0NVNVRUak5mVGQ1MnNISlJIWjN6UzNUTGlVZ2lI?=
 =?utf-8?B?Z1R3eVFaVThRSmxjVFlGeE41bUFLQUgrOSt4S3RBbmNRWjNEbHkydWoyamxo?=
 =?utf-8?B?eFduZndFUkRVVkl5Rk5jMGJEK1k1anV2NkIyaS9jMTh5MEdOYjM1SG82MXVz?=
 =?utf-8?B?UVJtKzZQMyttcEcvNlpoeHptSGFEYnVQYUlmSFJqQVJXQmg4TDFralRZcGhv?=
 =?utf-8?B?ZEt2VDVqQ0R6Q24zSXF6OU9VUjQrV0hORjZiMEJ5MFBJRjFPTjhkbkd4bHZO?=
 =?utf-8?B?VzI3L0JOb3J4UDlKanE4R2VqSnEzUWlXZlJaOVdmNGQxM2lMcEFVQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0bb631-d5f5-4cf2-40cf-08df411d4359
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 00:30:05.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39VkVFUrZsTYs3lwN0PeQEhp8SvLjEWnKQXEjfOLkipd57939ab3FPSsLqtVYlP0IkDyNVdcpCVkEBDMy+geY1/gNvVS5smI7u+DOzlzU+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7707
X-purgate-ID: tlsNG-c1860d/1794530109-CD74B87B-58F4B56F/0/0
X-purgate-type: clean
X-purgate-size: 1138
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index db81dad4b681..8b7bfed0049f 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2464,6 +2476,12 @@ static void __init print_svm_features(void)
>          printk(" - none\n");
>  }
>  
> +static void __init svm_avic_start(void)
> +{
> +    if ( !cpu_has_svm_avic || pv_shim )
> +        svm_avic_enable = false;
> +}
> +

arch/x86/hvm/svm/svm.c: In function ‘svm_avic_start’:
arch/x86/hvm/svm/svm.c:2480:31: error: ‘pv_shim’ undeclared (first use in this function)
 2480 |     if ( !cpu_has_svm_avic || pv_shim )
      |                               ^~~~~~~
arch/x86/hvm/svm/svm.c:2480:31: note: each undeclared identifier is reported only once for each function it appears in



But, you shouldn't care about pv_shim here at all.  By and large, shim
won't have CONFIG_HVM, but if someone has decided to make such a shim
and AVIC is in advertised in CPUID, then Xen should see about using it
just as on native.

~Andrew

