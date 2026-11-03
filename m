Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BCF606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dY1EC/1Y
Received: from list by lists.xenproject.org with outflank-mailman.1469950.1678749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVP-00027J-3H; Tue, 03 Nov 2026 14:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469950.1678749; Tue, 03 Nov 2026 14:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFVO-00023U-Ii; Tue, 03 Nov 2026 14:28:54 +0000
Received: by outflank-mailman (input) for mailman id 1469950;
 Tue, 03 Nov 2026 14:24:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <junjie.cao@linux.dev>) id 1xOFQl-00011H-Mm
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:24:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFQl-008qVT-2w
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:24:07 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee84-e002-0a2a0a5209dd-0a2a4508ecfe-8
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:07 +0100
Received: from [91.218.175.51] (helo=mta0.migadu.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <junjie.cao@linux.dev>)
 id 6ae9ee86-f659-0a2a45080019-5bdaaf3387f0-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:24:06 +0100
Received: by smtp.migadu.com with ESMTPS id ec71b1ccc94d0644;
 Tue, 03 Nov 2026 14:24:05 +0000
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
DKIM-Signature: a=rsa-sha256; bh=QRv0PGJzuMeUy1tGthTU9o4n7HMlfygesRnl9JM8w94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715846; v=1; x=1794320646;
 b=dY1EC/1YYGTeYStO1e47NCUu1FmoRkj5M8sm2+38jieuaaMbSCLm+HWrEtETz2YjicxvkpMh
 rkGBxEPD07F4dskTJpx40R3kcjsh+2VPZ4iI7gshjzgCdodzcI4ikHlLspMZWYO/DVif0u+mH0i
 2JAnddUi73T699A06WxGbsD4=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: ec71b1ccc94d0644
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
Subject: Re: [PATCH v8 14/18] hw/usb/redirect-server: Implement control transfers
Date: Tue,  3 Nov 2026 08:23:25 -0600
Message-ID: <20261103142327.1348025-7-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102092201.1729245-15-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com> <20261102092201.1729245-15-jamin_lin@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793715846-CE94287B-426F742E/0/0
X-purgate-type: clean
X-purgate-size: 784
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jamin,

On Mon, Nov 02, 2026 at 09:22:23AM +0000, Jamin Lin wrote:
> +    if (!s->host_connected || !device || !device->attached) {
> +        return usb_redir_ioerror;
> +    }

The device stays in USB_STATE_ATTACHED until the announce BH resets it,
so a control_packet in the same read as hello passes this check and
hits the USB_STATE_DEFAULT assert in usb_handle_packet(). Checking
device_announced here would cover it.

For whenever you respin: stop_transfers() on a reset drops packets the
client may still cancel; usbredirhost answers them first.

Tested: usb-storage exported from ast2600-evb enumerates behind
qemu-xhci and usb-ehci, usb-audio behind qemu-xhci, and each
SET_INTERFACE alt 1 is followed by an ep_info with the iso OUT endpoint.

Junjie

