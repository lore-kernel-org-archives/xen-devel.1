Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB4FC369D1
	for <xen-devel@archiver.kernel.org>; Thu, 24 Apr 2025 09:59:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.966060.1356386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7tMo-0006te-Pk; Thu, 24 Apr 2025 09:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966060.1356386; Thu, 24 Apr 2025 09:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7tMo-0006tX-Lx; Thu, 24 Apr 2025 09:59:38 +0000
Received: by outflank-mailman (input) for mailman id 966060;
 Thu, 24 Apr 2025 09:59:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YKuC=XK=tum.de=f.specht@srs-se1.protection.inumbo.net>)
 id 1u7tMn-0006tR-SU
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 09:59:37 +0000
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d14cac81-20f2-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 11:59:32 +0200 (CEST)
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4Zjrzl2KXLzyYp;
 Thu, 24 Apr 2025 11:59:30 +0200 (CEST)
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id ek_54piztXrO; Thu, 24 Apr 2025 11:59:30 +0200 (CEST)
Received: from localhost (unknown [37.85.220.79])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Zjrzj3Db7zyZ3;
 Thu, 24 Apr 2025 11:59:29 +0200 (CEST)
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
X-Inumbo-ID: d14cac81-20f2-11f0-9ffb-bf95429c2676
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=tu-postout21; t=1745488770; bh=g
	iNNqN+/QtHdg/cA9J9zLPXzEAuFwcVqhzpwjSO/g9A=; b=Wm+W7yHhwqXjjcBqI
	3uvXSrDQD9H1yQsJYwRoBULuAYEG3sEqzkrl2lvu0pxhQJpTf9XJre1pV3AWtUVv
	xZIUWrpZJNBHWEpjacrnWIPWeCsTnwikoucKJqgrdAujgyQRhpwZlEKKL2uit2lT
	xyTSslMQoYtfC/jVv5LkAgtSVH4aJefCbsdAE8td56NDAlhJSKMNdbpy91YHXBl+
	BLjhKHwBZjMm0Je9+PreYytdc/Q2zoI2jsKEWJJZQKgpVaR/C6tok/yHoieQsC75
	nD/GtAPQoOm1Bwuya4dUHI7QXgZ5gd4ycSEXf1nDg+NsQhcZ8N7OXmCDWpJ09+Wq
	ELDFw==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
Date: Thu, 24 Apr 2025 11:59:21 +0200
From: Fabian Specht <f.specht@tum.de>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: manuel.andreas@tum.de
Subject: Re: UBSan bug in real mode fpu emulation
Message-ID: <btqvz46tfyfridqunbth2l5g5e544p3jymwgr542oufvi3hbuc@em5mqn7qfmb3>
References: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
 <40a5c44c-4ef1-4852-b441-ea65e31b2345@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40a5c44c-4ef1-4852-b441-ea65e31b2345@suse.com>

On Thu, Apr 24, 2025 at 08:34:42AM +0200, Jan Beulich wrote:
> Since ...
> 
> > Similar code resides in the same file in lines 87, 125 and 127.
> 
> ... all of these are shifts by 16, could you clarify what it is that you
> want to shift by 4? Imo what we need to do here is add casts to unsigned
> int, for the results thereof to be shifted (or use some extra arithmetic
> to achieve the same effect, e.g. add in 0U). Or we could go and replace
> the shifts by 16 with shifts by 12 (accounting for the later right shift
> by 4, which would then need dropping).

Oh I guess I was up too late, of course we need some sort of cast.

~Fabian

