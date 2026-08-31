Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81539C61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:48:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404021.1637978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11RQ-0007NS-C9; Mon, 31 Aug 2026 12:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404021.1637978; Mon, 31 Aug 2026 12:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11RQ-0007NJ-8G; Mon, 31 Aug 2026 12:48:48 +0000
Received: by outflank-mailman (input) for mailman id 1404021;
 Mon, 31 Aug 2026 12:48:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x11RP-0007KJ-Ap
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:48:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x11RO-004rdd-No
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:48:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd21b7000c4f3@swg.vates.tech>)
 id 6a957829-8faa-0a2a0a5109dd-0a2a4502a580-20
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:46 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd21b7000c4f3@swg.vates.tech>)
 id 6a95782e-6ca4-0a2a45020019-b9ff1c239983-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a057dd21b7000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 12:48:25 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6709983D11;
 Mon, 31 Aug 2026 14:48:24 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=EU58JJLCvXVx1GxdwebNIYsQ3lWzkYuYQLbcX+qLxPo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=TddoKn17PjxGSBKGfZgypCNYEIH+KriQdoDIYHjPDJPkhOLqR1k3/n/xrbI2TSydHdG2EwzXN
 /Gvvriq+08faKZSJKHnvSQgxj+GpT+beYfRF35oY6O0sysrHTuchRXAaRVKJ8gYGzUea4Erh7U2
 2r2ONFqtxGgo5LVwwCw4+3fgqEsKqGp8nuVqsbNHyuCgjCNkgY+q5dTCzDBC5CtDWjZtm21L0bU
 q/KR2PlnDANVRVEh5A3qR1VU2DytPyh50RG+s6Q/YtWaF4sa9eXywv3BgQRpHynVmCeJA+w+lnl
 H4dW/JgMDW72D1+2nNE7n29lWCl+G47etoubaDP5LuSA==
X-Zone-Loop: e6c0e597627ac26b4ff3206d1dab75f405f52a06e8a2
x-campaign-type: default
x-transaction-id: 20d82833-b03d-45e5-b417-d56228534914
x-swg-uid: 01-513c35e3-3827-44d3-a7a4-e788e1936b75
X-Mailer: Sweego
Message-ID:
 <1788180505.8631fc262581453bbf619ec5b2062170.1a057dd21b7000c4f3@vates.tech>
x-swg-bid: 1788180505.8631fc262581453bbf619ec5b2062170.1a057dd21b7000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 06/39] xen/riscv: use UINT64_MAX to disable the
 VS-timer
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
In-Reply-To: <93829c39b080d288ea342c7375d5307f93ee9a29.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <93829c39b080d288ea342c7375d5307f93ee9a29.1787838835.git.oleksii.kurochko@gmail.com>
Date: Mon, 31 Aug 2026 14:48:15 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788180503; l=708;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Jwfnu6razQ4bDNZSR29qomKftwxGzGfH1a367r1gOQU=;
 b=7pU8NJnOOoo/qWl7N7HNQEL2ds1yjg1c/wiPlipBDNgHZWlPyCGldthSiJZHpZUwvdhoA0XxX
 zm7/JPXzG0FD0K63kfz2fOWf/nBzXa3sGXmQhOohdj1wUptKhB25CIy
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788180504609
X-purgate-ID: tlsNG-720697/1788180526-323D42AC-24D9B30D/10/73395122804
X-purgate-type: spam
X-purgate-size: 708

On Thu, 27 Aug 2026 17:20:50 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> vstimecmp is a 64-bit CSR independently of XLEN, which is why it is
> written with csr_write64(). On RV32 that macro splits the value into
> the vstimecmp/vstimecmph pair, so passing ULONG_MAX (0xffffffff there)
> writes all ones to the low half and zero to the high half, leaving the
> CSR at 0x00000000ffffffff rather than at its maximum. A VS-timer irq
> would then become pending as soon as (time + htimedelta) reaches 2^32,
> which is exactly what the code is trying to avoid.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

