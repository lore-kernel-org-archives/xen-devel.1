Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B731606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntxIbNAj
Received: from list by lists.xenproject.org with outflank-mailman.1470527.1679273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIwN-0002TB-V3; Tue, 03 Nov 2026 18:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470527.1679273; Tue, 03 Nov 2026 18:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIwN-0002T4-SN; Tue, 03 Nov 2026 18:08:59 +0000
Received: by outflank-mailman (input) for mailman id 1470527;
 Tue, 03 Nov 2026 18:08:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xOIwM-0002SR-4X
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:08:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIwK-00BgSl-35
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 19:08:56 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6aea2329-e002-0a2a0a5209dd-0a2a4507e2a2-48
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 19:08:56 +0100
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6aea2337-b4ea-0a2a45070019-d155d02bb526-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 19:08:56 +0100
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6b1afcd2d23so6537362a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:08:56 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793729335; cv=none;
        d=google.com; s=arc-20260327;
        b=NMrhnoUSZXtN+sYyzxLhDNfxIbSuA2i4W4OR2GqBtHZ6o9zexgE6QUy1hzpqDat3E6
         pTGwXT6n51ZP6T16m5UZWciyYqm4Vs0v6bgue2LwPh6nrZdeu7l2wZPnGYt1Xh9G90WF
         q8pJQIZmh1S3yUHuUPKTaZSQ7WPuFS0EdB/iHOJAfqx90i0pBEmO11NGXV12Z316w2iX
         WW5ia5nUrKI0PfcuDLpK+/WhmiSYDX3WGFOqDY1ov2qGRsSnplLcnvQYNkETelheb8v0
         OKzc7FwVP3WaKnGnZCKDE8IFMvoBD/+3dkPvJN39DlhGEHkj+NeW2K8M6iu7RBiMVCes
         1FxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=BJey1qLpGncca5aTW0VYBYvYOxSWgotKBUYp0cXl14Y=;
        fh=/Bi8Cb5pjqlldEGH2AgGDw3cdpg6TEBLwzPwqKWehvA=;
        b=eLtBML1ADHHsUC5ZRBgfvo7XL4y0TlH6n8aO+JCbIHCI6yqNYg7Xm90vPB0NAk9mBm
         9KLOwQQyNWxmEvK3yLYJAoQhQ2xKofIEqBv/emULshV8y98lFCFPJ3LM3hWGRMAqTXmG
         u3ryBHpGOxWs9qHruvJ9WDsf9TcPpKa5b8mdDHSd1Ntub5u5QQ4e0uPx3XdeU7Mnwspd
         BBtiAxA0lK4Rmhr/q1j+I5cA/5Q13MZFnbvXvOsUPK1QKTgX8IZAV4lNvUnSq64DH2MQ
         d5+Z6iAvmSHFoxZT+BcYSyVHT4YAto3cAjTfFT9A1kiafN9M5cZz7k3ueMQCnoSsR+ag
         FcfQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729335; x=1794334135; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BJey1qLpGncca5aTW0VYBYvYOxSWgotKBUYp0cXl14Y=;
        b=ntxIbNAjBOL2Io6sc0yjvqZ9rnx+uVUvi/VkKRPQXw+kiO/Jx1lw3Hbh+nrih+IGlW
         Gd84RZb53y9CIm6TEUHcwGpcpCUGf25HvZVWW8GrZQJWRMdPHBG/wzqeHAde4iz5BSXR
         qMY9SIqUkZpY/AI/Ur3ppSLQgxGIJE87/nVqV/KzM1vnhleQsGGA2NwUmFDl6aezjvr7
         2Ddi7EKjN/K3ZeafAmEclobkJtulNVhIRVW0T1KgGRN1VahHa87lQcpih52sKYphEk18
         ULxY/8HoBfXMM6eU93Q0G7yBOFt/j64jl10w2cI7pbVnElxr8ZzcfruGlW1n+xnhbW4N
         trdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729335; x=1794334135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJey1qLpGncca5aTW0VYBYvYOxSWgotKBUYp0cXl14Y=;
        b=vtpBBB5US0rdG5y1EJPsXFyF9uWmTZxKo0P+meZ9z7y0qnFvnXIryr5MhdWfovzv/Z
         lVymliCBNOa+M/Kz2rKEm9GBQm3uivm5OWKmp2Z8Bk+h+1HA/DwfMGqOJ7EA3BMcTAJA
         P/TyF59iqvK41o4/X0MRrXzpt3JYW4lpickRhsVyLee+a5pOt7XOOuQ99K2NY3yeVYTa
         aHArULZELB0OpO9UQaEpwv93wYveAz9iFet3PPLqNzl70PKYBrS+OGDWP1HUKvNZjiS7
         ymPJtCjXl/YMbqMVvoI0eCMnIiu/3qWcds4STl31JLND5g6dpJpv4yLOn1isEQZ07ZQW
         2Q1Q==
