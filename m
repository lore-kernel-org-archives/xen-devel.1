Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77CEC5DF7D
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2026 10:44:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1397335.1634610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxMjD-0004qd-4x; Fri, 21 Aug 2026 10:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1397335.1634610; Fri, 21 Aug 2026 10:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxMjD-0004qV-1G; Fri, 21 Aug 2026 10:44:03 +0000
Received: by outflank-mailman (input) for mailman id 1397335;
 Fri, 21 Aug 2026 10:44:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <arthurborsboom@gmail.com>) id 1wxMjB-0004qP-Fg
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 10:44:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxMjA-000UIL-9f
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 12:44:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <arthurborsboom@gmail.com>)
 id 6a882bd6-8faa-0a2a0a5109dd-0a2a4505bdfc-44
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 12:44:00 +0200
Received: from [209.85.160.49] (helo=mail-oa1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <arthurborsboom@gmail.com>)
 id 6a882bef-4cb1-0a2a45050019-d155a031c12d-3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 12:44:00 +0200
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-4560d6f82edso815319fac.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 03:43:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1787309038; cv=none;
        d=google.com; s=arc-20260327;
        b=DIXucL+DLyVi2AC6P/fAJz2YvnuBhCeIQYoy/l7RCXbEvVssRWyh7iQpdTB8kwJuWj
         2MCz3TNxp7jkQZAKgl3IFMTvYi04kGS5fMyj5QGkfRzLoz4qJK1ACLpi08D7qcGLYM+5
         cO40IP+b6w60ErFp2hzWmASWtW6zIU2JRokg/teAyZmCpRSfDEgHG5MadZNGZGTbgwSS
         vyl8WfZL8DNLPCiUV5ldijC7nJBWfjkt2B2ZfLjxiE8Oph4pkdaPqpOnptFddwF/hrLu
         M3tUr4fmbFstYjEZYnYD5UHppitdsqw4oo094xls94oPvP34ABQv4lJws2pAvy4kfeVh
         N5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZOWR9w+g70hihMLaUF4mY1ts2YmnaEWXRZ8CiJLICRQ=;
        fh=7sFv6QZAJlpg3YTCZX0B+j1POgKz6Tmh3lBntxDYpAE=;
        b=YoS95d+6gg7o56NcdeYSxXBTCFs8ikzbvu+VNAQ/bnYnjqBwHOFwJQ+t417KmzIy6N
         WktkMTHvUanfAV2ejk5mL0yTdPknhvqaIznQ+TmgzsqnWa9TJ6VjbNsRK8JtKvFbH4Oi
         QPatsh9/MPz0si0xp0b31IYcmUcMLq2o23GnrzTM7zTRQ81V3tKNwDDbpE6XnTAuSQuv
         CBoDKGBh8rtEgt/ou2z2qkByhGVroDDJ2LpkXlPikQOZh7juOdN/529gvzMrwYAP6bSr
         t0Or5LgXE2k8Ip4V1Igy6Ax24Eg+hV72OlGTQZeKZYHQL+i5J8tn88+mvm47vFaQxZ+5
         Bqqw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787309038; x=1787913838; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOWR9w+g70hihMLaUF4mY1ts2YmnaEWXRZ8CiJLICRQ=;
        b=Lyau5IL7uzE605tWizAtn6HPYvqDxQzC6iM7T04Z42MOb52fvfYayLH/5XNgJ47zNQ
         A+K/AtNaNJAVzBSuD9i6+BDuYoxzJhpP/W/wIBGfT9nqhy0UGGDWP62f4tIAS03hnrwh
         2H9lfgHx6fArKVRhjeDPQXY75BvdeC7cMNPSGF+IKoWbWsp9lM1C3TgX2TtEK97aAZJ0
         /xCuWSfVK2tzeFKFIDeA9NRcn0d1ZnNlYhbhzdKwbMHKfqC1h1TG9km09Hz+EJEH0Tof
         ELXtC81GkdqA3DWULyaqseQCE+00422tx+MMKmwtve+RHbEFnDE4mrqANL+uOucYcnic
         IluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787309038; x=1787913838;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZOWR9w+g70hihMLaUF4mY1ts2YmnaEWXRZ8CiJLICRQ=;
        b=X9uVunLSCYSMh9aOx3FuKNfVP8AyhjPq8Z+l5X+6iukC+Vc9gfws/VH2T7EGNeF+tl
         RZ892A+HUrk5YAi8rPl5XwJJNnTIRjW9CsGjlH3ZqgkZwqai4MfRUgvHI495XdtdaXyx
         MK1v2YAsj3lhucwXEtRbC6mv0WIvP/t1IirJbV1eDocvb4QTRc7D8UA5erVuNeV2UAhd
         2XAmxYAL9VizxG8nhEdRZ+8/ydug40ISknleWCPE7oHL7YgPbNBJpe2opWHfd+IRnQW5
         rGwN8RKKoFC+zrn0X4EvWcDb+xOvFR4f2UGxqO10WOU/3GLhwhQ1HrDH3KiayXgK3x/g
         8Rqg==
