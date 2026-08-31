Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180A1C61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:48:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404018.1637969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11RN-000753-1a; Mon, 31 Aug 2026 12:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404018.1637969; Mon, 31 Aug 2026 12:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11RM-00074s-UK; Mon, 31 Aug 2026 12:48:44 +0000
Received: by outflank-mailman (input) for mailman id 1404018;
 Mon, 31 Aug 2026 12:48:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x11RL-00073N-Ke
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:48:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x11RK-002pbO-Tq
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:48:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd2094000c4f3@swg.vates.tech>)
 id 6a957827-e002-0a2a0a5209dd-0a2a4503ab1a-16
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:42 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd2094000c4f3@swg.vates.tech>)
 id 6a957827-fae8-0a2a45030019-b9ff1c22b055-4
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a057dd2094000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 12:48:24 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1EEA783CFC;
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
 q=dns/txt; s=selector1; bh=BYL8kIpKDarsUrP0O12A/cc5cfoGbL2BvOxhdgwIPHY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=HArNsmhHWDtqFNYvEgojbXnd0ZCo2ItZstC6LXMN8pWHFm6MLbgrdFDL6Yg/kuRos94zvlWjy
 kpLD3LcHKx2fa5Pe08iCAWOdltndc5/y58+ew9Axxh0/TRWprFR8dpbdVN0INWJcVViiBjV+Zrm
 YfiG7tWsYA1mry+573bYS+MKYzEO/L0I5p8A8WWCBOzPeQncCUtWZ0DDlxcXT1/HHv6fELsUYMS
 0rlm6UgyP4Am4aC90PG4038sL43X3rx0cRxtRr7VL/DkErSAQ+QPmFuuekL7+Okb6T3qHQ8foae
 H5nni6Dt05voi8yYGia03KUhen7f5NZUWNTIUpJSU9sg==
X-Zone-Loop: 9778d859340bd3b39004e0146d07adec767a7d1a60cc
x-campaign-type: default
x-transaction-id: 803cc469-1aab-4f1b-940b-64f44c70507e
x-swg-uid: 01-8b81e159-94e6-4b98-ac2e-0bc0346994ca
X-Mailer: Sweego
Message-ID:
 <1788180504.8631fc262581453bbf619ec5b2062170.1a057dd2094000c4f3@vates.tech>
x-swg-bid: 1788180504.8631fc262581453bbf619ec5b2062170.1a057dd2094000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 05/39] xen/riscv: request a G-stage flush on vmenter
 when VMIDs are disabled
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
In-Reply-To: <4274740481062ef92a76debd9c3f1e8371858735.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4274740481062ef92a76debd9c3f1e8371858735.1787838835.git.oleksii.kurochko@gmail.com>
Date: Mon, 31 Aug 2026 14:48:15 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788180503; l=1107;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=9F8n7O5utMtWiH5dWpQxZFCNADn2iY1DmbySFqvUTmQ=;
 b=hZOuO7rMToOUdW8iXgG3DjCdhzEcPc7E+zxAMRhY9fXKtK/ppXu5QTacg920Ple5WLOna/+fS
 OP+BAAwtYegCOzTyXnumqtsTfYk5uBMDMRTGbNbVS2LM13HCVdCJSfz
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788180504313
X-purgate-ID: tlsNG-33051d/1788180522-76EF74E9-F34D6F47/10/73395122804
X-purgate-type: spam
X-purgate-size: 1107

> vmid_handle_vmenter() reports that no flush is needed when VMIDs are
> unavailable (vmid=off, or hardware with no more than one VMID bit). Every
> domain then runs under VMID 0 with nothing flushed in between, so as soon
> as a hart runs more than one domain, a domain entered there can use the
> G-stage translations left behind by the domain which ran before it.
> 
> Adjust the comment in p2m_handle_vmenter() accordingly: skipping the
> VS-stage flush no longer relies on an old VMID not being reused, which
> doesn't hold when there are no VMIDs to begin with.
> 
> While at it, spell the other early return as a bool literal.
> 
> Fixes: bff3b9ea4696 ("xen/riscv: introduce VMID allocation and manegement")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>

FWIW this comment and p2m_handle_vmenter() itself get dropped a few
patches later in "implement vCPU context switching", which folds the
VMID claim into p2m_ctxt_switch_to(). The fix survives there via the
need_flush check. Is this patch really needed?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

