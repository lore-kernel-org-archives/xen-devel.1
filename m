Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B71C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 14:54:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6146208CA
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 14:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6146208CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74121.133206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43FT-0008UN-NM; Mon, 25 Jan 2021 14:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74121.133206; Mon, 25 Jan 2021 14:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43FT-0008UG-KD; Mon, 25 Jan 2021 14:53:47 +0000
Received: by outflank-mailman (input) for mailman id 74121;
 Mon, 25 Jan 2021 14:53:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l43FS-0008UB-W1
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 14:53:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l43FS-0006UP-TC
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 14:53:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l43FS-00005X-RT
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 14:53:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l43FP-0003xo-Mo; Mon, 25 Jan 2021 14:53:43 +0000
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
	bh=hHjdIEUUd14VBY86siihg9JHM87NwZclT7fN0/wDh7Q=; b=Q5d5aF0EAA3ErgoUZhGOWDVmy8
	uX4VfCLa+etnCL/FBe1kDPQ/XrIHW6qWko5DW1g4iyEy5dzHuHjdJR8bUW2OSV5fV4D2R/qTR3WGO
	ZJgme/HkoTfBK+WrUnQMC0PTGetRdlw5dn77fC7TXBquwSav6aE3azCzetRLrD+VuylE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24590.56183.458644.60628@mariner.uk.xensource.com>
Date: Mon, 25 Jan 2021 14:53:43 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    M A Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels
In-Reply-To: <6895299a-f2fd-7090-d0fa-dc7b2e54d1ba@suse.com>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
	<f23d219f-ea52-e472-b95f-2a7e359d44cc@suse.com>
	<24590.44019.51460.33930@mariner.uk.xensource.com>
	<d541007c-9537-ba53-02f7-8ea90e9c89cf@suse.com>
	<24590.52459.194044.857442@mariner.uk.xensource.com>
	<6895299a-f2fd-7090-d0fa-dc7b2e54d1ba@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels"):
> On 25.01.2021 14:51, Ian Jackson wrote:
> > I mean, the parts where you examine libzstd_PKG_ERRORS.
> 
> The only thing I make use of is it being (non-)empty. Do you
> really think that's a problem?

It's highly unusual.   Conceivably it might be empty even if
pkg-config failed.

> >  AC_CHECK_LIB([lzo2], [lzo1x_decompress], [zlib="$zlib -DHAVE_LZO1X -llzo2"])
> > +PKG_CHECK_MODULES([libzstd], [libzstd], [zlib="$zlib -DHAVE_ZSTD $libzstd_CFLAGS $libzstd_LIBS"])
> 
> No, that's what I did initially, resulting in libzstd becoming
> a strict requirement (i.e. configure failing if it's absent),
> as reported by Michael Young.

Well how about passing "true" for the fourth argument then ?

> > I mean the inclusion of $libzstd_PKG_ERRORS in the output.
> 
> I see no point in the warning without including this. In fact
> I added the AC_MSG_WARN() just so that the contents of this
> variable (and hence an indication to the user of what to do)
> was easily accessible.

This is not usual autoconf practice.  The usual approach is to
consider that missing features are just to be dealt with with a
minimum of fuss.

> The [true] in the 4th argument is there to prevent the default
> behavior of failing the configure process altogether. You'd
> see autoconf's default there only if the argument was absent.

I see.  Thanks for correcting me.  See above.

> > If you want a warning I think it should be a call to AC_MSG_WARN in
> > ACTION-IF-NOT-FOUND.
> 
> I didn't to avoid the nesting of things yielding even harder
> to read code.

In your code it's nested too, just in an if rather than the in the
macro argument - but with a separate condition.  Please do it the
"usual autoconf way".

> > This suggests to me that a warning for missing zstd is not necessarily
> > a good idea unless it is conditional for x86.
> 
> Well, okay, I'll drop the warning then.

Thanks.

> > IDK what the zstd-defined endianness is.  I guess it must be LE for
> > your patch to work on x86.
> 
> This field is not part of the zstd output, but gets appended
> to the output by the Linux kernel build system. IOW its
> endianness gets defined by Linux; the text in the respective
> Makefile says "littleendian".

How odd.  OK.

> > How unfortunate.  I have also hunted for some existing code and also
> > didn't find anything suitably general.
> > 
> > I did find this, open-coded in xg_dom_core.c:xc_dom_check_gzip:
> > 
> >     unziplen = (size_t)gzlen[3] << 24 | gzlen[2] << 16 | gzlen[1] << 8 | gzlen[0];
> 
> Okay, I'll copy that then.

Could you make a macro or inline function in xg_private.h[1] rather
than open-coding a copy, please ?

[1] Or, if you prefer, a header with wider scope.

Thanks,
Ian.

