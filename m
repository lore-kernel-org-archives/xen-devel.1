Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5681B606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=gI2bI42E
Received: from list by lists.xenproject.org with outflank-mailman.1500362.1696550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVSfW-0007nC-CJ; Mon, 23 Nov 2026 11:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500362.1696550; Mon, 23 Nov 2026 11:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVSfW-0007n5-9c; Mon, 23 Nov 2026 11:57:10 +0000
Received: by outflank-mailman (input) for mailman id 1500362;
 Mon, 23 Nov 2026 11:57:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xVSfU-0007mz-72
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 11:57:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVSfT-00HAta-CE
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 12:57:07 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b042a0c-bab6-0a2a0a5309dd-0a2a4507dba2-26
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 12:57:07 +0100
Received: from [52.101.201.12]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b042a11-b4ea-0a2a45070019-3465c90c55e0-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 12:57:07 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7896.namprd03.prod.outlook.com (2603:10b6:8:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 11:57:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 11:57:03 +0000
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
 b=K6j3vZ607VW6C2E12+dte5y+YZZjGPFFD71zNh64Z/mRHu9OEQT8ZQ6e9FTgNiQuxvsWfbJlQ+IDMQRmclZ6gSmuqkc+MEDt1MNVJ5OutCMV6c314azJRoh3kmGsCOhhVs/u/bZnjQVvYA41MEFNu56fxxRYxiMCkRrZCQTWvoPNpgFsG2ab1hNTjSMSvD04POXiAy2IsWcidRKydN98vmKFyb2EBy2OXWCwG2sInpd9qY1BOkDtyWQhkbBx+Sf+472cRLLlZiODAdvZ63LU8/6N+fsCm0L3VEzOS32AoPNG9MtoLhGQGm2xvFPrwlqxgwGu5KPHWQatkNCtkz2wWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Afjy5AA7SX8i2fZiIekc+UFkM8myapFbkxYugDDAx8=;
 b=BlX/YEVC0zYVDVXwwgnMHVY6yNif3d3/0jcW8PBv9fVv4nRAjoKIu8IF2lVIRjYWCvYEqZgc7E0svjM1xiRDi5t3uy9TER1aXzvewIhVUCh+uS+7VKoG1FVCcmXLSrETUPgDxvitf+45mYpMj4ZNcVGx9dNWXLe15PXtynBXbI5Da+Xdz5JtHgVBkhWc/HiFhXRVj+/c6I3ywazYd2De5ZE2p4h8DszRybCwxwC1picIJRg1PszpS+vzJFFfJi2TM6O+jQ6HLGZrLZXlIRtL9vPkQY4XTlASDasmzhEynmK7icnYXKnlGzsUBoMxY762AJ2djQNNz7WqRKklO9jc1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Afjy5AA7SX8i2fZiIekc+UFkM8myapFbkxYugDDAx8=;
 b=gI2bI42EDxAsuAUIGgwmrJYAkViK314LmSelXolxtjvlltr7ckxMgNNMq8uHOw2R2/3rOErZ5tHZuWUBQeCUz5GcuJWqx/uIkX5/8e+GfpYK2De3ESe1YBGvqef9dkwtQhu1qu9s4zweOPfE9ZNxUMa5Cde4ygAfnLNKjxpoZf8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b4f8c1c4-9e1d-4724-ab2c-b1402263de0a@citrix.com>
Date: Mon, 23 Nov 2026 11:56:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v1 2/2] x86/nestedsvm: Handle L2 writing to the L1 APIC
 TPR
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20261120163503.1907256-1-ross.lagerwall@citrix.com>
 <20261120163503.1907256-3-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261120163503.1907256-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd4d1fc-602c-4f7c-20fe-08df4958e369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|4143699003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Dy8KGG916IXIVRtEMOPwA0ZyZ2gdjpIcxqjk4XFgnghtH1LEPlKa/ewXaMwqEVET/+v8hI5GouwleFg9LSYpaJ71OOUF72Hcp2eKZwR478vqa4KgIOuvjNk81h2DSc/2OdEPYyUD/Bjqwwgryo+ajVTt0CMA4lJcX4UiI5wF4xKK8bHw1bVpcq0kmpM8FkO75ue8Xby+6tEqcqK6TUpCqdT+W6J7gSdaU7L0aj3XBYUxL6Gjetm4YFWw0gTuoVyn/jTRk4AoSyWeDtEYpDEImk2UO1VSyPcxLrW2OT5t2Bux8jKbznN9RrHuFBtAtYstHqIVPV4Oq/P7IYTNmNh1Y5a4jQP1/VExu3qJEcCtvulfCltOR4fkUtzwwBz6CrrOlNUIi28ojnAKhcR1exydYkNkiXYAnAKDJgSwjYCYnqYIG7kygHej4n1J4rRBsPYjj4hgE9kviSsc6J4Gjwo6Ca/ZbB8LASQYDv8242cN0MqtigMQ+bOc4oPO5wwYL/HC7JSS5UG1QI5Egm/8jyk/zQDSBu1yo0VnUQNnkTpbZy8App1VxDjbWYR/c7oy3RVlyRJun6pNMlnKy+SKmrlbFLC0ylHCSES4smcJqpXMPN3ooJ995XH1fHztRuSCk/+B1V3llt4zVk5QnurC1KbqJiiPYT1eegt4qQD+A+hL9XE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2JPa0R3dE10UElVYjRJN1Q5TjNtSEptdm1ZeW4yM240bFVsbHcrTGJGTWFy?=
 =?utf-8?B?NTFKV2ovRGlxRUtPaHVESlVXb1R1UGZlSUlSM2RiWjIrQ2lrRS90dTlEZTlq?=
 =?utf-8?B?a0RZeWNMOGovTmlUWnQzRTVrS3hwbkJMMHJtalo0Szl2SlZPL3MxN2l3ZGkw?=
 =?utf-8?B?Z0VVczhMc3lVMEJ3ajhDdkt6YzB6akdNRWVYM0pPeTBHdzJjSlk4NWh1djRq?=
 =?utf-8?B?eHlVTCtVaVFGQ0lvTGtWZlY4RjhwekFrRENEbGV6Zm9xMFM4bk5JQmFsTDEy?=
 =?utf-8?B?ZFhFL0JZejh2akp6QllaRkFFRmZWK1NaeEdzRWl4YVdwbXIza3VWRnJpSVp2?=
 =?utf-8?B?dGdKQzJYdS9pby9McDVzR2pnc2lTNVpURjlEWnRoK3JSdG02NWo2U0s3UVFr?=
 =?utf-8?B?UUw2YWtDdkFSWXJaemc3QlZMWWZ4azRNZlFwdHltamRFd0drM3lUTlFuMWZs?=
 =?utf-8?B?aG5zditFOW5XWDZPYm5TWU1qSUp1UTk5SDIvci9VSlB2N3dmTm9DSGQ5VStW?=
 =?utf-8?B?ZXVNMHhCMU5YR0MwcHMwT2xTS0c3ZlZmRjZLVkhBZnhRM0FtU09xK0tDNkFh?=
 =?utf-8?B?Q0xmd2NucVlrSm1TR0lZMFhvK3lUbE52ZVMvalIwMmtpb1A2TkNUbUZNbnoy?=
 =?utf-8?B?UG51WjNkR01lZEZxUURUUlhCUElqYXFjVUtlWW9FRnNwTUlNdWFiMzV4S2w2?=
 =?utf-8?B?d09RRWZPUm94eTZIalhVdlA0VnlNY2tEU2RONHBqWVJ6UnZnY2QvditGSFdU?=
 =?utf-8?B?WXFJWk1DdEpyUXFHS2QrV1NhOURUK1JBbFJYMHpDemsxeFBpNDNaSHdLQml1?=
 =?utf-8?B?eHJnblJ2TXZMazhSUjV6M0s0dXc4byszeldjZHdzUHJPZkJkVlZaVTh3ZjFi?=
 =?utf-8?B?Ynk5aUdad1ZwRkxHVmRQNUg4c00yZjUzMEJld2VlT3dSa0FHME8ydVYxZTRk?=
 =?utf-8?B?VnJIcXVDcERDNzEvR01ZOVV5dE9pOXVTK2VNYnlkUkdrOU9kNWIybjFoN1A2?=
 =?utf-8?B?aFB0cmorYzZNMkRsWWtyUGt4MnllT3JUdVRKaTlhNVBZcU5DdjhrVW4zeTZy?=
 =?utf-8?B?ZHNmaHRBSHZZeWN6ckg2U1pLVFNka3B2c3ZhZHdTcFlsOXJ4bHlJM3ZCcHFZ?=
 =?utf-8?B?YXZxQ3htbTlyNHJPTjBDQkc4S0Z0aERqOWJCUmc4VnFTLzlacVk4R2tnc290?=
 =?utf-8?B?V29rUWJKWDlWVFlsTmtIT3M0VWc1dC91blVMbnZERXpIUUlDUG4yd2VyZ1RI?=
 =?utf-8?B?b3VmcCttbExSd0xjdjcxZEJTTndqOWNpU29kYTBpOXZMQm9zb1FlYUxQU2pC?=
 =?utf-8?B?UlNqaWx3dWpnak05SHRaRmtWM0p6R1FXdU5adnRkY3ZSNUdKQyt0YytlTVFK?=
 =?utf-8?B?MlZENWhrKzV6ZmJoNTVnM1ZLNHJWeWQzNzdBWTg2eENLOExLQXpWMlFOU084?=
 =?utf-8?B?YVk3NGlZQlpDL1RpNDdWSDBERncrZko0MkxqWS94MWk0ZSszZEN4Y2FmYjZJ?=
 =?utf-8?B?clhwaG92WnJXMFdhRGIzczdjUjBFQmpDaHNMS2ZBVG1rd213Q0JBVDdLSlpB?=
 =?utf-8?B?bERBbUVoRENJYVZQRmtiMTVFQzFtclhzZEZlbUl5SFFVcHA3TlpURXYxZGwv?=
 =?utf-8?B?Qk0rTUdyV3ZQSFRXSmN6Mk1NMlY3amVpTlBqZ0F6UThlUG8vSGJ3K1A4K05B?=
 =?utf-8?B?SGtCUFVOaCtZeENrYktCa2hlbS8zMDdwc3dWcGhkbjl3MVdIRW5qcGV5QWt0?=
 =?utf-8?B?YW9hUVQ1SGFlb2pRVnFJaklUZE54eVlZTmpFZW1CNU95MktMczhWTWk5c0Vs?=
 =?utf-8?B?QTYrWUhmZC9YRkZWWWRITDFBUndyWU9XSDg1ZXN5d1Vkc0xEMTJiZ0E3TDZx?=
 =?utf-8?B?VE5oTXdwUjBnRVY4aytPUGUvNVp2aUFXTDNOdWZtdld2OFk5anl5UU83YUpZ?=
 =?utf-8?B?VGIzSEtWTmcyQi9KQzg2M2FseW1hR0NzL3p0NHV0Y3hKRkNzU2tHbXg3MlN4?=
 =?utf-8?B?bGoyb1FPUG1vM2hadG4vamh5NE5pa1RBd21GUHVWZFg1N29oeVg4VU8rcjRC?=
 =?utf-8?B?bjNwYTNMTVdEVERYNVBVL0xFUkZvb3BRc1RiSUlWMEZzUkFsT2ErTENDS3c3?=
 =?utf-8?B?WDFOeHlVd0RGalMzQmxubnpaVmcxYXlaZ2FwMEtOQkxxY0VaMjRMdURDZUx2?=
 =?utf-8?B?dmdFcXJIZjhjYjlXb09sNlhlU3IzVWpxcnlrd3ZCNW9yMnV6RXZRRi9TS1Rr?=
 =?utf-8?B?MWpra2hOTytYZzZlWWpYUFhwb3NmcUU5MzV1VE1tRkRLRE54K3BsT2FDUHlI?=
 =?utf-8?B?MktpeXYrWTNRM0tzekVCcnlZTE84bis3ejg5M3BabHdmU1VOWjBkZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd4d1fc-602c-4f7c-20fe-08df4958e369
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:57:03.3293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IiUtX1yrurm7xbg3ZVrK0HKveNTptRmH8UwlZCUy+0kxxiIcbE5lcNb1AjkcJ1TPE25IJFtjsGlnEoT1yLcn2VbjSTub94lnm4scArTWeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7896
X-purgate-ID: tlsNG-ef75cf/1795435027-A78D1AE4-BAD96F5F/0/0
X-purgate-type: clean
X-purgate-size: 2329
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 4:35 pm, Ross Lagerwall wrote:
> L1 may allow L2 to write to its APIC TPR. Handle these changes by always
> syncing the APIC TPR to VMCB(0-1) rather than skipping the sync if in
> guest mode. This ensures that subsequent L1 accesses to CR8 see the
> correct value.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/svm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 1043f4a988a8..b691fd2ea6d6 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -944,6 +944,7 @@ static void noreturn cf_check svm_do_resume(void)
>  {
>      struct vcpu *v = current;
>      struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
> +    struct vmcb *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
>      bool debug_state = (v->domain->debugger_attached ||
>                          v->domain->arch.monitor.software_breakpoint_enabled ||
>                          v->domain->arch.monitor.debug_exception_enabled);
> @@ -974,8 +975,8 @@ static void noreturn cf_check svm_do_resume(void)
>          vmcb->cleanbits.raw = 0;
>      }
>  
> -    if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
> -        svm_update_tpr(vmcb, vlapic);
> +    if ( !vlapic_hw_disabled(vlapic) )
> +        svm_update_tpr(n1_vmcb, vlapic);
>  
>      hvm_do_resume(v);
>  
> @@ -2521,6 +2522,7 @@ void asmlinkage svm_vmexit_handler(void)
>      uint64_t exit_reason;
>      struct vcpu *v = current;
>      struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
> +    struct vmcb *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
>      int insn_len;
>      vintr_t intr;
>      bool vcpu_guestmode = false;
> @@ -3075,10 +3077,10 @@ void asmlinkage svm_vmexit_handler(void)
>      }
>  
>    out:
> -    if ( vcpu_guestmode || vlapic_hw_disabled(vlapic) )
> +    if ( vlapic_hw_disabled(vlapic) )
>          return;
>  
> -    svm_update_tpr(vmcb, vlapic);
> +    svm_update_tpr(n1_vmcb, vlapic);
>  }
>  
>  /*

Both of these paths  only exist because we're missing correct state
updates for writing to cr8 or APIC_TPR in the first place.

Please can we fix that problem, rather than making changes we're just
going to need to delete anyway.

~Andrew

