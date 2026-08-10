Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F07BC5B56B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:31:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387324.1628582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHE-00041L-TU; Mon, 10 Aug 2026 10:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387324.1628582; Mon, 10 Aug 2026 10:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHE-00041E-Qn; Mon, 10 Aug 2026 10:30:40 +0000
Received: by outflank-mailman (input) for mailman id 1387324;
 Mon, 10 Aug 2026 10:30:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHD-000411-A5
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHC-00DyfU-Bz
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a842-bab6-0a2a0a5309dd-0a2a4504c9d8-8
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:38 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a84e-b57f-0a2a45040019-d1558030e42d-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:38 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso12486365e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:38 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786357838; x=1786962638; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MRp6EbxOKuhWqTL6XGBFd4TDttNHZTC51Obk9EfEk8=;
        b=XyDVjGAa3f48bZvE+Htj4K9LJd27o2MOr+PnzjgH+eM3CvACnc+m18z18ZlNUpv7S6
         1YTcjHdvsffy2QEU/kK4q5u4gGic1qTpzA1cgjcUzO88hiUfWD+bqScJK+8HiGIanW+x
         kishQga3hBQ4YlOXk3wIJ5K0UTsbj6QXVJOS3F/FhyDKAV1McuGggR2s+3/brSQV6own
         Oxdmq3k2LGPTKiG57ImAtuebH3Xtf84eaV0OfdJXg+QFBUJKUw1LC19CwSRaeNchLqNP
         5YR48i6u+FNu71dTLGByG0X087ctvIZv6EYUWEXfmtTjklv0N5/2s5Z7z2D6VRGTUi/6
         73lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357838; x=1786962638;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MRp6EbxOKuhWqTL6XGBFd4TDttNHZTC51Obk9EfEk8=;
        b=nyQ6ARqwrHOZOOcJYhqDmM+KQ7GSJ3yIQ1nYPvW/hul1Y47uwkhZiAjLb4QwU/6bnM
         hcvhRz6x0/84sieCvfRW0VZJ1QyGijLGHHdEdmYTMTDcSikEIUtAMaiAn+sSovZnPiEZ
         CaH6DggkxGRcrmYCBLVDegZ4VOHsRV3KFy7BDZiG0LK9/fbm9mejd4mlWd5lNBxKdJY3
         BiDW8pWK7OTVZ5WtoOM2vWEfiiJffE38GIb8/NiB8JyupwcPwdu1utJsMgdTJ5S14n3V
         g+kdHgIFAvkZAvSOzW0LDrskEFupHaMAkVdC2gGPlW626Q4khSCqoXCG7uRDeb9vP+L7
         szuA==
X-Gm-Message-State: AOJu0YxqBXt1hMEVQ7AgJX86SOdqNoNdkOaEgmESy9j8EbmPsRSyzaLk
	J3AsdSZULoO/yLc+hvuhAnrlHjl5YMs96eRyErPoDlNNdzYR3/C4zdkSgT/XEzCoqEQ=
X-Gm-Gg: AR+sD110pFA3YKSNouIQCb6Uqd0v1QppYfRss7xrG77Jum+7NOcL3XavUZ3HiOwvfhj
	4dzxjvDyE7sGCpJ2tKi9eaXwP7LpypIvj2N/45ix1NSAsVvlSeYaDCqOaP2iuK9e64EpN3jhJ3p
	AvTtUD53/a/lUDgom57XWrQmWHDChqVH+/w7e/n0ZKxeHu2AFwNJ+wY/HlEc8dSnRn1pHSFEsCi
	oFX3xK6UuIgtijPCpkqUyN5PddCGFA/1sSTqATz3KqV9PDMhQDn/NT7bso9p94V5fAYLHbaoKNT
	mMN0wdUWid9fi9fBBn/nNzb2F5+/mjzcjyp74LDVxTAE7uLgeMvy7werGHaTbDrSno7bHDyz611
	iC5kFhx1i04O+PhtTuERFyIHMAwliCu5qR4GxbTQFd8HmXCs0HktI7+0Mo7P2qVPlDqx8CaLzYb
	uOQb/KMkeLeEbkIJp8QwjQTz1KA0SRvfnlhkbPh0x2IydwGfp5qNPAQ3TFrmBX54vQ+sK3poWnj
	C97aU1JGsDIVvWEKnjr/dL7AGz3g7tkl0XQ8Czn7TUi2FE4kRA=
X-Received: by 2002:a05:600c:4f49:b0:499:4892:e84e with SMTP id 5b1f17b1804b1-4995e0d03a8mr270212795e9.11.1786357837543;
        Mon, 10 Aug 2026 03:30:37 -0700 (PDT)
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
Subject: [PATCH v10 0/10] xenguest optimisations
Date: Mon, 10 Aug 2026 11:30:03 +0100
Message-ID: <20260810103018.54564-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1786357838-530CDB50-1831BAB8/0/0
X-purgate-type: clean
X-purgate-size: 3210

Reduce number of allocations sending memory state.

Implement and use new Xen and Linux kernel ABI to copy foreign memory.
This new ABI allows to replace the expensive  map/copy/unmap sequence
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

Changes since v8:
- added Reviewed-by;
- remove useless check;
- remove useless memset;
- initialize variables while declaring them.

Changes since v9:
- add back commits for foreign copy;
- rework page permissions check;
- do not limit domain for new hypercall;
- add back some memory check using Valgrind and sanitizers;
- fixed compatibility for ARM;
- minor fixes.

Edwin Török (3):
  libs/call: cache up to 4 pages in hypercall bounce buffers
  libs/guest: allocate various migration arrays just once
  libs/guest: use foreign copy API during migration

Frediano Ziglio (6):
  libs/guest: move batch_pfns into a separate structure
  libs/guest: use Valgrind or sanitizers to detect various buffer
    overflows
  libs/guest: add xg_foreignmemory_copy_{from,to}
  xen: implement new foreign copy hypercall
  privcmd: Add definition for new Linux privcmd to access new Xen
    hypercall
  libs/guest: use new hypercall if available

 tools/config.h.in                     |   6 ++
 tools/configure                       |  12 +++
 tools/configure.ac                    |   3 +-
 tools/include/xen-sys/Linux/privcmd.h |  10 ++
 tools/libs/call/buffer.c              |  34 ++++--
 tools/libs/call/core.c                |   3 +-
 tools/libs/call/private.h             |   8 +-
 tools/libs/ctrl/xc_private.h          |  61 ++++++++++-
 tools/libs/guest/xg_sr_common.c       |  86 +++++++++++++++
 tools/libs/guest/xg_sr_common.h       |  25 ++++-
 tools/libs/guest/xg_sr_restore.c      |  78 +++++++-------
 tools/libs/guest/xg_sr_save.c         | 134 +++++++++++------------
 xen/common/memory.c                   | 149 ++++++++++++++++++++++++++
 xen/include/public/memory.h           |  45 +++++++-
 xen/include/xsm/dummy.h               |  14 +++
 xen/include/xsm/hooks.h               |   2 +
 xen/xsm/flask/hooks.c                 |  10 ++
 17 files changed, 552 insertions(+), 128 deletions(-)

-- 
2.43.0


