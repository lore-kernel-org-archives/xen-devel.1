Return-Path: <SRS0=TXFR=6F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3951AC2BA19
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2020 07:49:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D6002074B
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2020 07:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D6002074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQne6-0000Gp-6c; Tue, 21 Apr 2020 07:48:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQne4-0000Gk-Ti
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 07:48:40 +0000
X-Inumbo-ID: 83cb8328-83a4-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83cb8328-83a4-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 07:48:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6A2A2AC2C;
 Tue, 21 Apr 2020 07:48:38 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/pv: Don't use IST for NMI/#MC/#DB in !CONFIG_PV
 builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
 <20200420145911.5708-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08a798db-3126-7ccd-17f3-476607cc9e45@suse.com>
Date: Tue, 21 Apr 2020 09:48:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420145911.5708-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 16:59, Andrew Cooper wrote:
> --- a/xen/include/asm-x86/processor.h
> +++ b/xen/include/asm-x86/processor.h
> @@ -441,12 +441,18 @@ struct tss_page {
>  };
>  DECLARE_PER_CPU(struct tss_page, tss_page);
>  
> +/*
> + * Interrupt Stack Tables.  Used to force a stack switch on a CPL0=>0
> + * interrupt/exception.  #DF uses IST all the time to detect stack overflows
> + * cleanly.  NMI/#MC/#DB only need IST to cover the SYSCALL gap, and therefore
> + * only necessary with PV guests.
> + */

Is it really only the SYSCALL gap that we mean to cover? In particular
for #MC I'd suspect it is a good idea to switch stacks as well, to get
onto a distinct memory page in case the #MC was stack related. With
NMI it might as well be better to switch; I agree we don't need any
switching for #DB.

I also think that the comment at the top of current.h would want
updating with these adjustments (which I notice lacks the #DB part
anyway).

Jan

