Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03011606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 31 Oct 2026 02:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdJdE97L
Received: from list by lists.xenproject.org with outflank-mailman.1466579.1676477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMzH9-0007dh-5J; Sat, 31 Oct 2026 02:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466579.1676477; Sat, 31 Oct 2026 02:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMzH9-0007da-1Q; Sat, 31 Oct 2026 02:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1466579;
 Sat, 31 Oct 2026 02:56:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMzH7-0007dU-8N
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 02:56:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMzH6-004Z3k-Ld
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 03:56:56 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae557bb-8faa-0a2a0a5109dd-0a2a4501bd72-34
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 03:56:56 +0100
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae558f8-5984-0a2a45010019-d155d032dc42-3
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 03:56:56 +0100
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa4d71e7so1298586a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 19:56:56 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793415416; cv=none;
        d=google.com; s=arc-20260327;
        b=HU4+s9XfR6FyTB1eUbyqKl9UylnTr/MyKfaG0exVfG+2jaS18gC0eZWLGH2bTaqk2b
         OIWVb7mmDjOU3HWLE2NetO2eXg1FwOksChcvULfgxzhGjIdL+Nso4zAfOoCM5O3lF5pp
         2T7CKxTcKpf7QlHniurO8AwuqFCwAoKysJclLLizzqNy2R8mq6E1EHxbGNiCVXuOR+qj
         aE836tltfxFvMz7ytjhi+Hucs0tvD3darR2lxwnf/HOSBe3OC6Qz06Rgv7RezGU8DMqZ
         tFdKBgzFHQprnKQ4EDeKT5FxJ53LdFERlmqGk5jdjR1NP/g2WecRy7bFC7TydFZn4WCa
         G5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=IrJEK4Rz34flPDpX3IpkuF++CG2fC1jTcOILK6FoJl8=;
        fh=mxu9rumstr0BDuoLrGDO/mSOfGVKbtHSZrFNXT8jHwU=;
        b=TiOV7lxoJhDZyyNaG9FVFXGHxY28EMClQBEc3ugH9L6QuaoTREM+Pdfo2RpW4S97P9
         vQSZLeFsiW5yb4dhGzcH6GCWmbIUx5HIpTwEzNFnPjnN3HqDZsWppjExONDoEO4bKraZ
         w9pjXQfRwgp4r8No1Pwut8zTTN00RBb6Gz3ySUXCV1h2GFU+Enbi1wau9+HeyygaGzu2
         oiI+oJOkplR+WjVKig/+Fd5Sa1rgfCPy/Hvmh0IfgGox42ul9C7L7zBcGhpSg1MStmZI
         90UybspUuJ7L+9E1fApmF7gSOm8k+B1EMzHiId5UAO72f9ZmC3rcCfiBdRthj17CzrFh
         j6BA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793415416; x=1794020216; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IrJEK4Rz34flPDpX3IpkuF++CG2fC1jTcOILK6FoJl8=;
        b=tdJdE97LF5JrsOAa9DD8se2T7J0aMn2WlorS+rMSQ4QPyp+hZ6SGxfnYIRUmUaySTd
         7+GovuCp4FVYZTGuRLZMyDGGSAJ9rscRTMM3pOSLNGk26yb+B/6HXV2jSc9HReIS2/YL
         0OnbN23ojwGskSbCm3zdVf8NRHdY5AJMshEFImFd3wxZ7GMqkgwVtsqKkTFeq2rw2Q39
         vkvl0ocngFC6GjuN6pRitjPKtD3i+6ISX/OLSvGd7Vx0dUBw1sxYbdh6Ux6eT2TgFYd0
         LnGwHY6P53dO8kTCP+oiB0bPuDlCNbGEh9qj0pVMpXzcBJcM+ybGtY/s9dTbqV7EvMkk
         WyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793415416; x=1794020216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrJEK4Rz34flPDpX3IpkuF++CG2fC1jTcOILK6FoJl8=;
        b=S6LSw1iFO5a0ZxMT222dtzzvBdj1kYh2JMauzLp2eLfcvW1goJBPuT8LR/Poph9cTQ
         Zunj5QCBAIJ4xl5mc24UZSjHCUBTVnxkquntRHhmiJi6MdbKKeXUMNgAvpDh0UOBlQnJ
         M2jUDwEdmjcpTzxl2E1WiJUeSVrzbvCzWAS5ZrlnJ3Rbfzgtw/eOh1e6dOuP7RYZCfjM
         EPqjDtsD5QLFVJudPOE0rif1glesq9Md4O346WYX7X1aeiXZ5QQ2ObYFyzmoIAFz9i+R
         kGQfdeu8+M4XXWEX59OlyCpEhy0GpbSSvOWRXGsOwfP4q4QJWhnVV6o6xRem1FFuuvUS
         0Kcg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ6Ty0bIIoWDSvqiwrEpIwgzrdBQVP/6L1rfyTweWFhyhoGZkarXXMhCf2RcSNpnioaauJvUVwA4E=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLuSZMw+IL/MepvSUMD05pYXAmJ9femRCT97uVPPYtUivfL5X6B
	aR3rftCYVLsVM/W/ybAZLs2gmsK/CnldsEBqimrOwdcaGdWuAUEOHSm2Q4jkystND9tRNMUIzbk
	IDgqvsuYcA8qeLIvaS7E+UdtN4oJo7/0=
