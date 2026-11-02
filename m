Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376E606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xsbpw1JO
Received: from list by lists.xenproject.org with outflank-mailman.1468814.1677871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNy58-00069x-7k; Mon, 02 Nov 2026 19:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468814.1677871; Mon, 02 Nov 2026 19:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNy58-00069q-50; Mon, 02 Nov 2026 19:52:38 +0000
Received: by outflank-mailman (input) for mailman id 1468814;
 Mon, 02 Nov 2026 19:52:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xNy56-00069e-OU
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:52:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNy56-0063Zi-1n
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:52:36 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae8e9ea-2eae-0a2a0a5409dd-0a2a45038c54-28
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:52:36 +0100
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae8ea03-fae8-0a2a45030019-d155d02aa4ed-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:52:35 +0100
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6b4a13789b0so10424a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:52:35 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793649155; cv=none;
        d=google.com; s=arc-20260327;
        b=MWD8DCE8gV1Gb7WDUp5jaZuqkF9qyZzPN2O3OWxRYWIP77hwLZZUQUztOavaFnhObB
         J7C4heoESuDenuNYvYEFvsnlds9tKv15wX4GXc5dc0Fpd3zayqN0ou1NsAXiHZrE9AIw
         J1AEYUnrTcTmIEdMw64F8juF2RfDAsnK5d8x0R8s3V1L65DIxF8U6BSuHkYGd8tznn5T
         JyoJUA9mZjR599YiK9g/qOPRGp8pHG8JvbF341Yc74miEjFnW/14Gs2O+Xd4WtnkfRnT
         WzSZC+JQVLPJAVlh/SpI7u/LXAVcjUo3JpvuUTqKDQwT6Wi6tE61ndT4ggE9B3v3ynLi
         /pjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=WQTIbX5JdTUQVlGtexv/4WqWe1FMQgrYxHR6l5IOF+E=;
        fh=Hk0XiwI4KP2xSzUfyWx/VA64nJYttDNwZJQ3FD7e8Ls=;
        b=NwVOXP73PAp6/4jvwV4+nMOlXG0VZHlHKRefEATTYjWj72VxSMBaolMW2g2p1J65Af
         E7XEuNw1jaQ6pd2E/8I5vaQ+1Q/y9O9AWoZn7yxFP8WE0u2vEuUHnjVffrRIcDKcZhCe
         7fNf/1k07vLKer9pae68lstlzOYo+ZAR7Wt9o3tWEsnNYoEdIaHUTEnFpQ8PKgxF7dfE
         HIGm1wcB8JxSysnYjUgsdi/xJmkBq4vxlf+8AeejK2+L7+kTWCfyo6QtrlkRhSFaqVX0
         uyjmUkEhGzszF+TFViBI6x2DHpYpKe1dc5GGRdqMiaY7iqB14hCPBkKaN6oxOmXY8CdO
         Y0yQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649155; x=1794253955; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQTIbX5JdTUQVlGtexv/4WqWe1FMQgrYxHR6l5IOF+E=;
        b=Xsbpw1JO9zPT7WZafDgUgF93Le+ENrM0InNaoTz0InI0ZS+aJnSF42ltlp2OR6BE+j
         nGSCZB9yHFuxXzNhHtKOIrmk8fOuRu/29a38MYYuQ7/EKfPn7V/yyyyDJ3N8XYcAWLVT
         5kiKr0nhr4OLyZfAAnJSQnJU9XeD7NkwB6hClBj2hYR8PUpO+PCw5FDRyJ4UrDhiwSjW
         Nok1br7GFOC1KHsaKkBf4TwTBdHTw2CZQXh9Zb2WekVe7hBBZkyoAYr5vaONGyApCBZY
         9wAl7E9j+dOAkE0hq7Oorm8XKYOGC2O036R4UMBKEgap5ejerR0U0nuao5ObfsA46sBl
         440g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649155; x=1794253955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQTIbX5JdTUQVlGtexv/4WqWe1FMQgrYxHR6l5IOF+E=;
        b=acTm44XMKATdzV1cc1yE3Xa01oxLu1pvNHnsREQalBEgRl+0+asfJ3u7GOyyAnjeXh
         3bU9VoX5I0yVIDbwl6jttPNAVyj2jAZ78wLxlmDYu/IV81CSWn+hfVjsVwPLQCuVULTL
         +6uj7RVWhn1wtDGH3dTshH0IjyEk+yegLDgzNy8q0aWu1q64hwIjN8I3sBth+lr3U1XF
         Q9A3npa0m/1L/Uak+6mXYZ0D6t0941mHbmBxX+sNc+aYs4XXNsu4olgcIFGUeuEOrMlv
         GwfGbx+BH55J3FNQMI0QmDab4ed0v1Ojhc3xBBNSMgmPEvHhLdB+pfZ6QnTeE77Y1kST
         kLfw==
