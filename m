Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F7E606A33C
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 15:47:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1464907.1675843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSLh-0002LX-Ho; Thu, 29 Oct 2026 15:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464907.1675843; Thu, 29 Oct 2026 15:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSLh-0002LQ-Ei; Thu, 29 Oct 2026 15:47:29 +0000
Received: by outflank-mailman (input) for mailman id 1464907;
 Thu, 29 Oct 2026 15:47:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1885828c6000f79f@swg.vates.tech>)
 id 1xMSLg-0002LI-9j
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:47:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMSLe-00Asxu-5J
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 16:47:26 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1885828c6000f79f@swg.vates.tech>)
 id 6ae36a87-bab6-0a2a0a5309dd-0a2a4507a168-14
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 16:47:26 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1885828c6000f79f@swg.vates.tech>)
 id 6ae36a8d-b4ea-0a2a45070019-b9ff1c1292ad-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 16:47:26 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1885828c6000f79f.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 15:47:21 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B399F83212;
 Thu, 29 Oct 2026 16:47:20 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=Es67gfhK4eAll13Wo9ntqA5rO5ZYA+VKYNSC9qFkaFk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=lvpK13hMU3Tv77d1gNbtzuFOX2hplzsdY+a1TYp0DGuG8JuX6aqUkLWW6Lk5zBtUVHVG2lQql
 kTU6bFFBrgHvEyRc54qeDZ2LII/lv7hzamJdm8QbzHh8k6ACIOkzKaSYlRxMYK1oJb/NQdNUQ3i
 X1IHMy6EJunOohkMMfXqwHfr9wgts3k/j87Kbdc4RHNnb3mpMb1tJ7MMiB0yotS9uZGjxIpY9S9
 nmAOqKslXEyUVOUt7zXa6I//xqx8JYXe2aC7DxpHOUQyxT1zJEMVAvOo9yKHZJy6nnYqKCUL0uV
 J2dx7rsHJnTw+DPPovB7NiFn20k1LyJo3clfsTejJiTQ==
X-Zone-Loop: b964b3962bd4c7d20c73f90cd48bbce0066c59ac40b4
x-campaign-type: default
x-transaction-id: 3fa1f438-650e-45fe-be6e-fba16916b2c1
x-swg-uid: 01-21db4bc5-06ca-47d5-8b19-1b2c2c46b1fb
X-Mailer: Sweego
Message-ID:
 <1793288841.8631fc262581453bbf619ec5b2062170.1a1885828c6000f79f@vates.tech>
x-swg-bid: 1793288841.8631fc262581453bbf619ec5b2062170.1a1885828c6000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/6] Add a QTB container to run the Xen riscv64
 tests
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <846f2ec6-da73-4f12-b46f-5e9f841e35ad@gmail.com>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823787.8631fc262581453bbf619ec5b2062170.1a0429a0db7000c4f3@vates.tech>
 <846f2ec6-da73-4f12-b46f-5e9f841e35ad@gmail.com>
Date: Thu, 29 Oct 2026 16:47:14 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793288834; l=1256;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=EAGB0uj303WpSeV8adE4Z3HR91CddmGg9iId3k6IQpo=;
 b=R6ovMOPNjPmOLzbFvqVznLBxXpIvmwV+TgeuzZw/4PTWg19TSmGAUvwqS/Y9P2XapwZ36hZO5
 HPzWacZOTP5BR9Smk/GUlHNrUxtvqKcssDaLwWuVsukOFEV+lcEITMA
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793288840887
X-purgate-ID: tlsNG-ef75cf/1793288846-A58C1AE4-029B956B/0/0
X-purgate-type: clean
X-purgate-size: 1256
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-22 15:28 +0200, Oleksii Kurochko wrote:
> [ ... 120 lines skipped ... ]
> Also, this fetches qemu.qmp, pexpect, pygdbmi and ptyprocess from PyPI
> with only lower bounds, so the result depends on when the container is
> built: building it now installs qemu.qmp 0.0.6, while the fork ships
> 0.0.5. The fork already bundles wheels for all of the [qtb]
> dependencies in python/wheels/, so they can be installed offline. I've
> checked that the following works, with python3-setuptools added to
> DEPS:
> 
>      pip install --break-system-packages --no-index --no-build-isolation \
>          --find-links /tmp/qemu/python/wheels "/tmp/qemu/python[qtb]"
> 
> Minor: python3-pytest isn't installed, so the unit tests from patch 4
> can't be run in this container, although the README asks only for
> "the prerequisites above plus pytest". It would be convenient to have
> it here.
Applied in v3, thanks!
> 
> FWIW, I've built the container and run the smoke test from this series
> in it against a locally built riscv64 Xen (console-test run
> dom0less-1smp-0domu-1vcpu-aplic-imsic-null): it passes.
> 
Great to know, thanks! Could you please add a Tested-by next time?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

