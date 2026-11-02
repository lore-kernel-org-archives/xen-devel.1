Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13257606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 03:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAxQ713c
Received: from list by lists.xenproject.org with outflank-mailman.1467637.1676700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNiM9-0006rT-3I; Mon, 02 Nov 2026 03:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467637.1676700; Mon, 02 Nov 2026 03:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNiM9-0006rM-0c; Mon, 02 Nov 2026 03:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1467637;
 Mon, 02 Nov 2026 03:05:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xNiM7-0006rE-My
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 03:05:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNiM6-00F8vF-On
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 04:05:06 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae7fd97-bab6-0a2a0a5309dd-0a2a450ae2ce-44
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 04:05:06 +0100
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae7fde2-f2d2-0a2a450a0019-d155d032b84e-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 04:05:06 +0100
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6afa651700eso3564476a12.2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 19:05:06 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793588706; cv=none;
        d=google.com; s=arc-20260327;
        b=dJa+3l6BJVVOqflDXFHDqkvuPXiCz6ox7f/oGRPqBojuFgoYdim3TjsLvljiaSKlO6
         E5k4RcSqcAZyW72znB7iny6Cc2cd+7IK0h7T+RHcd6yPFrqaNN5te3CTswC+yrr5HVKi
         XjE3Vc3Zb6Aoxo+QF6QayHKim2GKtCP0+Ner8yEnYhbPmyLjonNgpeTEwg9yqY5d0TY2
         4KcqrpLAONNg3sFsqhi6lBPizwkCWiQJbLxLu0EvEfFMxJE9ZaSDzny2qyUENLZ17+5v
         Mxw944nNfwlMrb5p6AEnvPREjng8kzdYxErgbB5bh+cVIrpi14bs/r+9KlgHnk8u3id0
         zbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=imk8Y3dp71z9rketUe9RnJkNrtaKIPDOf8w3Ba5TnQo=;
        fh=14eKip6vGthT/lp6m1ArSiDwB7Qxtkc/On3njMQLlrg=;
        b=WuZhOPlx3yXC7Yb6vbN0JSm/oagzFReofhR5WgaQk4rKyz3LGIs3bIr7lvWBWBqkzD
         TfWN2mRBrg09jc2IYE8Xo0VaWTZHtodLt/dbvhfSbXOH5eEMGHOmjy04FH/1cFgL4jhh
         uHOcwhI8CqqF2SzsbzGW8MIR8vkIQNFWDPrv4dfANSOzzzJ8jGgWP3khmCQyWTTG0B94
         PF64hZ8v1ntp8L8ZGrUc/iVspOzAri/weFcUnwVahLxOK3B8Y7Omqd9TGFfoNVGPU0l1
         hWQ8ciUmKEhJNK/DIHbqAQClUDgRpIk6GtSfsln/Usq+vWdPFTAWypQghIdIdFNLfvBn
         ThoA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793588706; x=1794193506; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=imk8Y3dp71z9rketUe9RnJkNrtaKIPDOf8w3Ba5TnQo=;
        b=pAxQ713cTHzQ/gKm488PmNlSQ67B+hXX7O/8XRvW7Kc898PESUliqsW+pZFxJLcz7G
         k1fSmN3Lcem1vY+7jKMlTco2a3TopPdM4Y64oq289aUApjimzZImL0fPZ0PqHbvxdm07
         +o/OaNwx4KfudHqm2c6Eacx4RYWiCYBzW+sVQdO8z7F5+HtMYiQLxtb/6vC0n+JdxYnH
         wjHkPRnlIgTsTfsajXvg29UCLgd9hSXpTC1K2Qq4PMFF53cYR0JqvW0n3V0VmRfDhGld
         hRGYGpKWokCiJO17BYtYrn++Ei6+OBZmkjiJAarJtzvSttV5neVJ7MPrbVJ5b5lhJZNv
         +noA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793588706; x=1794193506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imk8Y3dp71z9rketUe9RnJkNrtaKIPDOf8w3Ba5TnQo=;
        b=R75P4rapV3Imm+UR8kAf/bB5EhARXZHtj/HUept+yM8LFP5+lZ9ELrbIaBm+4ZbP+F
         16cucwg6q/l+nTHexzbAataJf1+CORQlGka+tGfH06yQ6rZ/HM2QC6FbihhmuiyXmWPl
         jQM0zkG1rorZJ/WOw7mDSDgEatbnfTMyb4HXhMs8oBeOlw7cl0/h2kRxkhQiy3xzul9m
         HRCIvE9CbnCPoYDazig0qMFgY6drmmRFzR9BX/KmM912BQLL5qM4g3gTzkjRTw15d6uZ
         x9knMAryojA992sEwDjpeN1YXNzWanhUmoMHiH/eNKPDdvI5sP0L9rk5AWDfIdBolP6B
         z1tg==
