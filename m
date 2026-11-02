Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10C4606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=t2aN2SGB
Received: from list by lists.xenproject.org with outflank-mailman.1468856.1677889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO0n2-0000Cm-Bv; Mon, 02 Nov 2026 22:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468856.1677889; Mon, 02 Nov 2026 22:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO0n2-0000Cf-8k; Mon, 02 Nov 2026 22:46:08 +0000
Received: by outflank-mailman (input) for mailman id 1468856;
 Mon, 02 Nov 2026 22:46:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xO0n0-0000CZ-CU
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 22:46:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO0mz-004gdX-I8
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 23:46:05 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae91239-2eae-0a2a0a5409dd-0a2a4508e6be-48
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 23:46:05 +0100
Received: from [52.101.56.43]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae912ab-f659-0a2a45080019-3465382ba45a-4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 23:46:05 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by EAYPR03MB989253.namprd03.prod.outlook.com (2603:10b6:303:2cd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 22:46:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 22:46:01 +0000
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
 b=gffg5J+HuXEXHheVEnl1xpQuj9S9ToffiaUE9t91CWNuMKNL8Fk1nkX3DYtlRAdJNsS5a2T/ShckdW67sjU0RYId9DrANbIdHoAJlYPnV3h2f0M4ELXvOJE8edP4jCAEmCmWKkJAhs2ChyQeYBbF5LnaKeb7kMyvEt9zkiyddTjxYDkEMO+lvI0Z8P5JYAGaslE6+8wtZhE7jkvywXH/EHaztbGfuw9stPDh//6o1GBjRWL8FBeUtH7Y1PUpYb6ZNeaKzVEY7/yuoGlPtx5GqB8rEF5krwmolIinB2I5+ts+39og18BHsHIV/gQZUr64nI3S6Qoc4CzO1tB5ILERUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FN8xXwNnc3BLrFJPXHhlJ35XHTt1n0VJ678v42WMVlw=;
 b=dr5OqJb9iXGlays3qUxteGabaQonbLErBgY+8eTsCKn5Yq5s9NeR8sn5QGvI0+Mq5VJ+RDhuHd8Mbl6ImkZW1nQ+yf40iiM36PkaxClYORGF6WcLjCGhOAX6b+z3L8Erhwx6Xp1/zSkbUvYp0PpqbmtxXg0zfeRotdwNXuVhVh7gxbggI96hOMaPJJunZb5YM4fQ3+33IBOWjZFePEkdFrJUZs+KG6GHMOjcNoRi6+NOU0UbsK9RpTd/a41oaIk5hr/Ex4McWe73mCRQhxLCx1YUAy4dvkCOBF0L7/ssDSsXh4++eeNrtFKNuqWhfAGRmwrl8f2xAe7HXSr5Kl7zRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN8xXwNnc3BLrFJPXHhlJ35XHTt1n0VJ678v42WMVlw=;
 b=t2aN2SGBfEShY/JAsZ6z1NovF2/tD2fFyKni6GDM5vR4FH5LOhOimFEEv5N3nKb0TiMTLDPd23dTDFOeHXbwx0pKc8lWBk7zYBwMti9XOcThrEhLUT5vACiq39A3abBmJGTuYBCzgXm+sqP+f2Uk6OyYBmOdDs5+60LdjpySSsE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <eea181ea-4310-47f0-be4a-b6d303e00c51@citrix.com>
Date: Mon, 2 Nov 2026 22:45:58 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0170.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|EAYPR03MB989253:EE_
X-MS-Office365-Filtering-Correlation-Id: 604c7a61-ddfb-452a-402c-08df393311d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|56012099006|261021135927099003|5023799004|11063799006|261021121427099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	BnmEAlLDC6GKkXcILdzSGBYke2ss52w5iyO4zeg9ldAXJXip+ifh5TkbHNs+ko5XD7MlBcNU1nQAzad7DabIreUzAelUU9BB7r9A5uuCsAFUYNPmVnedlHaf3QsvkfXrzOpYN6515TXjJM8bCfRpFXeTL51T93vxKexaaJVOrqWbrTB+U/tTdHO2fs0QB9bGJ9hguVAL9Xx42D/Xqxw+Mwuo0MCyMCWE3LqZI57jhPPFBPxM2icCs31Kmf6U/T5rHu6kv9QgtWkog+1UKnkdmmgeJ/A8sz6v3SNDuCM0rolqrPopFCVHyefmbdlXYTGunxmEfXU3YTrdlWFiMXWF/1qJGguTltuxf0h7ovHA2DhWs5rziDEpsKD8bVSffSsfpz8046zkCQFAWf+vZfaGC386rcqpiLbicBBukWDAqstDXDGeZnfUFPJktSEunqLK6C/+dD8cwe/LECppRwgZY8vv6oNjp7Q2lkZXXYBmJ4PIa4bBExn5465NbH8dcAtGUoyUmhznJbR2gD33IYq7qFgXQu/FipvwlsensyMuY5mj3TwD6W/34JDTQAI+6ike4HlbGTjMfCpfqYWLUSv3/JIf9YP7LRrJVijUhYpaTrzxY3N+3T3I3hOGIco+9WhoIY1jeTMwgBS5gObjm0vzr1obVpRLYKksVRqGf1LE7Po=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(56012099006)(261021135927099003)(5023799004)(11063799006)(261021121427099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NCtnb0FycXNScW9EZmM2Z2xXRWE5Q3RVYnV0OTcvTE84eUZKa3A5M2NVSDlW?=
 =?utf-8?B?cCtNTm9KenM3SDhFczNDbXV1MXpxMG1nNlNpTVBYODBxYXhLSjMrekFETjk5?=
 =?utf-8?B?RWdIbE9mcWJBTXRhTWlGb2ZyamNxQjVZYkNmTHZaamdkQzRFd2JEQmp5aElr?=
 =?utf-8?B?Nlc3bzNiUEcxdmVKT3h2cW5tMUY2YkcrUXJjVUhRcUVBMVFLblNiWnpVT1h4?=
 =?utf-8?B?ZHhsQVFaYlQ0ODd6blQ5bnRhclkrSlQ3Rk45cjcrUDRtYUs1amlQNG41TmVV?=
 =?utf-8?B?K2hvZTRoVXpBUlZnMUNib1dKbzAzeW9jVlU5emw1cVBDdkZxZHFoV1NyNHFS?=
 =?utf-8?B?TjBKSjJTelRQc1J5Y0ZIZXROMHpGeFhmbjJEYlBmNTdIQkJ5Y3I3UFdXL0Zs?=
 =?utf-8?B?bjRHUnFIVDRJQUhtdmxxR0kyRmFYL3ZsQk9yc2w3Rk9VSTB6SkRrZjdqTUF4?=
 =?utf-8?B?QWZtQXFaM1J1YndzL2twWDFtRUQ1Tm9wRG5CZDF4TXE1em1KUWEyTTFMOE5O?=
 =?utf-8?B?VjZTNmxJYWtkSVlpeVV4ajNNTE9Xc3p6RHNtVWlNdTNKeG9oVWFZTDZicFAx?=
 =?utf-8?B?TFl1Y2V4cmh6UjJLMVBaVVdhYldTMHVIcnNQQ1JpM0gxUVFaM05QU3prUGs2?=
 =?utf-8?B?VUNmb2xCTHFZS0RVS0hoN0VZRkpFc09ZUytvY3pVV3ZJMWZrODVpbVJiSU92?=
 =?utf-8?B?NGh0S0htU0NNc1p1eUVRc091TnAxWnBkSkpNRWdHbEJnTGo0aXhpQ3FDVXg1?=
 =?utf-8?B?RGdIWG90TEwzR1Z2djJnSHBzRzRCTk9GZzZ2TUxFT1lqNjRGMGZDdG5LOU4z?=
 =?utf-8?B?Nk51UDhNaGg5K29wN2U4aGJPbXJhS0xiOHVRd0hUaFVWT1V6UFlrM0tUSC9K?=
 =?utf-8?B?K2VlU29tVDlEaVpTSFhNM1czdWhSaGxybmhxdHRsQlVDOU1TSy9OdTRBeDQw?=
 =?utf-8?B?c205QUdJS2FMdnRFZVlEQ1ZpS1pVSjdGUE9KaXEvVXkwb2YwY0xkQUlHZ2Vz?=
 =?utf-8?B?eCtlQ2YwRmltK3oxcWV3U0xtbEQxMTc5bVlIeTFWdjlFNVdRNGxpTzlqeUtY?=
 =?utf-8?B?NFBLOG5PRm5mTnZZV3JVNDJuOEI0S3ZoQ2FXZ2RtdnJXdTlPNy8yUFRMTzBa?=
 =?utf-8?B?aVl1TFRaUUFtWTM3TTlha01qWUxzUFRTamU2WFFFK041Vm0yb0hjV1A3anpZ?=
 =?utf-8?B?b3pVM3VoNTYwR2VaWXJkZHI3dVkrYStrYXRDTFpqWVJseDNBa1RGT0kzRktX?=
 =?utf-8?B?ZnFIbjNMUHUzM1Y2REtacEZTNmNTLzFFUnFwYUxTM2F0QWx0ejF1MkZpbjk1?=
 =?utf-8?B?TkRCMkxJd2lSNnM5L3JYQmRKK2g3Snp1WnVmVVJIVCtybFkwMWVnbmttVHhq?=
 =?utf-8?B?WDJVcERmYStvQVJ2N3BjZ1V4ZkF5Z2VKMjlHUlpiNUtydmNTOG8yckYzUlQr?=
 =?utf-8?B?Rk9wNnVWTkhhVjd1K2R2cEV4bzIxQWpscHlRMFNjbkJQSFVlS2FxQ2NBNjQz?=
 =?utf-8?B?NDBrcjZCLzBqa2JJNlljMjVYTkpLdWc0dzc1bUNUa093ZHF3RWNGamlHaEQ0?=
 =?utf-8?B?L3hoSHl0ZFNVbXlxY1oyc0FKcmhneHRSTUIzME1wWGhaL0Z0cHZZczIyQWZv?=
 =?utf-8?B?TThDUzNXazAvUkFKdlpiemFGM0dXMkN4NHhjZUhTa3BacTcyczcwSGJtc0Jy?=
 =?utf-8?B?SlhJK3FmTytuSFlqYXdvdFIySnFaSFdOWFdoYm5ZZ3NueWE4VjlnQkZPaStU?=
 =?utf-8?B?K2UwWGcyQ1RFWitYbWFRYTA1WGIwWlUxZkEvRXVFQ1V1aHFHeXNEYUxJUXVU?=
 =?utf-8?B?QTg0K0dvZm1obGRpUjcxVWJnOHV2NUExVXBBZFhjVVdLaXowZ3lkVG9WYndX?=
 =?utf-8?B?RFpuV2dJRmRPdUxjemFvS3dUc05vNkdYeXc1SGwrQWQ0V0tEKzNXT00yK0tn?=
 =?utf-8?B?VFZGQ3pOVTFHRko3M0xDd1FFZGJlbWxKbE5GbHhaSWJBV0NFQnJlYy9ZVTds?=
 =?utf-8?B?R0ZPMXhZNG5pUkFnWmpONFV3SXYxeTFteWNSd2JtVTl5WkVieXdXdTNpNTFI?=
 =?utf-8?B?c0hZTzR6MVJNcVZBNzh6eHJpUy84YlpkVzFoSHlDSmU4bllpb05Rcko0ZENG?=
 =?utf-8?B?UUNSZ2NXODdTNndEakZEUWJoY092M3BFOENEN3AwMkc1Qi9UdWlCQ2JBK1hD?=
 =?utf-8?B?MUJZNHlQb0lnbXVmdUxuemwyTXdJbVBBMDZzcXJ4VldvRnpGNFdma1F3alVI?=
 =?utf-8?B?Y3Jjb0xBYmFnb2FXdXR6UkIyQ3lDSmNiQnlLK3BHWlFmUXVzTGxjaXpkeEo0?=
 =?utf-8?B?YmRJeVdDd3MvaTR1T0dBNUFHb01DZVZYcTJ0VXhiclVHUTR4UDJJZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604c7a61-ddfb-452a-402c-08df393311d8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 22:46:01.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2T5MT7xx4rLLHWOGiiNEB3yjvp6wembMOPLqnWjAmrDzy6Ut1JV7GsHTfjdxgLO2yWcXfGiWRAIddyEOsfB5pKj4IbvvAxdRCRMDGuLxGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989253
X-purgate-ID: tlsNG-c1860d/1793659565-D5F4787B-8E976612/0/0
X-purgate-type: clean
X-purgate-size: 4957
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 1:46 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index 4b0debfa9a2e..2224f1834741 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -30,12 +30,14 @@
>  static void svm_inject_nmi(struct vcpu *v)
>  {
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> -    u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
> +    vintr_t vintr = vmcb_get_vintr(vmcb);
> +    uint32_t general1_intercepts;
>      intinfo_t event;
>  
> -    if ( vmcb->_vintr.fields.vnmi_enable )
> +    if ( vintr.fields.vnmi_enable )
>      {
> -        vmcb->_vintr.fields.vnmi_pending = true;
> +        vintr.fields.vnmi_pending = true;
> +        vmcb_set_vintr(vmcb, vintr);
>          return;
>      }
>  
> @@ -51,6 +53,7 @@ static void svm_inject_nmi(struct vcpu *v)
>       * SVM does not virtualise the NMI mask, so we emulate it by intercepting
>       * the next IRET and blocking NMI injection until the intercept triggers.
>       */
> +    general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>      vmcb_set_general1_intercepts(
>          vmcb, general1_intercepts | GENERAL1_INTERCEPT_IRET);
>  }

An observation.  The code generation for this is terrible.

ffff82d0402e8640 <svm_inject_nmi>:
ffff82d0402e8640:    48 83 ec 18              sub    $0x18,%rsp
ffff82d0402e8644:    48 8b 87 80 05 00 00     mov    0x580(%rdi),%rax
ffff82d0402e864b:    48 8b 50 60              mov    0x60(%rax),%rdx    // Read vmcb->_vintr
ffff82d0402e864f:    48 89 54 24 08           mov    %rdx,0x8(%rsp)     // Spill once
ffff82d0402e8654:    48 89 14 24              mov    %rdx,(%rsp)        // Spill twice
ffff82d0402e8658:    81 e2 00 00 00 04        and    $0x4000000,%edx    // Test vintr.vnmi_en
ffff82d0402e865e:    75 28                    jne    ffff82d0402e8688 <svm_inject_nmi+0x48>
ffff82d0402e8660:    b9 02 02 00 80           mov    $0x80000202,%ecx
ffff82d0402e8665:    81 48 0c 00 00 10 00     orl    $0x100000,0xc(%rax)
ffff82d0402e866c:    80 a0 c0 00 00 00 fe     andb   $0xfe,0xc0(%rax)
ffff82d0402e8673:    48 89 88 a8 00 00 00     mov    %rcx,0xa8(%rax)
ffff82d0402e867a:    48 83 c4 18              add    $0x18,%rsp
ffff82d0402e867e:    e9 9d a9 f1 ff           jmp    ffff82d040203020 <__x86_return_thunk>
ffff82d0402e8683:    0f 1f 44 00 00           nopl   0x0(%rax,%rax,1)
ffff82d0402e8688:    80 4c 24 01 08           orb    $0x8,0x1(%rsp)     // set vnmi_pending=true, on the stack
ffff82d0402e868d:    48 8b 14 24              mov    (%rsp),%rdx        // unspill
ffff82d0402e8691:    80 a0 c0 00 00 00 f7     andb   $0xf7,0xc0(%rax)   // Clear vmcb->_cleanbits.tpr
ffff82d0402e8698:    48 89 54 24 10           mov    %rdx,0x10(%rsp)    // Re-spill to the other stack copy
ffff82d0402e869d:    48 89 50 60              mov    %rdx,0x60(%rax)    // Write vmcb->_vintr
ffff82d0402e86a1:    48 83 c4 18              add    $0x18,%rsp
ffff82d0402e86a5:    e9 76 a9 f1 ff           jmp    ffff82d040203020 <__x86_return_thunk>


That is, vintr is spilled to the stack twice, with one being a
write-only copy.

Changing the static inline accessors to macros drops two words off the
stack, but there's still one vintr on the stack, and it's the one which
accumulates setting vnmi_pending=true.

The only way I can get the code generation to work nicely is to bypass
the getter/setter entirely.  With only the getter, there's still a dead
word on the stack which doesn't get accessed.  With no vintr local
variable, we get this:

ffff82d0402e8620 <svm_inject_nmi>:
ffff82d0402e8620:    48 8b 87 80 05 00 00     mov    0x580(%rdi),%rax
ffff82d0402e8627:    f6 40 63 04              testb  $0x4,0x63(%rax)
ffff82d0402e862b:    75 23                    jne    ffff82d0402e8650 <svm_inject_nmi+0x30>
ffff82d0402e862d:    ba 02 02 00 80           mov    $0x80000202,%edx
ffff82d0402e8632:    81 48 0c 00 00 10 00     orl    $0x100000,0xc(%rax)
ffff82d0402e8639:    80 a0 c0 00 00 00 fe     andb   $0xfe,0xc0(%rax)
ffff82d0402e8640:    48 89 90 a8 00 00 00     mov    %rdx,0xa8(%rax)
ffff82d0402e8647:    e9 d4 a9 f1 ff           jmp    ffff82d040203020 <__x86_return_thunk>
ffff82d0402e864c:    0f 1f 40 00              nopl   0x0(%rax)
ffff82d0402e8650:    80 48 61 08              orb    $0x8,0x61(%rax)
ffff82d0402e8654:    80 a0 c0 00 00 00 f7     andb   $0xf7,0xc0(%rax)
ffff82d0402e865b:    e9 c0 a9 f1 ff           jmp    ffff82d040203020 <__x86_return_thunk>


which is a far more reasonable attempt by the compiler.

~Andrew

