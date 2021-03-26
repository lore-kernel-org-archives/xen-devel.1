Return-Path: <SRS0=uMCZ=IY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96225C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 16:54:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 397066198C
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 16:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 397066198C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101968.195367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpjW-0008Lm-Ae; Fri, 26 Mar 2021 16:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101968.195367; Fri, 26 Mar 2021 16:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpjW-0008Lf-7T; Fri, 26 Mar 2021 16:54:50 +0000
Received: by outflank-mailman (input) for mailman id 101968;
 Fri, 26 Mar 2021 16:54:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPpjV-0008LZ-EY
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:54:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPpjV-0003FC-Ax
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:54:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPpjV-0002yu-A6
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:54:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPpjR-0003J2-RT; Fri, 26 Mar 2021 16:54:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=pbqEGjcPljbsFIpuqq2xM2/elg1pjolDjB1DZ+EWjEI=; b=G8Qa+Uz1uFjVmmCMo2mLpZw79i
	5rvYhdyn6nTVw2qJSONK1p9Qr/MLWjUpgVXkOuXgNSN7qxKnyY83Swwzh/bimPcIl8/S4fSvUM+u7
	ABiOLvjuzruAFURI2nCMxsuSRz2CAZwEcZXUEByYwL3tW4Bu/9sPMDbCQOC/FCUCZRSM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24670.4565.669973.152753@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 16:54:45 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH][4.15] x86/HPET: don't enable legacy replacement mode
 unconditionally
In-Reply-To: <10de7758-fadd-3a04-d0d9-8ec3074ea149@suse.com>
References: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
	<24670.3891.328817.908772@mariner.uk.xensource.com>
	<10de7758-fadd-3a04-d0d9-8ec3074ea149@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] x86/HPET: don't enable legacy replacement mode unconditionally"):
> Thanks, but with Andrew's pending objection I don't feel like
> committing it.

I understand.

> > I have to say that this
> > 
> >    -    if ( hpet_rate )
> >    +    if ( hpet_rate || !hpet_address || !opt_hpet )
> >             return hpet_rate;
> > 
> >    -    if ( hpet_address == 0 )
> >    -        return 0;
> >    -
> > 
> > is to my mind quite an obscure coding style.
> > 
> > Do we really want to return a nozero hpet_rate even if !opt_hpet ?
> 
> We won't: hpet_rate will be set to non-zero only further down in
> the function.

Oh, I see.  Right.  Thanks for the quick reply.

Ian.

