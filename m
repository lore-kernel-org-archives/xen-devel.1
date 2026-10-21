Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF4606A31B
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 11:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=EkTijRhb
Received: from list by lists.xenproject.org with outflank-mailman.1456973.1669999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJUkq-0000Hm-U0; Wed, 21 Oct 2026 11:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456973.1669999; Wed, 21 Oct 2026 11:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJUkq-0000Hf-Qa; Wed, 21 Oct 2026 11:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1456973;
 Wed, 21 Oct 2026 11:45:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15e4785ac000f79f@swg.vates.tech>)
 id 1xJUkp-0000HZ-KW
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 11:45:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJUkp-00GOUW-1A
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:45:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15e4785ac000f79f@swg.vates.tech>)
 id 6ad8a5c2-2eae-0a2a0a5409dd-0a2a450b876e-30
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 13:45:11 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15e4785ac000f79f@swg.vates.tech>)
 id 6ad8a5c6-b7e8-0a2a450b0019-b9ff1c22aba5-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 13:45:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15e4785ac000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Oct 2026 11:45:08 +0000
Received: from leducb.local (199.148.3.89.rev.sfr.net [89.3.148.199])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id BBABA8088C;
 Wed, 21 Oct 2026 13:45:06 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=kEv6Pif+476DTNvF2i548z1gYyiH4AajDAuMqvEHulE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=EkTijRhbB0NqbNEtpb6ldEG9wlKFs5J0Ntie+aTXdYDvdbhF0DaMO/vFG6M8C8tLAhuNAVXDB
 u7Ha+c/tpa/2s4N4mOhJjiNOh4HJPeN3St/5AaPjBxpaE4GhA/Ff0KsRq0l4wO6TJ6K45nsoVgA
 aJnhNC0MI/0wtnlXw5J2NPMaVlqTBVqgXI0s7C5SwLCLplQ9J9P71R6VOZYWMEfPcXk33zNMOZ1
 lLQIOUtO/VPzqpkBkbTqfEZkHEkvovwPWqspU8N7xng5uxFE0E58YUC/+vfjs38YNDtbxLlXfYA
 23AXGz0QwzEL7RqJLc9ZbT6R0oa3UhuBG/hqZKCl8GGQ==
X-Zone-Loop: d06db611fcc81cc59ecce606fab6f1676c869b3c16eb
x-campaign-type: default
x-transaction-id: f4e4397c-337a-4b3b-a3d2-76894f07d1eb
x-swg-uid: 01-e1f9ab1e-7cfb-42e7-8e07-5cdcf7e29f9c
X-Mailer: Sweego
Message-ID:
 <1792583108.8631fc262581453bbf619ec5b2062170.1a15e4785ac000f79f@vates.tech>
x-swg-bid: 1792583108.8631fc262581453bbf619ec5b2062170.1a15e4785ac000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 20/39] xen/riscv: resolve the faulting guest
 physical address
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
In-Reply-To: <f828fe51cde79f10632094067c82a7fc6f05391f.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <f828fe51cde79f10632094067c82a7fc6f05391f.1790779209.git.oleksii.kurochko@gmail.com>
Date: Wed, 21 Oct 2026 13:45:04 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792583106; l=1017;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=HO6XFLuzj0NtkcDHbqTu9Yqos4RN3QD3uGWS+cvEZUc=;
 b=Wgw8ptGvWDkCUxVIYLehtrI3uZXbFUDsMcHUsD2UNQJpGWiJfPnJEfh9A+uVvIP9IvU9pAke1
 lb27s+XMKY6Cpk3Yy4ixbdE2v/mUT7LvGK92KBX71kMbTfnEH4iuvLA
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792583107083
X-purgate-ID: tlsNG-42698a/1792583110-1AAD89EA-FB6C9CBF/0/0
X-purgate-type: clean
X-purgate-size: 1017
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Recover the guest physical address from htval and stval. On a guest-page
> fault to hypervisor, htval holds the guest physical address shifted
> right by 2, so that an address wider than HSXLEN fits, and stval holds
> the faulting guest virtual address. The shift is done on paddr_t rather
> than on the raw register: a guest physical address is 34 bits wide on
> RV32 with Sv32x4, so shifting an XLEN-wide value would drop its top two
> bits.
Nit: "The shift" reads as the right shift just described, while what is meant
is shifting htval back left by 2 to recover the address. Could you say so
explicitly?
Something like:

````
Shift htval back left by 2 and take the two low bits from stval. htval
is first converted to paddr_t, then shifted: a guest physical address is
34 bits wide on RV32 with Sv32x4, so shifting the XLEN-wide register
itself would drop the top two bits.
```

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

