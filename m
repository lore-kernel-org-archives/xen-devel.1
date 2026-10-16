Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5F9CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:13:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452529.1667369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlUI-00046Z-38; Fri, 16 Oct 2026 17:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452529.1667369; Fri, 16 Oct 2026 17:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlUI-00046S-0V; Fri, 16 Oct 2026 17:12:58 +0000
Received: by outflank-mailman (input) for mailman id 1452529;
 Fri, 16 Oct 2026 17:12:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xHlUG-00046M-SG
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:12:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlUF-009CVE-UJ
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:12:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad25b09-2eae-0a2a0a5409dd-0a2a45078bcc-20
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:12:55 +0200
Received: from [52.101.48.20]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad25b15-b4ea-0a2a45070019-346530149ee3-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:12:55 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8047.namprd03.prod.outlook.com (2603:10b6:208:596::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 17:12:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 17:12:50 +0000
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
 b=AtPyAfUwQM4kRZt1I2+z49Y6CCNqAjBR+Fdvka+XrrdGW3piEvIl7CQ5/rG/YHm+bLoHpLBG75jFZXfl2kBec41SP2fVOSTDKqbXhcP2xSYioPmiLdEbzZ34ZZoYkjYNqmJpwZdix6XS8EwD/UkfL8EzCbnjQC8wcH5xkMyQsU7chIgAO+66zpveM11b3+yy8XUTMkbTjhiQNW1aqajsVNGYriJOyvwcdWfsosxKDV/i+ZVzKydtpvy9QtJP3etSbscZRymO4AH4aLAXnv0+KT2ZEQrRL5MBMow94a2OkREJUgOG1c+hwCQ04+JGSSUclXtZwZ7zKk9ejoqj5oOV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wx3xxakn7miKY98Oiom+g8lfr96kdBrrA0yi3iCTzPY=;
 b=EvIgOgI30DHolmb2+brbiL3Rn30LXKdnynyo32MqFYYaOoZIqM+bfF2q9CK6Ev+3K2sA6/Wd45lTNUZJtn/4SeV1gX6uum6iHZ6OQljIITUyvkjfNXmQtM2CEnHL18o6g8z/EHRilqOuUZhzoxCmqFICb1dleuwJJ4Oi/EzCnw+gf+i6REFtmy3gkKg5Qe188AAsH0LmWv+VNQ6H8U2UpSyqkhvh9isOg8SdRZvMwECPWE34ruvZchk+nQ6Do4W9bHSTe+gYWSrQhCRZUzvfeYf94jvibILznbFDvctne7C76bvshwv2HfLgkKV/omrKI2YV4WU3i8uJfSXyoqwcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wx3xxakn7miKY98Oiom+g8lfr96kdBrrA0yi3iCTzPY=;
 b=gY6uCxi8pNg99awK6SqpLywG+Y1gZ8mr5JWeQISjynWu8RUTaJ7jDBAiBYApIoj+nNfYV2TqKJ7ipeUMaTXcXbE9ldsPk5iKq0LYIfajO/KbosipQU7iDSn0I0zZmaJW6jh3tvNX3R5dXcUCf5X0at2JGW3GYekbZDfFhizr1oE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <78ead290-fbf6-4aa8-b918-1f53abe2dfca@citrix.com>
Date: Fri, 16 Oct 2026 18:12:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v4 1/4] x86: record SSP at non-guest entry points
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6dd91c2-f43a-4c9a-89f3-a42c8b954959@suse.com>
 <26f23087-e864-47de-84b9-0e3dc10dc941@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <26f23087-e864-47de-84b9-0e3dc10dc941@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 700c5bc3-adcd-453e-2661-08df2ba8b4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pPSniK7xc+55F1VjEvwYCSRLTsRU5LwbcXn6VFordkkmNCQDBn6nGGNY1hxfssTe00HzAXElkB2nI0jsWB1hS/n9Faq8ZzOD6eixF/xWtTMNePP9filELrQ/3GLZZDE2ZVhbH12gaiioW8YarfJzzJQz+qYT+K9nZptCfLKMC4wmJgHgAAsc25dcxHqLP3wT61hfEHKB8mj9/HhIfP8g6u030XgRb+DUW3UyFmGeEGKwQ96Lywxn82hUIvq/EWc1adgHu8yY8XiYOby7DkhptdrV16VRCSpIccIinTdsAUOokdq4u98Rj62vjnAms1uQA5z1g+6Z0CeigQv5WdT5s7F2Ui4t2ROCmDPyKdiJIc03+bCiPbqc/6rQc8BEFlu3aPqz3wCRRENm70SFdDAmcSALUW0S95J92qUxm2zZ/R7DohE+NSV/qe4kQdq+mZt+3oV+kvSid9123Kk4vu3HRwNM5CvIXmezYu77mqWRpUaMYj8zm4D+Zw5likgxrLmkZpou7rcjmfTVrNAs3gPIV63OZ5hAeUgBtVMiIOJnyDnQSHgc0sF+XZ0ySUQ867wOoUnm4EDyVsmwX1FZTZO2EW8BfK+A4dPdvXaJfL7y33eDqrJvX5eNHJrOYVHv4xi8gIBDtqWG83i8yGOQBPul7JmpKKRG+qIDhMjbu1Bzaq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KysrbmNaellUQlB4OWpNbFRXWGVBbGVPVkhRZkNIVExRdm16Ylp5b3pGTytW?=
 =?utf-8?B?SWNYblgxN0wrMFNwNko4R0xGV1g0eUxWZERHdXVTLzJHNmJ3YW1PYVFUajVu?=
 =?utf-8?B?NUJjUjROdi93MXRnVHVnZjZ1UThFb2draktmcWJ3MGhlbUlWa0hSdHFJOUUv?=
 =?utf-8?B?cnMzTmhyNDVkM1Q0MmhKMThZcEJ4bm9aRkN5eVEvV2hhMUtGZzhqUTBKMlhL?=
 =?utf-8?B?MWYycmExTENoUWJudnU5Uk54eFB5c2V4WkNnZDU1ZXFjR1hxL1QxMElOdEg2?=
 =?utf-8?B?MUdwWVIyK1hhL0Mvbjd5eTQrQWRxTVJKZmdCUDdIY1VGSkdpbkllSnFTV2lV?=
 =?utf-8?B?QzJlQXFjS1p1ZFJFU210VEI0WUp2N1FLSzlaVi8zRlRiSlNnemFLbVV5ZGhn?=
 =?utf-8?B?R25rajF6T3dCVi96MXdpd01CSkN2T1d6WXVzNUxkOUxJbnFYUTN0NlhtQVVu?=
 =?utf-8?B?Q2lEcC8wYmMzd3NINm9JYWZ4ODdyeGpFRk9yTnlwMFJTeUM5MDFEUmsySHlI?=
 =?utf-8?B?UngrZDFLYmpxeXo1RTNyTURtVnZzdmJZQW9FcmFwVzVjaVRqVy9FL1NtQnZk?=
 =?utf-8?B?MHIreWdPdW9JYTBhcytOWU1ySmlTdWRQYisvdEZZZVBPS2pZYzhDUEtyUzRQ?=
 =?utf-8?B?b2FGdXJrVGxOWXpYYlNwYng2QXZYaWVMWE9vdDNkV1IyVW1kdmwza2dkc0Uv?=
 =?utf-8?B?QzJvcWdQMEtNT1VSWGhlSUNnRjdPbHNrRTczQ2d1QzJZVTk0R1liNGtmSTFp?=
 =?utf-8?B?M3ZMSkR1QU55OUcwaTNQU0I1VEhyYTFpMXFGL0RGa296ckFvNnFoa3FlelhZ?=
 =?utf-8?B?c1VMbk9sa2lVNnoxT012akpMZkVoRTRqaTB5UlVQa0lVeXo3ZmMzcXpSa25w?=
 =?utf-8?B?Szg0a0xnbGFrYlNOSkhkaTZzTGVnSmlGN1l1R29CTTNyN2d2ODhNdDhOTlpn?=
 =?utf-8?B?Qm1PZW54VHJvU0twQ1Z2RnJOS1d0THNLTGtsaTA0MTB3YWhUd2swQWh0WkRP?=
 =?utf-8?B?Z29YaHlUTGRpd243bDhFTjRWMWJwM0JIcnFmMTFWUDlkSSt5eU9IbUlueUxW?=
 =?utf-8?B?a0hhQnlZSTlVNkpiQk0yYVZlWnVpYVI1ZWdKY1BnUHZ1NUdTOHZwRTY1QUM2?=
 =?utf-8?B?emRqMWFPbm93OWs1UU9UL2wxUS9KcTM4RTFveHFBQW1ycFA2aENOR3hmZ09S?=
 =?utf-8?B?OTc4WnY0ZE1OellFSUtEQzZ5dnhLTm5BdzJJdHc2dWdiSUxYRnZ5RnFEUkxV?=
 =?utf-8?B?am8wemFPak41a013c1A2aGZVUGFacFpRemZWdklxTHdBcjFlNGllTitJVEZh?=
 =?utf-8?B?SzVqL0h3RlFRUkZOV1FZUW53aWQ4dzVWRldXb0RueXMveW42R3VFUmNBcTlo?=
 =?utf-8?B?TkNGZmNqcDV4cUEvMUNiOFgrNnQxUzZTRTFTdmN4TzBtQkp0N1c4TEMwMVNN?=
 =?utf-8?B?MHF3a2VqaVdOSjE5dWRaVE9oei95Q1ArNkNlTGc5ZjlWbnZLaTlvZlF0SzNh?=
 =?utf-8?B?cTJOVFJVSFpGS3VxbWR6WmhRdE1QK0h0WFJhOHdjVExOL1ltb1diMUFyNElz?=
 =?utf-8?B?NjBQVGc4dHRvaFh1QUdWOENqRXJUYVVDQzFKdlNubWlMWE04Z3JaeERwMjUx?=
 =?utf-8?B?UEhxNFB6cjlDRXdXRmFaY0FDUjM2YitmaHA2N0VPdmFxR1hKeWhXNHFnK2k1?=
 =?utf-8?B?T1JCTXFLaXlWZFRLa1hGTmpIY3hPMmdNQm1TYldBOGd1NEY0UUxxekVSVmM2?=
 =?utf-8?B?VEF2cVFYci9VZkkya0wxTmcrNlkya2lvKzlzdGl1R0pGQkFYNnhJTXJpbkNJ?=
 =?utf-8?B?MTJiSUdUWXF3T21ESCs0WHExYzRtMFBiTTk2dmVaT1R0dG16Wk8zTGRQTWJG?=
 =?utf-8?B?eklYb25Najk2Q2RqMkZUNjFzV2wyYzl1ZmJncmVKOHQ4V05YTlJ0R2xOZzFW?=
 =?utf-8?B?cS9DeG9nT2lDeDlicXIvNUxLb3M0bks5T0J1Uld1Zk14ekRXTFJFVlNTY0I5?=
 =?utf-8?B?ZW1zZ1o3azZJRGxFZ3dXbVYyNlk5OE1TR3QxSlJOeExYU1JoZW83eTlRZEtZ?=
 =?utf-8?B?bkpkWG9ueDBqcmJkZFhyNHUydWdRNFhZMms2YUQzeDNhTWVWYi9pRU5Gdm1M?=
 =?utf-8?B?ZEFzUmFPTmZCU1JFRUhScFlEOGxiQzArTUJwSmFoSzJCTmZycWJXRmpPNzZr?=
 =?utf-8?B?RVV4VHR3Yldhc1RXdlNEM2o3UWlQbnc5TFkzekpBcytwMjRwYUJ0UzZGbWhv?=
 =?utf-8?B?eFVWWSthSkYzQkhMMzZNanU4dHFXYmd5SW1HanFjQVkwZXBQMWhLWjlmREdw?=
 =?utf-8?B?eWF0OTdjSkF5Y2tHQWJaa3cwek95aWdWUm5nOEQ1dDNMYnY2OTByS3cxUnd0?=
 =?utf-8?Q?QIXrjI9X2rDaRGTc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700c5bc3-adcd-453e-2661-08df2ba8b4f1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 17:12:50.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFARwvdkqJfNhVLJ7z293oxiJC3TR2pl0GVh78q6Mone2GU7WXwpPWCNrfz7+fyTebfEqnhjsSg6gT/tsAnmlcUC0JV1RyF+HFIH5OA/DH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8047
