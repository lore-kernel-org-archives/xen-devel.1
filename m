Return-Path: <SRS0=QJUc=GY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2603EC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 16:23:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5029206D8
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 16:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5029206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72261.129980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cjk-0005tX-Ac; Thu, 21 Jan 2021 16:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72261.129980; Thu, 21 Jan 2021 16:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cjk-0005tQ-7S; Thu, 21 Jan 2021 16:23:08 +0000
Received: by outflank-mailman (input) for mailman id 72261;
 Thu, 21 Jan 2021 16:23:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2cjj-0005tL-6J
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 16:23:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87aa8bbc-d66c-4de7-9dae-e0d63927a9eb;
 Thu, 21 Jan 2021 16:23:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7534FB734;
 Thu, 21 Jan 2021 16:23:05 +0000 (UTC)
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
X-Inumbo-ID: 87aa8bbc-d66c-4de7-9dae-e0d63927a9eb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611246185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UhSIev9/glWQDTb7Pm6e8MrtAyzNbQW62unJPSlN0o=;
	b=sssnw4IWu4pYyYz2Env0+p0RjTwMVLcz6sCcupxgTRk/8xW+lJgjBZi6VVjihYKQ31/Dhc
	LAvV0uZH5LNLZdHroBbzDOTsF3i9VME/jv8kSpbnd8ONn5ULpM72JiPcgrDR79ZGqaXXBd
	orWxREAZ78OkyEtJE3dT9MuJrGUDrVs=
Subject: Re: [PATCH v2 2/4] x86/vioapic: issue EOI to dpci when switching pin
 to edge trigger mode
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e6652f4-693c-cb03-a5f1-bf90e0f83253@suse.com>
Date: Thu, 21 Jan 2021 17:23:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115142820.35224-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.01.2021 15:28, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -268,6 +268,17 @@ static void vioapic_write_redirent(
>  
>      spin_unlock(&d->arch.hvm.irq_lock);
>  
> +    if ( ent.fields.trig_mode == VIOAPIC_EDGE_TRIG &&
> +         ent.fields.remote_irr && is_iommu_enabled(d) )
> +            /*
> +             * Since IRR has been cleared and further interrupts can be
> +             * injected also attempt to deassert any virtual line of passed
> +             * through devices using this pin. Switching a pin from level to
> +             * trigger mode can be used as a way to EOI an interrupt at the
> +             * IO-APIC level.
> +             */
> +            hvm_dpci_eoi(d, gsi);
> +
>      if ( is_hardware_domain(d) && unmasked )
>      {
>          /*

I assume in the comment you mean "... from level to edge
mode ...". But this isn't reflected in the if() you add -
you do the same also when the mode doesn't change. Or do
you build on the assumption that ent.fields.remote_irr can
only be set if the prior mode was "level" (in which case
an assertion may be warranted, as I don't think this is
overly obvious)?

Also, looking at this code, is it correct to trigger an IRQ
upon the guest writing the upper half of an unmasked RTE
with remote_irr clear? I'd assume this needs to be strictly
limited to a 1->0 transition of the mask bit. If other code
indeed guarantees this in all cases, perhaps another place
where an assertion would be warranted?

Jan

