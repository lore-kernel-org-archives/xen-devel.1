Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C41CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 11:24:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446161.1662224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE8z-0001Vt-Uj; Mon, 12 Oct 2026 11:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446161.1662224; Mon, 12 Oct 2026 11:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE8z-0001Vm-RT; Mon, 12 Oct 2026 11:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1446161;
 Mon, 12 Oct 2026 11:24:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGE8y-0001VT-HZ
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:24:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGE8y-00000001iPh-30qi
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:24:36 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGE8y-00000009uLw-04d2
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:24:36 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3a87e23860cso20658851fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 04:24:36 -0700 (PDT)
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
	bh=QWZy3W3yptZT0CyQ5v4gXTq83jYQjZai1yKqhMOT2XQ=; b=acRSEp6xYLmnv8d9ROqZdongyQ
	GYEi4DPgbXnSHWaiqA7diPdJLzaBw100xHfpYGkSGXZczmLHsPVKSQDVRvZ88aUPrQmsrSAUayz93
	bpOJ5XQtu34y5ADYSadGgjQcMmIW7MT5UZgorRnj2gzotRBv726NxD0UrV9UQxdk+6ck=;
X-Gm-Message-State: AFq9FYI53SzVSD1Jmc2X8Nll6xJIvH8sRVzwZmaWci4mqJPF1lo6tERC
	EAtzy17v7a9SZ3ADHHh3ITRNmt4cyFPxGb4Au41eZ5he5HZRHIQg6c3fYcf5WihzniR2iHPwsVW
	xwzDJVYFEo2iwoyXZhmSQpHZZoanVrRI=
X-Received: by 2002:a2e:be87:0:b0:3a9:d2c3:5d5d with SMTP id
 38308e7fff4ca-3a9d2c363b1mr11396111fa.14.1791804275330; Mon, 12 Oct 2026
 04:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <d1a67360-838e-4d9b-8b91-1ebfd9e6f613@suse.com> <CAFLBxZbOTQ=BoAU6Q=kweUSTVi_MxnDANTKSVn7TSgZ+YZ6vgg@mail.gmail.com>
 <059a456c-9f84-40d3-8f88-7c9599abb04d@suse.com>
In-Reply-To: <059a456c-9f84-40d3-8f88-7c9599abb04d@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 12:24:22 +0100
X-Gmail-Original-Message-ID: <CAFLBxZYQu7Dpn3UVhM11rBRah2qw3TAjbapbojM+CorhVB9WGA@mail.gmail.com>
X-Gm-Features: AclHuK88zxbAsd5Kktu5L20ITHul8mzziGdwftxi0oPN1g-sfb6ho2zcSbeqStE
Message-ID: <CAFLBxZYQu7Dpn3UVhM11rBRah2qw3TAjbapbojM+CorhVB9WGA@mail.gmail.com>
Subject: Re: [PATCH 03/15] x86/setup: break out E820_RAM accumulation
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 11:23=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 12.10.2026 12:20, George Dunlap wrote:
> > On Mon, Oct 12, 2026 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> We already have two instances of this, and we're about to gain a third=
.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > Reviewed-by: George Dunlap <gwd@laleolanguage.com>
>
> Thanks, yet to double check - did you really mean to use this more privat=
e
> email of yours?

*Sigh*  No, just autocomplete.  Please use this one:

Reviewed-by: George Dunlap <gwd@xenproject.org>

