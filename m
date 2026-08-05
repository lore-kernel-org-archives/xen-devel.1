Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B18C55ABF
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:45:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383389.1626660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrazy-0004Q5-8K; Wed, 05 Aug 2026 12:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383389.1626660; Wed, 05 Aug 2026 12:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrazy-0004Py-5j; Wed, 05 Aug 2026 12:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1383389;
 Wed, 05 Aug 2026 12:45:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wrazx-0004Pk-CU
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:45:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrazw-007AOn-PI
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:45:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a73305a-bab6-0a2a0a5309dd-0a2a4508d3fa-22
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:28 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a733068-f659-0a2a45080019-d155dd2aa57d-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:28 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47de008b020so573330f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:45:28 -0700 (PDT)
Received: from andrew-laptop.. ([157.231.70.114])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23e533sm8779762f8f.28.2026.08.05.05.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 05:45:27 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785933928; x=1786538728; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkOlx3mU5UhqIngqtbxU1MfSfxL2gIQyRof2hmDeYxw=;
        b=CWwbAXb961dFVc+q8Cjfpnmzg4H9KXGWmGd5IT3UL95w8OLN719HVBc+sdTC8Bwe4t
         nlIV3dbdCGsAQAvo8kD8JyeP3asFsGlj49/rS6vJnjIIbwpFPZmzIy6zXyTKthvxeh0/
         j70YCHF1cdvQCfLDubDckbf8QIKbcTdknGPdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785933928; x=1786538728;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qkOlx3mU5UhqIngqtbxU1MfSfxL2gIQyRof2hmDeYxw=;
        b=Sto+ZeFd9++sE6uASMPMMffTLiRhBkyz92gPQn0tCnT10+zM9xbJvq6C1QL0ZQXOhE
         cOdncjSHZ8afCm1JhbIsA208fawb/bHbe96HT39V4rjGotOZNrqXx4zMIKoN8pJ9c95Y
         fxjBZIsUa5sf+Wg/MBiJdtB9FjWp9DIhVkxyE8qN3b0Z0JDKVTF24iN41nqKuIZQqV7l
         6NTzYpZUhS8pVN3I+RLoqfIz+VMcIoEgaEGPjl6XfG7XgvSCNJCzbU4neo3bGV8mUKSH
         y0OocBXQyNJLqrY+c0pADmSE3GmGnbm1tB9uleEyxGuOzRB9Hvatq6KPqg1w5HQ/gTfD
         TlnQ==
X-Gm-Message-State: AOJu0YwGBDI7GihvxrAga2v3h311bFUuc064NeDV+kdj/MquXmUoTDT5
	OhjWMx8zeS4P0kxUROvKTHH4El9gOjxPC5XuWTzvG1YVtIGLhij2ekGYhfXov9NgT+M826xNLx7
	glyQo
X-Gm-Gg: AR+sD13JaJvVugZiGAwpQa3zZch85z5FHOidHzXnJ9u4vzWMp4guc8giOtYNx5g7gVt
	gU5OfT/6g2/zFKiHz0YRP6YhDKJtWqkCTaPC8EUetQ9MJ84pNGCECxiO+1L7nHb4b1hCZeuEIxp
	rMB+0J9KV5JcIIHPB5abV51L9j4XrAIjrG+Ms+bdEFX4MybwfKBOhL7u0pgUebNaksjyubLfcfK
	cd/OKJ4h43Q1MPNxEPuil5vDQCAl6VLYTcG7bJLODV1OtbBiZ/zJ3+nJ+AIsGqrOPlIxiV/Bl1W
	pepiJiS2sqvjCBwSGJEFnclmQzOH4B0wC3Z5dYtYLD2H7OhxbxFmWDkZE3vSaD2IkSsp3gx9MYf
	a1JgA8yJNOiSGPWzqY26EMsRigfOXkvyUclRqE7QurETcFD7cX4qVVI1MxiI0i5wii0x2Pr1Jpb
	eicExxrHno8zVVeOSalKR+aBsC6W3D0vmQYZY8ooKq6FT1MmxwFQC+rsEkTvti7gvkz0YBn7UEj
	nCIUaPAw0U=
X-Received: by 2002:a05:6000:2989:10b0:47f:7ea0:6c20 with SMTP id ffacd0b85a97d-47fec629365mr9292314f8f.15.1785933927607;
        Wed, 05 Aug 2026 05:45:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 0/5] x86/nmi: Watchdog fixes/improvement Part 1
Date: Wed,  5 Aug 2026 13:45:20 +0100
Message-Id: <20260805124525.105457-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785933928-D6B4187B-A509A04A/0/0
X-purgate-type: clean
X-purgate-size: 692

This is the start of a very long rabbit hole to address the
mis-classification of some watchdog NMIs as non-watchdog NMIs.  For
now, just some simple and hopefully non-controvertial changes.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2733861049

Andrew Cooper (5):
  x86/nmi: Drop {reserve,release}_lapic_nmi()
  x86/nmi: Drop K7_NMI_EVENT
  x86/nmi: Misc style fixes
  x86/nmi: Check MSR_MISC_ENABLE for all Intel platforms
  x86/nmi: Don't configure EvtSel repeatedly

 xen/arch/x86/include/asm/apic.h |   2 -
 xen/arch/x86/nmi.c              | 153 ++++++++++----------------------
 2 files changed, 47 insertions(+), 108 deletions(-)

-- 
2.34.1


