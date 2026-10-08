Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07F6CA6015
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:01:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443795.1660903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvEO-0003U5-NN; Thu, 08 Oct 2026 21:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443795.1660903; Thu, 08 Oct 2026 21:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvEO-0003Ty-IY; Thu, 08 Oct 2026 21:00:48 +0000
Received: by outflank-mailman (input) for mailman id 1443795;
 Thu, 08 Oct 2026 21:00:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEvEN-0003Ts-8a
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:00:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEvEM-003N7t-36
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:00:46 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEvEM-00ERMn-2y
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:00:46 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5ba7ed32ccdso6632537e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:00:46 -0700 (PDT)
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
	bh=BHNmwhHspsXjbVq1MwXZ29V6oW901isliLvupE29bdo=; b=Eh6Oqk6rj3lg476Y8OybzNnLPy
	vTX2Ft4ptHRFaA3Y6i0RTsed++HIAslsLcSVt9Th1u6571pgziyVTUh8UUzZzQmTC92cQzaiGMLvw
	Mk5612fBqlBI5FU1wf+gLXNiYUpDozIr947GTftZh2t1IxdDGvf4xhb9p6UKyZkUHaVI=;
X-Forwarded-Encrypted: i=1; AKwUvBwyOKLROMoGxcvErZw8GB6EOtegJpyXr5c3BZWhubL82BXKXn82t4BiXaGqnaluIGw6hrUNDOOBpKQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK5zE+7Qenrg1qKjSeoa12cr+t9AQyhtq4j7WAnjWxwMUDPm+U0
	TCCYgPvOXAxj+oqbCeYcZbbkff0K1RZuxqDBeDkLtYd6kkLWD8DcbtDz4GgZC7ixQxDkVuktDR7
	7FwXbgUNQPQEUu47hA/dl41fluB1tMp8=
X-Received: by 2002:a05:6512:1194:b0:5ba:3fb8:1827 with SMTP id
 2adb3069b0e04-5bcd06de59bmr2609729e87.22.1791493245812; Thu, 08 Oct 2026
 14:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-8-gwd@xenproject.org>
 <7bced27f-5391-4120-b9cf-b97bb88758ca@suse.com>
In-Reply-To: <7bced27f-5391-4120-b9cf-b97bb88758ca@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 8 Oct 2026 22:00:33 +0100
X-Gmail-Original-Message-ID: <CAFLBxZYi+k3Zn7ALqzATsWA+XAXkPvAxeq-Z4pSca3PMocUrZQ@mail.gmail.com>
X-Gm-Features: AclHuK8tQjUV8hPeDeijLFaQArX23oiUw3phOTs2-y32JTi9WqjVbgJNX68-Wkw
Message-ID: <CAFLBxZYi+k3Zn7ALqzATsWA+XAXkPvAxeq-Z4pSca3PMocUrZQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/18] x86/hvm: introduce per-vCPU L3 page-table
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:40=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 07.10.2026 12:40, George Dunlap wrote:
> > @@ -1835,7 +1853,7 @@ static int promote_l4_table(struct page_info *pag=
e)
> >      if ( !rc )
> >      {
> >          init_xen_l4_slots(pl4e, l4mfn,
> > -                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
> > +                          d, NULL, INVALID_MFN, VM_ASSIST(d, m2p_stric=
t));
>
> Nit: Take the opportunity and re-flow the statement (i.e. move more args
> onto the 1st line)?

Ack

> > --- a/xen/arch/x86/pv/domain.c
> > +++ b/xen/arch/x86/pv/domain.c
> > @@ -127,7 +127,7 @@ static int setup_compat_l4(struct vcpu *v)
> >      mfn =3D page_to_mfn(pg);
> >      l4tab =3D map_domain_page(mfn);
> >      clear_page(l4tab);
> > -    init_xen_l4_slots(l4tab, mfn, v->domain, INVALID_MFN, false);
> > +    init_xen_l4_slots(l4tab, mfn, v->domain, v, INVALID_MFN, false);
>
> This being PV-only code, don't you want to pass NULL here? The descriptio=
n
> talks about this, but (a) it's not quite clear why PV32 would want handli=
ng
> differently from PV64 at this point and (b) in sh_make_shadow() you do pa=
ss
> NULL unconditionally.

This is actually left over from the previous iteration of the series
which supports PV guests; and apparently it would be a lot easier for
implement per-vCPU pagetables for 32-bit PV guests, since the L4
doesn't belong to the guest.  But it's outside of the scope of the
current work.

At any rate, I'm going to try passing a single vcpu, as Roger
suggested.  That restricts toolstacks to not being able to promote PV
L4s before calling XEN_DOMCTL_max_vcpus, but that seems fine to me.

 -George