X-Forwarded-Encrypted: i=1; AKwUvBx8o4UiUPO4eSmpcI7Vp+200Kk1PdQOTEYGl7Dzu/NpkqqyWem70FzmW05mM+PEOdgbzT6gaPpgHZM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+QrqRua+SlyP4mtfxs/TCE/riPlhCiVircVakAwWS1VtLpJFZE
	YbnkdIHMzBbwh46KceN+Wi7l5RnoFsmdII+WbyFhCdXT3m3mrz16mNXdBqOQf6j2A925+2lyk+I
	ws4HrIs0qeRzNOEvj/2EU5bPfltk8yY8=
X-Gm-Gg: AYBFou3e9agaGyx2pAILzVgr/N+0Jyg124KZE9FMK5kNZxIHbjN4h6D+wzEcfJ0qMRr
	Jld9ifEH38vHNBXURZ8gPBAIGuRG5vvm4zPqE3He0jatnSqepsrt5RWZvfALZGFwyOetbYgdMw9
	QqeKOjo4KkXvnucxn7tDhbQg/MGxWHDwIHhHWxiwZTYxAn1UmL8E4/jIvIDU2Hz7jcmGoj4iABY
	OE3XSM9k3Z4E6lIO0J9osBH4GFVbQzCzoYIRJsNbZDTYk6gorG9TJTQehSK/4AX0ZpkfikBdjky
	KBOP3KNLv2Ad2W9TZWYlJJm+jAkzHWmiZfKZVSEYwm473b8hoXFKsKrsq9gXgr+UmM8FXrgVN+K
	9Q/sYQ/F4T4u8w8Q28gfTOVMczW41qfz6h4/G
X-Received: by 2002:a05:6402:11d3:b0:6af:dc4c:5f28 with SMTP id
 4fb4d7f45d1cf-6b4d4f71386mr6168227a12.37.1793588705869; Sun, 01 Nov 2026
 19:05:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
 <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu> <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
 <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu> <CAE2XoE-2w3A4=BeskGgp7NYUtkRVNkNufu4SZjW_OQ-KAQZvhg@mail.gmail.com>
 <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu>
In-Reply-To: <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 2 Nov 2026 11:04:50 +0800
X-Gm-Features: AclHuK-B5Bt-Oq5n8C1F46Ueo6UjVwoSHbd-GyMOrqSjrQb5HmRreMzyOD5B1cQ
Message-ID: <CAE2XoE8pNaP3rAR5Y2BpUZ2vSu-UC-wG9V9U7gPXrEGY=kx0RA@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo registration
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org, 
	Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Philippe Mathieu-Daude <philmd@mailo.com>, 
	Antony Pavlov <antonynpavlov@gmail.com>, 
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
	Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
	Thomas Huth <th.huth+qemu@posteo.eu>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Yoshinori Sato <yoshinori.sato@nifty.com>, 
	Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Chao Liu <chao.liu@processmission.com>, 
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Alistair Francis <alistair@alistair23.me>, 
	Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Gaurav Sharma <gaurav.sharma_7@nxp.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Alistair Francis <alistair.francis@wdc.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1793588706-589C9CFC-918CB747/0/0
