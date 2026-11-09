Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C540606D809
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJ2eBVBp
Received: from list by lists.xenproject.org with outflank-mailman.1479889.1683793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNW8-000130-JA; Mon, 09 Nov 2026 11:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479889.1683793; Mon, 09 Nov 2026 11:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNW8-00012t-GC; Mon, 09 Nov 2026 11:26:28 +0000
Received: by outflank-mailman (input) for mailman id 1479889;
 Mon, 09 Nov 2026 11:26:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xQNW7-00012l-T4
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:26:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNW7-009Cdk-2P
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:26:27 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6af1add7-8faa-0a2a0a5109dd-0a2a450cbf3e-32
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:26:27 +0100
Received: from [209.85.167.52] (helo=mail-lf1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6af1ade2-f479-0a2a450c0019-d155a734b909-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:26:26 +0100
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5be3d5927ceso594769e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 03:26:26 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794223586; cv=none;
        d=google.com; s=arc-20260327;
        b=ThwHdZ4atO/hlVUtLFL+ZFmOn3LFbiw0StIiF+q9ZnLO7TGpYJQSzG8MuHN9XiNQlt
         Wefn44MORvgcgtJidjlgGvTCE3jpNu08uDeCWxIBOQFM9RAuIMoqqjfVtjn/bX63uHO+
         U8v+9NqvH8wFAuxK/4qV8OxztL+L2PkmpwPjiHBBfBYtXchAlqHIcMptMG6QtVEyfQqy
         Tc70ZWw4KgpkteQ26PonPxK4LrMD1mY0uJgTabL6V+jKUtdT6ucO0BHkGXcQuZo4VYCW
         5mf7Q64e7kb2RwA0TtMsgtSj7RElMdbSMXtwlF5c1iH4IHsv5O+hpWgMZJDHe2baPHXR
         oJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GC/WiRa4BFZiF0YhXG/4CNhU9lwpieaoIuaYRgb9DEU=;
        fh=QDE/14JMhnY+9Xh/wfu6xkFWlfrfzZLzf/2DjBOft7E=;
        b=r0Z3e+eTA9VqX34a76+LkYCcvfd8/Pa/QfVv69K0qwyyyE+Z+742yqUYYCepjf8umj
         3DAIqg+LEYyqY9BTEJJyWd3G6qvs5yEhdFf95VZvVU5iOd/im6NECX0DO9levvqN++Bc
         p3SK9e+ky+0nSmp8Tsm3/Pk/rum8rzm+Ew9pqY3Ua4boicyVpFdAfyh8yxV03wpQWb7C
         zfwK+7nbDeCfuW493UBsguQev4GpM5f7Ki7jLAKXGnWR8j2Nz3t9W9qoTqz3GGu2XXJ/
         Di9sECAbGCumkUP1OWiI6fHpdgLccM/UYeJ1P7BIIuc/P2CnDu67EXr/JaUwMfPGIPaS
         swbQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223586; x=1794828386; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GC/WiRa4BFZiF0YhXG/4CNhU9lwpieaoIuaYRgb9DEU=;
        b=wJ2eBVBpVtLXJrJzHPC+X6ERN8n0UuE+Z0aIh6Dd3ElYXslWOlITz8rJY47JiAkW5X
         j7+NqBDErhlBiw5d6cX7tGFLRE+3d6OHwGCXgFpzyzGD7sTQx7EniNaMPitKJIgQ2Xwi
         EvUV6Hd4TZzG5l107m9qwn+zWYiBv3Bj651u/YELC3mdlt/KLirETJmWkHGF9CQUzFUG
         h4BHU2I1ZrjJhLz00V+ob33zUjnc4SDs7jgr/KcARexr1ZQkEXNqlvlaf4ectHHzWH3h
         PnHDoHd8H/aLw7TW+ZkwI/ATMbbols2RIe6oZfpn0S4PkU6q5I/amh70Kbijiedu4h7L
         Qt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223586; x=1794828386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC/WiRa4BFZiF0YhXG/4CNhU9lwpieaoIuaYRgb9DEU=;
        b=J/gM/rRzBcK0bKZ56d/mntj30aMAP3ZJ7bnb02bb5Yoe76ag0ZFUrCYbo/gk6CM/kr
         4o7z8SVzTYNRfmxExX+vcoxnoHWWgn820JceNnTbIGLmzcV+vlkfqiyKYAhgjOfHvLj+
         oO/8HS5knheqk5gEcSU/Ltp9IyQbSJXDHcuaNoG9EX2cd+FTAQHb5MU4yMXVfDi/8hhh
         IJC+IHpI2g7hZaJu0WAK2BKiauythIJPo8bbZRbyEBqq88zsMgC1JBjnzCENMDJ4nWlr
         CZpeXdEJLrgQqkGTYhoA4wrIjEd1pksMijvCPax3kh5L/qgWTaYsav6lozcida7cmmu2
         MFjw==
X-Forwarded-Encrypted: i=1; AL+hErGxVgUkeThNst5jQNywMzSmfhXVfuXe1+RvDd0VJwDLW1XOsZ1nwskGw4pvrq6DNcgrdYLfzExucd4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9p18BrYH/ZPCrdVKSEDZpp6nbwpYnAURBoJrJz19Kmfxy92qG5
	rLep04ECoFBkKtDt+fU4akdav1KQGr9AI0Bd6m0cifvZr8ezR91OaJG7wLD3mjUpEHvBaqARBNL
	nL/ZPfh4U7yzS5h0kT4u6eJGpxnfgFCk=
X-Gm-Gg: AYBFou3xZkPRokTDxCnxU0+o1sfn5zKDcT4ppHGKSoFMrdQhD1vrj45/gZuhiVA36Ia
	3FDRmpu9tSxb5kTRz1ogq5A8ZkQv3NNaZRcpHiHL1Rm6n/pTNjli3ODkSHlD2uQI91WyIzOKO6F
	Au5dqb4d7wMMKqajaS8grXS5KNiLwQ4XRJxA5ZZ/RdDXz+OJRLkHQirjdQbBkE1KC7RT8+r6ZKu
	qon4vufVVILMNXixCSaJWzKe3k0YTZsexIHnzyjAb9uGFijK1JZ3GLEy/CBocFmtjttQBWAkn9w
	8AfzI/hbKYqz4LTOYk/p6UMpCAapBbx/S3FRtNyBowcMnJPwxt1Yx6wGWfj2xV81wSwQKx1z38h
	p8r/dKXLIUEMU6NGMXiu3wbjgpu9eUqXAZL1D3Pb/oAV5Rt/B6KgaXKE=
X-Received: by 2002:a2e:a5cb:0:b0:3ab:3bf3:1606 with SMTP id
 38308e7fff4ca-3adfa3fa9a1mr9112571fa.24.1794223586013; Mon, 09 Nov 2026
 03:26:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <d54203457d68a3c6f8f311035a8e66468bb3a96b.1793138347.git.mykola_kvach@epam.com>
 <87fqxqsiix.fsf@epam.com>
In-Reply-To: <87fqxqsiix.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 9 Nov 2026 13:26:14 +0200
X-Gm-Features: AclHuK8nTRTZ7LDwN0KNmtLCI6bRsGOuxzC8Z-uKS-6Ko1y80-A_BgsXDohnZq4
Message-ID: <CAGeoDV_y7SgJJ8yz0uYsiHdRvekDa435hLmt+vdrSObvz6R7Tg@mail.gmail.com>
Subject: Re: [PATCH] arm/smmuv3: clean stream tables for non-coherent hardware
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Mykola Kvach <Mykola_Kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1794223586-778D5A5B-10F79C32/0/0
X-purgate-type: clean
X-purgate-size: 5496
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Volodymyr,

Thanks for the review.

On Wed, Oct 28, 2026 at 3:48=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi,
>
> Mykola Kvach <mykola_kvach@epam.com> writes:
>
> > Xen's dmam_alloc_coherent() returns cacheable memory. A non-coherent
> > SMMU cannot see writes that remain in the CPU cache.
> >
> > On Orange Pi 5 (RK3588S), NVMe initialization failed with C_BAD_STREAMI=
D
> > for SID 0x4100 while the CPU saw a populated L1 descriptor.
> >
> > Clean new stream tables before use and updated STEs before the existing
> > configuration invalidations. Clean the L2 table before writing its L1
> > pointer, then clean the pointer. Skip these cache operations on coheren=
t
> > SMMUs.
> >
> > See Arm IHI 0070G.b, sections 3.15 and 3.21.3.1.
> >
> > Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
> > Assisted-by: Codex:GPT-6.1
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/drivers/passthrough/arm/smmu-v3.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
> > index bf153227db..a396e2b9e0 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -637,6 +637,14 @@ static int arm_smmu_cmdq_issue_sync(struct arm_smm=
u_device *smmu)
> >  }
> >
> >  /* Stream table manipulation functions */
> > +static void arm_smmu_clean_strtab(struct arm_smmu_device *smmu,
>
> I think the name is a bit misleading. You are not cleaning the stream
> table. You are cleaning cache entries. Also, behaviour of this function
> is more generic, as it know nothing about stream tables and clears any
> cache line you are giving it.
>
> Maybe call it something like arm_smmu_flush_strtab, or
> arm_smmu_clean_dcache, or something along these variants?

Agreed, arm_smmu_clean_dcache() describes the operation more precisely.
I'll use that name in v2.

>
> > +                             const void *ptr, size_t size)
> > +{
> > +     /* Xen's dmam_alloc_coherent() returns cacheable memory. */
> > +     if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
> > +             (void)clean_dcache_va_range(ptr, size);
> > +}
> > +
> >  static void
> >  arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_d=
esc *desc)
> >  {
> > @@ -735,8 +743,11 @@ static void arm_smmu_write_strtab_ent(struct arm_s=
mmu_master *master, u32 sid,
> >                * The SMMU can perform negative caching, so we must sync
> >                * the STE regardless of whether the old value was live.
> >                */
> > -             if (smmu)
> > +             if (smmu) {
> > +                     arm_smmu_clean_strtab(smmu, dst,
> > +                                           STRTAB_STE_DWORDS * sizeof(=
*dst));
> >                       arm_smmu_sync_ste_for_sid(smmu, sid);
>
> I see that there a lot of places where you are calling
> arm_smmu_clean_strtab() before arm_smmu_sync_ste_for_sid(). I think it
> is better to move arm_smmu_clean_strtab() to the beginning of
> arm_smmu_sync_ste_for_sid().

Agreed. I'll pass the STE pointer to arm_smmu_sync_ste_for_sid() and
clean the whole entry there before issuing CFGI_STE and CMD_SYNC.
All current callers already have the pointer available.

This will preserve both sync points around the dst[0] update.

I'll keep the explicit cache cleaning in the table initialisation
paths.

Thanks,
Mykola


>
> > +             }
> >               return;
> >       }
> >
> > @@ -762,8 +773,10 @@ static void arm_smmu_write_strtab_ent(struct arm_s=
mmu_master *master, u32 sid,
> >               dst[1] |=3D cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS,
> >                                                STRTAB_STE_1_EATS_TRANS)=
);
> >
> > +     arm_smmu_clean_strtab(smmu, dst, STRTAB_STE_DWORDS * sizeof(*dst)=
);
> >       arm_smmu_sync_ste_for_sid(smmu, sid);
> >       write_atomic(&dst[0], cpu_to_le64(val));
> > +     arm_smmu_clean_strtab(smmu, dst, sizeof(*dst));
> >       arm_smmu_sync_ste_for_sid(smmu, sid);
> >
> >       /* It's likely that we'll want to use the new STE soon */
> > @@ -805,7 +818,11 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu=
_device *smmu, u32 sid)
> >       }
> >
> >       arm_smmu_init_bypass_stes(desc->l2ptr, 1 << STRTAB_SPLIT);
> > +     /* Clean the L2 table before writing the L1 pointer. */
> > +     arm_smmu_clean_strtab(smmu, desc->l2ptr, size);
> >       arm_smmu_write_strtab_l1_desc(strtab, desc);
> > +     arm_smmu_clean_strtab(smmu, strtab,
> > +                           STRTAB_L1_DESC_DWORDS * sizeof(__le64));
> >       return 0;
> >  }
> >
> > @@ -1700,6 +1717,9 @@ static int arm_smmu_init_l1_strtab(struct arm_smm=
u_device *smmu)
> >               strtab +=3D STRTAB_L1_DESC_DWORDS << 3;
> >       }
> >
> > +     arm_smmu_clean_strtab(smmu, cfg->strtab,
> > +             cfg->num_l1_ents * STRTAB_L1_DESC_DWORDS * sizeof(__le64)=
);
> > +
> >       return 0;
> >  }
> >
> > @@ -1766,6 +1786,7 @@ static int arm_smmu_init_strtab_linear(struct arm=
_smmu_device *smmu)
> >       cfg->strtab_base_cfg =3D reg;
> >
> >       arm_smmu_init_bypass_stes(strtab, cfg->num_l1_ents);
> > +     arm_smmu_clean_strtab(smmu, strtab, size);
> >       return 0;
> >  }
>
> --
> WBR, Volodymyr

