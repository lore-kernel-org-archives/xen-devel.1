Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AB8C3DA7A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 16:45:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449357.1665221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH26R-0001ZX-EF; Wed, 14 Oct 2026 16:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449357.1665221; Wed, 14 Oct 2026 16:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH26R-0001ZP-9d; Wed, 14 Oct 2026 16:45:19 +0000
Received: by outflank-mailman (input) for mailman id 1449357;
 Wed, 14 Oct 2026 16:45:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@swg.vates.tech>)
 id 1xH26P-0001Z5-Gt
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:45:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH26O-006AMC-QO
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 18:45:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@swg.vates.tech>)
 id 6acfb17c-8faa-0a2a0a5109dd-0a2a450897fa-40
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:45:16 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@swg.vates.tech>)
 id 6acfb19c-f659-0a2a45080019-b9ff1c22905d-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:45:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13b4dc2b50008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 16:45:14 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5761782A6A;
 Wed, 14 Oct 2026 18:45:13 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=eJ2IsZxNtYLq4D15UVisMaarAvx5i1eeBT44+IuIkLY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=mR4OnDzTWpGMkUwTOOOla+8PQADmEIKeRid7by/FY9wKP/7TTXLOI7YkISBTTwwrUof/1/JhD
 Ol92U75se7xV7DQ2OBwkgcWpz6OOcxXtAFrM1XbXqrxJX5JUijYUmE4KxfLiMcG4+vq2vu4lH4b
 jGf+VFncSqCFdEhH1YDuIRz1HtrlxjoB+wJjtXnJDtpOGC9tUBkZWR40BmapgiSepQFRy4RCJ4Z
 I3ZIKPRuBMGWDk8CzdUVBI//4e3OO5Om2JqmjmivaG5hiZk1hHXB+P5lz2ZS2AB0KZODy8wzVaT
 iVusL4VBVFxwVILZtvlS636LBHToanqGxx3uWwvLnPvg==
X-Zone-Loop: fb5f1280fceee81298920fe136c0f589117817b8d174
x-campaign-type: default
x-transaction-id: 6aa0b9e4-f386-490a-a017-c06356cef225
x-swg-uid: 01-0e827c5e-9033-456f-b1ea-1475779ac107
X-Mailer: Sweego
Message-ID:
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
x-swg-bid: 1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425
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
In-Reply-To: <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
Date: Wed, 14 Oct 2026 18:45:07 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791996308; l=1796;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=iCrnAvwrcPaAIA79U7FkKQjIY/ERt8PKItSdv5VSwQY=;
 b=uA8EA/lw96x5EC+Aju+TNdUE8Alxvq0OLuU2apHO2cWQopavBrhuYA5jrSxHqFtpuSjGCRjDG
 mtHlyxl48WkCBcwGLn4FukqR9dly7yPzXpOZrzH2LLj97TsiF9X0npd
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791996313556
X-purgate-ID: tlsNG-c1860d/1791996316-CEF5F87B-8310C79A/0/0
X-purgate-type: clean
X-purgate-size: 1796

On 2026-10-14 11:09:58+02:00, Jan Beulich wrote:
> On 14.10.2026 11:00, Baptiste Le Duc wrote:
> 
> In which case it would need to be
> 
>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) ||
>          !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> 
> albeit I have to admit that permitting two contradicting extensions to
> be exposed at the same time is irritating.
> 
> > I see two ways to address this:
> > 
> > 1) Keep checking Svade:
> > 
> >     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> >         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> > 
> >     After resolve_ad_scheme(), the Svade bit is set in every case where
> >     software has to preset the A/D bits. The only imprecise case is both
> >     extensions advertised with hardware updating already enabled by
> >     firmware, where presetting A/D is unnecessary but harmless.
> > 
> > 2) Record the probe result in a global, e.g.
> > 
> >     static bool __ro_after_init hw_ad_update;
> > 
> >     and use:
> > 
> >     if ( !hw_ad_update )
> >         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> > 
> >     This is exact in all cases, at the cost of a new global that mostly
> >     duplicates what resolve_ad_scheme() already records in the ISA bitmap.
> > 
> > I discussed with Oleksii and we are fine with either. What do you prefer?
> 
> As to 1), see above. For 2), while maybe okay, I think we're better off
Sorry, I don't fully follow the issue with 1). Compared to what you proposed,
it only differs when neither Svade nor Svadu is recorded, which cannot
happen as resolve_ad_scheme() runs before and always records one of the
two.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

