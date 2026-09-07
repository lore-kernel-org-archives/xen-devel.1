Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C06C79FA7
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 15:57:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410964.1641791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3biw-0007ti-Kz; Mon, 07 Sep 2026 15:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410964.1641791; Mon, 07 Sep 2026 15:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3biw-0007tU-I5; Mon, 07 Sep 2026 15:57:34 +0000
Received: by outflank-mailman (input) for mailman id 1410964;
 Mon, 07 Sep 2026 15:57:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3biw-0007sr-2P
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 15:57:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3biv-00111U-Ez
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 17:57:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c968805000c4f3@swg.vates.tech>)
 id 6a9edecd-e002-0a2a0a5209dd-0a2a4501baf8-38
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:57:33 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c968805000c4f3@swg.vates.tech>)
 id 6a9edeed-5984-0a2a45010019-b9ff1c12b079-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:57:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a07c968805000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 07 Sep 2026 15:57:15 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5CA748409A;
 Mon,  7 Sep 2026 17:57:14 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=KB1DiIJHEfPZZ3TklRboiaJUI7RetTEAxcTDNjbMqeA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=PAF69VG72VXt/UeeRtOnYCNBLsmeBqlnaD3ELV6ah2OChuTytVobsAAB9dyVi9dEeLQKXaCPa
 oy2/fWopSmkhMPyjJxB6AGbCKmdnIsCk2zxnhkH9gA16NP0yPMIJbBOf/zIIZDidj0CQ8mGM/oc
 9Sr68JhOlOA1wAsw8dOWWesqXQiRcwJkGKHg50EbMUfcwKY4T5NZKQs6fNBlgS94CEwg4NhhXBz
 3cBGx6a+jXTQc3VXlP2L3cNMLf/Odde9l6qlQ8KvrtGV3q+9Th9OkX7H5tDu0/XI9iO1RXTQLlZ
 mGb0PzdWuaegfRJ5cU/jFyECafYeZBysOVrPETLf7pFg==
X-Zone-Loop: e0829702275528cdb2ba722dfab25c33be22796b0754
x-campaign-type: default
x-transaction-id: 1e1f7348-aa93-4c5b-b287-64261dfd2c80
x-swg-uid: 01-d0e34013-47c0-41a2-80df-e23633dd0a7c
X-Mailer: Sweego
Message-ID:
 <1788796635.8631fc262581453bbf619ec5b2062170.1a07c968805000c4f3@vates.tech>
x-swg-bid: 1788796635.8631fc262581453bbf619ec5b2062170.1a07c968805000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 20/39] xen/riscv: detect Shtvala
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
In-Reply-To: <611683b3d2e3b836d08d0499f7caff782ba80a34.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <611683b3d2e3b836d08d0499f7caff782ba80a34.1787838835.git.oleksii.kurochko@gmail.com>
Date: Mon, 07 Sep 2026 17:57:03 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788796632; l=1604;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=mN+LNRvmlstaOovVuKX9opPQimAGNpumM0+HcJfuTEc=;
 b=4PonStdCMsN1CBP6LcAhd9pkF3eS4plPyPdqKutst7YrriydHL4ilmTzrMr+oMbhNQU+4y5ih
 U0Ot7TrGFZiCgUn98IDZMT/GMlFYx5QDyv4Bu7M5jTNYPclHmdXDzsz
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788796634700
X-purgate-ID: tlsNG-d62444/1788796653-BC558757-E39E5FAB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1604

> Shtvala says that htval is written with the faulting guest physical address
> on a guest-page fault. The H extension itself allows an implementation to
> write htval with either that address or with zero, so where the extension is
> absent a zero htval cannot be told apart from a genuine fault on guest
> physical address 0-3.
>
> It is not offered to guests. Shtvala describes the HS-mode trap interface,
> which a VS-mode guest never sees, and the H extension it belongs to is
> already withheld from guests. Its guest-facing counterpart is a separate
> extension, Shvstvala.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
I thought this commit message is not very clear. Here is a more direct
suggestion:

```
The H extension allows htval, on a guest-page fault, to be written with
either the faulting guest physical address or zero. Shtvala extension
removes the ambiguity of this zero-write by guaranteeing that htval is
written with the faulting guest physical address in every circumstance
permitted by the ISA.

Not offered to guests: Shtvala describes htval, an HS-mode-only trap
register a VS-mode guest never touches and the H extension it belongs to
is already hidden from guests. The guest-visible equivalent is a
separate extension, Shvstvala, covering vstval instead.
```

Btw, I saw Linux has Documentation/devicetree/bindings/riscv/extensions.yaml
which describes all of the extensions supported, don't you think it would
be useful to have the same in docs/misc/devicetree/...?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

