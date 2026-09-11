Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824A7C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 20:16:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417881.1646428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x57fL-0007p0-0Z; Fri, 11 Sep 2026 20:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417881.1646428; Fri, 11 Sep 2026 20:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x57fK-0007ot-U2; Fri, 11 Sep 2026 20:16:06 +0000
Received: by outflank-mailman (input) for mailman id 1417881;
 Fri, 11 Sep 2026 20:16:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x57fI-0007oU-UH
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 20:16:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x57fI-00AA6A-B1
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 22:16:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa46122-8faa-0a2a0a5109dd-0a2a4509d854-32
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 22:16:04 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa46184-be1a-0a2a45090019-d1558032c9a8-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 22:16:04 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso14950355e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:16:04 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26be3e0asm196055565e9.1.2026.09.11.13.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 13:16:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1789157763; x=1789762563; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=momxIyehCGQOyxryb3A4m/ZgrOarR4Zu7NPnAmjz7Vc=;
        b=YUMIZCo87LuGCAYgufeU6CPG0rzbN1ikL4jEh2LEmz3h8Wf0J+mcNJfbYEpxqWWZ3j
         mUcNhETfUUIy7az5PqSJSH++OfNIeDc4SBS707b8hy768RgOHrvZS61xBBqW+HeTgizS
         3dYvJU7BuzBJBDui+SOl7ui1VZTQIcn2p2v9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789157763; x=1789762563;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=momxIyehCGQOyxryb3A4m/ZgrOarR4Zu7NPnAmjz7Vc=;
        b=AYeesxjSFj8hDL51v4mpOSU2mNoF1S0MwTW1iMg2D53xd9NH8kaYWpqsejgr+9Yztx
         pXdKX39xEuzyMAd12pa/KkmN8yuiIkqmAg0u+mX/rXP8SpvlLsXK7VSC2sjj7KXlVnBt
         13t2YcSpeXPdSWg2oZojwtmmY47Su3VANjOB6rXJYshnhlZG4AVzO6SO+/grGQfCNrMJ
         c0kjXJCaWulvAjhknWrLsl1ywGuUSSJrBKC1P0ZHqQOkFjWtQAgromuVjaMO3n4bCGJn
         zPO0d/6EX6E5eg4Oyzq8N8m+H6dZ4qq0G4wotdfEYJnmW6zWnXCSFmK/TsXGG/SDGkkL
         sokg==
X-Gm-Message-State: AFuF++mlL3ogovYweMesEmJ0A94j4rUqZ7BVW308X3GUBtYQGyMfzG4M
	Q1oFfGVS8i92ouzBgAF9OJowwk9ke7APZy7akDfQ+ocXX3YMFEp0FHZ6/pdwMmDFhtEsTE7Dco9
	LrqYf
X-Gm-Gg: AYBFou1KjnmrbsggC0/W2TJBGnwWZitMcKDWG3AjEZEBaOI/8BYy+FuWeg+DF8uz9Xv
	moiMbeUmVHKc5tmPzBpRVaf7uIvr8Bge49UvoKR7JJKwp5pznsL1qT6d7Dws0lwlBEvWZM+6vgG
	odIIiyvP59gpLGh3crzRwv74RjOGADsTWo2FdjSa3Zo9YV7Jq6scQAOyZJpafkNC215Y9xjTriM
	AMeK5Ag+luH0RdFsPfSWFSJyOiHT/qxp8zKYtP8qtCuReQTNWeLYIVcJHtSK6fLR9kK0UeQpbBw
	/AqlXREPcsEfAAMOJwgBoG/jlVUCm1c3eKn0W5CPDeDVcywKKT1lRkrRFYT0CXOtPy+LttnYWQi
	YNbJPr168ni6Bx6mRVSudZXIDkJaksnlrzzD+FwYYOKMAbOBX64TBYlVTyIyjAlYVqga0f6YzCH
	LZsakwlxfJJ27R2QhweoxXLS/6DZjIzLxKuzn8mcwS+ac4xLyzk7ZM+YFfySu04ExUHre6YdyAK
	kA+OCPJtHwYL5+/MqhKOnx/pxJIloA9NRGX3ByTFON+0XBGZaplRRsd3JaR
X-Received: by 2002:a05:600c:548b:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49e619cecc2mr71683005e9.23.1789157763110;
        Fri, 11 Sep 2026 13:16:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/build: Remove leading space in xen.efi.S rule
Date: Fri, 11 Sep 2026 21:16:01 +0100
Message-Id: <20260911201601.3682596-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1789157764-3A4DB034-81CF7E9B/0/0
X-purgate-type: clean
X-purgate-size: 1016

It happens to be benign, but it causes emacs to ask:

  Suspicious line 194. Save anyway? (y or n)

whenever saving the file.

Fixes: da944a72fdf4 ("x86: split xen-syms/xen.efi linking rules")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index ee2573c2fb0f..8a205c3d27ff 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -191,7 +191,7 @@ ifeq ($(XEN_BUILD_PE),y)
 .$(TARGET).efi.%s.S:
 	$(NM) -pa --format=sysv $< \
 	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
- 	    --source-name=$(TARGET).efi.S \
+	    --source-name=$(TARGET).efi.S \
 	  > $@
 
 # See above for why $(note_file) needs removing here.

base-commit: 6bdb8d45b749a4f376d0380ff9503162b14b8468
-- 
2.39.5


