Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0F606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 20:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=TAW9OJWl
Received: from list by lists.xenproject.org with outflank-mailman.1462558.1673520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLncN-0005f3-F0; Tue, 27 Oct 2026 20:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462558.1673520; Tue, 27 Oct 2026 20:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLncN-0005ew-CK; Tue, 27 Oct 2026 20:17:59 +0000
Received: by outflank-mailman (input) for mailman id 1462558;
 Tue, 27 Oct 2026 20:17:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLncL-0005eq-UD
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 20:17:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLncL-007nwe-B7
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:17:57 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae106d6-2eae-0a2a0a5409dd-0a2a450cb3fe-16
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 21:17:57 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae106f5-f479-0a2a450c0019-d155802ee02e-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 21:17:57 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so2253095e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 13:17:57 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb958sm24982630f8f.21.2026.10.27.13.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 13:17:55 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793132277; x=1793737077; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATh9wI+eZXV8F4DwxJkBeu2dfkL4E8a3k8cFUhbqXxI=;
        b=TAW9OJWl+YLYK/efPqym3JPt+6EvddtSLre9nvHl626YxbU/pEds3HcFkh1rGtgL0Z
         dvGZtKuA6MTLELMWzb/8TlAh3v07W7cn/VaH4DmuSu4pNZnrVhGOYEPs9//2HYoPwyLw
         OT5RzoaVd1OpzaWyrFECrbboTKvQ+pbtWKsVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132277; x=1793737077;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATh9wI+eZXV8F4DwxJkBeu2dfkL4E8a3k8cFUhbqXxI=;
        b=1IiSPWYSF0N4bx0vQn83GcZSpWM2Y8Fo3EPWR7c0ojNOYfhFQ7P2+MTDQn8BAeFYqb
         VJ1O2kmdbJLiNrgvuKY42c2sRJCFaIgx4aRwl0wBYyucHQ3wr8jvf+WbscA5WeY8q4/O
         M31HrI9wnnGjcid2R0DEg2z1b1MSD0LNKanQUw+0vGuMeluY018K4Vb2HjEqcw9DvfQA
         mTJbBMKAapWNQNSsw/TJV9l/1Jbt/Kz8AQgzR2w7ugeaWeHmGb8q6C7Py7fjy9bcXyYT
         bm/0Jx23mjFLYHGeAYsCrgCdjrfcyPbZDe1r182MLW3RK3y3IZ0Aa7RTvvCWznmbzDaY
         eZNg==
X-Gm-Message-State: AFq9FYItmycbxKKwArh8r/pvApQ5k6bwJSjsqC0DTbqDvnNxEk/YIohz
	OUuoI1Gtyi5oJTiYtkemwbSrEiER2y68g9mkXTPKZA84q9cqluG1LGIFqu6eHKTMRC1iOUf9dFx
	reMK9
X-Gm-Gg: AYBFou1tuQe289PoKgFBWxfCeJ6zz5larQux5Ey8auItMIAMibAYMCtJtDXkMVTWV+W
	0DNyCDlT+uAHU9XskESrZWCqqUUinBdrR6VsKh1f+b8o+R0t/HkTT2d26yyqAFngq6X8gxkhHu6
	L7imQRY4NkHoFZdhMxfGePhUiNFsRYwZf28F47zXZMkmR7gpTmfDnjClwfOt/BX5er0qxyIPeTp
	w9gOeNV53X9Q9MKcIyZpBn8Bx/xT2uwMS43z3Hy7FGD6bDahTRlJa2bQIyiemAlNUfK6yaSGWSE
	BsWoGQoZXy4eMghxoM/XeX4SyNeVYvfT6USZaaK5TLYrDyPGp+k0XADlL/LrNxcarj3+38JlRDH
	mSl06udS6eqljlJ0Ppn5v30tKondKHSb72BDnOKybTgXMhfLadtfcou2pe7LRXCONY1DxIbF5md
	5d3982jA64kFh88n2YJpthEPJm6YgaXcwmLjv8eIK7xfYv5fslVhtaGmDiiPrp2wSw0Gcvm4Lu3
	bNV5Yd8csafKpXzUjKronitqo3z3JPGq6c3Pbac5FzTphWDJZdBiSOkMcZx/FeGkbhiIQ9PcJYE
	lolMA224r3sXih+gbCtY3NkN0AT2Xg==
X-Received: by 2002:a05:600c:4705:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a966587157mr804115e9.16.1793132276137;
        Tue, 27 Oct 2026 13:17:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] xen/vcpu: Improve code generation for VCPUOP_register_runstate_memory_area
Date: Tue, 27 Oct 2026 20:17:54 +0000
Message-Id: <20261027201754.1307173-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793132277-768DDA5B-9F666EBE/10/78276251493
X-purgate-type: spam
X-purgate-size: 3367
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both XLAT_vcpu_runstate_info() and __copy_to_guest() are common paths in their
respective cases, but the optimiser can't/doesn't merge them.

Rearrange the code to do so explicitly.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

Bloat-o-meter reports:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-110 (-110)
  Function                                     old     new   delta
  common_vcpu_op                              1943    1902     -41
  compat_vcpu_op                               967     898     -69

and the size of the stack frame doesn't change at all.
---
 xen/arch/x86/x86_64/domain.c | 13 ++++++-------
 xen/common/domain.c          | 11 +++++------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
index 533b0b21a00e..1510d593b18c 100644
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -44,6 +44,7 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
         struct compat_vcpu_register_runstate_memory_area area;
         struct compat_vcpu_runstate_info info;
+        struct vcpu_runstate_info runstate, *rs;
 
         area.addr.p = 0;
 
@@ -64,16 +65,14 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         /* Update the newly-registered runstate area, best-effort. */
         if ( v == current )
-        {
-            XLAT_vcpu_runstate_info(&info, &v->runstate);
-        }
+            rs = &v->runstate;
         else
         {
-            struct vcpu_runstate_info runstate;
-
-            vcpu_runstate_get(v, &runstate);
-            XLAT_vcpu_runstate_info(&info, &runstate);
+            rs = &runstate;
+            vcpu_runstate_get(v, rs);
         }
+
+        XLAT_vcpu_runstate_info(&info, rs);
         __copy_to_guest(v->runstate_guest.compat, &info, 1);
 
         break;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index b41be89cd0b9..2e6a1f9b98f7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2318,7 +2318,7 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
     case VCPUOP_register_runstate_memory_area:
     {
         struct vcpu_register_runstate_memory_area area;
-        struct vcpu_runstate_info runstate;
+        struct vcpu_runstate_info runstate, *rs;
 
         rc = -EFAULT;
         if ( copy_from_guest(&area, arg, 1) )
@@ -2340,15 +2340,14 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         /* Update the newly-registered runstate area, best-effort. */
         if ( v == current )
-        {
-            __copy_to_guest(runstate_guest(v), &v->runstate, 1);
-        }
+            rs = &v->runstate;
         else
         {
-            vcpu_runstate_get(v, &runstate);
-            __copy_to_guest(runstate_guest(v), &runstate, 1);
+            rs = &runstate;
+            vcpu_runstate_get(v, rs);
         }
 
+        __copy_to_guest(runstate_guest(v), rs, 1);
         break;
     }
 

base-commit: 8b0a70ddd29dec2f86a49c21e3664a21e281e859
-- 
2.39.5


