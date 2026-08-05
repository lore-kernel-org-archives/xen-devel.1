Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692E5C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 13:21:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383477.1626751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbYd-0007IO-Ai; Wed, 05 Aug 2026 13:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383477.1626751; Wed, 05 Aug 2026 13:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbYd-0007IG-6U; Wed, 05 Aug 2026 13:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1383477;
 Wed, 05 Aug 2026 13:21:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wrbYc-0007IA-4C
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:21:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrbYc-006MEa-0M
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:21:17 +0000
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrbYb-00Gga6-2U
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:21:17 +0000
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-39ee96f8047so7161101fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:21:17 -0700 (PDT)
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=Aj2MapBS2f21v+Kw08Px43b1OXbhUlXb81lE0rDAxHA=; b=iOK0r0o1ehJVu/beuwHkNn58kD
	bT8NyB+fjAQ33jxQizlkZUWYUhjswdjwzqQbhG73nigXmLqKG6pJj5RZgixgH+LKewupJjOhp4yVa
	ybn3EgytdS0GNCw8k9Gn1O1SwZdjP7WhA6kcsVvcLQOyGlWAy/sSX0FAC3dANoadTuQw=;
X-Gm-Message-State: AOJu0Yy1beqhDc8GA/BcVXJJxGeu/8yAMOxyyL0bPweqySOslv1F7Yaj
	aGsrxr3Skm3tmW6nE3fwldwzOiEUQkPqG8ToVsOENOXRwkgMYPu9bn0r2Xqoq0C2QRW9+F7aqM5
	NA5uPlyyxTFI3t35NVll/E/PRHStmdEY=
X-Received: by 2002:a05:651c:a388:10b0:39b:1a03:bcb0 with SMTP id
 38308e7fff4ca-39fbb1e30c3mr7617981fa.10.1785936076704; Wed, 05 Aug 2026
 06:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com> <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
 <CAFLBxZYffb3bOS4Zz8m2QX52J6V9-ZonaxPCULoqyRLpPKh-VQ@mail.gmail.com>
 <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com> <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
 <f0394e8a-1ac3-4aa9-bae2-af52380ff07a@suse.com>
In-Reply-To: <f0394e8a-1ac3-4aa9-bae2-af52380ff07a@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 5 Aug 2026 23:21:02 +1000
X-Gmail-Original-Message-ID: <CAFLBxZZk_jc=by6zA4qxc+WVDZ2SkQ2tgoFAfbVaEy8yY5y5DQ@mail.gmail.com>
X-Gm-Features: AUfX_mwH9odwJKdDNjCUl7vL4fcG7q9LlDV3AqgiQdkB-sGx8QqXswN89PeojV8
Message-ID: <CAFLBxZZk_jc=by6zA4qxc+WVDZ2SkQ2tgoFAfbVaEy8yY5y5DQ@mail.gmail.com>
Subject: Re: Dual content (text/plain and text/html) on xen-devel (was Re:
 Linux PV domU with >1 vCPU never resumes after xl save/restore)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 10:41=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jgross@suse.=
com> wrote:
>
> On 05.08.26 14:15, George Dunlap wrote:
> > [Adding back in xen-devel, since this is relevant]
> >
> > On Wed, Aug 5, 2026 at 9:15=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jgross@su=
se.com
> > <mailto:jgross@suse.com>> wrote:
> >
> >     On 04.08.26 11:34, George Dunlap wrote:
> >      > On Tue, Aug 4, 2026 at 6:45=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jg=
ross@suse.com
> >     <mailto:jgross@suse.com>
> >      > <mailto:jgross@suse.com <mailto:jgross@suse.com>>> wrote:
> >      >
> >      >
> >      >     P.S.: George, would it be possible to turn off HTML mails wh=
en sending to
> >      >             xen-devel?
> >      >
> >      >
> >      > I see both a text/plain part and a text/html part in the mail I =
sent;
> >     isn't the
> >      > presence of a text/plain version sufficient?
> >      >
> >      > Obviously sending patches is a different matter; but for that I'=
ll be
> >     using git-
> >      > send-email.
> >
> >     This is a reply to your mail using Thunderbird (which I have config=
ured to use
> >     plain text format as the default, in order to comply with most mail=
ing lists
> >     I'm using).
> >
> >     I don't think Thunderbird is an exotic MUA, but please have a look =
how it
> >     rendered your HTML reply to my original mail. I can't see clearly w=
hich part
> >     was written by me originally and was cited by you in this mail.
> >
> >
> > Thanks, this is what I was looking for.
> >
> > Attached is the message Gmail sent.  As you can see, text/plain uses no=
rmal `>`
> > for quotes.
> >
> > That makes me think that the problem is in Thunderbird. It should eithe=
r take
> > the text/plan part, and reply to that as though it were the only part i=
t had
> > received; or it should take the HTML part, and convert the quotes to te=
xt
> > properly.  Replying in HTML and then rendering it with only space inden=
tations
> > seems like a bug.
> >
> > Thunderbird certainly isn't exotic, but last time I used it it was defi=
nitely
> > under-maintained.
> >
> > You're asking every person who sends an email to xen-devel to remember =
to take
> > an action before sending the mail (or to send *all* mail as text/plain,=
 even if
> > it's not to xen-devel), because your MUA isn't handling the standard pr=
operly.
>
> And you are asking every Thunderbird user to live with bad threading or t=
o
> use a different mail client.

Right, but Gmail is following the convention correctly, using nested >
in plain text and nested <blockquote> in html; Thunderbird (it would
appear) is not following the convention, mis-rendering HTML blockquote
into text as spaces instead of > (or instead of just using the plain
text to reply to in the first place, rather than re-rendering the HTML
into text badly).

> > Is that really reasonable?  Couldn't you tell Thunderbird to ignore htm=
l and
> > only render text/plain?
>
> I did look for a setting controlling that, but couldn't find any. I'm alr=
eady
> using to send plain text only. There seems to be no obvious control to pr=
efer
> text over html in alternative bodies.
>
> On Matrix you stated you are using the same configuration for sending mai=
ls to
> xen-devel since 2006. I'm not sure this is true, as most mails I've recei=
ved
> from you via xen-devel have been sent from your Citrix account, and those=
 were
> all text-only.

The last email I sent to the list in 2024 was dual format:

https://marc.info/?l=3Dxen-devel&m=3D171405222718671

Basically, if I was writing a new email, or replying to one that I was
cc'd on, I tended to use Apple Mail (and Thunderbird before that); but
if I was responding to an email that I wasn't cc'd on, I used Google.
Apple seems to have been configured to send text-only, while Gmail
generally sends dual-format unless I ask it not to for specific
messages.  (I've done so for this message, we'll see what it looks
like.)

 -George

