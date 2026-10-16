Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216C3CCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 12:04:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451737.1666646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgfM-0008Qu-1H; Fri, 16 Oct 2026 12:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451737.1666646; Fri, 16 Oct 2026 12:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgfL-0008Qn-Uy; Fri, 16 Oct 2026 12:04:03 +0000
Received: by outflank-mailman (input) for mailman id 1451737;
 Fri, 16 Oct 2026 12:04:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14498f2800008425@swg.vates.tech>)
 id 1xHgfL-0008Pc-2I
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 12:04:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHgfK-008OYn-F9
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 14:04:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14498f2800008425@swg.vates.tech>)
 id 6ad212a1-e002-0a2a0a5209dd-0a2a4509a838-46
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 14:04:02 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14498f2800008425@swg.vates.tech>)
 id 6ad212b2-be1a-0a2a45090019-b9ff1c22a5ff-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 14:04:02 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a14498f2800008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 12:03:56 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id BF879810D3;
 Fri, 16 Oct 2026 14:03:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=8CegonCPRnIDcdqQqeYqAwfUGNYDEcDqoO/Z/vNAn+8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ghAZ6qYqOueX6MoFFlePqWmC1gJdti/6JX0Nb1tZULUoU8ngSl7/0IIM5WC0jqEDlZCScsDcU
 OUf2rX3uNpXeP5kRuOOzUxNvKURD4WLO0twpMsoFMe0MSFAt6i1/dDrX9D8uVH/u9T3B/ZQIiXW
 Hm84IVlWz8LrP2ydwIUbri3QuEHjzys9EjiXbcDDHrn72lNkvRvmp2w1md31qkjwAodkP+VQTtA
 nlh65wimEtO8E8/Z/SXl4q3HGKL9PhUfQv3wEqS7kOuadOp/EMCoeOqIJ5U7kYQYj3dojEOENCI
 Mb8P41QEtZ3f6B1mtTUUqZaW4TgSpiUEPlupP3DJPkog==
X-Zone-Loop: 187b9b7ac314450860fdf3cbf6813cf0a68892a55e67
x-campaign-type: default
x-transaction-id: 6764cce0-239f-40bc-9612-08c977911d7f
x-swg-uid: 01-2d11916c-0084-4cb8-9fd4-e5745ca1581b
X-Mailer: Sweego
Message-ID:
 <1792152236.8631fc262581453bbf619ec5b2062170.1a14498f2800008425@vates.tech>
x-swg-bid: 1792152236.8631fc262581453bbf619ec5b2062170.1a14498f2800008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] tools/libxenstat: don't crash when /sys/class/net
 can't be opened
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Olivier Lambert <olivier.lambert@vates.tech>, 
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
 Juergen Gross <jgross@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1792151746.8631fc262581453bbf619ec5b2062170.1a14491762b0008425@vates.tech>
References: <20261016091259.1254879-1-olivier.lambert@vates.tech>
 <1792142036.8631fc262581453bbf619ec5b2062170.1a143fd4e9d0008425@vates.tech>
 <1792151746.8631fc262581453bbf619ec5b2062170.1a14491762b0008425@vates.tech>
Date: Fri, 16 Oct 2026 14:03:50 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792152230; l=555;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=UFvOl0JCuI5/lO+01x1fRLCuPTXzJn1Xfy4yNVhxkgE=;
 b=yA5po+7HmaOMdXLJgWLA3ASwfNVnB0eA4hlTPWnKqERtMe+g6xGH0OEAMsYvDCUs1kZW+mDWe
 03n21n2qVrZA/zJ3eSAvKteipsbOH7E8/SdQZnyJURDLKWm3Kzbfqfi
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792152235890
X-purgate-ID: tlsNG-bad1c0/1792152242-BEEDE034-CD63C806/0/0
X-purgate-type: clean
X-purgate-size: 555

On 2026-10-16 13:55 +0200, Baptiste Le Duc wrote:
> We might want a message telling it failed as it's already done in the
> file for SYSFS_VBD_PATH.
> 
> I'd propose:
> if (d == NULL) {
>     perror("Error opening /sys/class/net");
>     return;
> }
Please disregard my previous reply, it was a draft sent by
mistake...

Returning silently seems to be fine as missing /sys/class/net isn't fatal here.
Sorry for the noise.

So:
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

