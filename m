Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5291606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=iisYCXZu
Received: from list by lists.xenproject.org with outflank-mailman.1464926.1675862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSV8-000543-Jm; Thu, 29 Oct 2026 15:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464926.1675862; Thu, 29 Oct 2026 15:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSV8-00053w-GG; Thu, 29 Oct 2026 15:57:14 +0000
Received: by outflank-mailman (input) for mailman id 1464926;
 Thu, 29 Oct 2026 15:57:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18861278b000f79f@swg.vates.tech>)
 id 1xMSV7-00053q-BQ
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:57:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMSV6-00E8Vc-OR
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 16:57:12 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18861278b000f79f@swg.vates.tech>)
 id 6ae36ccc-e002-0a2a0a5209dd-0a2a45018772-34
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 16:57:12 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18861278b000f79f@swg.vates.tech>)
 id 6ae36cd8-5984-0a2a45010019-b9ff1c23b143-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 16:57:12 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a18861278b000f79f.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 15:57:10 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1600E832C2;
 Thu, 29 Oct 2026 16:57:10 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=4fxjre9W4OxxhMX8NL+oN0+7uYN+3E/sDoH0Rc5vRFc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=iisYCXZud8njodGagKZWDfZuaZdsy3obNRRU1dUsPqXk8E5l3tlmTVQq8ATHUcV1Eu/AfjjPq
 SyRaSj9TwvzZN/MjajlP5aI08QbQdPBlVywquKPZkJllmgJbbGi6wamucwU/woIz7mtgIu3UkEk
 V1XOxCwe383oP9DOrA9y6CezZNE6y3wETNhobDaQBWdK5lIjD154jc38LNw4POt04j56jE+ivsc
 5zLLEyA3HTjdSzVv9xQPapmDXqM+V9FL5zQZVVHnItBKWT4MTzps8XGCVOwtHQKlK59O+WTW9Yz
 ibhBbt7kDomAXP1hh84KehPQ1wCDIi7vDGqIKNOS4s5w==
X-Zone-Loop: 089cadbf958261dae9bb42de490bdfe6bb3fd2bbe75c
x-campaign-type: default
x-transaction-id: c1532ab9-1572-43a2-a24a-c69d81f5c672
x-swg-uid: 01-13d1de4f-4512-4982-8df7-c580ec02b9bd
X-Mailer: Sweego
Message-ID:
 <1793289430.8631fc262581453bbf619ec5b2062170.1a18861278b000f79f@vates.tech>
x-swg-bid: 1793289430.8631fc262581453bbf619ec5b2062170.1a18861278b000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 4/6] automation/qtb: add unit tests for the QTB
 framework
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <5ada3d12-5569-4e14-8178-815da3665a52@gmail.com>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a13b8000c4f3@vates.tech>
 <5ada3d12-5569-4e14-8178-815da3665a52@gmail.com>
Date: Thu, 29 Oct 2026 16:57:04 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793289424; l=996;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=TYRoyYTmSmpfttf3L21CE0J6kFhMJ4ZiyyLtahy1nEY=;
 b=3uImFNd147594FstrDt/TEW+ZzmZUGMwoWd7D4IzGWZqQ+cZEE6p+MG8noYDzAT4sW5RjaAEc
 V9fXl0vANuMAFDCkYADsSliUfuhbSYGuYTMajcWpMHmPnIQ98nWDXW9
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793289430180
X-purgate-ID: tlsNG-d62444/1793289432-BF66C757-6F2A364B/0/0
X-purgate-type: clean
X-purgate-size: 996
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-27 17:51 +0100, Oleksii Kurochko wrote:
> 
> 
> On 8/27/26 11:42 AM, Baptiste Le Duc wrote:
> > The QTB framework is meant to be extended: new test types, new machines and
> > new device trees aim to be added by other people.
> > 
> > Add pytest coverage of the framework's functions, and of the console-test
> > type's config validation and expect/retry loop, so that such changes get
> > immediate feedback and existing behaviour does not silently regress.
> 
> Nothing runs these tests, though: there is no CI job for them, and the
> container from patch 1 doesn't even have pytest. So the feedback only
> comes if whoever changes the framework has pytest and the QTB fork
> installed locally and remembers to run them.
Finally, I'll drop the unit tests patch in v3. They mostly help local
development of the framework itself, and CI never runs them, so carrying
that much test code in the tree isn't worth it.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

