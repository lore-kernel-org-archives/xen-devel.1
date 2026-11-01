Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDE5606A325
	for <xen-devel@archiver.kernel.org>; Sun,  1 Nov 2026 03:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uCHhiIkM
Received: from list by lists.xenproject.org with outflank-mailman.1467135.1676583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNMDs-0000Or-7k; Sun, 01 Nov 2026 03:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467135.1676583; Sun, 01 Nov 2026 03:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNMDs-0000Ok-4u; Sun, 01 Nov 2026 03:27:08 +0000
Received: by outflank-mailman (input) for mailman id 1467135;
 Sun, 01 Nov 2026 03:27:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xNMDr-0000Oe-AX
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 03:27:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNMDq-000hLp-GW
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 04:27:06 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae6b16c-e002-0a2a0a5209dd-0a2a45018560-4
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 04:27:06 +0100
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae6b18a-5984-0a2a45010019-d155da2cd5e4-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 04:27:06 +0100
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c49b431f022so269896466b.1
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 20:27:06 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793503626; cv=none;
        d=google.com; s=arc-20260327;
        b=WQsVB7HQqZZP8VMBTrZklGZI+6mY0pUy/ibFXjTdivApw5HvZGTTWKxKpSh103Wrpj
         nGEONRkT5+ImcYcOPvAKQ4yBUHd/kbtc69qXb2FPR9uUgRn2Hm73Cv844cq6p0VaMPPR
         d9tMmMof+ek0CWfvo99vCJqydyv+wCpvwl4OmReJwp7+D9SbESBocO734ZcG40zpjdnp
         mtZjBdy8JLH7svA7PUzbeFpm5hNdugEf1r1KHhk6+tuK9oCACY4lYAwT/pHmSPKDbEUU
         LFEyFXHyRIi/la64UL7F8NW6ndBDvSCynwbcEsKIApQCYuoKXuUsL/vtw641wZAbarJm
         ry8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=DWO0Oi5z9yO5iNhbmEE3jx4kds9djaRbLYHcUT+/GCc=;
        fh=I4lCl8Juol8+VLUalVUojFNILuLgyULvPxD0v1k0fnI=;
        b=eYkv+DNoi/1KQU12nAUdWVqjnODsM+RCgW1esVm8CaWYnKeStquUwS8g/gmEILzrXE
         Q7cysxWrD+V9hcKl4NkRCmm7ybp406NCRytwttXgfC6F2JFL55xeJsb2b/yqNh/xcwyZ
         lrOPno8aZWpoIP031S4rgTdyEXgtHnjKdtzn3USAzn9Y1Shf4nY09LZ0+KyFFW42vTOE
         IaH1Px6GDp7yt565D5j8Nx4sD9o2n0kVpFMA96Q1UamDADx8/TJal3OJUPizO8J5sj9v
         sasb4o3o67PTN6npT87qhXr8q0RiXsSEos1nOHfRjlwrqLNt6N0ZuG7E0G7tYq8Fpwf0
         07yA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793503626; x=1794108426; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DWO0Oi5z9yO5iNhbmEE3jx4kds9djaRbLYHcUT+/GCc=;
        b=uCHhiIkMOd64iboqH7OccKyvhbu6XjK0XG+DUzTrC4lMWubu4/pVibZmaLqonlyjZj
         /fJKvuNNwGQBlr06DPmPYgd7AyslEok8/0fLqSQ+AKFLMlW/vDPcnesLUcqoTQBHiEi1
         viXvUO1/u1yE4qz15W79XLjW0IczNrhxhK+K9aK/yW8kGSaN7bCedH23E3u9R8Afracb
         eQsMZ0gPfsuFxGOwKH3dQx7mBKzsAU0iSAol2NiVqvc++cjofv/CShzN3Mn47Z/Ckc4I
         ocvU8M46sOEbTqgpJPNEqken3m5b9M+FGF6c+42pjbKRygMa/fdEE5WRmsx9kF2b+kh1
         8LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793503626; x=1794108426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWO0Oi5z9yO5iNhbmEE3jx4kds9djaRbLYHcUT+/GCc=;
        b=08cupQ8w7WUciSxkXmk3/K86YKau7DNZBlMnNRncqjqNn7tvtfH3Cd65ph5t9X+Jtt
         ZfXR693D6r7LKgE53IQOJvgs0Nlbk27fPd/yFAUaisdVmbWcwrCChYMYbTxPl5JzYVut
         h/nmlu8nt5pSZNdK4hB+hDdgMqLYjIx+y+TJwRH6tMZArjm6OmW66nIarp8HmhL33DiU
         klPoTfqWnoTgKkrlC35X+cT9e8JOPIuj0ZRkHy2oaGB53VmkaQfQH6D/4cr39jdfZco2
         zPYKuOWp74ygd5qQOOf86zeA2SCy6/pf6pKD5zdArF2/qLYb69UckWAFRnT5buJLd8j/
         5yEA==
