Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F907CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:02:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440682.1658102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWT-0001yY-8D; Mon, 05 Oct 2026 10:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440682.1658102; Mon, 05 Oct 2026 10:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWT-0001yR-5Z; Mon, 05 Oct 2026 10:02:17 +0000
Received: by outflank-mailman (input) for mailman id 1440682;
 Mon, 05 Oct 2026 10:02:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDfWR-0001yL-4E
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:02:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfWP-002GHJ-Tc
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:02:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b837ff10003f66@swg.vates.tech>)
 id 6ac3759c-e002-0a2a0a5209dd-0a2a450ceb36-40
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:13 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b837ff10003f66@swg.vates.tech>)
 id 6ac375a5-f479-0a2a450c0019-b9ff1c22b207-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10b837ff10003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 10:02:09 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 54EE88229F;
 Mon,  5 Oct 2026 12:02:07 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=dzKwTJHgZhQq/BxCj2Ch5XAbAk/yxL8Vev/V87WiPss=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=QGpbZ4kgaNbPifbWbXVMe1g263J/0qwB8GVVZbC0Dtpe94S/vaY9OvrosA51qEvrPmIJmJByJ
 waoAjFkhKUXgr8pNqGRgLMr3VhkjlezLCtEKXMHl+vGXjCaflMPHplMI2jFfWucXa2kOQOkksZo
 LrMtQrfi0kO56Cj7aWWSaBkigA7wkJFmuJDHm5gVrOLApx2u/pSwqkDZa7vIyma1IH39xn7tekg
 Y/mCb8v13yI0WtLWLfjJARUM9fpQdqBMhNKzpfTs32T/tHj+UiFy2FrOcNs9rPOP/78kTXDPa98
 q9K2cZYtwviS4x3p/7mHjk8omZ9qpGGCxdn2tnQn7QmQ==
X-Zone-Loop: 5900a23c0f74a3b87b5a2a4278e11bf185031eeee765
x-campaign-type: default
x-transaction-id: 540bbe92-4212-431f-bfd8-1537fd12dc6b
x-swg-uid: 01-a2512732-6d35-4606-838f-093dad696ad5
X-Mailer: Sweego
Message-ID:
 <1791194529.8631fc262581453bbf619ec5b2062170.1a10b837ff10003f66@vates.tech>
x-swg-bid: 1791194529.8631fc262581453bbf619ec5b2062170.1a10b837ff10003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 01/39] xen/riscv: drop INSN_{16,32}BIT_MASK and
 report unknown instruction lengths
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
In-Reply-To: <f3c8b78cd0bbbebf51892c56967a12cb8ea6c226.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <f3c8b78cd0bbbebf51892c56967a12cb8ea6c226.1790779209.git.oleksii.kurochko@gmail.com>
Date: Mon, 05 Oct 2026 12:01:55 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791194522; l=780;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Zy50qDdvgBxA615NzC8TUXxN0sx3/zqTlwskflTilTc=;
 b=avADzk2a5am31h7sntL9qx9PQTucIGhuddIjE5lZC4Nozu2yX7cP6bTU7gY+8apv2yU06hYl/
 uSlyiEt1HAFCO4ydiVgo9sqtXmpCmVYcZDPwrfzpWEo+IXOfos2YbP6
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791194527553
X-purgate-ID: tlsNG-d25034/1791194533-778D5A5B-F0B75FB3/10/73395122804
X-purgate-type: spam
X-purgate-size: 780

On Wed, 30 Sep 2026 18:18:43 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> Both constants were inherited from OpenSBI and their names are misleading.
> The length of an instruction is encoded in its low bits: bits[1:0] != 11
> means 16 bits, otherwise bits[4:2] != 111 means 32 bits, and anything else
> is 48 bits or wider. 0x3 and 0x1c are the patterns compared against in
> these two tests, not masks selecting a 16-bit or a 32-bit instruction. As
> each constant is needed in one place only, once INSN_IS_16BIT() and
> INSN_IS_32BIT() encapsulate the tests, drop them and spell the values out
> in those two macros instead.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

