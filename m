Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7149606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RNDu8mGY
Received: from list by lists.xenproject.org with outflank-mailman.1469944.1678726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVN-0001jp-UT; Tue, 03 Nov 2026 14:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469944.1678726; Tue, 03 Nov 2026 14:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVN-0001i5-NW; Tue, 03 Nov 2026 14:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1469944;
 Tue, 03 Nov 2026 14:23:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xOFQZ-0000yV-5i
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:23:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFQY-007WID-If
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:23:54 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee6e-8faa-0a2a0a5109dd-0a2a4505840a-46
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:23:54 +0100
Received: from [95.215.58.20] (helo=mta1.migadu.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee79-4cb1-0a2a45050019-5fd73a14567b-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:23:54 +0100
Received: by smtp.migadu.com with ESMTPS id 90e5dc68535ae2f0;
 Tue, 03 Nov 2026 14:23:53 +0000
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
DKIM-Signature: a=rsa-sha256; bh=thSjGA6wOead7YqHEZ5eHt15E3jrEy1d9zA7U1Xp35o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715833; v=1; x=1794320633;
 b=RNDu8mGY9N8V/vcDfiQw43S17UBm1hVMRXEikMKU8MPZOZ174x5wrWYjoe9YNEWe3z0dimQ5
 3oaYM+g3V+52R/6TvA0JCBm8fs1Z2Vj+3RBDVW02oJ7782WOSodPJMr1qxGzQLFzS+/7tiwX5kU
 lPu7RGHr5dkIWWAiYAUZ5n5I=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: 90e5dc68535ae2f0
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
Subject: Re: [PATCH v8 10/18] docs/system/devices/usb: Note the automatic hub change
Date: Tue,  3 Nov 2026 08:23:22 -0600
Message-ID: <20261103142327.1348025-4-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102092201.1729245-11-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-11-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793715834-F60AA2A1-C754BCFE/0/0
X-purgate-type: clean
X-purgate-size: 670
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jamin,

On Mon, Nov 02, 2026 at 09:22:17AM +0000, Jamin Lin wrote:
> +A machine type older than 11.2 plugs a virtual USB hub into the last
> +free port, so that more devices fit. A newer one does not, and a
> +device that finds no free port fails.

With the series going into 12.0 this becomes "older than 12.0".

It would also help to say how to get a hub back. piix3-usb-uhci has two
ports, so -usb with usb-kbd, usb-mouse and usb-tablet already fails on
the newest machine type (pc-i440fx-11.2 on v8). Either of these fixes
it here:

  -device usb-hub                     (ahead of the other devices)
  -global piix3-usb-uhci.auto-hub=on

Junjie

