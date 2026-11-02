Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541FE606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LnUKrhVK
Received: from list by lists.xenproject.org with outflank-mailman.1468277.1677376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshR-0007Tq-G4; Mon, 02 Nov 2026 14:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468277.1677376; Mon, 02 Nov 2026 14:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshR-0007Tj-D8; Mon, 02 Nov 2026 14:07:49 +0000
Received: by outflank-mailman (input) for mailman id 1468277;
 Mon, 02 Nov 2026 14:07:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNshQ-0007Td-Fl
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:07:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNshP-00B4uG-RQ
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:07:47 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89932-bab6-0a2a0a5309dd-0a2a4507e862-2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:07:47 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89932-b4ea-0a2a45070019-aa0a857cb501-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:07:47 +0100
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-k2dcesXvMiGXIQHyQbl_aw-1; Mon,
 02 Nov 2026 09:07:42 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 59E231955D66; Mon,  2 Nov 2026 14:07:38 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B15C630000E3; Mon,  2 Nov 2026 14:07:35 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793628466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6rrMF5g7kSJjjz4JgR/DJELGyW6HUEWAKJW78oBWTs=;
	b=LnUKrhVKdEnybn3yPCd1Yv6osOcTrP79hcqsKt1HlluBIRY9Aw/WeDADAJkLX6n/p0XrsV
	71kd6lBdTwBGDdOCyRPMXZG9vlsDI6MqvdbNQRUTqGpNsw+35s+eujp9Z8vNAWUKweT37q
	8R+nzWROIvkErQkjs/vrMVaN/Ae6d3c=
X-MC-Unique: k2dcesXvMiGXIQHyQbl_aw-1
X-Mimecast-MFC-AGG-ID: k2dcesXvMiGXIQHyQbl_aw_1793628459
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 01/18] hw/usb/bus: Add an auto-hub flag to the USB
 bus
From: marcandre.lureau@redhat.com
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: kraxel@redhat.com, marcandre.lureau@redhat.com, junjie.cao@intel.com, 
 junjie.cao@linux.dev, clg@kaod.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Kane Chen <kane_chen@aspeedtech.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 Zhao Liu <zhao1.liu@intel.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Helge Deller <deller@gmx.de>, Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
 Troy Lee <troy_lee@aspeedtech.com>
In-Reply-To: <20261102092201.1729245-2-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-2-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845005.3960472.6869995164240582772.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=459;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=pAw5eg4Arl/ByoHFAYRPJQb/M2YDquuUFg0/97XLg1g=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6Jkj81VS6SlcWI4Rwy61JYstprlWUXrEY6lpy
 wc1SZFRb7uJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZIwAKCRDa6OEJdZac
 5QYyD/wPeJ8nM4weGI/sX8DMt0EeH7uYANAptfmfk41PheaO/7plM2Of4Zm2/6AppYmjB8uJw5j
 7aMh/2Ozw+k7hO03zeLNiS7XA1f27jXKUtARK4Bb5vRQhNtpinnBhPh/ohaLObS1QsU+58Y6Shx
 H7ZLV27gqTf2tOrvfBF5M/F16Nx9l90XHSy+Vi5KCruu5cXiuxgg8PQN7rEq5i6JUz33hHEQg2D
 4xxxXvkXvea75Upv8+LaWsUJhYSUgaYEknAaXRhiBmb0sA3CbO1RHHt/cIkAjIwIgtcs//hgmEt
 zWie0/ywlexmtlVimlLw5dVKI1E/9sQZxEEsx8oRZgdJdBdbvPcGHN8WP/WrOe26+9Fy2zA6rHs
 44/rYiAE+T5owtGlLkZu1KSc4cR1rAyj8R8JtBeQPU7sKSk7zV7xeya2rqQP4yqCaxmqE+Jne8A
 h8q7quPbYLpLIKaF8uKFRM7GovMGojSVJkCtUgSwxEvYcQeaosoYJCgim6oXZuqRI91aJGS1cyM
 RYiTTsSzCgKDD76SjGiNwpaL440PaERbSlIgN0s5j1uaYhDao2aWY6yG0HEtqGeyHKDaBUZQIpz
 jYdjTNFp6xH2MjYulYRfmZ4n7mpT5U2hCziavVJOGXNlhJ5JSa3aHxxj3DzcKFcEqmoBnntH6mE
 Tdj2SPUXYkm/6wg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: S-QDwk9FnMdoTDrcHaku7hY99Mag-YqvVypDEWiNsVo_1793628459
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793628467-348C9AE4-87584817/0/0
X-purgate-type: clean
X-purgate-size: 461
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 09:22:04 +0000, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> usb_claim_port() plugs a usb-hub into the last free port, so that more
> devices fit. Every bus gets that today, and a controller cannot turn
> it off.
> 
> Add auto_hub and have usb_claim_port() check it. usb_bus_new() turns it
> on.
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