X-Gm-Gg: AYBFou3RX+doFF6w/wPdzbm0tRp5eqQ2DRHdzeuPk9jnZUk1drd8cJ3H5Gitv69ajH1
	0Q9B3DBeZrHZMvFIeB8V/uzhlzSUYzewUvAvPQV/kjcfgYzAXEvjF8ex2FsdvXUWtOlUt+gMfJj
	ZI9wgNEruNvrHenKh5Tk8fQzzUxYP617JiPjosK4ALegF8wnpj6/syntN5Cvw9jp2fQcWaSgiA3
	xjRRJr5FL9K/KZvmdOj3MFP9UpTi/aXPVxkuCPqEwL7z3ATyR/nL2nWgInS28h0A6cZruVXO4SR
	KbChaPaW5eFqe4cl0+gzfYbqT9bMdqdaxi22LWJT+LMqUSO+d8OUn2Njq4ct8fAaxpooQsDNat9
	CjZ1s4lOPu1gmIS/uKZTIVuwcxn47eCi00ZFw
X-Received: by 2002:a05:6402:15c7:b0:6b1:b5ea:2590 with SMTP id
 4fb4d7f45d1cf-6b4d438bb92mr2317970a12.12.1793415415904; Fri, 30 Oct 2026
 19:56:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
In-Reply-To: <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 31 Oct 2026 10:56:42 +0800
X-Gm-Features: AclHuK84ZjRzywlmKa-ru9qdyZRxP4WT2vvy0q6jx4JGmonAqySpYfbI_27IcMQ
Message-ID: <CAE2XoE_oqCTTz0y4gmpEyMZqcf-hCDWG7P6_B09Dmjn8XqsNgA@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo registration
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org, 
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
X-purgate-ID: tlsNG-d62444/1793415416-1E27A757-D642CABA/0/0
X-purgate-type: clean
X-purgate-size: 5213
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 9:51=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> > On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
> >> type_init
> >> function that calls type_register_static(). A later change needs to
> >> pass a
> >
> > That's the point of the macro to hide the boiler plate code.
> >
> >> target mask into that registration, and the macros have no parameter
> >> for it.
> >
> > Couldn't you just change the macros to take that parameter instead of
> > expanding it everywhere?
> >
>
> Problem of macros is that they don't have default parameters, so you
> need variants for everything:
>
> DEFINE_MACHINE
> DEFINE_MACHINE_EXTENDED
> DEFINE_MACHINE_WITH_INTERFACES
> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> and now would need a new variant, with variant for other existing ones.
>
> In the end, it's just simpler to remove this and add the boilerplate.
> It's written once and never modified, so using a macro just save typing
> those lines once.

Yeap, as now I have a working TypeImpl::targets and TypeBucket locally, tha=
t
looks minimal, so I am moving forward. This series is reject, then let
us delay the EXPAND
of DEFINE_MACHINE_* macros work later.

