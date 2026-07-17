Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1D1C4451C
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 15:05:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365044.1615809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkk7O-00072T-Kk; Fri, 17 Jul 2026 15:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365044.1615809; Fri, 17 Jul 2026 15:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkk7O-00072M-IB; Fri, 17 Jul 2026 15:04:50 +0000
Received: by outflank-mailman (input) for mailman id 1365044;
 Fri, 17 Jul 2026 15:04:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wkk7M-00072G-Q7
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 15:04:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkk7L-000mDX-Vw
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 17:04:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5a447a-2eae-0a2a0a5409dd-0a2a4509c118-26
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 17:04:47 +0200
Received: from [40.93.194.49]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5a448c-be1a-0a2a45090019-285dc231838f-4
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 17:04:47 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DS7PR03MB5445.namprd03.prod.outlook.com (2603:10b6:5:2d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 15:04:43 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 15:04:43 +0000
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
 b=wKY5ycWTrQ1Uf4w5rqN+Dj9o/P3OWxK+2xBhE+ZFOZsdfu1Bu0RGAXtypUKFillT8PYtfFOW4O9nlSVpKEcqLHwSSYWthNRhmaJuV0fJWOFEztnmjmdmIWaxRv40/ToCvLxSvueZSJ/Go7euBksLG4DTAgsBSu9/BRvSxDn8mWIoZ4nZOCFp0y29KQ75klU2I/LtvgSG1FYc2ngv+Uk2Vj/NTiEHTH5HRkdvaePJeEVET3ib1duiYEJl2ymijBZbkD1DWnVOpclSA0/MlirPS2/aFL5RSop7X/Pkznzl9ExYtRWCaXc1PLa5Luee+xhTFkZiCR1mq73bKfIiAXGZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3SyvnGxON+b6qsToVEcnXygIlDvxyCiA0086aD1uAA=;
 b=THeywpWeREJyuRBtVbZBXsArJCmiDHQV2OBynGvq/+PV+NF2LpM4bjdsGDEjEtk9NKUaqfZ+AekDoQ3iAwRnJfr2z968x7mOUK61xjogHHAdAezyN2YpTTn7iSOeFgTYLs/4oTc9y5xJaq4qo0sMiXzDO1snazTDS/LweeByUXQZCmOhaF7Ftd6izX9ELpk5QkQJnMfjVFJs7afEq+B7nyUzDcShG8NWKt0d3LqVKX+SqQsU5yc9HQq2wXRxG+41MJJRwqBahPYUjKPFXkCF/JPtJS++YPIOHRTJ7RTcDotkP1FSgDy7SO8OgE/BO3OKnjRUOOaS0PbhuO2yvbvnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3SyvnGxON+b6qsToVEcnXygIlDvxyCiA0086aD1uAA=;
 b=swehtdQ4HDH+Rr5ie5kP5D1h6bISAEvCZcdPh0oxmVJA27lyg1QJaluNNhszZe2pHv2EiDd4fuS2OfDrV511pbvtl8gSGWTFhfvfHOOdZmqy0g6iakIysx59Ujeu3zlnXp92kzKzUMiTE4w6EekvXvfuCeBVb2/c2FtM+cBVNHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <af1ddaff-22b0-47d1-8aee-0fc994417e57@citrix.com>
Date: Fri, 17 Jul 2026 16:04:39 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v4] x86/hyperv: use dynamically allocated page for
 hypercalls
