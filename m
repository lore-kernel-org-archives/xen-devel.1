Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158A1CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 09:00:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448584.1664607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGuqP-0007nT-N7; Wed, 14 Oct 2026 09:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448584.1664607; Wed, 14 Oct 2026 09:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGuqP-0007nM-Js; Wed, 14 Oct 2026 09:00:17 +0000
Received: by outflank-mailman (input) for mailman id 1448584;
 Wed, 14 Oct 2026 09:00:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@swg.vates.tech>)
 id 1xGuqO-0007mB-MP
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:00:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGuqN-00CWVx-Ru
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:00:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@swg.vates.tech>)
 id 6acf449a-8faa-0a2a0a5109dd-0a2a45049174-36
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:00:15 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@swg.vates.tech>)
 id 6acf449e-b57f-0a2a45040019-b9ff1c239e79-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:00:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a139a403a30008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 09:00:12 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D40F482BF2;
 Wed, 14 Oct 2026 11:00:11 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=XXowHLoZh4TfTGECTeluWWTaMFsjynTrx6h3dkdiLSI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=W0B4iLv4m+IFzB6/J4IzLuPeD/6n/Nhx+WB0TAVceZEdZWO+RTug55geyXMucQEIN1/wM181l
 ++ef1MlP3vjTejWxUuaFgmhp8v4h7+w5NqffyS3CFon626HJZg511CvgmFzvWOzkXBs7cwsYnJo
 V361vpogZg/HaJDvWdNpdgwIWA/CdIkxrwoLVAEoYEXPImBIVfJ77G/ai4dSaXdFjd/h9bbGSrI
 VaCzeuEp6GJ9PN2VhYLol4M0uAMmwxmSXGa4CYURDNaOGycTq5V25L+udrCk4cHVoGIceX2KPgQ
 gb/ULlzjlRNpip1YwLmNvJLmhUST4BvRpZNVV91orK1g==
X-Zone-Loop: 752f73b49701283243a206b11d07df9070e8665d5622
x-campaign-type: default
x-transaction-id: b888fb5e-d719-44df-a45d-5074a3d36995
x-swg-uid: 01-2029318e-aa59-4a5f-af2f-387bc64cc13e
X-Mailer: Sweego
Message-ID:
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
x-swg-bid: 1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme
 at boot
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
In-Reply-To: <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
Date: Wed, 14 Oct 2026 11:00:06 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791968406; l=2393;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=4ItqVLdhaWZFGWFnlugwFQ9YmsESGshmfNl3KSyou5E=;
 b=XUEcQVAkHwowNKl9YiJbxD7d+Bv5WrYWi9xMdgA8w+BIkG6UKYCBPPfn6opONE03yC/55fbwW
 GcUQYGTINWCClAyFRVMhOAM8Mf/H5bOxIwGxB74xYeDuErWGxeR2Qu4
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791968412075
X-purgate-ID: tlsNG-ebf023/1791968415-C30CDB50-2DFB3E49/0/0
X-purgate-type: clean
X-purgate-size: 2393

> >>> +        "2:\n"
> >>> +        ASM_EXTABLE(1b, 2b)
> >>> +        : [tmp] "=&r" (tmp), [updated] "+r" (updated)
> >>> +        : [va] "r" (va)
> >>> +        : "memory" );
> >>> +
> >>> +    arch_pmap_unmap(slot);
> >>> +    free_domheap_page(pg);
> >>> +
> >>> +    return updated;
> >>> +}
> >>
> >> Imo you'd better check that A also was actually set in the PTE.
> > 
> > If I check that A was set, can I drop the "updated" variable? The A bit
> > would tell us more than whether the load succeeded.
> 
> Hmm, I'm inclined to suggest to check both.
Then I'd rather probe D than A, since D, unlike A, cannot be set
speculatively (spec: "updates to the D bit, resulting from an explicit store,
must be exact (i.e., non-speculative)"). The result would
then be:

      return updated && d_set;

with a warning (or panic()?) on updated && !d_set, which the spec
doesn't allow (spec: "the access must not be performed before the PTE update is
globally visible").

Furthermore, if I understood your earlier suggestion correctly, you'd
like the A/D bits to be preset in p2m_set_pte_flags() unless Svadu is
in use:

    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
        e->pte |= PTE_ACCESSED | PTE_DIRTY;

However, when both Svade and Svadu are advertised, Svade is in effect
until Svadu is enabled via FWFT (perfectly legit), so this condition
would skip the preset and the first access would fault.

I see two ways to address this:

1) Keep checking Svade:

    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
        e->pte |= PTE_ACCESSED | PTE_DIRTY;

    After resolve_ad_scheme(), the Svade bit is set in every case where
    software has to preset the A/D bits. The only imprecise case is both
    extensions advertised with hardware updating already enabled by
    firmware, where presetting A/D is unnecessary but harmless.

2) Record the probe result in a global, e.g.

    static bool __ro_after_init hw_ad_update;

    and use:

    if ( !hw_ad_update )
        e->pte |= PTE_ACCESSED | PTE_DIRTY;

    This is exact in all cases, at the cost of a new global that mostly
    duplicates what resolve_ad_scheme() already records in the ISA bitmap.

I discussed with Oleksii and we are fine with either. What do you prefer?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