X-Forwarded-Encrypted: i=1; AKwUvByeTk5vCn3wT6LLsoVSTv89XKPyMMgpg5uKsA8DCP16VVIUvYVKvdFR+ZvXzSgusGUs2WC67sbYs+Q=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+XoSAkU9CuLn1mDD4i4lEQlxbL4SCaQnmyWD9AIHgC30A2o/5L
	XNX/CoaHEQw1pjVpZ6KmHqm5UUYXpZE7vHUU1Jko2vkgHk+uuESCxQCSLO22w3ZuRcWcSH2nkZN
	uO7ax/B1kR7MH0jmok1h1X8eokhyqLuw=
X-Gm-Gg: AYBFou37JQKcyDro/M3Y8cHn34KtAiZf+xmKPwUzEqsu1mql4od7l9QrfGH/M/uNjAl
	JrQgP3pQC0akbVz11JVhb+ET3446rBYq3kbIamK6EjNMF+NqhLDVpZzej0l1ylR6Bf3/sbsY/N6
	HW1kH+2+2s3qxi4Td0TWPFgB3LtXuJIFqD6A7xndNIKvR8JbVTYlxwUsMUzrQHz8INMpUWrsL6Y
	+XzoNRqAXzwvid25i6bSx1MzRgP+tTKkMhpE2jBC3Q1jlFdKm38/0FCGQYW8lGkT40FevSi3HUL
	jYrht0QWMXnuu+X7Ms07JqUO+pDUgHuyhi5jAWLbNXfpJ2VeLRx4pOO0Pl9txUAeCEScGJHHvMm
	Eotk6cxSsvLDUeF3uE+yFV3WkET9nw0XSEgC7PQ==
X-Received: by 2002:a05:6402:5009:b0:6b4:d731:4bf3 with SMTP id
 4fb4d7f45d1cf-6b4d7315217mr10362792a12.41.1793729335335; Tue, 03 Nov 2026
 10:08:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
 <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu> <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
 <aunnuwhsx9ZOOXBX@redhat.com>
In-Reply-To: <aunnuwhsx9ZOOXBX@redhat.com>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 4 Nov 2026 02:08:41 +0800
X-Gm-Features: AclHuK8P6bHHgBWP0bpAQALyo5aHjtSP7ofvKj-lRIfhjZfCfQMKs0HHJgLdFgo
Message-ID: <CAE2XoE9Kj+C3JLvWMzuGLbBsaFY4KQMhxnwLNwAAhzRmZAFj9w@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo registration
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, 
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org, 
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
X-purgate-ID: tlsNG-ef75cf/1793729336-37CD7AE4-4ABA6D12/0/0
X-purgate-type: clean
X-purgate-size: 5759
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 9:55=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Tue, Nov 03, 2026 at 09:48:44PM +0800, Yonggang Luo wrote:
> > On Tue, Nov 3, 2026 at 9:23=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.=
hu> wrote:
> > >
> > > On Tue, 3 Nov 2026, Yonggang Luo wrote:
> > > > On Tue, Nov 3, 2026 at 4:16=E2=80=AFPM Daniel P. Berrang=C3=A9 <ber=
range@redhat.com> wrote:
> > > >>
> > > >> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
> > > >>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> > > >>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> > > >>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo an=
d the
> > > >>>>> type_init
> > > >>>>> function that calls type_register_static(). A later change need=
s to
> > > >>>>> pass a
> > > >>>>
> > > >>>> That's the point of the macro to hide the boiler plate code.
> > > >>>>
> > > >>>>> target mask into that registration, and the macros have no para=
meter
> > > >>>>> for it.
> > > >>>>
> > > >>>> Couldn't you just change the macros to take that parameter inste=
ad of
> > > >>>> expanding it everywhere?
> > > >>>>
> > > >>>
> > > >>> Problem of macros is that they don't have default parameters, so =
you
> > > >>> need variants for everything:
> > > >>>
> > > >>> DEFINE_MACHINE
> > > >>> DEFINE_MACHINE_EXTENDED
> > > >>> DEFINE_MACHINE_WITH_INTERFACES
> > > >>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> > > >>> and now would need a new variant, with variant for other existing=
 ones.
