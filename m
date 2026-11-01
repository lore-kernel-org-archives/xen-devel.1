Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC9606A325
	for <xen-devel@archiver.kernel.org>; Sun,  1 Nov 2026 03:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PXqFcB7x
Received: from list by lists.xenproject.org with outflank-mailman.1467126.1676574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNLys-0007Ap-2T; Sun, 01 Nov 2026 03:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467126.1676574; Sun, 01 Nov 2026 03:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNLyr-0007Ai-W3; Sun, 01 Nov 2026 03:11:37 +0000
Received: by outflank-mailman (input) for mailman id 1467126;
 Sun, 01 Nov 2026 03:11:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xNLyr-0007Ac-3q
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 03:11:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNLyq-00HNKd-DI
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 04:11:36 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae6ad62-e002-0a2a0a5209dd-0a2a45049a4e-34
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 04:11:36 +0100
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae6ade8-b57f-0a2a45040019-d155d034e4b0-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 04:11:36 +0100
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6b2237b596cso3823931a12.0
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 20:11:36 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793502696; cv=none;
        d=google.com; s=arc-20260327;
        b=NaumzC6sXzakUIXBtsX7ihUoBHz3FWeDQenvdbgwWRscmWLc28FmJbShsLKDfV6Jop
         qNI43ihfwBX+tiNr3E4JeIV7SUavij+IXW+n+lIIHg5R+iG9tTsjQ9x4Wr4JkxJaeyZp
         114LCeldopUds3+JoLOlraevVg4xNGdNBWjENi+68oU2ka10Te1c3W3qlkA9f2x8yVyi
         9RbHNL1CxsAMJ/+7u6HtprfwtBFpJ1ED4U0vjvc+6S+RRrt4m3ABUcZt84TcunMqAM/o
         17zwUmHpqlyp+FW4tmj8TKkvQhg9rEgo0HbJQZGhNcTg3Ve0OHr1t/JERUWbDYw5LIdA
         A9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=vhYx8NCTJ3gLuFoY2YcO8xoKIGGtbLmWpknfBd4Xk+g=;
        fh=kdsjTlqf/BJQA81FXUx/qHxqjNjs3jRj3RGoPk1XFRk=;
        b=hmPuxWqbk/vkAVtNTKfmOgMumtdUUD3HX1WX/02wVJUB4GDqMvPJPk8ueJEVY1HkaS
         Kh8g6C2Gvrj5T/rW0PK32/YdhNZ3Msde83fvQ3yA/6wxZD+6ukyQSUaFyckdbdPIP82p
         /sEN1rQC8X1isNVkbsw5zU+AsgOsg04+kcwkMozuHwF/fknrFxr0stUDl6Vs0pbcDOU5
         yLAO1MUdLMjCECZc8ZMyipVVFMxgHRqoHeRd/6WdNvt2ih6fHcJ49P+zFV7FFmMsLcsd
         lO6Mcyr7yMASZt13bspysspmbHTy1x1AhY+VWpJpbkDIthJehWRevOKqmZw59j49cf0B
         PlLQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793502696; x=1794107496; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vhYx8NCTJ3gLuFoY2YcO8xoKIGGtbLmWpknfBd4Xk+g=;
        b=PXqFcB7xO7Oc/Iom6sL7QhQXGU9TTT1vFrO6HIJ3P9XifE0jv1ty+0Y/xX0acoDwnt
         rs9jsNFQaeGemF1Zd/nlzAxRuNkDjWukQO/jqJBbdAVIiZqlYmjzJ4sWUnLUbGqbV8+x
         ol5Y4DXYFcTXC34hNwyKZEDwpnVObiQoj6jU/VK5u4hVmFItB/1qMo0ejOvCtFsLRW8a
         lg/saRu9wcexF91M50FXGlk/0u5tRPpB46Jj78qyWxLr5lbJQPNIEAgJGcAnp1msAM+s
         McyyC6YQcpGbUcm9nyDNYUwRG4sYVBqUmgOcjSC2qanwh4QEU3EUmcaf6zNbilCDR7gR
         ZM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793502696; x=1794107496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhYx8NCTJ3gLuFoY2YcO8xoKIGGtbLmWpknfBd4Xk+g=;
        b=iVEzbgDgIISS1JUKXMJWuNB3Meuzb4DQ9m5HQAzq2mqJr2DRVu8qMlI7qTIT+1paIC
         x6X8vfscCh/VvadjFv+j2HVi+H4u9qKGGvs+eJ4xd64eCk7pzD3hmZEzYeA5FX6Bj56l
         HmboaNqCDm0SAkUDcqdNafI/+Rg+MitpUs4oXJCMPpIC1xaBcjKSy0jNMI6Mg2bbLVhO
         EepBxJsE2krPId3hJ2+3dApLNyKAemDnffhCob56UF9Uj7sZ40szCynDSmqAFwaEzQqB
         KWq+l1qbbW56yu63XQVQfAyHgZKRoXV2Uy/r2K0OUCZci4tcTKU5LxY/+CI9nM0sxMdk
         X3Iw==
