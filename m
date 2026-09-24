Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9268BC982FD
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 05:02:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431700.1653521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9bam-00052w-6i; Thu, 24 Sep 2026 05:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431700.1653521; Thu, 24 Sep 2026 05:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9bam-00052o-30; Thu, 24 Sep 2026 05:01:56 +0000
Received: by outflank-mailman (input) for mailman id 1431700;
 Thu, 24 Sep 2026 05:01:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9bak-00052i-Jz
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 05:01:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9baj-00FauK-IZ
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 07:01:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab4aebc-bab6-0a2a0a5309dd-0a2a4507cf68-4
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 07:01:53 +0200
Received: from [74.125.229.204] (helo=mail-lf2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab4aec1-b4ea-0a2a45070019-4a7de5ccfa3e-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 07:01:53 +0200
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f1744fso2159215e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 22:01:53 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790226113; cv=none;
        d=google.com; s=arc-20260327;
        b=PP1TL0RDA6fvEaLRrMdaRnZgzyFjH+i3IFq7cXEu80lf6xNMXv18ekgEaH2/PS6crx
         ZAyKB9FGRusd9TMMsoBGjq4/yS6Dxenp3LW/Kjm91YwtkWOMYYzRO51ndV1YkQHmGzFS
         UArvELn08dr9jNV5cNUsjw3Xfa/fkIX3uGI/UTno+DSo4Xffcb3eipaqbjlcnu5mF4bu
         xmBBFviXWhwAkdAb14hGU4jmmugfnf8dGzrwFTMglp9Lt0fkO0IuoqMR4J2jvw/9E2OU
         LHHLLXj7jMeGNnQvBKLgQy5UbaNsY+PEQoa/x8sRE7rxQcJqwc+9uMuf2MVigqJf2362
         0oOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCx1fqSXipixEFU1U5QO4FLgnVrlefZvTm2nl0uf+AI=;
        fh=N3vCEIYsxwmzEC2200hMfxl7H8AuZBr1H/EWDlY1frk=;
        b=IUhwmNFLguXnjbGsuXrFDLBTVV3oVx6hRp5fpSF5ebUvMXbonkovMicF8If8Hz9jqc
         uT69yTLyOzqHWcvqZZvOh8IoJ7o3qE22Qv6vLhM9Z1uHPnyVa1N8nWWq/NrwN3G9jET7
         ubwt6jyFzx/KALqj7SC2cahmhFHAjNBcE3dJi/vSGxBbmUPxRfRapCHsoTOE+CDGZxVI
         gSGwr4jLd0s8a+T61imJXbSLmAkkjZEShu7yQSMJGZUUwt4I/dgChfLhf5gXlMF28Y4/
         672HeHVuFR0WtIIroBnjdxn4rblPmyTqni4P58MReqsRwjPtkpzpgRg1infTXRbSnOji
         en5A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790226113; x=1790830913; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCx1fqSXipixEFU1U5QO4FLgnVrlefZvTm2nl0uf+AI=;
        b=g0xFIzgin8V0d1oskGmYRKIBtUjsJ6JFal1dZgndGFX8jN8asOGSVKopXcv56ppcLB
         gBAlkjeMmz5s+jhskGFs2GUdxYksctDuzj6hw/GdS5RAzx0YaK04JwZPJ57ldc8LsWGe
         FGosKyCkPrq68La6lHuLSS8VG15MqOx54IlDBXFqHlyjjF0UuP7zLy/J6AjPNm+rNi6f
         tPy7ROWpCR99UW1R1NCGMnSX7jab5zqbmMoVDZNhGFbLZdXGSERDmmbqfT+wqxkyfzdc
         9LqcBYsnQoF3s2cY6bdMtU7822l1sRwdPEQC4n/J5rj10AtM7U/zk3DQlU5Fl5yN3PNV
         jC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790226113; x=1790830913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCx1fqSXipixEFU1U5QO4FLgnVrlefZvTm2nl0uf+AI=;
        b=gz/aMMbY5WkX+stBwZcaQoBTdFge8B4OAiLLmbzBGMtofmmcaFQ2KolECr3/cMMtL/
         D8lZb9KX9GmVUELQqtdltMTBoEYEODaV3jRYBIJxorP4lAZX1RGUxngHSA1tpD3NJz9A
         nBOCwRkKOQ/IThOK9ZQqepcj6NytFUJfkev8irgLIHiSGYghtHY0bnpSY+glQzYXFHM5
         wmte9RUz6TsvrD9MSU4R/L2CWRbewD/ZfRQjVkeOdkQX82xUWLoC3Yq0lzEJ9SxAUWxP
         c92fWqu8Vqj0HDIKed0ANWoNLSoJ9SByO5DRz4syunvP9ho0HRoLq1soVg1xOJXbDoSL
         bELg==
X-Forwarded-Encrypted: i=1; AKwUvByEW421AME8MwGdMCiH506rqPFsmfAUveQ3UhPFPz4rXSVrgCTY6f+5W+RjjIbGCJn5PSz9ZPUkDtE=@lists.xenproject.org
X-Gm-Message-State: AFuF++l+heZucxz/qo4K9hruuB6LZzUDZew2wqQdLQHG5BnU1TZz0/rk
	khFjR+x2mqb6oJ8VdP0tH0JwsmdqxSdPPOdBXRFo8cbiOmkTVGp4cjirZV5oUUroq2/O7YaYlj1
	f7bZgJ+30Yfk+8EyKMD7W8CL2ryUy8HM=
X-Gm-Gg: AYBFou3I9DVqrlhmavOgxcnRoL/LMX/SffwPzLZgD994CSHw7odSIWs/XeUwtqHQhx8
	v1sXg3hT0fv4YC6D3cDAMWHSbhjxXlEix9ItyTElo83k3G6STcMdF9U+0ob0bKGFTQEhYQJra1F
	ZMwNh9kamHhBfT+NHI9d0Hk8K5kfHtHS0LcPfO4TWxZy6ZyxeYpPt9Y2bfcsox097Ijew9XEwS0
	QnCQSxe9OiYMhv8bc4wgj8eQ8XQ4DsRGy1Tr6FBx/pGs9cv2qql+PBvyHZIqWM5+sdNmf5UlJqa
	i6XLM1c8Fk7tKuNQuUCQRvmyiME1Vrb1Vf2sIYEtw/9+T/DAkBHuJQ==
X-Received: by 2002:a05:6512:b22:b0:5b6:183c:5c89 with SMTP id
 2adb3069b0e04-5b8e0a06d51mr196017e87.39.1790226112495; Wed, 23 Sep 2026
 22:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790089161.git.mykola_kvach@epam.com> <a9bccc7d8054244cdbe754fd16b8d2faba01af3f.1790089161.git.mykola_kvach@epam.com>
 <87cxu44y2q.fsf@epam.com>
In-Reply-To: <87cxu44y2q.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 24 Sep 2026 08:00:00 +0300
X-Gm-Features: AclHuK9rbuCbYJOomSdKvxePLduh-uuqttcIkg34Wv5OTrkhfpxaCCczGcPilZ4
Message-ID: <CAGeoDV_jENgPvMTMAGbUOxc80H=z4GtmxRGSdTgXj1ym0Z1Wxw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] xen/arm: its: refactor ITS quirk matching
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Mykola Kvach <Mykola_Kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1790226113-374D3AE4-1447A16D/0/0
X-purgate-type: clean
X-purgate-size: 6741