To: Ariadne Conill <ariadne@ariadne.space>, xen-devel@lists.xenproject.org
References: <20260716183502.21075-1-ariadne@ariadne.space>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260716183502.21075-1-ariadne@ariadne.space>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::19) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DS7PR03MB5445:EE_
X-MS-Office365-Filtering-Correlation-Id: ca752946-4b34-4d01-6ca5-08dee414bb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|10067099003|5023799004|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kH7bxWrutXJcOAVy69yDPyYb/P7pBZszGIe0FQeA+gLRojf0DNfrDyEvlsncJNRJtJiDkHgs34mJz+65CvYCdjiKkaEK2r7uFMWUM9Xk39s1EAtpV8MPFLj/NcXftG3MdHNf23NDcMz7TTe/fluM0Chq0LicRB1Xg+Q3XB8gaFTMjBfnNg4REiVAm1qvyciYOYHBSghg+Bo5xObUU+ITtfW6zFxsJjyGj0/MFB6XVSY/aSkCxWRuqBD/ESDuK1LcXDHHtN8kNjlj3acAEYIGTSpnOl/qMIBwjxgFThpIlWKUADkWgOtVBSbK8mdJ/REULngZY8yHHtt5HpO1OUI1deuoBfM0tAPs00pZP/UIYLTEtT8A80yzdcUtUA1iZMW05jMbLMxo4u/NFp3+67IoVSqKMQCUtg+CAw9gcGf5e4R1Jsd4MU1JWmo+ROUKz/Ae6EC7GoFMTWL1qxbW7ZQ+ROI3MispVR4FjkcRapLtlBGTMxQflRWS9fgYx0VSdH/KBfaptD7Mm8duJLoVKVeWUZ/qq6OwjTx/z8AlzdWOywB4RepJCrVOAQH9kgSKuZ43fOctEhhWysro6FquNBsH8eCW8Le4FIzVQRQKJ3mkY4o8RriE53JJnO7ZyLB7J/nz3HsG+S9PDHeLbaelpkzvIlwsVysJpjDcldgplNBiuQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?endGWHhhdXpGNmJXQTlOT3U4bWdJenZteUdPZmVNei9hdnc5aEhMcmppZUMy?=
 =?utf-8?B?Y3FnNUdqVGg0bUY3djc2L2dCaStrcWNBZGpHQlJYSklFWTFlU3ZtR1RDNlFV?=
 =?utf-8?B?bDRyNHFYaU5IUFN2eno1c3Y0Tk9uK2xnckN3NllHZlRxNG00SzB3VHR1WkF4?=
 =?utf-8?B?aGRwalFVTHBIZFNkSmlKclFjNlZKRm5sdjRVZ3FMMXNkUkxrTkN4b3l1M05N?=
 =?utf-8?B?VDlERXRIUEFkUmJxWnlBd20wWUpxd2ZWWmRGSDRoQmh4ZUYvZzRFMUNaNW5j?=
 =?utf-8?B?ZmVyTERSSFlMYWtEcWZkQWcrWFRaUElEQTJhNjRDc3JPUWVCRUVkNDQ5VjJF?=
 =?utf-8?B?U3JBSTZoMmdTbVAzRXFjQUxIMG93WmI3ZG1LKzJ0ZU1KTkhUSkE5VU4xb3lJ?=
 =?utf-8?B?ejZaam1UWSthKzdWZEFBWDZvZ3VFMDJ4OEpnc0JHcmo1ckZhMUpjNHo5TmdU?=
 =?utf-8?B?b0VKeWZDTUZMa05GTmRBRDVldG9UTWU2dmkzOFpOU1doTmtHdFIrRXE2U1FC?=
 =?utf-8?B?UG56WTRMUmtGcjVtZkNNTzZ0Y1pTL3NDRTdOZTJOTndiZ2hTaHUxM0JLREtX?=
 =?utf-8?B?ckJoelRuN2xoQ3Z3RnJYbFZWY3dJaE0yMzZSS05oNWdWMzVOdG16b0VzQWZm?=
 =?utf-8?B?SzZNZHJkeXEyNE1RN0FBeFJSZ253VC96MlB3K0xkMi9jSWdOUWFTcmtVcWZZ?=
 =?utf-8?B?MHllTGFLb2hvNXU1WmloTndyYURPYmVsc013K1dxMUNvbzZnS3crZFVwbEJF?=
 =?utf-8?B?LytoY01kTHFManIrRm9wREJKeUQwRnNNYUh0ajJvK3Q2YlJSYmR3aGVRb1ZL?=
 =?utf-8?B?Y2tBaTJFakhLMzFkZW5oVUdKcHEwd2xjdVYzblo1V2lDdENXeXNZU1pHZjhV?=
 =?utf-8?B?ZjErZEtHeHcwb21vMDIvZldYQUNlZ2lkN1FOWHUva1R2eG9nS1FxMmluR3oz?=
 =?utf-8?B?cnFpeFF0MkNLaEcyei9CMnBhUWt5dFpNclpxM1pMNXA2SCsyUWkySnBhN1pY?=
 =?utf-8?B?RkNYcFRaZk9DZmU2R05lcWdJVHB5UmxSM09KV0YxMnlMbFZFSW1JNGl0ekxl?=
 =?utf-8?B?U3J5bXBVUVAvZS9raTRnU3dHODFjdmppRDkyd0NLVzExWmJVT0taR3VlMVpa?=
 =?utf-8?B?RFVrQXFLcnMwYXFjR3VwNUIyQUJUV0k4eTVjM0w2cHUxRDVCV2E4UW5tdkgw?=
 =?utf-8?B?S2tNQk1ERitlYUNCU3lRRUdmWEV4cG44L25SdlJla1pwb0p6SVlzMitJeGZj?=
 =?utf-8?B?QTBvU0N5WDhxWUlmdnFwTWZJRUhJaGlpRnlyZHZ1MEFnZUlvVmE5WFdHUW92?=
 =?utf-8?B?Z1EwUGpITGZsWFpxK2NrS0R0MTdCaDBGajQ4ZHZPZnZJNmhpY2xCZS93QTJW?=
 =?utf-8?B?RlRlN05kWUhPMmtjNkI3MVAvTXIyTXphQzBweXN4MjNCRGx2WDJkM0QwVVpM?=
 =?utf-8?B?aFljbHB6NmxEam1CQklnNUdaQlB1RGtnb1JyaTdJUGJFZ1RuQU5XUnhMY21H?=
 =?utf-8?B?ak15TDIxTzdWSTRjZ2RvekZZVGZQZVZOckpBS0l2c3MySjdEYzI2dWJCRDhJ?=
 =?utf-8?B?MDNzUzBpbXJjMFlyajNzeVhRT1RNSUREaktOTlBUMmhwT1l4c3dvWE9weDB1?=
 =?utf-8?B?WFB1MURrbUhpd1VJdFB3eWVLbGg1VEY2bjlKdzlHck0xVE1td1NLdUdDSlpX?=
 =?utf-8?B?RWNuN2FHdjIycnpLcTlVRlpDcEZ4Q3FNNDdwaDBELzN2K0NzUk9uU1I3dXdV?=
 =?utf-8?B?Q0c4M0V1aURpUVM0NjdvZW9ibGltd3Vsai9SbkpMemZJMnEwY3dyTXplRkNx?=
 =?utf-8?B?TVZyL09vaE5xSFVhMFR6THNJaHlwejJoMHpha2N5VmtISXV4UHFDLzF3ZnhP?=
 =?utf-8?B?RmdFRVJIcVB4MEpvZ1F6WldFNlFXYkN2eXczNFlIcTlqVXUrRVhFam5sTTRa?=
 =?utf-8?B?QzR3V1B1L2RzblJZbjUycGRjMUh6TGkwT1BmSkhxdVd5K2c2Wk1wWXVUYlk0?=
 =?utf-8?B?ak9xMnhmYkdBa1c2MjlLOWdKSDNRblNWdkNMVVZLemhJNk8xYmRBT1BsL1Qw?=
 =?utf-8?B?eVZ6OXpvNlJJZmZnbEFJRnNHMVBwRXJTTlBkSDZxVUhPMzdiNlJ6V3Izek5V?=
 =?utf-8?B?NitNYVAwQjF3V2lwVkRIUFM2dWRWdFM4Y3lSdkZjUkF5c1J5Njd4cHZCUUtZ?=
 =?utf-8?B?Y3VJZlhZYzZOMlZrY0Q5U0RzSWUzUUFJUUUxb1A1TVd3SkExV3lYaWxoWVN6?=
 =?utf-8?B?dzhHWUduMm11WlpUWko0M1Y1MmdMUHUrRk1BeTVaQmJHZ05OdE5wNXV0SUtH?=
 =?utf-8?B?cG5wMXVDcktzT2pVNFp4TmNUOG54YzlQR2pjaGRxWm1MMGxxcEhYZEZZQkdy?=
 =?utf-8?Q?3LQX0J3KgR3GpPg8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca752946-4b34-4d01-6ca5-08dee414bb7a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 15:04:42.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcpjOjaCk0y+xeXuDOo/ztlSTBR/LrGTqCHjyY4USf2j+xmSjwLtWXMTPCg3ywfVr6uq0MPvJhSx2wgfNlXJbE+H/oWn43cRWLS7uR+P4CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-purgate-ID: tlsNG-bad1c0/1784300687-3A2C4034-E596C34E/0/0
