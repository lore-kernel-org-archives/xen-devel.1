Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD2C98328
	for <xen-devel@archiver.kernel.org>; Sun, 27 Sep 2026 00:08:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435243.1654418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xAcRH-0002qQ-3e; Sun, 27 Sep 2026 00:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435243.1654418; Sun, 27 Sep 2026 00:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xAcRG-0002qE-Uu; Sun, 27 Sep 2026 00:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1435243;
 Sun, 27 Sep 2026 00:08:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xAcRE-0002q8-PP
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2026 00:08:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xAcRD-00DHEk-L1
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2026 02:08:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab85e60-2eae-0a2a0a5409dd-0a2a45069ba6-10
 for <xen-devel@lists.xenproject.org>; Sun, 27 Sep 2026 02:08:15 +0200
Received: from [74.125.228.98] (helo=mail-ed2-f34.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab85e6f-195a-0a2a45060019-4a7de4629f70-3
 for <xen-devel@lists.xenproject.org>; Sun, 27 Sep 2026 02:08:15 +0200
Received: by mail-ed2-f34.google.com with SMTP id
 4fb4d7f45d1cf-6aaea178c96so2115725a12.3
 for <xen-devel@lists.xenproject.org>; Sat, 26 Sep 2026 17:08:15 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1790467695; cv=none;
        d=google.com; s=arc-20260327;
        b=Hhy94pO0JfGk6koujbzlwkYIABnA/LJYNWrPIwwdkV4KoDeqduk+y7FCoC89QKvpgM
         Un36lp0kP0Y7tlQfZbnhIhe+uArF4FpN0yL/r9VJww6VsBYC/oEOxKbAfbDyDWQeLawR
         CvV6GNgJGPHWvbZMaorq/UkEJKYYK+aZSMm4MjVlfp2v0K9z8wpqrIZAQrChdmvJlcJ4
         wrThfmQ/m8NKjCHj/0XZ2WP0FVXTv7dq0jHrk1X3Wd/OtiFzFRmfxlsIyW3aOp1EdCeo
         vqOaRklNORsIWmpTUlJMJn06vLyamghuQBV5tBCffc5lma3eXJZlktkZj1D+1S2BNv8w
         cAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UKM+5PQ2HuuWEDJIWiPIZCGezMD8Lmj5jjp3C6dDZxY=;
        fh=tOkbQXru5sXV6PNjbEzsWKq+nFHxZHNOxq8wK9aVyq8=;
        b=bDGF/Vvc3uSHqjUDUDNPkjKS6pzQ0uS2YrZ0bGEewZhouhWlK8lRIbg40YMsHrHRPh
         JaICaLU9Qjeq8XO/B7jQC5mOzBYKwYkQChmVGiO5w/SvsFTi9/lMiuzvJXbdbcWIbtAF
         dKRSv2XezcuYArIznL7PVAcvkzy0qTW0CXYoY6aN1wyWiRkOGz9bLu3b2DxDBYAD3/JN
         HZ2tN/l5rm24aQ+hAEW9epnoIMi8lECHZdtPbG0Tx/CY2tPMvGc5tHQom7PMw0sey6/R
         2bfCYJB7ypJIxzhB/qV7s0HlkOUizeMuc69OZltBIPG7HxwSFRbDJ478oeHFG17VFsjQ
         OJjw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790467695; x=1791072495; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKM+5PQ2HuuWEDJIWiPIZCGezMD8Lmj5jjp3C6dDZxY=;
        b=maXf+goRZhHDwQAyo1VUXbZgIzMmyKxNR+kuAu9VrII7voYz/UKUVpEq3rC4SVPBsQ
         cJ9x13On1d5mXUAt++sJ2Ok78f5kIwluTQTrxKIH+OmBxeNhHgq/cHZ7tKtUfYTSVsHm
         am2tw3JL76FhIXbHYK5Ror5hBrrimhV3IeO1c4eXU/4SnfeR2drtP8l2ur+o/LNdw2ZC
         zSmtjZgN2hkyXRH3Auz2zMVKfOm0yFOj42pQhHwIgiCrpyO9dVZEOtw3yLp0FE5DWhT0
         c2113uQgUKxn5QaDQ4MDOGzOKIpNwbvElRTwzncyolR/Q63woWuxhsH9rWTXouXS0OIN
         jayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790467695; x=1791072495;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UKM+5PQ2HuuWEDJIWiPIZCGezMD8Lmj5jjp3C6dDZxY=;
        b=QmP3GTX9CRtycKu0n5/0vsSkSiVOa46KjsYpEqD85u7y5TRpICFhoGOk5cB6KxIHXi
         rLzXXmC+lfZeS8PUk4OIoLyRA1rl61nyBoNrIL6eHNpHDkznL45VOoHJIJIMcRdrXCkS
         YgFeKOKg4139qfzbY9PNPIbo5904s1LsXTSH0Pt2ahGLxoeIZZzODu2DrMLqe518LlPh
         LE4REzhc/Jq3RuHbmEj7Rr1pCmHv9sKqi+s2/W2wTuiUjHt21GihVCWT/voXtbIuj/+c
         +e5eG869D1DwLP5otTo2tqiFjeSmFXzapyDEyPRABMH98udFsEBSp12zux9BhHTlA0+u
         ZHOw==
X-Forwarded-Encrypted: i=1; AKwUvBxRQvJ+tYHW06U4UjuzsJ8GKqFbNegivZtEm/ZmDZaa+BAI++k4ATeQhUhCEvBrRUXBm4nGdq7Tu4Q=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLQdH/lEvgCR0pyI7eYe3T5AfvvmJMCp/Sy74suBwNUblI9gBpc
	I89qabOwy8ebrbL+OqcEZdELXuijrOUaDvPK0bGcsdOUcyFvDxlMZTHG61ttyujMT9Zi8NNL+aM
	zbuqV6r65Ww515EanTz8vLe49IyaZO5U=
X-Gm-Gg: AYBFou27Qhqs0FbczXd57LDokKap2mAgtWhTjCcHYwhzLFBY3zxH0sqq++uRE7wcYv4
	04+MhV6iPVM2ImrvQfEFrhMgU2sDvnTh/SHGpHDCC1fp/MiVKgPbwDb1IXl5Mccv6fE3FGeWrvE
	cKGMoj6tgx0IGKNESmc4Wq/LVnTtaYg86k7VwoQdhYzE0a+5EE6HCAEDWlUFYXXwTg5MavO4ahn
	IWAwM3oNUxJSvY177WmPzyTaKDWetXRvMwyN0L2GRT3GSR2j8t//rBNuVT2bwf1vOiiyY5sgO8n
	fZ0YrnAga4NWTYsXcjgWu1PhZS2K536c/Od+z/A43Lm7jPboU/T9eHo=
X-Received: by 2002:a05:6402:4494:b0:6ab:541:a685 with SMTP id
 4fb4d7f45d1cf-6ab0541c080mr1942313a12.17.1790467694320; Sat, 26 Sep 2026
 17:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260923131635.1894-1-luoyonggang@gmail.com> <20260923131635.1894-29-luoyonggang@gmail.com>
 <5687f0f3-052a-4e16-9747-0be60296e07a@oss.qualcomm.com>
In-Reply-To: <5687f0f3-052a-4e16-9747-0be60296e07a@oss.qualcomm.com>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sun, 27 Sep 2026 08:08:01 +0800
X-Gm-Features: AclHuK9GTDw59PSmvQn9GZmAFMJououA1PQmQRoLQXooftHLs4G9T0uQ4MpS95c
Message-ID: <CAE2XoE-N56GNgQLBqee8U5RP7g2zj=_Z4Hr+R1-BHvwA+9x_3w@mail.gmail.com>
Subject: Re: [PATCH v3 028/114] hw/intc: use kvm_enabled() in APLIC AIA helpers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, 
	xen-devel@lists.xenproject.org, Chao Liu <chao.liu@processmission.com>, 
	Igor Mammedov <imammedo@redhat.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, Peter Xu <peterx@redhat.com>, 
	Eric Blake <eblake@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>, qemu-ppc@nongnu.org, 
	Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Bibo Mao <maobibo@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
	David Hildenbrand <david@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org, kvm@vger.kernel.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stafford Horne <shorne@gmail.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>, Song Gao <17746591750@163.com>, 
	qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
	Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000e6df7a065c6bbe69"
X-purgate-ID: tlsNG-16d1c6/1790467695-FC80577B-D53ED339/0/0
X-purgate-type: clean
X-purgate-size: 5312

--000000000000e6df7a065c6bbe69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 5:35=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
philmd@oss.qualcomm.com> wrote:
>
> On 23/9/26 15:15, Yonggang Luo wrote:
> > - Replace CONFIG_KVM ifdefs in riscv_use_emulated_aplic and
> >    riscv_aplic_set_kvm_msicfgaddr with kvm_enabled().
>
> Can you provide your S-o-b tag please?

Thanks, I forgot this, the following patches will attach S-o-b. This series
is dropped as gmail limits me to send all the things.

>
> > ---
> >   hw/intc/riscv_aplic.c | 14 ++++++++------
> >   1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> > index d8e25bfda14..03a0852b8b8 100644
> > --- a/hw/intc/riscv_aplic.c
> > +++ b/hw/intc/riscv_aplic.c
> > @@ -167,7 +167,10 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode)
> >
> >   bool riscv_use_emulated_aplic(bool msimode)
> >   {
> > -#ifdef CONFIG_KVM
> > +    if (!kvm_enabled()) {
> > +        return true;
> > +    }
> > +
> >       if (tcg_enabled()) {
> >           return true;
> >       }
> > @@ -177,21 +180,20 @@ bool riscv_use_emulated_aplic(bool msimode)
> >       }
> >
> >       return kvm_kernel_irqchip_split();
> > -#else
> > -    return true;
> > -#endif
> >   }
> >
> >   void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr
addr)
> >   {
> > -#ifdef CONFIG_KVM
> > +    if (!kvm_enabled()) {
> > +        return;
> > +    }
> > +
> >       if (riscv_use_emulated_aplic(aplic->msimode)) {
> >           addr >>=3D APLIC_xMSICFGADDR_PPN_SHIFT;
> >           aplic->kvm_msicfgaddr =3D extract64(addr, 0, 32);
> >           aplic->kvm_msicfgaddrH =3D extract64(addr, 32, 32) &
> >                                    APLIC_MMSICFGADDRH_VALID_MASK;
> >       }
> > -#endif
> >   }
> >
> >   /*
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000e6df7a065c6bbe69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sat, Sep 26, 2026 at 5:35=E2=80=AFPM Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@oss.qualcomm.com">philmd@oss=
.qualcomm.com</a>&gt; wrote:<br>&gt;<br>&gt; On 23/9/26 15:15, Yonggang Luo=
 wrote:<br>&gt; &gt; - Replace CONFIG_KVM ifdefs in riscv_use_emulated_apli=
c and<br>&gt; &gt; =C2=A0 =C2=A0riscv_aplic_set_kvm_msicfgaddr with kvm_ena=
bled().<br>&gt;<br>&gt; Can you provide your S-o-b tag please?<div><br></di=
v><div>Thanks, I forgot this, the following patches will attach S-o-b. This=
 series is dropped as gmail limits me to send all the things.</div><div><br=
>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0 hw/intc/riscv_aplic.c | 14 +++++=
+++------<br>&gt; &gt; =C2=A0 1 file changed, 8 insertions(+), 6 deletions(=
-)<br>&gt; &gt;<br>&gt; &gt; diff --git a/hw/intc/riscv_aplic.c b/hw/intc/r=
iscv_aplic.c<br>&gt; &gt; index d8e25bfda14..03a0852b8b8 100644<br>&gt; &gt=
; --- a/hw/intc/riscv_aplic.c<br>&gt; &gt; +++ b/hw/intc/riscv_aplic.c<br>&=
gt; &gt; @@ -167,7 +167,10 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimod=
e)<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=A0 bool riscv_use_emulated_aplic(b=
ool msimode)<br>&gt; &gt; =C2=A0 {<br>&gt; &gt; -#ifdef CONFIG_KVM<br>&gt; =
&gt; + =C2=A0 =C2=A0if (!kvm_enabled()) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return true;<br>&gt; &gt; + =C2=A0 =C2=A0}<br>&gt; &gt; +<br>&gt;=
 &gt; =C2=A0 =C2=A0 =C2=A0 if (tcg_enabled()) {<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return true;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 }<br>&g=
t; &gt; @@ -177,21 +180,20 @@ bool riscv_use_emulated_aplic(bool msimode)<b=
r>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=A0=
 =C2=A0 =C2=A0 return kvm_kernel_irqchip_split();<br>&gt; &gt; -#else<br>&g=
t; &gt; - =C2=A0 =C2=A0return true;<br>&gt; &gt; -#endif<br>&gt; &gt; =C2=
=A0 }<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=A0 void riscv_aplic_set_kvm_msi=
cfgaddr(RISCVAPLICState *aplic, hwaddr addr)<br>&gt; &gt; =C2=A0 {<br>&gt; =
&gt; -#ifdef CONFIG_KVM<br>&gt; &gt; + =C2=A0 =C2=A0if (!kvm_enabled()) {<b=
r>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>&gt; &gt; + =C2=A0 =C2=
=A0}<br>&gt; &gt; +<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if (riscv_use_emulate=
d_aplic(aplic-&gt;msimode)) {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 addr &gt;&gt;=3D APLIC_xMSICFGADDR_PPN_SHIFT;<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;kvm_msicfgaddr =3D extract64(addr, 0, 32=
);<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;kvm_msicfgaddr=
H =3D extract64(addr, 32, 32) &amp;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0APLIC_MMSICFGADDRH_VALID_MASK;<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; -#endif<br>&gt; &gt; =C2=A0 }<br>&gt; &gt;=
 =C2=A0 <br>&gt; &gt; =C2=A0 /*<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=
=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000e6df7a065c6bbe69--

