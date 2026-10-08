Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9C2CA600C
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 13:28:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443341.1660695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEoA5-0000Ao-SK; Thu, 08 Oct 2026 13:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443341.1660695; Thu, 08 Oct 2026 13:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEoA5-0000Ah-PN; Thu, 08 Oct 2026 13:27:53 +0000
Received: by outflank-mailman (input) for mailman id 1443341;
 Thu, 08 Oct 2026 13:27:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEoA4-0000Ab-D7
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 13:27:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEoA4-003EAc-00
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 13:27:52 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEoA3-00Akv5-34
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 13:27:51 +0000
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5ba4180a65aso2605263e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 06:27:51 -0700 (PDT)
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
	bh=ufySbFGG/woxT3Fdl094NGQeH59b6ZPti6MO8yVVDe4=; b=kmzVRFcNRNKh2tQpAJM9C7Tuw/
	96dDThGXjZtC+3E9zfx+bYef4kOI1Y6l5IdbHQBYCrGIKWCXzTC58OOsS9MCWndZ+0rWVQ8pDiW75
	I0s8FsrbC32k2sMew0+RazHlwTn5GRi47rrCEg2/kvWxc4Bm0by9+LMSUccEcMtG6sws=;
X-Gm-Message-State: AFq9FYLz6vactL9jJaHxpCLpSuArWMKAMFm10ctRLQIxRJfIU9INaLTA
	Fq7WaSBQYeiTUcd5I2PnIRnONKUtWVhRAwgiBn+pB/uvjqWuSq6tb+zDFiaSfwZrqXy/EJUgpWa
	mSyzvrv5KgSSjJ5lQFOGk1vWV9GtwQ30=
X-Received: by 2002:a05:6512:3f0f:b0:5bc:c9e3:d59c with SMTP id
 2adb3069b0e04-5bcd074202dmr2180689e87.56.1791466070852; Thu, 08 Oct 2026
 06:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-4-gwd@xenproject.org>
 <asZsNzkRSctOxCNs@Mac.lan>
In-Reply-To: <asZsNzkRSctOxCNs@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 8 Oct 2026 14:27:38 +0100
X-Gmail-Original-Message-ID: <CAFLBxZbhAsio=6TgLLDdqJx543ddAbxBfbdx+LFLOcVa286aGQ@mail.gmail.com>
X-Gm-Features: AclHuK-U2QvNLYFAown4_8wYopYmzXZPBnKe8PITuQtkRkRcxL2uHazou-IdTrc
Message-ID: <CAFLBxZbhAsio=6TgLLDdqJx543ddAbxBfbdx+LFLOcVa286aGQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] x86/mm: prepare destroy_perdomain_mapping() for
 per-vCPU perdomain areas
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 4:58=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:36AM +0100, George Dunlap wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > We want to change per-domain mappings to be per-vCPU mappings.  In
> > preparation for that, we want to arrange that
> > destroy_perdomain_mapping() work either with a single perdomain area,
> > or with a per-vCPU perdomain area.
> >
> > The one remaining caller, free_compat_arg_xlat(), is already in a vCPU
> > context, so we just need to change the parameter from a domain pointer
> > to a vCPU pointer.
>
> Without the linear mapping usage this is now a non-functional change,
> I would possibly state that on the commit message.

Ack.

> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, C=
laude Code:claude-opus-5-5
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger@xenproject.org>

Thanks,
 -George

