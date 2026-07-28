Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D21C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:32:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1373884.1620802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogyF-0007mB-NK; Tue, 28 Jul 2026 12:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1373884.1620802; Tue, 28 Jul 2026 12:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogyF-0007m4-Jx; Tue, 28 Jul 2026 12:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1373884;
 Tue, 28 Jul 2026 12:31:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wogyD-0007lZ-PD
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:31:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogyC-00EhVK-VP
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:31:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a68a126-bab6-0a2a0a5309dd-0a2a45088d06-20
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:31:40 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a68a12c-f659-0a2a45080019-d1558033ad9f-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:31:40 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso28573735e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 05:31:40 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bfc2ff2sm275005885e9.4.2026.07.28.05.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 05:31:39 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785241900; x=1785846700; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDIpI4MXR6JW9/lyk1jFX9uCfLWAYMMczk+RuMgqE3w=;
        b=MpLr/pZCKASrUT0I4pUk/Le606mrgvnqol9tRmjXSe6mnNveZrGmIH+r9mDBq4cn14
         Ls0k3AfGdci3Vo/xNCyh2bIweiamPXw0ACz0jnGf/XC598UOohdftdX2yBX+e/itRWJ6
         nKpXzMJQxbBwjlmKu+IygxrfqYoclZdOJCGnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241900; x=1785846700;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YDIpI4MXR6JW9/lyk1jFX9uCfLWAYMMczk+RuMgqE3w=;
        b=h0bt62juMcssRnH0eADSmlMYlpmq1+teS+tGuVH32GA8NMKw/GF8L2+iWYvmOoQQ1w
         KxpHeozvAXwKAm387W3laRdIKKE60uj1NDiq7cN+ux/YMQD7wV9OGGkRM+TLdOP+XpA8
         AuLKqxYKxuU6DHpAA8VoZ6zotLWXkWL0qxwrbqsXgVHF2VaHwbEX50fWV/bV4BOLRl+1
         HmjSZXoGwJZrqW8XhlUtkreiIjytEb5tPuiWGcIVLNLmiw+PqpcZKMmuJRbosJXnMpcq
         mbCuTjk2kE3c5x9T1y3Pb/TPzkTmbL7KX6HEc3g8Xqsh6Vhd9xzyoy332b1lMqYUGM/D
         Hgxg==
X-Gm-Message-State: AOJu0YyPMieSLx7yPSViPaFRV49uiTQV6BSH8hNripOHlKivwFABcYmQ
	0PR9wZ7rGQmhm4LQu8M2p01cKXzqa6mzkngElYMdHVgE1bjPq1MtmmGyC4vDT+6okTdwhxIgTHc
	1SvdY
X-Gm-Gg: AR+sD10b09SC5m2gKtwP1Tfh9JNnRn0ye+yqXfZWCuNbnCa0GA3qJvia4ipRt3T40Gx
	g6DRYzyWwea5uqJl5YGZ5kQNLXsLVBwxvmlozxMIfElkg2iMxcasP9A0p/aL3Wcuk09zurcd6/B
	4K1vG41h04pb5NXJO0d6GfSrU5nVlOBzf9DxUAgnyctTPMC4ipIWiLMV10R5SgY7TH+luxf3Vpp
	Biw7Qv4An8EoMX2sRmEaTBt+JWze72arNh+TICzqTfYm/QDzAnowRt/IhJaTv+wQ7VQpIkZQFqv
	0aM6I7mzAYFEeHSxlgc+fLm8OToPM/yyOwRFKjIEC0b+0XrD0CdrAhA3nkGhCMhkqNpsPPjPF3X
	rSeoawc3YwECXabFtwciNoACdVLtKKKw5uilupCnLh8Wv9VlI+a0njlZjN1pj7Qa/mKsSdDzCOZ
	v9dvYdUBgzvEMOE4Y3ATqUGuEYtZYVRFAIohGpVXPowCAthcCK7cdvnQcWCOLLmKH/6jQWBh2CU
	+TWxja6JYm6uIScov2CO7SCVvz98sEG2+OvKJY=
X-Received: by 2002:a05:600c:4f86:b0:496:c933:c276 with SMTP id 5b1f17b1804b1-496c933c2afmr12997745e9.25.1785241899731;
        Tue, 28 Jul 2026 05:31:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/vrtc: Use a real type for rtc_ioport_write()
Date: Tue, 28 Jul 2026 13:31:37 +0100
Message-Id: <20260728123137.41861-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785241900-CCF4F87B-88FBD152/0/0
X-purgate-type: clean
X-purgate-size: 860

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/rtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 65b3b79f1edb..9895dd570c65 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -469,9 +469,8 @@ static void cf_check rtc_alarm_cb(void *opaque)
     spin_unlock(&s->lock);
 }
 
-static int rtc_ioport_write(void *opaque, uint32_t addr, uint32_t data)
+static int rtc_ioport_write(RTCState *s, uint32_t addr, uint32_t data)
 {
-    RTCState *s = opaque;
     struct domain *d = vrtc_domain(s);
     uint32_t orig;
 

base-commit: 75f920bd47a4f59eaaa4596aa3f4e12a447d26d2
-- 
2.39.5


