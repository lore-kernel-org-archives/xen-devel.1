Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B8606A32C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 20:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=vUS4mrUa
Received: from list by lists.xenproject.org with outflank-mailman.1477362.1682895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPQpC-0007D0-LB; Fri, 06 Nov 2026 20:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477362.1682895; Fri, 06 Nov 2026 20:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPQpC-0007Ct-IS; Fri, 06 Nov 2026 20:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1477362;
 Fri, 06 Nov 2026 20:46:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xPQpB-0007Cn-40
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 20:46:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPQp9-004itw-Ey
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 21:46:11 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee3c93-8faa-0a2a0a5109dd-0a2a450799b2-0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 21:46:11 +0100
Received: from [52.101.52.15]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee3c92-b4ea-0a2a45070019-3465340f98ca-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 21:46:11 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB7141.namprd03.prod.outlook.com (2603:10b6:510:296::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 20:46:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 20:46:07 +0000
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
 b=C4KRq/8Uhjzsa39t0j53Y12mAkW0gVXF2bYhb/8F1vQWJPE14z0STUo50uNADtGsFJn7jaA1ntmAM4BrAbfzK72Eoi1iG2uQunbRwuMRUoIhsAFpOjYIL9qTPZsvP4kvDtcXWljYAb4vMdMIl0n2r9NT/UARZCDFoOjM3QDr93n8VwIdeyQCDXIliPhHKr0nnXx+7aDydondAYNjMzmq+NtFXsQBAYoD++grIgD85npF+JKAAircmt1dArbUuSMS3CJaZPKGuTbzCEaDNX3i1sAwdPuxGS5IrUsEeOblVMUz/EyVzghbwzD8voN+MFMpQrPWpaQSXsDeUKsAj4zHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeApvkWJ+0VxjdGYnn+UdVuBOMNZRtIqxsMbIVa/VVE=;
 b=Tnhtqmm31MvRZAxvdUSRfLtyvyC+PejVQqDow3yLUFkv+kNkTl/QDSIPro6ddVd+g3krOudD/XCMM4lCPetfelkEuxVMWjqQcsGRs64SCV8MW4o2qlapBy1BSTHBjb5kwb8BU+UvK75QeynxsCx1Ah5w8LQ2BaLhoJOtyQmoQhpe6YyQSaJ1vGes0RCgC6/aRSH/jYx+UrlDvhVwqhIIl/rX7cBrFBDmSushI9Hy9HHM5+dHJgAHJ7M4N67vbwsttugVqcD3KX9f+qEYz9ZzyxhWfdbh3VyAHeadc2Gcg5+HFIb28QUuMFNDIY7PF326QlnfSsjErfywcW/tD0LmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeApvkWJ+0VxjdGYnn+UdVuBOMNZRtIqxsMbIVa/VVE=;
 b=vUS4mrUamqM64+Q8igkYlWOecRP3IN43+qrcc6hThya273kqpfqHb+5ivDVH8E9Uw9gBQKqPMKi2ykVtxPvKSfif+a6vcVKvFv2Q3hwb7SFOSzLBkCrvbce7AO0hhnG3e3qPgXOCRxV57HcMjqb4A2lR79Oeji09lzRhpWzDZ5A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dafe5046-b722-46c3-811d-056d0d786855@citrix.com>
Date: Fri, 6 Nov 2026 20:46:03 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org
Subject: Re: [PATCH v1 22/28] x86/hvm: avic: ensure SVM AVIC supports xAPIC
 operation only
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-23-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261105013347.719392-23-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0b5b80-4a76-4df2-e2a4-08df3c46fb4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|3023799007|6133799003|10067099003|56012099006|4143699003|11063799006|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	zNB0XGskq/f5KSVNHAZ6nCRkdswDmFsN5c8Vl5l1q+cUmNxDjaEbxAUk/8w72S5C2oiX/09mHXwz6azTZOa1/phOmgGAm5x+TZ6Zp0vcelksOTMRnQ5+T//xLosBc4f0hVbpoygIy8KuZrCjxDLq04pUWi9R6JJFrpHHNW1cib7AqOMYmxM7PXMV+00IU66iPJrqVc0WfTVJkYB45rfIcz96uygsCo08GLTEb2Wn8/XuzEDd8t8h7kLo+KAYzUg3THfv2SXJFpBO84tptyFWqFrtPrxL0kLW4IkNfjZau0InNNFb9d68o80pixhiPAng6IGtPtOEL/3r3xX36s0JAOmlx2cQ3ugCFFc17rzQehlsDvJl3OH2dRz3QIq6JejqYbzO2ezx5/rPig9zT/UnCmNDNEogmRevka0kc2SSM8WxdUFI5kPt1F5G+Mgky2Yu1S43MUz0sP6rwQCAXm9aibveyiH29eLaApJm2nXbyn2jajMM5aKScPG9kFnSFf+FnaxlnfAzfS4+P7t65KgPcT4uMJFnOabGkrOv42AojfYtLm7rMpz3u+UAWpupB+TuIfma2W75adpuwi5OCaeVc3/BrUqWQi11b+Kdy+o7kIc0e5Oc+0G1ZKAZ7FW+voUui/Pz0JKZSzUYCSbtQQlRckZV49k4r8zrnD+E+PSyLn4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b29mQTNCZkV6d1V1Z2VjRHVWMDRwUXk5ZnYxYWc1YmFWbWhpNi9jOFVxdkZW?=
 =?utf-8?B?UUFmaGVKQkRGSG9CWHRkRS9UUVhkL0ZSUG5NMFFUUGxncHcxa2V1VDJEdE9v?=
 =?utf-8?B?QkVxaHdaK25XU1VJSDZmQjUyVDY1RlNxNy9mWXB2TVYyVU9zenB4RkNjWnl0?=
 =?utf-8?B?T0NEOEU0S0U2NWNPcFVtVlBEL0NOdVpZUjhTNHg4RHhsVG9qc0pSL0M2ZHNJ?=
 =?utf-8?B?b256Y2o3N09mZzZUMGVqMDh6NG0wU0ZwV2k3NCtkanBmMkdsOVR4ZFdSWTM4?=
 =?utf-8?B?Zlg2UkQ0OUEzM0lwTDdZRjE3MEJRQ2NmMUhwY3M1QldIV1ZpK3pGa0ttb2lH?=
 =?utf-8?B?alg2eWZaKzcwWHZoRC9OQ0p3SVYyOUVITWpUd2NRY0ZKQkhZaXVFdXBEaUpH?=
 =?utf-8?B?RmkxTVN1SlBMUmpjbm9ZOC9EZVpGUjRkWHRBejk4VDFDekFaVll3SWRKdnAw?=
 =?utf-8?B?Zi96M2FjeFJkQVBLZXRONk1VUVhTNWpIbVR1MjhHM1dwbnJ2STFOdkg0a0VX?=
 =?utf-8?B?WG00WmttaHkza3g3NkFPbTFET3ZnemVOSEw1QTVIYXplRERQcUt3UXF4clha?=
 =?utf-8?B?MHpWSk9EUE91SWdDdXVLaWd4SDZtVCtHNWF1OE9vRVlyNVZwMGQ1RmVzenJw?=
 =?utf-8?B?U280OGZBQm90N3BYSXQ5Nk5yTGZ6SnNTbTZxY2VpTkxLd0xLTTZTbytZMDlm?=
 =?utf-8?B?L1FIWDJERzF3MUVEeTRkbXBDM3dGRXVOZWNqYjN6azBCamVCTnlCY2tTZCs3?=
 =?utf-8?B?NWxCcDlZKzJtMUFjcVNxcTRIM1VMUmhZY0ltWk5ld1hUeC84c01ZcFZ4NzZZ?=
 =?utf-8?B?blhMVXpSbXp0c2VFd2Vpa2RCOHk0NGlQblF6cEp2MDY0THArdmwrR2hXcVV6?=
 =?utf-8?B?Y1dhV1Z1aGhPZ3FEVzQxdlp6OWx5UEZyY3JuSUVmdTNDVE54b0lwdTcvMEVj?=
 =?utf-8?B?UmpQZHJCdWkwM29CZERueEJFOGtsTlM1Vnp3UXEydEhyNEdVREY2ekpwd2U1?=
 =?utf-8?B?b2JnZHBzRS9PNG5IWXExVWJ5cEYza0xVY3ZQTVNSUU1mU2lOdndQcDZURUJ5?=
 =?utf-8?B?VXdzZURpeXpEWnVldlJyZWlMN0FvYjkybUFJdFRVcy9obEpIK04xQngwRnZu?=
 =?utf-8?B?MHMwSTE2ME9lQUhHVlZtdDRieG93MmMxcGVwR2ZqbnB1c3RpR2lUUC94c0w0?=
 =?utf-8?B?K1NpSWNDVWxMU1FjUkJJcXdYZ1E4akFONXJJVEtOYlhQV1lwbmFqMmY0Lzh1?=
 =?utf-8?B?VGV3ZE5FYTVOY0VLYmlKQldUckhua0hQVVhpM2FET3dHM0N0WE5lU1hrYVB6?=
 =?utf-8?B?Qk8xUHdhc0JOY0htQ1JudkZhbHh1MHcvV25RaXE1SWdxRmJpbnBkSVBEZTJ1?=
 =?utf-8?B?bHlSdTlqYzBOd00yeCtqRkpMRXVVaXZWRlV6OW8vR3ZlelREeFN5bGJ6ZVVB?=
 =?utf-8?B?S1ZIZ2VTY3diL0g4eEpNUWs2Mng2d1lvaHl4eWRaeGVxeDhmR3RpTXhrWitV?=
 =?utf-8?B?TmR3L1lmUWdZbmlNczE5bGM0NmQyeXpIbnV0bFA1MXpxRUVlaUlpbjY2cEQ5?=
 =?utf-8?B?YmwvN3pvSVA2TmFCbmV0ZmV6VVZRZlh0Z3gwUHlwV0pieDNOVmZ6Z0VVcUZY?=
 =?utf-8?B?dG9IQmZ1UGFVeGE2Nm9zUnJaNDE3L1BJa2dIeVVpSFdNcnk3d25SdWNQa2tF?=
 =?utf-8?B?emxMOU1xQVhYOGd1K3FEN0gwTHJueE5sb2tuMTRjVllSNDMvWWNHTnlXSUtW?=
 =?utf-8?B?MkZnV1VjV2k2OXhDNVN2RnNzVEsxMnBqQ1BqK1VNb1dpaE9aeFNTcGErdzVB?=
 =?utf-8?B?QnBkWDNQTjk2MmJTamkwNzFHTXN0R0NJTXByMytDRnZEbWZYa2JzaDhoZTB4?=
 =?utf-8?B?UHJleWpORDFuZkQ3d1Z5ZWtrU2R2UUpOU0plN2lXREdqOUZmRkErU3pKYVpi?=
 =?utf-8?B?bWtjMXByamRrRXM2TitQWkExSUprSVZNcXUxcm56NzdsL043R1NiMWU1MldF?=
 =?utf-8?B?WWpmUzZNM04zSHUvRFBWR2ZOTGp4dm5walNPZkZoY3BDLzhrNHBEbUJ5VWtO?=
 =?utf-8?B?aWQ4amJRM21TTmw4WUNVRXQwVGIveDRUNHRIam1XMFFKM2ZTU0l6czh1VU51?=
 =?utf-8?B?bFRaT1Y4M05qRXRJa2hCMjJ6ckcxMjBaWWppSmpOMURiSHVEVlFwVUF4cDhs?=
 =?utf-8?B?V3h5dmoxSGJveXhyN2VIMHEzNEpKOXJRaXp5UGc1VmRiSnBBZFR1SHZUN2Mr?=
 =?utf-8?B?OGYvajNCVFpBQWlBWSsyRnlINDZMS1BTc2RPcU5yRWpOSGJzQVBsRXh0Z2JT?=
 =?utf-8?B?ckRpMWxnSVk3ZTNvZmJDc1J0NDZiQTZWcXBqK2FZbzJPNDhrTWM2UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0b5b80-4a76-4df2-e2a4-08df3c46fb4d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 20:46:07.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tcBE7fl/iHnJ7xbeAHqlfyYe01icSO/J9VuPtOus6KWQyifbuUqR9QeBpoRXyjOA4KVKu+MFYSux73RX4iX+ixXr7+/PcF1pLIaXAaoe/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7141
X-purgate-ID: tlsNG-ef75cf/1793997971-A44CBAE4-6820C690/0/0
X-purgate-type: clean
X-purgate-size: 1903
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> xAVIC does not support x2APIC operation (yet).
>
> Until x2APIC mode is supported, don't advertise x2APIC to HVM
> guests when SVM AVIC is enabled.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/cpu-policy.c          |  3 ++-
>  xen/arch/x86/hvm/svm/svm.c         | 12 ++++++++++++
>  xen/arch/x86/hvm/vmx/vmx.c         |  4 ++++
>  xen/arch/x86/include/asm/hvm/hvm.h | 15 ++++++++++++++-
>  4 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index 48a3185eed8d..ca9b1a523570 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -764,7 +764,8 @@ static void __init calculate_hvm_max_policy(void)
>       * (x2)APIC isn't enabled.
>       */
>      __set_bit(X86_FEATURE_APIC, fs);
> -    __set_bit(X86_FEATURE_X2APIC, fs);
> +    if ( hvm_x2apic_supported() )
> +        __set_bit(X86_FEATURE_X2APIC, fs);

The reasoning is backwards, and breaks things.

HVM guests do support x2APIC, and have seen the feature bit for a decade
or more.

Clobbering this bit will cause the Xapi toolstack to block migration. 
The xl toolstack doesn't do the relevant safety checks (yet) and the VM
will explode as a result if it was actually using x2APIC.

x2AVIC is an acceleration.  It's fine for the acceleration not to be
turned on, but it is not fine to hide x2APIC as a consequence.

Both the Viridian spec and Xen itself have hints in the virtualised
leaves to tell a guest whether it ought to prefer using xAPIC or x2APIC
mode.  Under plain virt, x2APIC is vastly preferable because the
RD/WRMSR exit gives you all the information you require, whereas xAPIC
requires instruction emulation to figure out the register was being
accessed.

~Andrew

