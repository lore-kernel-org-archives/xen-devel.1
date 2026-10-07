Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2299CA5FFF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 08:55:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442052.1659583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xENPz-0005PA-F7; Wed, 07 Oct 2026 08:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442052.1659583; Wed, 07 Oct 2026 08:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xENPz-0005P3-CY; Wed, 07 Oct 2026 08:54:31 +0000
Received: by outflank-mailman (input) for mailman id 1442052;
 Wed, 07 Oct 2026 08:54:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xENPx-0005Ox-Mo
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 08:54:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xENPw-008Yyq-2g
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:54:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1159231980003f66@swg.vates.tech>)
 id 6ac608bb-bab6-0a2a0a5309dd-0a2a4504c524-36
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:54:28 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1159231980003f66@swg.vates.tech>)
 id 6ac608c3-b57f-0a2a45040019-b9ff1c2380d9-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:54:27 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1159231980003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 08:54:24 +0000
Received: from [192.168.1.17] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id EBD3E8236A;
 Wed,  7 Oct 2026 10:54:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9H7EU+338BJ6nYgha7M1fS/gnRwsEUNAP49R3i652pc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=YM3cRif3Yrrd2pBXO8lX6tZ5WHtdEQcn8BLGYYyA0u6kjLdZjsE8WCJGyr5gredeqIA/z6Wlt
 4PiL8MTD7pyXfBiaSjRo4gjx1fzJeG/auFBvPVjZ5JN/KLbcypFy5W5kuNymrH7SZ+sRJoF+RO8
 qGIWaASqtKY7iRfFvImZIg0Vp0tEKeIFR8c27VL2MuOWmC/yNBOZNt13/ambeg50q2Vz1RLugbM
 S87X4Wo+kBfIsujnQ2fAzRZvHmkrD5/PN2DMHUvwOkdpo+voN6cZbKPPP819g6YdKgAQt/0ta3k
 Or39FBD6iqfe25R8qTAx5wCiCoPsgqysfJ4Y87Wpiztg==
X-Zone-Loop: d427c0c52273cc89542b146e1d07098b5d03a5ae8c2e
x-campaign-type: default
x-transaction-id: a139b88a-aab6-484a-b470-14817d643fe9
x-swg-uid: 01-2abdb0a7-cb74-423f-b21e-baa6def5d590
X-Mailer: Sweego
Message-ID:
 <1791363264.8631fc262581453bbf619ec5b2062170.1a1159231980003f66@vates.tech>
x-swg-bid: 1791363264.8631fc262581453bbf619ec5b2062170.1a1159231980003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 12/39] xen/riscv: save and restore vsiselect on vCPU
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
In-Reply-To: <3a454373368c507a7bf9693c6651a7749d2a86b7.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <3a454373368c507a7bf9693c6651a7749d2a86b7.1790779209.git.oleksii.kurochko@gmail.com>
Date: Wed, 07 Oct 2026 10:53:43 +0200
X-Developer-Signature: v=1; a=openssh-sha256; t=1791363263; l=2088;
 i=baptiste.le-duc@vates.tech; h=from:subject:message-id;
 bh=aRs9i42FCl60M4rG8URJpD+haILXPXtXQ3+RW/xf3qs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgQKqDblDzOFimZyyhA+RsKnxim2EiA
 60KatQBsuueKYUAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPELU8vAfjdCDmtIiCJo8TQatYlNN6wwCNeJuEaI2li3ttOKta/FEZVxqdkxvdvm5goVTOwjSTq
 aIwtFzXCx6Ao=
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=openssh;
 fpr=SHA256:YieMhmvNcCYpeUbL6HuedGp4rwSlu4mQ+D7EJoVHM+k
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791363264211
X-purgate-ID: tlsNG-ebf023/1791363268-C22D4B50-C94FDA68/10/73395122804
X-purgate-type: spam
X-purgate-size: 2088

> vsiselect is a per-hart CSR which a guest changes on its own: when V=1,
> VS-mode accesses to siselect are really accesses to vsiselect.
> Architecturally a vCPU has to find there the value it last wrote, but as
> long as the CSR isn't part of the vCPU context it finds whatever selector
> the vCPU which ran on the hart before it left behind. A guest which writes
> siselect, is descheduled and then reads sireg without rewriting siselect
> therefore reaches a register it never selected, and it can also observe
> another guest's selector value.
Nit: I'd suggest a more tighter version that might be more clear. Feel
free to use it:

    ```
    vsiselect isn't saved/restored, yet the guest writes it directly (VS-mode
    accesses to siselect go to vsiselect). After a context switch a vCPU
    therefore sees the selector left by the previous vCPU on that hart: a guest
    writing siselect, getting descheduled, then accessing sireg hits a register
    it never selected, and it can observe another guest's selector value.
    ```

> 
> When Smstateen is implemented, access to vsiselect and vsireg is gated by
> hstateen0.CSRIND (bit 60, SMSTATEEN0_SVSLCT in Xen's headers), and
> v->arch.hstateen0 holds the bits vcpu_csr_init() ended up with. A clear
> bit there covers the two cases in which the CSR has to be skipped:
> 
>  - Xen didn't hand the guest access to it, so the guest can't have changed
>    the CSR and there is no state to preserve;
>  - M-mode denied the state altogether. Smstateen makes a bit which is zero
>    in mstateen0 read-only zero in hstateen0, and a zero bit in mstateen0
>    traps accesses from every privilege mode less privileged than M-mode,
>    HS-mode included, so Xen couldn't even read the CSR to save it.
> 
> Without Smstateen no bit controls access to the CSR, so it is saved and
> restored whenever Ssaia is available.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