X-Gm-Message-State: AOJu0YxAOfYQ2O33qx8ZOm7cDg8slNbbPNlhBIcclhcivQaOAoR0Aenf
	fxMwpvfrTeBdYa6EVOSBf0aWg3FOVo5qQZg1EcNP+enKw9c/1mRyqzOONEpGssbQiKYhV9zBmYo
	BYC9s5QTfvcvCJcu0Aix+3J/Oq+v4ZPk=
X-Gm-Gg: AR+sD12jVGbsr9ZYMOoWDTjtYSQb9FrS8ygmDrxdYNjykJApQS0/BeLnmt1sbERKqSz
	ZBYGdGOa1qyMTeUQtp9+UwazxZnWa8BAe94Xfblun91/PZCfQAViqpk0RF4t666h+cldHecdvJC
	jJ95p61EHVRZsmHI6yu3JhRMdqM4dAyhhK82Lwa/Ognro8NYXBwriJinwD24k3pwH+buVR1jHGc
	iResHbwNBSNwNLYqRJqK52UKnCf/Dk0ljLdjaSOlRe/ITzG7UwwVyrSDnPLK5Gu0RIKT20JlGnJ
	AlWI8FhkCgkEmKGOGCl95znVs3iWN5pXbGtEMog08O47lfQjxaeOWe6rmYCCTBfRSYrWGSVLx/N
	3NEOG9HNJ9fwCt+g1YS3TJ2ejmUsm0ChTuPTiAd8KA1mT9E9I2Ud4uw8IhYNxifPR6HBHwTlq/V
	a21TFFgZP3x0s=
X-Received: by 2002:a05:6808:6f85:b0:497:d1e7:5e90 with SMTP id
 5614622812f47-4b2ef484825mr5208862b6e.18.1787309038430; Fri, 21 Aug 2026
 03:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <CALUcmUkm7eL2RtqAn3fJxrMdY4aj8AYzkFZfs7LVwntSLa44Wg@mail.gmail.com>
 <4a1b5392-93b9-4b9e-bf65-3fb280f385fa@suse.com> <CALUcmU=QNXA8gs8JYy01tLVOH-y8mjZM-GxKzOCoA_3e2QFVwQ@mail.gmail.com>
 <83abdfca-70f3-479d-b7ed-929567c4254d@suse.com>
In-Reply-To: <83abdfca-70f3-479d-b7ed-929567c4254d@suse.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Fri, 21 Aug 2026 12:43:40 +0200
X-Gm-Features: AcwNN1Xgl6KFcWGcJH9v3WhpgwhY6UMMbE8UobaFWUGJpE8_HmHns0rOxb3Gnoc
Message-ID: <CALUcmU=QyfQyPL6U9yc2T-HRL1d6cArp5N5O3ob3TyqxHTabtA@mail.gmail.com>
Subject: Re: [BUG] Linux kernel crash in amd_smn_init during PVH Dom0 boot on
 AMD EPYC
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1787309040-24D1E2A1-ED118A07/0/0
X-purgate-type: clean
X-purgate-size: 2839

Hi Jan,

The fact that you take the time to tell your side of the story, tells
me you are a different person, than the initial message gave the
impression to me.

I guess we started off on the wrong foot.
Nevertheless, maybe the open source development world is not my place to be.

Thanks for your answer and indeed being one of the people who actually
answers mails from strangers/newbees.
This message won't arrive on the mailing list, because I have
unsubscribed myself, so it is just for you :-)

Enjoy your day.

On Wed, 19 Aug 2026 at 09:52, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 19.08.2026 09:09, Arthur Borsboom wrote:
> >> Well, a pretty natural question: What amount of research have you done yourself?
> >
> > Lovely response. You really know how to motivate people and welcome
> > them into a community.
> >
> > It has taken me about 1,5 day of work to find out why the screen
> > remained black, to determine where the problem was, how to retrieve
> > potential info by a serial-over-LAN console, subscribe to the mailing
> > list, and create this bug report to help.
> >
> > But don't worry, I won't do any debugging anymore for the Xen project,
> > you have made sure of that. No need to respond.
>
> Well, no, I can't really skip responding here. Yes, there was a risk that
> you may take my reply as "not welcoming". Yet please can you try to see
> both sides of the medal? From your initial report, which effectively
> wasn't much more than the dumping of a log with the traces of a crash,
> how could anyone have concluded how little or much work it was for you to
> get there. As much as you have felt offended by my reply, I consider such
> reports as an abuse as well: This is xen-devel@, not xen-users@, and I
> think it is only fair for us to expect that reporters check whether their
> problem was reported before, and whether therefore a fix already exists.
>
> In fact, looking back - you did identify the earlier report. I clearly
> scrolled down too quickly, and I'm sorry for that. The question then is,
> though: What did you expect from re-reporting the issue to xen-devel@?
> A patch for the issue is in flight, yet that patch to be taken is
> nothing any of the Xen developers really have much control over: It's
> not Xen interfacing code in Linux which is affected. So I continue to
> have the feeling that this wasn't helpful at all, and my putting time
> into finding the (apparently) most recent variant of the pending fix was
> not valued / pointless, as I ended up offending you be a non-technical
> aspect of my reply.
>
> As a result I wonder: Would it have left you with better feelings if
> your mail was left entirely unresponded to (as would end up reasonably
> likely, according to my observations over many years)?
>
> Jan

