Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1794F606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/DnW1cT
Received: from list by lists.xenproject.org with outflank-mailman.1468280.1677393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshd-00082P-0k; Mon, 02 Nov 2026 14:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468280.1677393; Mon, 02 Nov 2026 14:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshc-00082I-Tt; Mon, 02 Nov 2026 14:08:00 +0000
Received: by outflank-mailman (input) for mailman id 1468280;
 Mon, 02 Nov 2026 14:07:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNshb-000811-Kz
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:07:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNshb-007Y92-1f
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:07:59 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89939-8faa-0a2a0a5109dd-0a2a4506e672-16
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:07:58 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae8993d-195a-0a2a45060019-aa0a857c8219-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:07:58 +0100
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-sl2zB3mHMeO8i9epNF4Fhg-1; Mon,
 02 Nov 2026 09:07:50 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D4594195422B; Mon,  2 Nov 2026 14:07:46 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6426C18004D2; Mon,  2 Nov 2026 14:07:45 +0000 (UTC)
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
	s=mimecast20190719; t=1793628477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8UkF76rOA+R/bzzQhBPO/5rNjot4yoXLkNOM1wEb6A=;
	b=B/DnW1cTtYR2SeE0e1YU5N9toikzlp7pDOp31lF05IVRarzRBojlGU/rBNRIHoEqWfMNMJ
	nLaGS1eauOTgm6KeEfSw/Kvre+ZaxVRH9AoJsGACVLy77ByCdFFO/V4Tc2nhGOQ7LQ/jA6
	3hYQ/oA4Bb+BVCD5lUHpoFbkr1UejMY=
X-MC-Unique: sl2zB3mHMeO8i9epNF4Fhg-1
X-Mimecast-MFC-AGG-ID: sl2zB3mHMeO8i9epNF4Fhg_1793628467
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 03/18] hw/usb/hcd-ehci: Add an auto-hub property and
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
In-Reply-To: <20261102092201.1729245-4-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-4-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845008.3960472.13227280986218616.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=371;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=yfCsSOOnBldxtUpgAiHg2GXOvQ4ejNkzWXnqcPh11rw=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6Jkk+FqgdgJ1ryAryryF+euMWILnvP+H9zHy4
 aWZGXnpZWKJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJAAKCRDa6OEJdZac
 5WBKEACTUedqwjS6+j3hO+HQnsv5p3MZZvimPadovFF+iP92+zZssJQAxprN226AftwEtokbGXM
 wDyfEKVYK9fH4HyrZ0duDom7/gecn+WaDEv4PsIyF1K3u1T0ovZ9ERl1aSHtMT1xojjut62C3m3
 BP5MTLSzeTpbX7brASYa2UNoJk7eNBf4/SpDllDrvgmZ6CrO3MR10jxMoZYJpD8zRW5TpzqvPU4
 7jjPNocpusE39QAgZ7KWpM2JqDHbQ2D6m7QpOwHUQrCQpOJML72jhotkIcLGWwwQoqC4jARUaVJ
 KsG2556qSgYqS4+wqbec+b1WzFW+dtH/tb0PuZ+c/6UxIjW1DO2slQ/cgpeUTfLSy/7Dx9QoCle
 hSOeipUgVKqpDg7CFgQ6mC7VIkmbiPGs0xEjfWhlrUToEYccPlieVsuq0tBXq7GXRyemZ18hkgo
 Kg6KrNXyxTKV3DzZl9/zrBHi1nQvkGdhT5++7qNpWm2avCRk92Kxi2RqIhFjVth5lSvL/eLN4w3
 0+4Wec2joJVAcKBW7uXwiGAjB3wMLAJAho4pWX1fkENMpGMy3gJo0cQroz4V9bg+f48hgwvalTs
 +ZOlsBKlhc3ZbW9+B4nQU6izGAp5Qkm+yZwLNz8xiXuEfBp1bJihELODzbMuQ0EN41iO6rDEgjt
 0gOEtAxSAcifxSA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: xs5dyuTb90ZqdDoza4Kz-ZwTzXI-exCi1KyGKEVJ6E0_1793628467
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793628478-F6C7777B-03D2F974/0/0
X-purgate-type: clean
X-purgate-size: 373
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 09:22:07 +0000, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> Add auto-hub and leave it off. hw_compat_11_1 turns it on, so an older
> machine type keeps the hub it has today and a guest saved by an older
> QEMU still loads.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