X-purgate-type: clean
X-purgate-size: 9217
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 4:57=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
> On Sun, 1 Nov 2026, Yonggang Luo wrote:
> > On Sun, Nov 1, 2026 at 7:29=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.=
hu> wrote:
> >>
> >> On Sun, 1 Nov 2026, Yonggang Luo wrote:
> >>> On Sun, Nov 1, 2026 at 1:06=E2=80=AFAM BALATON Zoltan <balaton@eik.bm=
e.hu> wrote:
> >>>>
> >>>> On Sat, 31 Oct 2026, Yonggang Luo wrote:
> >>>>> On Sat, Oct 31, 2026 at 8:42=E2=80=AFPM BALATON Zoltan <balaton@eik=
.bme.hu> wrote:
> >>>>>>
> >>>>>> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
> >>>>>>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >>>>>>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>>>>>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo an=
d the
> >>>>>>>>> type_init
> >>>>>>>>> function that calls type_register_static(). A later change need=
s to
> >>>>>>>>> pass a
> >>>>>>>>
> >>>>>>>> That's the point of the macro to hide the boiler plate code.
> >>>>>>>>
> >>>>>>>>> target mask into that registration, and the macros have no para=
meter
> >>>>>>>>> for it.
> >>>>>>>>
> >>>>>>>> Couldn't you just change the macros to take that parameter inste=
ad of
> >>>>>>>> expanding it everywhere?
> >>>>>>>>
> >>>>>>>
> >>>>>>> Problem of macros is that they don't have default parameters, so =
you
> >>>>>>> need variants for everything:
> >>>>>>>
> >>>>>>> DEFINE_MACHINE
> >>>>>>> DEFINE_MACHINE_EXTENDED
> >>>>>>> DEFINE_MACHINE_WITH_INTERFACES
> >>>>>>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> >>>>>>> and now would need a new variant, with variant for other existing=
 ones.
> >>>>>>>
> >>>>>>> In the end, it's just simpler to remove this and add the boilerpl=
ate.
> >>>>>>> It's written once and never modified, so using a macro just save =
typing
> >>>>>>> those lines once.
> >>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> BALATON Zoltan
> >>>>>>>>
> >>>>>>>>> This series expands every caller first, with no behavior change=
, so the
> >>>>>>>>> follow-up only replaces the type_register_static() call.
> >>>>>>>>>
> >>>>>>>>> Each machine file gains a class_init function, a TypeInfo, and =
a
> >>>>>>>>> type_init
> >>>>>>>>> function that calls type_register_static(). The last patch remo=
ves
> >>>>>>>>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core=
/boards.h.
> >>>>>>
> >>>>>> Macros help reading the code not saving typing. If the actual
> >>>>>> functionality is buried in a lot of boiler plate it's harder to un=
derstand
> >>>>>> and spot bugs so putting the unintresting boiler plate behind a ma=
cro is
> >>>>>> better even if you need a separate version for different cases. Th=
en the
> >>>>>> code that uses the macro will be much more obvious and not just a =
lot of
> >>>>>
> >>>>> I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* a=
re
> >>>>> not defined properly
> >>>>> that causes them to not be extended easily.
> >>>>>
> >>>>> DEFINE_TYPES is another example, use them can extend easily, how ab=
out
> >>>>> always use DEFINE_TYPES?
> >>>>> Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and DEFINE_SECURE_M=
ACHINE*?
> >>>>
> >>>> Maybe I'm missing the problem but DEFINE_MACHINE macros are just
> >>>> convenience wrappers around DEFINE_MACHINE_EXTENDED. So why can't yo=
u add
> >>>> the needed parameter to DEFINE_MACHINE_EXTENDED and use that for mac=
hines
> >>>> that need it, or if it's needed by all machines then make the new
> >>>> parameter required and add it to all convenience wrappers too so you=
 can
> >>>> keep using DEFINE_MACHINE* and just need to add one parameter to it =
in
> >>>> machines?
> >>>
> >>> That's the issue, add parameter to DEFINE_MACHINE_EXTENDED means all
> >>> calls to it also need
> >>> to be changed, that means touch many $target_arch files. currently
> >>> it's 13. But after these
> >>
> >> That's not different from expanding the macro which would touch the sa=
me
> >> files.
> >>
> >>> changes, there will be much more usage on it, and if we want to add
> >>> more parameters or attributes
> >>> to it, it will be a new tree-wide change.
> >>
> >> Do you expect to need more parameters? Can't you add them at once then=
?
> >>
> >>> And DEFINE_TYPES do not suffer from such issues. As the TypeInfo[] is
> >>> explicit defined for
> >>> DEFINE_TYPES
> >>
> >> My point is that keeping the boiler plate as little as possible makes =
the
> >> code more readable. DEFINE_TYPES hides some of the boiler plate,
> >> DEFINE_MACHINE hides even more so converting to DEFINE_TYPES would exp=
ose
> >> some even if it's better than no macro at all.
> >>
> >> What exactly are the parameters missing from DEFINE_MACHINE_EXTENDED t=
hat
> >> need to be added?
> >
> > Hi BALATON
> > the things we faced is we first is to add TypeInfo::is_available parame=
ter to
> > DEFINE_MACHINE_EXTENDED, and have more usage of it.
> > Then we will add targets:uint64_t parameter to DEFINE_MACHINE_EXTENDED,=
 this is
