Return-Path: <SRS0=y3rP=FH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0270C64E8A
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 08:58:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD282067D
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 08:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CD282067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.43193.77690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkQp-0007Cs-BX; Thu, 03 Dec 2020 08:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43193.77690; Thu, 03 Dec 2020 08:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkQp-0007Cl-7r; Thu, 03 Dec 2020 08:57:43 +0000
Received: by outflank-mailman (input) for mailman id 43193;
 Thu, 03 Dec 2020 08:57:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkkQo-0007Cg-3I
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 08:57:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed491ce5-90f3-4e10-8cc3-decdad634163;
 Thu, 03 Dec 2020 08:57:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A911AC55;
 Thu,  3 Dec 2020 08:57:40 +0000 (UTC)
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
X-Inumbo-ID: ed491ce5-90f3-4e10-8cc3-decdad634163
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606985860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RaXDU8Exax7EzTDvPzEzvL05M5B5cu7wyCIl826n7+U=;
	b=dIAzhzaL5Nw6mYvA8PJguDWJxfJWRdeeDH3jM8uvhAEtEHF9U67oRyJyeF1Sr44Fd2dN/F
	X4PP1eLf7OpGAqvMfjZZMvv/SS2cNLnvAvx2761ok+84udAl/uc59ivD3qRpVZsF990xAd
	hVnkMsdScUha5y1GM+IM+t34NPLFjGk=
Subject: Re: [PATCH v2 1/2] x86/IRQ: make max number of guests for a shared
 IRQ configurable
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, sstabellini@kernel.org, wl@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <1606960706-21274-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22894360-d568-e399-5522-693a52898027@suse.com>
Date: Thu, 3 Dec 2020 09:57:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606960706-21274-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.12.2020 02:58, Igor Druzhinin wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1641,6 +1641,15 @@ This option is ignored in **pv-shim** mode.
>  ### nr_irqs (x86)
>  > `= <integer>`
>  
> +### irq_max_guests (x86)
> +> `= <integer>`
> +
> +> Default: `16`
> +
> +Maximum number of guests IRQ could be shared between, i.e. a limit on
> +the number of guests it is possible to start each having assigned a device
> +sharing a common interrupt line.  Accepts values between 1 and 255.

Reading through this again, could "IRQ" be expanded to "any individual
IRQ" or some such?

Jan