X-Forwarded-Encrypted: i=1; AKwUvBwGonVhTIhb7s713xlHSmisI4uT4/ZKoBY0TrFjK1PYuMVsF7NtXSKxD+qTECU1hcJDqxuYtEj3D7Q=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/aekMx9emxbXs1PLWwIgJspJ5ILqT9aUIGvCH+OwpRDblFeJjb
	LUdap5Zi16mNz2gKGOsrLyiEr7snqOkyANrSWqLWKriBtk+O3qlkUlsOfuiI8vi7b71mbuIn2G2
	WdlGeOceS3BVGKFjZ7cgaMOfHRtclEeY=
X-Gm-Gg: AYBFou2ZpZMuV7jl07TLVke/3sdvXpLBGn1DHIu9ggMoBI8LRF0Rkb015RtWhMJebBb
	eDtBFNiELVULwKAAfqrHmUH1Sfe78REHa6xQUEAZI6YTwfgZNFwFijkex2+dTAEErIp65KCOpLB
	1xVl861W2AamCeaK+jxGoZSGNVsoBKt1qPMYPYEz64YLkdpZl1QXzO/sx9B5FLBXYK2kLreDF5L
	Isv0TrXC3Don/MshhLhVLDKxjK+RnbPr9O/ByIRN+6rzWib71vxXLdtELZTM6wqw0kvswgQpR2x
	egjUmmfJlseicCFf/V5eVSr/QesoYZkrSK5V185RXZHwWWnw9lePhNW9L+3Qgp4ds3ikprtmIsc
	ZoP4g+KqEXGTwhJBEudZeWioRvi75hyPr9yXS
X-Received: by 2002:a05:6402:3053:10b0:6b1:b9e9:6cfe with SMTP id
 4fb4d7f45d1cf-6b4b0bececdmr8268993a12.14.1793649155279; Mon, 02 Nov 2026
 11:52:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
 <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu> <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
 <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu> <CAE2XoE-2w3A4=BeskGgp7NYUtkRVNkNufu4SZjW_OQ-KAQZvhg@mail.gmail.com>
 <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu> <CAE2XoE8pNaP3rAR5Y2BpUZ2vSu-UC-wG9V9U7gPXrEGY=kx0RA@mail.gmail.com>
 <e5ce0ea8-7e97-aa76-6384-025fc43cb85a@eik.bme.hu>
In-Reply-To: <e5ce0ea8-7e97-aa76-6384-025fc43cb85a@eik.bme.hu>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 3 Nov 2026 03:52:22 +0800
X-Gm-Features: AclHuK82GezjZPRO-2ox9Q6IyePg8CIOMyNBfIjTMU_9_XCKLkBdJwkzzFN--44
Message-ID: <CAE2XoE-459vCeK1O__iCs_hgMfMEQHWf_f_=hXG4ZhMJ1Z4aBw@mail.gmail.com>
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
X-purgate-ID: tlsNG-33051d/1793649156-77AC44E9-941A5570/0/0
X-purgate-type: clean
X-purgate-size: 10439
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 10:56=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:
>
> On Mon, 2 Nov 2026, Yonggang Luo wrote:
> > On Mon, Nov 2, 2026 at 4:57=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.=
hu> wrote:
> >>
> >> On Sun, 1 Nov 2026, Yonggang Luo wrote:
> >>> On Sun, Nov 1, 2026 at 7:29=E2=80=AFAM BALATON Zoltan <balaton@eik.bm=
e.hu> wrote:
> >>>>
> >>>> On Sun, 1 Nov 2026, Yonggang Luo wrote:
> >>>>> On Sun, Nov 1, 2026 at 1:06=E2=80=AFAM BALATON Zoltan <balaton@eik.=
bme.hu> wrote:
> >>>>>>
> >>>>>> On Sat, 31 Oct 2026, Yonggang Luo wrote:
> >>>>>>> On Sat, Oct 31, 2026 at 8:42=E2=80=AFPM BALATON Zoltan <balaton@e=
ik.bme.hu> wrote:
> >>>>>>>>
> >>>>>>>> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
> >>>>>>>>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >>>>>>>>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>>>>>>>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo =
and the
> >>>>>>>>>>> type_init
> >>>>>>>>>>> function that calls type_register_static(). A later change ne=
eds to
> >>>>>>>>>>> pass a
> >>>>>>>>>>
> >>>>>>>>>> That's the point of the macro to hide the boiler plate code.
> >>>>>>>>>>
> >>>>>>>>>>> target mask into that registration, and the macros have no pa=
rameter
> >>>>>>>>>>> for it.
> >>>>>>>>>>
> >>>>>>>>>> Couldn't you just change the macros to take that parameter ins=
tead of
> >>>>>>>>>> expanding it everywhere?
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Problem of macros is that they don't have default parameters, s=
o you
> >>>>>>>>> need variants for everything:
> >>>>>>>>>
> >>>>>>>>> DEFINE_MACHINE
> >>>>>>>>> DEFINE_MACHINE_EXTENDED
> >>>>>>>>> DEFINE_MACHINE_WITH_INTERFACES
> >>>>>>>>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> >>>>>>>>> and now would need a new variant, with variant for other existi=
ng ones.
> >>>>>>>>>
> >>>>>>>>> In the end, it's just simpler to remove this and add the boiler=
plate.
> >>>>>>>>> It's written once and never modified, so using a macro just sav=
e typing
> >>>>>>>>> those lines once.
> >>>>>>>>>
> >>>>>>>>>> Regards,
> >>>>>>>>>> BALATON Zoltan
> >>>>>>>>>>
> >>>>>>>>>>> This series expands every caller first, with no behavior chan=
ge, so the
> >>>>>>>>>>> follow-up only replaces the type_register_static() call.
> >>>>>>>>>>>
> >>>>>>>>>>> Each machine file gains a class_init function, a TypeInfo, an=
d a
> >>>>>>>>>>> type_init
> >>>>>>>>>>> function that calls type_register_static(). The last patch re=
moves
> >>>>>>>>>>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/co=
re/boards.h.
> >>>>>>>>
> >>>>>>>> Macros help reading the code not saving typing. If the actual
> >>>>>>>> functionality is buried in a lot of boiler plate it's harder to =
understand
> >>>>>>>> and spot bugs so putting the unintresting boiler plate behind a =
macro is
> >>>>>>>> better even if you need a separate version for different cases. =
Then the
> >>>>>>>> code that uses the macro will be much more obvious and not just =
a lot of
> >>>>>>>
> >>>>>>> I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHINE*=
 are
