Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B796CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:49:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446274.1662364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFSl-0003KG-KK; Mon, 12 Oct 2026 12:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446274.1662364; Mon, 12 Oct 2026 12:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFSl-0003K9-HL; Mon, 12 Oct 2026 12:49:07 +0000
Received: by outflank-mailman (input) for mailman id 1446274;
 Mon, 12 Oct 2026 12:49:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGFSj-0003K1-Om
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:49:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGFSi-00000001k4L-2Q5A
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:49:04 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGFSh-0000000CIY8-3hr7
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:49:04 +0000
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3a9e87ba696so5411001fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 05:49:04 -0700 (PDT)
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
	bh=3wUQOSxxdzxF2mncukRVGSRyY1m2K54g4QF1AUkAiWg=; b=vi6jW1x0oRJosUJiclNCYOalXo
	Jcdd+c4De/TuNA0kOXnn6J8ejJapIZ9Ppgd5CBK03R71Q4q9iuShtIDmF+JB53GjoFqsTj6Qpb6OW
	glnIScFFQXle1POBpxPLOwTGJ+SJa+8TF4n00M18DBNn0y4yIdsNiH0FJVqF84nza/X8=;
X-Forwarded-Encrypted: i=1; AKwUvBxh38n1aKMZ8L0JnAxLStFW5pY1LZNaWeTzF5699o8/KEKTU6oMwW0pWVMQJ5ZYOaDVdFtx5SjKzRo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKheuCXggsRZQUGqmPMDBBe7izFYKoLhRe5XOoLhq6dKM4pweky
	S6k+3pxzi6K50Cev1Qj6VnvBR8M8VCU4Gvd2ObxZobbBjN2m3F2f07S7CDvrXOZnjZQub+A9Og/
	SkY6aZQtmzJyltsU+t/u4XUo5Jlm6/KU=
X-Received: by 2002:a05:651c:510:b0:3a9:f130:6ede with SMTP id
 38308e7fff4ca-3a9f1306fa2mr2353671fa.13.1791809343144; Mon, 12 Oct 2026
 05:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-7-gwd@xenproject.org>
 <3441a775-7081-43cf-aed9-56d51658c32e@suse.com>
In-Reply-To: <3441a775-7081-43cf-aed9-56d51658c32e@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 13:48:51 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZTDC6k=aEQwKE4M2YEBFeDO3LufKDkRY1uq6VFEyO8Jw@mail.gmail.com>
X-Gm-Features: AclHuK-XINh4VFZkrCFzDjjYW-z_g2q1cRq1xF8_C-OcYiGR8n42Tq9zcRAwYLo
Message-ID: <CAFLBxZZTDC6k=aEQwKE4M2YEBFeDO3LufKDkRY1uq6VFEyO8Jw@mail.gmail.com>
Subject: Re: [PATCH v3 06/18] x86/spec-ctrl: introduce Address Space Isolation
 command line option
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 07.10.2026 12:40, George Dunlap wrote:
> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -86,6 +86,13 @@ bool __ro_after_init opt_bp_spec_reduce =3D true;
> >
> >  static bool __initdata opt_ibpb_alt;
> >
> > +/*
> > + * Give each vCPU of an HVM domain its own per-domain area (vCPU-PT). =
 Off by
> > + * default until the feature is complete.
> > + */
> > +bool __ro_after_init opt_vcpu_pt_hvm;
> > +bool __ro_after_init opt_vcpu_pt_hwdom;
>
> I'm a little worried of this name, which doesn't distinguish PV and PVH. =
Yes,
> the variable name is already long-ish, yet I think inserting "pvh" is goi=
ng
> to help.

Ack

>
> > @@ -487,6 +494,62 @@ static int __init cf_check parse_pv_l1tf(const cha=
r *s)
> >  }
> >  custom_param("pv-l1tf", parse_pv_l1tf);
> >
> > +static int __init cf_check parse_asi(const char *s)
> > +{
> > +    const char *ss;
> > +    int val, rc =3D 0;
> > +
> > +    /* Interpret 'asi' alone in its positive boolean form. */
> > +    if ( *s =3D=3D '\0' )
> > +        opt_vcpu_pt_hwdom =3D opt_vcpu_pt_hvm =3D true;
> > +
> > +    do {
> > +        ss =3D strchr(s, ',');
> > +        if ( !ss )
> > +            ss =3D strchr(s, '\0');
> > +
> > +        val =3D parse_bool(s, ss);
> > +        switch ( val )
> > +        {
> > +        case 0:
> > +        case 1:
> > +            opt_vcpu_pt_hwdom =3D opt_vcpu_pt_hvm =3D val;
> > +            break;
> > +
> > +        default:
> > +            if ( (val =3D parse_boolean("hvm", s, ss)) >=3D 0 )
> > +                opt_vcpu_pt_hvm =3D val;
> > +            else if ( (val =3D parse_boolean("vcpu-pt", s, ss)) !=3D -=
1 )
> > +            {
> > +                switch ( val )
> > +                {
> > +                case 1:
> > +                case 0:
> > +                    opt_vcpu_pt_hwdom =3D opt_vcpu_pt_hvm =3D val;
> > +                    break;
> > +
> > +                case -2:
> > +                    s +=3D strlen("vcpu-pt=3D");
> > +                    if ( (val =3D parse_boolean("hvm", s, ss)) >=3D 0 =
)
> > +                        opt_vcpu_pt_hvm =3D val;
> > +                    else
> > +                default:
> > +                        rc =3D -EINVAL;
> > +                    break;
>
> While personally I like the reduced redundancy from placing case labels
> like the default: one here, Misra rule 16.2 wants us to not use such.
> Note that as written there's no violation, yet iirc Andrew keeps asking
> for figure braces in such constructs. I think we're better off not
> introducing new instances (the rule is marked clean, so with the braces
> added we simply can't, unless the file is excluded from scanning).

OK.

Thanks,
 -George

