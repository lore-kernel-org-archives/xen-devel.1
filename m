Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F19C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 13:57:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412066.1642559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wK4-0007ap-BA; Tue, 08 Sep 2026 13:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412066.1642559; Tue, 08 Sep 2026 13:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wK4-0007ai-6y; Tue, 08 Sep 2026 13:57:16 +0000
Received: by outflank-mailman (input) for mailman id 1412066;
 Tue, 08 Sep 2026 13:57:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x3wK2-0007aJ-Ae
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 13:57:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3wK1-004j65-2i
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:57:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa01429-bab6-0a2a0a5309dd-0a2a4506d750-36
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:57:12 +0200
Received: from [52.101.61.4]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa01437-195a-0a2a45060019-34653d04ab6b-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:57:12 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7980.namprd03.prod.outlook.com (2603:10b6:610:249::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 13:57:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 13:57:08 +0000
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
 b=EPDTlBNd6SFlSubrN/OFn1/9sqpVRCzbU3hPnQBt1duxrpXxj3ZmPN0m5evosqjCaAcSjmHFzLfvkfoxv+OwhBb7UbBubgp5NShlIg+5/etzACLfxqTEN4zAHH/5xq6WtFZlAk/87HVuOSKBn5kroWxsxI91Py6IVk+GNvLUPjjLaNrj9F5G04/j+xlLn9P+2FaTt+eeCJVT+oEuRWLl/fm5sslD74RBt4+CnjA7FnEn0YJqd4zYPgLMZ8U+miKqyemlNxlylYmePkxN2hTYU/B1I8n0BmWxVINn6K0MPtuOSJr7IxhfqKcTugFdVIYm+9no/TbR/HI7yp11muWwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyY/cLIvGbmFJPpTHDCnZ6kLwWjrCl/J+pPigG+JXCI=;
 b=HXu48m4Sy4F/Yj9Vx9NUGAEvnc8txhWEQnmA4xpYP9O5rDOAIeJUXlRlVPe8uI5JZu6EvfKUMo4FZa1KW0rjPYDyXDBbO2YPfe2ulk3JMotFirDxLQf8no61d0fvmemLAeCSbC5ai1bZyBb1tgnxVB0Uh6PUE51GEcZA3BfohLz3zkNq2RMZuT3699hZRFK3MCfRDeNOKCZmIPi9mbVgVhQuPTQsClWIbGreOcjQ4MW40zEfD+rgqYll4+t9DjMf1Wy8uzBKy/scfQlcCVJciysEM+qjIbE0jn7TCR20tlm0T81RAK5YVaUqIKbv+fOnrBLrzhce5CGjtr8eFnYU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyY/cLIvGbmFJPpTHDCnZ6kLwWjrCl/J+pPigG+JXCI=;
 b=wnFZMc8utVp6t8+Akqrr9Gi9gaHm7movv6iign5ILgDx+VI5Ari6pga45iV01yo/g576e/CVd5A6HY8GrZzvreX0NF333t9gmXqoNnVDB3hgABS0tothh5kutzpQbtZz1XIGLpahlj+TitcXjOvw7TT9soSt7yRSo/JVE4+d+Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ef71d534-1bd2-4837-90d4-adf1822fc4ba@citrix.com>
Date: Tue, 8 Sep 2026 14:57:05 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/svm: Intercept CR0 writes selectively
To: Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20260904122330.306936-1-ross.lagerwall@citrix.com>
 <8fbc99b1-d98b-4f52-b9ea-bd84e8bfa2ca@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8fbc99b1-d98b-4f52-b9ea-bd84e8bfa2ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: a85841f5-51c2-4534-a117-08df0db112b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XwiQc3sKTd0G/2M73CID8lbZfWvASzx8VNVoJC81coswKxkNoMH3FfL4YgYeXGf8mmWXKh7oNRRGtLBLnDVRP+xDyzg4NrD9qz+ZHFaS9VqCqucX1lBup2sJYt98MXgai4h7a3UR71w2k+VjCBtHoSUA7MLAUke2ll0d/A6FvE2C6SmIUbGMGuNsNzzNoYryqFgEznCQMSwld9nLisFN4e+EVeC3db+QKw0asuhYd504K5xloRqSSg0zjJmkoJ6NUDecASsJm4sgyeuZO0DbfWGyndNhXsG807a2B1l/OPcpFfLQl88AnN5XFw1DvOhJ/3qdDMr4EP38SPANH5C6AZrq/wYpi5BQSF6t0tGfYVPITMPosSB5NV0K/KSG3fSdJwBxRTbiTcVO5U7Kr6MzglneRw4yIjr40DaFLPGW3hHuPg9E1Bx6VGKb5M8EDi94IwEmIGk91GLq8vUeutoR+m/IF2e1vIViFmluUSP/mbiEF/3ac+p1kRR2EDuPZmSJ7AX3bjNfFGcKZPTe8qnNkJ12ySHSBwMnyxmU+mhUPACNz8KtPqH7XDCISkp7DdVAp0HHmdQuvp0MGBzgUaWbnhV2r5xrxKTnbLNdjgmuE5aL8UY8Fox8sPwru66zI+a7oAFNhYhJULb4HLKUQ/4saVIDgWYVaggKmWJyb6Aifr0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG85MElQcWFqRmZoWXUzV0FzZy9jcVJ2VlBpdlZVSkhacUR1Tm1NSFBwM2Nx?=
 =?utf-8?B?WVdSY0pDUlhtZmZjdUlSYlBJMGNpbVlFWkZhZFVUYzgwd1lkNEgrUEFON09s?=
 =?utf-8?B?RjZITFBVb05EU0hSYzFCcG1mVVlyUk5DeHBzU2NXUEZudjF4U1FDeUJnOTJm?=
 =?utf-8?B?dFNzaTBtckN0MzNORXNBNitidTFyYzJ2cG1oRFB5dXJYa0ZReEFSeXMvcFNU?=
 =?utf-8?B?UzYzR0NEK2ZIRytsWHpoV1UrZmxjVzM4SGRwMFBhV0xYdlR2N3NZVDg3YTdj?=
 =?utf-8?B?WjJXZG45ZDNkd3pSMHNkcTc5UnozOGVac0RZUFVkengyRmZaMXVFS3ZTRVNZ?=
 =?utf-8?B?T1U3ZnNtd1RXQS96ZVVqM0Z3SXdHUHlmT1U0S2JsM05ZMXJQZzQ1NGRaN3NN?=
 =?utf-8?B?TzJVeWtSSTdYekdRdkVHRjd5bVdpMlBYQmx2S2RYY0Y1c056ekVYYkZJRjdZ?=
 =?utf-8?B?aUd3OGp5ZDVNbmhaWGZnYTIzREZ6RkgzNkNROHVzVjZJaEpHTmZtbE5uL3Bv?=
 =?utf-8?B?UERIcDVTd0MveTU3U0VHMXRjYVB0eXhLWnJncTNNZUhhNmV0cUI1S3MrTUJi?=
 =?utf-8?B?S014c0xJelpKZXBETmg2WWs0N3ljRlh1VjMwT1JzUXlXL0J4QVpSVVNiMnlF?=
 =?utf-8?B?ZFcweWxvcmlhMVZQNWNseHVpUUJBRGszd0QvVnNZMnhISStTeG5wZ0YvM042?=
 =?utf-8?B?eHdnVXRZZ25PU3l1RDFqT1RwNUd3LzhrakxIblVkTHdPMXYyVlh4WmpwNVVM?=
 =?utf-8?B?S0loR2t2K0tvQ1g5ek51TVYvRUdicERuSXFzMEpkeGxYaXZrTno4d2Z1QzNE?=
 =?utf-8?B?Um9OZStjVEljNk1Wd0RZYTlnbWQ2STFXMFM5RUo5bC9yU0F0VVMwRGpGZzMr?=
 =?utf-8?B?TjFWZWlFcG8wYWZ0dFBuUDlqWVI5ODlUZjdObVNTNHdoV3EwMVlpaFI4UGs0?=
 =?utf-8?B?QW5KZGd6ZnBZOGV0aHppemdjTUkwZ0d2c0ZGdHZzK2VVSmFyK3hLeEV1RHZN?=
 =?utf-8?B?MUJhcm9VSWQ3R1ppTy8xVmRMckR5bndxR2p0cDdTblhZaUZCUm5uUkpaN2p4?=
 =?utf-8?B?TkV2Ym5VVlJLYnZaYVAwL3BYaVpUVjdnQnBEcUtRdVh6RGp4bzNHYmlMdWRJ?=
 =?utf-8?B?QXdPdGNhSDQ4elVtRTJXUFU5N2hMNWNML3MwWGhYQUxSSm0zWmtoT0pDZjk0?=
 =?utf-8?B?T25UcFhvbzB6NDc3dkp3QmxNcHVlTU5IcFpMSm1adTlRTTRKNUJ5VkNlRHNU?=
 =?utf-8?B?bG5SdTdHRDZvY0RvcFVveVhuL25QM1lzOTRQVFExNzVSZk1EQnI3clFiV3VG?=
 =?utf-8?B?T3NRaXArQjlkcFVCaXBRdHhSNUIwem5maWd3elc0S0p0SlpWaEE1d2V6bVpQ?=
 =?utf-8?B?SkF4K2RzMHlDVjdXYVNnQmhZaWNEV05LQ0QrbElHMmlWczBTcmE1TE9hZXl1?=
 =?utf-8?B?VXp1ZHdUZlNobTFDei83aHZkMjZVUnlWMS9xREZxZHNrSmtKL0ovUTR3cjAz?=
 =?utf-8?B?bXdVa3dNQXc4TVUzWEVpL3dhb29waUpWM0ZHb0tnZGlYQTBVS1ZoV1BSMlB4?=
 =?utf-8?B?ZzNhSCtUWkJaTUFUMlN6WkF0QnVmaGJrNGtkSlFLUFJzV1lzdlN1V0JrMmdE?=
 =?utf-8?B?VWxXYVRzdXlEbkY0cHBaZmRvZFJTTW03Mkp3RWFHWHF1YXRrblFFRDQyWWl3?=
 =?utf-8?B?d2h4cmhPaXY3cHZHNHFJYkRtalcyOXBvMU1lQ2piYXVYTVk3MWNld3JjY2Zh?=
 =?utf-8?B?QnBUeXdVMWxBS29pMzhteVBNS0dzbVkwWWZNYmN6ZjNlbUhscFdaM3JFeURu?=
 =?utf-8?B?RkxrU2hRektZWGo1QXB5MWdUdFovRGJIRWNqbjQ5U21DWTViaVdSY0NxYjFv?=
 =?utf-8?B?L1dENjRwWlRjdjVucUxnSDViNHNxYmhnSEVaZVYvRmdvSlhvcW9BemFZK3JB?=
 =?utf-8?B?aGZrS29CVVZRNDlOZEh2QStXbWhWYW93Rjg3Q0VrbEk2a2dPdkJiUnpCTXVn?=
 =?utf-8?B?UW9xZHNZdktyT2VWOVphVDhmRDlybVZlT2VQeFFlUGxrTEllU1NSSXdzM3Zv?=
 =?utf-8?B?eFVpODRVSmxkVmFFRXJEd3h6Nmd3Y3o1TUN6YVh4bkd4b0ZDWVpXTEhVeHo1?=
 =?utf-8?B?VlJkN0FvdEw3ZCtrdnludjFrc2xEWnIxN0dLa0dCSEFhMlhpUWNvTENRTi8z?=
 =?utf-8?B?NmtSN1cwQ0ZjRkxYc3Y1bzUvdW11VHFram81bFRTRjBHZ3dhVDBWc2d6OUd6?=
 =?utf-8?B?M2hrVjZid0JpWWlYN3hmcGdCNEtKaVg2K3huQk5RWlVBOGVVWkY0VlBlYVQ3?=
 =?utf-8?B?NHR5NjByb0xUeDZtakhscDRhV085Y2ZqSEVtQUNmTUxVSk5PUEFKQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85841f5-51c2-4534-a117-08df0db112b9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 13:57:08.5364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMh9V03g1bHuBxS4RQERuWmjx2VGnBz6FYd7Ct0DKnSkmt5Z2wlxfEIFxJkX9MXeN39GuPFqDWN8UjZgqaLIqmyZKqJ3FVSRmH2EruOvNYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7980
X-purgate-ID: tlsNG-16d1c6/1788875832-F5E0E77B-F171FC4C/0/0
X-purgate-type: clean
X-purgate-size: 1480

On 08/09/2026 9:44 am, Jan Beulich wrote:
> On 04.09.2026 14:23, Ross Lagerwall wrote:
>> @@ -2517,6 +2518,7 @@ void asmlinkage svm_vmexit_handler(void)
>>      hvm_sanitize_regs_fields(
>>          regs, !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l));
>>  
>> +    v->arch.hvm.guest_cr[0] = vmcb_get_cr0(vmcb);
>>      v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
>>      if ( paging_mode_hap(v->domain) )
>>          v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);
> gitlab-CI says no to this patch [1], and I think it's the change above which
> gets in the way of running guests in shadow mode (as is the case for the two
> qemu-smoke-x86_64-*-pvh tests). svm_update_guest_cr() has
>
>         value = v->arch.hvm.guest_cr[0];
>         if ( paging_mode_shadow(v->domain) )
>             value |= X86_CR0_PG | X86_CR0_WP;
>         vmcb_set_cr0(vmcb, value);
>
> i.e. upon reading back the guest's CR0 value we would wrongly record it
> having PG (and WP) enabled, at which point shadow code would try to use the
> still-zero CR3 as page table base. I think values need merging here, with
> only TS and MP taken from what vmcb_get_cr0() returns.

Yes this is broken for Shadow.

Shadow shouldn't be trying to use CR0_WRITE_SEL.  What's in the VMCB is
unrelated to the guest's choice of value, and reverse engineering it is
fragile.

Use full CR0_WRITE for Shadow guests, and use CR0_WRITE_SEL for HAP only.

~Andrew

