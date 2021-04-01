Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2472C433ED
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 11:06:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E6F610CC
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 11:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63E6F610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104377.199611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRv9r-00084G-1b; Thu, 01 Apr 2021 11:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104377.199611; Thu, 01 Apr 2021 11:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRv9q-000849-Uk; Thu, 01 Apr 2021 11:06:38 +0000
Received: by outflank-mailman (input) for mailman id 104377;
 Thu, 01 Apr 2021 11:06:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRv9q-000844-56
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 11:06:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d67fbdd7-89df-4ba2-b74e-6009903a086d;
 Thu, 01 Apr 2021 11:06:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69583B1AC;
 Thu,  1 Apr 2021 11:06:36 +0000 (UTC)
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
X-Inumbo-ID: d67fbdd7-89df-4ba2-b74e-6009903a086d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617275196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u4iJHiMsZFzlQ/O/sp9kJ/RKkMMBzbfE+6qQl6oYlL8=;
	b=qdhFoe1p0uU+/cHTU0qFJopNBaVx3lIuzWUwhqEmGC+WglDOHkqHcEpsh35IE4Qp2aVIT1
	1OhMDnO2iLvGG5RCsvlldkE/BjtmTdxCaAYu1XJLa3QbB/6AhkPDzMKFG1rl0TEyqOYc5p
	hm4rR1sVpOLnstsSvgi2GJdCb9rlxi8=
Subject: Re: [PATCH v3 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Paul Durrant <pdurrant@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <008d8d8c-f932-c3f3-e06d-99aa6721a59f@suse.com>
Date: Thu, 1 Apr 2021 13:06:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.03.2021 12:32, Roger Pau Monne wrote:
> EOIs are always executed in guest vCPU context, so there's no reason to
> pass a vCPU parameter around as can be fetched from current.

While not overly problematic, I'd like to point out that there's not a
single vcpu parameter being dropped here - in both cases it's struct
domain *.

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -459,13 +459,10 @@ void vlapic_EOI_set(struct vlapic *vlapic)
>  
>  void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
>  {
> -    struct vcpu *v = vlapic_vcpu(vlapic);
> -    struct domain *d = v->domain;
> -
>      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
> -        vioapic_update_EOI(d, vector);
> +        vioapic_update_EOI(vector);
>  
> -    hvm_dpci_msi_eoi(d, vector);
> +    hvm_dpci_msi_eoi(vector);
>  }

The Viridian path pointed out before was only an example. I'm afraid
the call from vlapic_has_pending_irq() to vlapic_EOI_set() is also
far from obvious that it always has "v == current". What we end up
with here is a mix of passed in value (vlapic) and assumption of the
call being for the vCPU / domain we're running on. At the very least
I think this would want documenting here in some way (maybe ASSERT(),
definitely mentioning in the description), but even better would
perhaps be if the parameter of the function here as well as further
ones involved would also be dropped then.

Jan

