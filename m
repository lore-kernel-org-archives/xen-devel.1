Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01770C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 12:17:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7040020848
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 12:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="msCB71fo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7040020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6708.17636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSfiZ-0005fZ-6p; Wed, 14 Oct 2020 12:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6708.17636; Wed, 14 Oct 2020 12:17:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSfiZ-0005fS-3z; Wed, 14 Oct 2020 12:17:19 +0000
Received: by outflank-mailman (input) for mailman id 6708;
 Wed, 14 Oct 2020 12:17:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSfiX-0005fN-QQ
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 12:17:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9234147b-39c3-4cf8-b402-42c39acdc25d;
 Wed, 14 Oct 2020 12:17:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 355ACAFB2;
 Wed, 14 Oct 2020 12:17:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSfiX-0005fN-QQ
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 12:17:17 +0000
X-Inumbo-ID: 9234147b-39c3-4cf8-b402-42c39acdc25d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9234147b-39c3-4cf8-b402-42c39acdc25d;
	Wed, 14 Oct 2020 12:17:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602677836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+t59B7xQEmr/yMT4LOu0Kw/sh/p5DegGVYVvv2zAHWQ=;
	b=msCB71fojTY9lt9dWvTlaFw/Hb3XHiWAjAMeWoZpF3GWV6Otyh6U8clKvICYjd7WMNOJLs
	I+q0k4PIxVgubpta6weQFZbbgmOoBg78BgqooNTeDcnm2ISjLQXiZ1t8pW35axsPSocXnx
	MqeQ2hinpnYC1TIv2TGdzJ/F8FGqtBo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 355ACAFB2;
	Wed, 14 Oct 2020 12:17:16 +0000 (UTC)
Subject: Re: [PATCH] x86/msr: handle IA32_THERM_STATUS
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20201007102032.98565-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e694350-4665-a1e7-20a4-f68cbee34dd1@suse.com>
Date: Wed, 14 Oct 2020 14:17:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201007102032.98565-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.10.2020 12:20, Roger Pau Monne wrote:
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -253,6 +253,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>              break;
>          goto gp_fault;
>  
> +    case MSR_IA32_THERM_STATUS:
> +        if ( cp->x86_vendor != X86_VENDOR_INTEL )
> +            goto gp_fault;
> +        *val = 0;
> +        break;

I've been puzzled while applying this: The upper patch context doesn't
match what's been in master for about the last month, and hence I
wonder what version of the tree you created this patch against. In any
event please double check that I didn't screw it up.

Jan

