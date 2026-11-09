Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAF9606A339
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 15:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=gDT+KWt7
Received: from list by lists.xenproject.org with outflank-mailman.1480276.1684241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQRSY-0007lW-MI; Mon, 09 Nov 2026 15:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480276.1684241; Mon, 09 Nov 2026 15:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQRSY-0007lP-JJ; Mon, 09 Nov 2026 15:39:02 +0000
Received: by outflank-mailman (input) for mailman id 1480276;
 Mon, 09 Nov 2026 15:39:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0f65b65000403d@swg.vates.tech>)
 id 1xQRSX-0007lC-DC
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:39:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQRSW-00A1f0-B2
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 16:39:00 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0f65b65000403d@swg.vates.tech>)
 id 6af1e90b-2eae-0a2a0a5409dd-0a2a4509d8ac-30
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:39:00 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0f65b65000403d@swg.vates.tech>)
 id 6af1e913-be1a-0a2a45090019-b9ff1c22b70f-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:39:00 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1c0f65b65000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Nov 2026 15:38:53 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6F7118012E;
 Mon,  9 Nov 2026 16:38:52 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=98U0mkewvjjOqMX7QV7RfffEf2ijQLV0ugwIJ+BGr2c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=gDT+KWt7A9BTF54Woo+KeZsG1jWbamcdbLF8SiwXc0g50ASHzH7KUtjV8bs87+L37l7+nSo2w
 pqdND8LjYbAef6Qu/pqNqI+vABKPnnIdpzdQxjjiQdtq5lV0oNyz4M83q7tFSUg4O6Wc0UKKVXh
 0vzkqvZtaI0RLi3Y1ooFNVZO2GKtFmbmcje8p6RRb+AwO6QJAdqHvFbb++diCCUkSuY3ULjZcqH
 UFNuqda3Hk2e9ZBWCOcNALY3QBy4ciC52juVbodWzVnnhoM3RijAutsK3swNpqCqPLBR9iCykcU
 jMMXONvtwQa0Eclv2Y04EbnFdyXZWHCT4Usw9waBFQ9w==
X-Zone-Loop: bfd1624eb8e1eda7fcde018f29a87ae855346d551af8
x-campaign-type: default
x-transaction-id: 9fa28102-1319-47d3-824f-df9b0fdea727
x-swg-uid: 01-821f684a-a4ba-4954-b292-06939cbdc61d
X-Mailer: Sweego
Message-ID:
 <1794238733.8631fc262581453bbf619ec5b2062170.1a1c0f65b65000403d@vates.tech>
x-swg-bid: 1794238733.8631fc262581453bbf619ec5b2062170.1a1c0f65b65000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 1/3] xen/mm: Introduce per-node free page counter
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <a0b83b0781319009c3862389469dc59db59e0b29.1778272036.git.bernhard.kaindl@citrix.com>
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
 <a0b83b0781319009c3862389469dc59db59e0b29.1778272036.git.bernhard.kaindl@citrix.com>
Date: Mon, 09 Nov 2026 16:38:45 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794238727; l=492;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=34rk53i0/dLhlw7aAdZs219r0K8iiPgDDqN14NJckbw=;
 b=DwEtssSAziKxqcg4MtpMzxYBk/oQQvtjjzqfZf4uhUD6skguFpkYe0K3UpXuNrVtws5O45nin
 FEE41R9z6NkAu+qrnw8R9eZOXONqy1x/7kYjG0HLqF3mnPa8tYtjlVh
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794238732614
X-purgate-ID: tlsNG-bad1c0/1794238740-FC411034-BC1567D3/0/0
X-purgate-type: clean
X-purgate-size: 492
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 08 May 2026 21:27:57 +0100, Bernhard Kaindl <bernhard.kaindl@citrix.com> wrote:
> Add node_avail_pages[], updated under heap_lock in sync with
> avail[node][zone] to cache the per-node sum of free pages.
> 
> Use it in avail_node_heap_pages() to avoid summing all zones on each
> call. Guard it with nodeid < MAX_NUMNODES and node_online(nodeid).
> 
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

