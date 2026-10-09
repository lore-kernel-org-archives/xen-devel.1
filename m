Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8135BCA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 15:38:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444512.1661346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFCgF-0000MS-Q7; Fri, 09 Oct 2026 15:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444512.1661346; Fri, 09 Oct 2026 15:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFCgF-0000MK-MJ; Fri, 09 Oct 2026 15:38:43 +0000
Received: by outflank-mailman (input) for mailman id 1444512;
 Fri, 09 Oct 2026 15:38:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xFCgE-0000L9-2z
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 15:38:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFCgD-0036Rf-1o
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 17:38:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac90a6d-2eae-0a2a0a5409dd-0a2a45029ea6-20
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:38:40 +0200
Received: from [52.101.52.44]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac90a7f-6ca4-0a2a45020019-3465342c644e-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:38:40 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6675.namprd03.prod.outlook.com (2603:10b6:a03:38d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 15:38:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 15:38:37 +0000
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
 b=ZNU4QY5OGJLN6b3GjGBS+0kjBSh6TEZ6QTj7DK3THx6ihGeuDrQcQXJRSejpfp6tNXJ3EFrrEbUyjrXF8R2TMw7A3fJIgsURktDOx1+yeMWwGLCfSNm+BYW1CNOWeMsjv4Cy/dwdnyQfui+vEtWNUmVS02iCLtbD4Mk+sq1t7HIt8h+j0GA0nirStpIyAysIt5yuV7ElH9glxuMeyrEvHz6fRYZtvmbYV62rhoTNPvypgcScSODKhZObjI2SQYndXXnSyDHuwRad7mcMM4RhQsgyJ8SkfcT8eQPZDtynYW0DiOfP1quq37J26zYp6Diu82Jl+c6/fTlFr2Gn4jy+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrIISEZ9fctREw6Ti1nPFUzin+e3reGV70y+Qxa/Yyc=;
 b=d4PYGUR2n8EShyL5nCqQxULXpWNgfodLCVnuI6pmtd4ohgzdJIN2QvUFzv1njtJ/PpEVTrSvoZyITtt+sN3ksHeUbwIjm87VGuxMIY9PLdkOF/qM3fqXwtUk8w6g+ljf8+IcNUuuTlO3bGU+qYoKtkK3ROgOjTonGYYobhzYqGuKtxN2m2NRjZgTzH/Kw8NtFcnkW6KRXmfuxmRD8z748uEX6TVigG29QdW0/hByY0UgzzdPKOL/IEm1HRNf408yca0YcIgFQ6Ddgx32ItZttXyPoHeeB7H5BSssfa5xlVkeuS85SwK3wOl3cEvVWyuDQtWWIw0cYTuhVjhvw2K9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrIISEZ9fctREw6Ti1nPFUzin+e3reGV70y+Qxa/Yyc=;
 b=WLIRgRW5SHC7z9vNiKv7CNuM8KDHIDktW/vHZ8FlnLrAHbS0ZmicjvXjzBC922PrnS/ftRzrSKzMwLzVDuOVmxcwY5R2HynyppfBfVQf6d49Ci/dYNRCeQmRxyeMNl6fyuX9r/W8fPZdweLclTcjNQXdo6lXOHqlhsJhLOPopCE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4f9aabc1-2317-4587-a505-11057d4aef0c@citrix.com>
Date: Fri, 9 Oct 2026 16:38:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 teddy.astie@vates.tech
Subject: Re: [PATCH v3 2/6] x86: extend update_intpte() to support atomic
 get-and-update
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-3-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261001174749.2275245-3-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: 1704bbc2-c5bd-4e4a-bc91-08df261b62b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|4143699003|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y38vcPtaw5hSlohXMBmP9NbHarYfHc4paepujs6HhqN88aPtUoiYKAO5Lkutfl52i8zbwljRkd5D3cxXFoQ0HNaYtTfmqCEOdiH9HC8+wYE/QdYiegHPSmacbtQyVOxyNR2oOc+N3jDZ7NLblOX6s6HiI00hid2R2DWAMcI159nNQSuvC2wDLg8lkO6wYv+9jVT2Dxf08A6HvYasWWehkAPNTifNCk6GS2PzSUjNJVxVIx3NE6+NMu6ygBGUxwDK9i2k6blpuOqsvmKirOJ9WlfQ6fwApi1aPAml0qoLwr5N0r6GzjPoKyLCY3ZmYvA9zM2W5drBQi3neIaWMX3uQ8vk6Hg0byIz7BEWj6ZOR+VYoJfaR23hFW/f9WhaN99DMB5D0bOMZ2po+GXRlegK+j2hb5lPNgeu91tnS1CGrnRWJKK6Mpa9Yd+m5Z16RBFso0AjbRzePj7s4nvjWVs83Bwqiu6d5/dRLp5tCRmvmXo9IOKHl2v83VKvnDzmQkJGN0yuftaergLNDeRQqyhGxqUGYFQqiXLFQ46DQCt1itbrDrXPNPXi9AofktdmDvKBqZh9ycEyPRGIVIuYnjdxa05rMQrp/oLaNcfaOvaNUTXd3PLukeOWE+8N7zrsCO46qn3KczuCPlGP//F2v1jhCBJJnr3T26S4C2UARuHvc0k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkNYay80eDNNOW1kdkJhTWRVSDByNXpSQVRKZkdQUHZ5R2VtK1dvMXp4Qjl1?=
 =?utf-8?B?YU1kUGdTVkR1dHlia3VmdkREQ3U3di9PVkhvNWRaNkJ5YXNObldqQytRVlRG?=
 =?utf-8?B?VnVSdnpmOFluZytldXVDQzdMb2RTL1hTd2FwZ2dneUl2SUI2MjVyRWdiUU5k?=
 =?utf-8?B?dFNEWEVKS3BsSE1ZbkJ3amFHeWdLcktiSW4xenFXOUIySlVzc3RId2Q1Ykdv?=
 =?utf-8?B?RWF4RjM1eUZFZFc5cnB3bjI1MkZHdFhQSWk0WUF2NlVvc2dKWFF1bVpNR21o?=
 =?utf-8?B?T0VnVHFEUEJ3YUJYVkZ6eDFQTWYxR3NuajE4Nlp6cHJnVFhvRENqb3ZZK3pD?=
 =?utf-8?B?enRvclFMZTdwdHlGK0JnRkZSc0tRaEFaLzBTcnZQb1cwQis4T0ZoUWxCZ1pq?=
 =?utf-8?B?VnhjRWtJbmhram5JbGVjS0djUWFtVWU5c3loSkI4aUkvb3JBOHR6MFplcG4y?=
 =?utf-8?B?b1NDYTl2cHpIdlNCZFJUTXJyVHI4VFBEV2lnVWkxemtyYmF3QkUwK3pKd2ow?=
 =?utf-8?B?Nncrb2hFR21jd1RXd1dPa2trVnhJcEpjQ2g4b1hVU2ZYNGphaEY5aWZNYmkz?=
 =?utf-8?B?WFVBRmI3WTkvaEhETldZN2pBanVtMDFYQnAxNStiSk80S0tFb3pHUy9kTWtI?=
 =?utf-8?B?VWtGQWF0SkhFdGNnTXlkc093QXFFVVdVRVUvL3h0Wi9FRFIrTmkzdkZaRGxB?=
 =?utf-8?B?QUpmQkZtRTBmOUs5NFJxaEJ4M0VoaGsvbzdlK1BKM082ZldiZHFJR0FZK0pI?=
 =?utf-8?B?SzlRK3VHb0FqK2RYQkRkWThtWUdLazlNYzduNDQ0TFNqYXFITGNJK3R3Z05S?=
 =?utf-8?B?UDNwNUc2RXE2Yytzc3AxWjIrZWF6SEVERU1IeWxNRUQzSXBvWVErZ1BKM3Vx?=
 =?utf-8?B?bHhiZWRKT09PMkRTZjJMSklRQ2FlNTRwL1RCQzdveUtHazlYZ1ZpL09ncS9D?=
 =?utf-8?B?ZmdkUWlWMXZHcWY1WWswR1FyeFFHN0JxdCtnS1kyd2NsaWRaVlZkYjNDc0pj?=
 =?utf-8?B?RWRWcEZOSVh2Ri8ray8vZ1k2QThkYkxieWpjTlJtb3pwaWUrdTBqWkJhQzJp?=
 =?utf-8?B?VWNRMUt6NzlhcmtBdm16bStqcWN0TFViNFFYUWJ3Q3doTGN4MGp3YkI1YlRZ?=
 =?utf-8?B?Yy9aMWRaZUMvU1NIQUwvUlUzci9pOUt2MDNjZ0NoOXJYdW1KWnQ3UnJPWmRs?=
 =?utf-8?B?TjVYejZXNXgzaUtMR2JLTDNVeDVhTWdaL3NPVThsLy83cHZ1aTcvM3JGODRB?=
 =?utf-8?B?NEdFL2lML0FkcXMreWpSRXhzaTRDSTRwcko3N3N4Q0cxb2xqSXpDN0VxVWlh?=
 =?utf-8?B?TzlOcWhGeURYL01ZSE56Q1Y2RWNsQ01kaWgvRVF1c2dNUFdFQnpWdTB0eW5o?=
 =?utf-8?B?SCtHNlVpWEJWSjBHY016d1FYN2UwcTk0WHI0enlEd3JkUjY5U3dmUGdrTDhq?=
 =?utf-8?B?ZDB3MVcrd2oweFY5SGNTRFI4TkE2RXlnM3pXZVRZYW1oZWF5enZuZ2E5bE5S?=
 =?utf-8?B?b2dYanc4NUxkMU8zOXFOOVhWWUg1K25RK3h0SjZ0MzV1TEFzUkQ0VjRBUjJB?=
 =?utf-8?B?b1hJZFEyOWZYOVdzcWxoSGhYWFJ2ZENNUDRYV3V1U0dCZzRIa2dKbEhaUmw1?=
 =?utf-8?B?ZW1wTGV4WUMrc0JLNDFHczc1c0xFRzBuYlJ4VVRhSjJ0ZlRlUlpWWkVncmdy?=
 =?utf-8?B?d1AwQk95TmVEWEdJejZOb3JPMVZnUFVobnVCTFZuaDF0SVg0Sk10dmVGUzdM?=
 =?utf-8?B?RHp2OUE3bzBxNFlESHBQRk90ZU0xanF2RW55SW83cy9PTkZPQVZXRHhuT3ZJ?=
 =?utf-8?B?MDFJQS83eEVsdG5RWS9sMTlMOXBzN1Q5QUJmWGFUUE1xbWNCVDhHYnZLYTlt?=
 =?utf-8?B?SjJUM0ZzN2ROTmIxN25GK0xmWmF0YmgxZEJnRHBDcmpwUm5xemZZRE9VdkM1?=
 =?utf-8?B?TXVoNDE3QytNVTc4OWNHUmF2N2NvWm1jZVp2N0tSSCt5bTAvNlAwZStPSnFE?=
 =?utf-8?B?aEE1bEdqdWtQMlE5RmFabUNzOWRzSXhDQ0NjYzdNRnhUbFlMVGhqR2tEbTMr?=
 =?utf-8?B?SXZaVjNKbHFtT1pXSWRuemlLYzVmWitvNlBhQWljRjYrTEFGeCtnT3BKdVpj?=
 =?utf-8?B?UUhMeHJIaHlkYVFjTlA3c21tblY4ZXpFdkV4OTd1QjRXdFQwMUFZTE1BZUpt?=
 =?utf-8?B?YnpkU3pnVHVMKzVnZEFjdkRkNUVhd2JBR1BWcGNqeW50OVgwcUF6SWZTV0ND?=
 =?utf-8?B?bWVWQzVJZnhVZC92NEc0WWx1WnZYUmF2UmZVd0k0bENmVk1BSXZlaHlEamtC?=
 =?utf-8?B?RkdvOXBWb090eThva2FkT0U5M2p6NURMbUJJM3JOVVZEM1VzVm1Pdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1704bbc2-c5bd-4e4a-bc91-08df261b62b5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 15:38:37.2627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dko8uzLZ6cPOzCQmRZZDo3iWc+K6RaUnY6cVAUL5VhkksdnBHB87iYSXjpLmpqKuJaiKXRW80uR9WPEhJuRknYEahZ8Jb0vZDGncHAZhkvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6675
X-purgate-ID: tlsNG-720697/1791560320-309C32AC-242D0B60/0/0
X-purgate-type: clean
X-purgate-size: 2960

On 01/10/2026 6:47 pm, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
> index bfee0feb7b21..363db35b5fe3 100644
> --- a/xen/arch/x86/pv/mm.h
> +++ b/xen/arch/x86/pv/mm.h
> @@ -64,16 +64,23 @@ static inline intpte_t paging_cmpxchg_guest_entry(
>  
>  #define PTE_UPDATE_PRESERVE_AD  (1u << 0)
>  #define PTE_UPDATE_NO_TRANSLATE (1u << 1)
> +#define PTE_UPDATE_SWAP         (1u << 2)
>  
>  /*
>   * How to write an entry to the guest pagetables.
> + * If the SWAP flag is set then does an atomic swap and returns the old PTE
> + * value, otherwise returns 0.
>   */
> -static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
> -                                 mfn_t mfn, struct vcpu *v, unsigned int flags)
> +static inline intpte_t update_intpte(intpte_t *p, intpte_t old, intpte_t new,
> +                                     mfn_t mfn, struct vcpu *v,
> +                                     unsigned int flags)
>  {
>  #ifndef PTE_UPDATE_WITH_CMPXCHG
> -    if ( !(flags & PTE_UPDATE_PRESERVE_AD) )
> +    if ( !(flags & (PTE_UPDATE_PRESERVE_AD | PTE_UPDATE_SWAP)) )
> +    {
>          paging_write_guest_entry(v, p, new, mfn);
> +        return 0;
> +    }
>      else

Not for this patch, but a little bit of follow-on work could make this a
lot nicer.

We really want to be using XCHG rather than CMPXCHG for SWAP, and indeed
doing actually allow the optimiser room to remove the loop.

However, this would require introducing paging_xchg_guest_entry().  In
the shadow code, falling back to CMPXCHG is probably fine, and at least
that allows the non-shadow case to avoid the loop.

>  #endif
>      {
> @@ -95,17 +102,26 @@ static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
>              old = t;
>          }
>      }
> +    return old;
>  }
>  
>  /*
>   * Macro that wraps the appropriate type-changes around update_intpte().
>   * Arguments are: type, ptr, old, new, mfn, vcpu
>   */
> -#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                   \
> -    update_intpte(&_t ## e_get_intpte(*(_p)),                       \
> -                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
> +#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                 \
> +    update_intpte(&_t ## e_get_intpte(*(_p)),                     \
> +                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n), \
>                    _m, _v, fl)
>  
> +/*
> + * Macro that wraps UPDATE_ENTRY.
> + * This version converts the return type to l{1,2,3,4}_pgentry_t
> + * The return value must be used because of compiler flags.
> + */
> +#define UPDATE_ENTRY_SWAP(_t ,_p ,_o ,_n ,_m ,_v , fl)            \
> +    _t ## e_from_intpte(UPDATE_ENTRY(_t, _p, _o, _n, _m, _v, fl))
> +

I'm not sure we want this wrapper.  But see the next patch for the
discussion in the context of the caller.

~Andrew

