Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF3BC98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 16:22:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431053.1653448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PjP-0001IR-7M; Wed, 23 Sep 2026 16:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431053.1653448; Wed, 23 Sep 2026 16:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PjP-0001IK-4J; Wed, 23 Sep 2026 16:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1431053;
 Wed, 23 Sep 2026 16:22:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9PjO-0001I9-0l
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:22:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9PjN-00BtLb-EC
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 18:22:01 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cf12e28600072c4@swg.vates.tech>)
 id 6ab3fc93-2eae-0a2a0a5409dd-0a2a4509af46-48
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:22:01 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cf12e28600072c4@swg.vates.tech>)
 id 6ab3fca9-be1a-0a2a45090019-b9ff1c239c43-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:22:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0cf12e28600072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 16:21:56 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B258481ECA;
 Wed, 23 Sep 2026 18:21:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=To9O2iM9Heyz3znzNq+AlKoXHZA9T84qK9B47cWcyB0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=B4LQ5hy5dec1ztd/C1OC9Gba63pja6Qbjc6OsJ9/btdpp/oXzrNWwxdhj06QcPwhahB7SsASm
 Y0irPSynlHwAP+zvxTqVfLLMJ1LTNh9IGVp0bj9deNBgfzreiAYYGMpP0zFJUrX9YxNeml9RLB8
 fX8E9x/tqJdPfme8WYlgtDqt1iwLMQx/gOZoNxkRCbQM6fvC/IGzGMrkMoOoNiahDgh3BR+AFZG
 t72w042PF9Q8EG/CFpuePy3BxntzgkT/5a/l+zh+EVGU2YrMWNZczZvI8J6gN7Xxz8n7QDhirvH
 Ooxg4w+Fh/TZcCHG81/TRJ0x7iXueOAIOdup1JvVq2WA==
X-Zone-Loop: c607fbfa0904ca11e59337c2d45a70e40e9d735df6db
x-campaign-type: default
x-transaction-id: baf4214c-90e9-44c6-8311-a0819fe608ad
x-swg-uid: 01-e43c8c51-ebda-43db-a7cd-dce7a70d036f
X-Mailer: Sweego
Message-ID:
 <1790180516.8631fc262581453bbf619ec5b2062170.1a0cf12e28600072c4@vates.tech>
x-swg-bid: 1790180516.8631fc262581453bbf619ec5b2062170.1a0cf12e28600072c4
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
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <5798db51-1f8a-4ac2-b2e1-57ca07361479@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <c7000473af04e618a340270398fb85fffb46ca05.1787838835.git.oleksii.kurochko@gmail.com>
 <1790178185.8631fc262581453bbf619ec5b2062170.1a0ceef50f800072c4@vates.tech>
 <5798db51-1f8a-4ac2-b2e1-57ca07361479@gmail.com>
Date: Wed, 23 Sep 2026 18:21:50 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790180510; l=4848;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=yIfxY7xHeNtTNnQ4ZsaWL01gfKbXrRlTdV61o8T4cjA=;
 b=h48AyKDf/4KLGognhM/LZItkfwtt0zIscwpAwU08Uc+p4bAacoS3JqmzVRoEuEP+LcSljDC3Q
 lJjK3p328eUCRl+rbot61iyKrHOuktC+lOMWT5UAeYOySozZZa5Oo37
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790180515945
X-purgate-ID: tlsNG-bad1c0/1790180521-3B8D1034-34A32947/10/73395122804
X-purgate-type: spam
X-purgate-size: 4852

