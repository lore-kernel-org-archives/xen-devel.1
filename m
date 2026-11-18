Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB4E606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Cb6gnFyG
Received: from list by lists.xenproject.org with outflank-mailman.1494156.1693803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTcJ4-000669-Tr; Wed, 18 Nov 2026 09:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494156.1693803; Wed, 18 Nov 2026 09:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTcJ4-000661-Pu; Wed, 18 Nov 2026 09:50:22 +0000
Received: by outflank-mailman (input) for mailman id 1494156;
 Wed, 18 Nov 2026 09:50:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTcJ3-0005sy-6l
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:50:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTcJ2-000dHV-J9
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:50:20 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ee10758e0006d3f@swg.vates.tech>)
 id 6afd74d6-8faa-0a2a0a5109dd-0a2a450cc764-22
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:50:20 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ee10758e0006d3f@swg.vates.tech>)
 id 6afd74dc-f479-0a2a450c0019-b9ff1c12830d-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:50:20 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1ee10758e0006d3f.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Nov 2026 09:50:18 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D1E3D823C6;
 Wed, 18 Nov 2026 10:50:17 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=L5DXv/iXEQcJeWiRrY2hvVXA3NFqR/0MbGGfGMRldcQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Cb6gnFyGVvHW73NbpsBdUtQlETbwBInJqsGnPE9vTosOh+enai3lqohIjs5WFnOImYL2IeMKa
 NiIbkCvyEutKyP5IXjWLeQiNDj3q03ciSJCBu3jgk5+UIV0qrEUCNhyjU9r2HEBDzbero0Q1j4R
 LZddINhWwCknbrkVzeDTiBKkSw9kJA+yMFj3wTFv/coDGWmnEc8loOcrdtVePRQQhKo8ribWQla
 122n55A58hJS5fxQdnmGLeml/xcrDj/6FaAGG31DEQ90Nl+bOKXiT8RLeEgNyfQ4us0NnhYc3D/
 BDNfyMF250tWCExUhKfcLxCp0H/HUuBQOWFOHpGFDxkA==
X-Zone-Loop: 3fe6d83269f9989895910cb9fa60825f8bd60519f8bb
x-campaign-type: default
x-transaction-id: e451b2e5-13e3-40e0-94cc-a60f7792e1f9
x-swg-uid: 01-3a3a44aa-045d-4c62-98e4-691b5cc0eff6
X-Mailer: Sweego
Message-ID:
 <1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10758e0006d3f@vates.tech>
x-swg-bid: 1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10758e0006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 03/42] xen/riscv: introduce csr_volatile_read64()
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <a5a546afe987f3f040c5b942ae01579c4854b94c.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <a5a546afe987f3f040c5b942ae01579c4854b94c.1794562488.git.oleksii.kurochko@gmail.com>
Date: Wed, 18 Nov 2026 10:50:08 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794995410; l=2032;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=z/47bULwk6hjIqNQOSd1kppwuAEof0PXaKOSCULxVPU=;
 b=Lr7E/0rQ1folsP8tPJyaXbmnKEx+Av/YEiDKDm2cJiRfyrV2W7A78nCTBvk0Q57JnnA/WaHXM
 Kn9KjW2YQXaBz2tojzwNqPoNgWvnw+MplEPb9fWN+bgj2oxZsniyy+f
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794995418060
X-purgate-ID: tlsNG-d25034/1794995420-76EDAA5B-32E3879E/10/73395122804
X-purgate-type: spam
X-purgate-size: 2032
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On RV32 a 64-bit CSR is accessed as two halves, <csr> and <csr>H. Reading
> the halves with two separate instructions isn't always safe: for a CSR
> which hardware increments, a carry from the low half into the high one can
> happen in between, so a plain pair of reads can produce a value the CSR
> never held. Therefore the high half is re-read and the sequence retried if
> it changed in the meantime.
> 
> Only CSRs which change under Xen's feet need that, hence the name. The
> majority can be read with a plain pair of csr_read()s, so no helper for
> those is introduced here as there would be no user for it.
> 
> Use it for CSR_TIME, which is exactly such a counter, and widen cycles_t to
> uint64_t. Otherwise get_cycles() would still truncate the time counter to
> 32 bits on RV32.
> 
> No functional change on RV64.
> 
> Fixes: a541ddadec0a ("xen/riscv: introduce time.h")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v4:
>  - Take the CSR name without the CSR_ prefix, so that the macro parameter
>    is used as an operand of ## only (MISRA C Rule 20.12).
>  - Drop the (void) of the ...H constant on RV64.
>  - Initialise hi_ in its declaration.

Jan gave his Reviewed-by on v3. It is gone in v4. Dropping it may be
fine given the macro rework, but please say so in the changelog :)

> [ ... 45 lines skipped ... ]
>  #else
>  #define csr_write64(name, val) csr_write(CSR_ ## name, val)
> +
> +#define csr_volatile_read64(name) csr_read(CSR_ ## name)

Nit: On v3 Jan suggested "#define csr_volatile_read64 csr_read64", and you
answered you would then move csr_read64() into this patch. In v4
csr_read64() still only comes with "xen/riscv: implement vCPU context
switching".

On RV64 I think it would read better like that:
#define csr_read64(name) csr_read(CSR_ ## name)
#define csr_volatile_read64(name) csr_read64(name)

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

