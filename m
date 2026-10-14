Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427F7C3DA7A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 16:44:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449346.1665211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH25t-0000wz-4i; Wed, 14 Oct 2026 16:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449346.1665211; Wed, 14 Oct 2026 16:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH25t-0000ws-1E; Wed, 14 Oct 2026 16:44:45 +0000
Received: by outflank-mailman (input) for mailman id 1449346;
 Wed, 14 Oct 2026 16:44:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ndesaulniers@google.com>) id 1xH25r-0000wF-RM
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:44:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH25r-00E2c3-86
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 18:44:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ndesaulniers@google.com>)
 id 6acfb167-bab6-0a2a0a5309dd-0a2a4501d5f4-28
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:44:43 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ndesaulniers@google.com>)
 id 6acfb17a-5984-0a2a45010019-d1558034d1c3-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:44:43 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so38176935e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 09:44:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1791996282; cv=none;
        d=google.com; s=arc-20260327;
        b=HEChk0KhBioVZRM/QcIEUHrR68ZEm7sraBhfpPWy9JUb29QzlKkYsAQwhIKZPgbjWG
         wACxGdSM1CICXLl/a9eqaDfhyeJrRb79Vh0FvL3mpf46ojY5/SQmXSMBfRkELZRK4iYt
         sd4xFv6RYLtjDpvjE49KnHfcL0ncs0tZmn6ZRI4kiTGieXeI6l9dGB7HoqWEnhlHaqPq
         l6BW6zJFw/K+IHN237hf+dDEZtw9aKGU5roJXoNCIUCpgDJFMhoBd2PWfHJw7JB6NZma
         DZF2/4JIQph6nP1DCmrZL5kGGxbdqpuxZJ6PYurRlQP1WojuNMouhZun5pQ33vQYfPQs
         q8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        fh=L6H7EPb7hTW+cJ3+u2BMq1G6CAt6RhdOe/toZLWtnj4=;
        b=kux7tFmBSru57IR1eHYRELrFRTQX3Zpx2IFE5f8KRFN0caN+izdFgaOGexAJVi1Bky
         EN4RJvdS2qVA1GVF7NSET64XvTS86rdTRabByGH6Kl+WhIsx0juWU6V4qj4gRpGydfyz
         BhrEOouJftAWU1t7Cj9Eue2AGlMoPj8wjnenNn/SvvbtyRrGmMegH9XDsYttAEL2n0Am
         RmAWUrHGV1/8NzkCUOIkmwd1dTApWZIGxWrhggDOaL6hIfeju0GJKJityluD/QSZk0NL
         Kmri+SzeJW48vyOs1ImKULUH0O0s2Tm9Vm3KapgFVuA2LobRqKctFRtC0wMoqX8QPCkS
         gVmg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996282; x=1792601082; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=QZiQ5K8jQS8c949kRNpughGR9WWy4btWTYHZGNXc654GHpYaL8dHxAh4wIe0laM53f
         VMEnVJsRV6o86NzBY2sy20wn3BmrO9dg1glfQ3Vdw688ZCYUlhI/eEELznpt6ZL2kFn0
         wHY+BYR6/cTM+625kBRC1SqZ+AIqRaUvJUeiovbpEXBKtZ8D1VIxMp1ZIlJv4e9bVCs3
         JQGVANAhRE4oBuF7xLUtstqhCTtJv3+6cCD1C7PlGssQbsLvrPkt7iskv+YwzchT5CfM
         T8QRxxVw7T7VR9MUsNAibUP28CemzTjuzUNn7neN0R9TdIbPEOuaeFqJK4bISywJ3X7Y
         ND3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996282; x=1792601082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=CQTDmgyxTEGHqQgCACe1qC0k3tDUWeobw/vjGx8sEn2kvTNj5Gs2fzU+oP3KO3YC5R
         x0yHiqVsjSNFWj7mdTAv0hS6fE66Uo04KfzM/SiGp2z7CoITsG5XOEbITFEKZxg1zwSz
         lB3hhma/Y82jPq/sb1s2yEoN5oBrCptSOPXSz1NIzf1mVtYmDJyzDsdt6F9omRpRZwGR
         rGvB+41tkzxB7s797YAwV06yrS1BnpvlrDbDdeS6vIdgEAEdDvr8d3cfLXlELQ6AuImM
         Tr93Y2/7kOP/RL0al3JlIjwmh7DfqrErqxyebz7BG+CASgdsVMQarY5JwaDl8E0c8DFe
         dyuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEiKWymhycGp1x7tnPaJ0kxsHzEKUp35Qe55XBLSn5Wg+ZqhaCIYm7JuETu8Rw8ItkgUElwLB2Iz0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK3A9Ke5CSTPJa76ORoVHZX14qQJZXhO8DM96tmWzAHdF6Kbi6E
	9o0iZQJrwSAE4j3boQ0LV9cu4NBMu3u6KqYeJPSqq1384ExKBfwjFsA7VFYFgTihGpG4dIcVYKg
	qilAwbFCspkIp3+1C/qJusNpC8aMxg/FXUFW5jCcm
