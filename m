Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF0AC61DD3
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:33:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401166.1636935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6u-0004kx-6G; Thu, 27 Aug 2026 15:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401166.1636935; Thu, 27 Aug 2026 15:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6u-0004kk-1u; Thu, 27 Aug 2026 15:33:48 +0000
Received: by outflank-mailman (input) for mailman id 1401166;
 Thu, 27 Aug 2026 15:33:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad47c000c4f3@swg.vates.tech>)
 id 1wzc6s-0004aq-F8
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:33:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzc6p-007bb9-T0
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:33:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad47c000c4f3@swg.vates.tech>)
 id 6a9058ce-e002-0a2a0a5209dd-0a2a450a9022-10
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:43 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad47c000c4f3@swg.vates.tech>)
 id 6a9058d7-f2d2-0a2a450a0019-b9ff1c23b221-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a043dad47c000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 15:33:29 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3D89F83B2C;
 Thu, 27 Aug 2026 17:33:29 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=fail header.s=selector1 header.d=vates.tech header.i="@vates.tech"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=3ZcO1+ssVslCiaCEuoWDFgkR6W22kC70bBnwQcv39oY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=cXAcVeo1nLcGEOkEthVJtxE2u3M9ZF9gjj9iWj8rWu1WMusMOxuYog25IJsxv1+nb+icB2JPU
 4sgykJora6yQMkyuDANVa6ASD4QNa9PIRY97FZqPTro8GNOoT8QU7uUiYGDE1LlTUzq8pe1olu1
 wFE/QowdLso/qW9DalIu8pzYcD6tRSo+AQcl7JVpNInxgx+2u7XJpURu4J9q/jTMpfTNUH8DmFd
 jjckC6/jHD7PNfpn+nZFewpd0XaBmpbIJUjbyNbA5TTd2m9mKbGFQEhWRG2sglTRfrFPgf9rPha
 uUUP9Nbcn4I0XATol5n41vYCUjpvc3G4BalhWUALX3AA==
X-Zone-Loop: a833fcdf142171ad69ff00ae894f0f5a15669006d7dd
x-campaign-type: default
x-transaction-id: b71bae0a-e38a-48c2-acd6-d17711936ae1
x-swg-uid: 01-319944b6-353e-41b7-b338-b7f66bb82921
X-Mailer: Sweego
Message-ID:
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad47c000c4f3@vates.tech>
x-swg-bid: 1787844809.8631fc262581453bbf619ec5b2062170.1a043dad47c000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: zhangzheng@iscas.ac.cn,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/5] xen/riscv: make Zihintpause no longer a required extension
Date: Thu, 27 Aug 2026 17:33:18 +0200
In-Reply-To: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787844809439
X-purgate-ID: tlsNG-4011c0/1787844823-51CC3CFC-FF162A8F/0/0
X-purgate-type: clean
X-purgate-size: 1006

required_extensions[] panics at boot if Zihintpause is missing, but Xen
never actually depends on it: cpu_relax() only emits the "pause" when the
extension is implemented and otherwise falls back to the raw fence
encoding, which is a legal no-op on any hart regardless of Zihintpause
support.

Drop it from required_extensions so hardware without Zihintpause
still boots.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/cpufeature.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 900cb9d772..661babc0a6 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -155,7 +155,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(h),
     RISCV_ISA_EXT_DATA(zicsr),
     RISCV_ISA_EXT_DATA(zifencei),
-    RISCV_ISA_EXT_DATA(zihintpause),
     RISCV_ISA_EXT_DATA(zbb),
 };
 

