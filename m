Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B03C43458
	for <xen-devel@archiver.kernel.org>; Sat, 11 Jul 2026 21:22:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1360641.1613380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8k-0007Ur-II; Sat, 11 Jul 2026 21:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360641.1613380; Sat, 11 Jul 2026 21:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8k-0007Uk-F7; Sat, 11 Jul 2026 21:21:38 +0000
Received: by outflank-mailman (input) for mailman id 1360641;
 Sat, 11 Jul 2026 21:21:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wif8j-0007Ud-9Q
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 21:21:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wif8i-009avd-Ml
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 23:21:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3d8-bab6-0a2a0a5309dd-0a2a450ce6a8-4
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:36 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3e0-e897-0a2a450c0019-d155dd2cd504-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:36 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47c6e9a694bso1076002f8f.1
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 14:21:36 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d8cdsm74809460f8f.1.2026.07.11.14.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 14:21:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783804896; x=1784409696; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Hvjp/GX5/QP98aI33yA/Q0kEzimP6odD6z1TpjkVxY=;
        b=KD1cI4dDd8NO86aflyFrV/lLNvQ1FcjPdyA7p1dazYGMAbcRF/7dgKmiUBZMtKF8Jd
         p1MTq7seg+e1uzxc0r0SvlWhWWOKi23u/9ys9YvFXcsfBOd7addgbRbnOlMxrkj4TQRE
         4sb1B5mEzyK9nMKzlK1ANs9sHoe/Au0qAa+grwCagG52wAXB046t08ezJRIFdD7RYXzL
         4jXAdUcxfvsgoBMir6hIMwV3+23+q2rzSt+6DOPPR4SXfR9Z9GQjqND+LLtkoOFp47LQ
         OSEam6wO//T7Lej88H9Tqb1XIuxkK/uRxlWKoGVTxgcTCSY5CuGkTIIFPX34BRM7zplh
         G3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783804896; x=1784409696;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Hvjp/GX5/QP98aI33yA/Q0kEzimP6odD6z1TpjkVxY=;
        b=TMEOA9fkIgcufK793iRVVTmj9OcmlkrAsIjOY3JXZGLNPquDsgPFTAl/jNhQrJyvOh
         ACrVjWn541UDPlBCT/fIG1um1dYu8tceHIySHFjK0f804S3/eQvJFY8CVuf3qcq6jIPl
         jDa2JCxY09JP4gLsBlOzsyt/FbFzIUoBjAPKA1Twj393ByPs0EEMM+LazDoF/907yD3C
         kFxcJz7PKdaypk4tL5J7Kd2e0xX518X4nyNLc3bJV1byOT9uK4G1HtUifQTDB8An2Kuo
         23R12RX6wvjkZHk5UXW1pSetMpbWnMe2lj/h8zycjGOgzn9GvrmPRGyTncqb3UID79sv
         Ktdw==
X-Gm-Message-State: AOJu0YzN5VwUONTLy+WBPPMG/HFUJ9D96v3AXGRB6FzM8u3jp6S3bHe+
	/hDaiS7luMvoyboYqieC6eA+OyCP1bkYsLoxpM/cTDj+gi8iJh1S6cRwulhS+SYb
X-Gm-Gg: AfdE7clieRoQph2FBMLAaRl8LNMLbt+DWpBkG3MiteH0z0aRF76+59RuUsq6IIqkmxV
	osRusVuFp4K31hgih9NHv98Lbji3q6f9MbBJGKNpVsQcx80JPYVhvzYbR5lL8EaV6I+rLMHzuUL
	PT0roQOaynf0WRFAxL/tEkIdJ1dzMpuhx9uKxCr7dRoUQmZW7viw7SFFW3LxBlGFoqWjTnD3TVF
	s0yYxD/m03eJp99vAeTyVis2x3UePXY7HIooBQfaJmSJnFpWjHYBqAzV7Xz7hUfyAtfyXcKuHQD
	3V75y31XyCfee+CV1vqHkS3NWW05s4jbsdJ6oHrOMp+oGlQwkAbXGCtzmubREEe0sumcNKDuTsT
	xRAj5HkEAQ+NfOXb9/G028NfM8sKs/VTiD5K2glMNPvsd2q+l3L+iFiG+TLeEjrTVHpbQZl5qZx
	7/3PjrqnmMugGP2Om6MFRuHjMvzecA/CSfp8dQ/wNzROW4BHiG1pCVxca0Q6h3JER7balXBlXla
	PqemJP94P8RbY5o5ENpfpqfM1/LRQ==
X-Received: by 2002:a05:6000:2907:b0:464:8d68:618a with SMTP id ffacd0b85a97d-47f2dce9703mr3986211f8f.32.1783804895816;
        Sat, 11 Jul 2026 14:21:35 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v8 0/4] xenguest optimisations
Date: Sat, 11 Jul 2026 22:21:24 +0100
Message-ID: <20260711212128.505727-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783804896-45EF46B2-061BD42A/0/0
X-purgate-type: clean
X-purgate-size: 1742

Reduce number of allocations sending memory state.

Changes since v1:
- add commit to cache up to 4 pages in hypercall;
- add other 2 commits reducing chunks passed to write/writev.

Changes since v2:
- update patches commit prefixes;
- add other 2 optisations.

Changes since v3:
- address some comments;
- add patches for foreign copy optimisation.

Changes since v4:
- added Reviewed-by;
- improved commit messages;
- other minor fixes, see individual commits.

Changes since v5:
- avoids potential buffer underflow if nr_pages is 0 calling cache_alloc;
- do not overwrite errno if xenforeignmemory_map fails;
- lot of changes to "implement new foreign copy hypercall", see specific
  commit.

Changes since v6:
- removed merged patch;
- keep only optimization commits for now;
- improve comments;
- merged "fill directly iov structure collapsing them" and moved it;
- split "allocate various migration arrays just once";
- add a commit for memory checks using Valgrind.

Changes since v7:
- removed merged commits;
- minor style fixes.

Edwin Török (2):
  libs/call: cache up to 4 pages in hypercall bounce buffers
  libs/guest: allocate various migration arrays just once

Frediano Ziglio (2):
  libs/guest: move batch_pfns into a separate structure
  libs/guest: use Valgrind to detect various buffer overflows

 tools/libs/call/buffer.c        | 34 ++++++++++-----
 tools/libs/call/core.c          |  3 +-
 tools/libs/call/private.h       |  8 ++--
 tools/libs/ctrl/xc_private.h    |  8 ++++
 tools/libs/guest/xg_sr_common.h | 19 ++++++++-
 tools/libs/guest/xg_sr_save.c   | 74 +++++++++++++++++----------------
 6 files changed, 95 insertions(+), 51 deletions(-)

-- 
2.43.0


