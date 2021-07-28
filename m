Return-Path: <SRS0=WCSt=MU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A60C4338F
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jul 2021 10:43:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394DF60F9E
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jul 2021 10:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 394DF60F9E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161507.296521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8h1i-0004mw-2v; Wed, 28 Jul 2021 10:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161507.296521; Wed, 28 Jul 2021 10:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8h1h-0004mp-WF; Wed, 28 Jul 2021 10:43:02 +0000
Received: by outflank-mailman (input) for mailman id 161507;
 Wed, 28 Jul 2021 10:43:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8h1h-0004mj-0w
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:43:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8h1g-0008Lu-UC
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:43:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8h1g-0000kz-Su
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:43:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8h1d-00060s-I4; Wed, 28 Jul 2021 11:42:57 +0100
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
	bh=gnsfgb//20yXhP5KyFqyykVOKHq+hCMyGBhK5k7G94A=; b=NWVYN3ajSfsIYidDE2FhbQiKuj
	i4XldZwYSnauplSH01lgo6xp2BhkUFuPLccynUWqyTPkyTS0lhPvfzYExeFn5mimIB3u6YAuyTzpC
	Z73NHZ3Z34AgiNh1ZsmTt6ZewoUMG8RIgtC88PN6qNrxA8NWVOyJ6RZew6kkhquBC5XE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24833.13489.362056.292831@mariner.uk.xensource.com>
Date: Wed, 28 Jul 2021 11:42:57 +0100
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    "Ian  Jackson" <iwj@xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/lib: Fix strcmp() and strncmp()
In-Reply-To: <20210727184715.17699-1-jane.malalane@citrix.com>
References: <20210727184715.17699-1-jane.malalane@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jane Malalane writes ("[PATCH] xen/lib: Fix strcmp() and strncmp()"):
> The C standard requires that each character be compared as unsigned
> char. Xen's current behaviour compares as signed char, which changes
> the answer when chars with a value greater than 0x7f are used.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Thanks for this.

What are the practical effects of this bug ?  AFAICT in the hypervisor
code all the call sites simply test for zero/nonzero.

Of course we should fix this because

> -		if ((__res = *cs - *ct++) != 0 || !*cs++)

this substraction is UB if it overflows.  So in theory the compiler
could miscompile it - although in practice I can't see how the
assumption that this doesn't overflow would "help" the compiler.

Ian.