> > > >>>
> > > >>> In the end, it's just simpler to remove this and add the boilerpl=
ate.
> > > >>> It's written once and never modified, so using a macro just save =
typing
> > > >>> those lines once.
> > > >>
> > > >> For each machine, it is only written once, but we add machines
> > > >> over time, and every time a new machine is added the code style
> > > >> is slightly different. We introduced all the variuos DEFINE_*
> > > >> macros for QOM to better ensure consistent style and usage as
> > > >> new code is added over time.
> > > >
> > > > I understand that the DEFINE_* macros are bloating because of this.
> > > > Indeed currently the only two macros used are "DEFINE_MACHINE" and
> > > > "DEFINE_MACHINE_EXTENDED"
> > >
> > > There are a few machines using some others but these are the most use=
d.
> > > That suggests maybe we should change the convenience wrappers to matc=
h
> > > what machines need but DEFINE_MACHINE_EXTENDED is meant to be the one=
 that
> > > allows all parameters which should be rarely needed.
> > >
> > > > ; each time people want to add a new attribute, the macros is twice=
d.
> > >
> > > Not necessarily. The SECURE parameter did that to preserve previous
> > > behaviour but if you add new parameter changing all callers (which is=
 the
> > > same as expanding the macro that would also change all callers) then =
it's
> > > just a new parameter added not changing the number of DEFINE_MACHINE*
> > > wrappers. Rearranging the wrappers to make DEFINE_MACHINE_EXTENDED us=
ed
> > > less is an independent change.
> > >
> > > > And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replace=
d
> > > > with DEFINE_TYPES or TypeInfo
> > > > and be more explicit. When we used as macro parameter, we need thin=
k
> > >
> > > But that defies the purpose of hiding the QOM boiler plate as much as
> > > possible. New people are confused by QOM and it's easier for them to =
look
> > > up documentation on the DEFINE_MACHINE* macros to see what parameter =
is
> > > what and not care about how it's stored in QOM TypeInfo or what is th=
at
> > > at all.
> > >
> > > > what's that parameter means, and for
> > > > TypeInfo, we can directly know what that member is about(because we
> > > > are assigned with the member name).
> > >
> > > The parameter also has a name and documentation so it's not simpler t=
o
> > > look up TypeInfo than look at the macro definition or docs. In fact i=
t's
> > > harder to guess from TypeInfo as then you also need to get into QOM.
> > >
> > > > That's why I suggest keeping a single DEFINE_MACHINE, just like
> > > > DEFINE_TYPES; as they are the most
> > > > used macros(and simple enough), and won't suffer from changes much.
> > >
> > > That means exposing all the boiler plate for all machines other than =
the
> > > simplest case. I think it would be better to keep DEFINE_MACHINE_EXTE=
NDED
> > > but maybe rethink the existing wrappers and drop unused ones and mayb=
e add
> > > new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still k=
eep
> > > the boiler plate hidden.
> >
> > Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACHINE=
_EXTENDED
> > and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
> > "targets" or "arch_mask" parameter.
>
> Given that we don't need to do general per-arch type filtering in
> QOM, we could just move 'is_available' out of TypeInfo, and into the

Hi Daniel,
The "is_available" is used for dealing with the QOM name conflict,
that is before the calling
to MachineClass call or any other class_init.

> MachineClass, so it is a regular class level property, which can be
> set in the class_init methods, and thus avoid any changes to the
> DEFINE_MACHINE macros.
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

