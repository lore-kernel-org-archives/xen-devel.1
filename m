Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27954606A33F
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZIJv/gmU
Received: from list by lists.xenproject.org with outflank-mailman.1471980.1680073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObom-0008B2-2g; Wed, 04 Nov 2026 14:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471980.1680073; Wed, 04 Nov 2026 14:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObom-0008Av-04; Wed, 04 Nov 2026 14:18:24 +0000
Received: by outflank-mailman (input) for mailman id 1471980;
 Wed, 04 Nov 2026 14:18:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1xObok-0008Ao-3y
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:18:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOboj-006VoV-Gy
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 15:18:21 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6aeb3ead-e002-0a2a0a5209dd-0a2a4501dee2-0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:18:21 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6aeb3ead-5984-0a2a45010019-d155dd36bcd5-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:18:21 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48c45111bebso371427f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 06:18:21 -0800 (PST)
Received: from andrew-B650M-DS3H.. ([102.213.49.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8748sm4203955f8f.16.2026.11.04.06.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 06:18:19 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801901; x=1794406701; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xHxxC+uoeAFYFHz/KDliWgJlTU3QRuBEN3NX80yiIhI=;
        b=ZIJv/gmUjV/dkYFBYqPe1YWXkRkhf1T49ArJW1zJ205pNQHqRFB5Swe0z4/3d8SKac
         0usdscSMOmh1VUvg3wPdPmGo8X36D2Jd9XIv/9w9fWsvaDFmnuGslxViu0qQjg9tOOq+
         faO6nDrVcWfcX/vvr05QrlTf1AwbYTqnUoCnHvUyBBIsaxiMwqSXk2bh9+0ajbsmAKVq
         QJszDGzm2Buvv55YhMkCTn0RQvdG9sGK0oziboMkokx0EahU9A8i+H1oTozkr5W1UmAM
         hG6O+MHX4gfryHwdPoYLJhfwBFV66hSS5821IiZ1N6DOTXcKLG8u3b6kXGoVVghe+KV4
         jxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801901; x=1794406701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHxxC+uoeAFYFHz/KDliWgJlTU3QRuBEN3NX80yiIhI=;
        b=s26SeUz3YNjW0ImogVP9WxACrKT6t3uFCBQ4gdSRj2dumJ6XFWKoT6Quj71LkhybPm
         0HX8H2eyuIiINuuBJuCr6v9GVYypZg5HN2jAsE5SuWapxhxWMvVEfVN3SLJdkrFGHWhG
         vESzpYCPrlKN4KpnFzQxGVlz+nPsF7Dqybvf4EHsjw/B664q+CUGuN1V/WqoHRuSVuC3
         G272JGfgf+PdJ8hv06er/laVn8oXOozDC0cVpCefR6E2NG7MFoO2iweK5eJdq4+zRd06
         RLbVhOlS/sJTlKBqX+0WmWguQsU0x9RZ69EZ8SobDGTQ8dyol+3W8XXCPuElGV/tiwU9
         oc4w==
X-Gm-Message-State: APuU4Z8n66i4IJRja1qFCjOFX6JQwohB10mn2VrrSv5k6Z+gCHVUHrzz
	9U0GHbWP66HQDTAvqr1Yg4/qirQtivfqGWFZZhupIBDmfT0S+1fO5qymg5mJxUlR
X-Gm-Gg: AYBFou2oJknMwzqoXWaWW9h5LDuCAbdBRWmxxXmTNVno2Xel7Cf/RZU6kzLq+PbGQOl
	jvo8x371RwmLvheDpWctyDYDBf597ToSW1ibzsoLuvSeMzl715jAAqVC5fv5kMsfNtifGvoR6Gu
	QGtxKu5gyAkqKTE7fNdbxNrd5zFRrcBVX5ZUZeHUqzHONFnkR7HObLO++RaoQr6lWvxQLdRFNdc
	2Ll2jT/jQhM6e9tuD2+tXNnVZDVI7f/aY30ZI3wWf5GF6XChDA1MJcH0ztA9UkkAZeFTqz2rZkB
	J2WpZ4jdLnBhqMKL2kVBDBzFk+Obq57o5tuH3d5e3iGL5f9AqFzRX0vuwmN+v3EI7ZwhZPXPMIM
	ZA/WryrrSwM7ybVZYLmFC9QIRwN4HqmQCn6ZceC4ZLTAbr7mDAvoiRZTVWFo8/88XyA1Hm/fYLN
	08Jte6+3JcsG3UM9vYRHsW4nqI6Jd50s+Cz037X86/9h9G1+Fv6OcH/EIL+dRfNy7lOL6Ni6fgf
	mewcjT6WIChGCRiUGrbApxXF7ny5H32LYcnQ3njwD3MvVXb7UqrrR1t481JkiaVDhqX5XnVWXgv
	dx8Kmm8GM4CfYkoerzem1pWhJjihsP9Ib8OCjnJqRvkOOz0=
X-Received: by 2002:a05:6000:40dc:b0:48e:412:3829 with SMTP id ffacd0b85a97d-48e6e3071f9mr37430249f8f.15.1793801900396;
        Wed, 04 Nov 2026 06:18:20 -0800 (PST)
From: Andrew Mbugua <andrewprecious388@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Mbugua <andrewprecious388@gmail.com>
Subject: [PATCH] tools/libs/guest: LZMA_OPTIONS_ERROR message cleanup
Date: Wed,  4 Nov 2026 17:18:13 +0300
Message-ID: <20261104141813.312697-1-andrewprecious388@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793801901-1F86F757-C2867395/0/0
X-purgate-type: clean
X-purgate-size: 1145
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Code cleanup. No functional change.

The current message is formatted as:

DOMPRINTF("%s: %s decompression error: %s",
__FUNCTION__, what, msg);
free(out_buf);
goto lzma_cleanup;

Which outputs: Unsupported compression options

I have formatted the message to give insight to users who may encounter
compression filters such as BCJ filters without cluttering the log output.

The other option was to simply remove the "// FIXME: Better message?"
line and leave the message as is to cleanup the codebase.


Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
---
diff --git a/tools/libs/guest/xg_dom_bzimageloader.c b/tools/libs/guest/xg_dom_bzimageloader.c
index 32b3c682a4..a7ad260c27 100644
--- a/tools/libs/guest/xg_dom_bzimageloader.c
+++ b/tools/libs/guest/xg_dom_bzimageloader.c
@@ -217,8 +217,7 @@ static int _xc_try_lzma_decode(
             break;
 
         case LZMA_OPTIONS_ERROR:
-            // FIXME: Better message?
-            msg = "Unsupported compression options";
+            msg = "Unsupported compression options or filters";
             break;
 
         case LZMA_DATA_ERROR:

