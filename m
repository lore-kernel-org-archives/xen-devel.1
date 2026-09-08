Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BFBC79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 16:05:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412273.1642818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3yJm-0002Zw-67; Tue, 08 Sep 2026 16:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412273.1642818; Tue, 08 Sep 2026 16:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3yJm-0002Zp-2I; Tue, 08 Sep 2026 16:05:06 +0000
Received: by outflank-mailman (input) for mailman id 1412273;
 Tue, 08 Sep 2026 16:05:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3yJk-0002Zj-PL
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 16:05:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3yJj-00H5LV-K9
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 18:05:03 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a081c3f83a000c4f3@swg.vates.tech>)
 id 6aa03224-bab6-0a2a0a5309dd-0a2a450ca092-18
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 18:05:03 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a081c3f83a000c4f3@swg.vates.tech>)
 id 6aa0322f-f479-0a2a450c0019-b9ff1c12aaa9-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 18:05:03 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a081c3f83a000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 08 Sep 2026 16:04:59 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5212984143;
 Tue,  8 Sep 2026 18:04:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=2tlW4w1t6KCM3zSNeh8baEqLTz0vIS9H0ZxoyjGx+TU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=J+hVQtVHW7D6Tbidr52xdLMcjQbaS0dgt3nh0hzBUKCE2UbabBGyEU5PDIOb6EWqcaz8IdBo+
 21gjVoScq02xwsjCiTGzaCdWH83FQcNlVWKiS6NJ0w3L+WXSFhv4XiNIG+mQaG7zsDWwiKhsbsw
 ctekG1m7JWAdzj6PyWUmGvIaUlcgCAeqlAPPvyNvyDIMiuMOMKCvfJq0XPNOH06gHoPaleKsn2o
 HWQlsR8dX17yaANfllSRtyBR7I8dteYNaNJhZwzMhd+7Fn9SZE4lbjCDsRJemWBUln/cjUJXazf
 gcosLQqgY8F6sdVLpTGHeUu1NeXCDHBiwI7reGTTdU0A==
X-Zone-Loop: 56dc10f638cd2653f32f0549df4d1d270ca9b9a27960
x-campaign-type: default
x-transaction-id: 52de1e6c-a031-44ba-a3ba-319c9773a85c
x-swg-uid: 01-c372b82d-2b3d-486e-9eaa-f0d317a11b63
X-Mailer: Sweego
Message-ID:
 <1788883499.8631fc262581453bbf619ec5b2062170.1a081c3f83a000c4f3@vates.tech>
x-swg-bid: 1788883499.8631fc262581453bbf619ec5b2062170.1a081c3f83a000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 17/39] xen/riscv: decouple INSN_PSEUDO_VS_* from the
 hypervisor's XLEN
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
In-Reply-To: <9a7dea59-be4a-4dbd-9935-f48e24adc009@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <2a69992aa02ff114237ec27204cfac0f8278b1d6.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796633.8631fc262581453bbf619ec5b2062170.1a07c9682ec000c4f3@vates.tech>
 <9a7dea59-be4a-4dbd-9935-f48e24adc009@gmail.com>
Date: Tue, 08 Sep 2026 18:04:52 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788883498; l=5639;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=YC1eJUqc9W5+Ahpoud4LWTaci9Jwr3Fbc43LuXWek1s=;
 b=1clSyFv4gaHHI8stmVZu3xTLOr1qtUg/sL5B+mgZSaV7IZ8J25dIhL9BUBsfgI6UhlasdG+mG
 GPqwJhTJpm0AKL/GVDTfmjccv97idhjQoRpi8lQqnwg1UDuthmzA5dF
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788883498541
X-purgate-ID: tlsNG-d25034/1788883503-766DEA5B-D2FA790F/10/73395122804
X-purgate-type: spam
X-purgate-size: 5643

