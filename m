Return-Path: <SRS0=4R9G=IO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E4DC433DB
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 16:58:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B7816510F
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 16:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B7816510F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98409.186677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMD1P-00074T-JA; Tue, 16 Mar 2021 16:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98409.186677; Tue, 16 Mar 2021 16:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMD1P-00074M-Fe; Tue, 16 Mar 2021 16:58:19 +0000
Received: by outflank-mailman (input) for mailman id 98409;
 Tue, 16 Mar 2021 16:58:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMD1O-00074G-B1
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 16:58:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d55991bb-0153-4a3d-a78d-39c8b32f8bc9;
 Tue, 16 Mar 2021 16:58:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 054C9AC1F;
 Tue, 16 Mar 2021 16:58:16 +0000 (UTC)
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
X-Inumbo-ID: d55991bb-0153-4a3d-a78d-39c8b32f8bc9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615913896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIz8ysMRreoa8wBnKxkWghvV2fqzA5RHl2nEEHwHTbY=;
	b=HhSJoA/2rH/iJ171MYlp9iOoaTNzRl4ZRGRcHY/Shstjl444UBqMvzG3zdlLbPKdklxhWH
	fH6T3VUtyabmIqDgDDLnGXsVphBLW7vCFZa3BytdM+nhA5kAzUPOFZiYBAsMMOmTjJ/iGh
	hmxxaUAQsKfDb8SRfBiaSfcqp6pmaRc=
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ian Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df7b7faf-ce81-795a-6d8d-29fe967d2d77@suse.com>
Date: Tue, 16 Mar 2021 17:58:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316161844.1658-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.03.2021 17:18, Andrew Cooper wrote:
> In hindsight, this was a poor move.  Some of these MSRs require probing for,
> causing unhelpful spew into xl dmesg, as well as spew from unit tests
> explicitly checking behaviour.

I can indeed see your point for MSRs that require probing. But what about
the others (which, as it seems, is the majority)? And perhaps specifically
what about the entire WRMSR side, which won't be related to probing? I'm
not opposed to the change, but I'd like to understand the reasoning for
every one of the MSRs, not just a subset.

Of course such ever-growing lists of case labels aren't very nice - this
going away was one of the things I particularly liked about the original
change.

Jan

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -175,6 +175,30 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>  
>      switch ( msr )
>      {
> +        /* Write-only */
> +    case MSR_AMD_PATCHLOADER:
> +    case MSR_IA32_UCODE_WRITE:
> +    case MSR_PRED_CMD:
> +    case MSR_FLUSH_CMD:
> +
> +        /* Not offered to guests. */
> +    case MSR_TEST_CTRL:
> +    case MSR_CORE_CAPABILITIES:
> +    case MSR_TSX_FORCE_ABORT:
> +    case MSR_TSX_CTRL:
> +    case MSR_MCU_OPT_CTRL:
> +    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
> +    case MSR_U_CET:
> +    case MSR_S_CET:
> +    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
> +    case MSR_AMD64_LWP_CFG:
> +    case MSR_AMD64_LWP_CBADDR:
> +    case MSR_PPIN_CTL:
> +    case MSR_PPIN:
> +    case MSR_AMD_PPIN_CTL:
> +    case MSR_AMD_PPIN:
> +        goto gp_fault;
> +
>      case MSR_IA32_FEATURE_CONTROL:
>          /*
>           * Architecturally, availability of this MSR is enumerated by the
> @@ -382,6 +406,30 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>      {
>          uint64_t rsvd;
>  
> +        /* Read-only */
> +    case MSR_IA32_PLATFORM_ID:
> +    case MSR_CORE_CAPABILITIES:
> +    case MSR_INTEL_CORE_THREAD_COUNT:
> +    case MSR_INTEL_PLATFORM_INFO:
> +    case MSR_ARCH_CAPABILITIES:
> +
> +        /* Not offered to guests. */
> +    case MSR_TEST_CTRL:
> +    case MSR_TSX_FORCE_ABORT:
> +    case MSR_TSX_CTRL:
> +    case MSR_MCU_OPT_CTRL:
> +    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
> +    case MSR_U_CET:
> +    case MSR_S_CET:
> +    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
> +    case MSR_AMD64_LWP_CFG:
> +    case MSR_AMD64_LWP_CBADDR:
> +    case MSR_PPIN_CTL:
> +    case MSR_PPIN:
> +    case MSR_AMD_PPIN_CTL:
> +    case MSR_AMD_PPIN:
> +        goto gp_fault;
> +
>      case MSR_AMD_PATCHLEVEL:
>          BUILD_BUG_ON(MSR_IA32_UCODE_REV != MSR_AMD_PATCHLEVEL);
>          /*
> 


