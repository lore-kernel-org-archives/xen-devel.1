Return-Path: <SRS0=Jwwc=ES=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB03AC56201
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 09:23:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50C9E21D40
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 09:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="lpEXR6k+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50C9E21D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25585.53438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd8oe-0005IV-Gu; Thu, 12 Nov 2020 09:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25585.53438; Thu, 12 Nov 2020 09:22:52 +0000
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
	id 1kd8oe-0005IO-D9; Thu, 12 Nov 2020 09:22:52 +0000
Received: by outflank-mailman (input) for mailman id 25585;
 Thu, 12 Nov 2020 09:22:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd8od-0005IJ-3s
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:22:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e446899a-2220-4caf-bd5d-f0a3c41e1558;
 Thu, 12 Nov 2020 09:22:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7082AE66;
 Thu, 12 Nov 2020 09:22:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd8od-0005IJ-3s
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:22:51 +0000
X-Inumbo-ID: e446899a-2220-4caf-bd5d-f0a3c41e1558
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e446899a-2220-4caf-bd5d-f0a3c41e1558;
	Thu, 12 Nov 2020 09:22:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605172969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wUVe30jhrN16I887Oxd7GAdRutQg7nm4zVYC1ATqy0c=;
	b=lpEXR6k+2UNYSCz3xNDVXUMLSuIylaho811iZ9xj7Hs5ipNyM1Z5E6NveSYgNg1HvKgo2L
	d2Cn6vIH3IcI6WkLQCp9e2O7qzAOv+SS4BSMOKRRUssM5/h8IpG8ZiLIsWhawYIiUFuu/a
	8bFTcUFGqodhE3gQd0sVfYxD+HN2MQw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A7082AE66;
	Thu, 12 Nov 2020 09:22:49 +0000 (UTC)
Subject: Re: [PATCH 08/10] viridian: log initial invocation of each type of
 hypercall
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-9-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9a9f41a-871c-65c3-74b6-e5063261210b@suse.com>
Date: Thu, 12 Nov 2020 10:22:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111200721.30551-9-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 21:07, Paul Durrant wrote:
> --- a/xen/include/asm-x86/hvm/viridian.h
> +++ b/xen/include/asm-x86/hvm/viridian.h
> @@ -59,6 +59,14 @@ struct viridian_domain
>  {
>      union hv_guest_os_id guest_os_id;
>      union hv_vp_assist_page_msr hypercall_gpa;
> +    unsigned long hypercall_flags;
> +
> +#define _HCALL_spin_wait 0
> +#define _HCALL_flush 1
> +#define _HCALL_flush_ex 2
> +#define _HCALL_ipi 3
> +#define _HCALL_ipi_ex 4

I'd like to suggest for this to either be unsigned int until
more than 32 bits are needed, or be using DECLARE_BITMAP()
right away.

Jan

