Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC8606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=NAbJlcOz
Received: from list by lists.xenproject.org with outflank-mailman.1498013.1696030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULvC-0002XJ-Rd; Fri, 20 Nov 2026 10:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498013.1696030; Fri, 20 Nov 2026 10:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULvC-0002XC-N5; Fri, 20 Nov 2026 10:32:46 +0000
Received: by outflank-mailman (input) for mailman id 1498013;
 Fri, 20 Nov 2026 10:32:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f883fa26000183d@swg.vates.tech>)
 id 1xULvB-0002X4-Nk
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:32:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xULvA-00B5gS-T3
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 11:32:44 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f883fa26000183d@swg.vates.tech>)
 id 6b0021c5-2eae-0a2a0a5409dd-0a2a4506b6cc-28
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:32:44 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f883fa26000183d@swg.vates.tech>)
 id 6b0021cc-195a-0a2a45060019-b9ff1c238273-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:32:44 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1f883fa26000183d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Nov 2026 10:32:41 +0000
Received: from [192.168.1.37] (lfbn-gre-1-56-253.w92-157.abo.wanadoo.fr
 [92.157.33.253]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 239708330D;
 Fri, 20 Nov 2026 11:32:40 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=oGJuSdAcJ7QvZu7GQyhdCGZpSU/wfBUsT8mk7Mgk06M=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=NAbJlcOzD3rSecekN7Nj6VFsUokWyjTDbuVEUMZiYnQ4NnJy51USUreTdSfpD6on5Lc9DaS+q
 fI7ySrDRZuJePDT7dd3Xm6mB6PBgxs/nStnUp1Q5AFgQ8yr7qZVw0UtEJsqQxusi5QCPc5A9xS3
 FH8B6lo5mrIjBNypqwKrbPiQAqQbM6h+jZY4B6BbD882O6J+AiUy2d02dVSQGpAlsujrbu05sq9
 HgqirC8FSwvfDZV47Jvfbusmt+1gPiuGz0dxsnjRWoDfuGDCm/mrclEnqIheaiQwZkmwFh/Fn5z
 QBIOCEwKZkSunIZpamRtRrQNluLO40KvV+yo7FSvJ7/A==
X-Zone-Loop: ccaf3f7031d507c72e527edf264311453a39f28d590e
x-campaign-type: default
x-transaction-id: 75d6ff46-ef40-47b8-b9f4-4445277ae412
x-swg-uid: 01-76c7b09e-c3d9-4ec9-8d15-9dce020c1343
X-Mailer: Sweego
Message-ID:
 <1795170761.8631fc262581453bbf619ec5b2062170.1a1f883fa26000183d@vates.tech>
x-swg-bid: 1795170761.8631fc262581453bbf619ec5b2062170.1a1f883fa26000183d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] xen/riscv: add support for riscv,isa-extensions
 devicetree property
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: cristian.andrei1423@gmail.com
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com, 
 alistair.francis@wdc.com, connojdavis@gmail.com, baptiste.le-duc@vates.tech, 
 community.manager@xenproject.org, andrew.cooper3@citrix.com, 
 anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
 julien@xen.org, roger@xenproject.org, sstabellini@kernel.org, 
 Denis Mukhin <dmukhin@ford.com>
In-Reply-To: <20261119154807.80195-1-cristian.andrei1423@gmail.com>
References: <20261119154807.80195-1-cristian.andrei1423@gmail.com>
Date: Fri, 20 Nov 2026 11:32:33 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795170754; l=6182;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=oTSWV23O4+LElEezsXX3bMTy/YsBJpDmj/SWYfNnbWs=;
 b=6K/XE7RbnBWWvz6pNcfqDfWA99Xi4XkPXlkf58Ln/4emtdl8lTaRNzVAUlA/i88RSnv+Yvvn9
 KcGSqzd5uyyBTeh0NBti8MHsZ8qntlEkNuorFS8r2YEEPaGPLQHwTay
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795170760401
X-purgate-ID: tlsNG-16d1c6/1795170764-FE87577B-1E9006D7/0/0
X-purgate-type: clean
X-purgate-size: 6182
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cristian,

Thanks for contributing to Xen on RISC-V!


> Xen panics when a CPU only has the riscv,isa-extensions property in
> the device tree. It only accepts the deprecated riscv,isa property,
> which forces users to use legacy devicetrees.
> 
> Use riscv,isa-extensions if present, otherwise the legacy riscv,isa.
> If the new property is used, riscv,isa-extensions and riscv,isa-base
> must both be present and riscv,isa-base must exactly match the build
> string. Make a new shared helper riscv_isa_ext_check() which returns
> the exact state of the property: whether both are present or to use
> the legacy property. This helper makes both cpufeature.c and smpboot.c
> agree on which property a CPU uses.
> 
> A CPU with neither property is skipped with a message. Make it now
> an error because a skipped CPU is left out of the intersection, so
> Xen could use extensions that CPU lacks.
> 
> Add a per-CPU fallback so that any mix of new and legacy CPUs works.
> This deviates from Linux, which skips CPUs without riscv,isa-extensions
> and could assume extensions those CPUs lack.
> 
> Add a first-CPU flag because with the new riscv,isa-extensions, a CPU's
> set can now be empty, which would make a later CPU appear as the first
> one. This couldn't happen with riscv,isa, where 'i' is always set.
> 
> Use the new property in dt_processor_hartid(), with the legacy
> fallback, which also only used the legacy riscv,isa during
> interrupt-controller setup.
> 
> Suggested-by: Denis Mukhin <dmukhin@ford.com>
> Signed-off-by: Cristian Andrei <cristian.andrei1423@gmail.com>

