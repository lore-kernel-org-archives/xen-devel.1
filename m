Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E1606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=YbL1HVJB
Received: from list by lists.xenproject.org with outflank-mailman.1500885.1696934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVpaE-0006zm-00; Tue, 24 Nov 2026 12:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500885.1696934; Tue, 24 Nov 2026 12:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVpaD-0006zf-T9; Tue, 24 Nov 2026 12:25:13 +0000
Received: by outflank-mailman (input) for mailman id 1500885;
 Tue, 24 Nov 2026 12:25:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xVpaC-0006zZ-TK
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 12:25:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVpaC-001giH-69
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:25:12 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b058222-e002-0a2a0a5209dd-0a2a450ae15c-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:25:12 +0100
Received: from [52.101.48.57]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b058226-f2d2-0a2a450a0019-34653039164f-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:25:11 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS2PR03MB8370.namprd03.prod.outlook.com (2603:10b6:8:331::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 12:25:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 12:25:07 +0000
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
 b=ohtygA4kifIwJ2OrYsZP3cp/hbv3u5JmeLYs+JefE8o7i6wutpPa+ulCemiaw69CvHz6ob5twD7RB9urukqebkfBX/rP7N8jEYN2p+NvpXui5EvL1ynSka2VGZjHX1QRTo5WqDRfLf3Q4L0A/Iz9cKyQp4md+2/bGp/yDwkwMZe3MiuTzWJSMndy8dewMMTEn0nUMuSW8C5050Z1t6NzKym8XNHiG30Kcp2UDd0a27lGaTuVv8I1kIqok730WmlHDMy7QmdXEXqZxyauU1eXBaE3cBY5XYp0v3gdjiq/EoVwSNEpsCVhc7R6BSqNYwHjfqx2ZW5vhfXDm/53IvCwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmTNTLd2C632q8Kcz3xXqEKhVWBLww9TXCOey2DMHrg=;
 b=VEsuMTYYCvkMAfFrdH6g3hGEgBWHxVkxroM1wUg02KFkFdMHwM27jrvyqEcPociZWeeuqWL2b7xYfZ9GdTkgUYCvSCwiXcqUV7PKoNSmriv8FB8mF9MB08p45OPSPuUiHJLEmTYgIBigXwyUHY6RVRIiRHLTGc9eEwx6JPYci0JTeIeKMlyVZvBRu0hXYAx6wT0Pq+1dWljjamr/NEClBEKZotXb/Y58aC3qqtcs62kLMDRAU4Ja8Y+bqhkqSwOeSHSohrC/Hgv8Nw/nyZtvtzWyI9C2Ptj3HVkmzecaBs736p6Xkiax+af/isiWVEYX8qRulXFo0Ysin2uMRxPtXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmTNTLd2C632q8Kcz3xXqEKhVWBLww9TXCOey2DMHrg=;
 b=YbL1HVJBjq0Tiotp4YluEm/Q+eRWSl1TMyX3dG2NkAn3s0uoKblPRiqtLcGephRJjUQuVEo+gfskfVBjCdN4QEK3onXDk7SmbxvK3Hei9FEabOlyWFsFGtqybir59MV0GAWr0P5mIJ+e6MZQ2OYM/s2qWuKckhQ5A3ikOfCIKwQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <20723970-46d5-4324-b370-8637ed4c0e5e@citrix.com>
Date: Tue, 24 Nov 2026 12:25:04 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/domain: fail vcpu_create() if init_waitqueue_vcpu()
 fails
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20261124120402.2486249-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261124120402.2486249-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0278.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::16) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS2PR03MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 99721fce-c981-4ba2-a884-08df4a25f9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|11063799006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	BeWs7wnQmKySE9So7Qq7WOBQvYgAeiJCgX0mly4K8AyMsUlAE/B9zVOqjdHffH3qhtX2MNGUMBp2o6DwWXaalFvPkbXz9vd5rId4JduvMIyNkRUd/M8VJv/8uWjPO10HfuflGhGXWOglMZP2jF2TcNi/QytdiwQS7/DuPdwyp2TMAYJCOt5WON2OM6jDR7FwB96/qyEf8f3kDa3GhJmVhcP6GXhPL1ugQV9AWhz6Y2oGm3kbgI3FKupBS38KzFKz1UlyhdBhYWpeel/hId2fkB7tWMQ256K97W5p578csTRFn46xD6NSFNJ9KltENADA+F0m31Xx8njUoWJFvSDNaJ5R1Hs+wPGsn0g2AyFoCWwm/8EibT+U61kNLgAJ2o6uw7nhaC3BPpqlsiB7w5aVBi25IW+LOFpk8WSIXyu14T075UEjjTnUY6RHUDWtH5YcHD037xqFGWg0fR16p3f0QObavo9XkNgHKcuAt6ld0cNtEkXp/l/cpWxbR2EwfS/E2JYZVT3SJciWeLI01+GUnOfWo6g9XE+LdU6K4c9g9mEqgOFj8Rp1wxHoKNBRrGmV428WLMwrhoCZpGBThfzq4g/TC3tFZWa3nfrNV+0Ky6gpAbiRGrZhobHgFIm/Ok/03jRLVR+hjbbz5v7wNclAC6VC5m2Ps2i5VbItAcq+YJc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTQxM2NtL1JjdDd5blNNM2FITzkrZFI0MFRXNWw1ek9aUUhhMkhEYUQzTmRW?=
 =?utf-8?B?YkNoRjJuRVZRcWhrVHYzUmprSEFGbURkb05tV2gzdjhKcmg0LzA1K3pDb2Jk?=
 =?utf-8?B?YUNEVUU3enJWaTBIWEUwbFQvWnAvZ1ZuTTRlb0daVXRaV2wwbnl3ZlNPNitF?=
 =?utf-8?B?bzhVWG16WnF4amdxai9CcTJuR0lCOHh1VlRxVkhZeWw0UU8xS3dHSU8zcE1S?=
 =?utf-8?B?TU5DTm5hQkVudnZBK1lKTmlncGFVd2QrTUpiSWVZQnhXdi9xNkFkNzVTeTVI?=
 =?utf-8?B?dVdBY09XMWQ1Q01pT091SEp1eXVScmRnV1JSeUMrVFMvN3JCTlZ5Y1hzY1Fw?=
 =?utf-8?B?Qjd4ZkxMNk5QQzNpRXIxZTRDUTJZejdlQWNHQklSeExsZFNGVjNWNVBlajJw?=
 =?utf-8?B?dWRRcVBHNVJMQklWRURkRW0vYkg1TXF4Zjh4NUdVZWhSS1RWcy9pVWd5dzky?=
 =?utf-8?B?QncxNmw4K0JncVJSVi9QZ3BrRGI4ZkNKc1AvMURxSUpJLzRLSWxzOWNKekZz?=
 =?utf-8?B?T082SzBqT3ZtK2pSVm5HMjdzYjI3b21SaExSTTFxUWMvSGdxdzN2c0RlalVz?=
 =?utf-8?B?VTMxSHZHSlBCRDJid2JWVXV5TUVodXA3Q2MrK1M1TGFveC90Ni9YRjcyWVF2?=
 =?utf-8?B?ZzB3NFV1aktWWWRYVTlVaEN4S0hycERLaGZrdjFiN0N4NldRZ3M5WFMyakdv?=
 =?utf-8?B?QlpMR0JYU3FWWXRHWDQzb2lZWnFQM3NGc09PUEZjRWpIbWZtUlRKWXJCNnlQ?=
 =?utf-8?B?YzJFT2s3bzI4Z3RHVmdoVWkzaUdyOEFGNmdrbUIxQjhuclNKMlpia3hodStx?=
 =?utf-8?B?REovZUNMemx3TVNHYWc5bVExRUJ3NEFwY3RzazhCVTAzR1hhbmcyNmlSWTEv?=
 =?utf-8?B?eWZsd3lSbWdrOHNGRHhZVWtpcXNlaHZzdGpacE5zMFNjNTRiZTA1VGRUUDE0?=
 =?utf-8?B?bllyK1hNZlpQMUs0ek5sZUp4bmY2emtFS0hYcVB6bXpjeC9DLzZaK252TjNY?=
 =?utf-8?B?UUdDelkrd2RUcWJJV2htMGNSTTNpczRqV0FKZyt2ZUVFQkJRd3NXMGVmVDVC?=
 =?utf-8?B?aURoeXZ4aHdBV0pqOThKM1dZOTJOdjZnMXY3NzNEUTdFbmNpUWNObVJJNlF5?=
 =?utf-8?B?UGNpUW1ROTFFSGJOSnd5Njc4d0RRcnlxZjViZktYUE9yMzFPaXl2OVZTZGE2?=
 =?utf-8?B?KzN3a25MSUloQTFrMWRWelBVSDNlYW45MTEzNTIxVWwySkFGRzVoOFNzZFJx?=
 =?utf-8?B?dXV5TUxxRk0rdkZTYjlxOWhtVUk2K1dUZUFRVW5hTnUzc1VreWVpaEFJVVhQ?=
 =?utf-8?B?TzdaWkRYR3doZ0RVWHhCaHFUaUNyak9CSDFXT1dtWnJyT3h3Nkd1QUk1dU55?=
 =?utf-8?B?dWFiQll2cys3VlYya0M1ZndKbUUraWhCeHgxaVBZVlRkcEs2ZWJram1CK3Uz?=
 =?utf-8?B?RlhhaXlTTXRQN2YzOW1nUUdCMG4rcllMcEs0NFAzRWNpTU1KbFc3UzZodWVy?=
 =?utf-8?B?eC9scm9tWWEyMVJ2MmE2dnp6YWhXUi9MeEpSdE5zeElnVm9uc1NFUXdRTVdZ?=
 =?utf-8?B?U3E2VEtxUFNuMjVQeGdGNzJlV1ZPVVdoTlNTWDBHTG9HSi9Demw5WElIeWFv?=
 =?utf-8?B?Y2RwUXhnU3g5NkwxTi82RFZJcGs0NTI4bEY0MXJjbytMSjZLRnB4SGpxVWZM?=
 =?utf-8?B?bjFKTlFWY0hDdEoyZGljMXVEek8zNjR4bmtKZE5XSThTaVhYUWdla1FXdFNL?=
 =?utf-8?B?L3lSMG1tQUpxa3BvL05CMVJKVnBSSi9UVzRVZ0Q5YzNTaU5HYXMzdGlvRmg3?=
 =?utf-8?B?dDNCdUFzUlB4VTJibFB3REY0QWhKL2VpNGd6dTV1T2xhdzhPbUpxUWhTek5C?=
 =?utf-8?B?T3lsQXZla09ra09UQ1BlcVJJdTEyT2hjVHdrQ29iaStlWStuTDllTWl4M0t6?=
 =?utf-8?B?ZGlSb2p5VGR2dHcrK1g5elBHdWYzKzNyY2xpZ1dxemRWSUNYSmExTlVzM0Rl?=
 =?utf-8?B?bkgxcXRDaDdkN3NEQkZLdENwNG5TT1dlU1QyK2ZBOXpBbjJrdW53TUUwYjhq?=
 =?utf-8?B?bEorc2N4dFpRRGxOajg0TmsyQ3dUcXpJUjNMRHRHVWIrOU5FK3p2aTNWN3Zs?=
 =?utf-8?B?Rk1IKzRIVTNqd0ViL2U2SGVIZ0RhMlRYTGxDTzFQc0pzRlk2dHNlSFRySjJQ?=
 =?utf-8?B?U0Z2dW5RY1JHblc0UG5nRWxEV2ZOV0Q3cW9iVlJFeW8zZTZoYzdPc1hkOUtC?=
 =?utf-8?B?TG1pQ1lqbk93WjlGdi9mK1RnWmZ2ckY4QlZSQ3Zyd28xb05jY1BjNWVHN25O?=
 =?utf-8?B?S01XUnF1QnRWSnY1ZlhTTENmdzdtTzJNS0hyUG0yWEw5WGV1R210UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99721fce-c981-4ba2-a884-08df4a25f9b8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 12:25:07.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vliwcszg2zWxNy6b603TZ7uzLO0VOHlP/FqidnR98ilNS8hLfWO14VqV+42GwmYNdptdBMORk/SertGzW5IjK8/5QD9Qba020+P86gPwFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8370
X-purgate-ID: tlsNG-4011c0/1795523111-514C7CFC-D32C9512/0/0
X-purgate-type: clean
X-purgate-size: 1246
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 12:04 pm, Juergen Gross wrote:
> init_waitqueue_vcpu() can fail in case of memory shortage. Don't let
> vcpu_create() succeed in this case.
>
> As destroy_waitqueue_vcpu() is tolerating a NULL waitqueue_vcpu, just
> reuse the existing fail_wq label.
>
> Fixes: 9b231b6bc20b ("Wait queues, allowing conditional sleep in hypervisor context.")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/common/domain.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index f3a2634d5f..060f0e7a9d 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -496,7 +496,8 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>          v->runstate.state_entry_time = NOW();
>          set_bit(_VPF_down, &v->pause_flags);
>          vcpu_info_reset(v);
> -        init_waitqueue_vcpu(v);
> +        if ( init_waitqueue_vcpu(v) != 0 )
> +            goto fail_wq;
>  
>          if ( vmtrace_alloc_buffer(v) != 0 )
>              goto fail_wq;

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

The waitqueue infrastructure is on the verge of getting purged, but this
clearly wants backporting.

~Andrew

