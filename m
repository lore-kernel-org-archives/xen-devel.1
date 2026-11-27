Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCBE606A31F
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=CoB3vL32
Received: from list by lists.xenproject.org with outflank-mailman.1505053.1700024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvnc-00072A-8j; Fri, 27 Nov 2026 13:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505053.1700024; Fri, 27 Nov 2026 13:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvnc-000723-5K; Fri, 27 Nov 2026 13:15:36 +0000
Received: by outflank-mailman (input) for mailman id 1505053;
 Fri, 27 Nov 2026 13:15:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d259ada000bb85@swg.vates.tech>)
 id 1xWvnb-00071r-03
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:15:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWvna-001Vcr-CX
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 14:15:34 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d259ada000bb85@swg.vates.tech>)
 id 6b09826e-2eae-0a2a0a5409dd-0a2a4508c26e-24
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 14:15:34 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d259ada000bb85@swg.vates.tech>)
 id 6b098276-f659-0a2a45080019-b9ff1c128477-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 14:15:34 +0100
Received: from localhost
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d259ada000bb85.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 13:15:33 +0000
Received: from [192.168.1.72] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id ADF108346B;
 Fri, 27 Nov 2026 14:15:32 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=ZxibhSQ5K1qVUPt1oUVM82wGGKoc4ldEa9BNWu1IXqc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=CoB3vL32snNnetSIWLERfj1QJyTADT1pxUDhwX+Hr9gh/VxFIq19aaI6S4gfcADTLB5bgQ5Uq
 RMwJhtGVlpjqhy/TkLYp0n0fgq55JSsS+j9er+2xl5HIf4N5LazKUXFQ2m5xw2DF5sWO09GXSEo
 jcdo7p07Tj5dZWrt2uA1BDlSnjWDG9pWYY6IDlBrcQi+hqfKHVMSwWXkjWAM2TPjkwGjIfOVn82
 xPWZn7N+HkvjZMFYIUVoOXnRt9WmQ0AZ45ZPRd4kMw0RXfZpWE5cviDKDuNtXKoWVA0sDJrpGII
 ukvmvin51LT+UpImdUEJUM5Y/AvP4hUkV0y4OWqT3iQw==
X-Zone-Loop: 9008235bbe4f470795ecb5125fcb4d3352a0e8818f96
x-campaign-type: default
x-transaction-id: e5333113-e0ac-4b0e-a117-ec8c19361318
x-swg-uid: 01-2015d6e2-4e14-4332-904a-dbeb43455447
X-Mailer: Sweego
Message-ID:
 <1795785333.8631fc262581453bbf619ec5b2062170.1a21d259ada000bb85@vates.tech>
x-swg-bid: 1795785333.8631fc262581453bbf619ec5b2062170.1a21d259ada000bb85
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/2] xen/riscv: make machine_restart() reboot
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
In-Reply-To: <MA0PR01MB92178FEAFBB95A225781351CFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
References: <MA0PR01MB92178FEAFBB95A225781351CFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 27 Nov 2026 14:15:25 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795785327; l=995;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=lpKVGIzT5gULCrpoP7og0Io7gQK9EQ1WH1wIppFbrYs=;
 b=KVIfnE35j3gq2IH4MrVyNYfE8Lhh0wYMxNhtzPC/IfpXcpDmKg3nlrrJTuUWQp3ypZ15+82vs
 dTJf4QYNK63CIm3eDRwcDZmsaa3OvNb56oLbLlVhmfeWsMnt0xUNQFc
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795785332905
X-purgate-ID: tlsNG-c1860d/1795785334-CC37587B-471725D2/0/0
X-purgate-type: clean
X-purgate-size: 995
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello!
First of all, thanks for contributing on Xen for riscv!
> On RISC-V, machine_restart() ignores its delay and powers off instead
> of rebooting, so a panic's "Reboot in five seconds..." ends in an
> immediate power-off.
> 
> Patch 1 implements udelay() using the time CSR, as Linux does. Until
> the timebase frequency is known, it returns without waiting.
> 
> Patch 2 uses the SBI SRST extension, when present, to reboot after the
> delay. Without SRST, it falls back to the legacy SHUTDOWN call as
> before, now after the delay.
> 
> Side effects:
> - A panic that recurs early in every boot (e.g. "-cpu rv64,svpbmt=off"
>   on QEMU virt) is now a reboot loop. "noreboot" still powers off.
> - A panic in the RISC-V QEMU smoke test now reboots until the test
>   times out. I can add -no-reboot to its QEMU command, as the Arm
>   smoke tests do, if that's wanted.
I'm ok to align with x86 and arm on that point.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

