Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D84606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=hqhcJIrB
Received: from list by lists.xenproject.org with outflank-mailman.1458089.1670555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJs3D-0003y8-F4; Thu, 22 Oct 2026 12:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458089.1670555; Thu, 22 Oct 2026 12:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJs3D-0003y1-CD; Thu, 22 Oct 2026 12:37:43 +0000
Received: by outflank-mailman (input) for mailman id 1458089;
 Thu, 22 Oct 2026 12:37:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1639df031000f79f@swg.vates.tech>)
 id 1xJs3C-0003xv-05
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 12:37:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJs3B-002LPM-D5
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:37:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1639df031000f79f@swg.vates.tech>)
 id 6ada038b-e002-0a2a0a5209dd-0a2a450c85b6-28
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 14:37:41 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1639df031000f79f@swg.vates.tech>)
 id 6ada0394-f479-0a2a450c0019-b9ff1c12b2df-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 14:37:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1639df031000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 12:37:37 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B640380D94;
 Thu, 22 Oct 2026 14:37:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=3/TIeJ8V2lF/5VM+1C0BXG3TzV7I63OwP9omcQ2gPKU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=hqhcJIrBe8HFLieMQb3zXTvAm7dnt2dHFAxquIO2G8RzA4MUQuChQiGpmKuOIiXQEbQU2htEe
 lkqI67oaofC5nWak6P2RGvS6Gk1AKELLdoojDFFtE+2zZmd7bH+tRstaMeQwZ7jUWGo1/4mxNxS
 4ryu+RpM0dOUv8r1WB0iYE434KqlSe9qaPypaRMnzwNK2ZCLNAptjHREQyZx7qNbRXKJwf9makt
 dShZ1+o8LV7VB8EjVVeSeA5FTJLCKyCyRLIsFmOm/dHguSZlVd3ky1EglXWFyuLiU8xima0+MPp
 WBvXi/sNE3VBSBg4pv52raCeMvI8D+qqxZkmXeYcau8w==
X-Zone-Loop: bd30931c95a011dfdc29315fd978ad8384730bd14da9
x-campaign-type: default
x-transaction-id: 88da5564-2a34-45e6-b416-1e89474377c7
x-swg-uid: 01-bdc8fa0d-07c2-4a99-a1d6-314d4ebc4ada
X-Mailer: Sweego
Message-ID:
 <1792672657.8631fc262581453bbf619ec5b2062170.1a1639df031000f79f@vates.tech>
x-swg-bid: 1792672657.8631fc262581453bbf619ec5b2062170.1a1639df031000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 25/39] xen/riscv: add guest store emulation for
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
In-Reply-To: <ee4611cd5d3388eda12c611eeebec6b354a49681.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <ee4611cd5d3388eda12c611eeebec6b354a49681.1790779209.git.oleksii.kurochko@gmail.com>
Date: Thu, 22 Oct 2026 14:37:28 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792672651; l=1089;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=xUpGL8l1X2ln0qDZR5bCCwfQ/kwyNFBglaw2GkSDEwQ=;
 b=AMfirpoSVA8ak2qmjsIHaW54yHUIDJ+LdunGAdjRmDga5bZQ2HZX9fNCD5L1FMMw5gA3T+dcd
 bv5FqK8EmMoAJLmKJAbRQ7z+qxO+F8LYCeJckfCRwU4pJdqekLUmDlm
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792672656941
X-purgate-ID: tlsNG-d25034/1792672661-016C6A5B-A2868FAB/0/0
X-purgate-type: clean
X-purgate-size: 1089
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Extend the guest page fault handler with store emulation to support MMIO
> write accesses.
> 
> Like emulate_load(), emulate_store() obtains the trapped instruction with
> insn_fetch_faulted(), which also deals with a fault taken while re-reading
> it, and decodes it with decode_ldst_insn(). As with the load path, the
> access is completed synchronously through do_mmio().
> 
> At the moment only virtual interrupt controller (vINTC) traps are expected
> to occur, since it is currently the only backend registered with the MMIO
> handler dispatch, so in practice the store is emulated via the vINTC
> backend.
Nit: the wording is unclear because "emulated via the vINTC backend" sounds
like the vINTC does the decoding, I'd suggest:
```
    At the moment the only MMIO handler registered is the vAPLIC one, so in
    practice every trapped guest store ends up in vaplic_mmio_ops' write
    handler.
```
Instead of that, everything LGTM, so:
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Thanks!

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

