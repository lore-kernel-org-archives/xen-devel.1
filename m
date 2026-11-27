Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA57606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=i9oDAemR
Received: from list by lists.xenproject.org with outflank-mailman.1505054.1700033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvnd-0007EO-EC; Fri, 27 Nov 2026 13:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505054.1700033; Fri, 27 Nov 2026 13:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvnd-0007EH-BE; Fri, 27 Nov 2026 13:15:37 +0000
Received: by outflank-mailman (input) for mailman id 1505054;
 Fri, 27 Nov 2026 13:15:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d259bfe000bb85@swg.vates.tech>)
 id 1xWvnb-00071x-Lt
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:15:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWvnb-001Vcr-21
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 14:15:35 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d259bfe000bb85@swg.vates.tech>)
 id 6b09826e-2eae-0a2a0a5409dd-0a2a4508c26e-32
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 14:15:35 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d259bfe000bb85@swg.vates.tech>)
 id 6b098276-f659-0a2a45080019-b9ff1c128477-4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 14:15:34 +0100
Received: from localhost
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d259bfe000bb85.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 13:15:33 +0000
Received: from [192.168.1.72] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2FCBF8346D;
 Fri, 27 Nov 2026 14:15:33 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=Bu2Gnql/TCsQcTOH3Bub0JMJuZlg24xQJKlkp/xVy4E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=i9oDAemRh9LtvzCE/Pv4gYLOYlulRgxFJT5m7Hv4pvxpFy6UyHHBDO6peZ2JyJWPWnIaY2Q/M
 74lS2IOjGk0IMHQErGhy7kTICkBXVbM0KpR0q56ZSVXK86Varr3w400FCZP7lG7RczbF/IbNg2n
 CLwPmhPEfAomq/qnxixygAnJh+syCqOxGP/+avKMxqf4ZRBm4bjkYdKsmjcZ1M1fCZwGXdsJ7qo
 TO8Rd4XKlQpsIM9WyMy6V43S6xgRKhI8BONTdVoOLZJA4fKozVxx+04+qTs8Ec503pkYH+X9Zli
 KyoI1Wy8BlWjnD95hthi7y25tvsTCEYLs0mhGD4etIQQ==
X-Zone-Loop: 2fde0ed4abf32f40e24e6513dcba599679cda717c4c7
x-campaign-type: default
x-transaction-id: 49707f84-ca91-4b8f-93af-3d3093f542b0
x-swg-uid: 01-4b97fd19-ee33-4e2e-b13c-066692841156
X-Mailer: Sweego
Message-ID:
 <1795785333.8631fc262581453bbf619ec5b2062170.1a21d259bfe000bb85@vates.tech>
x-swg-bid: 1795785333.8631fc262581453bbf619ec5b2062170.1a21d259bfe000bb85
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] xen/riscv: implement udelay()
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
Cc: xen-devel@lists.xenproject.org, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, andrew.cooper3@citrix.com, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, roger@xenproject.org, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <MA0PR01MB92176C8ABCF9CDCDD772D4C9FD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
References: <MA0PR01MB92178FEAFBB95A225781351CFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <MA0PR01MB92176C8ABCF9CDCDD772D4C9FD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 27 Nov 2026 14:15:25 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795785327; l=1313;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=qqZlj1uvwXXdx7uZvcUQYd80GhYTLDslh5PA/PV5Jn4=;
 b=sdS2dm/Ac00gKVlOIPfhOKMSvzWOuDFDsGGa6BDR3xgkpUT3GiILdib4zzpbUhmMjjDg6RZUe
 SgFTfe4CBPNDJGOBBYRQWIbrNSuj3qE3kbJn+s5dZQS5pb/AB5b1OKb
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795785333382
X-purgate-ID: tlsNG-c1860d/1795785335-D5D4887B-5FFA8361/0/0
X-purgate-type: clean
X-purgate-size: 1313
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> udelay() is still a stub that hits BUG_ON(), so mdelay() can't be used
> on RISC-V, for example to honour the delay in machine_restart().
> 
> Busy-wait on the time CSR instead, as Linux's RISC-V __delay() does.
Instead of what? Maybe:

  Implement udelay() by busy-waiting on the time CSR, as Linux's RISC-V
  __delay() does.

> Convert the delay to timer ticks once, multiplying before dividing and
> rounding up so that short delays aren't cut to zero ticks, then spin
> until that many ticks have passed.
> 
> cpu_khz is only set by preinit_xen_time(). Before that it is 0, so the
> tick count is 0 and udelay() returns without waiting. This is also why
> the loop doesn't use get_s_time(): it divides by cpu_khz, which is a
> division by zero before then.
> 
> Assisted-by: Claude
Nit: according to sending-patches.pandoc the form should be Assisted-by:
AGENT:MODEL, e.g. "Assisted-by: Claude:claude-opus-5-5".

> [ ... 33 lines skipped ... ]
> +
> +void udelay(unsigned long usecs)
> +{
When cpu_khz is 0 there is nothing to wait for, so there is no need to
compute ticks or read the counter. Wouldn't an explicit early return be
clearer? It would also make the comment unnecessary:

    if ( !cpu_khz )
        return;

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

