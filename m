Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E3606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=BcKV9GeU
Received: from list by lists.xenproject.org with outflank-mailman.1480099.1684043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPJb-00080R-Up; Mon, 09 Nov 2026 13:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480099.1684043; Mon, 09 Nov 2026 13:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPJb-00080K-Rx; Mon, 09 Nov 2026 13:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1480099;
 Mon, 09 Nov 2026 13:21:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQPJa-000800-C6
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:21:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQPJZ-007WTf-Oi
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:21:37 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c078a9b4000403d@swg.vates.tech>)
 id 6af1c8dc-2eae-0a2a0a5409dd-0a2a450391d0-18
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:21:37 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c078a9b4000403d@swg.vates.tech>)
 id 6af1c8e0-fae8-0a2a45030019-b9ff1c2295c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:21:37 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1c078a9b4000403d.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Nov 2026 13:21:35 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7BE5481D8C;
 Mon,  9 Nov 2026 14:21:34 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=DCfN4hNO2P3E0knuMp7S4giXFNyYsJG337uOnF5yqFU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=BcKV9GeUksnh362ts2hgSOKxcJnUU8aZj4NNc23d83iXVoC3zoqL65FkEH+ETkJceCxjf64Zf
 tI7TeG2237BoWgSDIx5sN+egWTFYl+aOKWbJ/+z23eczHOqLmOlWdt+Z4+DyE5FTIzlDDYCIFAm
 c6d6SYUrDJjkTHBByaoTJfImqPNYa9Ms+E5fHhxvOV130MHn9+jtswVTgj6j+9vI2GJWSvcwfnA
 TyMH3iKLT46VZ4ZyDIiV7wWTYlOUDcwy0E4IjOjQAQAe/aex3jwKS1B7+WnhKEOjy+zEZPkBQH5
 EP0/BnaIOoetnujfOztlUzJKE1mNw95bE4XqRwTaLdQg==
X-Zone-Loop: 50f6742e624558adfa9338b2f2ce79c152e88452b85c
x-campaign-type: default
x-transaction-id: 4ffafb88-d163-4c0f-b663-ccacdf9bcbb7
x-swg-uid: 01-601c4b90-c115-4f62-900b-2f2f550ba754
X-Mailer: Sweego
Message-ID:
 <1794230495.8631fc262581453bbf619ec5b2062170.1a1c078a9b4000403d@vates.tech>
x-swg-bid: 1794230495.8631fc262581453bbf619ec5b2062170.1a1c078a9b4000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 2/2] xen/riscv: fix the base ISA checks in
 riscv_isa_parse_string()
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
In-Reply-To: <20261109124937.78186-2-oleksii.kurochko@gmail.com>
References: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
 <20261109124937.78186-2-oleksii.kurochko@gmail.com>
Date: Mon, 09 Nov 2026 14:21:27 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794230489; l=627;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=S+XSMQXsFbMJ6/vj/TXTmxwRR5c1T/0OF3p9riRN6mI=;
 b=ANJfa+pb8HQqcyy655hceVq1JaUcUhxatKxQE9Y6hZGnNhA8kaYMHRK2VwLaTOXJenUUbjoPN
 p4zzHmwHgaoBSZswqyV1XCJiEEoNG+OA4jw2Qq/SIZ6bvOPtZ877Cdc
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794230494769
X-purgate-ID: tlsNG-33051d/1794230497-772F54E9-1B95326E/10/73395122804
X-purgate-type: spam
X-purgate-size: 627
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 09 Nov 2026 13:49:37 +0100, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> riscv_isa_parse_string() is meant to reject a riscv,isa string which
> doesn't start with "rv32" or "rv64" (depending on Xen's bitness), but
> the checks are written with && instead of ||, so a string is rejected
> only when both characters of a pair are wrong. As a result, e.g.
> "xv64i" or "rv62i" is accepted on RV64. Also, for a string as short as
> "rv", isa[3] is read past the terminating NUL.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

