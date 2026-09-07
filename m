Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319C8C79FA3
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 15:57:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410961.1641763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3bio-0007Ar-QX; Mon, 07 Sep 2026 15:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410961.1641763; Mon, 07 Sep 2026 15:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3bio-0007Ak-NJ; Mon, 07 Sep 2026 15:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1410961;
 Mon, 07 Sep 2026 15:57:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3bin-0007A2-AU
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 15:57:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3bil-00111U-LJ
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 17:57:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c9682ec000c4f3@swg.vates.tech>)
 id 6a9edee3-e002-0a2a0a5209dd-0a2a450bcb8c-2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:57:23 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c9682ec000c4f3@swg.vates.tech>)
 id 6a9edee3-b7e8-0a2a450b0019-b9ff1c229b35-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:57:23 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a07c9682ec000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 07 Sep 2026 15:57:13 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1CDF38409A;
 Mon,  7 Sep 2026 17:57:13 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=jnc1o8azbpt3q96zAmQUDwrEJuwl/41nwrNJgIomgtY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=LXF2Q/aIMtL0zgWPGQKGWueSqqXaxSvg4RF5c6pQUUFmgDleP30CqkKic6i9WrJKScJqMZ917
 olqhOmXhosCArJDLsiPO+/8NIM0VCMucSkeJqyrFXq473H6XYOoztUqPoT7mzq2hfYytKICbMVf
 GHUL5iOl6KghTofX9bWznm4afuGaAqzkJzJdsyJFHCUvBtdfAQeAwBa4MPtKkdgunnt2dWqMzaz
 VHy1f39U4cHwVpSSlA4/nq890z+7DyMjQWqUqUhDVQMlvX0Z0Cw+uEyCOGj1UPMrL4jl7qIJ26v
 5MGFnz+ps/w1qjzdGyQAPHgbjnSFrXAIOIF5mzuCgMZA==
X-Zone-Loop: 158a99d76f427bac4fe71ec7be609830f36d3ce5fa93
x-campaign-type: default
x-transaction-id: 3b072c70-7ea9-4156-97c3-4bbda24585f2
x-swg-uid: 01-6e402b2a-168e-43e8-9b26-b485346a102c
X-Mailer: Sweego
Message-ID:
 <1788796633.8631fc262581453bbf619ec5b2062170.1a07c9682ec000c4f3@vates.tech>
x-swg-bid: 1788796633.8631fc262581453bbf619ec5b2062170.1a07c9682ec000c4f3
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
In-Reply-To: <2a69992aa02ff114237ec27204cfac0f8278b1d6.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <2a69992aa02ff114237ec27204cfac0f8278b1d6.1787838835.git.oleksii.kurochko@gmail.com>
Date: Mon, 07 Sep 2026 17:57:03 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788796632; l=3288;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=CGTaarprigZS1mCShM6ahN0K5tFhfdXGr5CIh2d29RI=;
 b=7P7q+KpzeJGIX0WAf2mB1Ox4W7tUR0M9VXBd/egkHtTu+4Glf2pr9sAAJNo3tpTAuPs/54NfT
 PHo8M9DL76KDJuvbt416jBSVAt3za27k2r60l64cmSInHXCJtG+Ko4S
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788796633311
X-purgate-ID: tlsNG-42698a/1788796643-19AC09EA-B2F9F05D/10/73395122804
X-purgate-type: spam
X-purgate-size: 3288

> htinst reports a pseudoinstruction when a guest page fault is taken on an
> implicit memory access done for VS-stage address translation. Four such
> values are defined, differing in the access type (read or write) and in the
> access width: 4 bytes (0x2000/0x2020) or 8 bytes (0x3000/0x3020).
> 
> That width is the width of a VS-stage PTE, i.e. it follows the guest's
> paging mode (4 bytes for Sv32, 8 bytes for Sv39 and wider) and has nothing
> to do with the XLEN Xen itself is built for. Selecting just one pair with
> where a guest running with VSXL=32 and Sv32 in vsatp produces the 4-byte
Sentence is broken. Guess you mean "Selecting just one pair based on Xen's XLEN misses the case where
…".

> forms. Such an htinst would not be recognized as a pseudoinstruction and the
> fault would be mistaken for an ordinary MMIO trap: Xen would fetch and
> decode whatever instruction sepc happens to point at (unrelated to the
> access which faulted) and emulate it against a guest physical address
> derived from htval, which for an implicit access holds the address of a
> VS-stage PTE rather than of any access the guest performed.
> 
> Define all four values unconditionally instead, named after the access width
> they encode rather than after the build's XLEN. On RV32 the 8-byte forms
> simply never occur, so recognizing them costs nothing.
> 
> Dropping the ladder loses no build-time coverage: a build for an XLEN other
> than 32 or 64 already fails on the equivalent ladders in asm/asm.h and
> asm/config.h, so no replacement #error is needed here. Adding one keyed on
> CONFIG_RISCV_* would in any case re-introduce exactly the conflation this
> patch removes.
> 
> This diverges from the imported version of riscv_encoding.h.
> 
> No functional change: the values have no user yet.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
> index c63e5e3046..2d2e7e11b3 100644
> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -839,25 +839,17 @@
>  #define INSN_MASK_FENCE_TSO		0xffffffff
>  #define INSN_MATCH_FENCE_TSO		0x8330000f
>  
> -#if __riscv_xlen == 64
> -
>  /* 64-bit read for VS-stage address translation (RV64) */
> -#define INSN_PSEUDO_VS_LOAD		0x00003000
> +#define INSN_PSEUDO_VS_LOAD64		0x00003000
>  
>  /* 64-bit write for VS-stage address translation (RV64) */
> -#define INSN_PSEUDO_VS_STORE	0x00003020
> -
> -#elif __riscv_xlen == 32
> +#define INSN_PSEUDO_VS_STORE64		0x00003020
>  
>  /* 32-bit read for VS-stage address translation (RV32) */
> -#define INSN_PSEUDO_VS_LOAD		0x00002000
> +#define INSN_PSEUDO_VS_LOAD32		0x00002000
>  
>  /* 32-bit write for VS-stage address translation (RV32) */
> -#define INSN_PSEUDO_VS_STORE	0x00002020
> -
Whole point of patch is these no longer depend on build XLEN, yet
comments still say "(RV64)"/"(RV32)" which could be confusing. Maybe it
should be better to indicate, as the spec does, that RV32 values are
used when VSXLEN=32 (only sv32 paging mode) and RV64 values when
VSXLEN=64 (sv39+ paging modes).

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

