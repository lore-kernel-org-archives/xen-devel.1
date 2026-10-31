Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D5B606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 31 Oct 2026 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9YzUz4u
Received: from list by lists.xenproject.org with outflank-mailman.1466790.1676530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN9oy-0007Qp-AN; Sat, 31 Oct 2026 14:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466790.1676530; Sat, 31 Oct 2026 14:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN9oy-0007Qi-74; Sat, 31 Oct 2026 14:12:36 +0000
Received: by outflank-mailman (input) for mailman id 1466790;
 Sat, 31 Oct 2026 14:12:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xN9ow-0007Qc-H6
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 14:12:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xN9ov-00CLE0-QE
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 15:12:33 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae5f6f3-e002-0a2a0a5209dd-0a2a4502c7b6-42
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 15:12:33 +0100
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae5f751-6ca4-0a2a45020019-d155d02fe0e5-3
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 15:12:33 +0100
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6b1dae0febeso2247272a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 07:12:33 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793455953; cv=none;
        d=google.com; s=arc-20260327;
        b=mseYNO/VWOhSdfU4CN740i0nKn1V4Pk9mjxDpAhQ7rhTLZVoFXIw/USwGXmHvqzPW9
         GJnbOMPg+CKXgzDpz/xf5YPcOzLfAy+wlE4hdoFFHuyMHkW5Mi5nEtflwwYTZ0Aqy12J
         ZzHtg87t0dJXlU4ZYx2pkVpK/9pEeZiLc146IavCHse6ZLRTsYmZp+OZaUa/y44I3QOi
         tl82l6ulHd20L/+6iJUA9/WZN+VXb9a5La0Emd11jJVo5C5plTd/EUuVNujzPlOKUcX4
         37EFF49Ouqes2U98mEl/wm1sfA9bpPHLGA5QoUKjtTi6MqGrSAFt3lNyOv85fQIXbgHw
         fzZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=pUOpZRf0p30wCsLBnhRcgac97jM7shsYjyb+5CboCrE=;
        fh=7vRXhiVoUPRCCwRqKs6J8bIftUypVU/D6vh0Sy/TYq8=;
        b=QnaTsX+2l1qbufak3Ed65XhaLVN3EJEOsi5Us0lD7vRPtA6lgBR9bQvJPw7UENPpG8
         zGbiuSR5LLseAannB8h7kGlrJH540YTyobReQMCoPztugfLWC8WD3zxbRC2CkTFbtNJm
         zfyI0uz/mmDyljMcQZ+wAybY12rbBssMFFmOnQtcCGi+DiCMZkleGiaW6URDujWI+IpQ
         Fr7khXTY+dnoNB/pq1DlwwERV8Rwx/H6xMI2OeuFJXdX8UJN7M5hqHWxA19DLXH/tm08
         nJbRBMIU0EIGnFAeG6Sa9XYk1UPzR+IDk+jesPPlfXvtLZO6MqckhsNHxyI+xRGWtFLD
         d8Mw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793455953; x=1794060753; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pUOpZRf0p30wCsLBnhRcgac97jM7shsYjyb+5CboCrE=;
        b=M9YzUz4u3ja7XJa4QfIeAMLlKopotGDSD8rMHDkDnyQoEbwU8dUVhb5vNMRJm28b4W
         XNbddYv2OwEADXGjWH7Z63OXM97dh/8kOIJrLTbkQKHuTs4Fgf6ivohHL1clQN7qB0v+
         FBLOmJPvNf8vyVyjfLpKEHjHw4xc8SJFOHTw0wbyM4RlWv+n4foTIbyjIyZV6lAl6cg+
         SuH0nmw6PIDHNeA4Bj1FfbAEcTUJkh4ItbG7FIEGNyC+UjG8iPJW4/g8TrtQ3ht3VOiv
         TU+g4esC7iDatlGfPxAScmsGfSLX3gkwK2myDlhIs/6Jod+FdjqJrZV/5sGPCXj0k2c/
         33/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793455953; x=1794060753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUOpZRf0p30wCsLBnhRcgac97jM7shsYjyb+5CboCrE=;
        b=XnwrrHY2fhEXcw/NJntSwltVnztJU/s2rbcRCGwVPZF26BeKJZQj3i4XDSFffKP2u0
         6d3cPFcCKfJzZS+T6BvsrNRrv7cpzgMpcTePmGkEB0/G9kQd5Xl+SoJYa3xAJrYWSJt2
         R9AvMuHgxLlYbTsdUgR2gYBR/xS4WCtP83SQPmKqrgQChDNYuwJ+7LmAirt6VHZBcDh1
         sS1jTdqNNWDzVVSmFjwPl/H/5cJo8cZ4H2m0WNgvrJ42OYi6ZqisJeJEX0iB4qvppb3y
         Q4OiAQ1csrC7ENShr9t4xm0nFP1KKtiXcpdRi1PDfaCqOE+yvtWhF4ghbTA3AXO16f6l
         EWPg==
