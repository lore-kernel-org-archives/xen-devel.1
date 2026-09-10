Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDE0C79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 11:53:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414511.1644294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4dKk-0007DQ-IR; Thu, 10 Sep 2026 11:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414511.1644294; Thu, 10 Sep 2026 11:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4dKk-0007DJ-Fk; Thu, 10 Sep 2026 11:52:50 +0000
Received: by outflank-mailman (input) for mailman id 1414511;
 Thu, 10 Sep 2026 11:52:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x4dKk-0007DD-2s
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:52:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4dKi-00GXQU-Po
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 13:52:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6aa29a07-8faa-0a2a0a5109dd-0a2a4504af54-30
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:52:47 +0200
Received: from [18.216.144.57] (helo=yurei.relay-egress.a.mail.umich.edu)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6aa29a0e-b57f-0a2a45040019-12d8903994e6-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:52:47 +0200
Received: from adorable-bugbear.authn-relay.a.mail.umich.edu
 (ip-10-0-73-73.us-east-2.compute.internal [10.0.73.73])
 by yurei.relay-egress.a.mail.umich.edu with ESMTPS
 id 6AA29A0D.368B5465.2D1CF5B6.1389004;
 Thu, 10 Sep 2026 07:52:45 -0400
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by adorable-bugbear.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6AA29A0D.959A573.499834E3.1521433; Thu, 10 Sep 2026 07:52:45 -0400
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5b4afc8465eso1316621e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 04:52:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=relay-2 header.d=umich.edu header.i="@umich.edu" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2; t=1789041165;
	bh=4A/Sm//Khghr+jPQXQpc0Lj/noINrShjMGeSg3lkIZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UQsXa+Z0GGj3kEIRwpWU3ERYAcyCeRucFJvQIBXSEiX+RhpC6D3eS9d4BG6khLw0E
	 fHjoYr+IrjwrK4VrEVa/kixQ3Di22+D6MzzGLyR3WbqQBnkcXGJTdLd4Ku9Bi+WGmN
	 Rlgj7z1EQZgB9wafpHHYm1cVZl3H67xbHSEUbHm/pE/cADf10Mg+k9o/rjVtYUoqQz
	 P334Ehasv1FGNZzGcsGX3rvwdKSra5YXTV+97J76VzQV2LBpLVVQy/CLQjS3J2Ph8Y
	 mx5o6sEB6PWj4/GhaF/5EyawBn9SOdReLdaJE5xebqdyNvsr8v8Blmdm6H8qDfbF6/
	 UUYcy7Coqnouw==
Authentication-Results: adorable-bugbear.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.167.47 (mail-lf1-f47.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvBwKvbCG7E2DyoubthIUmT9WiIJzKqyh0tCHcwcMv1zPsolAHYk7L7El7aNfASTSHCezF3h+Hrl33FM=@lists.xenproject.org
X-Gm-Message-State: AFuF++nx0QG8PLt02mIHRISGaf7kloR2zqUfJydFvu0dbtmom7LEN5S4
	7nIWGZXG9YYwMg5+i3MECKLU/JEdHMY0ydq4dSWpjnhe1K66VzZi25Ka0xN4+GLgg5D30BQ+iua
	2VXzsl6M8erANsIaH8ZnaG7uoYmEKzV4=
X-Received: by 2002:a05:6512:1052:b0:5b8:7eb7:4772 with SMTP id
 2adb3069b0e04-5b87eb74a23mr1673504e87.46.1789041163038; Thu, 10 Sep 2026
 04:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-10-ecc269f268b7@xenproject.org> <5b5a8303-b018-4b5a-a4d2-6eabd4c48559@suse.com>
In-Reply-To: <5b5a8303-b018-4b5a-a4d2-6eabd4c48559@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 10 Sep 2026 12:52:30 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZLnEJc8cZ_GpDyF=kSPc0CR2Yv=cmhVewpUv87Ztn8iw@mail.gmail.com>
X-Gm-Features: AcwNN1XEuUdGg9JjkwRTFGMF2o6xPdqN41S6wa-urmUTwP046OabGq5YIn9yA5Q
Message-ID: <CAFLBxZZLnEJc8cZ_GpDyF=kSPc0CR2Yv=cmhVewpUv87Ztn8iw@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] x86/domain_page: drop redundant
 create_perdomain_mapping() call
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1789041167-528C9B50-93AA8241/0/0
X-purgate-type: clean
X-purgate-size: 1797

On Tue, Sep 8, 2026 at 4:55=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.09.2026 11:43, George Dunlap wrote:
> > --- a/xen/arch/x86/domain_page.c
> > +++ b/xen/arch/x86/domain_page.c
> > @@ -256,7 +256,7 @@ void unmap_domain_page_irqoff(const void *ptr)
> >      do_unmap_domain_page(ptr, true);
> >  }
> >
> > -int mapcache_domain_init(struct domain *d)
> > +void mapcache_domain_init(struct domain *d)
> >  {
> >      struct mapcache_domain *dcache =3D &d->arch.pv.mapcache;
> >      unsigned int bitmap_pages;
> > @@ -265,7 +265,7 @@ int mapcache_domain_init(struct domain *d)
> >
> >  #ifdef NDEBUG
> >      if ( !mem_hotplug && max_page <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_E=
ND - 1)) )
> > -        return 0;
> > +        return;
> >  #endif
> >
> >      BUILD_BUG_ON(MAPCACHE_VIRT_END + PAGE_SIZE * (3 +
> > @@ -277,9 +277,6 @@ int mapcache_domain_init(struct domain *d)
> >                        (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
> >
> >      spin_lock_init(&dcache->lock);
> > -
> > -    return create_perdomain_mapping(d, (unsigned long)dcache->inuse,
> > -                                    2 * bitmap_pages + 1, false);
> >  }
>
> At this point rather than removing this, all of what is done ...
>
> >  int mapcache_vcpu_init(struct vcpu *v)
>
> ... in this function (per-domain-mapping-wise) would want moving into
> mapcache_domain_init(). The present arrangement, aiui, is a leftover from
> when d->max_vcpus could change post-domain-creation. Question is - would
> that go against further ASI plans? (Likely the answer is "yes".)

Yes, because soon we'll be introducing per-vCPU mapcaches, which will
very much want their own initialization function.

I can add a line to this effect in v3.

 -George

