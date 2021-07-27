Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECC2C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 15:54:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF12861B67
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 15:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF12861B67
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161261.296106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8PPZ-0000t8-4X; Tue, 27 Jul 2021 15:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161261.296106; Tue, 27 Jul 2021 15:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8PPZ-0000t1-1X; Tue, 27 Jul 2021 15:54:29 +0000
Received: by outflank-mailman (input) for mailman id 161261;
 Tue, 27 Jul 2021 15:54:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8PPX-0000sv-G3
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 15:54:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8PPX-0008So-Bq
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 15:54:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8PPX-0004Uv-As
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 15:54:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8PPU-000317-1Z; Tue, 27 Jul 2021 16:54:24 +0100
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
	bh=QfXVOGGz8gvxq4NUS2VpngTMTUooxp6LGj1PSobXVS0=; b=1wxHvKo04F92ccJ+v/83ld6Da9
	3L6Q1IygwCcCOJK/QbAU+PAvaC+g+IgsUT4zGbucBg6VHJxBXYuWhJ4c6/B+9d78Nj1Ob+batK3an
	lK0p+YAmC2ouDz5JpBJu24vZWWi3qPboVEPUI4TFslS6GLS+8hM8j2UKRLIHQLW7EZbY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24832.11311.830641.31267@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 16:54:23 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] autoconf: fix handling absolute $PYTHON path
In-Reply-To: <YQAmVs+hOSr22M69@mail-itl>
References: <20210602033206.720860-1-marmarek@invisiblethingslab.com>
	<24832.4209.469293.942341@mariner.uk.xensource.com>
	<YQAmVs+hOSr22M69@mail-itl>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Marek Marczykowski-Górecki writes ("Re: [PATCH] autoconf: fix handling absolute $PYTHON path"):
> On Tue, Jul 27, 2021 at 02:56:01PM +0100, Ian Jackson wrote:
> > I'm not sure this logic is right.  I haven't looked at this area in
> > detail but it seems confusing to me.  I don't quite understand why the
> > preexisting code calls AC_CHECK_PROG followed by AC_PATH_PROG.
> 
> I think it tires to get absolute path into $PYTHON, also in case it was
> autodetected (the AC_CHECK_PROGS call). Which I think it another place
> that is too magic (see below). I'll try to simplify it further.
> 
> > I also don't understand why we ever need an absolute path for
> > $PYTHON-config.  Why don't we just rely on PATH lookups when in invoke
> > it ?
> 
> This is a good question. I tried to preserve AC_PATH_PROG to keep
> existence check there, but that's rather misused.

The existence check is probably helpful to avoid a late failure.

> > > --- a/tools/configure.ac
> > > +++ b/tools/configure.ac
> > > @@ -368,7 +368,6 @@ AS_IF([test -z "$PYTHON"], [AC_CHECK_PROGS([PYTHON], [python3 python python2], e
> > >  AS_IF([test "$PYTHON" = "err"], [AC_MSG_ERROR([No python interpreter found])])
> > >  AS_IF([echo "$PYTHON" | grep -q "^/"], [], [AC_PATH_PROG([PYTHON], [$PYTHON])])
> > >  PYTHONPATH=$PYTHON
> > > -PYTHON=`basename $PYTHONPATH`
> > 
> > I'm not sure this is right.  I think we sometimes try to look at
> > PTYHON to see if we should be doing python-3-like things or
> > python-2-like things, and maybe that logic depends on PYTHON just
> > being the basename.

I remembered what I was thinking of and it isn't in xen.git, it's in a
personal project.  I grepped xen.git for PYTHON and python2 and
python3 and didn't find anything that behaves like I was suggesting.

> If that's the case, those should be fixed too. PYTHON variable can
> accept way more possibilities than just "python" and "python3". And
> furthermore "python", depending on distribution, may point at python2 or
> python3.
> That said, few test builds work with this change, so it's unlikely
> something important relies on PYTHON being just the basename.

I think we do, however, need to rely on it being suitable for having
`-config` appended, to find the dev build runes etc.

The last change to this area was by me in
  9caed751db9110c785fd6b1def89d808baa1d907
  tools/configure: Allow specifying python to be found from path

My previous self doesn't seem to have left any notes about why I felt
it necessary to still split the thing back into a "directory and
executable name".  Also that text is wrong since the directory does
not seem to be extracted at all.  I surmise that I just did that
because the existing code did it, and assumed that womething somewhere
else wanted it.

Perhaps this was some support for build arrangements which predate
python-config ?  Those are surely doomed by now.

> Actually, the only place that needs full path to python, is filling
> shebang. Everything else can rely on $PATH and use whatever is given in
> $PYTHON (either absolute or just the basename). Especially, there is no
> place that needs absolute python-config path, if $PYTHON points just at
> the base name.

Right.

Ian.

