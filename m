Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FA4606A324
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=F1gRHGzY
Received: from list by lists.xenproject.org with outflank-mailman.1456017.1669618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBjg-0007tz-9t; Tue, 20 Oct 2026 15:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456017.1669618; Tue, 20 Oct 2026 15:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBjg-0007ts-6m; Tue, 20 Oct 2026 15:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1456017;
 Tue, 20 Oct 2026 15:26:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJBjf-0007tk-CN
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:26:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJBje-007EWe-PT
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 17:26:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159ebf27b000f79f@swg.vates.tech>)
 id 6ad78832-bab6-0a2a0a5309dd-0a2a4504a2e8-2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 17:26:42 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159ebf27b000f79f@swg.vates.tech>)
 id 6ad78832-b57f-0a2a45040019-b9ff1c22a769-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 17:26:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a159ebf27b000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 15:26:37 +0000
Received: from [10.235.238.14] (149.173.185.81.rev.sfr.net [81.185.173.149])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5A34681B46;
 Tue, 20 Oct 2026 17:26:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ubw/UeBhaUnN970jvtac+P7O/b5BLLuiZYReumryN/c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=F1gRHGzYErx1sECUYbmsZoX+zwxMejhhID8g39vfI9bqPa8pB3QElDT51U2zwQLTTwyJkYzpI
 45HAR+ebU8XPoBpVIdtktv1DDOjNj/enNCE0c5GLnndUDM2yT69N5s3WMrPiM05Pv/8gFOi//QW
 u4XTOwgAo5STnwjG2xOdhzOppMdNRDNTS+dQdJTLfZN7cJzTjQzYYiFLyixoW87C3NnypGOnhRG
 szrLJTuIbVoyRJfwmoqIGm+yN/PAHxlfJSeLjrfWvQihAUwIQAfh9duLSCW45c3tOgsqAvjzy32
 BjbegHJKbTqDb7yT+qEvCcAglp2YGq+qYmXtI/I+pjBQ==
X-Zone-Loop: 8549f672b82ae0df8fe42a4f65f39dc83a2742594a2e
x-campaign-type: default
x-transaction-id: 39a62f09-c5c5-416d-b290-b2c4ac254466
x-swg-uid: 01-35d9f8ec-a3fc-4ffb-ae7f-573b977016ac
X-Mailer: Sweego
Message-ID:
 <1792509997.8631fc262581453bbf619ec5b2062170.1a159ebf27b000f79f@vates.tech>
x-swg-bid: 1792509997.8631fc262581453bbf619ec5b2062170.1a159ebf27b000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 19/39] xen/riscv: detect Shtvala
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
In-Reply-To: <d676e7f7aa71e4ee439c4c796b886710ffb9f50c.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <d676e7f7aa71e4ee439c4c796b886710ffb9f50c.1790779209.git.oleksii.kurochko@gmail.com>
Date: Tue, 20 Oct 2026 17:26:29 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792509990; l=822;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=7siBI3nUXyNpzfgQa+AIqtZCKfZAe6zYq5apcGqImdc=;
 b=VA9Yqk3cmURPYMelrBx11P44PREr5WPASwAiFChOCO+T1GHf1TqcXW40k9R+OVarW86Q+ske7
 fYxM97yK3KVBQ26kVmu4xGr0OP8PNw6HqjQkjr401EsKZV8VqceckeW
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792509996983
X-purgate-ID: tlsNG-ebf023/1792510002-C26CAB50-35218D66/10/73395122804
X-purgate-type: spam
X-purgate-size: 822
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 30 Sep 2026 18:23:38 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> The H extension allows htval, on a guest-page fault, to be written with
> either the faulting guest physical address or zero. The Shtvala extension
> removes the ambiguity of this zero-write by guaranteeing that htval is
> written with the faulting guest physical address in every circumstance
> permitted by the ISA.
> 
> Not offered to guests: Shtvala describes htval, an HS-mode-only trap
> register a VS-mode guest never touches, and the H extension it belongs to
> is already hidden from guests. The guest-visible equivalent is a
> separate extension, Shvstvala, covering vstval instead.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

