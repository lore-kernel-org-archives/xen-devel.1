Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E13606A32C
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eX3WtDWU
Received: from list by lists.xenproject.org with outflank-mailman.1468293.1677428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshy-00011J-5U; Mon, 02 Nov 2026 14:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468293.1677428; Mon, 02 Nov 2026 14:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNshx-000118-Vr; Mon, 02 Nov 2026 14:08:21 +0000
Received: by outflank-mailman (input) for mailman id 1468293;
 Mon, 02 Nov 2026 14:08:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNshw-0000uC-Hn
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:08:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNshv-003XKJ-Ur
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:08:19 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae8994a-2eae-0a2a0a5409dd-0a2a4506c860-48
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:19 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89952-195a-0a2a45060019-aa0a857c61ad-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:19 +0100
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-ifbzGeCfMVW4F7APk82Ang-1; Mon,
 02 Nov 2026 09:08:17 -0500
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5AB6119344AC; Mon,  2 Nov 2026 14:08:11 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CF589433; Mon,  2 Nov 2026 14:08:09 +0000 (UTC)
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
	s=mimecast20190719; t=1793628498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRYFyhvztTbkAukZo7KAzMM/k2TGcsNGgppNT+XfV2o=;
	b=eX3WtDWUblNk3+BMkD77vFNvdW+cA5HhX4gihjKUcRB4KIAfD1DDHCOYKRS763qSFHxP3n
	5evKG/nbXbrepQRuS+AFfYUYlRTr4RArXbkfkSOrFlfOkYM6naHqNDJ1HprlfTA+a0bLEj
	LQDt5JjLUawSJWpSMLFqY02GXWW1aYY=
X-MC-Unique: ifbzGeCfMVW4F7APk82Ang-1
X-Mimecast-MFC-AGG-ID: ifbzGeCfMVW4F7APk82Ang_1793628493
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 09/18] hw/arm/npcm7xx: Keep the automatic hub
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
In-Reply-To: <20261102092201.1729245-10-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-10-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845015.3960472.7956229698285370567.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=651;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=F1IrbKA0eXHyGj63rZO602lR1wmaDvVNygpKzIbsQX0=;
 b=owEBbAKT/ZANAwAKAdro4Ql1lpzlAcsmYgBq6JkkeaLYF+AtHQBBK7iTU+SkFbe1mwtPh4elo
 swuBjx87TyJAjIEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJAAKCRDa6OEJdZac
 5SL/D/dEgMfDef1nufgtacHeM88sqlRC+DndeOTQhU+jJEmw5Jl465vxJWDG1uMDBnu9zRSiVRp
 iGwEI8+ROjB7aGGdaREGVUlaSDL44AOBVsBgrK9QywI4KydZs6E9u9nI9IPcqHaUkQgNpku5/C8
 q8pk+c9VLHEV60NjWH9Ya6YVqfjDSZjcvmJUz3aArt2tCkLHemIFPSF6FgYqOv+wGAVeGoJHks3
 +qSJR/FAknrfwg0y9zi4FYc2I3B4AWCeNY0mh+8GQCHNidCwuhmAY0X7ePAUW2hALVcYr6FyXQN
 OVrqxFvsZ8xIecbayAUjXqqqVJ5oFz1lJwoOIyB4k03s6nxMrgB/dlA4HUyaGjPJQeLoOr6+5DL
 tpUkRHegrPCLQiMqkpg363qgtkKeLMNvTifN6PqveL6TtD5rm0DAGakKYVBimKlv+sPWlYgubtv
 hVhsfcFnvNg+sAmsdwbpEclwiUtfNNEU5T9eCRCcZ3CZkDWjF1BL7+cpAm4JaY4YOa6Y40QN6uv
 0xiRH7UPu1P32e0QJFrEGzczet9k6qVatluWoEdG1eyDNLSz9lsF8qAviXZkjBwS2xNczzlFFGP
 pE3cEuae9dtzJiTw2yDqyP1YoBc/6aYdgecqa646ZGdczk7lzFoxulYYUBWxRMQNgCi/XaLDfaq
 eKQ6YpIiTytZ9
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: hBH6EevUc4WhyKUNneabo7NPLXBYRHjSvJ6t8-S-9uA_1793628493
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793628499-FDE0E77B-77FF54B2/0/0
X-purgate-type: clean
X-purgate-size: 653
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The OHCI companion has one port, so a second device only fits behind
> the hub.
> 
> npcm7xx has no versioned machine type, so compat cannot reach it. Turn
> the property on here instead. The companion shares the EHCI bus, so
> the EHCI carries the property.
> 
> Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Message-ID: <20261102092201.1729245-10-jamin_lin@aspeedtech.com>

Place this patch before the previous one, turning the default to false.
otherwise
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


