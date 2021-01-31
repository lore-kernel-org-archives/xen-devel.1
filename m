Return-Path: <SRS0=5OYV=HC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB88C433DB
	for <xen-devel@archiver.kernel.org>; Sun, 31 Jan 2021 17:22:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3EFB61481
	for <xen-devel@archiver.kernel.org>; Sun, 31 Jan 2021 17:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3EFB61481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79373.144446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6GQb-00036c-Pr; Sun, 31 Jan 2021 17:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79373.144446; Sun, 31 Jan 2021 17:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6GQb-00036V-MS; Sun, 31 Jan 2021 17:22:25 +0000
Received: by outflank-mailman (input) for mailman id 79373;
 Sun, 31 Jan 2021 17:22:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+A3g=HC=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1l6GQa-00036Q-PM
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 17:22:24 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 747c0482-d059-4ca1-9cda-26c67b92e2be;
 Sun, 31 Jan 2021 17:22:23 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m22so19562986lfg.5
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 09:22:23 -0800 (PST)
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
X-Inumbo-ID: 747c0482-d059-4ca1-9cda-26c67b92e2be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=38mDXl4HxVSt6bH36Q3sea0vO8kLUw4mr0l5Ac2TSrs=;
        b=c9lvLWEHPflBNd7P3pklMadbcUBDr73cFvrCXgxKJkf3sExcEZ8glZ1gC2QxOcAeWP
         79d3u2TP8tLWjhyslNS0z5ry5aTU15fEWzgUO0++JDttSeq69t6R8xxHMZALEFzpzKgK
         hEbXe44f3JkSJDW5aeJwRUcwmcOS0E7+oUASrw6xLxMwW0kMM6RzSTASWgsVZ+9dkjeQ
         eiOFyUJB6nuO4MXcGnDuE5U1JLkDiE5PmQ1I6PLGKBcF6iI4lpghvBMUKTf3MkAiD0w4
         QZQC1tpXunU2qxkc4iyb/VM/MAS6hvfBCDisgNj2EiLVBX6cGXKx25SP/a7zdydx1Hij
         66iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=38mDXl4HxVSt6bH36Q3sea0vO8kLUw4mr0l5Ac2TSrs=;
        b=oXqG3R2bJulTm2rh8RWPyP+Qa0mXiIU1807TILeJfiNCYw69CPjgUMZme0eOYKiguB
         gaxc7+poEXPrpzOWDMZlmgafB/JvQsBnx4+WWpiNTgQ9/2SWf05iTgIMF+WHmxQNIjMB
         4h1lODQWDki4TkIAWC8Dj0M8vQtX/wes/RzkX4LXu7ulaVpUdZeX1CCSGvo/55CFaelE
         MZQvHfZ0GubO8xig6+ty1pjZ2TqI+2hc4bV8eZf2shZ70/IqSptmJtDWHNfgABF8GZpJ
         a66PbU3TeZoeEnayGy40m9XFSKrUok4qsWMPSVdilCqSTbmyJZOGIZhwlqKk/zA+Re4Q
         w1Yw==
X-Gm-Message-State: AOAM533/KblApedkY6o+bvefBSDE1no88tnqooy0Sdm2w0k0MVEp92Z9
	rA1+CWs1pLseMnqrEbsxH9f96gT1pqH8kkFa5DU=
X-Google-Smtp-Source: ABdhPJzNP1XSSygZR6YXN91nVNKzcrR0FSDDIdn9sOOSU9DNEfm+cPg49aGzN3dtN6WqtW7Xxvnd18DlqZfMTwThhqY=
X-Received: by 2002:a19:804f:: with SMTP id b76mr4370348lfd.491.1612113742748;
 Sun, 31 Jan 2021 09:22:22 -0800 (PST)
MIME-Version: 1.0
References: <2nft2kipqg.fsf@aragorn.infrastructure.cah> <983b87d6-edb8-21ea-7d6f-f653f5c0d048@oracle.com>
 <20210129005129.GA2452@mail-itl> <44068a70-8940-824b-9e39-b800635b92c7@suse.com>
 <CAOQxz3w-2aJn1dKbQRG8_m8f3_pN0zSXzYkfyU7cvo34vF6P=g@mail.gmail.com>
 <16a2f371-1c39-13f5-c214-e054b08abbab@suse.com> <20210130232513.GA6354@mail-itl>
In-Reply-To: <20210130232513.GA6354@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 31 Jan 2021 12:22:11 -0500
Message-ID: <CAKf6xpsjaQdhgKPp=pDz==-qmrVt7ng1Qq328bZvTywdS+2KVw@mail.gmail.com>
Subject: Re: Problems starting Xen domU after latest stable update
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	Michael Labriola <michael.d.labriola@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Sasha Levin <sashal@kernel.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 30, 2021 at 6:25 PM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Jan 29, 2021 at 03:16:52PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> > On 29.01.21 15:13, Michael Labriola wrote:
> > > On Fri, Jan 29, 2021 at 12:26 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
> > > > If the buggy patch has been put into stable this Fixes: tag should
> > > > result in the fix being put into the same stable branches as well.
> > >
> > > I've never done this before...  does this happen automatically?  Or i=
s
> > > there somebody we should ping to make sure it happens?
> >
> > This happens automatically (I think).
> >
> > I have seen mails for the patch been taken for 4.14, 4.19, 5.4 and 5.10=
.
>
> Hmm, I can't find it in LKML archive, nor stable@ archive. And also it
> isn't included in 5.10.12 released yesterday, nor included in
> queue/5.10 [1]. Are you sure it wasn't lost somewhere in the meantime?

It probably would have gotten in eventually, but I made the explicit
request to move things along.

-Jason

