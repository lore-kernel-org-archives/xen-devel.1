Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE3606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WFj5v9TP
Received: from list by lists.xenproject.org with outflank-mailman.1468278.1677385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshY-0007jw-Qr; Mon, 02 Nov 2026 14:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468278.1677385; Mon, 02 Nov 2026 14:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshY-0007jp-NZ; Mon, 02 Nov 2026 14:07:56 +0000
Received: by outflank-mailman (input) for mailman id 1468278;
 Mon, 02 Nov 2026 14:07:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNshX-0007iu-9E
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:07:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNshW-007Y92-Et
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:07:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae8992e-8faa-0a2a0a5109dd-0a2a4508847a-30
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:07:54 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89938-f659-0a2a45080019-aa0a817c6d91-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:07:54 +0100
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-lAfKHIXJMZWbUsX_UCa8uQ-1; Mon,
 02 Nov 2026 09:07:48 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 14FEF1977008; Mon,  2 Nov 2026 14:07:43 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 70EEE1955F19; Mon,  2 Nov 2026 14:07:40 +0000 (UTC)
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
	s=mimecast20190719; t=1793628472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEtWt0ywoktnh6mhoKNd5DTBXrDsdzUzNxQyljlmsAY=;
	b=WFj5v9TP8wb1oLIMnFah0nR3lboUuz1gyoAI77Z3NB/KXWI2kjD0uT3oWPnT1VUa7tFTzz
	TIXxM+v3M+hxYbmOIE4eFrszwQnp3XqfEUP01KRnVDmN/jhFMRJhZ2HP6+M+kL1EBhmGGx
	zwtSWeqhO06TJ51UyXYbK7YgLMlMxHM=
X-MC-Unique: lAfKHIXJMZWbUsX_UCa8uQ-1
X-Mimecast-MFC-AGG-ID: lAfKHIXJMZWbUsX_UCa8uQ_1793628464
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 02/18] hw/usb/hcd-xhci: Add an auto-hub property and
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
In-Reply-To: <20261102092201.1729245-3-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-3-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845007.3960472.348635338762646824.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=468;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=b1ORYX9wRq2P8Ku8O3hUxGG/61rybAHzAtu+euwuruk=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6Jkk9WNIJnAlaMF97YixRq3aAJuURXOUHALzt
 KidcdMCFwCJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJAAKCRDa6OEJdZac
 5c1TD/41nRxtxmbhCsvLoKOOj+dU2VFX/dJ1y6UQrNPEL/8P5kuRsBPXx29b7qkcQNKxHhw3Fdb
 Q4D3HOgD9Yimw5y5/cxj6LmGbEdCCGV4x5Iewxe9lg9idNLTi7liZhCYWKz9HCfVnwhPLimonAf
 vP3aPCa+76VLxw1f7gSFqu9E99Jmodv7sC4fxxjLWcmY3OjH7P0/F2Y75NKnNEreCW6PPV3ZUL7
 8VIVpKvSbpFYEGwf1YpYS5kIbT/gJwkrYleGjPpEUYTmnnq6bah0lLBCG4vBYxj7UJ9ZwbJOyBR
 TUynoZ53OB2vDjpGQdx39SiRRgCx5FFHgJg46j0skUZYo20e76cxuSn07RwqujkR58w1a5bNqL6
 v1yc06WhmUCGEm3WNLs4UFg5JTcjm0oqyDhGZnwApqou2cycVWHHS2dr6UUAjeQ9e9g1TOB1pRt
 Qb9n6dVdpEGhU+cL3i8mvWjYhqEUflEmVGHzUqzlaYrSLpQO2sqo651o9mQNamSq/RysoDo+yRO
 XJqmUWtmjipfQ16xrPk1MAs7vt0bZtzHALiW/dIjXkgaEcIDlWjCNoLPMemPLEr6tENTKp25q7A
 9puw9aVDEb+znGHdqpW6VHsQIuQ+tL+QPPI71csHGlsgLkSkNBPud92bd/sHDteFWBFNNrEo2lM
 xYEWItyXJPU0ZjQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: OCB49AKFtYV3NAr4nV0YvbwG6vJyUYOIdRTOj9jOXEQ_1793628464
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793628474-D594A87B-5DC70686/0/0
X-purgate-type: clean
X-purgate-size: 470
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 09:22:05 +0000, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> xHCI has up to 15 root ports and does not need a hub to fit more
> devices.
> 
> Add auto-hub and leave it off. hw_compat_11_1 turns it on, so an older
> machine type keeps the hub it has today and a guest saved by an older
> QEMU still loads.
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


