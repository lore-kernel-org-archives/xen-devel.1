Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784F606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3DnjTl2
Received: from list by lists.xenproject.org with outflank-mailman.1474473.1681588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOven-0006IV-BC; Thu, 05 Nov 2026 11:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474473.1681588; Thu, 05 Nov 2026 11:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOven-0006IO-7o; Thu, 05 Nov 2026 11:29:25 +0000
Received: by outflank-mailman (input) for mailman id 1474473;
 Thu, 05 Nov 2026 11:29:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xOvel-0006Gv-Tu
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:29:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOvek-00Dgfk-JI
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 12:29:22 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6aec6887-bab6-0a2a0a5309dd-0a2a4508a8a6-24
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:29:22 +0100
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6aec6892-f659-0a2a45080019-d155d029d004-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:29:22 +0100
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6b56c428212so1412122a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 03:29:22 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793878162; cv=none;
        d=google.com; s=arc-20260327;
        b=aVjy1k97os2aY/yIcJuafNPb+8r11ZSs5/qVTl2P2NSOZDAS6N+srF99ZqDM0sMhpj
         lm1PGjCiD0MS44N8RvSVBA7SVvZ8r2K+jHymwlihv0hA54H89Msv7HCGiAoiiEVkwQcg
         BBocrS9A9e7NDrwR8FlDqHeaEykgnuWzC/IyhS8Y93W8gOlKXY3ZfRAjum1bM9fgBVSZ
         nojFSpyyvOaVNjp/NK/NZSi6n6MVhVrVTV9J2Jfnft8ZEZGF03L+mpP84cQNST0Wpbqy
         X4uTqB/nOPbhwRnYg8J/ZN5VcWlDaRdwC+mwqWzwBHdPq46QYAWITVz5UDLSGlH0GYZc
         h8Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=N6YNeSVq516in4se9KIqzFq1rO/6YIHrrr7AeykheZo=;
        fh=WO+2NvSEfXFY/eK2blaRfchrtrM7RA095bDLGwZkWeI=;
        b=hqsa/zoaVEgf46aCLsSe9akzYmgbK4uGy0rg3riDQyXwlNRQwtvyvH2EgLHHmiKxMz
         dvjphsu6kbb4SYdpHwIzcmwgpkzNz53LOQ84kp47fjkOQdzp868HFFK7wv9xyQOW99CJ
         LJ/EiS74KY72o/JhgNFqeaoM4msx62Ygq+tSGlXI72rkVMJ06YuuN8G46OR/OHng2i3/
         u+B34FBp+vgRaizk/mrlIqAcGXRjhsToJnlsY+lINXRYVSYvKh99xeys8RbsWj1u5Y5+
         P6XIU+6EAuc0bk37VzAdo15KoF9gFNOtEaVWj597qWXLvYrE70MbnWbVJnxr0y1u1xAM
         Iq2w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878162; x=1794482962; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N6YNeSVq516in4se9KIqzFq1rO/6YIHrrr7AeykheZo=;
        b=j3DnjTl2DHzszfqaCRuRGVlUsJKKRy5fXhw5L9z/BFtixgvvU9uBEmFXtUPvLpRkUU
         CTBFXGqPvXVQAN9Rx1+sFcb4T8DrY5MZ8ejeSvNyxlvnt9PrtWuMcEtQgK63rqqYbvXv
         40kvQcEY+sv5Y0e6TFEvosRHDMhgJIlH7Y4Ank/g/Ds6HNDEHU6zkWHAUGhVe0hUoVfA
         2CRfKpPTmaBrGoUG0q92WmMJrY+P3WltYZ9sBiUTjtDEL0w9L1w6O9qgWv5Nk6VBHJB7
         DWLH4sHUKavSyxdo5CBxEy0vIvV3nnQp5uV/GG77vw9Isx0JBAylivx9pmgfEsnr01DU
         dSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878162; x=1794482962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6YNeSVq516in4se9KIqzFq1rO/6YIHrrr7AeykheZo=;
        b=jD9yYJmRTExuWKOsR5PRBiDz4jETl2G1c9K5jCZZZFWSAsteM4Sf2lyUXg7bHg3w1N
         b6j74AxijLTEg55vgMVLabasqNd7F9mIWYUOL5//YkD71iB4M58RTXfDUevpdzppzYpy
         DFKOfTBo0QaNH7sQr4ArD9YuC5yIuChEK4GOoN+o7gjgjhnChxRQ8R7DjnpH0saxY6EH
         wi1w/pB9EX5k7yYR0XsdEb1VY8lDrFb2m5nGu9FstOooiWxsKaK8DwSX0eUBLwT7tYdn
         dCd2YqaOc2Rcp7DVSQsBIt40xXbFrqWNSMk19CE01FK4bpeViSDnijTg+Y5j0X2cJdsJ
         2g2g==
X-Forwarded-Encrypted: i=1; AKwUvBxfu/VG1db+jWROAhL2eWikUwCzypmBSeS//AAkxTsEzZo+7qXtb91ebTkzj/JXWyUoxsLWYQdrrGc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9e8+WPurWuJKUrbdM2wF9TGteHS7a3FmTE1lG84B5HjPbePhzR
	B3uADiRCKEL5s/MhqOkB0xc2Gcz8D8X1vD9u7DDIZQwGsf1tLADLQ9ycyftxRa18k1qJEC6iwdp
	Mar08MoaJ4BYXmu4sxtqU2lQpTGqt6ug=
