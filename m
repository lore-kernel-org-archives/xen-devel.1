Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB67606A327
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=go4wzjlr
Received: from list by lists.xenproject.org with outflank-mailman.1468282.1677412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshg-00006u-Et; Mon, 02 Nov 2026 14:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468282.1677412; Mon, 02 Nov 2026 14:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshg-00006P-BL; Mon, 02 Nov 2026 14:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1468282;
 Mon, 02 Nov 2026 14:08:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNshe-0008GD-Cu
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:08:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNshd-003XGc-If
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:08:01 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae8993d-2eae-0a2a0a5409dd-0a2a450caf4e-24
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:01 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89940-f479-0a2a450c0019-aa0a857c6691-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:01 +0100
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-318-MFzdMUKVOSug1hwDH4xZdg-1; Mon,
 02 Nov 2026 09:07:55 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 79A0B1800BEB; Mon,  2 Nov 2026 14:07:51 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CE7221800480; Mon,  2 Nov 2026 14:07:49 +0000 (UTC)
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
	s=mimecast20190719; t=1793628480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ReeqDOpJVu34MXPCHs8vlqcjxbBGplkwOQdpLdah4aI=;
	b=go4wzjlrzrZyulkb2VfHhWcOjlB0EAyKdPIc1gdH8hea8IEu8oMCj0rWNK5hfRHXb2hbiF
	Lb7T5TOLlg83PTUfEjW8o29b2oNnaMsHjRmX994gacQ5PH8QGXft7s0Nsh3JhTTLHWKxg4
	3azDJYrwHmSpFHFEEcqur9TEcNc1LDQ=
X-MC-Unique: MFzdMUKVOSug1hwDH4xZdg-1
X-Mimecast-MFC-AGG-ID: MFzdMUKVOSug1hwDH4xZdg_1793628471
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 04/18] hw/usb/hcd-uhci: Add an auto-hub property and
 leave it off
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
In-Reply-To: <20261102092201.1729245-5-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-5-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845010.3960472.15554652570081565177.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=665;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=7rq9cfim2y48SwXq79LA2MfRJmqVkvpfllTZdyix+bM=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6Jkk6CmwUai3kw1LtHeIXH5vmrV35+ZeXsM8j
 WEdcnsNZYuJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJAAKCRDa6OEJdZac
 5YVFD/9PrtwMifRP2m8xIox2pp80VjQ0LgnhR3gpDiUKu62sZYDYcisXqwckq0cRFfn3WLXPRfn
 /zwdEe/R3hINcAasIDW3AvWdYCQg4N60PcBYWV8otwzUQ7PHNMJ4rr9IcOOf3Eo8uj8LXEVphKV
 FwItVGl6n9cbe+1t1kyJyEjdG5a555FC4x1xn9V7I1QU9YzhzrhO/XizafACqwYeqJFTCSJ7Vxr
 5mZHDc1zfL8LnggfhqRIlSL3uGIqrO7R/m2sN/E+mz+ORWhRV3iXHbVK/rY2OSTSWjtc2kdNl/V
 Xdf2B/gQmZ3dWaS1SyMn7CT/NI3LsMBmQydKXTlhE3mRdXVUqgrVMOxG8RIjJnGWGuzt5USXW7x
 rp3En0esnCOAMYNI4gKLw0/YwIREgI9mTynpvYfjsR1f1VP8g3VGfx8y+1DIXAXPEmZ/CN4uYkn
 3g+QoVcoc8aLA18B0gMyBquK4eQS1jZMGcaqWNu5afbZYoMh9KZsfyN5PnALguIKX5rUEoseTGN
 eERJh2EcZFLg9WXOlbwKBPI+pJ/UPM8K8LFVHpoBtUQi4nImcm+DSbxi8FbbSuy+4PRmm/oMJRf
 8xBwZNlC+TdI0XKSkCJTpvDUBjl/lKrEEgVdXbcdcAOfH3MKD2MT65G0W1iYehr+NwmaVTJs5HZ
 uBOfqeCZ+wNGyQA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 9h-ZqwTK6gwyxET-m0uaF18yOWyyLRI0S_fqS7pPmPk_1793628471
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793628481-038D5A5B-2C5A7FED/0/0
X-purgate-type: clean
X-purgate-size: 667
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 09:22:08 +0000, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> Add auto-hub and leave it off. hw_compat_11_1 turns it on, so an older
> machine type keeps the hub it has today and a guest saved by an older
> QEMU still loads.
> 
> A companion UHCI adds its ports to the EHCI bus instead of making one,
> so there the EHCI property decides. Both property lists still define
> auto-hub, because hw_compat_11_1 names pci-uhci-usb, and QEMU stops
> when a global names a property the device does not have.
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


