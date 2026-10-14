Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E644C3DA7A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 16:41:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449338.1665193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH22v-0008Vi-CI; Wed, 14 Oct 2026 16:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449338.1665193; Wed, 14 Oct 2026 16:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH22v-0008Vb-9k; Wed, 14 Oct 2026 16:41:41 +0000
Received: by outflank-mailman (input) for mailman id 1449338;
 Wed, 14 Oct 2026 16:41:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <irogers@google.com>) id 1xH22u-0008VK-G7
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:41:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH22t-004Xrw-Sv
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 18:41:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <irogers@google.com>)
 id 6acfb097-8faa-0a2a0a5109dd-0a2a450ab470-30
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:41:39 +0200
Received: from [209.85.160.172] (helo=mail-qt1-f172.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <irogers@google.com>)
 id 6acfb0c2-f2d2-0a2a450a0019-d155a0ac9040-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:41:39 +0200
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-533202fe429so1288901cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 09:41:39 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791996098; cv=none;
        d=google.com; s=arc-20260327;
        b=OAOAO1AGIoELK0SFEyO41SduL8KlZ87ioDH/zCSiCSGYWkzGDt94RIKaoXP3o7YGHm
         XfHsnTTKOE8ox5r5A9Gk0s2NkYDnsWlp6LiJ2kqKG5QN0S8SSJUgDMntjs3HbTOohwBr
         /dqSAbQDqV1fuVDpC68U7II6Ht+LiGcmINF0KOIbGTgx5zeW3rmYYKaI1qoOjoIHHeg0
         UPQ6i5G0vo0H3XH1zqKPyP/PmV+0kJs1z1Mlk4y3S3Ge0KHBYWYyNt5UaYkcGlhy6OBh
         02UDbp1sXNKNJ6bCV7uRAjHaKiDMiyYyC/CtnK2VZBiePfTU8Ig3h58DrraL4fl9b06r
         6ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        fh=7Sl6RuB46XcB3hLo2hiDeMAC2zJfk/KndZQSgKU/DKk=;
        b=p08iKYvinnGnAkabL0PtJsV2R+EUuJAS7GQthfqNF80hM+X3Yw5IUS5FZX+d0Bvscr
         ZDlojeDy7KmD2oz2wIP7s9jCL8nezyiyeQbnmNsdgdhjCkdvpfW0fRBwWZrXE//40zXO
         S6pJZ9bBqTnyTlFknZynDB1tHfcP90UjNRrvlDlhXXzN3Ixl3/6ciYhP3S56hpupPksZ
         YOatmHx/ztl95lxI/Z/KBSvrJDv+VuzVaoM4/gwW1bUCK0KBXesjqXTa8FQd0T+jZ2Ug
         nP1R2N7+/eoNnS7Xq6kCcQ4vOhniHH1KbtpAxJEcxVldEWtcI8nnY7MfyUMm86JeJCWM
         TFCQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996098; x=1792600898; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=mV5voZC6j/JUq6UFKEpBbYepSECknASdjXq5LiTti9+UJsz+TJjQq/qZy0/TX6dl0g
         xAF07Xp9NWxQIhC1sZl56T+PaFosUP9yE5vzUgJpauYzUg0xdOC1xGhfbjH073/BrR2U
         zWE5E54x5SHBnRTLJDui/2ocQ52z/HvvWQh53+ABzcqg+GwF6QdgKkx4dNjxMCd6B1Au
         xNLsiCstGZWqLJ5GONw/aa7SFr7jBYUvZtLEs2xdtjynJtTWLg8QKMDfCRGGOzyNYD/z
         fwGkXXTVm/No7+kvZlBVfhcXJjAm6U3nI1/3xW8o9OodmokUvN+BxCGFR4txlGPU4xTY
         BtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996098; x=1792600898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=tTqETMpM0bWBtFvljkzG3uqq0rm/ibTTl04AaaSvsnTP9JYlkjphbC97sF+aKJRVi1
         ktJ2NtkiwbOBXeTmCfNbRPpJSTGnfflyy6Qd0rsJCrspQkv8ln74u3dBOlFGbINUGCb3
         Iao52SEoi4g/wZyMOAp06IzNO6uGoGY7QKes4gwASXHOnmCEHOLfn0Tk960dBjiIG/MT
         j0btanczvhZqJPmoSuNnOPwA5q0UET9k9ChSbU3+mj277wH+51h+uq3RS8dJEinsnroo
         ZvElOo+Pd2wWZi+WpOmLmpxf6Yzd2qSfiI7ii/Y4WltagkCH4JrOqyQ8NcBb/hFdoCPV
         +9Hw==
