Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB33606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPVHutbj
Received: from list by lists.xenproject.org with outflank-mailman.1469927.1678692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFL4-00078R-Kv; Tue, 03 Nov 2026 14:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469927.1678692; Tue, 03 Nov 2026 14:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFL4-00078K-HS; Tue, 03 Nov 2026 14:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1469927;
 Tue, 03 Nov 2026 14:18:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xOFL3-000783-2B
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:18:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFL2-007VXV-FD
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:18:12 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae9ed24-8faa-0a2a0a5109dd-0a2a4509877a-0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:18:12 +0100
Received: from [74.125.224.42] (helo=mail-yx1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae9ed23-be1a-0a2a45090019-4a7de02acdae-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:18:12 +0100
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-676804a3a22so3411473d50.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 06:18:12 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793715491; cv=none;
        d=google.com; s=arc-20260327;
        b=k/xuzMYm4D90YMuzhObE/I7buHb0ZhN2PXTPX18pEHu+BeNaWPOuCFriGI6rM2ynbR
         uk/fUOPUwhFJ4/9ZMRr1ftj8zQKTD9siUCkI3EUl9Uic15lgpTcFs4IRPn6v5PvE4V/5
         xFeoTwfrbKUdn0OoxUpGApGyid+xHFw3MvY7Qvo6EPEQZ9tI1gXUQ29OxsmTtGjnFmFw
         Vkm4uUTVODzm2olGWu8cD8/7z7esA8gwL3cghxL+vhqN6Kup6b98TAh0o2NrntL8Jf14
         rjy3a2H24RvoFwtFXMd6WgpQpX/0uRLly1lNJOACocvYxKExUkdm3RthEz+MqAp8But+
         813w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=DrlFZ8OwnA0TZT2cK4MNtmqKlz1PKYoO5uN1djvDVsg=;
        fh=khySnZwG/T9OI5C1KmnFAPzmOCWObEtmu3CvtxoNID0=;
        b=UI3K4MEo9VKvIO3SMZvIbYyVbwU9hsPWi8aNZx1z02mC4rH8bfn3MrbaSQPPGfA0oA
         kgu6H3X0V312YozpH/KDLXprQzBWdQcr8pqstMP2OFNca3WXA9ErUPT9ioytOhFJrpc9
         DLeu2W6dVhDfWKRO8OvB79brCqajPTncYo1txCLuUHe7R4zPPSblFbtVaoToSM9AXbrD
         Sc80UoCZcq/B7MixeNXTuUDCgzjRJ08mlUiYpNtkXKBt/bCsdPDLsnIw9/OUe4Wyd68S
         ldwAC7ZlBH/Ji13n4M9ROUq9f+lAIW3T6CQ0tGiCdZQUHPZ4VSBfiyysGJ9H/epc5JG9
         l7MQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715491; x=1794320291; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DrlFZ8OwnA0TZT2cK4MNtmqKlz1PKYoO5uN1djvDVsg=;
        b=wPVHutbjaaP8vYNE+gGhDAXwMj/yKp7BFuT6Coh+n4ByksNEv58s1uwpskskV5xP7i
         fezgg+XW+vm42hqae4D60kLcV7Qma+WGKJaf7rhBwd1NO0hJFxP0lPkkh3By82+5kHIg
         Q2qN723AE6jdHRd2KROo7byxrwN20287Sx4j/cY/dtx6w/wlMwQT/lSJv+4shtUoxkbx
         B1xQk+LYskJ+0CSrFQv8TTeNqHGSiDNgj0VkEk5aM2HPwpY0B8SZfNqBt9CzcyJPxAwm
         /JS2jb+B8/FqJpjX8e5JnRT76sKp90eLY24WvoKrqZrUIxcESSYfQoSkGVJiGhZ92a5+
         u0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715491; x=1794320291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrlFZ8OwnA0TZT2cK4MNtmqKlz1PKYoO5uN1djvDVsg=;
        b=Ho3ZZD4itM1J3wQqj6tJl6yDUCq4ehwBr0/D0bcJ569yQlldbpNvTXN1khNZXDqobn
         2nqlDcpu8/wdUUrW/HMAVxr6ZltC0Gma6vAmbuQR+0niQWYJrKJptKYrwSSaUIJh91zz
         fVpAN20tKOuxeaTROviiIPuKBs2wRO9kOe6d++r2xi5xXTc8/+TWp2nv+oL2aT8FCS81
         WINQ8vWzJ/CP/JCsskOzU0pi2eWc9mv674xpaNPpcszaVG7eSajQLhp729cxiDYwDacU
         uLIJMPwwzjSE8qKAeM5uriSLT8jBtgZVQ9758mY7XpyBKWXUFl7Jlrej6ohQUvaLyc7d
         iC8A==
X-Forwarded-Encrypted: i=1; AKwUvBw27O0h+1erPL1KDH5TU+UmWhuQyBxD+2xw7kSfNRG4OUMM+Ik67bhOtnFkvi/SavAnOAzPiJ6fAJE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+zc1R8MQyzKX3ZAwpyhAVlNnfn+/xBXmGtfn88dCdBJF1NKsSt
	a5tr30zY0iwOxDphHgvFc70ALz5ZvkqhPvr396RAtKYcy3cZ6zMy/bxs06kXFKS3PbkTNocORFr
	CzJsVrxTI3YGeiB5GB2McxTqfeClgkWc=
X-Gm-Gg: AYBFou3+ZhL3zrUV3ByzMjEVroiOAEgDesoANt7LRq/itejqXK/cXFImBkufkuI7w7k
	GUI/sQa5J54Prts+1QRAR2kMjdcG1VD4EqICxZHGl578DGbKCsRAAAD/KLn9cLLzJT//BuSIohk
	OpKoUUJqAQ9kFbkST9vnJzKKARpB78RwROmAvp7AXPLaYoId4aHrnflou5U/COZNpiqlLA1fxfj
	mZr756hiZlAxyoOOv/H06QhcGThVA/ET8JbGBYwci/0KwIdYYSpAbhga2zwL9IhFZshDtxYtpBs
	s25yPvC66Mycfwa2csiI9RJMjsPZ0DX85sytfSMW2dmwq+o18cTCjwocQhrwuHJM/I0PLrko5Fo
	mIB0CKOPQxe2/JvCd1wmR0jddoxgX+biHcDCz
X-Received: by 2002:a05:690e:1288:b0:67a:2a60:355a with SMTP id
 956f58d0204a3-67ba50cf3f3mr9964430d50.94.1793715486001; Tue, 03 Nov 2026
 06:18:06 -0800 (PST)
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
Date: Tue, 3 Nov 2026 22:17:50 +0800
X-Gm-Features: AclHuK9FwIlA9RQMifRxUKLKMCqA8pdJuRMt5xIisjyLT66i66IA7_a2r-8WMT8
Message-ID: <CAE2XoE974tDG8fd6A_SGqwwXiAAjWTF37MCGm4Qo2-DbBQxjnw@mail.gmail.com>
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
X-purgate-ID: tlsNG-bad1c0/1793715492-FCE14034-7D42E0E5/0/0
X-purgate-type: clean
X-purgate-size: 6038
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

We do need general per-arch type filtering, not only the Machine,
Device also suffer from
this. So are the CPU QOM objects. Here the MR needs that
https://lore.kernel.org/qemu-devel/20261031164009.2048-1-luoyonggang@gmail.=
com/

And the add targets/arch_mask to
DEFINE_MACHINE_EXTENDED/DEFINE_MACHINE is for removing 'is_available'
latter, as is_available has restriction that can not works well for
target_heterogeneous


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