X-Forwarded-Encrypted: i=1; AKwUvBznO4gquHrfvaHZRaNVSCQXGCWfCKqNDajSzupyPwI7TxqNHaeFW0bo1t1bBxUMUKCcZDCb8dvDd8M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKEPnDkcFv1FVd/VR3mQimCF1PDShAQA4RcHg/CdrFVyS7f109N
	wkA1LNVbM51EDeNKZcFUTA2UotXUPOKXe564SAVcMqYIxCehR/JrjbawDjduXCoeyI8HGDYUz/c
	sGx1dxNAzXmPPAxeY3uf0sgIwhwRitH4=
X-Gm-Gg: AYBFou2x+hhRloVpkRh8yxPhIXMwBzkkTHmtLeiWPffLyuuYvUHArfy5CFXM07Wx/u8
	6IKI3w2LxX2gXftQBW6wBUw86sic1RvLiT9hau6WJNqxr722leL2G0OqT1GvmVD9/nv7e9cPeR1
	2ehO/ROiKS1BNhAYBVcl1GmzPXnsEGog3xWJ+cLY6q2OMJBe2FNVDkBRA3ZF4ihCE9GvBEnVa+D
	ECjo/DpfRLv4pHseF1H20Pt/SyDfp4qmePihCgV1G63FdBaNNJuL05+9mw/Tz3rHmSSzTA4tXJn
	e9QPHeCIjJZQWPTMKtck1YoKY5ncSoYXNNkelleT1azrNZaQrXYKh9wnHJhJ9v56GHFVMTRECYg
	1tylov9Vqp3vWkeWVMN8Hvsn3e1eqzSOudpZD
X-Received: by 2002:a05:6402:1f45:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6b4d4c6fdd6mr4363005a12.31.1793502695567; Sat, 31 Oct 2026
 20:11:35 -0700 (PDT)
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
Date: Sun, 1 Nov 2026 11:11:23 +0800
X-Gm-Features: AclHuK8ADYiZfnAadMiHgWxlPjajz8RpFN0nm2TYzD60cICsbmJtIpy63UnxYO4
Message-ID: <CAE2XoE-2w3A4=BeskGgp7NYUtkRVNkNufu4SZjW_OQ-KAQZvhg@mail.gmail.com>
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
X-purgate-ID: tlsNG-ebf023/1793502696-532CCB50-2D03300C/0/0
X-purgate-type: clean
X-purgate-size: 5856
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
> code more readable. DEFINE_TYPES hides some of the boiler plate,
> DEFINE_MACHINE hides even more so converting to DEFINE_TYPES would expose
> some even if it's better than no macro at all.
>
> What exactly are the parameters missing from DEFINE_MACHINE_EXTENDED that
> need to be added?

Hi BALATON
the things we faced is we first is to add TypeInfo::is_available parameter =
to
DEFINE_MACHINE_EXTENDED, and have more usage of it.
Then we will add targets:uint64_t parameter to DEFINE_MACHINE_EXTENDED, thi=
s is
a prepare to remove TypeInfo::is_available parameter from
DEFINE_MACHINE_EXTENDED,

And finally, once all usage of TypeInfo::is_available can be replaced with
targets:uint64_t, then we finally need to remove
TypeInfo::is_available parameter from DEFINE_MACHINE_EXTENDED,

That's what I am facing now. And the explicit
static const TypeInfo xxx_machine_typeinfo =3D {
    .name       =3D MACHINE_TYPE_NAME("xxx"),
    .parent     =3D TYPE_MACHINE,
    .class_init =3D xxx_machine_class_init,
};

Will help me avoid the issue. And I think this is a little boilerplate
and very explicit.


And the
    .instance_size =3D sizeof(MachineState),
is indeed not needed, they sharing TYPE_MACHINE's sizeof(MachineState)
is enough.
Even though DEFINE_MACHINE expands to .instance_size =3D
sizeof(MachineState), and it's redundant.
So I think convert to DEFINE_TYPES would be a good alternative to this
issue, less boilerplate(not none)
And dealt with the issue we faced.

What do you think about this idea, BALATON

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

