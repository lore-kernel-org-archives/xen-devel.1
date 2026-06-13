Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B297CD98DC
	for <xen-devel@archiver.kernel.org>; Sat, 13 Jun 2026 21:48:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1337552.1598823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD7-0001F4-Hl; Sat, 13 Jun 2026 21:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337552.1598823; Sat, 13 Jun 2026 21:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD7-0001Eb-DH; Sat, 13 Jun 2026 21:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1337552;
 Sat, 13 Jun 2026 21:48:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWD5-0001Ba-QO
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWD3-006VOz-8p
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dcf85-e002-0a2a0a5209dd-0a2a4501d5c0-18
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:09 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd019-c1f2-0a2a45010019-d1558035d05e-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:09 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso26447375e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:09 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781387289; x=1781992089; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4cqOETzxwCMJLbXds+6uZKS1zVUwkXxLb61iy8LmQhI=;
        b=NHkOtJk5LgEPc0c4YgZ3Cd1ooMZ0esPtOeic6kUmpT9aTe16oiRkOnlYib4g1Q/PJn
         PE17lvlYxpB7h2gYwtAYXqzYhJME/Z3QOTS0hAe56wZiJ3dRU0t4r+wd2uMwyWTVRd3V
         869jk25nbJJV/RvNXxkp5o1YlYzzvf7TdeavKKiF83VMxmnSzlvez37fGRxWvinNlXYi
         QSKCjL4reGvjagXykR4imY4K1gy5IWEH+juay1Hd1iP6XBFKDQ3IPMaGyL1YMGnx2fd5
         z6ego9Fl1YpuDvIJyUhvW3ssuxMCHcQ5j9wqa0MQJsXSM9VFAW2U95e1TXiHgkUZU+ej
         dYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387289; x=1781992089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cqOETzxwCMJLbXds+6uZKS1zVUwkXxLb61iy8LmQhI=;
        b=g7uHx6ApItIEgKMpQweaLr+dIJ+5FfNY5nCilftRyMkIR4VpbHgDluvf+97sELnb7D
         6bEiOghsfwEaIgMxG+0BbhIB6g48jqLZD7GszKCsAyNfCRwcESe6PrvxRXE4JaARFOrf
         nb4M/BopV5fdRGDOepVbhFGakHaCBJxaRA1ennYGnZ44qjo7CqXZx3ZT0qaeoFvHvzhe
         zBIkYcrIvRg/0BqJoGmzzenK48EtjxGhMCcjFzeQFDHEYzt3LGaayekDLrQi8P/rg7wR
         nA4HFM5GTL6Hneym4OT6nr2C9dvQSxitzWDGTfXB7R+j8z0gcqV26HNMFmt4PZP8qdtT
         3BcA==
X-Gm-Message-State: AOJu0YwxUbDP28+xY7vpBsyn7g1xMwDRjJm0uPYgivEKTP7LGyNZ7Uze
	frdEYanObiyAu50NvIpiODnPCkAEKaHkhU/xa5RL3Q04X3btX8BE/fk4JKr6cpfFHYw=
X-Gm-Gg: Acq92OF6oM5z1QjHuYOXgvgISiuuUu0kFT0tzH/ngLzjxLZ1KMnvhy5U2clBY6cQagU
	uhxUgo2cjDdsSl800I3pPBMEMS5YWbImrUfCzUm2YWzcqM+BAzmAekVDVJjxMYa3CTfPFKGSPFc
	SFu8a2E93W4qzry+ExnJI5Y54Jrp7x8pbqndD1pErEk+pjzhGFN0FqmAGCmu+dt62obTLe2XUdC
	6kWCdbGBy75P/MBmcsJp6ps3+/3ukEkcBHwwYWM411quDS9UMSarhQOqSNI6f9Aw70acAVesOSD
	0omUqMeX/GeWZpKmW1d6lT41N9/iim3iQrxhk4U/qAVs0NHDOTV2j86Dbuk1cX1DHBlmSqwHyal
	381kLcWXg17yJZ5HMPq5E6el58ol1iV6p38pF/UklOeO1hCAThzklSGmyQYcReH/KX3TVAt4GYW
	F3ZgoOJ8AIJOY6XPp6bQi0a2xky31Mmo4WIUvjgsdkienwMjcYYZioVryRAIgH3jPZ3XcFspCuv
	b+KD0Dp8u084kPAcfAml7lO/jaE0TfG7oA8
X-Received: by 2002:a05:600c:154b:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-4922005e579mr60566755e9.3.1781387288402;
        Sat, 13 Jun 2026 14:48:08 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 00/16] xenguest optimisations
Date: Sat, 13 Jun 2026 22:47:33 +0100
Message-ID: <20260613214749.20620-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781387289-AD9A9FF4-8A667328/0/0
X-purgate-type: clean
X-purgate-size: 2371

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Reduce some number of parts passed to writev.
Avoid possible allocation sending data with writev.
Reduce number of allocations sending memory state.

Implement and use new Xen and Linux kernel ABI to copy foreign memory.
This new ABI allows to replace theexpensive  map/copy/unmap sequence
with a single call.

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

Edwin Török (3):
  libs/guest: allocate various migration arrays just once
  libs/call: cache up to 4 pages in hypercall bounce buffers
  PoC: libs/guest: use foreign copy during migration

Frediano Ziglio (12):
  libs/guest: Reduce number of parts in write_split_record
  libs/guest: Reduce number of I/O vectors in write_batch
  libs/guest: Reduce number of I/O vectors in write_batch
  libs/guest: Use a single write_exact in write_headers
  libs/guest: avoids using 2 indexes
  libs/guest: fill directly iov structure
  libs/ctrl: Allows writev_exact to change iov array
  libs/guest: add xg_foreignmemory_copy_{from,to}
  xen: implement new foreign copy hypercall
  privcmd: Add definition for new Linux privcmd to access new Xen
    hypercall
  libs/guest: use new hypercall if available
  libs/guest: finalize PoC

 tools/include/xen-sys/Linux/privcmd.h |  10 ++
 tools/libs/call/buffer.c              |  28 ++--
 tools/libs/call/core.c                |   3 +-
 tools/libs/call/private.h             |   8 +-
 tools/libs/ctrl/xc_private.c          |  26 +--
 tools/libs/ctrl/xc_private.h          |   2 +-
 tools/libs/guest/xg_sr_common.c       |  95 ++++++++++-
 tools/libs/guest/xg_sr_common.h       |  21 +++
 tools/libs/guest/xg_sr_restore.c      | 100 ++++++------
 tools/libs/guest/xg_sr_save.c         | 224 +++++++++++---------------
 xen/common/memory.c                   | 134 +++++++++++++++
 xen/include/public/memory.h           |  40 ++++-
 13 files changed, 474 insertions(+), 219 deletions(-)

-- 
2.43.0