X-purgate-type: clean
X-purgate-size: 2542

On 16/07/2026 7:35 pm, Ariadne Conill wrote:
> Previously, the Hyper-V guest code placed the hypercall page at a
> fixed, hardcoded location: the top-most MFN of the guest physical
> address space (HV_HCALL_MFN). To make this work, an e820_fixup hook
> reserved that range as E820_RESERVED so nothing else would claim it.
>
> This assumes the top-most physical frame is actually backed by RAM (or
> at least mapped to something), which is not guaranteed. On Azure
> compute guests it is not: the top-most MFN is not physically mapped to
> anything. When we program HV_X64_MSR_HYPERCALL to point at that frame
> and subsequently execute through the hypercall page via the fixmap, the
> access faults and Xen panics during early boot.
>
> Instead of guessing at a physical address, allocate a real xenheap page
> and use its MFN for the hypercall page. This frame is always backed and
> mapped, so the fault no longer occurs. The e820_fixup hook and the
> HV_HCALL_MFN definition are no longer needed and are removed.
>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>

This is certainly nicer than before.  But, it was intentional to be a
page not backed by RAM, and "out of the way".

IIRC, the Viridian hypercall page is described as an overlay which comes
into place, and shadows whatever is behind it.  It is also mapped
read-only which means it will shatter superpages (hence putting it "out
of the way"), and yield's #GP when trying to write to it (this is not so
easy to achieve, so is clearly deliberate).

From the commit message, you seem to be saying that selecting a page
which isn't actually RAM doesn't appear to work?  What fault precisely
do you get?

> ---
>  xen/arch/x86/guest/hyperv/hyperv.c      | 19 +++++++++----------
>  xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
>  2 files changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
> index 90757e0793..d98d02fb80 100644
> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> @@ -99,10 +99,18 @@ static void __init setup_hypercall_page(void)
>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>      if ( !hypercall_msr.enable )
>      {
> -        mfn = HV_HCALL_MFN;
> +        void *hcall_page = alloc_xenheap_page();

We never access the page via it's main alias.  We configure FIXMAP_X to
point at it.

So I think this is safe to be domheap page not a xenheap page.

~Andrew

