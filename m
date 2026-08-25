Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577C1C61DB9
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 18:47:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399377.1635475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wywAS-0004Bu-Gq; Tue, 25 Aug 2026 18:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399377.1635475; Tue, 25 Aug 2026 18:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wywAS-0004Bn-EF; Tue, 25 Aug 2026 18:46:40 +0000
Received: by outflank-mailman (input) for mailman id 1399377;
 Tue, 25 Aug 2026 18:46:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1wywAR-0004Bh-QU
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 18:46:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wywAQ-005jvt-Pe
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 20:46:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a8de30d-2eae-0a2a0a5409dd-0a2a4504b478-8
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 20:46:38 +0200
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a8de30e-b57f-0a2a45040019-d155d02ec8e6-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 20:46:38 +0200
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-69f7fa1c548so150900a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 11:46:38 -0700 (PDT)
Received: from debian.debian ([102.213.48.6]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5deafc5fbsm788440a12.29.2026.08.25.11.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 11:46:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683598; x=1788288398; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDmNtQPJrIeDcaKmZnWEk6NqB3Ijs7mbrXXLbwSCRrs=;
        b=RlGHPwBTSSZ/Rg6PfUfgTmgslAa2LzFTIEpLET+Xw5r8T4d3fov2NUGa7PLE46mNLE
         vOF09frdSgY/TscLsJc90BO1QqyCAnmZwifCpTy+wmhEji9z69JUG15mV2ZxCefQAxOA
         TLtcYQOwVT9REeBV0x3vm2FqvCoK1q8hIzlylb82/EReZZrgqgqZHu04M56TR2hpHdIL
         aZlKejGqBMxo5rxX3I39LdmQ73iJANEsI42S7QD/eF1e7TQa3FyU15B+wMsmRY3PBkJJ
         qK9NXqXFW/jBwk/3DWZWtqV//LusKmjs/ePGc2l1Gt7IhPr/3Oknv6kjEt4EuDRJRd+e
         IB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683598; x=1788288398;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qDmNtQPJrIeDcaKmZnWEk6NqB3Ijs7mbrXXLbwSCRrs=;
        b=LLYZN6UUq11PaoT9qWWOKCiOM6hHOdXiyP/mf3a0CQySeJ66C7hYrOXBH/XalVPNl7
         bZvdmq/X9gHf6GGYBGRT7MwOYhKP+JuWDuMVrOtOEGWuyva4YfgcxQiwc5/yyXd8E9nk
         3WUUXC4sZEXOE2gAT9V3qhAnvHk1liOD8N0O6lbemUUFAaUT73i39vKzQujwqC23cF3c
         XhtUH1LGqW9W75pUmsJnO2lmjl1yqE/FiqIWq89QhlBlaUw+U73epPzT9UGgxqFyYXjN
         R1RZfS8CGnXZxC7XsQxwen0Y3naNf80YTO7mgeGJZk23Xs7ce2qLoVOwx1QC518Cv6MY
         DKzA==
X-Gm-Message-State: AFuF++lHQGGwU1/IE07wGR7PYX5JUs1v5djMdOYNodzu2hxdhzjsPWur
	cV5NZH7iSsZEuKuTxslvxhyiqtJUvGNLEJhs3cfpHes34dwDe/dqgrExZdisToN/Elc=
X-Gm-Gg: AR+sD11db+CGOROvthgtuaJMh4L4nrIA9ny2UIUcfLVEtAYJcHlTN25EGn3sJdxoJ90
	u6FQzZ6l8CqIYflXGUze4yulcrccbnIv3ewDzAmElMcbNgjqzWZdL6BW6adS3fn4fFrh40RwFc7
	4f7WWYOy4iSxjTjLu8ZidefopDu3cj8VOUMeg+zMXxaSNIV2CdJ0Ja1O9pDT/9mv4iUisQ1XHJY
	C3fIN6Tc6V0NW+4Vh6GjNQ5DtsCGqlMsYhiK2CxkAXMnwGw19ra9ZZ1bliWcMdeaJ1bpjZEM9se
	L6N1exp4Z4Av15nbVNqB7EtTvLTGuqd9vGF4E0K57RMvNiiJbjGSVJKlTq5WLJhrZTl8aq3k9qP
	Tt35Hc4FTus+C6KZHrxhOIrtS//AMxkXMuTUvDQWn80/3gIs20R4n/x6fkZPi/kISUTI0g20cm8
	6sujQT1oBQ7HWJMf/5qKuPFYs+TPRJtIDJKBkBhZR4ZTllnWne9sl+lRslKdZX3l+TTVZu1g==
X-Received: by 2002:a05:6402:5057:b0:6a5:dd97:23ea with SMTP id 4fb4d7f45d1cf-6a5df65b681mr1015758a12.11.1787683598073;
        Tue, 25 Aug 2026 11:46:38 -0700 (PDT)
From: Andrew Mbugua <andrewprecious388@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	samuel.thibault@ens-lyon.org,
	Andrew Mbugua <andrewprecious388@gmail.com>
Subject: [PATCH] stubdom: Fix GCC 14 -Wmemset-elt-size compiler warnings in PolarSSL
Date: Tue, 25 Aug 2026 21:46:04 +0300
Message-ID: <20260825184605.79318-1-andrewprecious388@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787683598-52ECEB50-D1F5776D/0/0
X-purgate-type: clean
X-purgate-size: 1726

When compiling Xen with GCC 14, I get a compiler warning originating from the /polarssl-x86_64/library about a memset element size mismatch:

ssl_tls.c: In function ‘ssl_session_reset’:
ssl_tls.c:1778:5: warning: ‘memset’ used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
1778 |     memset( ssl->ctx_enc, 0, 128 );
|     ^~~~~~
ssl_tls.c:1779:5: warning: ‘memset’ used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
1779 |     memset( ssl->ctx_dec, 0, 128 );
|     ^~~~~~

This patch introduces a build-time patch to PolarSSL that replaces the hardcoded 128 byte length with a dynamic sizeof(), thus allowing clean compilation without warnings.

Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
---
 stubdom/patches/polarssl-gcc14-memset.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 stubdom/patches/polarssl-gcc14-memset.patch

diff --git a/stubdom/patches/polarssl-gcc14-memset.patch b/stubdom/patches/polarssl-gcc14-memset.patch
new file mode 100644
index 0000000000..d98664d0a8
--- /dev/null
+++ b/stubdom/patches/polarssl-gcc14-memset.patch
@@ -0,0 +1,13 @@
+--- a/library/ssl_tls.c
++++ b/library/ssl_tls.c
+@@ -1775,8 +1775,8 @@
+     memset( ssl->iv_dec, 0, 16 );
+     memset( ssl->mac_enc, 0, 32 );
+     memset( ssl->mac_dec, 0, 32 );
+-    memset( ssl->ctx_enc, 0, 128 );
+-    memset( ssl->ctx_dec, 0, 128 );
++    memset( ssl->ctx_enc, 0, sizeof( *ssl->ctx_enc) );
++    memset( ssl->ctx_dec, 0, sizeof( *ssl->ctx_dec) );
+ 
+      md5_starts( &ssl->fin_md5  );
+     sha1_starts( &ssl->fin_sha1 );
-- 
2.47.3


