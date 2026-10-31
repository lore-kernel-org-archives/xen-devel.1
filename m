Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741E606A31C
	for <xen-devel@archiver.kernel.org>; Sat, 31 Oct 2026 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ee5Lhr3b
Received: from list by lists.xenproject.org with outflank-mailman.1466910.1676547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNCgO-00054e-NU; Sat, 31 Oct 2026 17:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466910.1676547; Sat, 31 Oct 2026 17:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNCgO-00054X-Ke; Sat, 31 Oct 2026 17:15:56 +0000
Received: by outflank-mailman (input) for mailman id 1466910;
 Sat, 31 Oct 2026 17:15:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xNCgN-00054J-E2
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 17:15:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNCgM-002s0w-R5
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 18:15:54 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae6224a-2eae-0a2a0a5409dd-0a2a450bb2c0-0
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 18:15:54 +0100
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae6224a-b7e8-0a2a450b0019-d155d02af1be-3
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 18:15:54 +0100
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6b3dc272dcfso2268993a12.3
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 10:15:54 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793466954; cv=none;
        d=google.com; s=arc-20260327;
        b=OJqXnpdJnluG4t4KFmupSdR96WO4FPmvG4rqOTMGUw+FF/qE2CcBCKufiVZMQ0tfOa
         p729zhPpnbAAWp6BYJlYPoSqYHoY/wu/zH4dRpCoxb3zWSA16DNi36fdNQmSNZggRzVk
         WWQHZyxhty036ombvnAkQd2ic2PTqOW/x2PFNwcKYRbyFtyQpyC+ta/i6U0eEYIU3nbt
         tTMFkvGGf6R7N0QA5LOMFuIHLHQKHk1O/71C0JwDhPJZZrqxtBsSCcTSV/7q69yOWC/L
         HwbuALalVn84piu3tlWkh3+5TEMzbIUnEETyKHV4R7IEbK5Zvf9hrQYRaiBfcvFKX9b4
         h69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=jcR6W1B2xKRqIisqldgJOoXdL57ofMb0Mlm4KaPe//A=;
        fh=1brHGk+ZKkOhJK/cUatU/X7+CftIGqL2eo4p+OMGpFw=;
        b=n/fPV037EROKfZ7Di3S7G83DsSyvvXUyar3YJqwT/Ukunz7wZY7C+g3mQTxe+ZL+cY
         T8sIBEskJrWCv7bgL17QzqSQisvcvMeMUjqRY2Jcu+I2EJmFaI5baUbMt+7xOrbhtuB9
         hewgd+3zwDu2+QbmRupwaIs+ILOxGVpIAKl2dT1qlbE4wOjcW+gU6cPd3e5McBQN2lk8
         1anfZdVSYxJlX92/Cve+5JK7GkGjnidLF+I7Bnd7y6XOzlpEvF8OtulE//eOEqCBWaBv
         t8C1QqfRnwlPgmaxbkXvTIwvkyQooHnZ45BE/ExlNDtpqD6GA5M3WXLlZQekyhYazQiM
         7qFA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466954; x=1794071754; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jcR6W1B2xKRqIisqldgJOoXdL57ofMb0Mlm4KaPe//A=;
        b=ee5Lhr3bSMstoZY9Ie9GMBBynpRKmfCao84jUGMzsuVsi+lMYX5AN4ZmEQ14K0alYL
         x+zNKE61J5CBWQ9cc8U752t0PNQrAzYNNBD+jUAryVCECds+uDcVZIrqVpKLBvpkM8CW
         JenX/HFnqBd/U0F3y241RbUeVjyaDISUioZERQH13aeVKwJ7uWbSjnX2Z1qGSCWvJxW5
         Z9gl1aci0IX5gX67HHJ+65n2SqRM+P2w2CAbbv7XjiKYfIwHLmV3Dr/Z5WzUP4MeVv95
         jqoNvzJVya/H2S7X8eRzu1vs3aVXrx+UHGhH7iCFO2ca/ZiaEl2ALTAOinVV9KKRmKm0
         on+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466954; x=1794071754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jcR6W1B2xKRqIisqldgJOoXdL57ofMb0Mlm4KaPe//A=;
        b=BNTI2qdzzlpChcCamaCTQw3Wcs7u5v/DUXR1feEKUfoAzSMW+op7QEFKnUDANjRUl+
         PKUIisKYa2BpyA8BMcEPS+TctWc/3LbjQEYfxiBPw6VB1C1BjUHAPWd9JcerUaA1DDV/
         LKx27NBzqXSZS5dSz7rRI27MriskZzY5n/NA/A4BDZm96LP+kEjfTsfhcnxeF7Pu0nO8
         qZQyc8yE2q6nLsqpk6CT0zwzbnC46bilhZyOPfoxtSN6zjuLqOHCbaFlFzh9C/LbSNIp
         XCeo8W3hkasB/4bY90BLUmmJ8fX24ZkernROE5+azFhzrZS7UWuluVOCD3ChkkatxFeM
         iiiw==