On 2026-09-08 11:34 +0200, Oleksii Kurochko wrote:
> 
> 
> On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
> >> htinst reports a pseudoinstruction when a guest page fault is taken on an
> >> implicit memory access done for VS-stage address translation. Four such
> >> values are defined, differing in the access type (read or write) and in the
> >> access width: 4 bytes (0x2000/0x2020) or 8 bytes (0x3000/0x3020).
> >>
> >> That width is the width of a VS-stage PTE, i.e. it follows the guest's
> >> paging mode (4 bytes for Sv32, 8 bytes for Sv39 and wider) and has nothing
> >> to do with the XLEN Xen itself is built for. Selecting just one pair with
> >> where a guest running with VSXL=32 and Sv32 in vsatp produces the 4-byte
> > Sentence is broken. Guess you mean "Selecting just one pair based on Xen's XLEN misses the case where
> > …".
> 
> Likely it is becuase of my low level English but it seems that original 
> version wast okay and what you added is just a part from prev. sentence 
> but I will add your suggestion for better clearness. Thanks for noticing 
> that!
> 
> > 
> >> forms. Such an htinst would not be recognized as a pseudoinstruction and the
> >> fault would be mistaken for an ordinary MMIO trap: Xen would fetch and
> >> decode whatever instruction sepc happens to point at (unrelated to the
> >> access which faulted) and emulate it against a guest physical address
> >> derived from htval, which for an implicit access holds the address of a
> >> VS-stage PTE rather than of any access the guest performed.
> >>
> >> Define all four values unconditionally instead, named after the access width
> >> they encode rather than after the build's XLEN. On RV32 the 8-byte forms
> >> simply never occur, so recognizing them costs nothing.
> >>
> >> Dropping the ladder loses no build-time coverage: a build for an XLEN other
> >> than 32 or 64 already fails on the equivalent ladders in asm/asm.h and
> >> asm/config.h, so no replacement #error is needed here. Adding one keyed on
> >> CONFIG_RISCV_* would in any case re-introduce exactly the conflation this
> >> patch removes.
> >>
> >> This diverges from the imported version of riscv_encoding.h.
> >>
> >> No functional change: the values have no user yet.
> >>
> >> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>
> >> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
> >> index c63e5e3046..2d2e7e11b3 100644
> >> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> >> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> >> @@ -839,25 +839,17 @@
> >>   #define INSN_MASK_FENCE_TSO		0xffffffff
> >>   #define INSN_MATCH_FENCE_TSO		0x8330000f
> >>   
> >> -#if __riscv_xlen == 64
> >> -
> >>   /* 64-bit read for VS-stage address translation (RV64) */
> >> -#define INSN_PSEUDO_VS_LOAD		0x00003000
> >> +#define INSN_PSEUDO_VS_LOAD64		0x00003000
> >>   
> >>   /* 64-bit write for VS-stage address translation (RV64) */
> >> -#define INSN_PSEUDO_VS_STORE	0x00003020
> >> -
> >> -#elif __riscv_xlen == 32
> >> +#define INSN_PSEUDO_VS_STORE64		0x00003020
> >>   
> >>   /* 32-bit read for VS-stage address translation (RV32) */
> >> -#define INSN_PSEUDO_VS_LOAD		0x00002000
> >> +#define INSN_PSEUDO_VS_LOAD32		0x00002000
> >>   
> >>   /* 32-bit write for VS-stage address translation (RV32) */
> >> -#define INSN_PSEUDO_VS_STORE	0x00002020
> >> -
> > Whole point of patch is these no longer depend on build XLEN, yet
> > comments still say "(RV64)"/"(RV32)" which could be confusing. Maybe it
> > should be better to indicate, as the spec does, that RV32 values are
> > used when VSXLEN=32 (only sv32 paging mode) and RV64 values when
> > VSXLEN=64 (sv39+ paging modes).
> > 
> 
> Could you please clarify to me what in the spec it is?

It is the same table as you indicated below (but mine is Table 56, so it
seems we don't have the same spec version, I'm using the version 20260120).

When I found unclear is that "RV32" or "RV64" alone is ambiguous,
since host and guest can differ (e.g. RV64 host running an RV32 guest).
Saying it depends on VSXLEN instead makes clear which one is meant.

> 
> This comments are just copy from the spec:
> 
> Table 39. Special pseudoinstruction values for guest-page faults. The 
> RV32 values are used when VSXLEN=32, and the RV64 values when VSXLEN=64.
> Value           Meaning
> 0x00002000      32-bit read for VS-stage address translation (RV32)
> 0x00002020      32-bit write for VS-stage address translation (RV32)
> 
> Value           Meaning
> 0x00003000      64-bit read for VS-stage address translation (RV64)
> 0x00003020      64-bit write for VS-stage address translation (RV64)
> 
> So the comments are just copy of "Meaning" column from the spec.
> 
> And I think that Meaning column is fine here as we could have a case of 
> when hypervisor has XLEN=64 but guests could be on it RV32 and RV64 and 
> if a guest is RV32 (what means VSXLEN=32) then the comment above 
> defintion mean that we hav 32-bit read/write VS-stage address 
> translation for (RV32) guest and the similar is for RV64.
> 
> Do I miss something? Is a comments make more sense now or I have to 
> still update them in some way?
>
I think it would be more clear to modify the comment by that:
/* 32-bit read for VS-stage address translation (VSXLEN=32) */

But now with your explanation, your comment is more clear as it specify
VS-stage address, so the guest. Feel free to adopt my version or not.
> 
> Thanks!
> 
> ~ Oleksii
> 
> 
> 
> 



