Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0F606A337
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=h+nj/Y12
Received: from list by lists.xenproject.org with outflank-mailman.1481498.1685385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQjEm-0005zv-Jq; Tue, 10 Nov 2026 10:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481498.1685385; Tue, 10 Nov 2026 10:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQjEm-0005zk-Fa; Tue, 10 Nov 2026 10:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1481498;
 Tue, 10 Nov 2026 10:37:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQjEk-0005za-Ky
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:37:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQjEj-00CQ8C-Qj
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:37:57 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c5092993000403d@swg.vates.tech>)
 id 6af2f400-e002-0a2a0a5209dd-0a2a450c8194-16
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:37:57 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c5092993000403d@swg.vates.tech>)
 id 6af2f405-f479-0a2a450c0019-b9ff1c12acb1-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:37:57 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1c5092993000403d.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Nov 2026 10:37:54 +0000
Received: from [100.68.94.6] (213.40.31.93.rev.sfr.net [93.31.40.213])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8FD1581D70;
 Tue, 10 Nov 2026 11:37:53 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=3257SNEmVuWGw32zq7CNI4vvyimuHSYqo4iteRhlUAI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=h+nj/Y12+ohgYFmcsw0MLrN/VfBjWtkhBa0jP9cfBeEu/JPu1gCnDMFsBePHfHcnJ+hBrsA1w
 2s477cFyk68aWdLnUs0/KVBAMSoLgcudueezsedQHFFw0WO455Bf9Nnwtu3nj8YDPqJbHRBRojt
 p1nR8PuDvH0+k3vGgdg5cPy4P/i+Nch47WX04YHh8FmiNk0yseZy5zFTImzDm3ar9Mi1EqZFSRq
 ocvNCRdsLAotfv1OZa/Tzs3/8HSN+ZmS3DfcBJWvMlTxr2LtfsRmv49k1W2NFx6/O4/hwjZx1fc
 fEboQ9qobnA18Sf/TaORmWUQccqwJHfV6R8DshVPN4MQ==
X-Zone-Loop: 5a55c3f31bf38fc44400075f756ad7726f3815e22e07
x-campaign-type: default
x-transaction-id: dfc426d2-b888-403a-a4b4-0f7901d49d3d
x-swg-uid: 01-d8b81307-6f27-4d06-a2d2-e22caa65f730
X-Mailer: Sweego
Message-ID:
 <1794307074.8631fc262581453bbf619ec5b2062170.1a1c5092993000403d@vates.tech>
x-swg-bid: 1794307074.8631fc262581453bbf619ec5b2062170.1a1c5092993000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] xen/riscv: skip disabled CPU nodes when probing
 ISA extensions
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <20261110092757.25213-1-oleksii.kurochko@gmail.com>
References: <20261110092757.25213-1-oleksii.kurochko@gmail.com>
Date: Tue, 10 Nov 2026 11:37:46 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307068; l=604;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=JR5zh1ft9n0XtVDrRT4I0YBGKC7bLdSVGAeTZVH+HWY=;
 b=tJsuPKulAviqC8rqmXt80isIe6K3EG8u5piyg09s7tPwkyxvqKH0TYKs59UYpLGIiLxGM+4vq
 nRUcOUxBelOCz8cjuDazqJ8ehHBDEWMBJEcgWJOBFfWOdorXw15fFUz
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794307073731
X-purgate-ID: tlsNG-d25034/1794307077-032D8A5B-3F8F1DC6/10/73395122804
X-purgate-type: spam
X-purgate-size: 604
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 10:27:56 +0100, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> riscv_fill_hwcap_from_isa_string() intersects the riscv,isa of every CPU
> node under /cpus, including the ones with status = "disabled". Such a
> hart is never used by Xen, yet it can still remove extensions from the
> host ISA: e.g. a disabled hart without the H extension makes Xen panic
> with "Xen requires extension: h", even though every hart Xen runs on
> implements it.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

