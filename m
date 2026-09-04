Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBDFC624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 09:53:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408081.1640786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2QbI-0002tR-MQ; Fri, 04 Sep 2026 09:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408081.1640786; Fri, 04 Sep 2026 09:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2QbI-0002tK-Je; Fri, 04 Sep 2026 09:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1408081;
 Fri, 04 Sep 2026 09:52:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06bd5af1a000c4f3@swg.vates.tech>)
 id 1x2QbH-0002t2-5X
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 09:52:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2QbG-000Gro-IY
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:52:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06bd5af1a000c4f3@swg.vates.tech>)
 id 6a9a94e5-2eae-0a2a0a5409dd-0a2a4501eb44-22
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 11:52:46 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06bd5af1a000c4f3@swg.vates.tech>)
 id 6a9a94ee-5984-0a2a45010019-b9ff1c12ab33-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 11:52:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06bd5af1a000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 09:52:41 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6082681E3D;
 Fri,  4 Sep 2026 11:52:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=oh0Pic75LjmuMBRY5biuLPlwwJnSlqaRYHrkWEjVNhc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=QKihKJvtPGI3dZp1oxHr+iaZgTSgFor/CpM9eLxq2aZU3YSJe9L5kkYDGQhA3VWoKm44h34/9
 TO3bbbpHi9HHykVUAwzLkdlsthecCcvoMKXB1FYxTZdBHYBGM2rQLmDOEt+aU3bCqyXn60J9498
 Vje5Eu6rHZXKa5HR+sZhEJXlmsSqyTQaCwcD9m5NMuz07OIeGykj83aEs6luYmMsd4SFmrxus5T
 Qdj3rMR+FV4vJMvZXo+X7a9FlRPgxl05qGtcUZ2eqx/7M4uQO9+eJHWLp2bqPkl6d9W8ttKFI8L
 5As9zpZT7Tom+rveSHHxCNeOP8xCHiVCxrJDrc2RINFw==
X-Zone-Loop: 0f46c0819f053f1bbe06fc4eefee6dc1131ef80c9cfa
x-campaign-type: default
x-transaction-id: 0ef9cccf-d8bb-4d1f-ae69-56b1e2f1a5b3
x-swg-uid: 01-d34b1307-53de-4127-b984-65510d0b9bc4
X-Mailer: Sweego
Message-ID:
 <1788515561.8631fc262581453bbf619ec5b2062170.1a06bd5af1a000c4f3@vates.tech>
x-swg-bid: 1788515561.8631fc262581453bbf619ec5b2062170.1a06bd5af1a000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 13/39] xen/riscv: save and restore AIA state on vCPU
 context switch
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
In-Reply-To: <32e8b81fd276498cfd339defd2720bce1745c1cf.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <32e8b81fd276498cfd339defd2720bce1745c1cf.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 04 Sep 2026 11:52:33 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788515560; l=1870;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=jVdEJA7XxA1Zo1E7Jkr6lOMuDxyXkrIMYrhpKXqJGE8=;
 b=U0yulPbVMBLOTWTI0Tnlkk/11lNf8cDV3RAziJsc5zWmHipoh3i+nWo4T4fnRnaCiWsfDplCp
 ywHNZl3AlFpDaVY3H88vfSv7SKwMhtBZlXE22gAtS06Wkdu5PDrHa5K
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788515560599
X-purgate-ID: tlsNG-d62444/1788515566-1DE78757-73FD793A/0/0
X-purgate-type: clean
X-purgate-size: 1870

> vsiselect and hviprio{1,2} are per-hart CSRs which a guest can change, so
> they have to be part of the vCPU context:
Where in the spec did you see that? Because in AIA spec section 6.3.1,
it is written that "When vsiselect has a value in the range 0x30-0x3F,
an attempt from VS-mode to access sireg (really vsireg) causes a virtual
instruction exception" and this even when hstateen0.CSRIND is set as hstateen0
just control whether a guest/S-mode is allowed to access a CSR (exactly
as you described below).

Therefore, the hypervisor has two options to modify the priority of a
major irq:
- emulate the iprio array in software.
- Use hviprio1/hviprio2 (only 10 irqs configurable).

But the guest shouldn't be able to modify h CSRs at all, in any case, or
I may have misunderstood a part of the spec.

For the moment I don't see any catch of possible instruction exception
in do_trap().

>  - vsiselect is written directly by VS-mode through siselect;
>  - hviprio1 and hviprio2 hold the priorities of the local interrupts which
>    VS-mode reaches through the iprio array of vsiselect/vsireg, so writes
>    the guest performs there land in these CSRs.
hviprio1 and hviprio2 hold priorities for interrupts 1 (SSI), 5 (STI),
13 (counter overflow), and 14-23 (local) so calling all of them "local"
is wrong.
> Without saving them, one vCPU's selector leaks into another vCPU's vsireg
> accesses and one guest's interrupt priorities apply to the next guest which
> runs on the same hart.
> 
> Whether the CSRs may be touched at all is gated by hstateen0 when Smstateen
> is implemented: SVSLCT for vsiselect/vsireg and AIA for the rest of the AIA
I couldn't find any reference to SVSLCT in the spec. I assume you wanted
to refer to CSRIND and SVSLCT is an OpenSBI's own nickname.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

