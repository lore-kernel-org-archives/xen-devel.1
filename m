Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8039FC4338F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:56:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4830A61AA5
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4830A61AA5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161223.296031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NYz-0004fa-Le; Tue, 27 Jul 2021 13:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161223.296031; Tue, 27 Jul 2021 13:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NYz-0004fT-Il; Tue, 27 Jul 2021 13:56:05 +0000
Received: by outflank-mailman (input) for mailman id 161223;
 Tue, 27 Jul 2021 13:56:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8NYz-0004fN-2Q
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:56:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8NYy-0006Y7-VY
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:56:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8NYy-0002LA-Ue
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:56:04 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8NYv-0002gl-Nj; Tue, 27 Jul 2021 14:56:01 +0100
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
	bh=eSUbdmjzwOo6l4onKRUqJWrCu4omXNZl/RV6C1flKic=; b=TvjxOifDlkFFVI6ywvrKx/sUEu
	RbsS33V7neWG1LCVo7o80H6M+lFZCydlNBtv/EVnqUlDc+JGWNnZugl4O7ZyJExceXXPkTOnV2YuB
	Sq6m3ShcA+Rm2fSmEUBsR99dwHk68uASn5f+3RprkmJ/S5DoRMNaP0PlGcWS7MXc47OU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24832.4209.469293.942341@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 14:56:01 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] autoconf: fix handling absolute $PYTHON path
In-Reply-To: <20210602033206.720860-1-marmarek@invisiblethingslab.com>
References: <20210602033206.720860-1-marmarek@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Marek Marczykowski-Górecki writes ("[PATCH] autoconf: fix handling absolute $PYTHON path"):
> Don't strip full path from $PYTHON variable. This is especially
> relevant, if it points outside of $PATH. This is the case
> for RPM build on CentOS 8 (%{python3} macro points at
> /usr/libexec/platform-python).
> 
> For this reason, adjust also python-config handling - AC_PATH_PROG
> doesn't work on already absolute path, so make it conditional.

Sorry for the delay replying and thanks for trying to improve this
area.

> -AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
> +AS_IF([echo "$PYTHON" | grep -q "^/"], [
> +    pyconfig="$PYTHON-config"
> +], [
> +    AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
> +])

I'm not sure this logic is right.  I haven't looked at this area in
detail but it seems confusing to me.  I don't quite understand why the
preexisting code calls AC_CHECK_PROG followed by AC_PATH_PROG.

I also don't understand why we ever need an absolute path for
$PYTHON-config.  Why don't we just rely on PATH lookups when in invoke
it ?

> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -368,7 +368,6 @@ AS_IF([test -z "$PYTHON"], [AC_CHECK_PROGS([PYTHON], [python3 python python2], e
>  AS_IF([test "$PYTHON" = "err"], [AC_MSG_ERROR([No python interpreter found])])
>  AS_IF([echo "$PYTHON" | grep -q "^/"], [], [AC_PATH_PROG([PYTHON], [$PYTHON])])
>  PYTHONPATH=$PYTHON
> -PYTHON=`basename $PYTHONPATH`

I'm not sure this is right.  I think we sometimes try to look at
PTYHON to see if we should be doing python-3-like things or
python-2-like things, and maybe that logic depends on PYTHON just
being the basename.

Contrary to what I said about leaving $PYTHON-config unresolved and
expecting it to be looked up at the time of use, maybe the right fix
is simply to change python_devel.m4 to use $PYTHONPATH-config instead.

Also using echo | grep -q ^/ seems poor style when case is available.
I think we can rely on case.  But I see that's in the old code
already.

As you can tell, trying to write down what I think doesn't seem to
have unconfused me.  Maybe you can explain ?  Or maybe I need more
coffee.

Thanks,
Ian.

