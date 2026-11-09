Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086F606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=XscDFnSF
Received: from list by lists.xenproject.org with outflank-mailman.1480111.1684064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPM0-0000QR-EL; Mon, 09 Nov 2026 13:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480111.1684064; Mon, 09 Nov 2026 13:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPM0-0000QK-BV; Mon, 09 Nov 2026 13:24:08 +0000
Received: by outflank-mailman (input) for mailman id 1480111;
 Mon, 09 Nov 2026 13:24:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c07ae3e2000403d@swg.vates.tech>)
 id 1xQPLz-0000Q8-7A
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:24:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQPLy-00EBpy-Jw
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:24:06 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c07ae3e2000403d@swg.vates.tech>)
 id 6af1c971-e002-0a2a0a5209dd-0a2a4501a228-26
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:24:06 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c07ae3e2000403d@swg.vates.tech>)
 id 6af1c976-5984-0a2a45010019-b9ff1c23a9f9-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:24:06 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1c07ae3e2000403d.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Nov 2026 13:24:01 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id BE50C820A7;
 Mon,  9 Nov 2026 14:24:00 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=MfpxWyIDg2r/1ySix/7BetfFau302AhSlmLHQ1eucWw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=XscDFnSFT7V5NvIolQff7BeS2cmrJu6lhWg8Ykq+PqZF87/NO1eOSQuuL+5EwlcPBeXYchYOh
 X1O/eSwVI8ynHGPiFQV4yElXmzDY676ras1F/6Wfrbkrd81f3fZ4CASKq5hfM22sQSc3uOXtB4z
 VXPJMvtGftKSdZ79vHGe7EfTlabblS1yKltqIcBAi1dobJ3beCqmrrpbnEPbS6it/it/5sbfyQd
 TWKqJoYmreVo3Jg4hfWA+uJMhTNVTWMdaWKHYJWMEL4i+Q2NlpJcD3c1+LQcFv7y7DvN96NfUwc
 MJv4D5x27UNOXqC867YXFmQAaWUmlOm5J8zP97tPRfKg==
X-Zone-Loop: 4daad24f9feeaff2613212de9a2eea8f86ae50f1c156
x-campaign-type: default
x-transaction-id: ae8b8c9c-907d-4caa-a003-a7d3870deefd
x-swg-uid: 01-dc84dd9b-a53d-48fa-8f13-73218dffdefe
X-Mailer: Sweego
Message-ID:
 <1794230641.8631fc262581453bbf619ec5b2062170.1a1c07ae3e2000403d@vates.tech>
x-swg-bid: 1794230641.8631fc262581453bbf619ec5b2062170.1a1c07ae3e2000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 1/2] xen/riscv: skip disabled CPU nodes when probing
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
In-Reply-To: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
References: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
Date: Mon, 09 Nov 2026 14:23:54 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794230635; l=791;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=9gM9E41Bn1gQr34D/XKC4EpngYRXMGgMH0TY8apTBkQ=;
 b=fPx16xaNmPfTFydoYSr6iPjLr/hKxI0V8ch1QKogk1kgsP+P5D2jIoGw3QSmG0ItlMYvj+MR2
 SqJBsv4iCUfBbeQkeB2V2IiiHipgcqVW7+FdHviSxyd3rdaw2P5KotU
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794230640956
X-purgate-ID: tlsNG-d62444/1794230646-C4B45757-2EB8EC9F/0/0
X-purgate-type: clean
X-purgate-size: 791
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> riscv_fill_hwcap_from_isa_string() intersects the riscv,isa of every CPU
> node under /cpus, including the ones with status = "disabled". Such a
> hart is never used by Xen, yet it can still remove extensions from the
> host ISA: e.g. a disabled hart without the H extension makes Xen panic
> with "Xen requires extension: h", even though every hart Xen runs on
> implements it.
> 
> Skip CPU nodes which aren't available.

has_isa_extensions_property() still walks the disabled nodes, so the two
loops over /cpus now disagree on which harts count. Rather than adding
the check loop by loop, can we filter them in one place, e.g. with a 
dt_for_each_available_child_node() iterator, so no /cpus walk sees a disabled
hart?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