> > a prepare to remove TypeInfo::is_available parameter from
> > DEFINE_MACHINE_EXTENDED,
> >
> > And finally, once all usage of TypeInfo::is_available can be replaced w=
ith
> > targets:uint64_t, then we finally need to remove
> > TypeInfo::is_available parameter from DEFINE_MACHINE_EXTENDED,
>
> Is there a way to avoid the temporary is_available churn and introduce th=
e
> targets:uint64_t right away? (I'm not following this so I don't really
> know what you're talking about just looks like there's some churn here
> which might be good to awoid anyway independent of these macros.)
>
> > That's what I am facing now. And the explicit
> > static const TypeInfo xxx_machine_typeinfo =3D {
> >    .name       =3D MACHINE_TYPE_NAME("xxx"),
> >    .parent     =3D TYPE_MACHINE,
> >    .class_init =3D xxx_machine_class_init,
> > };
> >
> > Will help me avoid the issue. And I think this is a little boilerplate
> > and very explicit.
>
> That's not all DEFINE_MACHINE hides though. It's longer with .abstract,
> .secure and .iterfaces plus the machine initfn that would also need to be
> expanded if you used DEFINE_TYPES.
>
> Is this conversion needed for all machines using all DEFINE_MACHINE

At the end, only "none" machine do not have targets parameter or
(QEMU_ARCH_ALL), as that's the sole
machine that supports all targets.

> variants or only some of them? If the latter why not convert those to




> DEFINE_MACHINE_EXTENDED and then only that macro needs to be changed with
> other wrappers passing a default value without needing a new parameter.
> That does not work if all machines need to do this but even then, keeping
> the macro and adding a new required parameter is better in my opinion as
> it keeps boiler plate hidden.

Another option is keep DEFINE_MACHINE and introduce DEFINE_MACHINE_TARGETS
and remove DEFINE_MACHINE_EXTENDED, and we only use DEFINE_MACHINE for
simple case,
that is parent is TYPE_MACHINE and have no custom type and no more
attributes assigned.
DEFINE_MACHINE_EXTENDED is too verbose, when calling it, it less clear
than calling to DEFINE_MACHINE.
And if we want to set more attributes to TypeInfo, just expand it to
use type_init or DEFINE_TYPES, how about this way.

This will be something like:

#define DEFINE_MACHINE_TARGETS(namestr, machine_initfn, targets) \
    static void machine_initfn##_class_init(ObjectClass *oc, const void *da=
ta) \
    { \
        MachineClass *mc =3D MACHINE_CLASS(oc); \
        machine_initfn(mc); \
    } \
    static const TypeInfo machine_initfn##_typeinfo =3D { \
        .name       =3D MACHINE_TYPE_NAME(namestr), \
        .parent     =3D TYPE_MACHINE, \
        .class_init =3D machine_initfn##_class_init, \
    }; \
    static void machine_initfn##_register_types(void) \
    { \
        type_register_targets(&machine_initfn##_typeinfo, targets); \
    } \
    type_init(machine_initfn##_register_types)

/* Implicitly insecure */
#define DEFINE_MACHINE(namestr, machine_initfn) \
    DEFINE_MACHINE_TARGETS(namestr, machine_initfn, QEMU_ARCH_ALL) \

As the many call is to DEFINE_MACHINE.

And after all conversion, all existing usage of DEFINE_MACHINE will be
converted to
DEFINE_MACHINE_TARGETS.
DEFINE_MACHINE will be called for ('none') machine or future heterogeneous
machines


Either way, these patches will be dropped. We will introduce
DEFINE_MACHINE_TARGETS first.

>
> Regards,
> BALATON Zoltan
>
> >
> > And the
> >    .instance_size =3D sizeof(MachineState),
> > is indeed not needed, they sharing TYPE_MACHINE's sizeof(MachineState)
> > is enough.
> > Even though DEFINE_MACHINE expands to .instance_size =3D
> > sizeof(MachineState), and it's redundant.
> > So I think convert to DEFINE_TYPES would be a good alternative to this
> > issue, less boilerplate(not none)
> > And dealt with the issue we faced.
> >
> > What do you think about this idea, BALATON
> >
> >>
> >> Regards,
> >> BALATON Zoltan
> >
> >
> >
> >



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

