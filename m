Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650BEC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:15:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414196.1643973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4asG-0007ZE-08; Thu, 10 Sep 2026 09:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414196.1643973; Thu, 10 Sep 2026 09:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4asF-0007Z7-Tb; Thu, 10 Sep 2026 09:15:15 +0000
Received: by outflank-mailman (input) for mailman id 1414196;
 Thu, 10 Sep 2026 09:15:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1x4asE-0007Z0-EN
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:15:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4asD-00G3Ul-Q4
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:15:13 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6aa2751c-bab6-0a2a0a5309dd-0a2a450bd7c0-18
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:15:13 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6aa27521-b7e8-0a2a450b0019-4a7de18c8d90-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:15:13 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49d097b4939so5960005e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 02:15:13 -0700 (PDT)
Received: from debian.debian ([102.213.48.6]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c38e3asm64476215e9.9.2026.09.10.02.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 02:15:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789031713; x=1789636513; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hk6ntHXUeJYTRX8HAaEa/PKmgwGWJjC3R3z8/hR5mi8=;
        b=ELxyRKE9rY7of6aqO9oGMuSs8wH4R0bo/XeWsV0/QUrzYL4TWCembP/nSIWrEyhrKk
         vHo08wbvepAZRXMW9GxVqf2x+JJQB5hU5duWKjP23GKlY9n0EOk2AAjs8X2KA/bvlx25
         5/8c37cXlKfNyxrLGp7DsnvieINOWA1HlLc+JZnbwfuIpPh09EYe+pJK1tEAXAIH/4xC
         LmgjnIeUDOUR5pnaFJmW8tyRTQY6j1OHqtTXE6sb2cnjvemMY+194xDRzXUK/dkecU56
         +E2kN5ul1Qvlx8r/h6+ehTzvQYDp6CNA3ae7+KKKTJGDHUy1HxCNzatN1WZEPGmgebTi
         NHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031713; x=1789636513;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hk6ntHXUeJYTRX8HAaEa/PKmgwGWJjC3R3z8/hR5mi8=;
        b=GgoPdomsacTRlo1oNuUKWffccftqMEyGUtryvsit9pTB0Qa6VDippFdKTtIiLjsW/3
         Uiu94ImSIaDB7X0XDdo3chsvzfmGe914iUyaqiXnooxGwUaK8jgyFVXyKwn+KyxxkLXq
         yRa9GScHsDyv4rXwZUVKIAghB4Fj79YnN6d3i/+bikJw6YHIold7eQG2y2xRmoS6LndY
         vxqnKO5c+pQPW6YWlm0hMXz6V9FE5hvMaQk8lt1vlmSNJCXrK+qzsPnfSyFSveDn91RB
         SJor9fjpYvPXv2W7y8yWghJpD9B+nTIZD4QDoLS02c6NTB3HG1oPVqiBXWDopb+1f3hj
         86mg==
X-Gm-Message-State: AFuF++kdN80hDB7KvkPXnFWS2FYs61lLLsNW/riJeRMJThNCYI1VB85a
	h21/ZtvYbvlc7iJSC2pk+xv+DvriiPwh7JqLxKoF9oFcAnOb9oOX87wenKGT+T0j
X-Gm-Gg: AYBFou0YXPLPJ8XyKaeGjx3pnfFzQkxJwmL4cbVMSsDtqyPhGnYyaySUcsPRobLeNiK
	cmsf1myLSRYprpIRu5QldaCJ8gOhdDlFcRUqXIJzR5nNY8MGZtZwTVMQLMh/iIa7raUt4dhG60E
	QuovSpHA45PWUGSBXBp55io3JJ3diCNePzqS69gOlcm2oileh31CslKF5ceRkOVkLgdQQdDaimp
	EIgBHETTccXHSCOuZP/x8tjZ9K3LtHVKKzuZh9e9IGItKw4+av/ZJ0+8ctkm4mQEQLf+HD4fw7S
	nbLBgcDfu3P2MQI3nKY+6VnY7NdLscdrKwn6lhc0r+mnshrMjgcZS9HUzIwOmAeetpcUlfpfWOe
	LwUpUI7MKTd+8kCVpgxiaT0gMcPBnTcRz+v/7HbTYw1YdbZvJKImwJDrNvPqLA/13SzO0C7qcvu
	oZlwURsyn201XWj98YWV6JY1ehkmyqRTOllaOVCc5oUAkI3VGstRHoolNm8gn2qDrA396g35EWg
	VKAukE=
X-Received: by 2002:a05:600c:310f:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49d258d85b5mr55939695e9.11.1789031712832;
        Thu, 10 Sep 2026 02:15:12 -0700 (PDT)
From: Andrew Mbugua <andrewprecious388@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Mbugua <andrewprecious388@gmail.com>
Subject: [PATCH v2] stubdom: Fix GCC 14 -Wmemset-elt-size compiler warnings in PolarSSL
Date: Thu, 10 Sep 2026 12:14:14 +0300
Message-ID: <20260910091414.22966-1-andrewprecious388@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <37902bbd-1ab9-4b49-8f94-4b788b3620d9@suse.com>
References: <37902bbd-1ab9-4b49-8f94-4b788b3620d9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789031713-A9CC79EA-C264F4A6/0/0
X-purgate-type: clean
X-purgate-size: 2067

A followup to the email thread with the previously suggested changes.

I have:
1. Added the patch reference to the Makefile
2. Removed the new subdirectory I created.
3. Formatted patch message to be <75 characters per line

When compiling Xen with GCC 14, I get a compiler warning originating from the /polarssl-x86_64/library about a memset element size mismatch:

ssl_tls.c: In function ‘ssl_session_reset’:
ssl_tls.c:1778:5: warning: ‘memset’ used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
1778 |     memset( ssl->ctx_enc, 0, 128 );
|     ^~~~~~
ssl_tls.c:1779:5: warning: ‘memset’ used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
1779 |     memset( ssl->ctx_dec, 0, 128 );
|     ^~~~~~

This patch introduces a build-time patch to PolarSSL that replaces the hardcoded
128 byte length with sizeof() allowing clean compilation without warnings.

Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
---
 stubdom/v2-0001-PATCH-stubdom-Fix-GCC-14-Wmemset-elt-size-compile.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 stubdom/v2-0001-PATCH-stubdom-Fix-GCC-14-Wmemset-elt-size-compile.patch

diff --git a/stubdom/v2-0001-PATCH-stubdom-Fix-GCC-14-Wmemset-elt-size-compile.patch b/stubdom/v2-0001-PATCH-stubdom-Fix-GCC-14-Wmemset-elt-size-compile.patch
new file mode 100644
index 0000000000..3528f2817a
--- /dev/null
+++ b/stubdom/v2-0001-PATCH-stubdom-Fix-GCC-14-Wmemset-elt-size-compile.patch
@@ -0,0 +1,13 @@
+--- a/library/ssl_tls.c
++++ b/library/ssl_tls.c
+@@ -1775,8 +1775,8 @@
+ 	memset( ssl->iv_dec, 0, 16 );
+ 	memset( ssl->mac_enc, 0, 32 );
+ 	memset( ssl->mac_dec, 0, 32 );
+-    memset( ssl->ctx_enc, 0, 128 );
+-    memset( ssl->ctx_dec, 0, 128 );
++    memset( ssl->ctx_enc, 0, sizeof( ssl->ctx_enc ) );
++    memset( ssl->ctx_dec, 0, sizeof( ssl->ctx_dec ) );
+ 
+ 	md5_starts( &ssl->fin_md5  );
+ 	sha1_starts( &ssl->fin_sha1 );
-- 
2.47.3


