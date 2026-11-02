Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A3B60A2637
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sb7s1sjH
Received: from list by lists.xenproject.org with outflank-mailman.1468368.1677502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsn2-0006v4-9G; Mon, 02 Nov 2026 14:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468368.1677502; Mon, 02 Nov 2026 14:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsn2-0006uw-54; Mon, 02 Nov 2026 14:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1468368;
 Mon, 02 Nov 2026 14:13:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNsn0-0006tB-Nj
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:13:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsn0-00H72k-49
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:13:34 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89a86-8faa-0a2a0a5109dd-0a2a45029806-18
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:13:33 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89960-6ca4-0a2a45020019-aa0a857c4ebd-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:33 +0100
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-_M8_NFfANFOt9i6xUkdRvg-1; Mon,
 02 Nov 2026 09:08:28 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1597F1955F28; Mon,  2 Nov 2026 14:08:26 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 01E8A1956049; Mon,  2 Nov 2026 14:08:24 +0000 (UTC)
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
	s=mimecast20190719; t=1793628512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m5AxJABtUjhPH0VKiaWYWLYGlmOV99WIySfO7K7RwbY=;
	b=Sb7s1sjHFyKx7B4sNYglZF3mFaEsxgX0/s4gL3b++38Xb5rtr9hWPU6EnHZiRT+T5kM2el
	rANxN2L6d7Op9ZwiLU9eIGENg7r5sF3wsBUAmrtsH/jk/71rvQ17Liqksm4QeIlUcJGK/T
	uLjt19RU3KvUhhNVEuvWc6CQnty5eug=
X-MC-Unique: _M8_NFfANFOt9i6xUkdRvg-1
X-Mimecast-MFC-AGG-ID: _M8_NFfANFOt9i6xUkdRvg_1793628506
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 16/18] hw/usb/redirect-server: Stream interrupt IN
 endpoints
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
In-Reply-To: <20261102092201.1729245-17-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-17-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845022.3960472.7149018835120290019.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=TyfjPl6Lgm8UNGDmROu5LHcqrGAlz9tyrpdNL8OotC0=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6Jkkkje6d1wtaLxQWLGZIajGkc23jr3gOUspm
 3ASTAxEMyKJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJAAKCRDa6OEJdZac
 5T6tD/9D/gkZAqCeh/AA+ooUg2bIId70Ip/ZbgSWTXJnMwNYpRa4IVa9XTDjKS6aQ3ISHbiys1X
 do5GvFmrKFO/ZsOczKvYBEKdW/NDq+34BoHAMuDxJ/ylfMGX33BT2nP5rWIrnzkWbf7/dObC4mb
 vGdW5YrS7H3Fk4AIWZ32Wqm1VBcjyZ1WwZ6TcFjN2iEza1/A0qUGBKr+zBP0wFZLk9g2A9l+fGc
 +usYHrgfywsIFD7Z3dm5j1UWHV+Hde9Jog0z9rGS7FGsu7QR9FOVIshQt1QVPXVCRkPgVj/8bmv
 Kl80hB7vEoM0jEdlXkhBSExH3NgvvC3Kei8K3Ib4DhIte0IQnKzzCekaWngdF5meStKUX51U1JG
 ZSe2h79btEJ+nJf/LkUqnUpgJ0P3LnbVP172AFunGEeb1XPNlKx09puC8nSFVJnHLutN0JXet/C
 EGll2La3iTyBaMkgvjIC1PLFgB0Y6rrotM5h1tfSWmGr8wAvY3R0xNcyrtN4bJZ1yjBEJ5E/9Jn
 RnPyhyhbFyAHec3vi2ABkHNE25iwgnZk+0oSkpj9phj68xuBDiuB14LxdXSGYslWVuHoWTaWI5k
 yVOiYrdKDZUfEezWd0uVnEPJhM7Ct8CQLkO4cMop6tKqzfDsQuhjmz4LKRWB0fqJqaPB+5gGwCI
 LKo2QnUPfJq55sg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: WX0A5Raaz5M4lYtidajwpHgbDHMBBcyCZbxG8bs1N-U_1793628506
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793628513-311CF2AC-16E58B7A/0/0
X-purgate-type: clean
X-purgate-size: 900
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 09:22:26 +0000, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> Interrupt IN is not a request and an answer in usbredir. The host asks
> once with start_interrupt_receiving. After that it expects a packet
> every time the device has data.
> 
> Park one IN packet on the device for each streaming endpoint. A device
> that answers USB_RET_ASYNC holds the packet and completes it when it
> has data. A device that answers USB_RET_NAK gives the packet back at
> once, so park a new one when the bus reports a wakeup on that endpoint.
> A slow timer parks one too, for a device that does not report a wakeup.
> A streamed request does not wait on the endpoint's list the way a host
> request does, because this timer already asks again.
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


