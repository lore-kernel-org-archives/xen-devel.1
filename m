Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A239EC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:43:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430947.1653360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P7n-0005PZ-Gk; Wed, 23 Sep 2026 15:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430947.1653360; Wed, 23 Sep 2026 15:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P7n-0005PS-D3; Wed, 23 Sep 2026 15:43:11 +0000
Received: by outflank-mailman (input) for mailman id 1430947;
 Wed, 23 Sep 2026 15:43:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9P7m-0005PM-Cs
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:43:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9P7l-002KbI-Px
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:43:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ceef50f800072c4@swg.vates.tech>)
 id 6ab3f38a-bab6-0a2a0a5309dd-0a2a4503ac02-16
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:43:09 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ceef50f800072c4@swg.vates.tech>)
 id 6ab3f38d-fae8-0a2a45030019-b9ff1c23b3c3-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:43:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ceef50f800072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 15:43:05 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 96D3F80B5E;
 Wed, 23 Sep 2026 17:43:04 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=NJ1Ayj43GSeaYDEZryv5OI9GcmzJI4BFh1MJ+3u6/tI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=nkvXLNnQ9JhKQYNKecS48hb/Y7egWLGE1l8rgEU7NsS+AUBDKcICIx0u3yxYP2+5/bTAkpVIw
 1HvTV2H3pld5A+hFIXJo46FJctlWIHKnrQMOYe72pz/QnLDkbxiG/hZvINYB2h+6GkgaO7pBsFq
 AzgFTYuRmuM/FLenZWVG6/fz/36vYSxd/3FQk11VPimapY+BLltHXqMBiMpor9ScKWrUEzhAF22
 CwK2+FxGpOF3959g00gara5XZFs7srmblD5Ycbb5Gm4NcIp1m969gceuSuRfI7W/WFXnQ+8syXt
 11Nxgd7/aI8dxKL/oSqR2OJ0PN3FUZD8JyCyhcENAv9Q==
X-Zone-Loop: 778e586d7f063c241a30b0af42b1bd94fe2ea116dee4
x-campaign-type: default
x-transaction-id: b02bd0b7-68a8-47da-ad3c-759b09dfb7fc
x-swg-uid: 01-71e76db3-6b38-42c9-9fe7-72d52ba7331a
X-Mailer: Sweego
Message-ID:
 <1790178185.8631fc262581453bbf619ec5b2062170.1a0ceef50f800072c4@vates.tech>
x-swg-bid: 1790178185.8631fc262581453bbf619ec5b2062170.1a0ceef50f800072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 34/39] xen/riscv: restore register state in the new
 IMSIC VS-file
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <c7000473af04e618a340270398fb85fffb46ca05.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <c7000473af04e618a340270398fb85fffb46ca05.1787838835.git.oleksii.kurochko@gmail.com>
Date: Wed, 23 Sep 2026 17:42:57 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790178179; l=3736;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=BzEfIFlrYQztHMGGHfEsDcs/jwvhxnFVfJJ5vToB52o=;
 b=m8+Mb1EfT83cdswF9PF2zoCMAGLeo+La8Nz9dDNRv9xu5eI7dabgWLBHLgPHMvr4+P0jCNzoF
 MaMvQ7F1RexAPthK4mM4mh7cWa++oZXZFNGQ2AnKU8rtfk/tq12s5ZS
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790178184823
X-purgate-ID: tlsNG-33051d/1790178189-74A894E9-24E0A020/10/73395122804
X-purgate-type: spam
X-purgate-size: 3736

> At this point, all interrupt producers have been moved to the new
> IMSIC VS-file so we move register state from the old IMSIC VS/SW-file
> to the new IMSIC VS-file.
> 
> As new IMSIC VS-file is ready to be used update vCPU's hstatus with
> new VGEIN.
> 
> As the whole migration procedure is finished add some extra explanatory
> comments.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index 3cba58e0c1..d7b137a1f5 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -112,6 +112,12 @@ do {                            \
>      r_;                             \
>  })
>  
> +#define imsic_vs_csr_set(c, v)      \
> +do {                                \
> +    csr_write(CSR_VSISELECT, (c));  \
> +    csr_set(CSR_VSIREG, (v));       \
> +} while ( 0 )
> +
>  #define imsic_vs_csr_write(c, v)    \
>  do {                                \
>      csr_write(CSR_VSISELECT, (c));  \
> @@ -185,6 +191,19 @@ static void imsic_eix_write(unsigned int ireg, unsigned long val)
>      }
>  }
>  
> +static void imsic_eix_set(unsigned int ireg, unsigned long val)
> +{
> +    switch ( ireg )
> +    {
> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
> +                        imsic_vs_csr_set, val)
> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
> +                        imsic_vs_csr_set, val)
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +}
> +
>  unsigned int vcpu_guest_file_id(const struct vcpu *v)
>  {
>      return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
> @@ -630,13 +649,13 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
>      old_vsiselect = csr_read(CSR_VSISELECT);
>      old_hstatus = csr_read(CSR_HSTATUS);
>      new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
> -    new_hstatus |= ((unsigned long)idata->hgei) << HSTATUS_VGEIN_SHIFT;
> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);


>      csr_write(CSR_HSTATUS, new_hstatus);
>  
>      /*
> -     * There is no need to use atomic functions version to store
> -     * values in MRIF because imsic_vsfile_read_clear() is always called
> -     * with pointer to temporary MRIF on stack.
> +     * No atomic accessors are needed to store the values into the MRIF here,
> +     * as imsic_vsfile_read_clear() is always called with a pointer to a
> +     * temporary MRIF on the stack.
>       */


>  
>      mrif->eidelivery = imsic_vs_csr_swap(IMSIC_EIDELIVERY, 0);
> @@ -972,6 +991,49 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>      return fdt_end_node(fdt);
>  }
>  
> +static void cf_check imsic_vsfile_local_update(void *data)
> +{
> +    unsigned int i;
> +    struct imsic_mrif_eix *eix;
> +    const struct imsic_vsfile_data *idata = data;
> +    struct imsic_mrif *mrif = idata->mrif;
> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
> +
> +    /* We can only update if we have a HW IMSIC context */
> +    if ( !idata->hgei )
> +        return;
> +
> +    /*
> +     * No atomic accessors are needed to read the values out of the MRIF here,
> +     * as this is always called with a pointer to a temporary MRIF on the
> +     * stack.
> +     */
idata->mrif may point anywhere, so what the comment really states is a
requirement on callers. It also only makes full sense next to KVM, where
a shared SW-file MRIF is accessed atomically; Xen has neither of those
(yet). Either explicitely explain that callers must declare mrif on
their stack or move the comment directly in call sites.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

