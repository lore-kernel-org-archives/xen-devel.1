Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEDF606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=FdsCSts1
Received: from list by lists.xenproject.org with outflank-mailman.1461563.1672603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMt5-0007Jb-RS; Mon, 26 Oct 2026 15:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461563.1672603; Mon, 26 Oct 2026 15:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMt5-0007JU-Oi; Mon, 26 Oct 2026 15:45:27 +0000
Received: by outflank-mailman (input) for mailman id 1461563;
 Mon, 26 Oct 2026 15:45:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178e3435d000f79f@swg.vates.tech>)
 id 1xLMt4-0007JO-QR
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:45:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMt4-001FRc-6h
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:45:26 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178e3435d000f79f@swg.vates.tech>)
 id 6adf758b-bab6-0a2a0a5309dd-0a2a45019bd4-14
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:45:26 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178e3435d000f79f@swg.vates.tech>)
 id 6adf7595-5984-0a2a45010019-b9ff1c238c8b-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:45:26 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a178e3435d000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 15:45:22 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8B48282DF1;
 Mon, 26 Oct 2026 16:45:21 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=3iTpoL8EcMZ4L6Ryf3agD04fX5xoZ/qbbHE9UjQiYj0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=FdsCSts1p6trT95a7xdNiC7vcQtVRkneTGMRNThLQSmhR2bTzn7rCQzIIZOyUslwm2I2gUlZi
 JZ12lveeFRMCipRt139hEH9TQ2yWjszXX63QBezdM1EszvLuwD9o6GzihpNAf/k5Y78Yw7enN0g
 OWoYLPnP97qn9VqD5qiTg8kZtPQj7uNeSUOl/ewprx6ah1tJPZJqFzKFMO0pTqSa7CxCMaN5/Dl
 v24jp7uGwopf6uiepZQ8WGsWS3diPUIZ0+4GEREjh/Wd1d5Joqw+l9hvTyUqqemoe1oodMjBM6D
 gZYekzajlW39HukHpn/c6lM/C8KK68FY+rfb1Q3NBeeA==
X-Zone-Loop: 2b38d39917260e345895130d6d7d5b60655f269e6d48
x-campaign-type: default
x-transaction-id: f0212e72-3b36-4ee9-bf9b-50bd82370a21
x-swg-uid: 01-89386fc9-5936-45e4-b249-1ceef817d0d8
X-Mailer: Sweego
Message-ID:
 <1793029522.8631fc262581453bbf619ec5b2062170.1a178e3435d000f79f@vates.tech>
x-swg-bid: 1793029522.8631fc262581453bbf619ec5b2062170.1a178e3435d000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 4/5] xen/riscv: probe the A/D update scheme if the
 DT advertises neither
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
In-Reply-To: <9986e03e-bf09-46b6-9d2a-82a1864a59b5@gmail.com>
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
 <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@vates.tech>
 <9986e03e-bf09-46b6-9d2a-82a1864a59b5@gmail.com>
Date: Mon, 26 Oct 2026 16:45:16 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793029516; l=1759;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=JZk+aPlATWEyKnEQluI9lZT6R5vUUhJ41ClUJtJF5cc=;
 b=V3PfGUG9r7rUnsCizTJOdZDry9AfUoVnyWm5YQ1xJfxjxsEn1pZppatxzAC8Yfm5UlnlsovdW
 1JV6PVMPurMCVXBp+i5Y7aB+ymaPGGmIjX0QjDft65A7orE/OAEUWY+
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793029521759
X-purgate-ID: tlsNG-d62444/1793029526-C5146757-CB8363EF/0/0
X-purgate-type: clean
X-purgate-size: 1759
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-26 16:35:44+01:00, Oleksii Kurochko wrote:
> On 10/26/26 4:14 PM, Baptiste Le Duc wrote:
> 
> > +/*
> > + * Probe whether hardware updates the PTE A/D bits by writing to a local
> > + * variable through an alias mapping whose A and D bits are clear.
> > + *
> > + * Check the D bit rather than the A bit, as the A bit may be set
> > + * speculatively while the D bit can't.
> > + *
> > + * Under Svade, the store raises a page fault instead, so use the extable to
> > + * handle it.
> > + */
> > +static bool __init probe_hw_ad_update(void)
> > +{
> > +    unsigned int probe_target;
> > +    vaddr_t va = FIXMAP_ADDR(FIX_MISC) + PAGE_OFFSET(&probe_target);
> > +    pte_t *entry = &xen_fixmap[FIX_MISC];
> > +    bool d_set = false;
> > +
> > +    ASSERT(!pte_is_valid(*entry));
> > +
> > +    /*
> > +     * Any page in use will do, so alias the stack page this code runs on,
> > +     * with A and D clear. Store to a variable of its own, so that nothing
> > +     * the compiler relies on gets overwritten.
> > +     */
> > +    write_pte(entry, pte_from_mfn(maddr_to_mfn(virt_to_maddr(&probe_target)),
> > +                                  PTE_VALID | PTE_READABLE | PTE_WRITABLE));
> > +    flush_tlb_one_local(va);
> > +
> > +    asm_inline goto (
> 
> I think that generally this code should be wrapped by "#ifdef 
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT" but we can keep it as is here as we don't 
> use output operands.
>
Yes I didn't see any sense to use it as, from my understanding, its
aimed to be use when we want to have label as output operand which is
not our case here.
> [ ... 81 lines skipped ... ]
> Generally, looks good to me:
Thanks!

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