X-purgate-ID: tlsNG-ef75cf/1792170775-342F4AE4-1E2DCB02/0/0
X-purgate-type: clean
X-purgate-size: 2571

On 27/07/2026 11:26 am, Jan Beulich wrote:
> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -220,9 +220,11 @@ static always_inline void stac(void)
>  
>  #ifdef __ASSEMBLER__
>  /*
> - * Push and clear GPRs
> + * Push and clear GPRs.
> + *
> + * Use sites may override ssp to 0. It should never be overridden to 1.
>   */
> -.macro PUSH_AND_CLEAR_GPRS
> +.macro PUSH_AND_CLEAR_GPRS ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
>          push  %rdi
>          xor   %edi, %edi
>          push  %rsi
> @@ -233,6 +235,9 @@ static always_inline void stac(void)
>          xor   %ecx, %ecx
>          push  %rax
>          xor   %eax, %eax
> + .if \ssp
> +        rdsspq %rcx
> + .endif
>          push  %r8
>          xor   %r8d, %r8d
>          push  %r9
> @@ -259,12 +264,18 @@ static always_inline void stac(void)
>          xor   %r14d, %r14d
>          push  %r15
>          xor   %r15d, %r15d
> +#ifdef CONFIG_XEN_SHSTK
> +        push  %rcx
> +#endif
>  .endm

