Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148EDC5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:25:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389604.1630255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRgH-0003F1-3t; Thu, 13 Aug 2026 09:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389604.1630255; Thu, 13 Aug 2026 09:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRgH-0003Eu-0M; Thu, 13 Aug 2026 09:24:57 +0000
Received: by outflank-mailman (input) for mailman id 1389604;
 Thu, 13 Aug 2026 09:24:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuRgG-0003Eo-6X
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:24:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuRgF-008t9D-JX
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:24:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa7047d4000c4f3@swg.vates.tech>)
 id 6a7d8d62-8faa-0a2a0a5109dd-0a2a45089db0-14
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:24:55 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa7047d4000c4f3@swg.vates.tech>)
 id 6a7d8d67-f659-0a2a45080019-b9ff1c23a7c3-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:24:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ffa7047d4000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Aug 2026 09:24:50 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 82038820C4;
 Thu, 13 Aug 2026 11:24:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=qb0xSwzsCVyssFu1XzN4sx3kGU/TAgxBEQvr3YS1vxk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=mkMDaOe3/GpHPXgjxZdJ/VBEsfptyU/xWq3jysmz1t48GjXb/5C0mKmyqda8J/3yqj9Aa3kNS
 e2iYbYMheKmm/i1GLFnSJmxSpWMoIDjw/Zy8pUfHk4xy4s7W0oOOZven30aSqbrE5j/+9bDRcDh
 WRcpsH/N/5YTISRcgCk176hypc2JcgTadgdeWk2iXJojwlt5aVjDpwsM9+rKRtWITQvxxXlgo8o
 eqTr+SPqKLeEWNMjrw7T/AenWxGWjl3tTCvVIpC/41ojiX9/E9eHoaUlBKnUZPnY6EG1FlgZjXN
 02Nh4uFZ2EOJTHfUs7FcwjjEwmvoIhfUf7GrnZAmGJeA==
X-Zone-Loop: 22d62b376a1622a04d04648e5511686d44d1911a9985
x-campaign-type: default
x-transaction-id: 87e009f2-676b-43b5-be56-f2f9ac5d7ef7
x-swg-uid: 01-a8324a37-b3ae-498b-9797-df6497246a0e
X-Mailer: Sweego
Message-ID:
 <1786613090.8631fc262581453bbf619ec5b2062170.19ffa7047d4000c4f3@vates.tech>
x-swg-bid: 1786613090.8631fc262581453bbf619ec5b2062170.19ffa7047d4000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 07/17] xen/riscv: introduce vCPU AIA initialization
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <b3aca8278dfd70bf6ce888bfcb0a3fbc32bb4971.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b3aca8278dfd70bf6ce888bfcb0a3fbc32bb4971.1784560663.git.oleksii.kurochko@gmail.com>
Date: Thu, 13 Aug 2026 11:24:43 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786613089; l=2700;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=ODzn7JwdxQAl0iItLtBLmdVGm38Bg1JjHeQObX6i2pk=;
 b=aC1FrFTxPzQn0vf7KVlfEAN0jWA+pwJ/nDRItUpuDuFausReGFrGS4SptF19+S88RiIvEcD0L
 KAyfR6EDUapCz1/fUCat7zf6mj2gMAnWteDoOuEi5WEBTKWWDM4d3hW
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786613089840
X-purgate-ID: tlsNG-c1860d/1786613095-D634587B-27D0D98D/10/73395122804
X-purgate-type: spam
X-purgate-size: 2700

> Introduce vcpu_aia_init() to initialize the AIA-related state needed
> for a vCPU to have a working guest interrupt file.
> 
> A guest (VS) interrupt file must be mapped to one of a pCPU's
> hardware interrupt files (if they exist), so the pCPU a vCPU will actually
> run on needs to be known first. arch_vcpu_create() is therefore not a
> suitable place to call vcpu_aia_init(), since the pCPU assigned to a
> vCPU can still change before it is first scheduled. To avoid
> reassigning the VS interrupt file id and remapping it to a different
> pCPU's hardware interrupt file, vcpu_aia_init() will instead be
> called from a later point in the scheduling path (e.g.
> continue_to_new_vcpu()), to be introduced in a follow-up patch. Since
> it will end up being called from a non-__init context, it is not
> itself marked __init.


> 
> Introduce imsic_update_state() to update a vCPU's guest IMSIC state
> (the guest interrupt file id and the pCPU whose hardware interrupt
> file it is mapped to) as a single consistent unit. This state can be
> read concurrently, e.g. by a future helper that checks whether a
> vCPU has a pending IMSIC interrupt, though no such consumer exists
> yet at this stage - so it is protected by a lock.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
> index 4f7f46f58f..ed19600d46 100644
> --- a/xen/arch/riscv/aia.c
> +++ b/xen/arch/riscv/aia.c
> @@ -14,6 +14,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/current.h>
> +#include <asm/imsic.h>
>  
>  struct vgein_ctrl {
>      unsigned long bmp;
> @@ -36,6 +37,35 @@ bool aia_usable(void)
>      return _aia_usable;
>  }
>  
> +void vcpu_aia_init(struct vcpu *v)
> +{
> +    unsigned int new_vsfile_id;
> +    int rc;
> +
> +    if ( !aia_usable() )
> +        return;
> +
> +    new_vsfile_id = vgein_assign(v);
> +
> +    /*
> +     * vgein_assign() returns 0 when no free h/w guest interrupt file is
> +     * available (including GEILEN == 0); imsic_map_guest_file() maps nothing
> +     * in that case.
> +     */
> +    rc = imsic_map_guest_file(v, new_vsfile_id);
> +    if ( rc )
> +    {
> +        /* Can't continue w/o correctly mapped IMSIC interrupt file */
> +        domain_crash(v->domain);

The vgein id assigned a few lines up is not released here. The domain is dying
anyway, but the guest interrupt file stays marked in use on that pCPU forever,
since nothing else ever calls vgein_release(). A vgein_release(v,
new_vsfile_id) before the domain_crash() would fix it.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

