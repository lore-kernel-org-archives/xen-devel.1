Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E894606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFf1aFRi
Received: from list by lists.xenproject.org with outflank-mailman.1469839.1678593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEyT-0006Oo-Go; Tue, 03 Nov 2026 13:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469839.1678593; Tue, 03 Nov 2026 13:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEyT-0006Oh-E5; Tue, 03 Nov 2026 13:54:53 +0000
Received: by outflank-mailman (input) for mailman id 1469839;
 Tue, 03 Nov 2026 13:54:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xOEyS-0006Ob-LF
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:54:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOEyR-00EVGV-Mw
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:54:51 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae9e7a3-8faa-0a2a0a5109dd-0a2a4504dfa0-32
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:54:51 +0100
Received: from [74.125.224.42] (helo=mail-yx1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae9e7aa-b57f-0a2a45040019-4a7de02ab5ba-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:54:51 +0100
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-6768403e9bbso3698202d50.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 05:54:51 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793714090; cv=none;
        d=google.com; s=arc-20260327;
        b=iOGHjbAxAGbMi8IZ8S1fxj+dv0JZscJ4fTqmAd7EUIK/XWgfD24Os1vCve4naF7WDB
         Tmzfe85bsuaU1XrZmGRMi5wPdxK+Y6a6WJ11XZzIMC43SSYhIAQxi9cbndef30yuOZTv
         7ew10miNTGUANXuEVpNO6KbG4QJaapzeK29YLM+yiBQZynRHx02Qw2+aR3W3i24kHg9L
         HzdT7VNh2q/tXe/2bNkDId3qsPLc3/gbmXRuv8Q0omHfTfB2NaibzMnXgQhcLC/coVVp
         FWz1sZ4wk+WzE6k7d6AAMB1aS8tFWOJCkgpSQ5ffOjle/cJMOlU2wFKl/28/xn1lVc+i
         RDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=6k8h62aOYkjqCaz/dJEvILSpJELJU5ePM9R2kYQ9vjs=;
        fh=VRpaEudRyGnlhbHmDKPFZAX/1faN/SMXn8KSQ2ZV1fA=;
        b=a7wF/H7YeWAfnBlYaEV1IjcQ3SKZgSK+d6Pi5zrqWI3n/boVpuk0AWZT/Ge5sAmX7N
         w+dMMNePupbtjreyWSdlq5JGOvoV13NeZ2COWn1nAkRYsqO5t0+5qO2/1/9jVfxr8diG
         DVuEUwTid8tYKD/uKB6KCknM7c3fGkXLiCSiVXrbrueY0+/l3rBIZKxW5sVxwDkQFESd
         Sk0IP4HNMjGFh5K6BHuPlZiLBylO2Wyb3+anwim2GcrbfFt1hNbNeivoPGnMfhueYnMq
         3KM3CJWW36EoR7AhMK8+BObCh1jkwJtQF0rtPMKP4w/flBe6DJ8zl96z8V9N/ipgmM+/
         cqXg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714090; x=1794318890; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6k8h62aOYkjqCaz/dJEvILSpJELJU5ePM9R2kYQ9vjs=;
        b=cFf1aFRikAlU9m+zdT4xgPQUtNzXlRYUb4ZcWB09qm75hxYJ2Ww//2RwNBnS7wF+tE
         3sxePK1nCEO0B4dSCqLCBKRYVsppaPldY2V2o8FXC3oxoN50HuYMjN5JWa/44tnM/qdf
         3zQtEav8JkTyBPHUle/pwwPmaK4uhrxhJSkaiwOruMhLH4HYSJPB2i+kzyXGkaeBvcuX
         WSuwRm9gyC6GYQv+LoMVN5b6BpANlJm9Anjq5zzy4Jml9ipzovVprSROihFZe+9r3sbk
         yBW2fWQPHWlzQ7yDzd/Y1Vq31ePmYuWVOrndzmGYh/BJ409tDyzttw6r1wFokk8LM59/
         rbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714090; x=1794318890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6k8h62aOYkjqCaz/dJEvILSpJELJU5ePM9R2kYQ9vjs=;
        b=pEPwipWLdavn+QvLAA1xK7T9oFuPHJTrZ2BreJgNjJ6pGDZJ4AB2aKfnRyDP0MNFqt
         LrTcOLTWwBj6oHB1EdYIYaHn46yv30RmrJ0HHfJp+KBVZ0dOA4ACLd0tGN5xZmAyBTJo
         wclmq0v58aJhitAekwVij4jU6F7Y84Tq/WO1gC0UiUWO0D1ApgFCEwhJS/EizqGeP3VA
         /nribxTCdS5I748783JisiTDiJMwveS0YUVyWASU9zRv+GRHP5+tb57rXizMs65xrmLc
         /MWx+Mi8KXtE/dS2JEnU8J0qA7KAXFkDpUBxh6P3bZwm5LcHIr1AaaS+vBqcD3UPRcr4
         iHQg==
X-Forwarded-Encrypted: i=1; AKwUvBzu/MoGxdXBYoZIcl3A9XjQm5fDORcP5gzi2Q1VofOYFO9JSUU1Vnq4G/B7gTf5s0a1XIHqFHAS/2Q=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+N/tUQp+rDmf06mrqK0aJzEAWNcHh26dDY3BslgifGZjHBpa1k
	4lX6TfEsW3nUYl2vKN9tKSBDwI18Kjyc8jQDFzScGZ2UD1rohzJb/k5OWGiZP3ntBTWDz1g/2mn
	QxqtVTJS0r6yrFQ1TZZcE3E8dLCL9rtA=
X-Gm-Gg: AYBFou2BVt0+vzByQZqjd0oJQ6iKG3Qx3zy46ewTnBkP5/7vz6gLt7YHB92RQp7uLdH
	7J1TCZuMKC/8iCSKX9LkY7bAbmF+peEddFgr0ZgCeT7Nofhw34+lhAThZ3mz/WE1lOBwuSrk3WZ
	b81gKyeiGx2ZJs7+9XNER4Xb+ZnPQ19m7swCUjXV79prvxeCVVNx500ajPGDM6AHW0dxInSZOVh
	lZ6PHKpig6Ldwj3KPkn+e+uVl5Hn/LKhWCJ3gP39kow+tlaiYz7lYoDE9nSuekYv0uKcfy3K5B7
	Quh3Y/jKO7nNV7am3Ck9AM9I1xKxeQgwDF4vAAb+ImDTm3JTf/D9cGYZPdnbkueD3fGy8IpSXP2
	SKUdgmpDNfU6Liba4auq9rCSWfzhUh4MPPf99
X-Received: by 2002:a05:690e:1183:b0:677:cf9f:8fe7 with SMTP id
 956f58d0204a3-67ba4ed9d5fmr11680878d50.18.1793714089975; Tue, 03 Nov 2026
 05:54:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
 <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu> <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
 <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu> <CAE2XoE-2w3A4=BeskGgp7NYUtkRVNkNufu4SZjW_OQ-KAQZvhg@mail.gmail.com>
 <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu> <CAE2XoE8pNaP3rAR5Y2BpUZ2vSu-UC-wG9V9U7gPXrEGY=kx0RA@mail.gmail.com>
 <e5ce0ea8-7e97-aa76-6384-025fc43cb85a@eik.bme.hu> <CAE2XoE-459vCeK1O__iCs_hgMfMEQHWf_f_=hXG4ZhMJ1Z4aBw@mail.gmail.com>
 <b5987922-1ba0-c284-668f-10d2b114044f@eik.bme.hu> <63da8d3e-38a8-7de5-f73b-7f3dfd6e09d3@eik.bme.hu>
In-Reply-To: <63da8d3e-38a8-7de5-f73b-7f3dfd6e09d3@eik.bme.hu>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 3 Nov 2026 21:54:35 +0800
X-Gm-Features: AclHuK_wV8ioyKz7aiyS3SJZfnLtnltFlHI8AJvTjC6NpMOSuUmoAxToMkTXXqk
Message-ID: <CAE2XoE-G41GhOhxUveqeALiTt4rM3GN+99h=jv009o=qVAtr2A@mail.gmail.com>
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
X-purgate-ID: tlsNG-ebf023/1793714091-52CCFB50-BD38C8CD/0/0
X-purgate-type: clean
X-purgate-size: 13248
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 9:26=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
> On Tue, 3 Nov 2026, BALATON Zoltan wrote:
> > On Tue, 3 Nov 2026, Yonggang Luo wrote:
> >> On Mon, Nov 2, 2026 at 10:56=E2=80=AFPM BALATON Zoltan <balaton@eik.bm=
e.hu> wrote:
> >>>
> >>> On Mon, 2 Nov 2026, Yonggang Luo wrote:
> >>>> On Mon, Nov 2, 2026 at 4:57=E2=80=AFAM BALATON Zoltan <balaton@eik.b=
me.hu> wrote:
> >>>>>
> >>>>> On Sun, 1 Nov 2026, Yonggang Luo wrote:
> >>>>>> On Sun, Nov 1, 2026 at 7:29=E2=80=AFAM BALATON Zoltan <balaton@eik=
.bme.hu>
> >>>>>> wrote:
> >>>>>>>
> >>>>>>> On Sun, 1 Nov 2026, Yonggang Luo wrote:
> >>>>>>>> On Sun, Nov 1, 2026 at 1:06=E2=80=AFAM BALATON Zoltan <balaton@e=
ik.bme.hu>
> >>>>>>>> wrote:
> >>>>>>>>>
> >>>>>>>>> On Sat, 31 Oct 2026, Yonggang Luo wrote:
> >>>>>>>>>> On Sat, Oct 31, 2026 at 8:42=E2=80=AFPM BALATON Zoltan <balato=
n@eik.bme.hu>
> >>>>>>>>>> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
> >>>>>>>>>>>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >>>>>>>>>>>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>>>>>>>>>>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeIn=
fo
> >>>>>>>>>>>>>> and the
> >>>>>>>>>>>>>> type_init
> >>>>>>>>>>>>>> function that calls type_register_static(). A later change
> >>>>>>>>>>>>>> needs to
> >>>>>>>>>>>>>> pass a
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> That's the point of the macro to hide the boiler plate code=
.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> target mask into that registration, and the macros have no
> >>>>>>>>>>>>>> parameter
> >>>>>>>>>>>>>> for it.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Couldn't you just change the macros to take that parameter
> >>>>>>>>>>>>> instead of
> >>>>>>>>>>>>> expanding it everywhere?
> >>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Problem of macros is that they don't have default parameters=
, so
> >>>>>>>>>>>> you
> >>>>>>>>>>>> need variants for everything:
> >>>>>>>>>>>>
> >>>>>>>>>>>> DEFINE_MACHINE
> >>>>>>>>>>>> DEFINE_MACHINE_EXTENDED
> >>>>>>>>>>>> DEFINE_MACHINE_WITH_INTERFACES
> >>>>>>>>>>>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> >>>>>>>>>>>> and now would need a new variant, with variant for other exi=
sting
> >>>>>>>>>>>> ones.
> >>>>>>>>>>>>
> >>>>>>>>>>>> In the end, it's just simpler to remove this and add the
> >>>>>>>>>>>> boilerplate.
> >>>>>>>>>>>> It's written once and never modified, so using a macro just =
save
> >>>>>>>>>>>> typing
> >>>>>>>>>>>> those lines once.
> >>>>>>>>>>>>
> >>>>>>>>>>>>> Regards,
> >>>>>>>>>>>>> BALATON Zoltan
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> This series expands every caller first, with no behavior
> >>>>>>>>>>>>>> change, so the
> >>>>>>>>>>>>>> follow-up only replaces the type_register_static() call.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Each machine file gains a class_init function, a TypeInfo,=
 and
> >>>>>>>>>>>>>> a
> >>>>>>>>>>>>>> type_init
> >>>>>>>>>>>>>> function that calls type_register_static(). The last patch
> >>>>>>>>>>>>>> removes
> >>>>>>>>>>>>>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from
> >>>>>>>>>>>>>> include/hw/core/boards.h.
> >>>>>>>>>>>
> >>>>>>>>>>> Macros help reading the code not saving typing. If the actual
> >>>>>>>>>>> functionality is buried in a lot of boiler plate it's harder =
to
> >>>>>>>>>>> understand
> >>>>>>>>>>> and spot bugs so putting the unintresting boiler plate behind=
 a
> >>>>>>>>>>> macro is
> >>>>>>>>>>> better even if you need a separate version for different case=
s.
> >>>>>>>>>>> Then the
> >>>>>>>>>>> code that uses the macro will be much more obvious and not ju=
st a
> >>>>>>>>>>> lot of
> >>>>>>>>>>
> >>>>>>>>>> I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHI=
NE*
> >>>>>>>>>> are
> >>>>>>>>>> not defined properly
> >>>>>>>>>> that causes them to not be extended easily.
> >>>>>>>>>>
> >>>>>>>>>> DEFINE_TYPES is another example, use them can extend easily, h=
ow
> >>>>>>>>>> about
> >>>>>>>>>> always use DEFINE_TYPES?
> >>>>>>>>>> Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and
> >>>>>>>>>> DEFINE_SECURE_MACHINE*?
> >>>>>>>>>
> >>>>>>>>> Maybe I'm missing the problem but DEFINE_MACHINE macros are jus=
t
> >>>>>>>>> convenience wrappers around DEFINE_MACHINE_EXTENDED. So why can=
't
> >>>>>>>>> you add
> >>>>>>>>> the needed parameter to DEFINE_MACHINE_EXTENDED and use that fo=
r
> >>>>>>>>> machines
> >>>>>>>>> that need it, or if it's needed by all machines then make the n=
ew
> >>>>>>>>> parameter required and add it to all convenience wrappers too s=
o you
> >>>>>>>>> can
> >>>>>>>>> keep using DEFINE_MACHINE* and just need to add one parameter t=
o it
> >>>>>>>>> in
> >>>>>>>>> machines?
> >>>>>>>>
> >>>>>>>> That's the issue, add parameter to DEFINE_MACHINE_EXTENDED means=
 all
> >>>>>>>> calls to it also need
> >>>>>>>> to be changed, that means touch many $target_arch files. current=
ly
> >>>>>>>> it's 13. But after these
> >>>>>>>
> >>>>>>> That's not different from expanding the macro which would touch t=
he
> >>>>>>> same
> >>>>>>> files.
> >>>>>>>
> >>>>>>>> changes, there will be much more usage on it, and if we want to =
add
> >>>>>>>> more parameters or attributes
> >>>>>>>> to it, it will be a new tree-wide change.
> >>>>>>>
> >>>>>>> Do you expect to need more parameters? Can't you add them at once
> >>>>>>> then?
> >>>>>>>
> >>>>>>>> And DEFINE_TYPES do not suffer from such issues. As the TypeInfo=
[] is
> >>>>>>>> explicit defined for
> >>>>>>>> DEFINE_TYPES
> >>>>>>>
> >>>>>>> My point is that keeping the boiler plate as little as possible m=
akes
> >>>>>>> the
> >>>>>>> code more readable. DEFINE_TYPES hides some of the boiler plate,
> >>>>>>> DEFINE_MACHINE hides even more so converting to DEFINE_TYPES woul=
d
> >>>>>>> expose
> >>>>>>> some even if it's better than no macro at all.
> >>>>>>>
> >>>>>>> What exactly are the parameters missing from DEFINE_MACHINE_EXTEN=
DED
> >>>>>>> that
> >>>>>>> need to be added?
> >>>>>>
> >>>>>> Hi BALATON
> >>>>>> the things we faced is we first is to add TypeInfo::is_available
> >>>>>> parameter to
> >>>>>> DEFINE_MACHINE_EXTENDED, and have more usage of it.
> >>>>>> Then we will add targets:uint64_t parameter to DEFINE_MACHINE_EXTE=
NDED,
> >>>>>> this is
> >>>>>> a prepare to remove TypeInfo::is_available parameter from
> >>>>>> DEFINE_MACHINE_EXTENDED,
> >>>>>>
> >>>>>> And finally, once all usage of TypeInfo::is_available can be repla=
ced
> >>>>>> with
> >>>>>> targets:uint64_t, then we finally need to remove
> >>>>>> TypeInfo::is_available parameter from DEFINE_MACHINE_EXTENDED,
> >>>>>
> >>>>> Is there a way to avoid the temporary is_available churn and introd=
uce
> >>>>> the
> >>>>> targets:uint64_t right away? (I'm not following this so I don't rea=
lly
> >>>>> know what you're talking about just looks like there's some churn h=
ere
> >>>>> which might be good to awoid anyway independent of these macros.)
> >>>>>
> >>>>>> That's what I am facing now. And the explicit
> >>>>>> static const TypeInfo xxx_machine_typeinfo =3D {
> >>>>>>    .name       =3D MACHINE_TYPE_NAME("xxx"),
> >>>>>>    .parent     =3D TYPE_MACHINE,
> >>>>>>    .class_init =3D xxx_machine_class_init,
> >>>>>> };
> >>>>>>
> >>>>>> Will help me avoid the issue. And I think this is a little boilerp=
late
> >>>>>> and very explicit.
> >>>>>
> >>>>> That's not all DEFINE_MACHINE hides though. It's longer with .abstr=
act,
> >>>>> .secure and .iterfaces plus the machine initfn that would also need=
 to
> >>>>> be
> >>>>> expanded if you used DEFINE_TYPES.
> >>>>>
> >>>>> Is this conversion needed for all machines using all DEFINE_MACHINE
> >>>>
> >>>> At the end, only "none" machine do not have targets parameter or
> >>>> (QEMU_ARCH_ALL), as that's the sole
> >>>> machine that supports all targets.
> >>>>
> >>>>> variants or only some of them? If the latter why not convert those =
to
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>> DEFINE_MACHINE_EXTENDED and then only that macro needs to be change=
d
> >>>>> with
> >>>>> other wrappers passing a default value without needing a new parame=
ter.
> >>>>> That does not work if all machines need to do this but even then,
> >>>>> keeping
> >>>>> the macro and adding a new required parameter is better in my opini=
on as
> >>>>> it keeps boiler plate hidden.
> >>>>
> >>>> Another option is keep DEFINE_MACHINE and introduce
> >>>> DEFINE_MACHINE_TARGETS
> >>>> and remove DEFINE_MACHINE_EXTENDED, and we only use DEFINE_MACHINE f=
or
> >>>> simple case,
> >>>> that is parent is TYPE_MACHINE and have no custom type and no more
> >>>> attributes assigned.
> >>>> DEFINE_MACHINE_EXTENDED is too verbose, when calling it, it less cle=
ar
> >>>> than calling to DEFINE_MACHINE.
> >>>> And if we want to set more attributes to TypeInfo, just expand it to
> >>>> use type_init or DEFINE_TYPES, how about this way.
> >>>>
> >>>> This will be something like:
> >>>>
> >>>> #define DEFINE_MACHINE_TARGETS(namestr, machine_initfn, targets) \
> >>>>    static void machine_initfn##_class_init(ObjectClass *oc, const vo=
id
> >>>> *data) \
> >>>>    { \
> >>>>        MachineClass *mc =3D MACHINE_CLASS(oc); \
> >>>>        machine_initfn(mc); \
> >>>>    } \
> >>>>    static const TypeInfo machine_initfn##_typeinfo =3D { \
> >>>>        .name       =3D MACHINE_TYPE_NAME(namestr), \
> >>>>        .parent     =3D TYPE_MACHINE, \
> >>>>        .class_init =3D machine_initfn##_class_init, \
> >>>>    }; \
> >>>>    static void machine_initfn##_register_types(void) \
> >>>>    { \
> >>>>        type_register_targets(&machine_initfn##_typeinfo, targets); \
> >>>>    } \
> >>>>    type_init(machine_initfn##_register_types)
> >>>>
> >>>> /* Implicitly insecure */
> >>>> #define DEFINE_MACHINE(namestr, machine_initfn) \
> >>>>    DEFINE_MACHINE_TARGETS(namestr, machine_initfn, QEMU_ARCH_ALL) \
> >>>>
> >>>> As the many call is to DEFINE_MACHINE.
> >>>>
> >>>> And after all conversion, all existing usage of DEFINE_MACHINE will =
be
> >>>> converted to
> >>>> DEFINE_MACHINE_TARGETS.
> >>>> DEFINE_MACHINE will be called for ('none') machine or future
> >>>> heterogeneous
> >>>> machines
> >>>>
> >>>>
> >>>> Either way, these patches will be dropped. We will introduce
> >>>> DEFINE_MACHINE_TARGETS first.
> >>>
> >>> I think I'm lost and cannot follow what you want. As far as I underst=
ood
> >>> you want to add a new field "target" to machine TypeInfo but instead =
of
> >>> adding that straight away you proposed to first add is_available then
> >>> later replace that with target. I asked why do you need is_available =
and
> >>> not add target right away?
> >>>
> >>> Then if this target parameter will be needed for all machines why can=
't
> >>> you add that to all DEFINE_MACHINE macros as a required parameter and=
 set
> >>> it for all machines passing it through to DEFINE_MACHINE_EXTENDED whi=
ch
> >>> sets in the TypeInfo. That way no machines need changing other than a=
dding
> >>> the target parameter to the existing DEFINE_MACHINE calls.
> >>>
> >>> What am I missing?
> >> Or sorry, I did not explain well.
> >>
> >> I means reshape DEFINE_MACHINE like
> >>
> >> https://lore.kernel.org/qemu-devel/20261102194826.1298-1-luoyonggang@g=
mail.com/T/#u
> >>
> >> basically every call to DEFINE_MACHINE needs the targets parameter.
> >> So we can always passing targets parameter for DEFINE_MACHINE.
> >
> > That's OK and is what I suggested, the part I did not get is why do you=
 need
> > an intermediate is_available step instead of just adding the target par=
ameter
> > to all DEFINE_MACHINE* macros.
>
> I noticed there's some redundancy between the arch and the name prefix
> with this change. Basically you're trying to split namestr into name and
> arch where the final machine name will be arch-name. Is there a way to do
> this from the macro somehow so you don't have to specify the arch twice
> once in the name and once as an enum?

There won't be redundancy, the change's intention is to keep the
machine QOM-name not
changed, specifically, drop MR
https://lore.kernel.org/qemu-devel/20261027111216.392-1-luoyonggang@gmail.c=
om/
so we can keep the QOM name for machines not changed by introduce a
extra targets parameter
to it, then we can use buckets to storage different arch/target, I've
already implemented
that at https://gitlab.com/lygstate-qemu/qemu/-/commits/qom-type-buckets?re=
f_type=3Dheads,
 and it's working well:)

I am trying to get it merged by sending smaller patches.

Basically we always need a "targets" parameter or
"TargetInfo::is_avaiable" attributes.
the targets parameter will be saved into TargetImpl::targets, and not
in TargetInfo, as the default
value for TargetInfo is 0, means no targets. but we want keep
"QEMU_ARCH_ALL" default behavior, that's why
I want it to be a parameter, not a TargetInfo member

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

