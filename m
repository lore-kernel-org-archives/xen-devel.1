Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DFEC61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:48:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404017.1637960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11RI-0006o5-QW; Mon, 31 Aug 2026 12:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404017.1637960; Mon, 31 Aug 2026 12:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11RI-0006ny-Nb; Mon, 31 Aug 2026 12:48:40 +0000
Received: by outflank-mailman (input) for mailman id 1404017;
 Mon, 31 Aug 2026 12:48:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd1f6a000c4f3@swg.vates.tech>)
 id 1x11RI-0006n0-0L
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:48:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x11RH-004rdd-D3
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:48:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd1f6a000c4f3@swg.vates.tech>)
 id 6a95780b-8faa-0a2a0a5109dd-0a2a45038ce0-48
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:39 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd1f6a000c4f3@swg.vates.tech>)
 id 6a957827-fae8-0a2a45030019-b9ff1c22b055-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:39 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a057dd1f6a000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 12:48:24 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C7F4783D12;
 Mon, 31 Aug 2026 14:48:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=iTP7ioyiuATUIOtbT9vPJpbBDNJoX+0JSHEIbgOw2Hw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=JaswFGLLToKfd0RSNrpGUlco8cE66FfSTneenwBeaNsPVUWPHamB7WCR/7fD/ilor66V1smP8
 eqO6JGEqImq9AdrhN6MI4h7xMk6T44MEVB06WGOcHkbcOUE3nttgavIsfngZFgSPVDS61YR2tgZ
 sB4mFPs3JH/P1x3HJ43jtYXmEaYL+7wLMWzGYyMrP+FyBCNOEv4q82oL6qom0a9rDiSN+orL3gs
 eAP5INk4sqpPiA3Tur8YIrlIDVgivm9KwlfC0BQUPk55OmDQos5OWg3MFirUfXZwxXT6A5qw09T
 vIq9JSRbEnSz3PemSd77zyX/omdc3GS9+eHMkh2DWyOQ==
X-Zone-Loop: 2a7af4e8af5dc6d3bb48e3ff4db57c1a9dc2e93edd2b
x-campaign-type: default
x-transaction-id: d09dcaa4-28bb-4801-8fbf-5e912842dbe1
x-swg-uid: 01-600da7e0-382e-4434-863b-7efce76a03f4
X-Mailer: Sweego
Message-ID:
 <1788180504.8631fc262581453bbf619ec5b2062170.1a057dd1f6a000c4f3@vates.tech>
x-swg-bid: 1788180504.8631fc262581453bbf619ec5b2062170.1a057dd1f6a000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
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
In-Reply-To: <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
Date: Mon, 31 Aug 2026 14:48:15 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788180503; l=980;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=KqinoC4UhW8MbyNZhyMxvV8DmBrnVN090FPgL6BPSgw=;
 b=FIYkApEwUxHaH64nkW+C7dK5ibTPmXX7IMQM83uSasteyTPXdsAS2Myc830ASA57CAw5wlQ0k
 1KayuXfqDabBOtxaGededP6bb4wLp3Cn0Xe+D/kaUkv+EgJOCSECUpK
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788180504018
X-purgate-ID: tlsNG-33051d/1788180519-764FC4E9-2842D15E/0/0
X-purgate-type: clean
X-purgate-size: 980

> hstatus.VSXL is WARL, so its reset value is implementation-defined. Xen
> supports 64-bit guests only, so program it explicitly instead of relying
> on whatever the hardware happens to leave there.
> 
> This matters beyond the guest's own view of itself: decoding a trapped
> instruction depends on the effective XLEN of the guest, as the encodings
> which exist for XLEN=64 only must not be recognized for a 32-bit one.
>
It's not clear which instruction "decoding a trapped instruction" refers
to without more context. I assume you mean decode_ldst_insn() in
emulate.c, but the patch introducing that function comes later in the
series, so this isn't obvious on a first read.

Please reorder the series so this patch follows the one introducing
decode_ldst_insn(), or reference it explicitly in the commit message
(e.g. "load/store trap emulation, introduced later in this series in
emulate.c, needs...").

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