>
> > Regards,
> > BALATON Zoltan
> >
> >> This series expands every caller first, with no behavior change, so th=
e
> >> follow-up only replaces the type_register_static() call.
> >>
> >> Each machine file gains a class_init function, a TypeInfo, and a
> >> type_init
> >> function that calls type_register_static(). The last patch removes
> >> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards=
.h.
> >>
> >> Yonggang Luo (15):
> >>  hw/alpha: expand DEFINE_MACHINE in dp264.c
> >>  hw/m68k: expand DEFINE_MACHINE for M68K machines
> >>  hw/microblaze: expand DEFINE_MACHINE for MicroBlaze
> >>  hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
> >>  hw/arm: expand DEFINE_MACHINE for ARM machines
> >>  hw/riscv: expand DEFINE_MACHINE for RISC-V machines
> >>  hw/core/null-machine: expand DEFINE_MACHINE
> >>  hw/mips: expand DEFINE_MACHINE for MIPS machines
> >>  hw/ppc: expand DEFINE_MACHINE for PowerPC machines
> >>  hw/sh4: expand DEFINE_MACHINE in r2d.c
> >>  hw/sparc: expand DEFINE_MACHINE in leon3.c
> >>  hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
> >>  hw/xtensa: expand DEFINE_MACHINE in sim.c
> >>  hw/xtensa: expand DEFINE_MACHINE in virt.c
> >>  hw/core/boards: remove unused DEFINE_MACHINE* macros
> >>
> >> hw/alpha/dp264.c                    | 18 +++++++++--
> >> hw/arm/bananapi_m2u.c               | 18 +++++++++--
> >> hw/arm/cubieboard.c                 | 19 +++++++++---
> >> hw/arm/digic_boards.c               | 18 +++++++++--
> >> hw/arm/imx25_pdk.c                  | 18 +++++++++--
> >> hw/arm/imx8mm-evk.c                 | 20 +++++++++---
> >> hw/arm/integratorcp.c               | 14 ++++++---
> >> hw/arm/kzm.c                        | 18 +++++++++--
> >> hw/arm/max78000fthr.c               | 17 ++++++++--
> >> hw/arm/mcimx6ul-evk.c               | 18 +++++++++--
> >> hw/arm/mcimx7d-sabre.c              | 20 +++++++++---
> >> hw/arm/msf2-som.c                   | 17 ++++++++--
> >> hw/arm/netduino2.c                  | 17 ++++++++--
> >> hw/arm/netduinoplus2.c              | 17 ++++++++--
> >> hw/arm/olimex-stm32-h405.c          | 18 +++++++++--
> >> hw/arm/orangepi.c                   | 19 +++++++++---
> >> hw/arm/stm32vldiscovery.c           | 18 +++++++++--
> >> hw/core/null-machine.c              | 18 +++++++++--
> >> hw/m68k/an5206.c                    | 18 +++++++++--
> >> hw/m68k/mcf5208.c                   | 18 +++++++++--
> >> hw/microblaze/petalogix_ml605_mmu.c | 19 ++++++++++--
> >> hw/microblaze/xlnx-zynqmp-pmu.c     | 19 ++++++++++--
> >> hw/mips/boston.c                    | 18 +++++++++--
> >> hw/mips/fuloong2e.c                 | 18 +++++++++--
> >> hw/mips/malta.c                     | 12 ++++++--
> >> hw/ppc/amigaone.c                   | 18 +++++++++--
> >> hw/ppc/pegasos.c                    | 21 ++++++++-----
> >> hw/ppc/ppc440_bamboo.c              | 18 +++++++++--
> >> hw/ppc/prep.c                       | 18 +++++++++--
> >> hw/ppc/sam460ex.c                   | 18 +++++++++--
> >> hw/ppc/virtex_ml507.c               | 18 +++++++++--
> >> hw/riscv/boston-aia.c               | 18 +++++++++--
> >> hw/riscv/microblaze-v-generic.c     | 18 +++++++++--
> >> hw/sh4/r2d.c                        | 18 +++++++++--
> >> hw/sparc/leon3.c                    | 18 +++++++++--
> >> hw/tricore/tricore_testboard.c      | 18 +++++++++--
> >> hw/xenpv/xen_machine_pv.c           | 18 +++++++++--
> >> hw/xtensa/sim.c                     | 18 +++++++++--
> >> hw/xtensa/virt.c                    | 18 +++++++++--
> >> include/hw/core/boards.h            | 48 -----------------------------
> >> 40 files changed, 605 insertions(+), 142 deletions(-)
> >>
> >>
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