X-Gm-Gg: AYBFou36I60feLTxNSjakacKguHYzEuIMAhp1IPIezFgpldweefmPBfeRsT94OIt5rD
	3twtb5XEjmOOQ7pvzQ6FNb6nRA/s5NcBzuLspVWJE5jq5N+bxPTMY3qF2EgLr0E+ywFo42nr06A
	92HgzzlK4aPfQnRHaWHPkKAoT8TF9fQ0G/nl6+tphMRd+Ab0dyH4q1UxH/+8SOwpUPCc15ZxdC3
	MdnCDhDiKzUvmbdWYQ08y7+h3pwxrXwCMAMMuJ0TtKuz1BndTI03/dxSgKhRIHI1mZPZSc+4po9
	Ru/XrLyU799K8mdje4nF9nBJnfCCaTT55rRZmVxpFCQnS3tWxGl/BQyVcCOtXciMB8jVG4/v2gS
	YB2jC10wOhFuY1maS0yTzZFiK9/KQnE0KVEbb
X-Received: by 2002:a05:6402:1a23:b0:6ac:9a44:d404 with SMTP id
 4fb4d7f45d1cf-6b4d32890a2mr9686232a12.0.1793878161823; Thu, 05 Nov 2026
 03:29:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
 <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu> <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
 <aunnuwhsx9ZOOXBX@redhat.com> <45433754-3cea-41fc-9f45-65a328d0efca@oss.qualcomm.com>
 <auxaPyRRm3MTBz1f@redhat.com>
In-Reply-To: <auxaPyRRm3MTBz1f@redhat.com>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 5 Nov 2026 19:29:08 +0800
X-Gm-Features: AclHuK-4rXijL_AUOdDONNduLekRdI_s2YHPupRTfowSD0vm5SlSlXiC8G5KfNY
Message-ID: <CAE2XoE_=rb9rKyjVZXmBcAHU11554WTt0BkFoP6EAsDFQPEhiw@mail.gmail.com>
Subject: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo registration
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Anthony PERARD <anthony@xenproject.org>, 
	Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Philippe Mathieu-Daude <philmd@mailo.com>, Antony Pavlov <antonynpavlov@gmail.com>, 
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Jean-Christophe Dubois <jcd@tribudubois.net>, 
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>, 
	Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
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
	Artyom Tarasenko <atar4qemu@gmail.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1793878162-CF75B87B-8A61B36D/0/0
X-purgate-type: clean
X-purgate-size: 2786
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thursday, November 5, 2026, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Nov 05, 2026 at 12:27:18AM -0800, Pierrick Bouvier wrote:
> > On 11/3/2026 5:55 AM, Daniel P. Berrang=C3=A9 wrote:
> > > On Tue, Nov 03, 2026 at 09:48:44PM +0800, Yonggang Luo wrote:
> > >> On Tue, Nov 3, 2026 at 9:23=E2=80=AFPM BALATON Zoltan <balaton@eik.b=
me.hu> wrote:
> > >>>
> > >>> On Tue, 3 Nov 2026, Yonggang Luo wrote:
> > >>> That means exposing all the boiler plate for all machines other tha=
n the
> > >>> simplest case. I think it would be better to keep DEFINE_MACHINE_EX=
TENDED
> > >>> but maybe rethink the existing wrappers and drop unused ones and ma=
ybe add
> > >>> new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still=
 keep
> > >>> the boiler plate hidden.
> > >>
> > >> Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACH=
INE_EXTENDED
> > >> and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
> > >> "targets" or "arch_mask" parameter.
> > >
> > > Given that we don't need to do general per-arch type filtering in
> > > QOM, we could just move 'is_available' out of TypeInfo, and into the
> > > MachineClass, so it is a regular class level property, which can be
> > > set in the class_init methods, and thus avoid any changes to the
> > > DEFINE_MACHINE macros.
> > >
> >
> > Some cpus need it also, and it's used for filtering purpose at this tim=
e
> > (to avoid duplication at registration). We already depend on this behav=
ior.
>
> Can you give me more info on the problem with the CPUs ? What cases
> have duplicate class names with CPUs ?



Hi, please take a look at this

https://lore.kernel.org/qemu-devel/20261031164009.2048-1-luoyonggang@gmail.=
com/

Also the single-binary RISC-V patches also faced the same issues,
trying to access
the target_info() in class_init that can be also avoided by this idea,
the bucket TypeImpl .

The patches is at:

https://lore.kernel.org/qemu-riscv/20260916-hw-riscv-cpu-int-v4-0-babc367b6=
0f5@rev.ng/

The riscv machine  need choose different cpu machine according to the
target in class_init =EF=BC=8C

specifically
https://lore.kernel.org/qemu-riscv/20260916-hw-riscv-cpu-int-v4-1-babc367b6=
0f5@rev.ng/

https://lore.kernel.org/qemu-riscv/20260916-hw-riscv-cpu-int-v4-7-babc367b6=
0f5@rev.ng/

By the introduction of TypeBucket idea, these all can be resolved. and
we have no need to rename
The QOM typename at all.



>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>