I would first say explicitly what Xen currently does: it only parses
riscv,isa, which is deprecated in the DT bindings, and silently skips
CPU nodes that lack it. Something like (I also shortened the subject):

    xen/riscv: support riscv,isa-extensions devicetree property

    Xen only parses the riscv,isa devicetree property, which Linux has
    deprecated in favour of riscv,isa-base plus riscv,isa-extensions [1].
    Xen panics if no CPU node has riscv,isa, so a devicetree using only
    the new properties cannot boot Xen.

    Use riscv,isa-extensions when present, falling back to the legacy
    riscv,isa otherwise. With the new binding, riscv,isa-extensions and
    riscv,isa-base must both be present, and riscv,isa-base must match the
    base ISA Xen is built for ("rv64i" or "rv32i"). Add a shared helper,
    riscv_isa_ext_check(), so that cpufeature.c and smpboot.c agree on
    which property a CPU uses.

    Currently, a CPU node with neither property is skipped with a message.
    Make this an error instead, as a skipped CPU is left out of the ISA
    intersection and Xen could then use extensions that CPU lacks.

    Add a per-CPU fallback so that any mix of new and legacy CPUs works.
    This deviates from Linux, which skips CPUs without riscv,isa-extensions
    and could assume extensions those CPUs lack.

    Track the first CPU with a flag instead of testing whether the
    intersection is empty: with riscv,isa-extensions a CPU's set can be
    empty, which would make a later CPU look like the first one. This
    can't happen with the legacy riscv,isa, where 'i' is always set.

    dt_processor_hartid(), used during interrupt-controller setup, also
    only reads riscv,isa. Make it use the new property too, with the same
    legacy fallback.

    [1] Linux commit aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa")

> [ ... 66 lines skipped ... ]
> -static void __init riscv_fill_hwcap_from_isa_string(void)
> +int riscv_isa_ext_check(const struct dt_device_node *cpu)

The name reads like a pass/fail check, but callers act on three
outcomes: 0 (use riscv,isa-extensions), -ENOENT (new binding absent,
fall back to riscv,isa) and -EINVAL (invalid). Could it be renamed to
something like riscv_isa_ext_probe(), so that the -ENOENT test at the
call sites reads naturally? Together with the comment Oleksii asked for,
that should make it more clear.

> [ ... 63 lines skipped ... ]
> +        else if ( ret == -ENOENT &&
> +                  !dt_property_read_string(cpu, "riscv,isa", &isa) )
> +        {
> +            for ( unsigned int i = 0; (isa[i] != '\0'); i++ )

Nit: since the line is touched anyway, the parentheses around
isa[i] != '\0' can go.

> [ ... 16 lines skipped ... ]
> +        else
> +            panic("Unable to find \"riscv,isa\" or \"riscv,isa-extensions\" "
> +                  "devicetree entry for DT's cpu%lu node\n", cpuid);

Nit: maybe don't split the format string, it makes it harder to grep.
Keep the literal on one line and move cpuid to the next one:

            panic("Unable to find \"riscv,isa\" or \"riscv,isa-extensions\" devicetree entry for DT's cpu%lu node\n",
                  cpuid);


> [ ... 71 lines skipped ... ]
>          /*
> -         * As there is no any guarantee that SSTC will be added to riscv,isa
> -         * property by OpenSBI(it doesn't add it now) or whatever ran before
> -         * Xen, it is needed to set this bit manually.
> +         * As there is no any guarantee that SSTC will be added to

While rewrapping these lines: "there is no any guarantee" -> "there
is no guarantee".

> [ ... 35 lines skipped ... ]
> diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
> index 3b8bf98e20..95c4d650ac 100644
> --- a/xen/arch/riscv/smpboot.c
> +++ b/xen/arch/riscv/smpboot.c
> @@ -7,6 +7,7 @@
>  #include <xen/types.h>
>  
>  #include <asm/current.h>
> +#include <asm/cpufeature.h>

Please keep the <asm/...> group sorted alphabetically: cpufeature.h
goes before current.h.

> [ ... 17 lines skipped ... ]
> +    if ( dt_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> +         dt_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> +         dt_property_match_string(node, "riscv,isa-extensions", "a") < 0 )
> +    {
> +        printk("CPU with hartid=%#lx does not support ima\n", *hartid);

Missing log level: printk(XENLOG_ERR ...).

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

