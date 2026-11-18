Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67EB606B3DF
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=xOuCoHHL
Received: from list by lists.xenproject.org with outflank-mailman.1494966.1694199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjRG-00061D-5G; Wed, 18 Nov 2026 17:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494966.1694199; Wed, 18 Nov 2026 17:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjRG-000616-1u; Wed, 18 Nov 2026 17:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1494966;
 Wed, 18 Nov 2026 17:27:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTjRE-000610-QV
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:27:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTjRD-006TFG-RD
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:27:16 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afddfec-e002-0a2a0a5209dd-0a2a45028942-6
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:27:15 +0100
Received: from [52.101.193.7]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afddff2-4900-0a2a45020019-3465c10768d9-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:27:15 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7705.namprd03.prod.outlook.com (2603:10b6:408:28d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 17:26:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 17:26:48 +0000
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
 b=ZmvnFXhn9x1fuEIMxPdF2ES/2W1T4HtWhUzis5zdhHIulsSsjrOzsUfg/RTBJW9Bt4fX7Hr/LzPeh4u8xhgBDwWV4jn+xXrkEAwAof8wu7ZfMnqgooDBfs2TusaG4nVrfgvuFXyjoSGDKOvdQnz46G84vcHkiAEzD+4/dpxRVII+eo0PLmb7U5fgHPAJrT9jLDTp1VvAgpUgsVm0DAXmYuiNVvwwcfeTCFsKnduwQIWs5MMQ2vuopp7+R0iXVNRWvfPxk+Zlf/apHL2v4FDksMeIslNwsK1zHUUMvq/S8gxR1KG1dFWur6ymELojvp9Npg86vARS+zXvC+g/vb343Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlkyC3sXHfsPeqxgt3NVDKuoaE/FlP/3UFHqOA4dgJE=;
 b=jrzSCYxQ9HRgqE7J1KMGKJw3YubiBoKnhCYz/gMQO+o40feWDRyWC45zaB5KPG6N61KpzmvgW/Sb7vb/VrWXaNSBip6SLerXarOGZSr+PFfcNXEncgZL8LWSNk6aGfs9Lg3QKMjNyR9xejkpfRmrx7JcRz//WsBh1xh7vS7d3aUqrWLZx3n1A1XGO4slIxZXWpMfhkcol2knIH6/+Xy3X9b1bq2gv+Utn0rMHSriwQ11W8S69tnukDePlFhdmtRjLWjBqsz9IRPpLJk90lIuDlwxIfcR9ygkT4T4C/f63OywZcqFRwFcypcZY2TTqrMkB6raUBlGS4JqReSOQW3oGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlkyC3sXHfsPeqxgt3NVDKuoaE/FlP/3UFHqOA4dgJE=;
 b=xOuCoHHLS0TDxK2XKY2QBGSu/6tSNfNKbpTi2nD1oqWa3FYM2ZFhnaJWhWA77y2U6wzTm75DyAKjF3aCKTA5NL8F2ouAoh1uO+WeL6mO0JKK+QdE37cPjnqnUx2y/mQxGe6oUftmUXM1ggeULxJk5hfsyuqPaeAusN4xgTK7+ao=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ab0566b6-6bb4-4ec1-ba9f-da69241bc568@citrix.com>
Date: Wed, 18 Nov 2026 17:26:44 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] nestedsvm: Don't set CR2 while injecting
 VMEXIT_EXCEPTION_PF
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20261113172444.720081-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261113172444.720081-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0355.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca6f239-bad6-4d45-4506-08df45991ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|11063799006|10067099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021123027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	/6o0uMRM90rR7OWp/AaG6vMtfS2pQB2+9ZzSsDU5jjvpgUQLLgfYy+smxv4OrHBbFqBu7iSup1EpPOeTYXBCsMEJxPbcNwSwzVvmkQ0AyvNKLfrR2+suEsjQeQd7KdEF9qgaXLHnxIdT6PG/MiPJyZuGYBiBsrIU7rPsdzxpao0WWrNL1Rlc6eTrIdN1HtpVOmzb6owBZehxtITds6lKDRsJJHL9lsX+eKoH7eLkvKj3FDpODhlGwS4xkwFVAJlOC8C9ihAbEavZbn60MYM6yhtmUyggGitYBXVXBGMrp/thUPPH19RfjohWM6PoMLAVjwSerNqMFGlh0k/MrbZXSy9PoFw9y84YUWu4ee/Pw7DthKfrOyWfsG4leVee1Fw7/cs9tPUqsPeTcmfZxef+LtesLPdCXqrz5/6hUNTV3kQlVz6NXPDOIBye7KnELa18qOO8dQVHCcLhgAIRI7Hwux1yAWZ0mIQho6JCfO4+a5GzyrYV6BLcgNwFP2p8jz3QaSWrvPMM4kuACBG41AF6D9eqVDiPwkEB83RfQNM83noCwbUVFqyqVFxEGloJwORTQ5TTP+BteQBzrutbWyb7fKy0Jw9ucUHrJmySjpJojvqnxm1TIEjW7ipSniUWfZ5UvFHaZVoPsQ/Go+cvVxtQDj21ZqgmVpYVbRxH/Rgg0SQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(10067099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFU2YVMxM2hpMGNqYWFVcWQyRFR2QnlCODZteWZ3Z1VUbHBJdWRzdm9Dd3F0?=
 =?utf-8?B?VmVraWdBSWVDNWZHTi82aXZpMTZxMEZrTWQvNXBXaTY2VDRiTzlKcG55SjRv?=
 =?utf-8?B?SzdLa1ZucFRoUG1zSGgvRHFiOFJTMjNPSENRQmk3VXUyemNHajJVSXo0ZUl5?=
 =?utf-8?B?MXJ2MzJVUWQ5LzVBL1loTk1Wc2k3bzRxYUw2YUw3TmpRYi9ld0VEN2pjMTVF?=
 =?utf-8?B?WVp0V3Uxc0RBbkxnUW82Si9EcTVTd0hndlFoVFVMWmh0SG84MGdjck83cmRX?=
 =?utf-8?B?OGUzWUhibFdrWFdKWHlBN0NOTUJuZmJjVEVuUnJDYmFOb1lYcFJodnJ6c3Nz?=
 =?utf-8?B?L3VvWFo5VUJ3REowMGJFMUZaMy9pVjVwM3U4ZWJlQkZFUDFjSHY0dmpFK3BS?=
 =?utf-8?B?TmsrZnc1UU1ZNVVTV0JWRWMxSUE5VkYyZnJlUkVoSmx1MzNoVGdUYndad2ZU?=
 =?utf-8?B?OVRIYTFpQzFtb2p3eXMxYjdWcmRNd1AxNjJ2UElZNzJLVmtUUWZGQVJwclgw?=
 =?utf-8?B?b3dXdzBXV3diRFg3cnRKc2VlaWZhMGRmYVdlOXp1ZTdvdG9DeFc5M05IOHUx?=
 =?utf-8?B?NStLV1JxN215b3dqZDlKWGFxMmpJdXNIS0JQU1pvQldsTTBFRWxvTGZyclZE?=
 =?utf-8?B?blVQY2F6a2tmYmdpSFdjTWl3ZlFVS2FvOWdDdE9YMnlrNWRTOUlPTSt3bVRD?=
 =?utf-8?B?ME9rTnBtQ21idDBCNEhCcWozMDhnT0NkODFzVXlBTmpMRldxNjkxVVk1N2VV?=
 =?utf-8?B?Wm5MaGRmbFFTWEo2ZlFORGRsT1NWb1B1S2tNTHlZS2xCSy92ZXovMFhUbHhy?=
 =?utf-8?B?TUQ1TVBBNmM1NDRRbDJVWno5OThOYjFDWkNOT0NUZXAwV1dxRWRkRlRpU2Er?=
 =?utf-8?B?cnRoT0wwTTEyZ0tsNWwxM3k4b2NzWklWcEtreUk3cTh2RlliN2l6djZXSlZ0?=
 =?utf-8?B?WmRYSWh5QTcya2piOEowTWR1b09lbks3ajlkQmhGVlcvb3hYTCtCTmRVbmh4?=
 =?utf-8?B?ZUxYS3JaQjAyOHVweStEVTd3Y0hvb3M4MEwvSGNlS2JjdHhBQmlIOGl6VVhx?=
 =?utf-8?B?dHVYejM1WWIxSzdpMFdVLy94eUFXMCtNOG1ZY2xJOUU5aWk1cnlDekp2RUk2?=
 =?utf-8?B?SGo5MFEvaktQSml2YVZLMndMbjdBY1h5UjQzaTgyQ1piQ2VhMzBNQnQ4Znly?=
 =?utf-8?B?eVpza0x4UnRLRTRmaUxCS3Y3SGNSYkRad2JuZ1F6Q0pzK1ozOFlUeU1wSEdL?=
 =?utf-8?B?cjA1ZlRkUi85cndVQldGdWwzamo5d0oyYnJwSW9SOFlqQnBFdzZDQWVkT09x?=
 =?utf-8?B?VWlKTEg4REdTSWg5K3kyT3haZ1ZpbE9ZK3ZtR3ZjeGNUcS8rRktCTzh2bjVk?=
 =?utf-8?B?WElFdlJkL3ZKZ0xDTmFkY1I2Wi9NL24zbjZoZ0NZWUhMc1lPbFVDdkF0a3dv?=
 =?utf-8?B?RkFETEVJUHhxKzRWbkl3azA2QzUyQ1UvdC95OGxxcjJxOS9iVlJwWVc3akFV?=
 =?utf-8?B?M29xK1Q4emxzV0x3V3hudkYvSnh6RVB6VHQ0QTNodGllL0JvcmhSeXpuQitI?=
 =?utf-8?B?S2FmdVd1aGRSUi9udncwU0ErRzd2OU0vbnIzWUxXTlFMUUdBY2ZELzBMdm0z?=
 =?utf-8?B?SzN6TURlK0ZkZ0tGSnN3Mnc2R3VxK1p3Y0VybDVSRGszcllmUnFROXZZU1Jo?=
 =?utf-8?B?RGszYmNxL2F4aE0vYklzZlJBem9FdUNBdGlCUHdIOThFTjJDQytDTksvaklM?=
 =?utf-8?B?d1IwTTFLSXRDbHNLZ0dxUDFaUkNOT3k3WnRpWlI4d3dWYlI5MmNSa3RBd05Q?=
 =?utf-8?B?elhncmxnKzB1N2E3N2RuQXl3ekpQTFozVlhkZkErc21nK0tUQTNWci9MZGph?=
 =?utf-8?B?RkFXUEpZVXVMejdIcWF5ZS84RjFUMDE5OUE1ZVVKREUycWVMVFN0T1k4SURR?=
 =?utf-8?B?MzdRakt4RTdwS01yU3VNcit5R0pHUFk2S3NqazFBQkt4UUs0NlNVUEMwTnov?=
 =?utf-8?B?aG1nM3lEczVGM2NaU1FmeHFhSWRJdENiQU1ST0QrUlRYSXhTeVdyeUdyUmFJ?=
 =?utf-8?B?THQ5TVROTjUvQUx0Y1hFVTRBWnFTenZ4dDh5eEw0ZUllY28zL2FxVWdNY21s?=
 =?utf-8?B?aG84N1RySGM4K0pCanhCbEExT1VHUkNpSjN4eWdqdThyQnhkUzBXL1JQUUFi?=
 =?utf-8?B?UVd0Rmt1QUtPaE9uSVpURlVJckdSdTJsaXBLRk5vdXVRTHRZZy90RUw0REpn?=
 =?utf-8?B?UmFpeWRCaDZkc1R6T3lDNnNqeC9VY3paS2RMcTJzdGw3QUlDTTVrRFRIS0FP?=
 =?utf-8?B?UWxMTzEyd1JRd3VBaE5QV1B0QWlCbmZKczlCR0kvUVR1clIrZzNXQ050OU5w?=
 =?utf-8?Q?rq3OdGCj0JuoimGM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca6f239-bad6-4d45-4506-08df45991ffc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:26:48.0625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhosw+F3aWPFUV99oBNIU6fsizlhuJO5315a0q0dmO7bIm/wUJkrDZ5i+Jp6Q3Y+xiYuIMU0l+BqEUyyK4T9FoMqVLQBlNrZuAClI/KwNCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7705
X-purgate-ID: tlsNG-720697/1795022835-F992F6C6-2E2DA0A0/0/0
X-purgate-type: clean
X-purgate-size: 1168
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 5:24 pm, Ross Lagerwall wrote:
> According to the APM, the #PF intercept is tested before CR2 is written
> so don't write CR2 while injecting VMEXIT_EXCEPTION_PF into L1.
> The faulting address is available to L1 in EXITINFO2.
>
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/nestedsvm.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index 81cae929dd05..366178ff54a7 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -741,8 +741,6 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
>                  ns_vmcb->exit_int_info = ns_vmcb->event_inj;
>              break;
>          case VMEXIT_EXCEPTION_PF:
> -            ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;
> -            fallthrough;
>          case VMEXIT_NPF:
>              ns_vmcb->exitinfo2 = svm->ns_vmexit.exitinfo2;
>              fallthrough;

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

