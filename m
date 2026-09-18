Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0DBC982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 09:17:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425016.1649184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UiM-0000Qq-FU; Fri, 18 Sep 2026 09:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425016.1649184; Fri, 18 Sep 2026 09:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UiM-0000Qj-Ct; Fri, 18 Sep 2026 09:17:02 +0000
Received: by outflank-mailman (input) for mailman id 1425016;
 Fri, 18 Sep 2026 09:17:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3cde27700072c4@swg.vates.tech>)
 id 1x7UiL-0000QB-5S
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:17:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7UiK-00GHMU-IU
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:17:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3cde27700072c4@swg.vates.tech>)
 id 6aad0186-8faa-0a2a0a5109dd-0a2a450c86f2-12
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:17:00 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3cde27700072c4@swg.vates.tech>)
 id 6aad018c-f479-0a2a450c0019-b9ff1c239065-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:17:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0b3cde27700072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 18 Sep 2026 09:16:49 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 05198821D1;
 Fri, 18 Sep 2026 11:16:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=NQ7mTRKVDEB6fRstnYIa6ATYk6cckZmxDMGQQWu4Fc4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=WGYBBDf6zgGzgSiYBua4w0liVkVWyFrp+VZmLDi4iouVofy1Ffp6oHhZXjdT8iV6uuLqHy5EI
 91mc3VyeeCdxSUZH8YtmKMzjhpy0E0dzx6f3EWzmrQf0qp4Y5mWmRFDHlVxvtDjlp6KbyJVAkJn
 x295y8l/aGelDYCwqRZ6e1DHlLu0GBEWeV0ye4u0lr2Qi2akWKYkE1iB7EfY9t9cBnWfpuXv7Kw
 T5DXSBP05D2KiLL0iN5KOMtkRBgLgohDAClmtvqqqn68HLAcq1TeM9wbvxrlBodN2mC0CjtrxPl
 uZ+KSmzKxML/krPTQaAPKB9pcX6C1yLuNL/DSEvE+bOA==
X-Zone-Loop: 4f4a8f6b99f510ecb19c6342dafea56953718dd986b4
x-campaign-type: default
x-transaction-id: 236d961b-c099-498b-bc5c-a2455ba21376
x-swg-uid: 01-3b5c3e5d-3a04-4c85-8eb4-262804a1c0b6
X-Mailer: Sweego
Message-ID:
 <1789723009.8631fc262581453bbf619ec5b2062170.1a0b3cde27700072c4@vates.tech>
x-swg-bid: 1789723009.8631fc262581453bbf619ec5b2062170.1a0b3cde27700072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 26/39] xen/riscv: add guest store emulation for
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
In-Reply-To: <230c35550edff0b2b8480b6728614305951fe5cd.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <230c35550edff0b2b8480b6728614305951fe5cd.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 18 Sep 2026 11:16:41 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789723003; l=1397;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=9YyJslwHpU7d8knvzTM+PA8SN4zacuZ2Z9IddfF2HJc=;
 b=tJEWqwOeEuSsfzjy0LXFGg6b/C1A1gL4x5B9ILnnFw0y2fMvPm+odTTvOBznWP1r8eOtV8Hyb
 PeJUtC0yaIFDUxk8bQkIN4XSZySgD9jDgIEwhQnUW9xgliKBlUyt5pK
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789723009225
X-purgate-ID: tlsNG-d25034/1789723020-03ED2A5B-69D228FD/0/0
X-purgate-type: clean
X-purgate-size: 1397

> Extend the guest page fault handler with store emulation to support MMIO
> write accesses.
> 
> The instruction decode mirrors emulate_load() and, like it, is adapted
> from Linux's KVM RISC-V implementation. As with the load path, the
> completion is synchronous through try_handle_mmio() rather than KVM's
> userspace exit/return split, since Xen's MMIO handlers run in the
> hypervisor. Faults taken while re-reading the trapped instruction are
> handled by decode_ldst_insn(), shared with the load path.
> 
> When a guest store instruction faults, the trapped instruction is decoded
> using HTINST or, if unavailable, fetched via unprivileged access. At the
Nit: commit message restates the HTINST-or-unprivileged-fetch decode
mechanism, which is already described in the prep patch introducing
decode_ldst_insn()/insn_fetch_faulted(), and isn't repeated in
emulate_load()'s commit message. Suggest trimming for symmetry with the
load commit, e.g.:

  When a guest store instruction faults, the trapped instruction is
  decoded via decode_ldst_insn(), shared with the load path. At the
  moment only virtual interrupt controller (vINTC) traps are expected to
  occur, since it is currently the only backend registered with the MMIO
  handler dispatch, so in practice the store is emulated via the vINTC
  backend.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

