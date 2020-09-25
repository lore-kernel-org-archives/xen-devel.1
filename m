Return-Path: <SRS0=eoLF=DC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EE2C4363D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2020 18:09:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B478B2086A
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2020 18:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISJMFhY1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B478B2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLs9Z-0008Vd-U2; Fri, 25 Sep 2020 18:09:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vp+E=DC=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kLs9Z-0008VY-0g
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 18:09:05 +0000
X-Inumbo-ID: c2a44e0e-7c26-4192-93b3-42f8ba7137f3
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2a44e0e-7c26-4192-93b3-42f8ba7137f3;
 Fri, 25 Sep 2020 18:09:04 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x69so3812620lff.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2020 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8YodnV3V8MGQ9RJGPnnajJX8K2KjIXhS7wO23JPvGfE=;
 b=ISJMFhY1V//gIms8WysgQpBSmkbOZvbhShpqKqd3CFj/Tbv/cBPK0UmiBfAz0XvThy
 kDAAkqnDGeNMAx6kAmNPZa25UqTt/fdzzNuT4vTnw12jV3ZppUQAq7FYGKZs7p0rXPBp
 bpszSlg0Bj/Rpc8uhsaWSA9MEu0S4HdgQ7yL2p9sT5r0HUHNybURvCZ2GyVf0Ey/OEPL
 bPGs9FBOzb3DLk4yfvMpCym18Nyn0Af8QgamJ49HfHce0EQv0w6g00MjDDU26nsk+h1Z
 vQGhRqdbPTRhjEdzE2tv6QfcsjiJa5hC4U0pGdv2FqDq5aadkw0uxU4aOJgxnfnj4DDH
 5utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8YodnV3V8MGQ9RJGPnnajJX8K2KjIXhS7wO23JPvGfE=;
 b=lmYks1RBwIG5MTMNJwIhMgV/gyXALY7Av/HP9XarqsNHISoXyDyspeWajZfNpRKgWw
 MDbFpdB/XfsoVKZBqFy7/sEpLQxTXiv1nULYw7KJHpfP2e7MkdnsBTCunrFj1OpLu+1v
 Oiui4Dj2qenhC65AjbjhHlEV6Uv4PPol7WrwnojLlIMcOJaM7X4xw/7UH1LhAWIAaJ1i
 zWlnVbq9X+aMZQNYG1WdM2a957W0Bal35pgJ6fwnHUr7dYlhy7BPHPqHI0zdzSZVNI36
 1gDBuf22S1mYMQsr8xPlWniakdxBOqknGBRG8GJk47IHUfp409q9BngnhSsILFQjjRc6
 bblA==
X-Gm-Message-State: AOAM5315WU7Nne4am/ZXLLT4rjwHewCsxeXxOst/5k5yEf5iNMhekuFZ
 aepIq0B5ELUXul98ekKSZv7cgFtxilU6JG3LoU8=
X-Google-Smtp-Source: ABdhPJyuAewyP5Pf3uxYSM5ymxuNOVuLO+eFdS1IZ2jTeC21JRkKvBu+5TFJmWBLCnfK9ntq6HMLVlFpmUyGBekSHA4=
X-Received: by 2002:a05:6512:34d1:: with SMTP id
 w17mr32718lfr.30.1601057342729; 
 Fri, 25 Sep 2020 11:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
 <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
 <3ad0529d-ad55-8864-1df2-193eaf104c1f@xen.org>
 <6d6d7550-8847-267e-49f2-0ca098ef97ad@suse.com>
 <2a62f5e4-9915-bcd7-05b3-77663c995a13@xen.org>
 <9adeac3b-2b0f-6e9d-aa82-fd966e984fa0@suse.com>
 <52dba8e8-5976-48a2-7a74-ddf877880c6e@xen.org>
In-Reply-To: <52dba8e8-5976-48a2-7a74-ddf877880c6e@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 25 Sep 2020 14:08:51 -0400
Message-ID: <CAKf6xpv2ZoOV-VhhtkocvzppFX=ch0XfC7e_Y4sjuwb3T+rtww@mail.gmail.com>
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>, 
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, 
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>, 
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Sep 25, 2020 at 12:02 PM Julien Grall <julien@xen.org> wrote:
>
> Hi Jan,
>
> On 25/09/2020 16:36, Jan Beulich wrote:
> > On 25.09.2020 16:33, Julien Grall wrote:
> >> On 25/09/2020 14:58, Jan Beulich wrote:
> >>> On 25.09.2020 15:16, Julien Grall wrote:
> >>>> Fair enough. I would still like to consider a way where we could avoid
> >>>> to hack xsm_* because we have the interrupts disabled.
> >>>
> >>> Well, from a conceptual pov it's at least questionable for XSM to
> >>> need any memory allocations at all when merely being asked for
> >>> permission. And indeed the need for it arises solely from its
> >>> desire to cache the result, for the sake of subsequent lookups.
> >>>
> >>> I also find it odd that there's an XSM check on the send path in
> >>> the first place. This isn't just because it would seem to me that
> >>> it should be decided at binding time whether sending is permitted
> >>> - I may easily be missing something in the conceptual model here.
> >>> It's also because __domain_finalise_shutdown() too uses
> >>> evtchn_send(), and I didn't think this one should be subject to
> >>> any XSM check (just like send_guest_*() aren't).
> >>
> >> Maybe this is the first question we need to answer?
> >
> > Indeed that was the question I asked myself before putting together
> > the patch. Yet I have no idea who could answer it, with Daniel
> > having gone silent for quite long a time now. Hence I didn't even
> > put up the question, but instead tried to find a halfway reasonable
> > solution.
>
> IIRC, XSM is used by OpenXT and QubeOS. So I have CCed them to get some
> input.

I think the send hook exists because send is its own distinct
operation.  While most common usage could be handled by just checking
at bind time, the send hoor provides more flexibility.  For instance,
the send hook can be used to restrict signalling to only one
direction.  Also, a domain label can transition (change) at runtime.
Dropping the send check would latch the permission at bind time which
would not necessarily be valid for the security policy.

Am I correct that the assertion mentioned in the patch description
would only be seen in debug builds?

Thanks,
Jason

