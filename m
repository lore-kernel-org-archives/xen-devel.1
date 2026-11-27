Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613D606A33C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=ZaqBXKBd
Received: from list by lists.xenproject.org with outflank-mailman.1505316.1700148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWyNF-0003YQ-0i; Fri, 27 Nov 2026 16:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505316.1700148; Fri, 27 Nov 2026 16:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWyNE-0003YI-Ts; Fri, 27 Nov 2026 16:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1505316;
 Fri, 27 Nov 2026 16:00:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21dbc95100004767@swg.vates.tech>)
 id 1xWyND-0003Y8-Gh
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 16:00:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWyNC-001xiV-Fm
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 17:00:30 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21dbc95100004767@swg.vates.tech>)
 id 6b09a916-bab6-0a2a0a5309dd-0a2a4504ce9c-30
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 17:00:30 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21dbc95100004767@swg.vates.tech>)
 id 6b09a91e-b57f-0a2a45040019-b9ff1c23b439-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 17:00:30 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21dbc95100004767.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 16:00:27 +0000
Received: from [192.168.1.72] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 044AA82B6A;
 Fri, 27 Nov 2026 17:00:27 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=3Npo7QjHQTkEYLxmbMr+t/DNER2t9Wk00nD/kge7tzo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ZaqBXKBdtD096lliqzM7IRfAIpjibjOzcmmGsNM2obIKl4PUhNAJ86Sk/KnNzEMFVeoy0CtXs
 VWBv+f3moPiYJ3jfFky64+1uDdxbyBiE6GiK3nk086fodEmCspMo2WOW1e2D0NXjbGQfsX6Acf/
 4E1r5ggKRO/Vuat8XujISqyhoIJjVqfyLzIa3w++PVw7dywuJqd54O2aHEw6BLVVpC/EfdMSVJ3
 HoxcMuze/5Gb5jumVTMRYYupbQ8njm21mP2pw6TEBD3H8AYeYErlwMz49QN+teU/Wy2BAzEyIF8
 H7Wf8lXOYkrMZS4QQcucx2I4/SiUrafKx3fZZWaDn8Eg==
X-Zone-Loop: bb4eeed9f09896d161a2fef3d1567b4b69155145525c
x-campaign-type: default
x-transaction-id: 098dcd17-25ac-47ae-8982-735935f3c1e2
x-swg-uid: 01-239c78b9-75c6-413c-8a31-6ecd8531d81f
X-Mailer: Sweego
Message-ID:
 <1795795227.8631fc262581453bbf619ec5b2062170.1a21dbc95100004767@vates.tech>
x-swg-bid: 1795795227.8631fc262581453bbf619ec5b2062170.1a21dbc95100004767
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 05/42] xen/riscv: build the target hart index via
 aplic_hart_index()
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
In-Reply-To: <c190e50262ea2b4987bc66c1ed324ac6bb9c03ef.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <c190e50262ea2b4987bc66c1ed324ac6bb9c03ef.1794562488.git.oleksii.kurochko@gmail.com>
Date: Fri, 27 Nov 2026 17:00:20 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795795221; l=1287;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=MQKcMT8nr48nFNqf0ms/Sz9IeShSWqLcEvU/0E7+kgQ=;
 b=MHFoNsqDeZl8M/Ka6tRgllhookQUqz7GWf+egxttxQqTDnoVqL5r3ygp/QcGKiuAa8lJs3p7R
 Oh9Nh0KHfJMCu5FBq1xV2v/ZUwwQljTKkYvtuDUdd/qvlg5odg37LW2
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795795227207
X-purgate-ID: tlsNG-ebf023/1795795230-502E4B50-7B251352/0/0
X-purgate-type: clean
X-purgate-size: 1287
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [ ... 129 lines skipped ... ]
> +static unsigned long aplic_hart_index(unsigned int cpu)
> +{
> +    const struct imsic_config *imsic = imsic_get_config();
> +    const struct imsic_msi *msi = &imsic->msi[cpu];
> +    /* Low Hart Index Shift */
> +    unsigned int lhxs = imsic->guest_index_bits;
> +    /* Low Hart Index Width */
> +    unsigned int lhxw = imsic->hart_index_bits;
> +    /* High Hart Index Width */
> +    unsigned int hhxw = imsic->group_index_bits;
> +    /* High Hart Index Shift */
> +    unsigned int hhxs =
> +        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
> +    /*
> +     * msi->base_addr is the base of the MMIO regset this CPU's interrupt
> +     * files live in, and one regset can cover several harts; msi->offset
> +     * selects this CPU's block inside it. The hart index bits are part of
Very small nit: too keep being consistant with above wording and with
the spec, it should be better to use "The Hart Index bits are...." to
not confuse with "h" again...

I think it doesn't need an extra version. Jan, if you acked this patch,
could you please do it while commiting?
Thanks in advance.

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

