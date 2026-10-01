Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A70DCA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 09:15:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438090.1656978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCCsy-0004KM-8n; Thu, 01 Oct 2026 09:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438090.1656978; Thu, 01 Oct 2026 09:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCCsy-0004KF-5W; Thu, 01 Oct 2026 09:15:28 +0000
Received: by outflank-mailman (input) for mailman id 1438090;
 Thu, 01 Oct 2026 09:15:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66@swg.vates.tech>)
 id 1xCCsx-0004K9-2m
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:15:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCCsv-009BF9-Mr
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:15:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66@swg.vates.tech>)
 id 6abe24ab-8faa-0a2a0a5109dd-0a2a4502aaec-10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:15:25 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66@swg.vates.tech>)
 id 6abe24ad-6ca4-0a2a45020019-b9ff1c228385-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:15:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f6bf34f40003f66.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 01 Oct 2026 09:15:21 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 73427829A4;
 Thu,  1 Oct 2026 11:15:20 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Puu+v1oWKd5ltvGYhCTQkeAG+pZRzbTVhmKwZAU+2HI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Dok65jaF6fowEM2kHaSLYrRlkUWlaCnFw1tzAJA4Gx9FXuqgYWUPAwhOPat1QgR3YXpkzzvaf
 CaGUzhbGaPkJ/9Z4Bngo6aPssqwhJJ5uX91JlvdAd6sOS3zTIIzb/1ECJ2g8Z3v92NUGx1ib4j9
 L4Bx8cduAtMtWQSKHLfpVBKV51uBltcomiI1WOI6q8rXUx4XQCHkgmbyEAJdEN3FqqNl+NcSWqT
 0Rx+/SKqls33xqwIxowVd5JLrRkcs/dM8Ui45hlfihx8DtlpnvJ45b07LUBkzOXD4SD9KVYnkvK
 rKPx8gXkNxja034Fp8ky4/RrSC8LH8gJi/vSUlemQ0TA==
X-Zone-Loop: c4e09f5122f9deec2c7b7cddef2209c3f6da0946a357
x-campaign-type: default
x-transaction-id: e5f2cc07-3215-49e2-bee3-93dedbe52244
x-swg-uid: 01-035086dd-67d6-4945-b532-067c8812168e
X-Mailer: Sweego
Message-ID:
 <1790846121.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66@vates.tech>
x-swg-bid: 1790846121.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 4/4] xen/riscv: use pte_is_valid() in
 pte_is_mapping()
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790845650.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66@vates.tech>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
 <1790845650.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66@vates.tech>
Date: Thu, 01 Oct 2026 11:15:15 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790846115; l=586;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=fTnS0RbXjWlLzX4aLpPH9MdsHkhk21TfQXh3ItDGweg=;
 b=okyiSxM769sioHAgKUmoPPEbBL8Ke4fLivSYyVyOWrRjHPCk+I8Pzo9YJ/6F6sPnZiGtBvM9K
 cJan5yw12G5BsyE4Tv3Cy/VlCXCmwpOAQvg4IsTZUd3E0a8FPHR8Y30
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790846120663
X-purgate-ID: tlsNG-720697/1790846125-31DC92AC-B405113D/0/0
X-purgate-type: clean
X-purgate-size: 586

On 2026-10-01 11:07 +0200, Baptiste Le Duc wrote:
> Use pte_is_valid() instead of open-coding the PTE_VALID check.
> 
> No functional change.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

I forgot the changelog for this patch:

Changes since v3:
- Rebase on the pte_is_reserved() -> pte_has_reserved_rwx() rename in
patch 3, only the context line changes.

Sorry for the noise, I didn't know if the reviewed-by
Oleksii gave applied here as I rebased the patch.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

