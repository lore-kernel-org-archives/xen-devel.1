Return-Path: <SRS0=12TN=G5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453B0C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 16:58:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E89FA229C9
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 16:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E89FA229C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.75331.135608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Rf6-00088O-FE; Tue, 26 Jan 2021 16:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75331.135608; Tue, 26 Jan 2021 16:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Rf6-00088H-Ba; Tue, 26 Jan 2021 16:57:52 +0000
Received: by outflank-mailman (input) for mailman id 75331;
 Tue, 26 Jan 2021 16:57:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Rf5-000881-0p
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:57:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9791d62f-a837-4c7d-9f25-d1287134d3ba;
 Tue, 26 Jan 2021 16:57:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E20CAB92;
 Tue, 26 Jan 2021 16:57:48 +0000 (UTC)
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
X-Inumbo-ID: 9791d62f-a837-4c7d-9f25-d1287134d3ba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611680268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ja6xIb6E1udG9QVJpiiN5T4dM/qCnEekFYBrPyHhxAI=;
	b=cn/SEc2pmfOz+mCrn8ht5ijLenjQcmrZeSMPYr7bTtNsc5vpQwtXjJX2l/2ZthPHP6VW+0
	6S+euKHexWOkirfWB9aMnMAhGTkRUlaFvv4vJaftXKuDns+witNMDUbZAE4+8p6dx2nCj3
	xxz5W0gcTBKV/0KgFmzzSXe7pEuxLDc=
Subject: Re: [PATCH v3 5/6] x86/vpic: issue dpci EOI for cleared pins at ICW1
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126134521.25784-1-roger.pau@citrix.com>
 <20210126134521.25784-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f20953be-ee22-c336-bca5-8da84af49261@suse.com>
Date: Tue, 26 Jan 2021 17:57:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126134521.25784-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 14:45, Roger Pau Monne wrote:
> When pins are cleared from either ISR or IRR as part of the
> initialization sequence forward the clearing of those pins to the dpci
> EOI handler, as it is equivalent to an EOI. Not doing so can bring the
> interrupt controller state out of sync with the dpci handling logic,
> that expects a notification when a pin has been EOI'ed.
> 
> Fixes: 7b3cb5e5416 ('IRQ injection changes for HVM PCI passthru.')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

As said before, under the assumption that the clearing of IRR
and ISR that we do is correct, I agree with the change. I'd
like to give it some time though before giving my R-b here, for
the inquiry to hopefully get answered. After all there's still
the possibility of us needing to instead squash that clearing
(which then would seem to result in getting things in sync the
other way around).

Jan

> --- a/xen/arch/x86/hvm/vpic.c
> +++ b/xen/arch/x86/hvm/vpic.c
> @@ -197,6 +197,8 @@ static void vpic_ioport_write(
>      {
>          if ( val & 0x10 )
>          {
> +            unsigned int pending = vpic->isr | (vpic->irr & ~vpic->elcr);
> +
>              /* ICW1 */
>              /* Clear edge-sensing logic. */
>              vpic->irr &= vpic->elcr;
> @@ -220,6 +222,24 @@ static void vpic_ioport_write(
>              }
>  
>              vpic->init_state = ((val & 3) << 2) | 1;
> +            vpic_update_int_output(vpic);
> +            vpic_unlock(vpic);
> +
> +            /*
> +             * Forward the EOI of any pending or in service interrupt that has
> +             * been cleared from IRR or ISR, or else the dpci logic will get
> +             * out of sync with the state of the interrupt controller.
> +             */
> +            while ( pending )
> +            {
> +                unsigned int pin = __scanbit(pending, 8);
> +
> +                ASSERT(pin < 8);
> +                hvm_dpci_eoi(current->domain,
> +                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
> +                __clear_bit(pin, &pending);
> +            }
> +            return;
>          }
>          else if ( val & 0x08 )
>          {
> 


