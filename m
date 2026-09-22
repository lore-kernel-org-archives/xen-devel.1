Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F2DC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:55:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428222.1650941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uPC-00018E-3X; Tue, 22 Sep 2026 06:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428222.1650941; Tue, 22 Sep 2026 06:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uPC-000187-0S; Tue, 22 Sep 2026 06:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1428222;
 Tue, 22 Sep 2026 06:55:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x8uP9-000181-UP
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:55:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uP8-006g9H-UM
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:55:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab2263e-2eae-0a2a0a5409dd-0a2a450b91c2-20
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:55:02 +0200
Received: from [74.125.229.204] (helo=mail-lf2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab22646-b7e8-0a2a450b0019-4a7de5ccfad7-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:55:02 +0200
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f1744fso6030642e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 23:55:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1790060102; cv=none;
        d=google.com; s=arc-20260327;
        b=oGrCG/MD/NwEBYbNnTAYHXZrdha6w+MwGys4TIHE6xRgQTCfQ7sdLAopSKIRjzkeDi
         klwOO/iUiUc4PsdG3ymXSPDeJH9V0+9n+rQcLShm+3OQnFNf1pvfTwwiskr18VabBm7J
         T33skjmSyiRstXPtm9CvvcbWwktWwoFBaTOPt39Py45GZ3hqOH8ZIQmfUOsVdkwdnpij
         XEaow5/7XunCo/A1da6eli4v+J7iPIn6HJCjSRf4Zj3HKSba49lX0oWRelTYjWU8Am4S
         IxqxBi8Yxm/MqNMDvXT2ZzRco3oKnubk8HtiYPr9xusq3bwxXPXiIjrQazI72Cy8E2oL
         Gqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C5Cby2x6R5Lck1bQdug4hFfsKnrpZeWjQW7PzU5S5/8=;
        fh=luf8Gx1Gk9RFA/BMjBjqkQvMmZugGcf74W+gbCAAuto=;
        b=VRESyi2+M3zyO5JTixw6jrZDPcxWvDt4CML/LrWlGhP1CmBpvadIxUgRngHxpL1HT2
         MsuK7o7mEWZkrCCApXUtzuSP8tIu9Lf3hA69baHZ2Cu3sNSEtKw27T5rDfd9y9at0RKj
         xKgko3Rv8mdyua3p9ZYtEpHp2i+hCfwtWWZYGCthJ0tZoak7AWPWXlLJV7gjLCxTLjg2
         BsvSkMXFLDcSf6XemlNJ8hEToHATqwKL2Txp8fDllPkrMefKehK51TOinnDZ7rf/r966
         EHDYeYWXYT3n0pgpWHYy4/dF7h3geuO+oF7y0KsZdBgwnRkAGUetqN0YXvoe4fL+uYp5
         6JEA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790060102; x=1790664902; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5Cby2x6R5Lck1bQdug4hFfsKnrpZeWjQW7PzU5S5/8=;
        b=mxMf5ThL6tNQ2lDNBQ5tKhGWebH7SLF/boGUl5Z4Fco3yyidRM1lL6vDyXnQX5NM8j
         hwl1Bup6dtzJ+RNRBwlk6NJVKzg2JLI3suXzxDjSvUijYuR5wPplU90f02KlZvRMZJ7n
         dn2k36Og08F34iHNYDiVaZ/T3jH0kULrj8dy6RLr43NDzx/OFpOUOgkUGjL+bDn0yzuh
         dyTXG74gNTxuhzzMK5Oq7kqgU7DJXFy6/5PDWifp7h7NKCpaJR9SHiyS4dMf/haVWw3T
         92qCYsZdEUtarVc6EVdrBkJSHO9rRMI191NLaZxBnKUMSftzo/4lDhTN4/P0NLoQDLHw
         fJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060102; x=1790664902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5Cby2x6R5Lck1bQdug4hFfsKnrpZeWjQW7PzU5S5/8=;
        b=jCbmER4OhZMiP6FrKBvKsUsl+W6JVvCIBHqGgX1EtyZ4FzYaFGbfc10WOxUtiwoQCg
         3U4OiIq1ZwsHuNY12/2h51jydShV1cvnEFprPlt+gjuNiNM4tdR0Rf61VM1xjgSfB3PQ
         ToOYSUrqqyUuvxuZTc8zmniTHSEV51QSXtIznEUgjkbww5hus5tgPRPdf0RLuz0b5mXb
         +X7EBUJDEaYfkVwKHytQX13xcZ5lGUCmFYb5UjUm5FjWvkHkf7AuEmYIsoRKz+InCgVc
         exnCUWT1MAtRvyn4DDwGr4ktJkJl1GNp2eYvIhrqwCmHeAoK3y79EPQMnHt7EcmRoGOq
         lXLQ==
X-Forwarded-Encrypted: i=1; AKwUvByiTKr6N7lz8psNkckD1/jy0GR8lSJH4vqw95JAvGsqXjhtCXKfuRuI+CS1z/NEL/6piD5WokRamdQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++ks2s1Nhut6uCWfKGQqdu57gUOIKldvvkDY6q1V5WXjF/Z4uV6s
	BZskAsGGrN8QERXSuKMjF9G0Tvby9k057NGij7jT1fFvDSEstAuq1Kjp1j94gAiZiSnTj+K9+3b
	omATHsiapCGLAJmjqFG+ezzpgJEUZKmk=
X-Gm-Gg: AYBFou0id1GuAv0HbKZpQmwQyjPREjZo0MsOBPSkG2k8Qsxl/5BgL0UYYLrM2lDmrdr
	2rR85cdX8MGyrJ64bg+u06XZrIfFuke8SCDVBVQ3S4mdkxaSVPndmOY2gu5B8fP4MV49vJxub8a
	0rkP72jkS8Dq7yzRo6qKdqw2Or59zw4TPp+Q5rnrM4NT32WbiR+cMyIXE7BT9AtQjVnq8QFNsbV
	ov7NPln0YObRrRa7bHy89gjf10SzAph/q1VlnSwg0UFCywYbVKdtNk2mCC5XCLbFj0WR8Avm6tq
	u9JQAxqwAgleNYwxaImv0WOh5kpSOLgt4lLCjCYy6cn29sjNanPcRRU=
X-Received: by 2002:a05:6512:318d:b0:5b8:9a27:9042 with SMTP id
 2adb3069b0e04-5b8c17f205amr3902011e87.2.1790060101895; Mon, 21 Sep 2026
 23:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <e8841a943eb7f6a64348b7316032084fb848bc2b.1787040666.git.mykola_kvach@epam.com>
 <ec0800b0-cb65-4b75-b13b-69a90cec75ca@amd.com>
In-Reply-To: <ec0800b0-cb65-4b75-b13b-69a90cec75ca@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 22 Sep 2026 09:54:48 +0300
X-Gm-Features: AcwNN1VU4ziKDcpv8mBkqCE3dFzyINy_uBpRRSNWl-ddJ-W4EnzMyjEyNVXNJKk
Message-ID: <CAGeoDV-12dg2rmUWA91qFn1GFJ63mu8UGC6v1X9au4UbqxHxUg@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm: derive GIC CPU interface ID fields from the vGIC
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1790060102-A86CA9EA-8AB55045/0/0
X-purgate-type: clean
X-purgate-size: 7809

Hi Michal,

Thank you for the review.

On Tue, Aug 18, 2026 at 5:48=E2=80=AFPM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 18-Aug-26 11:19, Mykola Kvach wrote:
> > Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from domain_cpuinfo,
> > which is initialized from the sanitized host CPU feature state. This
> > does not necessarily match the virtual interrupt controller configured
> > for a domain.
> >
> > A vGICv2 domain can therefore observe a nonzero GIC field when the host
> > supports the GIC system register interface, even though Xen disables th=
at
> > interface for the domain. On a GICv4.1-capable host, a vGICv3 domain ca=
n
> > observe encoding 0b0011, although Xen exposes only its vGICv3 model.
> >
> > Derive the fields from the domain's vGIC version instead. Expose 0b0000
> > for vGICv2 and 0b0001 for vGICv3. This covers ID_AA64PFR0_EL1 and the
> > ID_PFR1_EL1 alias in AArch64 state, as well as ID_PFR1 accessed through
> > CP15 in AArch32 state. Leave the alias unchanged when AArch32 is
> > unavailable.
> >
> > Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> > Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v3:
> > - Add direct dependencies for the shared ID register helpers.
> > - Move ID_PFR1_GIC_SHIFT to the common CP15 register header.
> > - Apply cosmetic fixes from review.
> >
> > Changes in v2:
> > - Share the GIC ID field helpers between the AArch64 and AArch32 paths.
> > - Parenthesize the individual ASSERT conditions.
> > - Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
> > - Target master instead of the 4.22 release.
> >
> > v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.17=
83675708.git.mykola._5Fkvach@epam.com/
> > ---
> >  xen/arch/arm/arm64/cpufeature.c          |  1 +
> >  xen/arch/arm/arm64/vsysreg.c             | 18 +++++++++++++++-
> >  xen/arch/arm/include/asm/arm64/sysregs.h |  1 -
> >  xen/arch/arm/include/asm/cpregs.h        |  1 +
> >  xen/arch/arm/include/asm/vreg.h          | 26 ++++++++++++++++++++++++
> >  xen/arch/arm/vcpreg.c                    | 12 ++++++++++-
> >  6 files changed, 56 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufe=
ature.c
> > index 6fb8974ade..8bae8915e8 100644
> > --- a/xen/arch/arm/arm64/cpufeature.c
> > +++ b/xen/arch/arm/arm64/cpufeature.c
> > @@ -72,6 +72,7 @@
> >  #include <xen/bug.h>
> >  #include <xen/types.h>
> >  #include <xen/kernel.h>
> > +#include <asm/cpregs.h>
> >  #include <asm/sysregs.h>
> >  #include <asm/cpufeature.h>
> >  #include <asm/arm64/cpufeature.h>
> > diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.=
c
> > index d9e3619dfb..4fb50b6972 100644
> > --- a/xen/arch/arm/arm64/vsysreg.c
> > +++ b/xen/arch/arm/arm64/vsysreg.c
> > @@ -20,6 +20,7 @@
> >
> >  #include <asm/arm64/cpufeature.h>
> >  #include <asm/arm64/sve.h>
> > +#include <asm/cpregs.h>
> >  #include <asm/current.h>
> >  #include <asm/regs.h>
> >  #include <asm/traps.h>
> > @@ -298,7 +299,18 @@ void do_sysreg(struct cpu_user_regs *regs,
> >       * to identify the processor features
> >       */
> >      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
> > -    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
> > +    case HSR_SYSREG_ID_PFR1_EL1:
> > +    {
> > +        register_t guest_reg_value =3D domain_cpuinfo.pfr32.bits[1];
> > +
> > +        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
> This check deserves a comment.

Ack.

> > +            guest_reg_value =3D id_reg_set_gic_field(guest_reg_value,
> > +                                                   ID_PFR1_GIC_SHIFT,
> > +                                                   v->domain);
> > +
> > +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, =
1,
> > +                                  guest_reg_value);
> > +    }
> >      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
> >      GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
> >      GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
> > @@ -337,6 +349,10 @@ void do_sysreg(struct cpu_user_regs *regs,
> >              guest_reg_value |=3D (sysval << ID_AA64PFR0_SVE_SHIFT) & m=
ask;
> >          }
> >
> > +        guest_reg_value =3D id_reg_set_gic_field(guest_reg_value,
> > +                                               ID_AA64PFR0_GIC_SHIFT,
> > +                                               v->domain);
> > +
> >          return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, =
1,
> >                                    guest_reg_value);
> >      }
> > diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/in=
clude/asm/arm64/sysregs.h
> > index f3c11d871e..c0a6827b08 100644
> > --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> > +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> > @@ -438,7 +438,6 @@
> >  #define MVFR1_FPDNAN_SHIFT           4
> >  #define MVFR1_FPFTZ_SHIFT            0
> >
> > -#define ID_PFR1_GIC_SHIFT            28
> >  #define ID_PFR1_VIRT_FRAC_SHIFT      24
> >  #define ID_PFR1_SEC_FRAC_SHIFT       20
> >  #define ID_PFR1_GENTIMER_SHIFT       16
> > diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/a=
sm/cpregs.h
> > index a7503a190f..79203324fa 100644
> > --- a/xen/arch/arm/include/asm/cpregs.h
> > +++ b/xen/arch/arm/include/asm/cpregs.h
> > @@ -114,6 +114,7 @@
> >  #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Reg=
ister */
> >  #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register =
0 */
> >  #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register =
1 */
> > +#define ID_PFR1_GIC_SHIFT 28
> It does not look nice to split CP15 encoding list with this macro. Furthe=
rmore,
> it looks a bit odd to move just GIC and not the other fields. Also, how a=
bout
> moving the block to asm/sysregs.h? You would not need to include cpregs.h=
 then.

