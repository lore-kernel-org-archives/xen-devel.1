Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B93606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QboAiju9
Received: from list by lists.xenproject.org with outflank-mailman.1469939.1678709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVN-0001Wv-3g; Tue, 03 Nov 2026 14:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469939.1678709; Tue, 03 Nov 2026 14:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVN-0001Wl-0L; Tue, 03 Nov 2026 14:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1469939;
 Tue, 03 Nov 2026 14:23:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xOFQN-0000wl-JR
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:23:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFQN-00DVv9-01
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:23:43 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee68-2eae-0a2a0a5409dd-0a2a450888e4-22
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:23:42 +0100
Received: from [95.215.58.232] (helo=mta1.migadu.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee69-f659-0a2a45080019-5fd73ae87d17-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:23:37 +0100
Received: by smtp.migadu.com with ESMTPS id 8b8233e03e8ecb06;
 Tue, 03 Nov 2026 14:23:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key1 header.d=linux.dev header.i="@linux.dev" header.h="From:To:Subject:Date:Message-ID:MIME-Version"
X-Envelope-To: xen-devel@lists.xenproject.org
DKIM-Signature: a=rsa-sha256; bh=NTV+1o9uyf+zEu0ODQ9KkP1B/rZrf/y6VMKSqc5Ax4I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715817; v=1; x=1794320617;
 b=QboAiju9IWD/dscQhRzlARGmJXJd9PiEjLOWQn6FfJRqb52IMvX2e/vKlawpZcaFMXneOaEU
 qMcMhIhexIJQNyAULgH6wDkf3U/JYkBd4DZanIIw96ieWysxvydi0uWJTqLBv1hFImBk43k0Ia2
 iZ0+2WGH8eldQ2b43IugzeMo=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: 8b8233e03e8ecb06
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: jamin_lin@aspeedtech.com
Cc: kraxel@redhat.com,
	marcandre.lureau@redhat.com,
	clg@kaod.org,
	pierrick.bouvier@oss.qualcomm.com,
	peter.maydell@linaro.org,
	kane_chen@aspeedtech.com,
	philmd@oss.qualcomm.com,
	kfting@nuvoton.com,
	wuhaotsh@google.com,
	zhao1.liu@intel.com,
	richard.henderson@linaro.org,
	deller@gmx.de,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	edgar.iglesias@gmail.com,
	troy_lee@aspeedtech.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org,
	junjie.cao@linux.dev
Subject: Re: [PATCH v8 02/18] hw/usb/hcd-xhci: Add an auto-hub property and leave it off
Date: Tue,  3 Nov 2026 08:23:19 -0600
Message-ID: <20261103142327.1348025-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102092201.1729245-3-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-3-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793715822-CE54487B-AD69631F/0/0
X-purgate-type: clean
X-purgate-size: 851
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jamin,

On Mon, Nov 02, 2026 at 09:22:05AM +0000, Jamin Lin wrote:
> Add auto-hub and leave it off. hw_compat_11_1 turns it on, so an older
> machine type keeps the hub it has today and a guest saved by an older
> QEMU still loads.

Reran the migration check from v7: with pc-q35-11.1, a guest saved
without the series loads on v8 with the hub in place, for qemu-xhci
with four HID devices and for q35 -usb with six.

But this missed the 11.2 soft freeze, so in 12.0 pc-q35-11.2 is an old
machine type too, and hw_compat_11_1 (my suggestion on v7) doesn't
cover it. Saved with pc-q35-11.2 on master, both cases fail on v8:

  Unknown section or instance '0000:00:01.0/4/usb-hub' 0
  Unknown section or instance '0000:00:1d.7/6/usb-hub' 0

The entries from 02-05 want hw_compat_11_2 once the 12.0 machine types
are in.

Junjie