On 2026-09-23 18:08 +0200, Oleksii Kurochko wrote:
> 
> 
> On 9/23/26 5:42 PM, Baptiste Le Duc wrote:
> >> At this point, all interrupt producers have been moved to the new
> >> IMSIC VS-file so we move register state from the old IMSIC VS/SW-file
> >> to the new IMSIC VS-file.
> >>
> >> As new IMSIC VS-file is ready to be used update vCPU's hstatus with
> >> new VGEIN.
> >>
> >> As the whole migration procedure is finished add some extra explanatory
> >> comments.
> >>
> >> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>
> >> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> >> index 3cba58e0c1..d7b137a1f5 100644
> >> --- a/xen/arch/riscv/imsic.c
> >> +++ b/xen/arch/riscv/imsic.c
> >> @@ -112,6 +112,12 @@ do {                            \
> >>       r_;                             \
> >>   })
> >>   
> >> +#define imsic_vs_csr_set(c, v)      \
> >> +do {                                \
> >> +    csr_write(CSR_VSISELECT, (c));  \
> >> +    csr_set(CSR_VSIREG, (v));       \
> >> +} while ( 0 )
> >> +
> >>   #define imsic_vs_csr_write(c, v)    \
> >>   do {                                \
> >>       csr_write(CSR_VSISELECT, (c));  \
> >> @@ -185,6 +191,19 @@ static void imsic_eix_write(unsigned int ireg, unsigned long val)
> >>       }
> >>   }
> >>   
> >> +static void imsic_eix_set(unsigned int ireg, unsigned long val)
> >> +{
> >> +    switch ( ireg )
> >> +    {
> >> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
> >> +                        imsic_vs_csr_set, val)
> >> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
> >> +                        imsic_vs_csr_set, val)
> >> +    default:
> >> +        ASSERT_UNREACHABLE();
> >> +    }
> >> +}
> >> +
> >>   unsigned int vcpu_guest_file_id(const struct vcpu *v)
> >>   {
> >>       return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
> >> @@ -630,13 +649,13 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
> >>       old_vsiselect = csr_read(CSR_VSISELECT);
> >>       old_hstatus = csr_read(CSR_HSTATUS);
> >>       new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
> >> -    new_hstatus |= ((unsigned long)idata->hgei) << HSTATUS_VGEIN_SHIFT;
> >> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
> > 
> > 
> >>       csr_write(CSR_HSTATUS, new_hstatus);
> >>   
> >>       /*
> >> -     * There is no need to use atomic functions version to store
> >> -     * values in MRIF because imsic_vsfile_read_clear() is always called
> >> -     * with pointer to temporary MRIF on stack.
> >> +     * No atomic accessors are needed to store the values into the MRIF here,
> >> +     * as imsic_vsfile_read_clear() is always called with a pointer to a
> >> +     * temporary MRIF on the stack.
> >>        */
> > 
> > 
> >>   
> >>       mrif->eidelivery = imsic_vs_csr_swap(IMSIC_EIDELIVERY, 0);
> >> @@ -972,6 +991,49 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
> >>       return fdt_end_node(fdt);
> >>   }
> >>   
> >> +static void cf_check imsic_vsfile_local_update(void *data)
> >> +{
> >> +    unsigned int i;
> >> +    struct imsic_mrif_eix *eix;
> >> +    const struct imsic_vsfile_data *idata = data;
> >> +    struct imsic_mrif *mrif = idata->mrif;
> >> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
> >> +
> >> +    /* We can only update if we have a HW IMSIC context */
> >> +    if ( !idata->hgei )
> >> +        return;
> >> +
> >> +    /*
> >> +     * No atomic accessors are needed to read the values out of the MRIF here,
> >> +     * as this is always called with a pointer to a temporary MRIF on the
> >> +     * stack.
> >> +     */
> > idata->mrif may point anywhere, so what the comment really states is a
> > requirement on callers. It also only makes full sense next to KVM, where
> > a shared SW-file MRIF is accessed atomically; Xen has neither of those
> > (yet). Either explicitely explain that callers must declare mrif on
> > their stack or move the comment directly in call sites.
> 
> It is mentioned in the comment "is always called with a pointer to a 
> temporary MRIF on the stack.".
Oh okay, I think I misunderstood the comment at the first place then. I
thought you wanted to say the pointer itself is on the stack, not MRIF.
Now it's more clear.

> 
> With SW-file MRIF I expect that atomic operations should be used so this 
> functions shouldn't just use for them and I assume KVM has something 
> different function to work with SW-file MRIF. Anyway just mentioning KVM 
> code isn't always useful as it forces me to go and investigate what is 
> going on there what I am not fully convinced that it is okay...
Yes sorry, no needs for more investigations here.
> 
> ~ Oleksii
> 
> 
> 
> 



