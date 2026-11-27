Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426AD606A333
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 16:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=NJ3xpVQP
Received: from list by lists.xenproject.org with outflank-mailman.1505399.1700166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWz1b-00026I-4m; Fri, 27 Nov 2026 16:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505399.1700166; Fri, 27 Nov 2026 16:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWz1b-00026A-1j; Fri, 27 Nov 2026 16:42:15 +0000
Received: by outflank-mailman (input) for mailman id 1505399;
 Fri, 27 Nov 2026 16:42:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21de2bb3d0004767@swg.vates.tech>)
 id 1xWz1Z-000264-Sv
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 16:42:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWz1Z-00ETka-9N
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 17:42:13 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21de2bb3d0004767@swg.vates.tech>)
 id 6b09b2be-bab6-0a2a0a5309dd-0a2a45059190-34
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 17:42:13 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21de2bb3d0004767@swg.vates.tech>)
 id 6b09b2e5-4cb1-0a2a45050019-b9ff1c129a07-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 17:42:13 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21de2bb3d0004767.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 16:42:08 +0000
Received: from [192.168.1.72] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 32F0B829BB;
 Fri, 27 Nov 2026 17:42:07 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=ysgPZh8CWurrOqaXbEHQYWtAv8W7B84L2k/rCPPyVZU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=NJ3xpVQPKqy29u8c07mG2p+jWZF2jX2lBsjxATHm5R5gb8H7v3CeIZBxNHKL+fohN95/XEPrv
 HAr9bCzbN8P3cluNpaemV5cKWwSn5Jm6fGcweKjI9FM4rJ3r5zmYIRxjLERDMCGYIF0fN5Kcamv
 ETOsX2/I0jmuvInHg1UShSYouwmzXbsqtSob7fikLLzphwUsMO3FFRmOxTFoEbPEo+K75qCz7WI
 BJlDN+bK7sIQy3VaUoQbXzzw+LQvLW+UPi1hUpLqIXz/9844/9EIgYG8M+waIbKeK9pBx+dxVnn
 iPOqmhxOQNfzyGqfwU+BUtwk/wj41IsrHfvWJzyRQ7Zg==
X-Zone-Loop: e07cd46a95c66d7f5b79fd604ca734fe9402875b29a0
x-campaign-type: default
x-transaction-id: b5b1cc27-1975-4f60-b046-39d57e42e5df
x-swg-uid: 01-ee2083cc-1025-4415-8ab8-9a87d820ff1f
X-Mailer: Sweego
Message-ID:
 <1795797728.8631fc262581453bbf619ec5b2062170.1a21de2bb3d0004767@vates.tech>
x-swg-bid: 1795797728.8631fc262581453bbf619ec5b2062170.1a21de2bb3d0004767
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 07/42] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
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
In-Reply-To: <3fad8494f657cf24524befaff9d593c4fbeea515.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <3fad8494f657cf24524befaff9d593c4fbeea515.1794562488.git.oleksii.kurochko@gmail.com>
Date: Fri, 27 Nov 2026 17:42:00 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795797721; l=1564;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=T+spGO0tozZegwoa2RQHwjmxX067XwfUXmgFnTlkOUE=;
 b=4Gn+XWcE7girKDxQ8qaPPSI0A28IvPDWMWgMkJ1U4lbK9oAqJaVjYS/c+8dW18UPdWhGJ2So6
 qd/0g9wF7uZAvUnX5kMbi8KSwSyHQB4VwXOeEo/C6hL7mhQRREg/63E
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795797727407
X-purgate-ID: tlsNG-c201ff/1795797733-F4AA72A1-4E8798AE/0/0
X-purgate-type: clean
X-purgate-size: 1564
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [ ... 206 lines skipped ... ]
> --- /dev/null
> +++ b/xen/arch/riscv/mmio.c
> @@ -0,0 +1,205 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/bsearch.h>
> +#include <xen/lib.h>
> +#include <xen/rwlock.h>
> +#include <xen/sched.h>
> +#include <xen/string.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <asm/current.h>
> +#include <asm/mmio.h>
> +
> +#define MAX_IO_HANDLER  16
Nit: Only one blank is needed here.
> [ ... 70 lines skipped ... ]
> +/*
> + * Check alignment and dispatch a decoded MMIO access to a registered
> + * handler. On success (0), info->data holds the read value for loads.
> + *
> + * There is no "retry" outcome to handle: find_mmio_handler() returns a
> + * copy of the matching handler taken under vmmio->lock and the ops
> + * structures are never freed, so the lookup result cannot go stale
> + * between finding the handler and invoking it.
> + */
Nit: As do_mmio() is non-static, this comment would better live on its
prototype in asm/mmio.h.
> [ ... 45 lines skipped ... ]
> +    /*
> +     * The array is kept sorted by base address, so rather than appending and
> +     * re-sorting, find the slot the new region belongs to and shift the tail
> +     * up by one.
> +     */
> +    for ( i = vmmio->num_entries;
> +          i > 0 && handlers[i - 1].addr > addr;
> +          i-- )
Nit: This fits on a single line.

Preferably with these adjusted:
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

