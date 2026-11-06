Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A19606A333
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=t3HH9Qem
Received: from list by lists.xenproject.org with outflank-mailman.1476610.1682630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPK53-0006mh-FZ; Fri, 06 Nov 2026 13:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476610.1682630; Fri, 06 Nov 2026 13:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPK53-0006ma-Ce; Fri, 06 Nov 2026 13:34:09 +0000
Received: by outflank-mailman (input) for mailman id 1476610;
 Fri, 06 Nov 2026 13:34:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b110fd2f000403d@swg.vates.tech>)
 id 1xPK52-0006mU-On
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 13:34:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPK52-0009DR-5L
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 14:34:08 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b110fd2f000403d@swg.vates.tech>)
 id 6aedd74d-e002-0a2a0a5209dd-0a2a4508ca2c-2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:34:08 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b110fd2f000403d@swg.vates.tech>)
 id 6aedd74f-f659-0a2a45080019-b9ff1c23adf1-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:34:08 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1b110fd2f000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Nov 2026 13:34:03 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E162A80971;
 Fri,  6 Nov 2026 14:34:01 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=ivQuQ+zm0jQ6y7VVQV/A9llywgQpwXwwjcyfirzrv0k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=t3HH9QemAXcybJF5+AbMJ71ijyILEShJID37L6N7d4vRixH2JE8mZBH0UCrvg0g1v25u7WlRw
 GNJkaoaVGvqYmsAEJQZL1KH9SD6Kl9JW5BdRDKTGjjYIn/TTWpEicjilSg2avKdZmxf7NQm5zZv
 ZqCKKanqHWJtRpix6c24WyO5Y3mHspG/JH5WdHHJcEtisoDLbeGcZ6V+ZaiTKtKxbdIplAw5gmw
 GxjnnOVWrCpH+LaOI4a/RWSCDLSjHzUyfTvh/JYcps37UCFOaxduIFDCf39dLNQwDJsyRHbTlno
 tek6+TIUMyzwycBdMSuyzKecz2h1G8hOjfGdJaKAfuJw==
X-Zone-Loop: 5443369efdf31c28f69f88b4603016c6834fe656a9e2
x-campaign-type: default
x-transaction-id: 28742125-24b9-4beb-9093-f3268cc07362
x-swg-uid: 01-2bceac34-d49b-4cad-8285-e55a6cf2a468
X-Mailer: Sweego
Message-ID:
 <1793972043.8631fc262581453bbf619ec5b2062170.1a1b110fd2f000403d@vates.tech>
x-swg-bid: 1793972043.8631fc262581453bbf619ec5b2062170.1a1b110fd2f000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 33/39] xen/riscv: restore register state in the new
 IMSIC VS-file
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <8a546a01-9d3f-4d63-bb56-658d635fed33@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <9e77a699eb6c99fa8f444d5777da189fdd30679e.1790779209.git.oleksii.kurochko@gmail.com>
 <1793724321.8631fc262581453bbf619ec5b2062170.1a1a24d1057000403d@vates.tech>
 <8a546a01-9d3f-4d63-bb56-658d635fed33@gmail.com>
Date: Fri, 06 Nov 2026 14:33:56 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793972036; l=1043;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Paap8PEvBwQhsPQcQwkXFl2ZD8bsv/KIxxpIa78GnrA=;
 b=s5QC1jvD9OxI3ruGMS6ZqshW52yw2F711zr84rHOrTlJxJTiijVrSWAKPBXEaKF/92r0vvBJs
 ylVTmVNkhyHBP72tKDrietmDrEgFtBuEt6Hx/KNHteIN9jXb7BTK8gy
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793972042128
X-purgate-ID: tlsNG-c1860d/1793972048-D5F4787B-F94DB0E1/0/0
X-purgate-type: clean
X-purgate-size: 1043
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-06 11:04 +0100, Oleksii Kurochko wrote:
> [ ... 13 lines skipped ... ]
> I don't think it's needed. The barrier is there so that nothing gets
> lost from the old file: once the extempore MSI sent to the hart of the
> old file has arrived, every MSI the APLIC sent towards the old file
> before the retargeting has landed there, so what's read out of the old
> file is complete.
> 
> MSIs sent after the retargeting go to the new file, and they can keep
> arriving at any time, including while the saved state is being
> restored, so an extempore MSI to the hart of the new file wouldn't stop
> them anyway: it would only tell that the MSIs sent before it have
> arrived. That's why the saved eip/eie bits are ORed into the new file
> rather than written to it, so that whatever lands there in the meantime
> is kept, and why eidelivery is restored last, so that the new file
> doesn't deliver anything until its state is complete.
> 
Ok it's more clear thanks!

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