I moved it to cpregs.h following your suggestion in v2 [1].
I will move the whole ID_PFR1_*_SHIFT block to asm/sysregs.h.

>
> >  #define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register =
2 */
> >  #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 */
> >  #define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 */
> > diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm=
/vreg.h
> > index 387ce76e7e..bb6c904f2e 100644
> > --- a/xen/arch/arm/include/asm/vreg.h
> > +++ b/xen/arch/arm/include/asm/vreg.h
> > @@ -4,11 +4,37 @@
> >  #ifndef __ASM_ARM_VREG__
> >  #define __ASM_ARM_VREG__
> >
> > +#include <xen/bitops.h>
> > +#include <xen/bug.h>
> > +#include <xen/sched.h>
> > +
> > +#include <asm/gic.h>
> > +
> >  typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *=
r,
> >                                     bool read);
> >  typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *=
r,
> >                                     bool read);
> >
> > +#define ID_REG_GIC_WIDTH 4
> > +
> > +static inline unsigned int vgic_id_gic_field(const struct domain *d)
> > +{
> > +    ASSERT((d->arch.vgic.version =3D=3D GIC_V2) ||
> > +           (d->arch.vgic.version =3D=3D GIC_V3));
> > +
> > +    return d->arch.vgic.version =3D=3D GIC_V3;
> Wouldn't this be a violation of MISRA C R10.3?

Yes. I will return 1U or 0U explicitly:

    return d->arch.vgic.version =3D=3D GIC_V3 ? 1U : 0U;

Best regards,
Mykola

[1] https://patchew.org/Xen/f46f9e6ebb12d8402fa72b1641796f33e24c539f.178639=
5761.git.mykola._5Fkvach@epam.com/#103a2e50-0391-4bad-b9e7-d00c36c76a54@amd=
.com

