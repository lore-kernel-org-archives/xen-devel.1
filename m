Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B08C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:32:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428998.1651927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91XP-0001RQ-EM; Tue, 22 Sep 2026 14:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428998.1651927; Tue, 22 Sep 2026 14:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91XP-0001RI-BY; Tue, 22 Sep 2026 14:32:03 +0000
Received: by outflank-mailman (input) for mailman id 1428998;
 Tue, 22 Sep 2026 14:32:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c987ccc300072c4@swg.vates.tech>)
 id 1x91XO-0001Qb-74
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:32:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91XN-00AGBX-HU
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:32:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c987ccc300072c4@swg.vates.tech>)
 id 6ab2914e-bab6-0a2a0a5309dd-0a2a4502c010-40
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:32:01 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c987ccc300072c4@swg.vates.tech>)
 id 6ab29160-6ca4-0a2a45020019-b9ff1c229031-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:32:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c987ccc300072c4.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 14:31:55 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 45626823B0;
 Tue, 22 Sep 2026 16:31:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=HqtEdkqWsTQdfBxLXjD47jIsUqZfqdpt8rlAnYFzdBM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=rAj7EUHLQsyYTDF9y6TZVz5957zAVnODoWbR4h/HHe4wH/3GJPs0PhwsgkBvRaDHjOoL/W1TB
 Wxt/YgSKERO2oCgtqEFn+Trk5zM7bwpGx0ZcP+T/8BcGTxc5uYaZYVLUaGX27fBF0TDKXjizrse
 FRTOKZ4dNfHRnhu8r0LNQ9ZMFCjHnCMtdOY0o+gltec3qTJ3z7bPfonz0EYXU9xxZzPc/XgH/65
 Sx5QcvJm12hgrrTB0y1GZwoe0HWcozWwe7TOhOYqii4BKuSsD18ER2wW8lh+XIbqtW/I0WeobY+
 FzPN14gLNPanFXJuadq3hwwxgEOX+zC4zr+FcXxwAjsA==
X-Zone-Loop: d4cdb94cf27f4badd58abfc1e5fc2bb063297568fba1
x-campaign-type: default
x-transaction-id: 232f421c-f8c2-4bbe-b4ad-d28a53ad27e4
x-swg-uid: 01-5515bba7-72f8-45a5-9148-c6474579c167
X-Mailer: Sweego
Message-ID:
 <1790087515.8631fc262581453bbf619ec5b2062170.1a0c987ccc300072c4@vates.tech>
x-swg-bid: 1790087515.8631fc262581453bbf619ec5b2062170.1a0c987ccc300072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC XEN PATCH 00/13] Running bare-metal tests with "pytest"
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
Date: Tue, 22 Sep 2026 16:31:47 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790087509; l=1456;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=S8sPD3/M/rDXTNp+0YSXenuDu8JcbKmbZCkHux2Y+Uo=;
 b=qnkto6tG416RUOjFhFrfd/Tqdcn7BtpnBRQZfVJBzzacViKD9ApBprb3yQHkRKw3AkqX77Zkv
 65q1/+hNTJGDBQjhRqaA/grP+GxhArJrVh0Lg65J3RlgPveRlRNfgKK
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790087514400
X-purgate-ID: tlsNG-720697/1790087521-307C22AC-A6FE1DE4/0/0
X-purgate-type: clean
X-purgate-size: 1456

> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> Patch series available in this git branch:
> https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.ci.bare-metal-with-pytest-v1
> 
> Hi,
> 
> I wanted to add some new machine to our GitLab CI, but I didn't want to
> duplicate yet another time the existing shell script. They are good to get the
> ball rolling but are getting harder to maintain as more test are been added,
> and don't share common code between machines.

Hi Anthony,

Nice to hear! I reviewed it quickly and it seems to be a more maintainable
solution to add machines in the CI.

FWIW the patch series I sent [1] also uses a python-driven framework (QTB)
which aims to replace the existing shell smoke test scripts. It's QEMU-only
though as it drives QEMU over QMP/qtest to manually trigger some IRQs. So,
it doesn't cover your usecase for the moment as-is and for the moment I
don't see a possible common abstraction between them but worth flagging.

Moreover, do you think we could replace the QEMU smoke-tests by using your
framework? With a very quick review, it seems we could just add a pytest
fixture machine_on_qemu(). If yes, then it would definitely be an overlap
with the usage of QTB I described above.

[1] https://lore.kernel.org/xen-devel/1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech/

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