X-Forwarded-Encrypted: i=1; AKwUvByb7kDELpJPA3ZceIN3Xp3wv6NlKBGq+XQb3TkmvCYQS49BX2KgmIYjYrfBXpgRev4M4wRtlo3WJ+k=@lists.xenproject.org
X-Gm-Message-State: AFq9FYItkeTQqxid8BE0NpUaX584P9OQxkXiqu1ydN0Fxi55ffRxtNGg
	FHVIfbFob639ql7V28PrOoEvZzk1oqgJotxW02Dsy0cT1xqlxQgh9c/Y+w39fgkIBwD7GRke1Qz
	Au0S1SI0sQh1qJ8cbtZdP5/bdUHgrlogeYkmQT6ai
X-Gm-Gg: AYBFou3ahl+GutT/4YF+45w+TDLx4kRrV74CPF4j5zUS7ycTCap7pxhtOVUqinFUgnj
	jilVrMcg5hWz6b4Aas9PeqZRU1URDOqGMkn0PoCx5Gy4pvyrCRo2OIntDaD4N0b6DySpgMoBmPe
	bT1J/QXaVIy4ZDRDH6esN9nCkoBf5Q5pC4HQL6CJ1c4DEG7CiUGW32/ztn9D9D7fULRsHzp9OUC
	crYkwWBCMR5j2ZyDoC9ONn/0/TYpTKNZaxlqN1SY7U9ZCBLL8da0pkMBQiYe2kr76Sllc6vj0uG
	QWkYkWQeTM6ZkA1MME+FW7ZyUSA8HuQBCom85qpaHBArLVxD2J9u7dvLkS9xgcgCWLxoN0ZkIWi
	NVSQ+aSfTAA==
X-Received: by 2002:a05:622a:1108:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-5360573c96fmr14813151cf.5.1791996097367; Wed, 14 Oct 2026
 09:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Oct 2026 09:41:25 -0700
X-Gm-Features: AclHuK8_g-YOJgMR77fEpf5RTsveF4u_ERdXz6lvoN6wh_uF7KP8ZsaUSV1ti8A
Message-ID: <CAP-5=fVLWh4uay2HGy6DOpZmtTr5WAd-TehAkN+P-pQgq_BZhg@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
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
X-purgate-ID: tlsNG-4011c0/1791996099-595C3CFC-38BD9B84/0/0
X-purgate-type: clean
X-purgate-size: 2983

On Wed, Oct 14, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 07:36:41AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Oct 13, 2026 at 03:39:35PM -0700, Ian Rogers wrote:
> > > Clang supports the 'require_explicit_initialization' attribute on str=
uct
> > > fields to enforce that the field is explicitly initialized when an
> > > aggregate object is constructed, emitting -Wuninitialized-explicit-in=
it
> > > (enabled by default) if the field is omitted.
> > >
> > > Following discussion at the Linux Plumbers Conference [1], this serie=
s
> > > introduces __require_explicit_initialization in
> > > include/linux/compiler_attributes.h and applies it to
> > > struct kobj_type::release.
> >
> > Cool, sorry I missed that talk.
>
> Yeah, I'm really liking these compile-time checks. :)
>
> >
> > > As Documentation/core-api/kobject.rst notes:
> > >   "One important point cannot be overstated: every kobject must have =
a
> > >   release() method, and the kobject must persist (in a consistent sta=
te)
> > >   until that method is called. If these constraints are not met, the =
code
> > >   is flawed."
> > >
> > > Annotating struct kobj_type::release caught 30 struct kobj_type
> > > definitions across the tree that omitted .release:
> > > - Patches 2-10 fix 10 struct kobj_type definitions where dynamically
> > >   allocated kobjects, ksets, or enclosing structures were either leak=
ed on
> > >   kobject_put() or freed prematurely before kobject release (risking =
a
> > >   use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=3Dy).
> > > - Patch 11 annotates struct kobj_type::release with
> > >   __require_explicit_initialization and explicitly sets .release =3D =
NULL
> > >   (with explanatory comments) on the remaining legacy struct kobj_typ=
e
> > >   definitions whose kobjects are static, per-CPU, or embedded in devm=
- or
> > >   parent-managed structures.
> >
> > Sounds great, but let's fix up the users before adding the attribute.
> > Looks like some of these need another version so it might take a bit of
> > time to get them all merged.
>
> I'd really like to have the attribute available, and I've got at least
> one user I can apply today that don't require fix-ups (seq_file), so
> if Miguel is okay with it, I'd like to snag patch 1 and send it with
> my seq_file "first user" for this coming merge window so it's available
> starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
> other subsystems to be able to use it. And the kobj fixups can continue
> in parallel. Does that sounds okay?

I'm happy with that. I'm working to address/incorporate the other
feedback for a v2 of this series, but I can drop individual patches
that have already been merged. Thanks, everyone, for the positive
reception in getting this landed, I plan to follow up with patch
series for the other uses I found.

Thanks!
Ian

> --
> Kees Cook