I don't like the ssp= parameter here.  It's invasive at may callsites,
doesn't 0 the value in all Ring3 frames anyway, and the asymmetry makes
the construct fragile.  Furthermore, the manual register scheduling
really isn't necessary on CPUs where it's not a NOP.

I suggest having this:

+#ifdef CONFIG_XEN_SHSTK
+        rdsspq %rcx
+        push  %rcx
+#endif

always filling in the value.  rdsspq is pretty close to free (frankly, I
would be surprised if it wasn't subject to mov elimination in the
pipeline, given how tightly coupled SSP needs to be to RSP for CALL/RET
uops to work).

>  
>  /*
>   * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
>   */
>  .macro POP_GPRS skip_rax=0
> +#ifdef CONFIG_XEN_SHSTK
> +        pop   %rcx
> +#endif
>          pop   %r15
>          pop   %r14
>          pop   %r13
> --- a/xen/arch/x86/include/asm/cpu-user-regs.h
> +++ b/xen/arch/x86/include/asm/cpu-user-regs.h
> @@ -11,6 +11,15 @@
>   */
>  struct cpu_user_regs
>  {
> +#ifdef CONFIG_XEN_SHSTK
> +    /*
> +     * This points _at_ the corresponding shadow stack frame; it is _not_ the
> +     * outer context's SSP.  That, if the outer context has CET-SS enabled,
> +     * is stored in the top slot of the pointed to shadow stack.
> +     */
> +    uint64_t entry_ssp;
> +#endif

This needs to say "only valid for interrupt Ring0" or so.  Even as
written using the ssp= parameter, there will be a non-zero value here on
some Ring3 entries.

~Andrew

