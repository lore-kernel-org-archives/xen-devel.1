Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76FA606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 22:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOEKrBE6
Received: from list by lists.xenproject.org with outflank-mailman.1504185.1699716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWhyM-0006vR-Nz; Thu, 26 Nov 2026 22:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504185.1699716; Thu, 26 Nov 2026 22:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWhyM-0006vE-KD; Thu, 26 Nov 2026 22:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1504185;
 Thu, 26 Nov 2026 22:29:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 1xWhyK-0006hN-M0
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:29:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWhyK-007qNu-24
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 23:29:44 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b08b275-e002-0a2a0a5209dd-0a2a4502d5bc-22
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 23:29:44 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b08b2d7-4900-0a2a45020019-d155802db83c-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 23:29:44 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so75694535e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:29:43 -0800 (PST)
Received: from bala-Latitude-5580.. ([129.0.189.183])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b7515sm871972235e9.13.2026.11.26.14.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 14:29:43 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732183; x=1796336983; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k6HnbUcdcBaWXY6DEvsjjzv+zVTB4gQneKA/qZOpamg=;
        b=xOEKrBE6zoJMFjHddKV5I654A00oh5UG2P8nzcnkwmKg5kFxF5Y5mYAuUt3IeMZVKE
         /ouWrwwL6U7EmGm6hE9MkpaNQxjWjq5CNmPHpDFGr0weYV8aF4IMLXpoHJV4PewsWAdE
         8iZP5KIzFt/9zjIQCu3EojLkCi9hFGinJY35Y+uezAdp8Xs4KodBaU7WrS1696HdMZKq
         lkoJEpYVGwFUWf58q60YqUVRFXGa+Fpn/ZJfUlvBWpk/fS9mdlfie8d37iBSmFfIQC3o
         O/IMRFQqdJokdGEAqrD0umFc2PGIwL4dKaH9Zx46Qb86FbYExhTKBm2TYvs33UfT9NyV
         5Phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732183; x=1796336983;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6HnbUcdcBaWXY6DEvsjjzv+zVTB4gQneKA/qZOpamg=;
        b=aNlNhIf2Z92SgQYadTBcZNRoCr1wtZAoD14sCoW9OEBekqrUGQiFshieiyH+tMDTWZ
         3D0poVhWsjkI1ACCCDTxw/6vqYHx4v3bGpyMkCDcHQ/TnXJJTxMjKPHw4dr2b/zPY+RA
         AJ9N1w9kJtFwqRfziJ641FrdwwcKWrHOwHg7dIL0wbNp/jGjaU5qVXZCDEnlG2kfKdxy
         Gj3qaHB9VBn+HjBEKX9reiGCsdDKPydjp9RTDrIY4h6ohfrSyn09fCa5CTFxSyzBdf8k
         QthEnJhEoiyxQAemU0fq2U7hxcUMY9kgumBJ+P2SmRQ5si01ygiGgFeU8ZWF9WgFHhw7
         pbug==
X-Gm-Message-State: APuU4Z+Rca8FlXPElulS1LthNs4u3f2O3Nh+1JTYPGcTm9iIUtLV01Gi
	fve2T9YqS1hnx+i/f4qOj12B80T6ak2o9B9HCt3Qq9sGmkDfATWYTbkzehxinx6g
X-Gm-Gg: AZFdTZf54y0ZoJao4a3sdwUwzTH4xKFjjx8U9Hxko82SFHKvsutmooxiR8izcsqfkOz
	/HXtqtiLA6BOsSNUHSO9E+2BsOGxZQbJQ2VHk7/bKqjwzAWhZzUHEK3cG/vwroy/utoEL6kw7G7
	eU2YDnMkTCTQ6lmdqrhftUhwWDQVGKujh6wkZ4MRp2dpfmx91Nc6ZfJ74uFrsZmoe1/2YO5YO7+
	6rhNGqGEuYajP8i0pREwdGUylsd6EZGwhYf4GZt460obKoL+axBXSmwCfYHH78Aob+drzXbn3cl
	tDIUMpbqN5ob6IGRKEiBMHegtEHvmEIFiycUMVzyMT2gdzzt+J0C2i81Z7uzeJm8NcMUg/FCnxa
	cXmrfviOmtCKZijxZFU7MqYC8mw45g+pXwEiItNHoYZL1yzoS2MuBXDkVIs0XkXiMRwIoL7ezZm
	e0I00Wq9CXQMiE+qg78e5bZ+RiCCsv2JdiyxujN2o8NKV/U+d8kc8CGV/ivzPgLCWrkbrCvI4XO
	r/eGYkLyxY4CqqEKsvoSPX5gFIRVKNZjalWsdUgYKBo2hAnck427GuQBSXYTZnOY8nKV3ccRGkK
	lv/yQPvt+tx/2BSlAWzPx+XyKbTZjYE9foU1v82HH1RGYvlNxFq+evQwsNDIkw==
X-Received: by 2002:a05:600c:820e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb887c9936mr447232645e9.1.1795732183393;
        Thu, 26 Nov 2026 14:29:43 -0800 (PST)
From: =?UTF-8?q?Bala=20Andegue=20Fran=C3=A7ois=20Lionnel?= <balaandeguefrancoislionnel@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/3] docs/man: fix typo in xen-vtpmmgr.7
Date: Thu, 26 Nov 2026 23:29:18 +0100
Message-Id: <20261126222918.951621-4-balaandeguefrancoislionnel@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20261126222918.951621-1-balaandeguefrancoislionnel@gmail.com>
References: <20261126222918.951621-1-balaandeguefrancoislionnel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1795732184-F2B976C6-2D7D3898/0/0
X-purgate-type: clean
X-purgate-size: 1128
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix the misspelling "vTPM manger" -> "vTPM manager" in the section
about the incomplete TPM 2.0 support.

Found with codespell. No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Bala Andegue François Lionnel <balaandeguefrancoislionnel@gmail.com>
---
 docs/man/xen-vtpmmgr.7.pod | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
index 95854adb0885..15ab3c7bac5b 100644
--- a/docs/man/xen-vtpmmgr.7.pod
+++ b/docs/man/xen-vtpmmgr.7.pod
@@ -235,7 +235,7 @@ TPM 2.0 support for vTPM manager is incomplete.  There is no support for
 persisting an encryption key, so vTPM manager regenerates primary and secondary
 key handles each boot.
 
-Also, the vTPM manger group command implementation hardcodes TPM 1.2 commands.
+Also, the vTPM manager group command implementation hardcodes TPM 1.2 commands.
 This means running manage-vtpmmgr.pl fails when the TPM 2.0 hardware rejects
 the TPM 1.2 commands.  vTPM manager with TPM 2.0 cannot create groups and
 therefore cannot persist vTPM contents.
-- 
2.39.2


