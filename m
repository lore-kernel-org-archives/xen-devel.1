Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ABD606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=jP/wW400
Received: from list by lists.xenproject.org with outflank-mailman.1455268.1668835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6y2-0003V5-Nz; Tue, 20 Oct 2026 10:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455268.1668835; Tue, 20 Oct 2026 10:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6y2-0003Uy-LD; Tue, 20 Oct 2026 10:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1455268;
 Tue, 20 Oct 2026 10:21:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xJ6y1-0003Ua-8v
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 10:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6y0-00HMKJ-EK
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 12:21:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ad7408f-bab6-0a2a0a5309dd-0a2a4506a076-18
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 12:21:12 +0200
Received: from [52.101.46.13]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ad74096-195a-0a2a45060019-34652e0d2322-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 12:21:12 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB5790.namprd03.prod.outlook.com (2603:10b6:a03:2dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 10:21:07 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 10:21:07 +0000
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
 b=Me+Tl8TrKE09Z4WE2ZvU0JRQp4lOiX5aNIjDPpVLr2p2ybvw2fg8RFOcbcJwNV2g5xyR6rBCwijwPSrwB1XgAYeIV/BMmaLjHFxsRJPqFYGrwKN9de2m1R1BCT+ZiE69HUegVzDItX+6D5I7KbZloMxqdkJpvRBhrzFMniyYesZY/iBwOv+o1z9vLm4d7C6Sw1RmfZil1PlcxkUg69GitYp2jQxwX5Wav2NTpZ/Hm4datXADTf61TuaHjME3ApOA3mmyhCsfszo44vsRrssJq7lwLFDoOXAPP1+/RpwIz5pmQxR4cn1Xz97FxiRZAT/zVcPvJmsY/WDK9rL52F+37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYcKJGPZCIg8wULZ9pRY79CuhpvGOhHYrTgiDjblkUk=;
 b=b5SmjiU2BXLGQJB33j0SeD+6mqg4oSI56WKqmdJN2Y+iWdQQD5dRvvgWAdu0HEVitYAjPHl3K6xhb61bVZTLATlxAuYbfjC2kC9wqpfGZPMC7wSdH8MyBpsqKRSpjWv3oFsmPzXFbM0KDXZIa1A/WijO+uk580NqdC927630VJAoC24Ge2PeWvAwuSXBpnpOyfqiEX+TxWF/MTOuBlnvJu0c/KV6/zwfaG5VnyVQbOe5YKwZ6+O5AimaK6uxfPX6N5YHAQ68O789B9tUwDiGHnX5rvzYuTOjgJMN+pPq9xxZFcmrRgZA1yyY1LgfTAUJWE98pMAyB+S8lGIjCV1ZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYcKJGPZCIg8wULZ9pRY79CuhpvGOhHYrTgiDjblkUk=;
 b=jP/wW400+ZZVbsytZxwLG5I0xeiGPH8qAsxAnywYXGR/jI6XwZF63dUw0L/kBr+VIkenR20tBobmGoNY/UzjlNHL8yrjiBdX5OOfoXpJCTiMNvbyPtpW7btEzM2JPcPlyuJbGigwPsA38VJJgL+aAecjl+wzeGY3+sQIvjo9UY0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7757cb6d-78d2-4d73-bfee-f9d5db8f15a1@citrix.com>
Date: Tue, 20 Oct 2026 11:21:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/np2m: flush the np2m on an SVM nested TLB flush
To: Stephen Cheng <stephen.cheng@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20261020093432.105318-1-stephen.cheng@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261020093432.105318-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::22) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 73dbbd47-9304-49f7-5630-08df2e93dac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	j0ZjwZ9bi4kiO6iVWBpqUcrN9N4lbmF27UxGLdgiWEwarYtZ/6cTZeeg8LDFd+pUChWQxQI3ZmVduCaoCYZ2ZqiCvaSsdeFAP7qrrnN1QG4i64bICDtL5dwsyuivDgxT6F8lpXBH2Mo+b1yRbt86Y7JmfQCfRYQjZHod/CAV2VoZ3fuUaHxpTJUyYWKCW56UJqobH7vT5Ltb6X3LIlGcAMZgR4JvTV1D8YhRS484vFPwr5XtyxVrqmPi+i0qa6cCIc+q+Etd1CqkwQS5Nepa9N9rznBpuEiLMVTBtoVaJQ3IuGe4YC2Nf7Y7Ty56H9sEHd8ouVsDK2LoYK5Em4hHyVecflSVGaXZANz64bDCzhgXVcDiCqSHoo2q1+ZZYiEMGrsZFPO/1Znqnc8lYCQY2Bj0UQ7+s82xOPsJRbsg49yE+BjP1H+XC681Vo37rocHeRkGttBOHy1WIbt3iNymNrvMJqFffQTdDSijxEsl3Z8GbKLLzE3cCVOUvJ5/cuzma1IBl6oK6Rv+rpPyANCVK/9m2RfKqxeiHItOrw7IEQZ2OuPCTm16yyeFy+hjhFqX4EbugMYyn0uHTTlYpWsakBjxlSEmuR74qIB9W58Cclgrc9SgGJk/Ei3jaRybM7UE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VS9pT2lmVkFDVHcxZFNoNkE1S3k0b08vaDhWbEg1UDdVVWRQR0VkWVZDeVZi?=
 =?utf-8?B?TmEwbnRTTHFxc28yQnBtTjZXcU00eUhpdkQxZGtXdURLbmV0QUJBdFIrL2hE?=
 =?utf-8?B?cW5BYzlEZGRuSTR5ODkwaXo3TWIrNWZTeDFINUF1OHU1ZXV3Y0VCazBVamZr?=
 =?utf-8?B?Q2l0dThUWVEvaTlCUVN5ZTV4dDFnbGJuODV5ZlZpSmpHWTYyZ1haM29wYjVE?=
 =?utf-8?B?MmtJeSs2eWsrSlFOdGFkY2lIUllWTlRwYmZ4WGFuV2Z4b21BeDh6cTM0OCt6?=
 =?utf-8?B?RGljMlVtTUxobFNmVGVCOFBNWWdMc2NzZ3poQU51aDVpY05qVzQ1ZTFzcXNE?=
 =?utf-8?B?QUJHZG9BUFlRaWhiczVUcGI2b2NVbzZ5Y2oybmZLbXdvVVo4dW5sVUUyd3Rr?=
 =?utf-8?B?UlNtdjBoeXZhb3NqR0ZZSTlzMmhibEFrUFJlWjdnd3gvZi8xd0pXeStzMDJV?=
 =?utf-8?B?Q2dNWnhKTktKdHdDa3dMV005ZmRpZGNtcjBPYVNRbFhqYXdJWjRWWjJOUnlk?=
 =?utf-8?B?UzdWM2FZd3VKdm42N2dMQmlvSC9zS0pMU0N2c1NjcXVtOTZOYVJVd2JEMzFZ?=
 =?utf-8?B?NGhEdzRYYWFIakE2ME5sUTdnSjl5V3Z6ZHZTQUQwL1ZYR2Nza281aUpwc2Q2?=
 =?utf-8?B?Mm9SNXh6ZlNFeEJDSEpRbjk0S0Fab2o4b1Vjc0xQTXZoZWJKWWZ5dGMzNmtM?=
 =?utf-8?B?STI2Z0liaXVQY3d4d2F3aDhUbm0xNTBJZmdKbHEyc0I0ZHhLWmxrNEhSbHBz?=
 =?utf-8?B?aDVjSno5OW9uOFlzS3MxNGtkTldkdXBYUEJ0a1l1Y2lVSzRuTWduRmswekkw?=
 =?utf-8?B?VXJ2U1B5ZytBUm1lRUNuSFZ6eGtlQ20wWEhOM08wcXc4VnhmWUl6Y2E5MmZi?=
 =?utf-8?B?eHlnTXNnZ252RVVWc1k2NkdETVYreE9MWXo2THU5QS80cTZhb25na0s2SHMw?=
 =?utf-8?B?NzlBOHhwSTBvdVhBb0h1Z0R2NktsdWZtSnJIZWVMVXdkWmRkQ0pGbnRFQno0?=
 =?utf-8?B?Yll0d1dSYXVaeWpwd0lHOGFpU1VyLzNaZE5mWk0zaUdzWGwrblkyVGF2K0c3?=
 =?utf-8?B?UTNGcFBCOWdTcHhIb0FaRWtqNkFnV2N4dXYvYzROZUliaUhHM3pkcFd0amlx?=
 =?utf-8?B?ZzIyN1FaNEJIQ2JSZHRUajJ1U1dUNmZJTEgzOG5xWEJ0VnNuTnEwRFNqRkdT?=
 =?utf-8?B?TzhjSE5JK0tkK25NTDZzc2dnWkxjWlpEUFRZNStpYjkxRGtTMHRlS05sVWJw?=
 =?utf-8?B?ZEdnVEVPWVRZMERmYm5uWG53S0d3dlk4c1c4Sm8xelFkNS9DaHlDTXM1N29P?=
 =?utf-8?B?TUwyVlZUcVNJWXVzUkRrUTZoaEJYZ1dZNW8zQlF0ZVBNRy9iT0lLWkFodU0x?=
 =?utf-8?B?WGlQeUZ0SVh3NUN4d2xjbm1FSTE0YzdqTEs4TTZETThDNVVLYk5DOFdTall1?=
 =?utf-8?B?QWU3a2JLblhBdzRQMXhUVmxUblZNQzdUUjU4UmVmYXpJV1pNV2VOa25KYkVp?=
 =?utf-8?B?cTJ0SUhpQ2VXMVJkT0ZCTzVJNU9kWkl5bG1XaGdKNzB6ckVFb1N6RHB1ZEg5?=
 =?utf-8?B?VXJwaVhmamFpdWZVVm5uRDQ1YTliNjd3VEtrYnZRbjcvTzI5WFpIZTkxbGR5?=
 =?utf-8?B?THkzYW5yMlFENWJaR3FZaDNtWGduN0dtbGU4WlRNQ3J3MEpLOGFtdThEOUhQ?=
 =?utf-8?B?OXBaYmtPZSt3OTJlU0xSODZBVWlER0h6WTdzTDRPU0dkckhpdDluN0ZsdG4v?=
 =?utf-8?B?VFRQdHhvb2JTZ0w5eXZYdXJpUWpIT28veEpqQ1FUSEFwa3RPVE5NM2hBNytU?=
 =?utf-8?B?aTFpaXUyN2VuSGxacnpSanAvU2FvYlVqMnJJbC81bjBIL2pQK1dXVFpkdytu?=
 =?utf-8?B?TFJaTjM1ckIvWEZvS0pRS0lNQVg3NlhRbkwzRExiTG5udFpTK3B4c1p3OFVl?=
 =?utf-8?B?KzU4ZjlwNFNqS0J4N2V1RjlGcFdlNEVycWdjOVhkNkpaUU4zbzNYRjFaMXhk?=
 =?utf-8?B?eXJKSXlDQ1dOQXE2Z295WFJ0b3FENHZzUHpXRnJwaWZtYlZVdjVDNEMrL1lk?=
 =?utf-8?B?TXk4Mm9KQkpkQlhpcFB5NGZEWkk5UXRxdVlHblFSVmRkTXZkaDRmNFBHdytS?=
 =?utf-8?B?Q3crZzY4SVZhcFN5ODFhaUNoRWthS0RVbi9UdEo0ajczTEVhUmNHandsdUw0?=
 =?utf-8?B?L05KaDhVSHV5K2FwZ09WUUttWlowZ20yMXdDTHovWDZEQ0hzQkRRdElyWDJk?=
 =?utf-8?B?UWh6LysxQXBWOTcrc2hHUWY3MVRFdUtKTGNUYk1MczFHZGp5TmZUbU45ZjBs?=
 =?utf-8?B?RzVNSm43TFBEdU9peTlxd1ZROTNDRkY2ZGhXdUgxaWRadS9hK2d1MDZZVXoy?=
 =?utf-8?Q?GHm+xwnHQJMW5B6Q=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73dbbd47-9304-49f7-5630-08df2e93dac0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 10:21:07.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnRKzn6nNstGgAhzHERyU0lYYuqdCACuAk0+9x5+0dfdEv6sQi4xQHDny10FWJB2OwcQbCnqFTLsSvWiBnzMBb8TQaZsRalwM4qofTbqD2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5790
