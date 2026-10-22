Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629DE606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 12:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Khika+lE
Received: from list by lists.xenproject.org with outflank-mailman.1458100.1670568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJs5O-0004iy-Pg; Thu, 22 Oct 2026 12:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458100.1670568; Thu, 22 Oct 2026 12:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJs5O-0004ir-N0; Thu, 22 Oct 2026 12:39:58 +0000
Received: by outflank-mailman (input) for mailman id 1458100;
 Thu, 22 Oct 2026 12:39:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJs5N-0004il-2u
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 12:39:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJs5M-009Les-8w
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:39:56 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1639ff9d2000f79f@swg.vates.tech>)
 id 6ada0400-bab6-0a2a0a5309dd-0a2a450ba60e-24
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 14:39:56 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1639ff9d2000f79f@swg.vates.tech>)
 id 6ada041b-b7e8-0a2a450b0019-b9ff1c238865-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 14:39:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1639ff9d2000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 12:39:50 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1451B820D1;
 Thu, 22 Oct 2026 14:39:50 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=CoBWFYKkHb42QoD3/q34cB0cjiDkIzF8Z+yUYtMdPf4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Khika+lEHGob9wZoIHSK6Heo7imzlxvZR8BAB4xRvTTffNdRTIVd5OM1LRUQ9PDIXi7xUBVJ3
 bewT2MBGDsJcBoiYjdnaXHRUnsNFtBlYnXVpE1J2gLv0gUzYqQuNG+uudmIInAwxj2p6HoGp7ZS
 f7LkwcLQyR9mz+imEjBTi6aShzp5N0YUty0thhJlbwHEiwtz/KfwTxsB1NzquJkCYb2EucgzEDG
 4pkjwOl0uLrLU3FJnhp8ZaTLA7P2kzJeHi4pI3d7L+YD17EV9qT7OlQaLjn1Vugxvc1N7Okr3/S
 AqVyqKZC08FExsL0IhO06QxBcj0qYw3KETHJ+An+pNSA==
X-Zone-Loop: eb285aa81a7ced14998e3054cef64c0141baeed4c12e
x-campaign-type: default
x-transaction-id: d448ffe7-d4b2-4573-964d-0f1e85a9a6e6
x-swg-uid: 01-0cca641a-1e3d-44fe-b6cb-8fd97749c7d2
X-Mailer: Sweego
Message-ID:
 <1792672791.8631fc262581453bbf619ec5b2062170.1a1639ff9d2000f79f@vates.tech>
x-swg-bid: 1792672791.8631fc262581453bbf619ec5b2062170.1a1639ff9d2000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 27/39] xen/riscv: handle the case when no vCPU
 migration is needed
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
In-Reply-To: <dddd74313e8b64b61c797fba663cba5e9322911e.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <dddd74313e8b64b61c797fba663cba5e9322911e.1790779209.git.oleksii.kurochko@gmail.com>
Date: Thu, 22 Oct 2026 14:39:43 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792672784; l=679;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=z5mdU21xoFBTYKu1EVauRYY2WynXMVjOmDj4k/sebNA=;
 b=AYv0+Bhw+RplXsdC54UCYDbupUfjuzA/Te5uISCMdxLMFiOC9qXeHSMnozRy9DJ4ZrB+92Ynr
 f4G+ayYvGRzAFbycVZe3SgJR9QBPQaUi5OcDdlL9yjCZcBym9W1tZ0W
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792672790286
X-purgate-ID: tlsNG-42698a/1792672796-AA0C59EA-EF2E4FF0/10/73395122804
X-purgate-type: spam
X-purgate-size: 679
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 30 Sep 2026 18:23:46 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> The scheduler moves a vCPU's interrupts (arch_move_irqs(), i.e.
> imsic_migrate_vcpu()) ahead of context_switch() whenever the unit is
> picked up by a pCPU other than the one it was assigned to, which can
> already happen for a freshly created vCPU on its very first run. No IMSIC
> h/w interrupt file has been mapped for such a vCPU yet, so there is
> nothing to migrate: return early while its last_cpu is still CPU_NONE,
> i.e. while it hasn't run.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

