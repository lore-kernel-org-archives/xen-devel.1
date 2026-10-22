Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015DA606A325
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=XP00dRsj
Received: from list by lists.xenproject.org with outflank-mailman.1458030.1670487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJrfX-0007vZ-Ns; Thu, 22 Oct 2026 12:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458030.1670487; Thu, 22 Oct 2026 12:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJrfX-0007vS-In; Thu, 22 Oct 2026 12:13:15 +0000
Received: by outflank-mailman (input) for mailman id 1458030;
 Thu, 22 Oct 2026 12:13:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJrfW-0007vH-9V
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 12:13:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJrfV-00B6Vh-MQ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:13:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1638784d8000f79f@swg.vates.tech>)
 id 6ad9fdd1-8faa-0a2a0a5109dd-0a2a45038db6-24
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 14:13:13 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1638784d8000f79f@swg.vates.tech>)
 id 6ad9fdd9-fae8-0a2a45030019-b9ff1c12b493-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 14:13:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1638784d8000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 12:13:08 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5EDF382B3E;
 Thu, 22 Oct 2026 14:13:07 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=YwcJTug30YV6MarLquP7ragoki0M6zg/ikiHj0VjsQg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=XP00dRsj4QUhu4OdHw7ZtFmKMIpPJO8rDN9vFtdSuziUttKxMj7K4/kqAF2cQMaCacAYQkB74
 9fJTSwiAjFbl7aKSQgnCwcNFrrNJv5xrYBvTlRBqCBzDIQEK2avLIsYCf4a4zgysdpcaCvN88Nw
 jUwqC/fz8wSj0nzaqMDQgHQ+x2ZTfCWkB0Wm27vAKZiBLzE0KJxn3VeMhgqUgmIeZQor2SbW1z4
 Vl836D4HiKkkXrCzIf1ZXAoDeEgM3+9+ovpMncPxAUFHuE3ZUJWC0OFDvF6u71G8/5y+V6ksGcM
 5MIdy9ruBodK3pziuokMdRvm5cFM0XW+VMHjUwBVLcHA==
X-Zone-Loop: 35b4dc8018403ae2961a00f5721a254fda065da98099
x-campaign-type: default
x-transaction-id: bfb7c18e-395c-4edb-a020-10d201ff37f8
x-swg-uid: 01-c419a371-6c03-454a-9c9c-796aceb231fe
X-Mailer: Sweego
Message-ID:
 <1792671188.8631fc262581453bbf619ec5b2062170.1a1638784d8000f79f@vates.tech>
x-swg-bid: 1792671188.8631fc262581453bbf619ec5b2062170.1a1638784d8000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 24/39] xen/riscv: add guest load emulation for
 trapped MMIO accesses
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
In-Reply-To: <9943b1f4-1890-4917-ae39-bf9c70fc36c7@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <d4304a157181d8a8432b8f65f92019e0ead3bec7.1790779209.git.oleksii.kurochko@gmail.com>
 <9943b1f4-1890-4917-ae39-bf9c70fc36c7@gmail.com>
Date: Thu, 22 Oct 2026 14:13:01 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792671182; l=1425;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=gQKYxbT+Crw1jWiAMdbc+26gb62yat8xw4yogHozE1E=;
 b=2QYhPsvromvPxhJTJQNb94aEqo04zyss6htno05STxC6axztMeScLTKV2Qe1cXt1vZFxXk+M6
 hI+2HjraAbyALzcQ0M1Q+orXwICGJgIy8kiu+7JqsJZC0vGpV8IvjUU
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792671187610
X-purgate-ID: tlsNG-33051d/1792671193-7428D4E9-EDC4D363/10/73395122804
X-purgate-type: spam
X-purgate-size: 1425
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-15 16:59:53+02:00, Oleksii Kurochko wrote:
> On 9/30/26 6:23 PM, Oleksii Kurochko wrote:
> 
> > Implement emulate_load() on top of the decoding interface introduced by
> > the previous patch: fetch the trapped instruction, decode it, dispatch
> > the access to a registered MMIO handler via do_mmio(), write the result
> > back into the destination register and step over the instruction.
> > 
> > Xen dispatches MMIO synchronously to an in-hypervisor handler, so unlike
> > KVM RISC-V there is no userspace exit/return step and no equivalent of
> > the kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
> > split; the result is consumed in place.
> > 
> > Sign extension is done here rather than in the handlers: a signed load
> > is normalized by a shift pair, so a handler need only report the value
> > it read.
> 
> This part of commit message should be updated. Suggestion look below...
> 
> > At the moment vINTC is the only backend registered with the MMIO
> > dispatch, so in practice this only covers vINTC traps. An access which
> > no handler claims currently crashes the domain; injecting an access
> > fault into the guest instead is left for later.
> > 
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> 
> [...]
Sorry I don't understand, did you forget to put the suggestion?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