X-Forwarded-Encrypted: i=1; AKwUvBwa9I+j0zG5cZASRXejvWPkyQvGGrsVQ6INTSejxlYSqRZYqDrSnkCGkWUqGNOuG4b5K+AAYz4/OB4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLcgqWxNUlxzYHJ9vmDqEGRcsy2PVhinEw24thBkitWQ/Tn25MA
	z7LCBm+CzjblISo/UIHF8olOPF9d0LKg7bLVLQDCEPu1ORYJrXTz/FXk/gUf9Swn44wDycGCG9Q
	dqVX0xS4zMmZW2/BncR60QK7wMngHD0M=
X-Gm-Gg: AYBFou2bSGkyop4ztg/87VhvHQYYlBNTB5E/VLiv5/2w35UzLgqiHhKhm17LRqb7jSK
	onqqCSApbmIyuoiReRyvmJRxL2+o1mPqiD0jc/Czn/O7kyAv0gQODAFZHcHZgCmX0rtiqR5Evgh
	PS0Mc6tvB3uM7P1Sax1nfW58Aq1iY3Rer1AbIj6iZUTsyc60Emygf+asw3LrJNUnJz48VAQiHJR
	ocGZmIOMqI4EIvREldRNFKzCxQNXknK4yjo1pxunVEzWe7a1DlCBhtlpLTB2vgUjQM016jZ2EmX
	vGSGURrqZb5JFwh4hOdZYQ6EEnJFFajQPqIPhbReozI5wcWGzHLOiWJXnsC0k0Mx8X01If3gZZw
	lrlSQDWEZ9y14O9Z9fmEMYzEFKzBb1Kiya1tg9Q==
X-Received: by 2002:a17:907:6d05:b0:c3f:c856:fb7a with SMTP id
 a640c23a62f3a-c4ca793baa3mr525308866b.3.1793503625809; Sat, 31 Oct 2026
 20:27:05 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
 <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu> <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
 <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu>
In-Reply-To: <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sun, 1 Nov 2026 11:26:53 +0800
X-Gm-Features: AclHuK9057t8H_kvHtA0m7bf23Rw45MDO_-qUsQ8r90mDc2w3RogzzSts7xwUEo
Message-ID: <CAE2XoE-fkc-PqKsx4Lf+RdHxqctAS2TSuqueGFrnea2jaiQXnA@mail.gmail.com>
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
X-purgate-ID: tlsNG-d62444/1793503626-C495A757-F67212D7/0/0
X-purgate-type: clean
X-purgate-size: 4955
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 7:29=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
> On Sun, 1 Nov 2026, Yonggang Luo wrote:
> > On Sun, Nov 1, 2026 at 1:06=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.=
hu> wrote:
> >>
> >> On Sat, 31 Oct 2026, Yonggang Luo wrote:
> >>> On Sat, Oct 31, 2026 at 8:42=E2=80=AFPM BALATON Zoltan <balaton@eik.b=
me.hu> wrote:
> >>>>
> >>>> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
> >>>>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >>>>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>>>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and =
the
> >>>>>>> type_init
> >>>>>>> function that calls type_register_static(). A later change needs =
to
> >>>>>>> pass a
> >>>>>>
> >>>>>> That's the point of the macro to hide the boiler plate code.
> >>>>>>
> >>>>>>> target mask into that registration, and the macros have no parame=
ter
> >>>>>>> for it.
> >>>>>>
> >>>>>> Couldn't you just change the macros to take that parameter instead=
 of
