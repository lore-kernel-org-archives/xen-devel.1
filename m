Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5C3C5AD4E
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 08:53:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387250.1628510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtLku-0001Bp-KD; Mon, 10 Aug 2026 08:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387250.1628510; Mon, 10 Aug 2026 08:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtLku-0001Bi-HV; Mon, 10 Aug 2026 08:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1387250;
 Mon, 10 Aug 2026 08:53:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wtLks-0001BZ-Jj
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 08:53:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wtLks-00EdxF-1d
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 08:53:10 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wtLks-001BkH-0e
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 08:53:10 +0000
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5b0f19bea2fso1675167e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 01:53:10 -0700 (PDT)
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
	bh=r1aA22qzwxz1bQAx6+Cvagz7egcF6XzF1zJxl+kpU2g=; b=FD5RHpb99RW+ivE3vpPO7FN0/a
	lj7oRsPzYdXH9zdXGFVIait2s/TtE8+K5S0bebOb36crZjgOW05jEfXT6/mGd7y6Yip/VKfL94TVq
	XtU1PRpupnw8IJ5lr4typFSxKMJmet/QhzI1M9YXFdzcNN9/fXV/EIBjs0W35f8+1Rj4=;
X-Forwarded-Encrypted: i=1; AHgh+Rr+oSphyZLvEIYCmw9YNvT0mADyKGm22t3KXBP7UGQWffdQLJ09kNxara6N1yp01+695XRpg2xudFc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySX8KPtVKx0q3/SMGFz4tj+dUkzDOKwvUVRdFO/El2Ux9MCrDL
	U132lQeD7llHOXgae28b3V26FROLDjpyljN9w/v2gMglf1PxkYm0T9oHJ+6lLEfgkjXECoKvc1W
	fIKhT6NaXzJM/i6rzuTnpm3l42IRWEac=
X-Received: by 2002:a05:6512:1294:b0:5ae:bd66:553b with SMTP id
 2adb3069b0e04-5b3092e3ca5mr2591964e87.38.1786351989102; Mon, 10 Aug 2026
 01:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com> <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
 <CAFLBxZYffb3bOS4Zz8m2QX52J6V9-ZonaxPCULoqyRLpPKh-VQ@mail.gmail.com>
 <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com> <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
 <0f821f2d-70ea-4616-a82e-73a6fe19829e@suse.com> <a9478ddd-247c-46f0-a18c-4bd3140df668@suse.com>
In-Reply-To: <a9478ddd-247c-46f0-a18c-4bd3140df668@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 10 Aug 2026 09:52:56 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZm12tJCR=BkY-9cwcmzJQ4cp0M4j9z==rSWZFxgOmZ3w@mail.gmail.com>
X-Gm-Features: AUfX_mwg3PTOPUZCBTiSB7Si3ubD5yD3n8sM02G1vEYIRJzzj9hrSt2wIjsU7Bc
Message-ID: <CAFLBxZZm12tJCR=BkY-9cwcmzJQ4cp0M4j9z==rSWZFxgOmZ3w@mail.gmail.com>
Subject: Re: Dual content (text/plain and text/html) on xen-devel (was Re:
 Linux PV domU with >1 vCPU never resumes after xl save/restore)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 3:03=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
>
> On 05.08.26 15:28, Jan Beulich wrote:
> > On 05.08.2026 14:15, George Dunlap wrote:
> >> You're asking every person who sends an email to xen-devel to remember=
 to
> >> take an action before sending the mail
> >
> > You're by far not the first one to be asked this; you're the first one =
to
> > have an issue with being asked, beyond some companies' IT getting in th=
e
> > way.
> To put it differently: there is a statement on the Xen wiki asking to sen=
d
> only text emails to xen-devel. I'm not the one to ask to relax that rule.
> If you want this rule to be dropped, you probably should raise this topic
> for discussion.
>
> IMHO it is fine to question such guidelines, but just saying you don't
> believe they make sense and therefor ignoring them, especially after havi=
ng
> been asked to obey them, is kind of rude.

The rule seems ambiguous to me.  Here it is for those following along
at home [1]:

> Please post in plain text (i.e. not HTML), word-wrapped to somewehere aro=
und 72 characters.

It never says "only".   Recall that frequently, mailers are configured
to send *only* HTML emails; or, they send HTML emails with plain-text
attachments that do not reflect everything in the HTML version of the
email (perhaps because people actually use the mark-up to convey
information).  Given that, the rule could mean two things:

1. Please post at least plain-text, and expect that the plain-text
version will be the only one read.  Do not post HTML-only, and do not
post an email where the plain text is difficult to read (mis-formatted
or garbled) or is missing information present in the HTML version.

2. Please post in *only* plain text; mail to xen-devel should contain
no HTML attachment whatsoever.

Either way, it seems to me like the expectations could be clarified.

It looks like I can send plain-text only by selecting it for each
individual message.  I may try to do that, but knowing the way my
brain works, I wouldn't be surprised if I frequently forget.

 -George

[1] https://wiki.xenproject.org/wiki/Asking_Developer_Questions

