Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D1606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DQST9K+N
Received: from list by lists.xenproject.org with outflank-mailman.1468357.1677475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsm2-0005nK-J4; Mon, 02 Nov 2026 14:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468357.1677475; Mon, 02 Nov 2026 14:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsm2-0005nD-Ft; Mon, 02 Nov 2026 14:12:34 +0000
Received: by outflank-mailman (input) for mailman id 1468357;
 Mon, 02 Nov 2026 14:12:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNsm1-0005n7-4Q
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:12:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsm0-007yH2-Ge
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:12:32 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89a50-e002-0a2a0a5209dd-0a2a4502bce8-4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:12:32 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae8995e-6ca4-0a2a45020019-aa0a817ccfe3-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:31 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-mJ4JNnACMwicqCOteu9lag-1; Mon,
 02 Nov 2026 09:08:25 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B2FB9195422C; Mon,  2 Nov 2026 14:08:22 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AE84730000E7; Mon,  2 Nov 2026 14:08:21 +0000 (UTC)
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
	s=mimecast20190719; t=1793628510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=030gJmT9UekNLg5uV1gpIRhINlOB7XDE6KrDWsvJ1K0=;
	b=DQST9K+Nk5GNgVMyoCHljRz+xo4M1XJwl5sxnQeExpX11lCvLUJPq4cD6KL9RAelxmZYAm
	wga+ikKoRHvhkrsenzvx9FZtv11GHKg3jx7B4ae13877UwyWkrJPX7bud2ENbPYcDfP1kc
	wNMTMnKedfpzgvz8M2kVggK2R3bmNOw=
X-MC-Unique: mJ4JNnACMwicqCOteu9lag-1
X-Mimecast-MFC-AGG-ID: mJ4JNnACMwicqCOteu9lag_1793628502
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 15/18] hw/usb/redirect-server: Implement bulk and
 interrupt transfers
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
In-Reply-To: <20261102092201.1729245-16-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-16-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845020.3960472.7447031612361559961.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=688;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=+KSs9MRyfQyRbvEU+lEOIbs6SMYIAp0GuAa4j3Lwip4=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6JkkPcqWQnGOPrWOAku7tGCS7NAyoNCBQ2w3D
 1ptE1OyWTmJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJAAKCRDa6OEJdZac
 5Xy1D/wNJtCfhTJSS2+MPdCGTSdjyPGv6qKvL2LbjZRRrUkpZDsqkkW0cbdiq1XIbTGJjuNk4Tw
 n12Meo+cPm09uleBjvKo7e4L5/9BAfm6GjYyVuK/rMddDRhGScaS3r8oNUzPsVZq9NlyuRkruWj
 E4IfcPybW373Q9BnyddjTQdjYj7fO7TV5oRCNjyYq1akDzq4xAA2dxnrXXKLoRtSH9o1BHJpW8d
 VCeWQPpnEambZ42lOXj01Ko5mwXqZdDe5mE0R3pFJWCwoMTiNd4TjV75YA6uL6ImggWD6ZFxgnZ
 YtFYdca60pcrtAx85xbkKQJFGTGHRq7Ez4cvsxj0yXS/M/cJsM8AsnnNzX3pisJ01d5UHx7VN6m
 7AsvT5fK//9p4D+icQHUakIODNQ/N5DcgRKV3hB3Bp/2ZymG8gs6UQB7NOD2mu2xJiYMpZ/CQXA
 VONw/Oc/iWtCiOhJyS2qH1Pm5cmklqVcVlOqeKS3juDtyjFNHKHE9ES+p+bKCkY5RtXPqm9BpkW
 nmvKo2RXx9wGhTXXXkUiMs5dEZaWXP/vSn8bdTxAYBdNC7Rhb2ISg8abxwf+fhTtPcMtYu0/QlT
 EvwkgSGXH7Sbh+7zuwmgbS2qOpfzVmBkNtSQpu1T6twffEia6Okg8rvRB3qFlyfhrWls3n3dg4T
 qXPMxSmMKGfmrzw==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: fQquL0goRr4iv-9mRIl7X5A8xDi6F9-fOoe5BxVAAI0_1793628502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793628511-66CB22AC-976B2CD9/13/0
X-purgate-type: clean.bounce
X-purgate-size: 690
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 09:22:24 +0000, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> Send bulk and interrupt packets to the device and return the result to
> the host. Each one is a request and an answer, so they reuse the packet
> tracking and the NAK handling added for control transfers.
> 
> A bulk request carries a 32 bit length, so the host can ask us to
> allocate up to 4 GB. Refuse a request that big. Do not answer it with
> fewer bytes instead: the host counts the bytes it gets back, and it
> resets the device when some are missing.
> 
> [...]

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


