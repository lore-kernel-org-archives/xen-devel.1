Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1A4C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 08:26:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407982.1640732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PFk-0002Wn-H8; Fri, 04 Sep 2026 08:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407982.1640732; Fri, 04 Sep 2026 08:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PFk-0002Wg-Dj; Fri, 04 Sep 2026 08:26:28 +0000
Received: by outflank-mailman (input) for mailman id 1407982;
 Fri, 04 Sep 2026 08:26:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2PFk-0002WQ-0L
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:26:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2PFj-00CrZn-DK
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:26:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06b86a1b8000c4f3@swg.vates.tech>)
 id 6a9a80af-e002-0a2a0a5209dd-0a2a4509e954-22
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:26:27 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06b86a1b8000c4f3@swg.vates.tech>)
 id 6a9a80af-be1a-0a2a45090019-b9ff1c22a197-4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:26:27 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06b86a1b8000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 08:26:20 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id AE42083EF6;
 Fri,  4 Sep 2026 10:26:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=uK5ssj6GpBmwGJQocmA+QQydMx24xNl2C3C29UcyLJw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=BIaVidTGEp22bsV0ujXKn5aF2pLkrHwPO3j3jq0qp3QaBC8rDTOPfvR4KFncu1ey35WzHuiOT
 xELLwAlTz/lsomqbn6ykbIc6j/NmnhjGDoA51hfaROMSVlkTx76lcIZ3wCy3ITnfMm930qvZmkA
 Vs/RI+rJ0OnVjf+ncOcHA6cmYFBtN0/JgLtGUyvoYQEKHYCow3Ccy8zHVA1IpP7V8acX+PebCpu
 hJGZPI0euw7/Ub5bRaoMcLGamtNzNfgX80VjUccBGLX+QvjOEZDf0l70OBXexOVljS3SCVBw6ef
 VCJJ+6dCpu2EZDgs2SM9Q6YCOo7sPWFRg5gV9+RMV0Xg==
X-Zone-Loop: 18daa6696dff19677b713ab9a44279c7ded1d8d12852
x-campaign-type: default
x-transaction-id: d0309d52-d650-46a8-bd5d-dd829adf7c19
x-swg-uid: 01-ad0e47da-da9e-46e0-857d-3debd6d9e305
X-Mailer: Sweego
Message-ID:
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a1b8000c4f3@vates.tech>
x-swg-bid: 1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a1b8000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 11/39] xen/riscv: add helper to check APLIC MSI mode
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
In-Reply-To: <a36ddb794b06ec9b7c470d9e665126989f4db58a.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a36ddb794b06ec9b7c470d9e665126989f4db58a.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 04 Sep 2026 10:26:10 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788510379; l=262;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=dT3s7B8xtuYVtvd7ntSCK0uqqprh/09O2WPOIyXe3Ms=;
 b=tpDz1fSTZmduBK8X4S7IjAucgJaHEMa79Nl5wRycJuB5PffoFDAZb/1376jXWcwD9J7OgA4V4
 MbbJZcjwPEKCuoRYqtwxhc7vqbtmERcowgQI2w4o1KlDhjjGYbRZRnp
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788510379912
X-purgate-ID: tlsNG-bad1c0/1788510387-FD06B034-1DFE4EBB/10/73395122804
X-purgate-type: spam
X-purgate-size: 262

On Thu, 27 Aug 2026 17:20:55 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> Use convient helper instead of open-coding the things.

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

