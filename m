Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB659606A321
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=OfsxIE48
Received: from list by lists.xenproject.org with outflank-mailman.1456001.1669599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBfc-0006a7-K9; Tue, 20 Oct 2026 15:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456001.1669599; Tue, 20 Oct 2026 15:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBfc-0006a0-HH; Tue, 20 Oct 2026 15:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1456001;
 Tue, 20 Oct 2026 15:22:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159e814b4000f79f@swg.vates.tech>)
 id 1xJBfb-0006Yc-4G
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:22:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJBfa-0033QI-DU
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 17:22:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159e814b4000f79f@swg.vates.tech>)
 id 6ad78727-bab6-0a2a0a5309dd-0a2a4509cb9a-40
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 17:22:30 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159e814b4000f79f@swg.vates.tech>)
 id 6ad78736-be1a-0a2a45090019-b9ff1c2281bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 17:22:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a159e814b4000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 15:22:24 +0000
Received: from leducb.local (149.173.185.81.rev.sfr.net [81.185.173.149])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2051581DC6;
 Tue, 20 Oct 2026 17:22:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=CSBTOdv5UzZAb1Tx+z+CtOJtffNGp3lXbCiV+1NscZE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=OfsxIE48AmtOZOEKmQl+3i2K0gwp/PE6R2k4rq+0KxpoawvdhJesVkur+mm37QdrhzNHUGdaq
 oj4OQt5lD77DAcXoKLUqfJZKPntq+j/Ns/1Dg0VH14R+hYkNi/yRa3mpF8i153tOa2R4U2I+kCs
 Y7E78PvTrzSUfoBWd5ToBATaBhO2mbvCRQ8U5Z4xFamSyIG3pMEVxU+MqnSjklRxrdIsy8s6j2X
 ZofhodEdFgpuOmw0OuoxCW6dw14l7aMYOOwGLwUxjPxl7WNdT5QiTjLalZA0PT+GHNGOLVJKPtT
 g3vA23zqTfg+TKlLP8cmIYBOFMs+X/lANRVNyOX/bgBg==
X-Zone-Loop: 4d9cc59b5477daf916afe61b49601a5519fe0e41f1b0
x-campaign-type: default
x-transaction-id: e17ceb3e-b243-4aea-974a-117a6120a76f
x-swg-uid: 01-7267bdee-e470-42f0-9049-e7976a211579
X-Mailer: Sweego
Message-ID:
 <1792509744.8631fc262581453bbf619ec5b2062170.1a159e814b4000f79f@vates.tech>
x-swg-bid: 1792509744.8631fc262581453bbf619ec5b2062170.1a159e814b4000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 18/39] xen/riscv: implement trap redirection to a
 guest
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
In-Reply-To: <109f3a920a2f5e58de5889ac2bcb834cc7ce967a.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <109f3a920a2f5e58de5889ac2bcb834cc7ce967a.1790779209.git.oleksii.kurochko@gmail.com>
Date: Tue, 20 Oct 2026 17:22:16 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792509737; l=491;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=vtMID585poca8HxU8wRTPoLjs/QKL8NbS608vwd2X0M=;
 b=rYlF/9ERW9OzLcGiBrCh9Bp15DhDC1LWwE+BC879rZFIIaZb99WEICClp2ZY27kIC+Hf+jzdv
 KH1P3Myl+wjADXJT3ZQ7JLc0aEgcDlNbSL1K3aAtReTx/8ub3Oub1Zh
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792509743730
X-purgate-ID: tlsNG-bad1c0/1792509750-3B8D1034-14D6287A/0/0
X-purgate-type: clean
X-purgate-size: 491
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [ ... 54 lines skipped ... ]
> @@ -107,6 +107,11 @@
>  #define SIP_SSIP			MIP_SSIP
>  #define SIP_STIP			MIP_STIP
>  
> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
> +#define STVEC_MODE_MASK		_UL(0x3)
> +#define STVEC_MODE_DIRECT		_UL(0x0)
> +#define STVEC_MODE_VECTORED		_UL(0x1)

Nit: STVEC_MODE_MASK needs a third tab for its value to line up with the
other two (and with the surrounding #define-s).

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

