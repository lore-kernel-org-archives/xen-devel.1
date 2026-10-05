Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E775ECA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 18:09:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441100.1658715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDn82-0001yM-5S; Mon, 05 Oct 2026 18:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441100.1658715; Mon, 05 Oct 2026 18:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDn82-0001yF-27; Mon, 05 Oct 2026 18:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1441100;
 Mon, 05 Oct 2026 18:09:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1xDn80-0001y9-T0
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:09:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDn80-003GEL-9W
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 20:09:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6ac3e7da-8faa-0a2a0a5109dd-0a2a4507b226-2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 20:09:32 +0200
Received: from [74.125.228.96] (helo=mail-ed2-f32.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6ac3e7dc-b4ea-0a2a45070019-4a7de460b510-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 20:09:32 +0200
Received: by mail-ed2-f32.google.com with SMTP id
 4fb4d7f45d1cf-6af7d702c76so2753256a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:09:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1791223772; cv=none;
        d=google.com; s=arc-20260327;
        b=K848G0vjF9SSILmLk1/4FwPDccCK+MPo4a3vRWSRoJsTeBNK8sw7EQSGoRJ1lbZoL8
         toxwR8XuvStwDeU8eNxPD57Y3naIDtRuFn0zwPCpoaeYqfRH2Zv0Qsuqi1c+E3581Jvk
         ES3SRFsiIDDmDtNEOb9D5+Nm8o7wsEJD1auvipa1H/IOCwLUwZYci2Cl6Cd9O6oIFLUy
         94dRU3M/kRaUbuL0jUOfv25EyaHyvTb143F5TRX25CdZzC8vN9HuCRXNXAEKq0PnxykO
         KZvkP/UieZI3HNpUEY7BzDzcqIkj5iahnkWZoj28Z9yZxgCRF3l5U53+9JJ08yKWnd0E
         unkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+E3n7efndYsIolQFRyzLYwCoF9ey9KM05X/9TVoD4+w=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=THdt/8DqALbGVDfnUcbD6zVwMK7JFZ61VcyeTGx+n7r7jI7lk7v7rpwXLuVk/dlCcU
         4SnE3J0rq02QIEjXqQBglxBM2/WLI2X8H3xy7yMf2i6Jv9yHYsL7TpVbXkgGoXjwVRY3
         j2kaCcVN2S7dM/eHUmQLF7ccHO19KhZjT5UZyCAx/6qs/2/4MQ+GDU7u62X0DAczD930
         eTKpZabwCpXV7aJAM1kv8DvVep/sm9T8Sg9usBcFt9Uu/Qz5PtPwIPvB+25VouY0K547
         VImBT6OpcCZMlKu7A3osFKNsJO0e+3TczVdft66vMFOv/Z/wnB1yEJvX8iYPZ9vxrx8C
         hK4w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791223772; x=1791828572; darn=lists.xenproject.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+E3n7efndYsIolQFRyzLYwCoF9ey9KM05X/9TVoD4+w=;
        b=lo1KVYtqLlbdsC9nKWg9vUF+l0Fo51zlenJNbRnmQn0QwUp7rsrAMOxzqGDlioadqE
         V7UG8Hv4oFYHxmpGvCh3kGldgJnqdke37GimOcjGfp3Tzq48Omut612cPpfmSAuykhal
         9WspXqYfLkIyhOonoZB4jjNOZayrdVVHxi0dpVZJikOYOZ8TYhBRqZ+mkxKfpjBJvh0Z
         IcIIKb8jF1gDmwBKYE8awIQtx49+Hg9LJOrmFpdZb+2vgPPWRUwxWxqXkLkdNUYG2jAC
         YivY74/dNL5FEeavw621TSvT3TiyTObv2DOvCJScOpPATymFNlKa77MwF1z/CQUf49fu
         kAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791223772; x=1791828572;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+E3n7efndYsIolQFRyzLYwCoF9ey9KM05X/9TVoD4+w=;
        b=VtOD97qmh5VibD1SQw7Wc/ikQA94gmZa5PDj2BN6WYJPVyclBDA5A4lQ04rC53Inc+
         Vjz4lXJzy02b5awFflWoyYS7sP3E0W3l/eEIKVEV5+E9gZl55bqHpjikaM+4GskWCiFB
         rTfJa43iqHUNfmmWiYuES70YzwnlpF954OVkNb4HjRpq+surBkb5FVN3k7UTwNEffySS
         Z68cMfB5pP5yyw3E/EEVPxzBpVE1GGobAbSKvDEL2B38jei7EHK4avgxiUa6FUbCz3Z0
         p3fM0rktjUL1p8qraA5P7kBftBi6dPyELaaRmRQ17Lq3RRjou/Qv4cXf2om7xqIPO5nL
         Uqfw==
X-Gm-Message-State: AFuF++llgGXDKJCBvhcSbKu7/mbi/Rq2me9plaQolBp3SpDdFGdGu/vn
	uqGOe1QIC49xMqLhZJ7a2lwnUAs1lKRatcNw86ToNO8m1t8PwzNaaiCu5CKE6hrc9AsDI5mFpeO
	RP9ngnfUU/i0feKFPY74Qx6P/RFGBgrcDDsfcR+M=
X-Gm-Gg: AYBFou2uw6ZYW1AJ0ZfwEMuvhCJ/xGC6IDlGx1QLykP39QaQvbeaorWljf3dVPitD/8
	c2VNk2l3dJcFZsRRh6ocOkz2o2tqTvDjkiZRgEvIB3v0lNdDIgDm2RMFQFcAsVM72RxaxD/BMaa
	xwuNEDO5xSAP8Rdv8izR2vTczKWtSeVUDnbuqoSGxNgML3ZNeaSuhc3m1wkEgtmoehYhD9ngogZ
	M8wJEf8FdBsM06C23UNPbjngQ823gfvNjO4XaidleRbxTRkNE4f6Ji4GfW5UD0X3dXI725IPOio
	M+1uZwrp13xv7m8zfZOxPo6fCkblAFNOTS7szwe6R/LsKlfTVxhMCh06pLNp4EmeXPY=
X-Received: by 2002:a17:907:94cd:b0:c2e:3d17:5265 with SMTP id
 a640c23a62f3a-c2e4acecd07mr1083234166b.21.1791223771669; Mon, 05 Oct 2026
 11:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261005175258.101303-1-gabi.qs.mail@gmail.com>
In-Reply-To: <20261005175258.101303-1-gabi.qs.mail@gmail.com>
From: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>
Date: Mon, 5 Oct 2026 20:09:19 +0200
X-Gm-Features: AclHuK8HMkStYxsM4d3TcEYemmfvYUdqUMwaSgDPdZwkYNi2p2cffqUAliw-tlk
Message-ID: <CAJ9nuZSDQanhu0qNt2DCnGffLiiy1dduhaMLAYi=Cj+FvN_Ocw@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: validate non-common page-table ranges
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000009fab4f065d1bc823"
X-purgate-ID: tlsNG-ef75cf/1791223772-A4ECEAE4-31F06840/0/0
X-purgate-type: clean
X-purgate-size: 20727

--0000000000009fab4f065d1bc823
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the noise, please ignore v2, accidentally committed a local file.
Just sent v3.

Best regards,
Gabriel

On Mon, Oct 5, 2026 at 7:54=E2=80=AFPM Gabriel Quint=C3=A1ns Souto <
gabi.qs.mail@gmail.com> wrote:

> On arm32, page-tables are different on each CPUs, although they share som=
e
> common mappings.
>
> The xen_pt_update function assumed that only said mappings would be
> modified, but did not check this assumption.
>
> Add a range check to reject modifications to non-common mappings.
>
> Signed-off-by: Gabriel Quint=C3=A1ns Souto <gabi.qs.mail@gmail.com>
> ---
> v2:
> - Inverted polarity of xen_pt_range_is_non_common() as suggested.
> - Moved xen_pt_range_is_common() implementation to arch-specific headers
> (arm32 vs arm64) instead of keeping #ifdef CONFIG_ARM_32 in pt.c (tried
> IS_ENABLED() for DCE, but ARM64 lacks definitions for
> DOMHEAP_VIRT_START/TEMPORARY_AREA_ADDR, breaking the build).
> - Added ASSERT_UNREACHABLE() on failure path in xen_pt_update().
> ---
>  ...alidate-non-common-page-table-ranges.patch | 87 +++++++++++++++++++
>  xen/arch/arm/include/asm/arm32/mm.h           | 24 +++++
>  xen/arch/arm/include/asm/arm64/mm.h           | 10 +++
>  xen/arch/arm/mmu/pt.c                         | 30 +------
>  4 files changed, 125 insertions(+), 26 deletions(-)
>  create mode 100644
> v1-0001-xen-arm-validate-non-common-page-table-ranges.patch
>
> diff --git a/v1-0001-xen-arm-validate-non-common-page-table-ranges.patch
> b/v1-0001-xen-arm-validate-non-common-page-table-ranges.patch
> new file mode 100644
> index 0000000..9f04107
> --- /dev/null
> +++ b/v1-0001-xen-arm-validate-non-common-page-table-ranges.patch
> @@ -0,0 +1,87 @@
> +From 21cd59798dafea289feeecd94f39890e99497525 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Gabriel=3D20Quint=3DC3=3DA1ns=3D20Souto?=3D <gabi.qs.m=
ail@gmail.com
> >
> +Date: Fri, 2 Oct 2026 20:17:05 +0200
> +Subject: [PATCH v1] xen/arm: validate non-common page-table ranges
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +On arm32, page-tables are different on each CPUs, although they share so=
me
> +common mappings.
> +
> +The xen_pt_update function assumed that only said mappings would be
> +modified, but did not check this assumption.
> +
> +Add a range check to reject modifications to non-common mappings.
> +
> +Signed-off-by: Gabriel Quint=C3=A1ns Souto <gabi.qs.mail@gmail.com>
> +---
> + xen/arch/arm/mmu/pt.c | 36 +++++++++++++++++++++++++++++-------
> + 1 file changed, 29 insertions(+), 7 deletions(-)
> +
> +diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
> +index 621b47d..ad0d1e6 100644
> +--- a/xen/arch/arm/mmu/pt.c
> ++++ b/xen/arch/arm/mmu/pt.c
> +@@ -13,6 +13,7 @@
> +
> + #include <asm/current.h>
> + #include <asm/fixmap.h>
> ++#include <asm/mmu/layout.h>
> +
> + #ifdef NDEBUG
> + static inline void
> +@@ -589,6 +590,29 @@ static unsigned int xen_pt_check_contig(unsigned
> long vfn, mfn_t mfn,
> +     return XEN_PT_4K_NR_CONTIG;
> + }
> +
> ++#ifdef CONFIG_ARM_32
> ++static bool ranges_overlap(unsigned long start1, unsigned long size1,
> ++                           unsigned long start2, unsigned long size2)
> ++{
> ++    if ( start1 < start2 )
> ++        return start2 - start1 < size1;
> ++
> ++    return start1 - start2 < size2;
> ++}
> ++
> ++static bool xen_pt_range_is_non_common(unsigned long virt,
> ++                                       unsigned long size)
> ++{
> ++    unsigned long temporary_start =3D TEMPORARY_AREA_ADDR(0);
> ++    unsigned long temporary_size =3D XEN_PT_LEVEL_SIZE(1);
> ++
> ++    return ranges_overlap(virt, size,
> ++                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) ||
> ++           ranges_overlap(virt, size,
> ++                          temporary_start, temporary_size);
> ++}
> ++#endif
> ++
> + static DEFINE_SPINLOCK(xen_pt_lock);
> +
> + static int xen_pt_update(unsigned long virt,
> +@@ -601,15 +625,13 @@ static int xen_pt_update(unsigned long virt,
> +     unsigned long vfn =3D virt >> PAGE_SHIFT;
> +     unsigned long left =3D nr_mfns;
> +
> +-    /*
> +-     * For arm32, page-tables are different on each CPUs. Yet, they sha=
re
> +-     * some common mappings. It is assumed that only common mappings
> +-     * will be modified with this function.
> +-     *
> +-     * XXX: Add a check.
> +-     */
> +     const mfn_t root =3D maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
> +
> ++    #ifdef CONFIG_ARM_32
> ++    if ( xen_pt_range_is_non_common(virt, nr_mfns * PAGE_SIZE) )
> ++        return -EINVAL;
> ++    #endif
> ++
> +     if ( flags_has_rwx(flags) )
> +     {
> +         mm_printk("Mappings should not be both Writeable and
> Executable.\n");
> +--
> +2.54.0
> +
> diff --git a/xen/arch/arm/include/asm/arm32/mm.h
> b/xen/arch/arm/include/asm/arm32/mm.h
> index 856f2db..c7d09d3 100644
> --- a/xen/arch/arm/include/asm/arm32/mm.h
> +++ b/xen/arch/arm/include/asm/arm32/mm.h
> @@ -16,6 +16,30 @@ static inline bool arch_mfns_in_directmap(unsigned lon=
g
> mfn, unsigned long nr)
>      return false;
>  }
>
> +static inline bool ranges_overlap(unsigned long start1, unsigned long
> size1,
> +                           unsigned long start2, unsigned long size2)
> +{
> +    if ( start1 < start2 )
> +        return start2 - start1 < size1;
> +
> +    return start1 - start2 < size2;
> +}
> +
> +/*
> + * On ARM32, page-tables differ between CPUs, so not all mappings are
> common.
> + */
> +static inline bool xen_pt_range_is_common(unsigned long virt,
> +                                       unsigned long size)
> +{
> +    unsigned long temporary_start =3D TEMPORARY_AREA_ADDR(0);
> +    unsigned long temporary_size =3D XEN_PT_LEVEL_SIZE(1);
> +
> +    return !ranges_overlap(virt, size,
> +                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) &&
> +           !ranges_overlap(virt, size,
> +                          temporary_start, temporary_size);
> +}
> +
>  bool init_domheap_mappings(unsigned int cpu);
>
>  static inline void arch_setup_page_tables(void)
> diff --git a/xen/arch/arm/include/asm/arm64/mm.h
> b/xen/arch/arm/include/asm/arm64/mm.h
> index b4f7545..a3cb56d 100644
> --- a/xen/arch/arm/include/asm/arm64/mm.h
> +++ b/xen/arch/arm/include/asm/arm64/mm.h
> @@ -12,6 +12,16 @@ static inline bool arch_mfns_in_directmap(unsigned lon=
g
> mfn, unsigned long nr)
>      return true;
>  }
>
> +/*
> + * On ARM64, the Xen page-tables are shared by all the CPUs,
> + * any range is therefore common.
> + */
> +static inline bool xen_pt_range_is_common(unsigned long virt,
> +                                          unsigned long size)
> +{
> +    return true;
> +}
> +
>  void arch_setup_page_tables(void);
>
>  void update_boot_mapping(bool enable);
> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
> index ad0d1e6..5e1b427 100644
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -590,29 +590,6 @@ static unsigned int xen_pt_check_contig(unsigned lon=
g
> vfn, mfn_t mfn,
>      return XEN_PT_4K_NR_CONTIG;
>  }
>
> -#ifdef CONFIG_ARM_32
> -static bool ranges_overlap(unsigned long start1, unsigned long size1,
> -                           unsigned long start2, unsigned long size2)
> -{
> -    if ( start1 < start2 )
> -        return start2 - start1 < size1;
> -
> -    return start1 - start2 < size2;
> -}
> -
> -static bool xen_pt_range_is_non_common(unsigned long virt,
> -                                       unsigned long size)
> -{
> -    unsigned long temporary_start =3D TEMPORARY_AREA_ADDR(0);
> -    unsigned long temporary_size =3D XEN_PT_LEVEL_SIZE(1);
> -
> -    return ranges_overlap(virt, size,
> -                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) ||
> -           ranges_overlap(virt, size,
> -                          temporary_start, temporary_size);
> -}
> -#endif
> -
>  static DEFINE_SPINLOCK(xen_pt_lock);
>
>  static int xen_pt_update(unsigned long virt,
> @@ -627,10 +604,11 @@ static int xen_pt_update(unsigned long virt,
>
>      const mfn_t root =3D maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
>
> -    #ifdef CONFIG_ARM_32
> -    if ( xen_pt_range_is_non_common(virt, nr_mfns * PAGE_SIZE) )
> +    if ( !xen_pt_range_is_common(virt, nr_mfns * PAGE_SIZE) )
> +    {
> +        ASSERT_UNREACHABLE();
>          return -EINVAL;
> -    #endif
> +    }
>
>      if ( flags_has_rwx(flags) )
>      {
> --
> 2.54.0
>
>

--0000000000009fab4f065d1bc823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry for the noise, please ignore v2, accidentally c=
ommitted a local file. Just sent v3.<br><br>
Best regards,<br>Gabriel</div></div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 5, 2026 at =
7:54=E2=80=AFPM Gabriel Quint=C3=A1ns Souto &lt;<a href=3D"mailto:gabi.qs.m=
ail@gmail.com">gabi.qs.mail@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On arm32, page-tables are different on=
 each CPUs, although they share some<br>
common mappings.<br>
<br>
The xen_pt_update function assumed that only said mappings would be<br>
modified, but did not check this assumption.<br>
<br>
Add a range check to reject modifications to non-common mappings.<br>
<br>
Signed-off-by: Gabriel Quint=C3=A1ns Souto &lt;<a href=3D"mailto:gabi.qs.ma=
il@gmail.com" target=3D"_blank">gabi.qs.mail@gmail.com</a>&gt;<br>
---<br>
v2:<br>
- Inverted polarity of xen_pt_range_is_non_common() as suggested.<br>
- Moved xen_pt_range_is_common() implementation to arch-specific headers<br=
>
(arm32 vs arm64) instead of keeping #ifdef CONFIG_ARM_32 in pt.c (tried<br>
IS_ENABLED() for DCE, but ARM64 lacks definitions for<br>
DOMHEAP_VIRT_START/TEMPORARY_AREA_ADDR, breaking the build).<br>
- Added ASSERT_UNREACHABLE() on failure path in xen_pt_update().<br>
---<br>
=C2=A0...alidate-non-common-page-table-ranges.patch | 87 ++++++++++++++++++=
+<br>
=C2=A0xen/arch/arm/include/asm/arm32/mm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 24 +++++<br>
=C2=A0xen/arch/arm/include/asm/arm64/mm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 10 +++<br>
=C2=A0xen/arch/arm/mmu/pt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 +------<br>
=C2=A04 files changed, 125 insertions(+), 26 deletions(-)<br>
=C2=A0create mode 100644 v1-0001-xen-arm-validate-non-common-page-table-ran=
ges.patch<br>
<br>
diff --git a/v1-0001-xen-arm-validate-non-common-page-table-ranges.patch b/=
v1-0001-xen-arm-validate-non-common-page-table-ranges.patch<br>
new file mode 100644<br>
index 0000000..9f04107<br>
--- /dev/null<br>
+++ b/v1-0001-xen-arm-validate-non-common-page-table-ranges.patch<br>
@@ -0,0 +1,87 @@<br>
+From 21cd59798dafea289feeecd94f39890e99497525 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Gabriel=3D20Quint=3DC3=3DA1ns=3D20Souto?=3D &lt;<a href=
=3D"mailto:gabi.qs.mail@gmail.com" target=3D"_blank">gabi.qs.mail@gmail.com=
</a>&gt;<br>
+Date: Fri, 2 Oct 2026 20:17:05 +0200<br>
+Subject: [PATCH v1] xen/arm: validate non-common page-table ranges<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+On arm32, page-tables are different on each CPUs, although they share some=
<br>
+common mappings.<br>
+<br>
+The xen_pt_update function assumed that only said mappings would be<br>
+modified, but did not check this assumption.<br>
+<br>
+Add a range check to reject modifications to non-common mappings.<br>
+<br>
+Signed-off-by: Gabriel Quint=C3=A1ns Souto &lt;<a href=3D"mailto:gabi.qs.m=
ail@gmail.com" target=3D"_blank">gabi.qs.mail@gmail.com</a>&gt;<br>
+---<br>
+ xen/arch/arm/mmu/pt.c | 36 +++++++++++++++++++++++++++++-------<br>
+ 1 file changed, 29 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c<br>
+index 621b47d..ad0d1e6 100644<br>
+--- a/xen/arch/arm/mmu/pt.c<br>
++++ b/xen/arch/arm/mmu/pt.c<br>
+@@ -13,6 +13,7 @@<br>
+ <br>
+ #include &lt;asm/current.h&gt;<br>
+ #include &lt;asm/fixmap.h&gt;<br>
++#include &lt;asm/mmu/layout.h&gt;<br>
+ <br>
+ #ifdef NDEBUG<br>
+ static inline void<br>
+@@ -589,6 +590,29 @@ static unsigned int xen_pt_check_contig(unsigned long=
 vfn, mfn_t mfn,<br>
+=C2=A0 =C2=A0 =C2=A0return XEN_PT_4K_NR_CONTIG;<br>
+ }<br>
+ <br>
++#ifdef CONFIG_ARM_32<br>
++static bool ranges_overlap(unsigned long start1, unsigned long size1,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned long start2, unsigned long size2)<br>
++{<br>
++=C2=A0 =C2=A0 if ( start1 &lt; start2 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return start2 - start1 &lt; size1;<br>
++<br>
++=C2=A0 =C2=A0 return start1 - start2 &lt; size2;<br>
++}<br>
++<br>
++static bool xen_pt_range_is_non_common(unsigned long virt,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
long size)<br>
++{<br>
++=C2=A0 =C2=A0 unsigned long temporary_start =3D TEMPORARY_AREA_ADDR(0);<b=
r>
++=C2=A0 =C2=A0 unsigned long temporary_size =3D XEN_PT_LEVEL_SIZE(1);<br>
++<br>
++=C2=A0 =C2=A0 return ranges_overlap(virt, size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges_overlap(virt, size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 temporary_start, temporary_size);<br>
++}<br>
++#endif<br>
++<br>
+ static DEFINE_SPINLOCK(xen_pt_lock);<br>
+ <br>
+ static int xen_pt_update(unsigned long virt,<br>
+@@ -601,15 +625,13 @@ static int xen_pt_update(unsigned long virt,<br>
+=C2=A0 =C2=A0 =C2=A0unsigned long vfn =3D virt &gt;&gt; PAGE_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0unsigned long left =3D nr_mfns;<br>
+ <br>
+-=C2=A0 =C2=A0 /*<br>
+-=C2=A0 =C2=A0 =C2=A0* For arm32, page-tables are different on each CPUs. =
Yet, they share<br>
+-=C2=A0 =C2=A0 =C2=A0* some common mappings. It is assumed that only commo=
n mappings<br>
+-=C2=A0 =C2=A0 =C2=A0* will be modified with this function.<br>
+-=C2=A0 =C2=A0 =C2=A0*<br>
+-=C2=A0 =C2=A0 =C2=A0* XXX: Add a check.<br>
+-=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0const mfn_t root =3D maddr_to_mfn(READ_SYSREG64(TTBR0_=
EL2));<br>
+ <br>
++=C2=A0 =C2=A0 #ifdef CONFIG_ARM_32<br>
++=C2=A0 =C2=A0 if ( xen_pt_range_is_non_common(virt, nr_mfns * PAGE_SIZE) =
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
++=C2=A0 =C2=A0 #endif<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0if ( flags_has_rwx(flags) )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mm_printk(&quot;Mappings should not be b=
oth Writeable and Executable.\n&quot;);<br>
+-- <br>
+2.54.0<br>
+<br>
diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm=
/arm32/mm.h<br>
index 856f2db..c7d09d3 100644<br>
--- a/xen/arch/arm/include/asm/arm32/mm.h<br>
+++ b/xen/arch/arm/include/asm/arm32/mm.h<br>
@@ -16,6 +16,30 @@ static inline bool arch_mfns_in_directmap(unsigned long =
mfn, unsigned long nr)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+static inline bool ranges_overlap(unsigned long start1, unsigned long size=
1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned long start2, unsigned long size2)<br>
+{<br>
+=C2=A0 =C2=A0 if ( start1 &lt; start2 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return start2 - start1 &lt; size1;<br>
+<br>
+=C2=A0 =C2=A0 return start1 - start2 &lt; size2;<br>
+}<br>
+<br>
+/*<br>
+ * On ARM32, page-tables differ between CPUs, so not all mappings are comm=
on.<br>
+ */<br>
+static inline bool xen_pt_range_is_common(unsigned long virt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
long size)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned long temporary_start =3D TEMPORARY_AREA_ADDR(0);<br=
>
+=C2=A0 =C2=A0 unsigned long temporary_size =3D XEN_PT_LEVEL_SIZE(1);<br>
+<br>
+=C2=A0 =C2=A0 return !ranges_overlap(virt, size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!ranges_overlap(virt, size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 temporary_start, temporary_size);<br>
+}<br>
+<br>
=C2=A0bool init_domheap_mappings(unsigned int cpu);<br>
<br>
=C2=A0static inline void arch_setup_page_tables(void)<br>
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm=
/arm64/mm.h<br>
index b4f7545..a3cb56d 100644<br>
--- a/xen/arch/arm/include/asm/arm64/mm.h<br>
+++ b/xen/arch/arm/include/asm/arm64/mm.h<br>
@@ -12,6 +12,16 @@ static inline bool arch_mfns_in_directmap(unsigned long =
mfn, unsigned long nr)<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
+/*<br>
+ * On ARM64, the Xen page-tables are shared by all the CPUs,<br>
+ * any range is therefore common.<br>
+ */<br>
+static inline bool xen_pt_range_is_common(unsigned long virt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
nsigned long size)<br>
+{<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
=C2=A0void arch_setup_page_tables(void);<br>
<br>
=C2=A0void update_boot_mapping(bool enable);<br>
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c<br>
index ad0d1e6..5e1b427 100644<br>
--- a/xen/arch/arm/mmu/pt.c<br>
+++ b/xen/arch/arm/mmu/pt.c<br>
@@ -590,29 +590,6 @@ static unsigned int xen_pt_check_contig(unsigned long =
vfn, mfn_t mfn,<br>
=C2=A0 =C2=A0 =C2=A0return XEN_PT_4K_NR_CONTIG;<br>
=C2=A0}<br>
<br>
-#ifdef CONFIG_ARM_32<br>
-static bool ranges_overlap(unsigned long start1, unsigned long size1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned long start2, unsigned long size2)<br>
-{<br>
-=C2=A0 =C2=A0 if ( start1 &lt; start2 )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return start2 - start1 &lt; size1;<br>
-<br>
-=C2=A0 =C2=A0 return start1 - start2 &lt; size2;<br>
-}<br>
-<br>
-static bool xen_pt_range_is_non_common(unsigned long virt,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
long size)<br>
-{<br>
-=C2=A0 =C2=A0 unsigned long temporary_start =3D TEMPORARY_AREA_ADDR(0);<br=
>
-=C2=A0 =C2=A0 unsigned long temporary_size =3D XEN_PT_LEVEL_SIZE(1);<br>
-<br>
-=C2=A0 =C2=A0 return ranges_overlap(virt, size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges_overlap(virt, size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 temporary_start, temporary_size);<br>
-}<br>
-#endif<br>
-<br>
=C2=A0static DEFINE_SPINLOCK(xen_pt_lock);<br>
<br>
=C2=A0static int xen_pt_update(unsigned long virt,<br>
@@ -627,10 +604,11 @@ static int xen_pt_update(unsigned long virt,<br>
<br>
=C2=A0 =C2=A0 =C2=A0const mfn_t root =3D maddr_to_mfn(READ_SYSREG64(TTBR0_E=
L2));<br>
<br>
-=C2=A0 =C2=A0 #ifdef CONFIG_ARM_32<br>
-=C2=A0 =C2=A0 if ( xen_pt_range_is_non_common(virt, nr_mfns * PAGE_SIZE) )=
<br>
+=C2=A0 =C2=A0 if ( !xen_pt_range_is_common(virt, nr_mfns * PAGE_SIZE) )<br=
>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ASSERT_UNREACHABLE();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 #endif<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( flags_has_rwx(flags) )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-- <br>
2.54.0<br>
<br>
</blockquote></div>

--0000000000009fab4f065d1bc823--

