Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A2DC79F89
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 08:02:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410632.1641423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3UJ9-0002i0-7q; Mon, 07 Sep 2026 08:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410632.1641423; Mon, 07 Sep 2026 08:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3UJ9-0002ht-4c; Mon, 07 Sep 2026 08:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1410632;
 Mon, 07 Sep 2026 08:02:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x3UJ8-0002hn-4c
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:02:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x3UJ6-0036ym-1n;
 Mon, 07 Sep 2026 08:02:24 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x3UJ7-00FxG0-04;
 Mon, 07 Sep 2026 08:02:24 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=1Q3WAeJi2uYHZWOdjLfRH35Q5Pn7ObXOgMy9qYT+rJU=; b=gG5AV0HqUz26A+Nu5Ee97djvsy
	XoAiuQhFsLJ3tCg3mGK7Ild6M+mnT32YE6AxSNYQluGhqTvpz3O1/vllbj5+fk06U45mTgjKANWnb
	Jd83YEzIcirIRnhfg2cEEZk68pLdtOOVMsVsCCYyzHbFzTRjZ2K+yTAc8zVG82nMNXLY=;
Date: Mon, 7 Sep 2026 10:02:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 04/14] x86/boot: don't cast away const-ness
Message-ID: <ap5vjRkN_KzAuJuY@macbook.local>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <b0c22b5d-f5dd-45cf-8633-e3e1410c7d4a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0c22b5d-f5dd-45cf-8633-e3e1410c7d4a@suse.com>

On Wed, Sep 02, 2026 at 08:31:45AM +0200, Jan Beulich wrote:
> While the general C library strchr() has to do so, the early boot cmdline
> parsing has no such requirement.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

I won't usually agree to changing the interface of C library
functions, but this is limited enough to early boot cmdline parsing
that's IMO OK.  It might be good to rename the function so it doesn't
alias with the C library namespace now, since it's a different
interface.

Thanks, Roger.

