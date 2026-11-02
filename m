Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7B606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJlZwVgP
Received: from list by lists.xenproject.org with outflank-mailman.1468322.1677466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsiN-0003HI-Vw; Mon, 02 Nov 2026 14:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468322.1677466; Mon, 02 Nov 2026 14:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsiN-0003H9-So; Mon, 02 Nov 2026 14:08:47 +0000
Received: by outflank-mailman (input) for mailman id 1468322;
 Mon, 02 Nov 2026 14:08:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNsiM-0003DH-CR
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:08:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsiL-003XTf-PO
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:08:45 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae8996d-bab6-0a2a0a5309dd-0a2a4508ad24-4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:45 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89969-f659-0a2a45080019-aa0a857c6a95-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:41 +0100
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-crF7Vc6JPmmHrsO_N-7TnA-1; Mon,
 02 Nov 2026 09:08:34 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 403571956062; Mon,  2 Nov 2026 14:08:30 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0E0831955D6F; Mon,  2 Nov 2026 14:08:28 +0000 (UTC)
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
	s=mimecast20190719; t=1793628520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=grg9FKd6iKJomJal3CYJ4U4vQMCnT6o8hFeIMXOlPVI=;
	b=OJlZwVgPF8nd3WtqOjhSlNiCL8uCyV+iHnINTNHivycsK1Laafof/Y8GNKXh3a7vOrpWgl
	Jne7/RqXZXaiDyNLdiHHd2Cd5ci/jLaYaJAI/zxWhGsoUjoC78TYctlSE4Rpa2Abtn91c0
	ydDUPn0aKv7Tiw3Ddiw9s2QVDdxLZ6E=
X-MC-Unique: crF7Vc6JPmmHrsO_N-7TnA-1
X-Mimecast-MFC-AGG-ID: crF7Vc6JPmmHrsO_N-7TnA_1793628510
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 17/18] hw/usb/redirect-server: Implement isochronous
 OUT transfers
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
In-Reply-To: <20261102092201.1729245-18-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-18-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845024.3960472.4540726377291333778.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=784;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=hJvGUxn6plNHSiGGl7omQzqPVVmIxQziy7e/MT9o/6E=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6JklfS+mn8zeM4IpV8GvoTwsJ5L78+CmeqKvL
 ELYRm1g/oyJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJQAKCRDa6OEJdZac
 5Rc7EACF+C6p8LW5n/I8XO5Cs+PHM7mSX7pum8MHr+ws1ln+w3dQa0b+q7PoE1tu0mpXYIuGXoT
 icrBIGj5rhYBjzTdohkpSDkEoMJwDn+I4d5eJiyy9DCStKHRFp7Xj6mhvUvddnMClVecKTbC526
 fSKS/93FE0eY7AU8YyCG3e2y1Jd68XaBaicRcjAqYTZM4lNrRePBHW32xYnAUjY2he8EAUXN5mc
 22lxrZ3ZC+K+OyaoM5S0sWkiT2KM7q/XvforGmwR42R39dWktzIg2M/RTk3A1C9ojYqaLvu4L4H
 FgvS+G08Cak7LpB5rTff1h1B+KDgT39Jb6fR67JChoQESX3YXt7hFgGAp0HdK40qjsjqsVTxgLO
 FB4caTSba5qalcyWgTY8b7KdyRADPk+H42fdLSXwjB6mQs0Gdruuy6I3Vkux2160eFQ/MncqAjB
 gGoryaBaaKKSPTytzsRm06wg4TXAXicnWI/ZzBFU/qVmNVuxX9Uk0GdPq2xSUyl0r9tQoGpkmC5
 uJZi1wB9Re3Q1h4jS2F2GArMXHb1P8tciSxwgqrTs3wzZW/eH5soANXhH+z7hPeoccdvAzc5MpR
 qXNqXT0S5/nOH5TImx9KUgUoiTLyGxS7HnsPJeCGoH+bsQh4InjH3mJbbGZ0s1kVJWExGjl+yAX
 aEemQuWUnWPszbA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: loNmuA_SPK_udlMdJBsNTO2YZUHTJMUqobCErc4kZHQ_1793628510
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793628522-D755C87B-4633FCA7/0/0
X-purgate-type: clean
X-purgate-size: 786
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 09:22:27 +0000, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> The protocol has three callbacks for isochronous transfers:
> start_iso_stream_func, stop_iso_stream_func and iso_packet_func.
> Isochronous has no capability bit, and the parser calls them without
> checking, so a server cannot leave them out.
> 
> Implement the three for an OUT endpoint. Endpoint 0 is control, so
> refuse it. The host sends a packet for every OUT transfer. It sends
> nothing for an IN transfer, so refuse an IN endpoint with a stall.
> Only a stall makes the host close the stream. Any other status leaves
> it open on the host side.
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


