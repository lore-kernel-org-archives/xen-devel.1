Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410C0C98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 16:06:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431000.1653395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PUX-0003Q3-Uy; Wed, 23 Sep 2026 16:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431000.1653395; Wed, 23 Sep 2026 16:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PUX-0003Pw-Rn; Wed, 23 Sep 2026 16:06:41 +0000
Received: by outflank-mailman (input) for mailman id 1431000;
 Wed, 23 Sep 2026 16:06:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9PUX-0003Pq-62
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:06:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9PUW-006syD-JE
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 18:06:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cf04c50000072c4@swg.vates.tech>)
 id 6ab3f90b-bab6-0a2a0a5309dd-0a2a4505baf4-10
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:06:40 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cf04c50000072c4@swg.vates.tech>)
 id 6ab3f909-4cb1-0a2a45050019-b9ff1c23ab2b-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:06:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0cf04c50000072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 16:06:31 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id ACA7E821D0;
 Wed, 23 Sep 2026 18:06:30 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=5u/eTcreG0QuSFd8jlByPhWAmd+FFBURn7FziJ9iuu0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=i11TWXyTj0jn3qxDhBlH7xxNRDkI2HLqyjkjlRebnCn6k5cZbePmCA9B7mZeVeDB95dppfAWh
 dVTapgGyQCGcKGzMzVsFlqgB1HV08kV2rlZK/0SipeuZXYUw6LhyKIYPorB8V7L6w1+x3fftL9/
 z+d+21IlQ7+jEkq+srlUgdqCG7FjroVGi52KIDsG+TMeibbAlsHZ1OW0mDf6FvXH6oQ8e0KnUwy
 x3KFhLZ7AaBhR+xnXk2O699s4CM8CAN+x8SEKhvj2HURoQbfYB1qN+p9CohuzIr4Jip1MQXmb1I
 VLRu0v1kUTYsfkn2wQ7wMyJqgHxjHMm1I/8i2kL8WsVA==
X-Zone-Loop: e935b0beecb51268a1416fa808eacdf764709d38514e
x-campaign-type: default
x-transaction-id: 13b6e8c1-b990-478a-b1ee-b0d445f207f6
x-swg-uid: 01-2a7a0b0f-3dc0-4fe1-803b-40d12bb98007
X-Mailer: Sweego
Message-ID:
 <1790179591.8631fc262581453bbf619ec5b2062170.1a0cf04c50000072c4@vates.tech>
x-swg-bid: 1790179591.8631fc262581453bbf619ec5b2062170.1a0cf04c50000072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 35/39] xen/riscv: add basic VGEIN management for AIA
 guests
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
In-Reply-To: <b84c2624e2f49e99a5f29439f4f01608eb1e5825.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b84c2624e2f49e99a5f29439f4f01608eb1e5825.1787838835.git.oleksii.kurochko@gmail.com>
Date: Wed, 23 Sep 2026 18:06:24 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790179585; l=740;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=uXGs7KNYpvWbIOpxJBme/LyIpHdLhTjkO3HtjDwp5qM=;
 b=H6Mfte2NnQxdD5KuI5HYIT/UOwlFIE0Vq7vOSBV66qaCPhgG1lPaDGhEV2ydmp+JdlrjYPNmN
 ipPRoDUQvgaBrV9kRvSh1DLqQdS5KWUANlfsWXA8gmbN81Agw4raqEq
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790179590920
X-purgate-ID: tlsNG-c201ff/1790179593-F76BD2A1-DC12BC13/10/73395122804
X-purgate-type: spam
X-purgate-size: 740

On Thu, 27 Aug 2026 17:21:19 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> It was decided to add support for IMSIC from the start instead of having APLIC
> operate in direct delivery mode, as it requires a trap-and-emulation approach,
> which is not optimal from a performance standpoint.
> 
> AIA provides a hardware-accelerated mechanism for delivering external
> interrupts to domains via "guest interrupt files" located in IMSIC.
> A single physical hart can implement multiple such files (up to GEILEN),
> allowing several virtual harts to receive interrupts directly from hardware.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