> >>>>>>> not defined properly
> >>>>>>> that causes them to not be extended easily.
> >>>>>>>
> >>>>>>> DEFINE_TYPES is another example, use them can extend easily, how =
about
> >>>>>>> always use DEFINE_TYPES?
> >>>>>>> Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and DEFINE_SECURE=
_MACHINE*?
> >>>>>>
> >>>>>> Maybe I'm missing the problem but DEFINE_MACHINE macros are just
> >>>>>> convenience wrappers around DEFINE_MACHINE_EXTENDED. So why can't =
you add
> >>>>>> the needed parameter to DEFINE_MACHINE_EXTENDED and use that for m=
achines
> >>>>>> that need it, or if it's needed by all machines then make the new
> >>>>>> parameter required and add it to all convenience wrappers too so y=
ou can
> >>>>>> keep using DEFINE_MACHINE* and just need to add one parameter to i=
t in
> >>>>>> machines?
> >>>>>
> >>>>> That's the issue, add parameter to DEFINE_MACHINE_EXTENDED means al=
l
> >>>>> calls to it also need
> >>>>> to be changed, that means touch many $target_arch files. currently
> >>>>> it's 13. But after these
> >>>>
> >>>> That's not different from expanding the macro which would touch the =
same
> >>>> files.
> >>>>
> >>>>> changes, there will be much more usage on it, and if we want to add
> >>>>> more parameters or attributes
> >>>>> to it, it will be a new tree-wide change.
> >>>>
> >>>> Do you expect to need more parameters? Can't you add them at once th=
en?
> >>>>
> >>>>> And DEFINE_TYPES do not suffer from such issues. As the TypeInfo[] =
is
> >>>>> explicit defined for
> >>>>> DEFINE_TYPES
> >>>>
> >>>> My point is that keeping the boiler plate as little as possible make=
s the
> >>>> code more readable. DEFINE_TYPES hides some of the boiler plate,
> >>>> DEFINE_MACHINE hides even more so converting to DEFINE_TYPES would e=
xpose
> >>>> some even if it's better than no macro at all.
> >>>>
> >>>> What exactly are the parameters missing from DEFINE_MACHINE_EXTENDED=
 that
> >>>> need to be added?
> >>>
> >>> Hi BALATON
> >>> the things we faced is we first is to add TypeInfo::is_available para=
meter to
> >>> DEFINE_MACHINE_EXTENDED, and have more usage of it.
> >>> Then we will add targets:uint64_t parameter to DEFINE_MACHINE_EXTENDE=
D, this is
> >>> a prepare to remove TypeInfo::is_available parameter from
> >>> DEFINE_MACHINE_EXTENDED,
> >>>
> >>> And finally, once all usage of TypeInfo::is_available can be replaced=
 with
> >>> targets:uint64_t, then we finally need to remove
> >>> TypeInfo::is_available parameter from DEFINE_MACHINE_EXTENDED,
> >>
> >> Is there a way to avoid the temporary is_available churn and introduce=
 the