X-Forwarded-Encrypted: i=1; AKwUvBwkaYYr7Zjh6c5TqgKFN7P++95WvbJIiZVdIUuUr1YyGYXbqYbCD45tSCGOuUO67gI6iU4duwxZytI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIEnArgReRTTsBtLNg5MCxecOuT4bMTTlgonZp0mVtXcZK3pzsd
	ySYiV1r5ySiFaIT3Ff/hsoMN29VBZfYdcoYr4g2JjNRHHQsFeLSHU4ra6V05QpvAuhfejVQgQsM
	RVQzbAyL5qYoRBFZILrfqsLRqRX+4OQA=
X-Gm-Gg: AYBFou2ZtZWUGZRNELObaADzsXs6Oj+4lHHQs7h+KOcwVDNra5hwZxmTuuxTmuwtHca
	wfHNLxQ8RzHdEx8Bn4g5+sJbJG/gQf0z5/5ErDLhUdhTNAfmyI1ud3LMvWoXma/9tcpq2TCGST7
	JNGHq6M6dTcruBW1sSxtQ/OGY0BSUM19WakB4nkQiSJDQz/GSKXxa/W/Zhd6/YGMw2yN9d9bWXv
	xgEoInzzskKjW21TyqowkGGy7Hhgk5f0D9QsooE+HREoT5SCPuL909LIy+7ohBD76E0L5+E4Ybk
	kDoOkQPvQNudkCiT5HFb3CrthCNeYUaP/yBHZWLekbI8EAVl6entNjo0sygoasHe6ONSzQUXEU4
	eq0Dx9Ag7+IXPhMGS8hqQpBdRyaw5u/+8uwrP
X-Received: by 2002:a05:6402:4505:b0:6b4:8d16:f026 with SMTP id
 4fb4d7f45d1cf-6b4d3391cd5mr3933460a12.1.1793466954061; Sat, 31 Oct 2026
 10:15:54 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
 <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com> <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu>
In-Reply-To: <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sun, 1 Nov 2026 01:15:40 +0800
X-Gm-Features: AclHuK8AaPCnv2Mbs_9iupAlH2py4_RazQLc7kNcPpAEEJrZBPKdgONHzmsQuE0
Message-ID: <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
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
X-purgate-ID: tlsNG-42698a/1793466954-1ACDF9EA-146C6B76/0/0
X-purgate-type: clean
X-purgate-size: 3697
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 1:06=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
> On Sat, 31 Oct 2026, Yonggang Luo wrote:
> > On Sat, Oct 31, 2026 at 8:42=E2=80=AFPM BALATON Zoltan <balaton@eik.bme=
.hu> wrote:
> >>
> >> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
> >>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and th=
e
> >>>>> type_init
> >>>>> function that calls type_register_static(). A later change needs to
> >>>>> pass a
> >>>>
> >>>> That's the point of the macro to hide the boiler plate code.
> >>>>
> >>>>> target mask into that registration, and the macros have no paramete=
r
> >>>>> for it.
> >>>>
> >>>> Couldn't you just change the macros to take that parameter instead o=
f
> >>>> expanding it everywhere?
> >>>>
> >>>
> >>> Problem of macros is that they don't have default parameters, so you
> >>> need variants for everything:
> >>>
> >>> DEFINE_MACHINE
> >>> DEFINE_MACHINE_EXTENDED
> >>> DEFINE_MACHINE_WITH_INTERFACES
> >>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> >>> and now would need a new variant, with variant for other existing one=
s.
> >>>
> >>> In the end, it's just simpler to remove this and add the boilerplate.
> >>> It's written once and never modified, so using a macro just save typi=
ng
> >>> those lines once.
> >>>
> >>>> Regards,
> >>>> BALATON Zoltan
> >>>>
> >>>>> This series expands every caller first, with no behavior change, so=
 the
> >>>>> follow-up only replaces the type_register_static() call.
> >>>>>
> >>>>> Each machine file gains a class_init function, a TypeInfo, and a
> >>>>> type_init
> >>>>> function that calls type_register_static(). The last patch removes
> >>>>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boa=
rds.h.
> >>
> >> Macros help reading the code not saving typing. If the actual
> >> functionality is buried in a lot of boiler plate it's harder to unders=
tand
> >> and spot bugs so putting the unintresting boiler plate behind a macro =
is
> >> better even if you need a separate version for different cases. Then t=
he
> >> code that uses the macro will be much more obvious and not just a lot =
of
> >
> > I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* are
> > not defined properly
> > that causes them to not be extended easily.
> >
> > DEFINE_TYPES is another example, use them can extend easily, how about
> > always use DEFINE_TYPES?
> > Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and DEFINE_SECURE_MACHI=
NE*?
>
> Maybe I'm missing the problem but DEFINE_MACHINE macros are just
> convenience wrappers around DEFINE_MACHINE_EXTENDED. So why can't you add
> the needed parameter to DEFINE_MACHINE_EXTENDED and use that for machines
> that need it, or if it's needed by all machines then make the new
> parameter required and add it to all convenience wrappers too so you can
> keep using DEFINE_MACHINE* and just need to add one parameter to it in
> machines?

That's the issue, add parameter to DEFINE_MACHINE_EXTENDED means all
calls to it also need
to be changed, that means touch many $target_arch files. currently
it's 13. But after these
changes, there will be much more usage on it, and if we want to add
more parameters or attributes
to it, it will be a new tree-wide change.

And DEFINE_TYPES do not suffer from such issues. As the TypeInfo[] is
explicit defined for
DEFINE_TYPES

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

