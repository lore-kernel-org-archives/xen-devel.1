Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C81606A32C
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gUzsLU3k
Received: from list by lists.xenproject.org with outflank-mailman.1468300.1677438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsi4-0001eR-8w; Mon, 02 Nov 2026 14:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468300.1677438; Mon, 02 Nov 2026 14:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsi4-0001eK-6A; Mon, 02 Nov 2026 14:08:28 +0000
Received: by outflank-mailman (input) for mailman id 1468300;
 Mon, 02 Nov 2026 14:08:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xNsi3-0001b1-DP
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:08:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsi2-00B54T-QM
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:08:26 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89953-bab6-0a2a0a5309dd-0a2a45019ee0-38
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:26 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ae89959-5984-0a2a45010019-aa0a817c66c9-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:08:26 +0100
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-601-xT9HtkvIMUaHA7Q0hLoKuw-1; Mon,
 02 Nov 2026 09:08:19 -0500
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 400E01800366; Mon,  2 Nov 2026 14:08:15 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0D9BE7E1; Mon,  2 Nov 2026 14:08:13 +0000 (UTC)
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
	s=mimecast20190719; t=1793628505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGCFPtpTZ9u/tCuCVR5OeilylS8JCqg+dr/Jv3b4oww=;
	b=gUzsLU3kM1kpB0SvwzWiJ9V3HOvBi/kR4ZgDUqbtvDpdOIjXE5NhKcwtCdZ1RKSeR1AHZc
	vXssufadb+uiKgMKQhWMllgKEBCgE8Qs0VytphSu4YgAzH3+qPcBRZKoxtORadiw0bgIFR
	yhu93Hfd54qEbcSMvWz2E3niGMpCixY=
X-MC-Unique: xT9HtkvIMUaHA7Q0hLoKuw-1
X-Mimecast-MFC-AGG-ID: xT9HtkvIMUaHA7Q0hLoKuw_1793628497
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 10/18] docs/system/devices/usb: Note the automatic
 hub change
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
In-Reply-To: <20261102092201.1729245-11-jamin_lin@aspeedtech.com>
References: <20261102092201.1729245-1-jamin_lin@aspeedtech.com>
 <20261102092201.1729245-11-jamin_lin@aspeedtech.com>
Date: Mon, 02 Nov 2026 18:07:30 +0400
Message-Id: <179362845017.3960472.16366950842648422107.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=259;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=hShHjS3Opzh5WvrzOcbOzg/lyKy92JVRpoFQlRo0mKY=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq6Jkks8ybnqu/RpOGj7O5d0ggoaZn9DQ/LvCFW
 Wqh+UvahM+JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCauiZJAAKCRDa6OEJdZac
 5SKOD/0ZEtKtES9Jn0R7HdJhSLO0xpnaWSHqMf739qoghn6ZKMY+naQLgWU5BIfwxJQsXapiVMs
 rsdF8iQL3RkMct0PWt1FvPqyVdS+um2ibRHeU0ze/GeKq5nvajSA4GOf6Lijvswi8OjxHxExguY
 UEYHfGNSsVBqdhOLMtuaUvT0cfj3LSGxKvsDBaRkgn+DE9dVVrkGX23E+LpvhD2H/qQTOco/ovI
 SNTR1luDWIzUg3JmVSx8SC/uaTJ8k50mMJDpTJqu1UQ7PkWICzj+Ek4mNenjZPv9etbUQy6FaS+
 dSR0Olb4tij7c860xH6IKAY1rQDl4AQiFQ5XAg82X7kkXNgNaiea6kdz1vzcWaYQMIPpgaCYAKf
 nh9GWQ5h7zu4s/FJ14oSrs34lkroeYrpTFhvzWrk07oIwY5Xrr8O1uxolwq85OQOv632eTKV4mi
 LMdBdFMzLnqAqsZ70ggL/z5ycMDBuHnQJI3M0zXfjnT0an7JROw17cEbKU9wKsDnF5XP1tyIk2X
 HJSy8+w11uepaOokEe6rYjNOgGGvVFY1s9WCMQCMwoZhL7lcBbGkuTNRkOSzIm5vWvGMiFEnchJ
 4xhzQ1WVjCtccUxvyFahMfsAFpQJumN0Fy9J7m/ya9OV78076lRTLx2lHcNN/1hlYKz7sxkIQcs
 iu7hOElOK/KCc+g==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: WedsLkpaxQ_XJ2RZYbdtb7AH2IwCnFZ_JytsDJao6gs_1793628497
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793628506-BC558757-0A15BF24/0/0
X-purgate-type: clean
X-purgate-size: 261
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 09:22:17 +0000, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> The automatic hub is now off for a new machine type.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


