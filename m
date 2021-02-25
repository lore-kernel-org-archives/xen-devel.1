Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A96CC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 09:51:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DA5064EBA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 09:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DA5064EBA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89658.169048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFDI9-0003q0-6i; Thu, 25 Feb 2021 09:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89658.169048; Thu, 25 Feb 2021 09:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFDI9-0003pt-3m; Thu, 25 Feb 2021 09:50:41 +0000
Received: by outflank-mailman (input) for mailman id 89658;
 Thu, 25 Feb 2021 09:50:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFDI8-0003po-1h
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 09:50:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFDI7-0005ic-Te
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 09:50:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFDI7-0004pW-So
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 09:50:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFDI1-00014S-NG; Thu, 25 Feb 2021 09:50:33 +0000
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
	bh=P97ygsKZKkV6O5TmJ/tc84vGWcotGhvJmKuGQroEJS8=; b=ZhrQm/M4KC7RKwELr6dZtUlXnr
	4wXbepyGZYWrMKxxzXwnPe8vum2obECWzBrZpbYwRz/UJpDesb2p9IXYEM0xpLtJQfBqOqhdr8Y2M
	Yl3fjEKi8kGO/ISB8RFLepglPRYkEAXeUJqi2AdNjnH5K1FAB3+nv8A1/o3UR52w/E4g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.29417.501638.284615@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 09:50:33 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org,
    Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] hvmloader: drop usage of system headers
In-Reply-To: <61932477-d44c-5592-da3f-b0b5ff5c6321@suse.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
	<35864c33-b375-a3c6-13bc-ad1e7d0773eb@citrix.com>
	<61932477-d44c-5592-da3f-b0b5ff5c6321@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 0/2] hvmloader: drop usage of system headers"):
> On 24.02.2021 21:08, Andrew Cooper wrote:
> > After some experimentation in the arch container
...
> > while the freestanding form with `gcc -ffreestanding -m32 -E` is:
...
> > # 34 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint-gcc.h" 3 4
> > typedef signed char int8_t;
> > ...

Um, but what size is size_t ?

In particular, note that that path contains nothing to do with 32-bit
so I think it is probably the wrong bitness.

> Why "more subtle"? All we're lacking is -ffreestanding. The
> question is whether it is an acceptably risky thing to do at
> this point in the release cycle to add the option.

If -ffreestanding DTRT then I think it's about as risky as the fix I
already approved and we have merged...

Ian.