X-Gm-Gg: AYBFou2SvdscWqUXPLi5zJAr2dLxZbPY1L9krAMGz7XvJr4nBHyqLVcnNThykQwBasv
	C0bv/VHVjUdtubjbSG/f36hrlz1VNtlduxQitGeR2OTaP9BHMCSoupaatZpm+yXABYFpWPA1QL9
	/o/FBJkodzdrhmc5PT+zQ0h3zWpm82rnSKe0nAamkWY9oEP+A6XsnYpnPk0QDC48FCJqdqR+WrK
	X43uumz1dNLC82ap5nu0qz7No6wQ8i8MZGKEO0jD/7VZz7DGS223QPfL1F6wkS/3a0R3J3CSSzI
	oiUfdJNgV5hQfJwVapRlBi10F+GDKWjWSau4x3tUlfZqzQ0FpbOQMMmev3H5Fb8MrAMyY7/EMMH
	xizI3v2zSzQMLsIs/+IRuG3smoDQ3Be2f4sbaDjO+XFmV9GazKC6BM4GabYhyyzLTIXHRw6pOGd
	Vf7KkHuDYRJ2E7J6vHNbEt8ePROJj0paW2zeWYHFw6kpb85iiQJNmb
X-Received: by 2002:a05:600c:354a:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-4a18e3ef23cmr329192565e9.0.1791996281614; Wed, 14 Oct 2026
 09:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
 <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com> <202610140937.B68C8C9AAC@keescook>
In-Reply-To: <202610140937.B68C8C9AAC@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Oct 2026 09:44:29 -0700
X-Gm-Features: AclHuK9LUe2FvddsKjj0vYiArabpm2vrSaqioSsrjl7koqqOn_VyYRh6l-6milM
Message-ID: <CAKwvOdm6nO6skW4-AZtmzpGoNyO126L_AN3Mz2fu23+3QXcshg@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Kees Cook <kees@kernel.org>, Ian Rogers <irogers@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1791996283-1E07B757-BF507E53/0/0
X-purgate-type: clean
X-purgate-size: 1366

On Wed, Oct 14, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 01:28:55PM +0200, Miguel Ojeda wrote:
> > On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com=
> wrote:
> > >
> > > +/*
> > > + * Optional: not supported by gcc
> > > + *
> > > + * clang: https://clang.llvm.org/docs/AttributeReference.html#requir=
e-explicit-initialization
> > > + */
> > > +#if __has_attribute(__require_explicit_initialization__)
> > > +# define __require_explicit_initialization __attribute__((__require_=
explicit_initialization__))
> > > +#else
> > > +# define __require_explicit_initialization
> > > +#endif
> >
> > The LPC slides mention Clang 14+, but from a quick test in Compiler
> > Explorer and a `git log --grep` on the LLVM repository to confirm, it
> > seems the attribute was introduced in Clang 20+, no?
> >
> > If that is correct, then it is not available in all LLVM versions we
> > support (LLVM 17+), so we should add:
> >
> >      * Optional: only supported since clang >=3D 20.0
> >
> > With that:
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Yup, I can confirm, I only see it with 20+ too.

Fix up the comment and have a coin, witcher.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> --
> Kees Cook



--=20
Thanks,
~Nick Desaulniers

