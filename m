Return-Path: <SRS0=zQ2v=QE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFF4C433F5
	for <xen-devel@archiver.kernel.org>; Wed, 17 Nov 2021 16:05:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8155E61BE1
	for <xen-devel@archiver.kernel.org>; Wed, 17 Nov 2021 16:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8155E61BE1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.226905.392264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNQj-0001xs-4h; Wed, 17 Nov 2021 16:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226905.392264; Wed, 17 Nov 2021 16:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNQj-0001xl-1i; Wed, 17 Nov 2021 16:05:01 +0000
Received: by outflank-mailman (input) for mailman id 226905;
 Wed, 17 Nov 2021 16:04:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnNQh-0001xf-Ob
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:04:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnNQh-000435-M3
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:04:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnNQh-0005w6-L9
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:04:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mnNQe-000689-4Y; Wed, 17 Nov 2021 16:04:56 +0000
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
	bh=wRglQJ4LGW0ZqcMtkvZ8+2/Re+KNGqdfDHpO4Ljb1DY=; b=juVqIaiut9QPbd2ePZVZpMnt/g
	006GGD90FmYbeMKKL9G5va4Ez6poMXOyMGVTj8x5n9gvNEyoS6gEADnZhh5qRIgHkU71k7ZHtj5pD
	R+Wjr0rRZYy61JkdVeVRpfKuca5kfMCih6q4jIwmBvSHx1q6YbSUctN4j3VwlghbAfag=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24981.10279.714058.771543@mariner.uk.xensource.com>
Date: Wed, 17 Nov 2021 16:04:55 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.16] efi: fix alignment of function parameters in compat mode
In-Reply-To: <20211117153350.19823-1-roger.pau@citrix.com>
References: <20211117153350.19823-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16] efi: fix alignment of function parameters in compat mode"):
> Currently the max_store_size, remain_store_size and max_size in
> compat_pf_efi_runtime_call are 4 byte aligned, which makes clang
> complain with:
> 
> In file included from compat.c:30:
> ./runtime.c:646:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 2 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>             &op->u.query_variable_info.max_store_size,
>             ^
> ./runtime.c:647:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 3 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>             &op->u.query_variable_info.remain_store_size,
>             ^
> ./runtime.c:648:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 4 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>             &op->u.query_variable_info.max_size);
>             ^
> Fix this by bouncing the variables on the stack in order for them to
> be 8 byte aligned.
> 
> Note this could be done in a more selective manner to only apply to
> compat code calls, but given the overhead of making an EFI call doing
> an extra copy of 3 variables doesn't seem to warrant the special
> casing.
...
> Tagged for possible inclusion into the release, as it's a likely
> candidate for backport. It shouldn't introduce any functional change
> from a caller PoV. I think the risk is getting the patch wrong and not
> passing the right parameters, or broken EFI implementations corrupting
> data on our stack instead of doing it in xenpf_efi_runtime_call.

Thanks.  I have double-checked the variable names etc.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

I agree with your analysis vis-a-vis 4.16.  The current code is
technically UB[1] and it seems possible that it might trigger bugs in
firmware.

I would like a third opinion (even though technically my review might
be enough).  So, subject to a review from a hypervisor maintainer:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks,
Ian.

[1] Well, as far as I can tell.  My copy of C99+TC1+TC2 is hopelessly
unclear about unaligned pointers, and here of course we have a
compiler extension too.

