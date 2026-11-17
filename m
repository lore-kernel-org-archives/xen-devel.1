Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26B606A8A8
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=4SMBkOqm
Received: from list by lists.xenproject.org with outflank-mailman.1492123.1692817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGTD-0003mz-U4; Tue, 17 Nov 2026 10:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492123.1692817; Tue, 17 Nov 2026 10:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGTD-0003lm-QK; Tue, 17 Nov 2026 10:31:23 +0000
Received: by outflank-mailman (input) for mailman id 1492123;
 Tue, 17 Nov 2026 10:31:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xTGTD-0003le-0i
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 10:31:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTGTC-00000002so3-2Oso;
 Tue, 17 Nov 2026 10:31:22 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTGTC-0000000AKd6-3MWY;
 Tue, 17 Nov 2026 10:31:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=JPwqtyr+MVIbaRZ0qeXJWI8o1Mw9hU4tLZtx56pfdVY=; b=4SMBkOqmEck32b6ScffIJXffFQ
	At8g4VtPXzSiNr6e2aofCtdiq+bzjqcA8XPeblUyWYnGPKKP0rh07HFjA2aB08+/DfEBYMY6rFhnI
	dutbRqMEPd+a/qpKPXFasVUs1b3Zf1IlVv+WcZn8jDPjNEz9KMSUVQLs307+F/FAtXF4=;
Date: Tue, 17 Nov 2026 11:31:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/4] x86/IRQ: use less heavy locking in
 free_domain_pirqs()
Message-ID: <avws-HZ_QeR3s8t0@Mac.lan>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
 <12b095ad-2fbf-4964-bad0-ae930009a22f@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12b095ad-2fbf-4964-bad0-ae930009a22f@suse.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 03:24:13PM +0100, Jan Beulich wrote:
> Holding the domain's PCI lock (alongside its event lock) is sufficient
> around unmap_domain_pirq().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