On Wed, Sep 23, 2026 at 3:21=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi,
>
> Mykola Kvach <mykola_kvach@epam.com> writes:
>
> > ITS quirks are matched only by IIDR and mask fields stored in each tabl=
e
> > entry. That is too coarse when the same GIC IP block appears on several
> > platforms but a workaround is valid only for some of them.
> >
> > Replace the fixed IIDR fields with a generic match(hw_its, data)
> > callback and an opaque data pointer. Add an IIDR matcher as a reusable
> > building block and use it from the R-Car Gen4 matcher after checking th=
e
> > Renesas machine compatibles.
> >
> > This intentionally narrows the R-Car Gen4 quirk. Previously every ITS
> > with IIDR 0x0201743b matched. Now it matches only a DT-discovered ITS o=
n
> > an r8a779f0 or r8a779g0 machine. ACPI-discovered ITSes and the same IID=
R
> > on other platforms no longer match.
> >
> > Keep first-match semantics explicit. Assert that non-sentinel entries
> > provide a matcher and that IIDR matching receives match data. Retain
> > runtime guards so malformed entries cannot cause a NULL function call
> > or data dereference in non-debug builds. Place the matcher data and
> > table in init-only read-only sections.
> >
> > The matched entry still supplies separate ITS and LPI flags; this patch
> > only changes how the entry is selected.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v3:
> > - Document the intentional narrowing of the R-Car Gen4 match.
> > - Add the non-debug NULL-data guard.
> > - Put the matcher data and table in init-only read-only sections.
> >
> > Changes in v2:
> > - Replace v1's optional platform callback plus fixed IIDR/mask fields
> >   with a single generic match(hw_its, data) selector.
> > - Add a reusable IIDR matcher and use it after the R-Car Gen4
> >   machine-compatible checks.
> > - Document that the R-Car Gen4 quirk remains DT-only.
> > - Keep the split ITS and host LPI quirk scopes when applying the matche=
d
> >   entry.
> > - Document first-match ordering in the lookup path and guard against
> >   entries without a match callback or IIDR match data.
> > ---
> >  xen/arch/arm/gic-v3-its.c | 73 +++++++++++++++++++++++++++++++--------
> >  1 file changed, 58 insertions(+), 15 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index 454fd0e0ef..f52232ca40 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -54,8 +54,8 @@ struct its_device {
> >
> >  struct its_quirk {
> >      const char *desc;
> > -    uint32_t iidr;
> > -    uint32_t mask;
> > +    bool (*match)(const struct host_its *hw_its, const void *data);
> > +    const void *data;
> >      uint32_t its_flags;
> >      /*
> >       * lpi_flags are ORed into the global host LPI policy and must onl=
y
> > @@ -65,11 +65,52 @@ struct its_quirk {
> >      uint32_t lpi_flags;
> >  };
> >
> > -static const struct its_quirk its_quirks[] =3D {
> > +struct its_quirk_match_iidr {
> > +    uint32_t iidr;
> > +    uint32_t mask;
> > +};
> > +
> > +static bool __init gicv3_its_match_iidr(const struct host_its *hw_its,
> > +                                        const void *data)
> > +{
> > +    const struct its_quirk_match_iidr *match;
> > +    uint32_t iidr;
> > +
> > +    ASSERT(data);
> > +
> > +    if ( !data )
> > +        return false;
>
> It looks strange to have both ASSERT and then this check.
>
> Maybe it is worth to remove ASSERT and print a warning in a debug build i=
nstead?

The ASSERT catches a programming error in the static quirk table in
debug builds, while the explicit NULL check prevents a dereference
when assertions are disabled.

However, returning false skips a potentially required workaround,
which could cause a less obvious failure later. This also raises the
question of whether continuing is appropriate in non-debug builds.

Would you prefer the debug warning you suggested, keeping ASSERT
with an additional warning in non-debug builds, or using BUG_ON(!data)
to stop immediately in all builds?

>
> > +
> > +    match =3D data;
> > +    iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
> > +
> > +    return (iidr & match->mask) =3D=3D match->iidr;
> > +}
> > +
> > +static bool __init gicv3_its_match_quirk_gen4(const struct host_its *h=
w_its,
> > +                                              const void *data)
> > +{
> > +    if ( !hw_its->dt_node )
> > +        return false;
> > +
> > +    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
> > +         !dt_machine_is_compatible("renesas,r8a779g0") )
> > +        return false;
> > +
> > +    return gicv3_its_match_iidr(hw_its, data);
>
> Do you really need to match IIDR in this case? You already know that
> platform requires the quirk.

I would prefer to retain the IIDR check. The machine compatible does
not identify the exact ITS variant and revision. Keeping both checks
preserves the existing IIDR restriction while narrowing the match to
the affected platforms.

Linux also uses both checks for the R-Car Gen4 DMA32 workaround:
the quirk entry matches IIDR 0x0201743b with mask 0xffffffff, and
its_enable_dma32() additionally checks the machine compatible.

>
> > +}
> > +
> > +static const struct its_quirk_match_iidr rcar_gen4_iidr __initconst =
=3D {
> > +    /* Implementer 0x43b identifies Arm Ltd. */
> > +    .iidr =3D 0x0201743b,
> > +    .mask =3D 0xffffffffU,
> > +};
> > +
> > +static const struct its_quirk its_quirks[] __initconstrel =3D {
> >      {
> > -        .desc        =3D "R-Car Gen4",
> > -        .iidr        =3D 0x0201743b,
> > -        .mask        =3D 0xffffffffU,
> > +        .desc =3D "R-Car Gen4",
> > +        .match =3D gicv3_its_match_quirk_gen4,
> > +        .data =3D &rcar_gen4_iidr,
> >          .its_flags =3D GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_A=
DDR,
> >          .lpi_flags =3D GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_A=
DDR,
> >      },
> > @@ -78,18 +119,21 @@ static const struct its_quirk its_quirks[] =3D {
> >      }
> >  };
> >
> > -static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t ii=
dr)
> > +static const struct its_quirk *__init gicv3_its_find_quirk(
> > +    const struct host_its *hw_its)
> >  {
> > -    const struct its_quirk *quirks =3D its_quirks;
> > +    const struct its_quirk *quirk;
>
> Is this change really required?

Agreed, the rename is unnecessary. A single entry can carry several
quirk flags, so the existing name also makes sense. I'll keep quirks.

Best regards,
Mykola

