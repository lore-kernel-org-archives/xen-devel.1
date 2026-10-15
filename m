Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FC7CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:28:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450019.1665512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGpI-0001H9-NJ; Thu, 15 Oct 2026 08:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450019.1665512; Thu, 15 Oct 2026 08:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGpI-0001H2-KG; Thu, 15 Oct 2026 08:28:36 +0000
Received: by outflank-mailman (input) for mailman id 1450019;
 Thu, 15 Oct 2026 08:28:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@swg.vates.tech>)
 id 1xHGpG-0001Gw-Ko
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:28:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHGpF-0047vJ-UJ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:28:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@swg.vates.tech>)
 id 6ad08eae-8faa-0a2a0a5109dd-0a2a45089ab2-0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:28:30 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@swg.vates.tech>)
 id 6ad08ead-f659-0a2a45080019-b9ff1c23b053-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:28:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13ead4e580008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 08:28:27 +0000
Received: from [172.20.10.2] (132.169.185.81.rev.sfr.net [81.185.169.132])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D86BE81CA2;
 Thu, 15 Oct 2026 10:28:25 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=wnC1BNdB+PBOfJVOe3gI8WO5+075QEnPdeVVym4FUPo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=PxFiRtz17Q8/M9ZgVok+92eXq07Uz+SURCWc+EYcYTAGa9uNYOG+4DDqwcXb0leiVO81sC0A7
 DYw1dp33q711pqB7KU26464KvE8OBh5nm/dP0SZjagn+MHZolSFJ9nanhJERl7Mc+XiHFx6ehMR
 NUXKenpBucfIE1m4k/bSn3t+VZkmfLE3NKCPL/kyOOEJ1Cpm+t6ZBSoMUYm3epR0zoa3jNC631n
 BZrlYQ9NxcRrMMA/4ISTmp1g88RroWwOHO5GdKAe9j42gTjL+MoqFBJiaMLe7uVnkG+4igFCRkA
 ByTxnLZ70LuExEJMCKA95J6Y4TkpOA84ke68Eu22fXvw==
X-Zone-Loop: e22ba0327d5eb14372081d6c1e7b674f4b8ed9901273
x-campaign-type: default
x-transaction-id: 00c7fc3f-ec97-41b4-8b43-94cff182763e
x-swg-uid: 01-425d9119-2cb4-4e63-bbe2-e1997ab951a8
X-Mailer: Sweego
Message-ID:
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
x-swg-bid: 1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425
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
In-Reply-To: <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
Date: Thu, 15 Oct 2026 10:28:19 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792052899; l=2942;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=oVjKUF7fTEDd970/bPaoVV1BOOz55PBrutMhHgJQljY=;
 b=Mo1LmrUPSM71/CokwzZNj0ELcK17aQSXEQBbNqc54gZt09nuftq/I2M3aysZEgzj3LYAbiuy3
 4kGfyxoprHfAV7T0Y0+s+79UlLUjqE3d0Rw/NbVU0sVGOEBTk01Fpez
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792052906826
X-purgate-ID: tlsNG-c1860d/1792052910-D574B87B-D169B7DD/0/0
X-purgate-type: clean
X-purgate-size: 2942

On 2026-10-15 09:14 +0200, Jan Beulich wrote:
> On 14.10.2026 18:45, Baptiste Le Duc wrote:
> > On 2026-10-14 11:09:58+02:00, Jan Beulich wrote:
> >> On 14.10.2026 11:00, Baptiste Le Duc wrote:
> >>
> >> In which case it would need to be
> >>
> >>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) ||
> >>          !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
> >>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>
> >> albeit I have to admit that permitting two contradicting extensions to
> >> be exposed at the same time is irritating.
> >>
> >>> I see two ways to address this:
> >>>
> >>> 1) Keep checking Svade:
> >>>
> >>>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> >>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>>
> >>>     After resolve_ad_scheme(), the Svade bit is set in every case where
> >>>     software has to preset the A/D bits. The only imprecise case is both
> >>>     extensions advertised with hardware updating already enabled by
> >>>     firmware, where presetting A/D is unnecessary but harmless.
> >>>
> >>> 2) Record the probe result in a global, e.g.
> >>>
> >>>     static bool __ro_after_init hw_ad_update;
> >>>
> >>>     and use:
> >>>
> >>>     if ( !hw_ad_update )
> >>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>>
> >>>     This is exact in all cases, at the cost of a new global that mostly
> >>>     duplicates what resolve_ad_scheme() already records in the ISA bitmap.
> >>>
> >>> I discussed with Oleksii and we are fine with either. What do you prefer?
> >>
> >> As to 1), see above. For 2), while maybe okay, I think we're better off
> > Sorry, I don't fully follow the issue with 1). Compared to what you proposed,
> > it only differs when neither Svade nor Svadu is recorded, which cannot
> > happen as resolve_ad_scheme() runs before and always records one of the
> > two.
> 
> Yet previously we said that recording extensions (as such, i.e. later also
> possibly exposing them to guests) when they weren't really advertised may
> not be the right thing to do. I.e. imo the probing may be used to drive
But we also said that platforms (such as the P550) may implement an
extension without advertising it, as a RISC-V spec maintainer
confirmed in [1].

[1] https://github.com/riscv/riscv-isa-manual/issues/3450#issuecomment-6076851535
> Xen's internal behavior, but I'm unconvinced that it should also lead to
> marking extensions as available.

Therefore, as far as I understood, you're not convinced of this:

    /* Neither advertised: trust the probe. */
    __set_bit(has_hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
              riscv_isa);

If so, then, the only solution I have in mind in what I proposed in 2)
with the global variable that store the result of the real probe.
Am I correct?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