> >>>>>> expanding it everywhere?
> >>>>>>
> >>>>>
> >>>>> Problem of macros is that they don't have default parameters, so yo=
u
> >>>>> need variants for everything:
> >>>>>
> >>>>> DEFINE_MACHINE
> >>>>> DEFINE_MACHINE_EXTENDED
> >>>>> DEFINE_MACHINE_WITH_INTERFACES
> >>>>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> >>>>> and now would need a new variant, with variant for other existing o=
nes.
> >>>>>
> >>>>> In the end, it's just simpler to remove this and add the boilerplat=
e.
> >>>>> It's written once and never modified, so using a macro just save ty=
ping
> >>>>> those lines once.
> >>>>>
> >>>>>> Regards,
> >>>>>> BALATON Zoltan
> >>>>>>
> >>>>>>> This series expands every caller first, with no behavior change, =
so the
> >>>>>>> follow-up only replaces the type_register_static() call.
> >>>>>>>
> >>>>>>> Each machine file gains a class_init function, a TypeInfo, and a
> >>>>>>> type_init
> >>>>>>> function that calls type_register_static(). The last patch remove=
s
> >>>>>>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/b=
oards.h.
> >>>>
> >>>> Macros help reading the code not saving typing. If the actual
> >>>> functionality is buried in a lot of boiler plate it's harder to unde=
rstand
> >>>> and spot bugs so putting the unintresting boiler plate behind a macr=
o is
> >>>> better even if you need a separate version for different cases. Then=
 the
> >>>> code that uses the macro will be much more obvious and not just a lo=
t of
> >>>
> >>> I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* are
> >>> not defined properly
> >>> that causes them to not be extended easily.
> >>>
> >>> DEFINE_TYPES is another example, use them can extend easily, how abou=
t
> >>> always use DEFINE_TYPES?
> >>> Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and DEFINE_SECURE_MAC=
HINE*?
> >>
> >> Maybe I'm missing the problem but DEFINE_MACHINE macros are just
> >> convenience wrappers around DEFINE_MACHINE_EXTENDED. So why can't you =
add
> >> the needed parameter to DEFINE_MACHINE_EXTENDED and use that for machi=
nes
> >> that need it, or if it's needed by all machines then make the new
> >> parameter required and add it to all convenience wrappers too so you c=
an
> >> keep using DEFINE_MACHINE* and just need to add one parameter to it in
> >> machines?
> >
> > That's the issue, add parameter to DEFINE_MACHINE_EXTENDED means all
> > calls to it also need
> > to be changed, that means touch many $target_arch files. currently
> > it's 13. But after these
>
> That's not different from expanding the macro which would touch the same
> files.
>
> > changes, there will be much more usage on it, and if we want to add
> > more parameters or attributes
> > to it, it will be a new tree-wide change.
>
> Do you expect to need more parameters? Can't you add them at once then?
>
> > And DEFINE_TYPES do not suffer from such issues. As the TypeInfo[] is
> > explicit defined for
> > DEFINE_TYPES
>
> My point is that keeping the boiler plate as little as possible makes the
This is also what I want, makes the code more readable and little boiler pl=
ate.
> code more readable. DEFINE_TYPES hides some of the boiler plate,

The DEFINE_TYPES would be like this:

static const TypeInfo dp264_types[] =3D {
    {
        .name       =3D MACHINE_TYPE_NAME("clipper"),
        .parent     =3D TYPE_MACHINE,
        .class_init =3D clipper_machine_class_init,
    },
};

DEFINE_TYPES(dp264_types)


> DEFINE_MACHINE hides even more so converting to DEFINE_TYPES would expose
> some even if it's better than no macro at all.
>
> What exactly are the parameters missing from DEFINE_MACHINE_EXTENDED that
> need to be added?
>
> Regards,
> BALATON Zoltan



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