X-Forwarded-Encrypted: i=1; AKwUvBw7jjNepAP4V8AT1eB/QBb/GFT38txE0cRhEmCadkAk0vzk94K+ICoExLv2wSCAbF+o4pt0GboGOMk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ/h0kB/q+Fiq5aJknbhpV9ay2phJ+uwskBb5UrDjAJ/+krLlW+
	kk/iJoKh2nR5Vc9lZx1afLyZC0prVMkxspcP7tcb1viRQEyCd+cbUlQhcMmWMi7KwJfxIlfDjnu
	8AkTIDDAtC4lw+Jzp9ZXfMcEX536Ch/Q=
X-Gm-Gg: AYBFou0SuBHf+ELW1h9FqUv/G5DYGjkEgzDGWa16KrYc7XK+7UOOdVxlu+kVs9W3rKv
	l59NkoI8kSrBWy4MeGRjqBvFeAqVcvaUXDJgieX4wUOg9STq2nxr+m8n19IfYvsD2HAmkCsRF6N
	+UA/5bzJqGDPoJMB+vxCxk/KdCOFf3+dDzkbEZ8nTPk7l6X+KTOFuHqgcBPAhE3tZ53Uy9pUe7I
	HiFg9X63xcPdUUmm1xY63PeeSAk0uJGZTeDuZWfnhG4siH4snIAk/hOKqjjHKacgXtpsEDGcros
	YM3Fwgoy/ajhFjeTNRYWC3us/OPIA3x3I7tuAOELxkD3WzjlFLeB9lOdc8z2g7zFUf5BuKAkOaB
	TMbJs+KZxWDweXeZ7Golzwj3EjK+j4sshtY43
X-Received: by 2002:a05:6402:44c8:b0:6af:a566:6f13 with SMTP id
 4fb4d7f45d1cf-6b4d5edb54fmr3002982a12.44.1793455953008; Sat, 31 Oct 2026
 07:12:33 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
In-Reply-To: <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 31 Oct 2026 22:12:20 +0800
X-Gm-Features: AclHuK-zfjnfDk2iP11Oo2plNAe19bvSiGLggXOtrbkzp1_jiPrf_zVAr1PBvDc
Message-ID: <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
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
X-purgate-ID: tlsNG-720697/1793455953-F3ABD2AC-8223F246/0/0
X-purgate-type: clean
X-purgate-size: 2517
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 8:42=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:
>
> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
> > On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
> >>> type_init
> >>> function that calls type_register_static(). A later change needs to
> >>> pass a
> >>
> >> That's the point of the macro to hide the boiler plate code.
> >>
> >>> target mask into that registration, and the macros have no parameter
> >>> for it.
> >>
> >> Couldn't you just change the macros to take that parameter instead of
> >> expanding it everywhere?
> >>
> >
> > Problem of macros is that they don't have default parameters, so you
> > need variants for everything:
> >
> > DEFINE_MACHINE
> > DEFINE_MACHINE_EXTENDED
> > DEFINE_MACHINE_WITH_INTERFACES
> > DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> > and now would need a new variant, with variant for other existing ones.
> >
> > In the end, it's just simpler to remove this and add the boilerplate.
> > It's written once and never modified, so using a macro just save typing
> > those lines once.
> >
> >> Regards,
> >> BALATON Zoltan
> >>
> >>> This series expands every caller first, with no behavior change, so t=
he
> >>> follow-up only replaces the type_register_static() call.
> >>>
> >>> Each machine file gains a class_init function, a TypeInfo, and a
> >>> type_init
> >>> function that calls type_register_static(). The last patch removes
> >>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/board=
s.h.
>
> Macros help reading the code not saving typing. If the actual
> functionality is buried in a lot of boiler plate it's harder to understan=
d
> and spot bugs so putting the unintresting boiler plate behind a macro is
> better even if you need a separate version for different cases. Then the
> code that uses the macro will be much more obvious and not just a lot of

I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* are
not defined properly
that causes them to not be extended easily.

DEFINE_TYPES is another example, use them can extend easily, how about
always use DEFINE_TYPES?
Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and DEFINE_SECURE_MACHINE*?


> boiler plate.
>
> Regards,
> BALATON Zoltan


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