X-purgate-ID: tlsNG-16d1c6/1792491672-FE87577B-51A555DC/0/0
X-purgate-type: clean
X-purgate-size: 2604
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 10:34 AM, Stephen Cheng wrote:
> On SVM, L1 flushes what is cached from its nested page tables by setting
> TLB_CONTROL or using a new ASID on VMRUN.  Either sets nv_flushp2m, which
> p2m_get_nestedp2m_locked() handles by only dropping nv_p2m.  Since np2ms
> are shared between vCPUs, the lookup then finds the np2m for the same
> N_CR3 and reuses it as is, so L2 keeps the mappings from before L1 changed
> its NPT.
> 
> Flush that np2m before reusing it, as nested VMX does via
> np2m_flush_base() on INVEPT.
> 
> Fixes: 6df4b481b0c5 ("x86/np2m: implement sharing of np2m between vCPUs")
> Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
> Assisted-by: Claude:claude-opus-5-5
> ---
> Ross Lagerwall has a partial fix for this in the XenServer internal patch
> queue, which was also part of v1 of Chunjie Zhu's "x86/nestedsvm: rework
> nested VMRUN/VMEXIT handling" series (patch 5/5, dropped in v2):
> https://lore.kernel.org/xen-devel/20260924091605.344577-1-chunjie.zhu@citrix.com/
> 
> It flushes nv_p2m, the np2m this vCPU used last, before dropping it:
> 
>           if ( nv->nv_flushp2m && nv->nv_p2m )
>      +    {
>      +        p2m = nv->nv_p2m;
>      +        if ( p2m )
>      +            p2m_flush_table(p2m);
>               nv->nv_p2m = NULL;
>      +    }
> 
> That covers a vCPU re-entering the same N_CR3, but not one entering an
> N_CR3 whose np2m another vCPU filled: on its first VMRUN (nv_p2m is NULL),
> with an ASID new to it, or when switching N_CR3.  This patch flushes the
> np2m for the incoming N_CR3 instead, which covers all of these.

I think this is useful information and should be in the commit message.

> 
> Tested with an XTF test that is not yet upstream: L1 repoints an NPT
> entry, then enters L2 on another vCPU or N_CR3 under a new ASID.  L2 saw
> the old frame before this patch and sees the new one with it.
> 
>   xen/arch/x86/mm/p2m.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index 027b9ae69b..52cadd9b25 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1547,7 +1547,11 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
>           p2m_lock(p2m);
>   
>           if ( p2m->np2m_base == np2m_base )
> +        {
> +            if ( nv->nv_flushp2m )
> +                p2m_flush_table_locked(p2m);
>               goto found;
> +        }
>   
>           p2m_unlock(p2m);
>       }

With the above commit message tweak,

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

