Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42767CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:59:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450068.1665579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHJB-0004Ff-Gw; Thu, 15 Oct 2026 08:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450068.1665579; Thu, 15 Oct 2026 08:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHJB-0004FY-E2; Thu, 15 Oct 2026 08:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1450068;
 Thu, 15 Oct 2026 08:59:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ec98bdf0008425@swg.vates.tech>)
 id 1xHHJA-0004FO-3i
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:59:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHJ9-00EFkk-Gt
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:59:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ec98bdf0008425@swg.vates.tech>)
 id 6ad095e8-8faa-0a2a0a5109dd-0a2a450ada92-0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:59:20 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ec98bdf0008425@swg.vates.tech>)
 id 6ad095e7-f2d2-0a2a450a0019-b9ff1c23b167-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:59:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13ec98bdf0008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 08:59:18 +0000
Received: from [172.20.10.2] (132.169.185.81.rev.sfr.net [81.185.169.132])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1A3AC81CB1;
 Thu, 15 Oct 2026 10:59:17 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=VARcOfLTeWlbOvfvhdqzsqom5lHcL9d/9E9y3iaJnfs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=RZlb0KnnDAadKhA8b15agaKx0XDNi4ZBk1JBthOIHQNeZEhOb7m2dMsKWb5g7tcPeNGUJPXv3
 TBJdlbkVrTsoxU747l3tYsdBAaW1xVhGzEJIpyCGDC5hkyi72ZdpGSYz3JiGCzxgt53JqST0Rs8
 F5X5srIYL9+0/O+JZMFqevZmTpmTAIF/a/zHqOn1uE7iqmV/h82Jt683H/Erhsb7mxJCbzdb4rH
 1hGCzf131q2h0buvex50UGmqBgBmiiiVK7mGsr0O8JSITp7iyrr01dI8TnHc6nMuGTliY3J4FBx
 UU3Uyz9Nqz7RV9AFdcVLSNt48ifvrUtnoz0wuGD9Hcmg==
X-Zone-Loop: 7f174ba33ab612c8c251a64cc837d4125383484e2c8a
x-campaign-type: default
x-transaction-id: 638795d6-5a0d-4551-9f9f-f882b3b0ff33
x-swg-uid: 01-06d03f37-6c20-496d-addf-0ef76008c835
X-Mailer: Sweego
Message-ID:
 <1792054758.8631fc262581453bbf619ec5b2062170.1a13ec98bdf0008425@vates.tech>
x-swg-bid: 1792054758.8631fc262581453bbf619ec5b2062170.1a13ec98bdf0008425
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
In-Reply-To: <e1d27ef8-ecc8-4010-b570-2d2c2af89368@suse.com>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
 <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
 <e1d27ef8-ecc8-4010-b570-2d2c2af89368@suse.com>
Date: Thu, 15 Oct 2026 10:59:11 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792054751; l=3155;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=YBZ+vLY6zIYYlF92kEMpiFNfDkGThWtH8Lj8Dtr5o4I=;
 b=icCo9yumL008xu05SLG4+E9wu+m3+U3T7UUAs44bHLvD8DhDOtg8VLg79JjWpJW2Fpx44FgiN
 NJ07CN4PlTKCC+4esxdJ3Mtc2B7uqtfzNBlESJtkqtxD2uhfYtCKXc9
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792054757575
X-purgate-ID: tlsNG-4011c0/1792054760-50ACCCFC-144CC924/0/0
X-purgate-type: clean
X-purgate-size: 3155

On 2026-10-15 10:44 +0200, Jan Beulich wrote:
> On 15.10.2026 10:41, Jan Beulich wrote:
> > On 15.10.2026 10:28, Baptiste Le Duc wrote:
> >> On 2026-10-15 09:14 +0200, Jan Beulich wrote:
> >>> On 14.10.2026 18:45, Baptiste Le Duc wrote:
> >>>> On 2026-10-14 11:09:58+02:00, Jan Beulich wrote:
> >>>>> On 14.10.2026 11:00, Baptiste Le Duc wrote:
> >>>>>
> >>>>> In which case it would need to be
> >>>>>
> >>>>>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) ||
> >>>>>          !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
> >>>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>>>>
> >>>>> albeit I have to admit that permitting two contradicting extensions to
> >>>>> be exposed at the same time is irritating.
> >>>>>
> >>>>>> I see two ways to address this:
> >>>>>>
> >>>>>> 1) Keep checking Svade:
> >>>>>>
> >>>>>>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> >>>>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>>>>>
> >>>>>>     After resolve_ad_scheme(), the Svade bit is set in every case where
> >>>>>>     software has to preset the A/D bits. The only imprecise case is both
> >>>>>>     extensions advertised with hardware updating already enabled by
> >>>>>>     firmware, where presetting A/D is unnecessary but harmless.
> >>>>>>
> >>>>>> 2) Record the probe result in a global, e.g.
> >>>>>>
> >>>>>>     static bool __ro_after_init hw_ad_update;
> >>>>>>
> >>>>>>     and use:
> >>>>>>
> >>>>>>     if ( !hw_ad_update )
> >>>>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>>>>>
> >>>>>>     This is exact in all cases, at the cost of a new global that mostly
> >>>>>>     duplicates what resolve_ad_scheme() already records in the ISA bitmap.
> >>>>>>
> >>>>>> I discussed with Oleksii and we are fine with either. What do you prefer?
> >>>>>
> >>>>> As to 1), see above. For 2), while maybe okay, I think we're better off
> >>>> Sorry, I don't fully follow the issue with 1). Compared to what you proposed,
> >>>> it only differs when neither Svade nor Svadu is recorded, which cannot
> >>>> happen as resolve_ad_scheme() runs before and always records one of the
> >>>> two.
> >>>
> >>> Yet previously we said that recording extensions (as such, i.e. later also
> >>> possibly exposing them to guests) when they weren't really advertised may
> >>> not be the right thing to do. I.e. imo the probing may be used to drive
> >> But we also said that platforms (such as the P550) may implement an
> >> extension without advertising it, as a RISC-V spec maintainer
> >> confirmed in [1].
> >>
> >> [1] https://github.com/riscv/riscv-isa-manual/issues/3450#issuecomment-6076851535
> > 
> > What Andrew says there suggests to me that the behavior you observe on P550
> > is against the spec.
> 
> Or wait - no, he doesn't. He said this only to the strange combination you had
> indicated.
For me, he clearly answered your question before:
`Implementations that trap when A/D bits are not set do implement Svade,
whether or not they explicitly say they do.`

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

