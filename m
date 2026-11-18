Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC19606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 23:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJwGInco
Received: from list by lists.xenproject.org with outflank-mailman.1495298.1694306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTpXa-0003I9-Th; Wed, 18 Nov 2026 23:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495298.1694306; Wed, 18 Nov 2026 23:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTpXa-0003I2-QJ; Wed, 18 Nov 2026 23:58:14 +0000
Received: by outflank-mailman (input) for mailman id 1495298;
 Wed, 18 Nov 2026 23:58:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xTpXZ-0003Hw-OD
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 23:58:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTpXY-003t1j-Pt
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 00:58:12 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afe3b37-8faa-0a2a0a5109dd-0a2a450be946-32
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 00:58:12 +0100
Received: from [209.85.167.51] (helo=mail-lf1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afe3b94-b7e8-0a2a450b0019-d155a733ed19-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 00:58:12 +0100
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5be53e5fce1so1303458e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:58:12 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795046292; cv=none;
        d=google.com; s=arc-20260327;
        b=a75nWYDvpr4nrMG0qKoAdKa3PY0Ia3QersHBNwZGWoUrsBgzCzKehO7OKypFnXIOtd
         MR/7IRBy6z3Jt0gsiHWE9iUMpZvUKIeOcoFQmvQTAIngv7m32boTJGVQ9e/8cfo1LvFa
         RjQtG630E+LAbeDP16XH+uPJH1My/V7IDhFBlIeLhGnK5h26NmyJ0dtkXD0UbQQCVhlf
         E/uUpAh+xKgDC9tbLiRPZcLeE7kiCLXfxAiElFIAztW5BxFWiFarmHa0kTfPqhc2KlM+
         3PbD1488BZZmV7UozynXH5qN5nWqxpUxldHJP1b/mntKTq+IDV1JEWKnpt+eM3qaxyI1
         BYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dpk01LpU9o5gNpQSc9W4v8M8KHGqOxd5JMynkBNQM0w=;
        fh=9tGvDWADeoMzXRnBQW23sIg7lwe9F2kmlJLTwTbhM0Y=;
        b=AHmRtDMWEdMpbQEfv1Cp9LHgrszuM1qn1IZDwBuFwpKRQzAPsG0shgLOyn3/K2gb4H
         pIKOtxEPHMqg3dLHmVoLA6OojlVl/XO7NEgCaFRDp9MOpayniNP345N1a9cJpxp1R6bb
         uaQ7XLVMQgjgbqCLX1q57FHac9hnzEZ45vGxiJjKhhsNLWKN61gLX/xCgEpnoiTv4B3s
         rwFA3s52tIBI1ucTV78ZgRRq/hc8URxqt7jone6K1nhv4Tnfry5ATXfor6mnAz5XavRZ
         bu5KJ8+77N3uMnAoOLc8RtHn0sNhwi6a/PzamKpH2GZ5fNIO5GkTjEgkPcnnhte7l2Dc
         O2+A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046292; x=1795651092; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dpk01LpU9o5gNpQSc9W4v8M8KHGqOxd5JMynkBNQM0w=;
        b=MJwGIncoxOhr3um85NuUx7SOPK8V0ci6u1gRpgCAPbIBXLZWY02qPT6MGWTXCYMWT7
         +PCQigGnxC2+uLLRXppdaEyC6f2rDfm4qHRf5jqxwbqDtbyJdE/hU27L007ky8d7sq6f
         Ry1CGsPOqKMZkoqybDOcLyFji5hU5WEBOqnuXgvVf4RT8NB0mIF8mSoJeYrcYV4goisu
         fmDNNttxSuMKSemkQqcBkozhE4OsM2Qdv53tMipQbSFjy4jopckNPKQHD35Uzgnl50TJ
         r0C0t9q1VAyTADdhN/VBBLlByaJ40j889qQ/MIib3QRU3aYVt6Kv+hYbs0LOJb1LA3ny
         mfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046292; x=1795651092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpk01LpU9o5gNpQSc9W4v8M8KHGqOxd5JMynkBNQM0w=;
        b=fphtR1NLlWPPZzKA58BcgUrY6ekcS1hYzmt2xxq4JVNnxLPKHbRJ4mBo8Lr0u3J0Y0
         GQx52CQ+nV1MW9xEyotk+JC9LN0sFNPgDWXEqODboE5m89ULxwAegO43OeBmX6i7ZRxR
         +vnGQSaaDGg8RKf5/CPWkFqHAsu5G/u/+jY6+0a1g+DPBpxunlvwwEQIRLorvOk+zDTq
         /upMnp3I971J0Von4IUhi5xDUXJ7bkjZC3FvpD2llg627JN/EmEijhb4nYhogfURBtSn
         /8/UeeIQVSqq0BKHB1qcpoxmBDWlXEsFagLa/YT2/OXl4DSN7C4E8WP3XZNsT4AsJ26N
         X6pg==
X-Forwarded-Encrypted: i=1; AL+hErFwmsAxTdhs/Ti0A/RkRrRHKxe1ZTD6HrL2zE4bLI1nPgVAj/c3F6UZAkj6AITpvbThQCRM77wP+Ec=@lists.xenproject.org
X-Gm-Message-State: APuU4Z847+Q9DN1kq8lciwCsxOM9OzMzepF9Hz/BGzd64qbvGU1AbLUh
	qRStqc9IM/E8Vee5MVNQYMKBaYQ7AIF26Wf+d9IJ2BK+W1496DeJBOx3ykUPrGsP/rtugIK6WnQ
	K8roG8APQffiFJNSP8M72bFfJQB0Y/qg=
X-Gm-Gg: AYBFou1jZDvhaEgeLZrT/OKeTQz4GalB5V36QG0frASl2Fgc2I8J0ZiY9qes4nDyepA
	0r6dWWS863EPRAhEzuJt7ZbQKkLE/hDMVeusAggw/Uq9BAcpNV/KhK2ujREFgYzmFXL8+LNUphq
	t4cgZR15q7L7rUPQDF+ZCCFYD7/WzzE6cf6qHoSkUVbc/ipFaVZGqGGYQdI53xbkKdMGyhVi38n
	6KlnJNOSt5IzdKMufjxzvzY1xj3gFgZFXAVarrIyYlZaaUrbFsPuAaKCpi4kLNwlwkR1DPcj/K5
	N9eiNl9Flz1comctDzXuQCo1ISnxMEwGHzFqRLRY+XK18fPQ/7e6Kb13sWtPVEmBZmHnctXe0Wt
	AHOvR5M7GgKmLt0l+2XZJ+y0jD/L6oJAp1yQ=
X-Received: by 2002:a05:6512:131e:b0:5c1:57d3:efd0 with SMTP id
 2adb3069b0e04-5c1a9f1fc0cmr1309178e87.35.1795046291665; Wed, 18 Nov 2026
 15:58:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <29e61dc16bff44403131d87a85c0050248d87309.1794829488.git.mykola_kvach@epam.com>
 <9cbce55d-7c36-4e8d-a32d-3dc2af0b3246@gmail.com>
In-Reply-To: <9cbce55d-7c36-4e8d-a32d-3dc2af0b3246@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 19 Nov 2026 01:58:00 +0200
X-Gm-Features: AclHuK_QBL3sfh_5mm7PwWwT-3-GhMyl1dJKHmWcLS1oVQhG4FPHtbLP24eUg2c
Message-ID: <CAGeoDV9Ajcz5U07=aeAn0QTN_hGcRGV-PLtYX4OxqKqqtna0hw@mail.gmail.com>
Subject: Re: [PATCH v2] arm/smmuv3: clean stream tables for non-coherent hardware
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Mykola Kvach <Mykola_Kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1795046292-A9AC09EA-13946053/0/0
X-purgate-type: clean
X-purgate-size: 9730
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksandr,

On Wed, Nov 18, 2026 at 11:04=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> 16.11.2026 13:47, Mykola Kvach =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
> Hello Mykola
>
>
> > Xen's dmam_alloc_coherent() returns cacheable memory. A non-coherent
> > SMMU cannot see writes that remain in the CPU cache.
> >
> > On Orange Pi 5 (RK3588S), NVMe initialization failed with C_BAD_STREAMI=
D
> > for SID 0x4100 while the CPU saw a populated L1 descriptor.
> >
> > Clean new stream tables before use. Clean updated STE data in
> > arm_smmu_sync_ste_for_sid() before issuing CFGI_STE and CMD_SYNC.
> > Keep both sync points around the dst[0] update.
> >
> > Clean the L2 table before writing its L1 pointer, then clean the pointe=
r.
> > Skip these cache operations on coherent SMMUs.
> >
> > See Arm IHI 0070G.b, sections 3.15 and 3.21.3.1.
> >
> > Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
> > Assisted-by: Codex:GPT-6.1
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
>
> So, If I understand the patch/problem correctly, this looks like a
> follow-up to "xen/arm: smmuv3: Add cache maintenance for non-coherent
> SMMU queues". The underlying issue seems the same, cache maintenance for
> in-memory data structures, except that previous patch addressed the
> command queue, while this one targets the stream table.

Thanks for the review. Yes, the earlier patch fixed the same cache
visibility issue for the queues. This patch covers the stream tables.

>
> I did not find any serious issues with the current patch, just a couple
> of NITs below for you to consider.
>
> Preferably with the NITs addressed:
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> > ---
> > Changes in v2:
> > - Rename arm_smmu_clean_strtab() to arm_smmu_clean_dcache().
> > - Pass the STE pointer and clean size to arm_smmu_sync_ste_for_sid().
> >    Clean the given range there before CFGI_STE and CMD_SYNC. Keep the
> >    original clean ranges, both sync points around dst[0], and the
> >    explicit cleaning during table initialisation.
> > ---
> >   xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++++++++++++++++---=
-
> >   1 file changed, 23 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
> > index 232df2421c..945a18a7a1 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -637,6 +637,14 @@ static int arm_smmu_cmdq_issue_sync(struct arm_smm=
u_device *smmu)
> >   }
> >
> >   /* Stream table manipulation functions */
> > +static void arm_smmu_clean_dcache(struct arm_smmu_device *smmu,
> > +                             const void *ptr, size_t size)
> > +{
> > +     /* Xen's dmam_alloc_coherent() returns cacheable memory. */
> > +     if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
> > +             (void)clean_dcache_va_range(ptr, size);
>
> So, two ways of testing coherency in one file. The queues use
> q->non_coherent in several places. The new helper reads smmu->features &
> ARM_SMMU_FEAT_COHERENCY. Both derive from the same bit, so behaviour is
> correct.
>
> NIT 1: Cast is inconsistent. The helper casts the int return of
> clean_dcache_va_range() to (void). The queue code in the same file
> ignores the same return without a cast.

On Arm, clean_dcache_va_range() always returns 0. I used (void) in
the new helper to discard the result explicitly and avoid a new
MISRA C Rule 17.7 violation. I kept the patch focused on the
stream-table code.

>
> NIT 2: I wonder if the queue code's open-coded "if (q->non_coherent)
> clean/invalidate..." calls could share the helper? That would eliminate
> the duplicate coherency checks, avoid spreading CMO logic across the
> driver, and also resolve NIT 1 since the cast (or lack thereof) would
> live in one place.

I see the benefit of sharing the cache helpers. I'd prefer to keep
this patch focused on the stream-table fix.

The queue functions already get the same coherency information from
q->non_coherent, so sharing the helpers there could be a separate
refactoring. I'd also welcome the maintainers' thoughts on whether
it makes sense to include that change in this patch.

>
> ***
>
> Somthing like this:
> +static void arm_smmu_clean_dcache(struct arm_smmu_device *smmu,
> +                                 const void *ptr, size_t size)
> +{
> +       if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
> +               (void)clean_dcache_va_range(ptr, size);
> +}
> +
> +static void arm_smmu_invalidate_dcache(struct arm_smmu_device *smmu,
> +                                      const void *ptr, size_t size)
> +{
> +       if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
> +               (void)invalidate_dcache_va_range(ptr, size);
> +}
>
>
> The queue callers would then look like this:
>
> -       if (q->non_coherent)
> -               clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_a=
ddr));
> +       arm_smmu_clean_dcache(q->smmu, q_addr,
> +                             q->ent_dwords * sizeof(*q_addr));
>
> ...
>
> -       if (q->non_coherent)
> -               invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof=
(*q_addr));
> +       arm_smmu_invalidate_dcache(q->smmu, q_addr,
> +                                  q->ent_dwords * sizeof(*q_addr));
>
> For this to work, the queue needs a back pointer to the SMMU
> (replacing the non_coherent flag), set in arm_smmu_init_one_queue():
>
> -       q->non_coherent =3D !(smmu->features & ARM_SMMU_FEAT_COHERENCY);
> +       q->smmu =3D smmu;
>
>
> struct arm_smmu_queue {
>          ...
>
> -       /* Is the memory access coherent? */
> -       bool                            non_coherent;
> +       struct arm_smmu_device          *smmu;
>   };
>
> This is optional, so feel free to keep the code as it is if you prefer.
>
>
> > +}
> > +
> >   static void
> >   arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_=
desc *desc)
> >   {
> > @@ -649,7 +657,8 @@ arm_smmu_write_strtab_l1_desc(__le64 *dst, struct a=
rm_smmu_strtab_l1_desc *desc)
> >       write_atomic(dst, cpu_to_le64(val));
> >   }
> >
> > -static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u3=
2 sid)
> > +static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u3=
2 sid,
> > +                                   const __le64 *dst, size_t size)
> >   {
> >       struct arm_smmu_cmdq_ent cmd =3D {
> >               .opcode =3D CMDQ_OP_CFGI_STE,
> > @@ -659,6 +668,7 @@ static void arm_smmu_sync_ste_for_sid(struct arm_sm=
mu_device *smmu, u32 sid)
> >               },
> >       };
> >
> > +     arm_smmu_clean_dcache(smmu, dst, size);
> >       arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> >       arm_smmu_cmdq_issue_sync(smmu);
> >   }
> > @@ -736,7 +746,8 @@ static void arm_smmu_write_strtab_ent(struct arm_sm=
mu_master *master, u32 sid,
> >                * the STE regardless of whether the old value was live.
> >                */
> >               if (smmu)
> > -                     arm_smmu_sync_ste_for_sid(smmu, sid);
> > +                     arm_smmu_sync_ste_for_sid(smmu, sid, dst,
> > +                                               STRTAB_STE_DWORDS << 3)=
;
> >               return;
> >       }
> >
> > @@ -762,9 +773,9 @@ static void arm_smmu_write_strtab_ent(struct arm_sm=
mu_master *master, u32 sid,
> >               dst[1] |=3D cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS,
> >                                                STRTAB_STE_1_EATS_TRANS)=
);
> >
> > -     arm_smmu_sync_ste_for_sid(smmu, sid);
> > +     arm_smmu_sync_ste_for_sid(smmu, sid, dst, STRTAB_STE_DWORDS << 3)=
;
> >       write_atomic(&dst[0], cpu_to_le64(val));
> > -     arm_smmu_sync_ste_for_sid(smmu, sid);
> > +     arm_smmu_sync_ste_for_sid(smmu, sid, dst, sizeof(*dst));
> >
> >       /* It's likely that we'll want to use the new STE soon */
> >       if (!(smmu->options & ARM_SMMU_OPT_SKIP_PREFETCH))
> > @@ -805,7 +816,10 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu=
_device *smmu, u32 sid)
> >       }
> >
> >       arm_smmu_init_bypass_stes(desc->l2ptr, 1 << STRTAB_SPLIT);
> > +     /* Clean the L2 table before writing the L1 pointer. */
> > +     arm_smmu_clean_dcache(smmu, desc->l2ptr, size);
> >       arm_smmu_write_strtab_l1_desc(strtab, desc);
> > +     arm_smmu_clean_dcache(smmu, strtab, STRTAB_L1_DESC_DWORDS << 3);
> >       return 0;
> >   }
> >
> > @@ -1744,6 +1758,7 @@ static int __init arm_smmu_init_queues(struct arm=
_smmu_device *smmu)
> >   static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
> >   {
> >       unsigned int i;
> > +     size_t size;
> >       struct arm_smmu_strtab_cfg *cfg =3D &smmu->strtab_cfg;
> >       void *strtab =3D smmu->strtab_cfg.strtab;
> >
> > @@ -1757,6 +1772,9 @@ static int arm_smmu_init_l1_strtab(struct arm_smm=
u_device *smmu)
> >               strtab +=3D STRTAB_L1_DESC_DWORDS << 3;
> >       }
> >
> > +     size =3D cfg->num_l1_ents * (STRTAB_L1_DESC_DWORDS << 3);
> > +     arm_smmu_clean_dcache(smmu, cfg->strtab, size);
>
> NIT 3: arm_smmu_init_l1_strtab() recomputes the L1 size that its caller
> already has as l1size. I would move arm_smmu_clean_dcache() to
> arm_smmu_init_strtab_2lvl() to avoid recalculating it and reduce the diff=
.

Agreed. I'll move the L1 table clean to arm_smmu_init_strtab_2lvl()
and use the existing l1size once arm_smmu_init_l1_strtab() succeeds.

Best regards,
Mykola

