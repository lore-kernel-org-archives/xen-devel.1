Return-Path: <SRS0=CsTU=77=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC09C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2020 15:38:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A20206FA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2020 15:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A20206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwbc-0007mQ-Pd; Thu, 18 Jun 2020 15:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlwbb-0007mL-Vd
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:37:32 +0000
X-Inumbo-ID: 9f0ec41c-b179-11ea-baae-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f0ec41c-b179-11ea-baae-12813bfff9fa;
 Thu, 18 Jun 2020 15:37:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 70BC6B02C;
 Thu, 18 Jun 2020 15:37:29 +0000 (UTC)
Subject: Re: [PATCH for-4.14 7/8] x86/hvm: add hardware domain support to
 hvm_isa_irq_to_gsi
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-8-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c53946a-45de-cfd7-a5c3-49a8dc3112da@suse.com>
Date: Thu, 18 Jun 2020 17:37:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612155640.4101-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, paul@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 17:56, Roger Pau Monne wrote:
> The current function has the ISA IRQ 0 hardcoded to GSI 2 for HVM
> domUs. Allow such function to also be used by the hardware domain by
> taking into account the ACPI interrupt overwrites in order to get the

Nit: overrides

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -608,7 +608,7 @@ static int find_irq_entry(int apic, int pin, int type)
>  /*
>   * Find the pin to which IRQ[irq] (ISA) is connected
>   */
> -static int __init find_isa_irq_pin(int irq, int type)
> +int io_apic_find_isa_irq_pin(int irq, int type)
>  {
>      int i;
>  
> @@ -628,7 +628,7 @@ static int __init find_isa_irq_pin(int irq, int type)
>      return -1;
>  }
>  
> -static int __init find_isa_irq_apic(int irq, int type)
> +int io_apic_find_isa_irq_apic(int irq, int type)
>  {

Since you touch these anyway, how about making their parameters
"unsigned int"? Preferably with this
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

