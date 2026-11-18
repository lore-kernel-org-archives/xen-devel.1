Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC5F606A32F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=xvZFcgMD
Received: from list by lists.xenproject.org with outflank-mailman.1494290.1693916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdmR-0001LX-Ge; Wed, 18 Nov 2026 11:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494290.1693916; Wed, 18 Nov 2026 11:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdmR-0001LQ-E1; Wed, 18 Nov 2026 11:24:47 +0000
Received: by outflank-mailman (input) for mailman id 1494290;
 Wed, 18 Nov 2026 11:24:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTdmP-0001LG-IC
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:24:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTdmO-000ydi-Mq
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 12:24:44 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afd8af8-e002-0a2a0a5209dd-0a2a450cb94c-10
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:24:44 +0100
Received: from [52.101.48.20]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afd8afa-f479-0a2a450c0019-346530144ce9-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:24:44 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7806.namprd03.prod.outlook.com (2603:10b6:806:430::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 11:24:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:24:39 +0000
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
 b=ps4+0vDmKxgwr8mF/1c4QAJaozczeb9sYdSp+pRQ0SJKyJH4FilnHDZlSlLIazmcJu4m98wjhu7KmxMpwlEW16yBR6577jRawlO4F8pkxkGAt/IbBjiuRK7PXbjHKouVRHp/SxJlQEj7dTC8FacIo4xgoCe+A2Hik3IQfPLWNQm3+5Rz70psm/WbwdV/ZxFw3jKpspzubVTBVm7PEO9pPA0LhkXraw2Emrxn3WNShyzUdO9VPYoI3qI338WkhVUQPf9QNyOiN7TuYIrnQ18hAKCbAVkvNrxBN3pv0NUuLPYWMW+YNj6X/38PwBtUV3iNYCItcDvGt4kEqKzXC3no6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5b8MhhA4w8JaRbdC+99c4q+f1zq02zXE6BlR9MtDUU=;
 b=emxfLjNwJPpMNRxbz4ixDJBuh6ViTklXuHs3NnbxxAsK4tS1GBmFdEgt0yqpkCpvo7BHUSgo5cnVd4IbjawQfOBsYigwqS4y9wyaFUKZwnRQwPVjahhmbKfCAtWbreS8doRbtWPa1a4AwdK5V206azD39x9lIt66XZkvVZCSKN/IvUoreh7jsYa1YPyJY/+VDGgNwcTmz5fx6ntKUyv6DwLe+kUCWD24v+wPspKLfqMDFtxwtEPuHLCaxy0aBan46hMYXDhL6cT/ifMDowIaRfTDZUFbL3OK9LaWEHWVUSbeJHDjFA3/Ahq4ScsWOBfeiJg9541ww8Y11Yb8sJNNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5b8MhhA4w8JaRbdC+99c4q+f1zq02zXE6BlR9MtDUU=;
 b=xvZFcgMDwab3SWsrf4biCCCScCYwkzZGww4xkCTXqhTGwWtEcAsHNhbZIm89fvKIiX/nCaOcEpXYEQ01JG9uBvKSYT5mICxdwR8izwM0UqWFAdWn5fhP/9JWgRBooroezfEU0X9gv16n6Yxvp53b8kIESWQhtafh7AsXBWntq7Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b9ea824b-17b2-455e-b3a8-c593fb47fb58@citrix.com>
Date: Wed, 18 Nov 2026 11:24:36 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] nestedsvm: Ignore attempts to clear EFER.SVME from L2
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20261113160242.695800-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261113160242.695800-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: adf28687-7021-4170-ba54-08df456688c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|11063799006|56012099006|261022075727099003|261026140227099003|261028144727099003|10067099003|261021123027099003|261102123227099003|261021121427099003|261009223027099003|261026121527099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	VC4uaGYDeCjm+MGuR0yCYsygvDCUsX3YX99t/M77mFYJ3QPPArcQhOOvJX0kYiYRPtIA62e8gC02FJTYXmKhrjCoWktJR4eeNq+aRj5eKdLxF1S+sZ5CXPA15HbGKlNQystiKbslELhEeq0O5DsWmzN9WLqZnFtRgeHHgHJTqylJYVixzQA2kOVlBK5Ck2aWZlLN9vsjmAb5/oszfDPObMAWxy4lxdFmJdBSXM8raPrik9Djhgm5NqxVL6iCnbcexe6E6R3VTysmJlm1KqRFp8JxKyxhwQEjGr4JEtnMT5+yy8IhPLJ6Ot9v73zXg/Uut8V95n4lQ+5SgGo4OhyrrxkmnfhhsB7x09H8X/5lvnJuqmpxpOp9Z4reOVVAdTqQksT8OAYHN663z0i5HZHnLZVIuTEJrP4IxBwM1iT2MEhFTsSyJiNfxbTTWqCCFnqcXmFc6SGXHqfL+2SPsZSXSQ1WjmKYoUchovCEBb1Gp+qOmE2R7WRu+cArkEIA2bSelUcMFLAnzlEB3Kn0W7QVpLGODq+PZHhbu/26DpsAm+L+Tmcwg5/SyVaBWZjvt9bLxsfA+OaTJPdu5XSP0qPzicO5pbRqoNhdh5oHIVgdHsdGd8MQrCXZEVhfhPfvNXyiAw0Na9ZHTKnHqF1gqw6upyZu+84jNbFdz3r/DbckcXU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(261022075727099003)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(261026121527099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzUxT1IwUG8vQkVMcTV1bmFvaDZPVlBTaC9wTmlxL1R3NDUvaVRlTlRncGF1?=
 =?utf-8?B?TGc2Y0pGRXdUMTRpN2RyNTRmMDg2b1JTaHp6eHJLQUpNTW1XRCtscXlJaHp6?=
 =?utf-8?B?dmVHRTNlc3UybnVZMW1CN2lZUHM2SnJ1aEZLR1dsbW9VYTNuTlpESXFkOW0y?=
 =?utf-8?B?NE5wcHFhWEFaM2dhcGxEbzBJNm5kL2h0bndNVnZBWHczb08yWkt6SHBObkph?=
 =?utf-8?B?MW92M0dGaEdLMXNKd29oOUJhVVRHeGRUdXFFanJnd2hhRmkzekNhU3czZ1lI?=
 =?utf-8?B?Vm04TjkrNzNSamhjTzhDNGZhNVVIRmxLS2VKNlJqUmhFQTd3U1h1UGtYUEZn?=
 =?utf-8?B?dXA4RzRYQU5YRUhTZUUxR215b0pqTWZkZ2Y4eEY0OHRPUGp3c0s3dE8wRVVD?=
 =?utf-8?B?SHhFQTBZREZZYkF1Mi9JSHBlVUwrSURvVVExNTB5azBKakRkT3NEb09HN2h6?=
 =?utf-8?B?THhWUzRCdU50U3ZOUzdETTVxKytteit3NFJQL09xUDFzRGlLN0hRRnQyUHVG?=
 =?utf-8?B?djFVWTRKRmNWbFRuaEtVK0pHOFFCd1dNanhSK0ZFVFdsQVd4RUUwRlA5dCs5?=
 =?utf-8?B?eW1IelErSkRJZ1BIeXVEZWp5TTlCRVlRdkg2cXBOU1dTcFBqdlZOY1JSdkxa?=
 =?utf-8?B?NVhyNFRzYVFlOS9NMVpqdUNPSDdZdWNyTC85b1JWdDVrWlROTnRpYW9uK0dU?=
 =?utf-8?B?NTRTeHhUUmdnaWFiV3A5ZTlta3I4MFlJaEtxMWV3aHN3UDRVL1U5Y3o3SmlL?=
 =?utf-8?B?c241aXlpeTZRNjZCY252UHFySVVWaEkwK2o0NGdTM0FjdUw1M0wwQXU2UmYy?=
 =?utf-8?B?U2RxOWFIYkZJQy9leEg1Y1BFeHZycHU3YkpTelM0V3Q1YSs5WnlGMHVNQm53?=
 =?utf-8?B?VkJxM2NJejBieGxhc3J2bi9sSFVQNnFGelZTbGtNcE9EN0UySFpHQXgvVTVk?=
 =?utf-8?B?SkMyME9JQlR4MEJIa3YwOU1Xd3M2YkpLek0yamwrZWZnRVJJYi9SdnpoMnB4?=
 =?utf-8?B?cmc3OW9hRjZUU0lKUkprcW1oYmRTNm5HVW1BR0d2WXU4M2w4aURrUzFlU1ZF?=
 =?utf-8?B?dHY2YVQ1aEgzK3J0bDlTdWZJRjBJbHJUdHI4cEViRkNZdmhRQjAyOTBmZy9B?=
 =?utf-8?B?SldMZ2F6UW1rbmsrdFRzUzZXT0JVN3RMKzZsSFVoZE9pOXp4Zll1NzRlUmNw?=
 =?utf-8?B?bEdVOG1SYlhHc0ROQXYxQ0FkRUJ3aHJYOW5Qb1dKS1pYK3RabkZpRUt5RUEr?=
 =?utf-8?B?L1VDeno1SERQMk93VVR5Tjg3ay9semFLeFRaYW9SVFFSSnNSc1pVTjV2WkNT?=
 =?utf-8?B?bnVDTTRiKzk3VXRzUENIV05xQVMvSjhYZHNyN0pIeEVLajJ0N0lhcmlieGhN?=
 =?utf-8?B?OUM0NklGdHliQThxRzRaS1NMeVI5L1RPWXgrbTA5eVRTSGZuditIdUl1N3pk?=
 =?utf-8?B?bmdjeWdHNnJlek9aVEVkM25MZGZ5c3o4R25Rbk5PNFVoYmFlaDlLZmNJbXZZ?=
 =?utf-8?B?TlcyamJMc3JnL2Jrck9kcnVSOCs2dmVjY09hUXplRHlWMFV4SkR0bTAzWksv?=
 =?utf-8?B?b09jWjRkQjJ5OTBPU3pZeWhXZWFIWWJRR21VejZBRW1Fb1B0QWVBN3JRNm5y?=
 =?utf-8?B?ajhZQXJzek54SU5CalRJOWx0K1M1MVE4ajN0OWplZTVudjd0QXNTQzJUUFUz?=
 =?utf-8?B?cHEySkJtQ2tiQlJ4SUYwa2ZKRE01SGNkYlJpR3B2T1NXcHU0dlFWY1FVLzBU?=
 =?utf-8?B?MUdmZEdJWTBZbzg5azBrM2JOd3J1ZVN4YkxRZGVIOExJRFhYZmpCcUtOTUp6?=
 =?utf-8?B?VVJWbVN4NHpiSStDaGZjVFdCdzBTTWxCSWNyamxtS3NyeUpobEZaT0tCc3Vt?=
 =?utf-8?B?NEt0SG1QenF6NW5sdlRDR2M1Tm9nanhKbkZzMGZxSkFjNW5Zckt6MDZvOGN3?=
 =?utf-8?B?c2VMMkpKdE43U2pBQTY0VXY0WTNRbkxSR21UamttUWJkbmZZNVdobkJuQmQ1?=
 =?utf-8?B?NVRVU2xvV3dwOXByVEZUZGQxTFhQcDdqQVNpWVBsVEFMUFlvc0NZV2hlRUI5?=
 =?utf-8?B?eE05RDhCbHhmS3BSZm5sQkJyUzB5S21Edm41d2NRYVlQaU5Ma1d0bUpSaUZp?=
 =?utf-8?B?dWE4M0VsOWw5UEhHeXNtVmdkWFAzMERpWjRJSS93eUVMbFVJT21sYWU1MkRC?=
 =?utf-8?B?S3pYVnkyWjE2RUhoR2YxdFhYUm5WdVFyeEREeUZaV2l2QmFrUGkyYjVFc2JN?=
 =?utf-8?B?ZUJKdUp4dUc3QlR1b1pJc3RIbFpMTWF2ZWw2YkJOSU5iZmc4N3YzNlRDcVBU?=
 =?utf-8?B?M01sVlJYNHFZUjl3OXpGTUxrQ1FQeDVwQWU5STVxS05JTk1Zd1hqdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf28687-7021-4170-ba54-08df456688c2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:24:39.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3xUrUBzHLfLhxIs9gXogeW8XIarwQY+1Y2cQZT4NfqcuCZMJCEu79AQrTa7NlJ6vShfFk19mJpcRDrsN/lRHSbVqL4a3M/fvGUTl5jJCmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7806
X-purgate-ID: tlsNG-d25034/1795001084-76EDAA5B-C2768709/0/0
X-purgate-type: clean
X-purgate-size: 2459
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 4:02 pm, Ross Lagerwall wrote:
> The APM leaves it undefined what happens when the VMM doesn't intercept
> writes to EFER and EFER.SVME is cleared. The current implementation in
> Xen resets the nested state without doing a VMEXIT which is unexpected
> and may potentially hit a BUG or assertion failure.
>
> Therefore, implement the same behaviour as the APM documents for SEV-ES
> guests; ignore the attempt to clear it.

I agree this is the right course of action.  It's also what KVM does as
well IIRC.

>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>
> Another option here could be to fail VMRUN if L1 does not intercept
> writes to EFER. However, this wouldn't match the behaviour of real
> processors and may cause incomplete toy hypervisors to unexpectedly
> fail.
>
>  xen/arch/x86/hvm/hvm.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 71da15c0a4ed..f4155f523598 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2156,9 +2156,15 @@ int hvm_set_efer(uint64_t value)
>         ((value & EFER_SVME) == 0 ) &&
>         ((value ^ v->arch.hvm.guest_efer) & EFER_SVME) )
>      {
> -        /* Cleared EFER.SVME: Flush all nestedp2m tables */
> -        p2m_flush_nestedp2m(v->domain);
> -        nestedhvm_vcpu_reset(v);
> +        if ( nestedhvm_vcpu_in_guestmode(v) )
> +            /* Ignore attempts to clear EFER.SVME from L2 */
> +            value |= EFER_SVME;
> +        else
> +        {
> +            /* Cleared EFER.SVME: Flush all nestedp2m tables */
> +            p2m_flush_nestedp2m(v->domain);
> +            nestedhvm_vcpu_reset(v);
> +        }
>      }
>  
>      value |= v->arch.hvm.guest_efer & EFER_LMA;

I think this is ok, given the state of the codebase, so Reviewed-by:
Andrew Cooper <andrew.cooper3@citrix.com>

However, this is bad logic.  nestedhvm_vcpu_reset() ultimately sets
GIF=1 and this is almost certainly not what happens in real hardware. 
It also zeroes a lot of state which are by definition 0 in root mode.

It's also nasty having SVM specifics escape into common code, but it's
necessary as we're choosing to ignore in a guest-visible way.  We don't
want to have two areas of code trying to decide what the eventual EFER
should be.

We'll need to fix all of this due course.

~Andrew