> >> targets:uint64_t right away? (I'm not following this so I don't really
> >> know what you're talking about just looks like there's some churn here
> >> which might be good to awoid anyway independent of these macros.)
> >>
> >>> That's what I am facing now. And the explicit
> >>> static const TypeInfo xxx_machine_typeinfo =3D {
> >>>    .name       =3D MACHINE_TYPE_NAME("xxx"),
> >>>    .parent     =3D TYPE_MACHINE,
> >>>    .class_init =3D xxx_machine_class_init,
> >>> };
> >>>
> >>> Will help me avoid the issue. And I think this is a little boilerplat=
e
> >>> and very explicit.
> >>
> >> That's not all DEFINE_MACHINE hides though. It's longer with .abstract=
,
> >> .secure and .iterfaces plus the machine initfn that would also need to=
 be
> >> expanded if you used DEFINE_TYPES.
> >>
> >> Is this conversion needed for all machines using all DEFINE_MACHINE
> >
> > At the end, only "none" machine do not have targets parameter or
> > (QEMU_ARCH_ALL), as that's the sole
> > machine that supports all targets.
> >
> >> variants or only some of them? If the latter why not convert those to
> >
> >
> >
> >
> >> DEFINE_MACHINE_EXTENDED and then only that macro needs to be changed w=
ith
> >> other wrappers passing a default value without needing a new parameter=
.
> >> That does not work if all machines need to do this but even then, keep=
ing
> >> the macro and adding a new required parameter is better in my opinion =
as
> >> it keeps boiler plate hidden.
> >
> > Another option is keep DEFINE_MACHINE and introduce DEFINE_MACHINE_TARG=
ETS
> > and remove DEFINE_MACHINE_EXTENDED, and we only use DEFINE_MACHINE for
> > simple case,
> > that is parent is TYPE_MACHINE and have no custom type and no more
> > attributes assigned.
> > DEFINE_MACHINE_EXTENDED is too verbose, when calling it, it less clear
> > than calling to DEFINE_MACHINE.
> > And if we want to set more attributes to TypeInfo, just expand it to
> > use type_init or DEFINE_TYPES, how about this way.
> >
> > This will be something like:
> >
> > #define DEFINE_MACHINE_TARGETS(namestr, machine_initfn, targets) \
> >    static void machine_initfn##_class_init(ObjectClass *oc, const void =
*data) \
> >    { \
> >        MachineClass *mc =3D MACHINE_CLASS(oc); \
> >        machine_initfn(mc); \
> >    } \
> >    static const TypeInfo machine_initfn##_typeinfo =3D { \
> >        .name       =3D MACHINE_TYPE_NAME(namestr), \
> >        .parent     =3D TYPE_MACHINE, \
> >        .class_init =3D machine_initfn##_class_init, \
> >    }; \
> >    static void machine_initfn##_register_types(void) \
> >    { \
> >        type_register_targets(&machine_initfn##_typeinfo, targets); \
> >    } \
> >    type_init(machine_initfn##_register_types)
> >
> > /* Implicitly insecure */
> > #define DEFINE_MACHINE(namestr, machine_initfn) \
> >    DEFINE_MACHINE_TARGETS(namestr, machine_initfn, QEMU_ARCH_ALL) \
> >
> > As the many call is to DEFINE_MACHINE.
> >
> > And after all conversion, all existing usage of DEFINE_MACHINE will be
> > converted to
> > DEFINE_MACHINE_TARGETS.
> > DEFINE_MACHINE will be called for ('none') machine or future heterogene=
ous
> > machines
> >
> >
> > Either way, these patches will be dropped. We will introduce
> > DEFINE_MACHINE_TARGETS first.
>
> I think I'm lost and cannot follow what you want. As far as I understood
> you want to add a new field "target" to machine TypeInfo but instead of
> adding that straight away you proposed to first add is_available then
> later replace that with target. I asked why do you need is_available and
> not add target right away?
>
> Then if this target parameter will be needed for all machines why can't
> you add that to all DEFINE_MACHINE macros as a required parameter and set
> it for all machines passing it through to DEFINE_MACHINE_EXTENDED which
> sets in the TypeInfo. That way no machines need changing other than addin=
g
> the target parameter to the existing DEFINE_MACHINE calls.
>
> What am I missing?
Or sorry, I did not explain well.

I means reshape DEFINE_MACHINE like

https://lore.kernel.org/qemu-devel/20261102194826.1298-1-luoyonggang@gmail.=
com/T/#u

basically every call to DEFINE_MACHINE needs the targets parameter.
So we can always passing targets parameter for DEFINE_MACHINE.

And I think we can remove DEFINE_MACHINE_EXTENDED, as the call to it is ver=
bose



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

