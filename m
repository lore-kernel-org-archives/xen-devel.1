Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4C4C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 16:16:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376361.1623115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp6wW-0004Lb-H5; Wed, 29 Jul 2026 16:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376361.1623115; Wed, 29 Jul 2026 16:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp6wW-0004LU-EF; Wed, 29 Jul 2026 16:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1376361;
 Wed, 29 Jul 2026 16:15:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wp6wU-0004L9-Ok
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:15:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp6wU-00ArQN-4K
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:15:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a6a270a-5cb7-0a2a0a5109dd-0a2a450ab9bc-42
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:15:38 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a6a2729-f2d2-0a2a450a0019-d155802cd82e-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:15:38 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-496b7622a83so7594865e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:15:38 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d70144sm68720345e9.2.2026.07.29.09.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 09:15:36 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785341737; x=1785946537; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dtvZiYwSHS33FtnNW1o0fe0Vzea1tne6rzBctTwe9Q=;
        b=nrjP5PpSZtGCGqMkHALkh/gNpTjuK4azT2n7hkwfDTkmYf0HqkPncQYCQJ9W8FoaPr
         UusO8l2Nw7++OIPSjx+LR92q6wjoJPlMCfMm+THgFWVkE1jpA2+MV/wkjrX/ugK1/Lfv
         ZNtWUCm9TjCo5l8JBc8Y9ZQm0X1ppwKR/k5Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341737; x=1785946537;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9dtvZiYwSHS33FtnNW1o0fe0Vzea1tne6rzBctTwe9Q=;
        b=Q2kUUS1BZupfOPANsN0rS4YhMMccJuhfr84MPXhHrb59qBf90aOEIa8BichR23rPIy
         SO/zJyPMzqtuMLn2BKgt4Hc36kOetJvIy8MI5i5uHfshBKs3MDTnAaWmkkxU3euV2xgy
         +k9wfsAXJO3WJKgeaeJWAKOO+xiISVwBnm64VZgMvtRIj/dfkdLlRKlwOcG0MHEUpJ9K
         3bJktY9j1tez6UnGk1RNmBdiymEQpTmVzuhaImpAOTzw8I2fa+Bmi9N8Zlmsju7v1Xtj
         GIL7V4veRpSCUc5BHvcOBKZ5g2FFqZsMQVOyU7HK7RtRR3EzS1wlADKK5qgmQmvOhrgK
         zKsw==
X-Gm-Message-State: AOJu0Yzkh2M4R21RnyRgv5tL6upr6OAyVXT+rcGxPtG0kxH421OBC/xn
	c7NcVAK/W5r8wAa70MS/xjjQsquHSsyw964bQPsjUGiaCJrr5o3WlXuhmTZzYhPTio4pP7U+tLv
	uYigb
X-Gm-Gg: AR+sD13eDW3Jbkx6mNwfjTTJN7CbYavC5IJaPnFsPeYUZAA2a13OPTxXkv2v3xQP+fL
	uPigLc/HRr/PThleq0yG72OVOoCET52+IYgHiNrQjzUsVMce8tyAqWr2kcX1QSYxp86UV3NWLGX
	o84fojWKoNmWW45vS6eYgDwfmxrEkBytNrE352ctM1GZPhcM3gD3ur2HxTE+meiVVq/crHQT4Ke
	d8pmo0V2eoXszdQ20oRKq/8Yx8ew3Ag95l8lIT5GfCUrTlWcwjv2jDM1EAf6aT9vRqQGPWmw2T9
	nGxFlhVI7JaRMoSf4H0pGGSmUFTffTPeQjY8J/DoSTkVj91W0gVTzy/3/PaBYYwaYLu1Wbm8IPD
	hv9GZJWo28J0UgEaI/xIoAiA+dbSan+2zC0+uCjv/+pE2wKm9+9rE1elkW935nkPMQvdkhlrgy/
	FtLUTb6tHVd2GoOV36pJSecTpM+ueLSumEe5U+/eFKYCr55qNooAmEakbXJ2bB+cRs+Km5yf6jm
	XegVIohInrm9pVKnnej3ST+RMSbXxwmYxltCTaJBjwd2vjy8A==
X-Received: by 2002:a05:600c:4583:b0:495:44f3:4576 with SMTP id 5b1f17b1804b1-496c64130a6mr76966735e9.7.1785341737012;
        Wed, 29 Jul 2026 09:15:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 0/2] Final prep
Date: Wed, 29 Jul 2026 17:15:27 +0100
Message-Id: <20260729161529.164017-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785341738-4AEDACFC-48F43ABD/0/0
X-purgate-type: clean
X-purgate-size: 276

Andrew Cooper (2):
  CHANGELOG: Set release date for 4.22
  SUPPOT: Define support lifetime

 CHANGELOG.md |  2 +-
 SUPPORT.md   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)


base-commit: bdc4bf3b562470bfbbf770c87fb499198f2c4098
-- 
2.39.5


