Return-Path: <SRS0=2Bwx=I3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4358FC433C1
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 18:55:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDA376044F
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 18:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDA376044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103230.196983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQx2R-0008Lo-7w; Mon, 29 Mar 2021 18:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103230.196983; Mon, 29 Mar 2021 18:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQx2R-0008Lh-4F; Mon, 29 Mar 2021 18:54:59 +0000
Received: by outflank-mailman (input) for mailman id 103230;
 Mon, 29 Mar 2021 18:54:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOTl=I3=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1lQx2P-0008Lc-27
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 18:54:57 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8694785c-ea39-4eca-8079-7fd693ad22a3;
 Mon, 29 Mar 2021 18:54:56 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h13so15375871eds.5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Mar 2021 11:54:56 -0700 (PDT)
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
X-Inumbo-ID: 8694785c-ea39-4eca-8079-7fd693ad22a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3QKxrTMNgufUy9T4qTbt2zx0FBa7195d7HDDgcLICbw=;
        b=KpR/zy6oCESXlkpAVgQEe2TeR8mT9Jbd1LxyWLrJjPbzvhUz5lilCG3f6QaGH37au2
         pWvimOFUofEE4aw4WiiERVZmG75TIaejo+YAf8mxRe5mp2nIUfmIy+scUrKxzv8gq+IN
         HQwoht5bWbSlW8t6tLiOW6rEVkJoK2l2GWmm01eKb5RK0Dqgmb11AaNjO3D2YyIVz1pr
         gE85H1qaNAjO3j/+dKPHtO0qWJ+wZAjYvJYDYkAZBsWwQJa9l6g0B+klIHm6K0DfMnO7
         AfVGG6LcZC053AYOq8+e0C1mBXePLk4bckMM/81UHl9hiBMj0/z7k0V5iWwfqAmAGYqR
         DXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3QKxrTMNgufUy9T4qTbt2zx0FBa7195d7HDDgcLICbw=;
        b=QWsXEn2Yt5MMPwkVELbNTwxUY5IrKUi6ufXSmT8wVqmpIG37Hj18mwk4jIMZOLZY7B
         xsx3kfooy5UN53WA81pKKORN7g/z/x7KXnZboCUd3Df3/kFcCNV6Epu2uZyk7a+KXdt9
         92ZkVh1IG/FfOQCXVNBvMpsDOSUL0WTWOcYDzIE6PnZ7fowwRM8AaYCgsdSZ/VS0NAK+
         pGu75GJvKqMKjKHJL7hd57nEpJfD2SAk6Bzn5XpfrZ/TY+e2X5+cg8KExxVUhHH1Y7Mh
         eqr8K+IDJ3PBLeWWnlm56HfrqSVSh7j8kihg1E+XHeKqyqtG7ihv/dGFXgSOSk0e3QpL
         8PNQ==
X-Gm-Message-State: AOAM533oduaBdVRmuhAYQONH9Z3THaDe22MxdJbrT+dYNviBm+/LVHEs
	PWfGJh/mMTdMjHmwSiO57b4feJkRSPeHKnQjXXo=
X-Google-Smtp-Source: ABdhPJwkDf2RWVJxIf6uJnWokW+UeBvmt8CNhrEjZskCl3cp1XG8jvXAqMGwITz+/jUXLaHVYJr4jL3KvX4aSRuQBLA=
X-Received: by 2002:aa7:d503:: with SMTP id y3mr29501858edq.142.1617044095402;
 Mon, 29 Mar 2021 11:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210329161457.345360-1-george.dunlap@citrix.com> <20210329161457.345360-3-george.dunlap@citrix.com>
In-Reply-To: <20210329161457.345360-3-george.dunlap@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 29 Mar 2021 19:54:44 +0100
Message-ID: <CAJ=z9a0DxKKkLGMDK1nisVsefwE=8RQcD8M4vpOO1QopjzZtjw@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd
 compression support
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Ian Jackson <ian.jackson@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

Hi George,

On Mon, 29 Mar 2021 at 17:15, George Dunlap <george.dunlap@citrix.com> wrote:
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8c89212f14..538eae611c 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - ARM SMMUv3 (Tech Preview)
>   - Intel Processor Trace support (Tech Preview)
>   - Named PCI devices for xl/libxl
> + - Support for zstd-compressed dom0 and domU kernels

Looking at the log, the feature looks x86 only (at least the dom0 part).

Cheers,

