Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA6ACCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 11:56:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451713.1666624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgXP-0005az-Qs; Fri, 16 Oct 2026 11:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451713.1666624; Fri, 16 Oct 2026 11:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgXP-0005ai-NK; Fri, 16 Oct 2026 11:55:51 +0000
Received: by outflank-mailman (input) for mailman id 1451713;
 Fri, 16 Oct 2026 11:55:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14491767c0008425@swg.vates.tech>)
 id 1xHgXO-0005YB-8g
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:55:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHgXN-001IJp-Lj
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 13:55:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14491767c0008425@swg.vates.tech>)
 id 6ad210bf-8faa-0a2a0a5109dd-0a2a450bb236-28
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:55:49 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14491767c0008425@swg.vates.tech>)
 id 6ad210c5-b7e8-0a2a450b0019-b9ff1c12a569-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:55:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a14491767c0008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 11:55:46 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id A12B581FEC;
 Fri, 16 Oct 2026 13:55:45 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=xZZNbyZ+czvI07FfZY6DzznwcrGBKtJULS1o7dY160Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ZguBwOmICuhHhqSPQqbv3zbAh05ttAniMnwE3VHjP/wbbTnru4BEoXHrGu2705Gljdc609OnW
 /6H38xO5Ab18muvwv+uIG6lTmShg2Fm+fLcH35uh7C1fmdJcO0q4CL9uY1JqachINYpvDgiMYz2
 Hr/AOqTCSGSxwa3VLQYjO0XulzWQhBuyCqY/ZoycC7/OhkcqXWnoOdw8gLjX9pyy+oHeAsvVg/n
 7obODvYgj1X7sBUJjJGu7CDldOCwCNl/VaMHrpV9wJc9npJuUZ9fSmNPzMmiA/v4cXkTHsFaAIk
 N2X/MT/pf2Dy++rcxmx5Yjn83/yk7aQ3iXvnMony+kAw==
X-Zone-Loop: 4a513f3a3c8016078a54ab79659a7eee90c424f3f4a5
x-campaign-type: default
x-transaction-id: f7b9289a-9ebb-462b-9379-887154be7c7a
x-swg-uid: 01-a3cb9b82-db06-455f-9aa9-ee6bda0336fe
X-Mailer: Sweego
Message-ID:
 <1792151746.8631fc262581453bbf619ec5b2062170.1a14491767c0008425@vates.tech>
x-swg-bid: 1792151746.8631fc262581453bbf619ec5b2062170.1a14491767c0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/3] tools/libxenstat: don't skip the /proc/net/dev
 check after a failure
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Olivier Lambert <olivier.lambert@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1792142037.8631fc262581453bbf619ec5b2062170.1a143fd533b0008425@vates.tech>
References: <20261016091259.1254879-1-olivier.lambert@vates.tech>
 <1792142037.8631fc262581453bbf619ec5b2062170.1a143fd533b0008425@vates.tech>
Date: Fri, 16 Oct 2026 13:55:37 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792151740; l=686;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=1Ytk61/2hnHD2bxr52O9HptTHEIV25XZQV0sVKT6fM8=;
 b=EqxN5f/tuz+aOHlzZ1dY4CojTUqKXN/ppzWMkoXMg9uNRn8/XbE05XFWyF+yxcAc/SRbNQl+x
 drJ/ONi2pxtDJwXqxa3kTd41n/N9czsmU6KY4SuAXTYStA6AfzlVHtL
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792151745742
X-purgate-ID: tlsNG-42698a/1792151749-2C39B9EA-36D2852F/0/0
X-purgate-type: clean
X-purgate-size: 686

On Fri, 16 Oct 2026 09:12:58 +0000, Olivier Lambert <olivier.lambert@vates.tech> wrote:
> xenstat_collect_networks() opens /proc/net/dev once and validates its
> header before using it. If reading the header fails, or the header isn't
> the expected one, an error is returned but the stream is left open in
> priv->procnetdev. The next call then finds the stream already open,
> skips the validation and parses the file anyway.
> 
> Close the stream and clear the pointer on both error paths, so that the
> validation is done again on the next call.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

