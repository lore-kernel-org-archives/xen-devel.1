Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C581606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PA8n1+PA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=N55r/l00
Received: from list by lists.xenproject.org with outflank-mailman.1477038.1682841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLzn-0005gW-Pq; Fri, 06 Nov 2026 15:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477038.1682841; Fri, 06 Nov 2026 15:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLzn-0005gP-NA; Fri, 06 Nov 2026 15:36:51 +0000
Received: by outflank-mailman (input) for mailman id 1477038;
 Fri, 06 Nov 2026 15:36:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bigeasy@linutronix.de>) id 1xPLzm-0005gJ-CH
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 15:36:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPLzl-0041Xo-NI
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 16:36:49 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bigeasy@linutronix.de>)
 id 6aedf3ff-e002-0a2a0a5209dd-0a2a45058210-32
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 16:36:49 +0100
Received: from [193.142.43.55] (helo=galois.linutronix.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bigeasy@linutronix.de>)
 id 6aedf411-4cb1-0a2a45050019-c18e2b37c4ca-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 16:36:49 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2020 header.d=linutronix.de header.i="@linutronix.de" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"; dkim=permerror header.s=2020e header.d=linutronix.de header.i="@linutronix.de"
Date: Fri, 6 Nov 2026 16:36:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793979409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiCURZDhgyGIlSD3PbaH/tWIzwBivGR/3EJJGZ3gorY=;
	b=PA8n1+PAjNax6kBm3+SA6tcGSljdJx/BB5LXhg2zW45M0g2hfJTix2F2kE+U7PqRMHAPK9
	v1dfvGAUpg3ug4xMm927ngIpFoCzFiLq8AQs0iz6ldVF5F0PgcQ9KnN0qv7Xcxuc6EVw+E
	ED3sQPYU8Ng+R2w4e51jXY13YIdinmwD+71qG3yhj3c9lmZWP/mvvSpz24BZNKGsZ7Qw1T
	AGZEiWU4DXmjyOjUQn0/qaj72S+9Xp/h6pBXdzr4ao0x5n5IyE2lI5WFoTb1iL2ZdwhqCz
	dqJr2xP5bHDHJ4tBPz3w207GIePo7gvSUZ+8OQ/yeSl4TsZUmxZSntcJr+sbEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793979409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiCURZDhgyGIlSD3PbaH/tWIzwBivGR/3EJJGZ3gorY=;
	b=N55r/l00i/4ynURyXk6ezziVRoOvkU/z8WHNhLzIMgOaeE72M1wftJA3X0eFJS1sS6cqwH
	gm4WmM151TUp1MBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 0/2] Re-raise irq_work lost during Xen suspend
Message-ID: <20261106153647.F7ld02De@linutronix.de>
References: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
X-purgate-ID: tlsNG-c201ff/1793979409-716AD2A1-0CE618C9/0/0
X-purgate-type: clean
X-purgate-size: 1796
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-06 15:57:40 [+0100], Julian Vetter wrote:
> We hit this issue with an Ubuntu 26.04 cloudimage guests (7.0 based
> kernel with the 8250 as an nbcon console) on XCP-ng 8.3 / Xen 4.17. With
> a kernel commandline adding two consoles, i.e., 'console=ttyS1
> console=ttyS0'. During a live migration on that setup the printk()s from
> gnttab_resume() and xen_irq_resume() queue nbcon_irq_work while the APIC
> is disabled. Thus the list transitions from empty to non-empty, but
> doesn't receive the IPI to empty the list again. Afterwards the list
> stays non-empty, so the IPI never fires and all irq_work piles up.
> 
> The Commit 560f4deda327 ("printk/nbcon: Change nbcon_irq_work to
> IRQ_WORK_LAZY") removed this particular issue because declaring the IRQ
> work to be lazy, causes the timer interrupt to trigger the irq work
> instead. But any other non-lazy irq_work queued in that window is still
> lost the same way and will cause the list to fill up without being
> handled.

Adrian has this:
   https://lore.kernel.org/all/20261102074039.26983-2-adrian.hunter@intel.com/

I sort of asked for flush on suspend but Adrian pointed out the NMI
problem.

Looking at #1, you could probably limit it to a nop on
!arch_irq_work_has_interrupt(). The tick should not be disabled if
irq_work_needs_cpu() returns true (you don't add anything).

And lazy items get handled via irq_work_tick() anyway. This make me
think if it gets any easier if we handle both in irq_work_tick(). On x86
raised_list is evaluated anyway so by dropping
arch_irq_work_has_interrupt() we would avoid the APIC check and handle
list in this rare case. If the IRQ-work is working then the list remains
empty.

> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Sebastian

