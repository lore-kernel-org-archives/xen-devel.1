Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4211C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:05:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412897.1643185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4H32-000223-FB; Wed, 09 Sep 2026 12:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412897.1643185; Wed, 09 Sep 2026 12:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4H32-00021w-C8; Wed, 09 Sep 2026 12:05:04 +0000
Received: by outflank-mailman (input) for mailman id 1412897;
 Wed, 09 Sep 2026 12:05:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4H31-00020k-2C
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:05:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4H2z-002Apd-RV
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:05:01 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0860e9a70000c4f3@swg.vates.tech>)
 id 6aa14b69-e002-0a2a0a5209dd-0a2a4501dc36-10
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:05:01 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0860e9a70000c4f3@swg.vates.tech>)
 id 6aa14b6d-5984-0a2a45010019-b9ff1c23aa85-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:05:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0860e9a70000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Sep 2026 12:04:59 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 50B1E81D1B;
 Wed,  9 Sep 2026 14:04:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=SkuYxjZ1B5YFTEgieTR6yPubK5Xfl64bqCNy4funigg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=X83l/zztBu4p1c1Ec2wVabCwloF5u07GkEq3UEU0IH5r0bLkJoQqwBUC9KwPI0vuYp54xXilC
 cEorXyDPpspoWlDSZUqfvbU0QAL32GsDws5Pb0GQtVhbIHtXLdMVMm2uRoZcsDreII5gzH/igkM
 dg88aPvjA4PyzZxzV5+oIP3GMVCmb66xFRRXmcg8RnIFD6RtCftZPOjWEqTl54EYeLkVfwf2O5s
 iNDNjH/PTo+gwaUp0qBB97jRXlGycNM/4YvFppkikLqR1d6/EyePaWiBvyEKQon/laL3VVk6+6j
 +RQUifwMpJJ5B34Nh3qt+UytupxnRKhJsAc+4NXMxliA==
X-Zone-Loop: b9439202ed9b83d8ce94fe610df575d4749f47f7edb9
x-campaign-type: default
x-transaction-id: fee67b83-b446-43e5-81d7-41ca9b597b07
x-swg-uid: 01-80742788-40b0-4177-a8fa-151a0b2d5faa
X-Mailer: Sweego
Message-ID:
 <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9a70000c4f3@vates.tech>
x-swg-bid: 1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9a70000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 21/39] xen/riscv: resolve the faulting guest
 physical address
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
In-Reply-To: <c7975a131c229c721b2d4fe81c13fecd8deb4329.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <c7975a131c229c721b2d4fe81c13fecd8deb4329.1787838835.git.oleksii.kurochko@gmail.com>
Date: Wed, 09 Sep 2026 14:04:50 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788955498; l=3751;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=RS+bCt0Q6wrr4O9Nud/sTDEh4x8UsS4NDZCGRoZAyV4=;
 b=UQLlewz1h1vhEiTEXmQK7fhjMu3gU1u2mzUT4EY+35e8wAomp5id+PEAzGDGMj1bIP7Gblz0D
 xW8Q7qBM0VbDXOzPkRirfX9N5uf1+rq356ZjCwNMOE25hvpqSROatXg
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788955498538
X-purgate-ID: tlsNG-d62444/1788955501-BCD44757-084C0343/10/73395122804
X-purgate-type: spam
X-purgate-size: 3751

> Take the guest physical address from htval and stval: on a guest-page fault
> htval holds it shifted right by 2, so that an address wider than XLEN fits,
> and stval holds the faulting guest virtual address, whose two least
> significant bits are those of the guest physical address. The shift is done
> on paddr_t rather than on the raw register: a guest physical address is 34
> bits wide on RV32 with Sv32x4, so shifting an XLEN-wide value would drop its
> top two bits.
>
> Those two low bits come from stval only for a fault on an explicit access.
> Where one is taken on an implicit access made for VS-stage translation htval
> holds the address of the VS-stage PTE which could not be read, while stval
> still holds the guest virtual address which started the walk, and the low
> bits of the address written to htval are zero instead. htinst tells the two
> apart, which is what the spec points at it for.
> 
I'd just precise (the spec is also not clear on this point though), what
is "current XLEN" here, clearly indicate that htval holds the GPA >> 2 and
stval holds VGA and also put the two different cases we need to
distinguish clearly:
```
Recover the guest physical address from htval and stval. On a guest-page
fault to hypervisor, htval holds the guest physical address shifted
right by 2, so that an address wider than HSXLEN fits, and stval holds
the faulting guest virtual address. The shift is done on paddr_t rather
than on the raw register: a guest physical address is 34 bits wide on
RV32 with Sv32x4, so shifting an XLEN-wide value would drop its top two
bits.

However, there are two cases to distinguish when recovering the
faulting GPA:
    - Explicit memory access: we use the two least significant bits of
    stval, which are the same as those of the guest physical
    address.
    - Implicit memory access for VS-stage translation: the two least
    significant bits of htval are zero.

These two cases can be distinguished using the value provided in
register htinst.
```
> 
> stval needs no check against an ISA extension: a guest-page fault writes it
> with the faulting guest virtual address regardless. Sstvala would not be the
> right thing to test for either (it covers stval across every trap type
> which writes it, a wider guarantee than what is needed here).
> 
> htval does need one. The H extension lets an implementation write it with
> either the faulting address or zero, so without Shtvala a zero htval cannot
> be told apart from a genuine fault on guest physical address 0-3, and the
> address has to be recovered by decoding the access and walking the VS-stage
> page tables in software instead. That is left as a TODO, and until it is
> written such hardware panics rather than acting on an address which may not
> be the one which faulted.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
> index f9da075104..ff530ef2df 100644
> --- a/xen/arch/riscv/emulate.c
> +++ b/xen/arch/riscv/emulate.c
> @@ -9,6 +9,7 @@
>  #include <xen/sched.h>
>  #include <xen/types.h>
>  
> +#include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/current.h>
>  #include <asm/emulate.h>
> @@ -62,10 +63,28 @@ static bool htinst_is_pseudo(unsigned long htinst)
>      }
>  }
>  
> -/* Reconstruct the guest physical address of the access which faulted. */
> +/* Resolves the guest physical address the access faulted on into @gf->gpa. */
Why did you change the comment apart for adding @gf->gpa? I think the
"reconstruct" is more clear but there might be another reason why you
changed it.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

