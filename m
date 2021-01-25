Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DD5C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 11:31:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78DC229C6
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 11:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78DC229C6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74032.133056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l405I-0006HU-NC; Mon, 25 Jan 2021 11:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74032.133056; Mon, 25 Jan 2021 11:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l405I-0006HN-JT; Mon, 25 Jan 2021 11:31:04 +0000
Received: by outflank-mailman (input) for mailman id 74032;
 Mon, 25 Jan 2021 11:31:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l405H-0006HI-2Z
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:31:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l405G-000356-Vc
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:31:02 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l405G-0002gi-Ts
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:31:02 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l405D-0003TH-Gq; Mon, 25 Jan 2021 11:30:59 +0000
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
	bh=8mEmLzyEYejlhi8Y0MUyOSmGKybO2SVydsIDlhuKtlk=; b=M606EH7KWDOK/p0oqFnrfddqFT
	CzULQGs++E7ATgVbTcEWl3ZLLQwr6nM4lOVR7UdxVdxNJdz3kk7EjZMAclKVLUiJ/WOeUdcr0SHnt
	4/WzJGEgq+XmVqDKb26JICOYzwC4QxzX/Su6TCSDC8+bqSKDSdo7DNdkxddgVYw143sE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24590.44019.51460.33930@mariner.uk.xensource.com>
Date: Mon, 25 Jan 2021 11:30:59 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    M A Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels
In-Reply-To: <f23d219f-ea52-e472-b95f-2a7e359d44cc@suse.com>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
	<f23d219f-ea52-e472-b95f-2a7e359d44cc@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Hi.  Thanks for this.  Firstly, RM hat: this is the tools half of zstd
decompression support which I think is a blocker for the release.  So
I am going to waive the last posting date requirement.  Therefore,

Assuming it's committed this week:

Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>


Secondly, I think it would be sensible for me to review it:

> As far as configure.ac goes, I'm pretty sure there is a better (more
> "standard") way of using PKG_CHECK_MODULES().

Yes, what you have done is rather unidiomatic and seems to rely on
undocumented internals of the PKG_*. macros.  Why not do as was done
for bz2, lzma, lzo2 ?  Printing the errors to configure's terminal is
not normally done, either.

>  The construct also gets
> put next to the other decompression library checks, albeit I think they
> all ought to be x86-specific (e.g. placed in the existing case block a
> few lines down).

I don't understand why there is an x86-specific angle here.

> This follows the logic used for other decompression methods utilizing an
> external library, albeit here we can't ignore the 32-bit size field
> appended to the compressed image - its presence causes decompression to
> fail. Leverage the field instead to allocate the output buffer in one
> go, i.e. without incrementally realloc()ing.

> +    insize = *size - 4;
> +    outsize = *(uint32_t *)(*blob + insize);

Potentiallty unaligned access.  IDK if this kind of thing is thought
OK in hypervisor code but it it's not sufficiently portable for tools.

The rest of this code looks OK to me.  I spent quite a while trying to
figure out the memory management / ownership rules for the interface
to these decompression functions.  This business where they all
allocate a new buffer, and overwrite their input pointer with it (but
only on success), is pretty nasty.  I wasn't able to find where the
old buffer was freed.  But the other decompressors all seem to work
the same way.  Urgh.  In summary: nasty, but, this new code seems to
follow the existing convension.

Thanks,
Ian.

