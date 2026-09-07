Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6968CC79FA0
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 15:57:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410962.1641773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3bir-0007OR-2n; Mon, 07 Sep 2026 15:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410962.1641773; Mon, 07 Sep 2026 15:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3biq-0007OJ-VC; Mon, 07 Sep 2026 15:57:28 +0000
Received: by outflank-mailman (input) for mailman id 1410962;
 Mon, 07 Sep 2026 15:57:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3bip-0007Lt-Q7
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 15:57:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3bip-00111U-6e
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 17:57:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c9684ae000c4f3@swg.vates.tech>)
 id 6a9edee3-e002-0a2a0a5209dd-0a2a450bcb8c-6
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:57:27 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c9684ae000c4f3@swg.vates.tech>)
 id 6a9edee3-b7e8-0a2a450b0019-b9ff1c229b35-4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:57:27 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a07c9684ae000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 07 Sep 2026 15:57:14 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 87732840A3;
 Mon,  7 Sep 2026 17:57:13 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=K2JiV2l64MiUPAkrL8g3m/vsaQjxcNNBdSjgGcbCx0s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=e8tZgygLIehJHYpIKhd2gUmjD8AlRFqFbhEMc6+soVSVGSnUQMX2TvUPE41lK5cMfqvZsfK7F
 j+dnF2MCgD/jVJGoDkuemoiYDpv7ng4DbOhghkWA0SKSUJv6q17Dyh0EH5vZ5z3gdMxkVv17KP4
 vBkr/4dupnUEy2fPlxIEscEtrIg0uMMaEwofAXANbF5pItmgq5frdhJ4EO+0rWZHOoGq8zssfum
 c6N75a+Gpbbw/ih7s3ebSiZ6nSXz+lZ+jkYFZWOd8SrQamHkJJZd9ACF/4el3u956hioX/y9stw
 HsPGN2x7pc4Z3Pgc7bGZ/sTRMYIKjvIXHoIAX7ebEiOQ==
X-Zone-Loop: b16d8af7a75364fe99864d450971367f86bf4531a0bc
x-campaign-type: default
x-transaction-id: 9234ac01-ab3a-4d70-9d4e-8be8d1d4b3e5
x-swg-uid: 01-83b1b9d6-7988-455a-a69f-7867cc56d257
X-Mailer: Sweego
Message-ID:
 <1788796634.8631fc262581453bbf619ec5b2062170.1a07c9684ae000c4f3@vates.tech>
x-swg-bid: 1788796634.8631fc262581453bbf619ec5b2062170.1a07c9684ae000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 18/39] xen/riscv: add guest page fault handling stub
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
In-Reply-To: <42e37df518f1eda9579264b4bae9db3521e1042a.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <42e37df518f1eda9579264b4bae9db3521e1042a.1787838835.git.oleksii.kurochko@gmail.com>
Date: Mon, 07 Sep 2026 17:57:03 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788796632; l=4745;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Xz9T0Naka2ZxLXOY0iG2z3w0ta6fjbdRTIqPiotud1M=;
 b=qH/JkXhmvH35uaDyKSAwfQmqNQKw/zLhBjDgScH8XsnpowZ1+ANZgMm0vpmtnXUHmkt88BS7L
 dH2GK41O8IWCjqdf+/9NLUrH/wxop7MpFxNjTO14hOLvY4CE+SCw6Q8
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788796633879
X-purgate-ID: tlsNG-42698a/1788796647-AAEDE9EA-CA122EB3/10/73395122804
X-purgate-type: spam
X-purgate-size: 4745

> Add a handler for guest page faults and hook it into the trap path,
> providing the trap-side entry point which will later feed the MMIO
> dispatch.
> 
> This will be used, for example, to trap accesses to APLIC registers so
> that a guest can initialize and drive an emulated interrupt controller.
> 
> Two of the situations handled here are already decided, as neither can
> ever be turned into an emulated access:
> 
>  - A fault reported with a pseudoinstruction in htinst was taken on an
>    implicit access made for VS-stage address translation, so htval holds
>    the address of a VS-stage PTE rather than of anything the guest asked
>    for, and the guest physical address behind the original access is not
>    known. This is orthogonal to the cause and can accompany any of the
>    three, which is why it is checked first. scause keeps reporting the
>    type of the original access, and on bare hardware a PTE which cannot
>    be read raises an access fault of exactly that type, so reflect one
>    back to the guest.
> 
>  - A fetch fault means the guest tried to execute from a guest physical
>    address which is unmapped or which G-stage does not allow to be
>    executed. On bare hardware a fetch from physical memory which does
>    not exist, or which may not be executed, raises an instruction access
>    fault, so reflect one back too.
> 
> Explicit loads and stores are where MMIO emulation will hook in.
> 
> Neither of the two paths above consults the p2m first, and neither will
> the MMIO one: RISC-V has no populate-on-demand, no paging and no
> mem_access, so every guest mapping is established eagerly and a G-stage
> fault never denotes a mapping Xen could install to let the faulting
> access complete.
> 
> Both of the helpers this leans on, resolve_faulting_gpa() and
> trap_redirect(), are BUG_ON() placeholders for now, so each of the three
> causes currently takes the host down rather than the domain. That is no
> worse than before this patch, where the same causes fell through to
> do_unexpected_trap() and die(). Implementing the helpers is left to
> later patches.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>

I think the commit message it not very clear as it conflates two
different countable things (the 3 fault causes reported via scause vs.
the pseudoinstruction condition, which is orthogonal and can accompany
any of them), which makes "two situations decided" or "any of the three"
hard to follow on first read. 

Here is a proposition with a split to distinguish fetch-fault and
pseudoinstruction cases into explicit bullets with their outcome stated
("Decided here"), and added spec-mentioned conditions about the
pseudoinstruction's existence conditions:
```
    Add a handler for guest page faults and hook it into the trap path,
    providing the trap-side entry point which will later feed the MMIO
    dispatch.

    This will be used, for example, to trap accesses to APLIC registers so
    that a guest can initialize and drive an emulated interrupt controller.

    A G-stage (stage-2) fault has one of three causes, reported via scause:

        - Fetch fault: guest tried to execute from a guest-physical address
        that is unmapped or that G-stage marks non-executable. Never
        emulatable (nothing to emulate a fetch into). On real hardware
        this raises an instruction access fault, so Xen reflects the same
        fault back to the guest. Decided here.

        - Load fault / Store fault: left undecided by this patch, this is
        where MMIO emulation will hook in later.

    Any of these three faults can instead be reported via a pseudoinstruction
    in htinst, when both:

        (a) the fault occurred on an implicit access Xen made to walk a
            VS-stage page table, and
        (b) htval holds a nonzero value: the guest-physical address of that
            VS-stage PTE, not of the guest's original access.

    However, none of these paths consult the p2m first, and the future MMIO path
    won't either: RISC-V has no populate-on-demand, no paging, and no
    mem_access, so every guest mapping is established eagerly. A G-stage
    fault therefore never indicates a mapping Xen could lazily resolve to
    let the access complete.

    Both helpers this handler relies on, resolve_faulting_gpa() and
    trap_redirect(), are BUG_ON() placeholders for now, so all three causes
    currently take the host down instead of just the guest. This is no worse
    than before this patch, where these traps fell through to
    do_unexpected_trap() and die().
```

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

