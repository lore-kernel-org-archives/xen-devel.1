Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC96ACA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439357.1657743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxH-00033B-CS; Fri, 02 Oct 2026 17:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439357.1657743; Fri, 02 Oct 2026 17:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgxH-00032L-7q; Fri, 02 Oct 2026 17:21:55 +0000
Received: by outflank-mailman (input) for mailman id 1439357;
 Fri, 02 Oct 2026 17:21:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgxG-0002xC-1O
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgxF-006d9A-EV
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe831-e002-0a2a0a5209dd-0a2a450bbab2-0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:53 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe830-b7e8-0a2a450b0019-aa0a817c4eb5-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:53 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-q6IY5ZZoOkKxB3WaFwfOkQ-1; Fri,
 02 Oct 2026 13:21:46 -0400
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0CD171955F08; Fri,  2 Oct 2026 17:21:45 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 416A6433; Fri,  2 Oct 2026 17:21:43 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790961711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UB4QvQO4Fa/SavRC9wKbY5DEWv7c5j74YZ2riQQtR4A=;
	b=hNGfQBL/OiHzrEUyyuo/XE1Jsy/QvvgZvl6C7hXeyEQnYju8KcRlX/4c9j8XtXBkuFZAef
	JH8GdG634Gj3d5yBZ5NUG8285w7Mt0raobAdMZ7/yZCpVXwSjQkz84AgJt41AXZZWrCDhw
	Hrxne77iZg755EIaJWwxAyfJq9oS85o=
X-MC-Unique: q6IY5ZZoOkKxB3WaFwfOkQ-1
X-Mimecast-MFC-AGG-ID: q6IY5ZZoOkKxB3WaFwfOkQ_1790961705
MIME-Version: 1.0
Subject: Re: [PATCH 10/28] hw/usb: mark commonly used USB devices/hosts as
 secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-11-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-11-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166117.3025252.2297105460212965387.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=549;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=NumlpaDMemOKFITCo+2qMeic3H03s2RpTFl/9eImaGw=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBYFDletPJUFlFEMVyQfAv+JKnuN9ifwXme
 8M4uuhy76aJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5UapD/0QcDniEQk9YvFzuhhhLF7o4WA4mDmjNvWEkEvP65tXbCx2nKGLYLYo0sGBlM6ijnFXZzq
 5ClvORJ50fSj/5pYrZ70jUS4LLdSm8qbtLPTXtFgKVwRni0wMUan0NPFoYeETk3hG1NgL0kEZ4H
 Ytx4SZ5aEYH7zMDCLebotk63cqvDdipqtFo+qjhNvvU6yXAa4DubFOxERVjA3WmMcCm0mUtVk1p
 Romcn3bHXBsH4fzvlEKRsl1trmASogHppILSaXTzZsB1Bo7UDHJTNpWopuwP+QNsr/168gPqS3p
 Q/JSPE0aFD18nkBGsrYp3/3L20ckc7feRz0r/qUeyD23wT1759WcGT2Ol1S7iV3pdDUGVTwWV3G
 4HkVfHe5GGck+U1FDMg0KONlmmfiZBK/fpQPSN0yg5fWEtPpcr7VI9QRclU/D07SI8jzWfgyYUo
 KkXRhz5A8Jy3qFAB0XPzWx4EpMg0/3yaAjDzCroLTnkoz3zRcyPLIgCXDnvUxWOFCVPQdNdVC+G
 z7FEEWW9/KZpRLa6ICR+kEKTNI6EfhIk0pr8EhC8KT34W5PYCBku0qdh+mZSSNU+sWIdwbpPDlZ
 2BMLjeozufvANd0M7tdDWIOVEjUuAtb2A5V0gDvh/5HAx1JOPB1mpp5hawjsv8SHJTHDVNdkf7K
 uw5oq/h3PnAaCTg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: ObQsjfMTyJORNX-izUi0RHLNd42N0N12OadhnTO_9QE_1790961705
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790961713-182F49EA-382B944E/0/0
X-purgate-type: clean
X-purgate-size: 551

> Most of the standardized  USB1/2/3 host controllers are relevant
> for virtualization use cases, so should be declared secure. The
> "NEC" XHCI variant is slightly non-standard, but since it is a
> trivial sub-class of the generic XHCI, there's no reason to
> exclude it.
> 
> The set of devices that are expected to be used is HID (mouse,
> tablet, keyboard), host passthrough, CCID (smartcard), hub,
> storage and the redirect tunnelling.

Can't we exclude uhci/ehci nowadays?

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


