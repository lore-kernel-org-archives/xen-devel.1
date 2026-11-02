Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D70606A327
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XnNkIUbX
Received: from list by lists.xenproject.org with outflank-mailman.1468292.1677420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshx-0000vM-MP; Mon, 02 Nov 2026 14:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468292.1677420; Mon, 02 Nov 2026 14:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshx-0000vD-Jc; Mon, 02 Nov 2026 14:08:21 +0000
Received: by outflank-mailman (input) for mailman id 1468292;
 Mon, 02 Nov 2026 14:08:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNshw-0000tt-24
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:08:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNshv-003XKJ-Ex
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:08:19 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae8994a-2eae-0a2a0a5409dd-0a2a4506c860-44
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:19 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89952-195a-0a2a45060019-aa0a817c99f7-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:19 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-0g3KBWzkMUCaOWTYmehgrw-1; Mon,
 02 Nov 2026 09:08:14 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 27C661945105; Mon,  2 Nov 2026 14:08:07 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2D0B51955F2D; Mon,  2 Nov 2026 14:08:05 +0000 (UTC)
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
	s=mimecast20190719; t=1793628497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2a5TS5rWxCs6ZczX1TH3d68zs8Nbe5HYRUZj/2vXxG4=;
	b=XnNkIUbX5iPRPv5Q1N60k5BnN79bF/i2ARXkX1pJZw9AXreJufPty/tEDAn4IhkWA+X7gg
	toQZAHB8jQNq6Lgrb1QGbQrdt4pcKshqzoEuOm+loSEZQQ6UroVIls8ranfd276NNVO6et
	+g1IwWGyz+vSoM0pPQscEWa21vYFqug=
X-MC-Unique: 0g3KBWzkMUCaOWTYmehgrw-1
X-Mimecast-MFC-AGG-ID: 0g3KBWzkMUCaOWTYmehgrw_1793628490
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 08/18] hw/usb/bus: Turn off the automatic hub by
 default
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
In-Reply-To: <20261102092201.1729245-9-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-9-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845015.3960472.14396103276249426058.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=450;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=Nudz+qd4gdlQDc/ZGrx4gotwouNVcd+MO6oDUjSZiSY=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6JkkV2U/dcvQN0lx278ZzYKX3QYfzOm/41fZ5
 6I+vZi7ELqJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJAAKCRDa6OEJdZac
 5ZWVD/437TbSBBA1xJg21xrSB7pZVEkGByGKb5CXRvgY9+QzON3K6zcnFGy0/dokDG/DuaM2Tma
 OCouJsTSV1RAVpSDx1g50k37nG8N25WU0eP3MENkJnCbpkhUjfzgSr1cCyH+ilwbQZRFDbUFzC+
 wkUSbI6tJZoxIUftngJtPl5PBErNPdtug97xn/45QSwXZsFbLqMeTbyLF8Ogej2CkQoiP1O7Zx/
 wib0bbVkSHW3Iwkbp9NFj3fUHp0PeWT3ZpkUCYWgfSkj0cxDCbFIsFLeqhqA58nXgrhHRPseuek
 zd7k8uqUvyI2vPlVA8aWGmFknpQAjPZbfYIJs8BcdMkRu/OqyzsWk2l79hyAG+z7rKE2zxjtejr
 dJJNDcz9J2o70hA6I2HArMKjj5PguK8bPBIoa6n77UW7Et+nnVE4YlhvFChX3FF1BujvGr0cWtf
 iLXZ5PtPxJB5M3sKxk8yPJdQrePljSvxhr9MCTT6qb+x1wGlYx7iOy5xPeyZcJH49JcvSWcWp4n
 MrAikT3HU29M0PaJlukV4OgxvJUN2MANu/YYoDESaD+BCPsp73Y65GyEQTr5t7uhFgd42cIjlMm
 H72ahLRYayxcx+dmBA1sX24evFrDGNVwzXi8KvPXOj2wLa6TlGkx3bLvBgG4kXPNAIaoRqHaxRE
 RYbqwv3/IlnAOTQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: -sS4nqpnxSVtrvxFYfBp1-lvXPvbpAtkO4v6jPSzkYI_1793628490
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793628499-FE47377B-168011E1/0/0
X-purgate-type: clean
X-purgate-size: 452
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 09:22:14 +0000, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> Every bus creator now sets auto_hub from its own property, or clears
> it outright, so the value usb_bus_new() leaves there is never read.
> 
> Drop the line. A new bus then has no hub unless its controller asks
> for one.
> 
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


