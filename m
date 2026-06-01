Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DADACD6E65
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2026 15:27:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1323906.1589562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4Xt-0001Yk-8j; Mon, 01 Jun 2026 15:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323906.1589562; Mon, 01 Jun 2026 15:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4Xt-0001YZ-5B; Mon, 01 Jun 2026 15:27:17 +0000
Received: by outflank-mailman (input) for mailman id 1323906;
 Mon, 01 Jun 2026 15:27:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wU4Xr-0001YK-PT
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:27:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4Xp-00DtjC-OP
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:27:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1da4cd-e002-0a2a0a5209dd-0a2a45049568-6
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:27:13 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1da4d1-1dec-0a2a45040019-d155802dc4b5-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:27:13 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso662225e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 08:27:13 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0daefbbsm1570885e9.0.2026.06.01.08.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 08:27:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780327633; x=1780932433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+eCUkHOnu0XSRBDIY3H9HttmnEeRQ6l4ooNXYefCgAg=;
        b=SzOAMjfuZrR+DrubqQBW/PEcYN8ViSzG3A30lNdbazRWStkNpMLDRxS5HeCCsTyaQG
         M1IhJf9BLTjLXpk6DZgvz/We3uK5aTth3KyozMDu14+kdl6SdlF1qIf6uIajsqYgdCNw
         BSfXrSiPhmV3zW1c8CDJ5jWdaqz8LhIgiou8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327633; x=1780932433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eCUkHOnu0XSRBDIY3H9HttmnEeRQ6l4ooNXYefCgAg=;
        b=pSo3BTeoZDCdFm9uqhFBWSwhVI0AHwn6GdFET+kAG9NCmGFz0j2RH1Ftu4ohSO96S4
         Mma4/Etz7YZfiidQ69Za7xu0dTEVM0Ao4ed9+oLpHmHnjSZQlLXzQszrpYKVeCbBZELj
         3tzwRjAxvh9jDI1in7j3aBNVDQhb53d+jyHjpUNk8gTn2AAJgfKrqoSB9aFx+dJRK+du
         dpS4TcXqH62a9yznyzbILLFeLReT9V/jzbWs8n/V+vKyspkJf1a3FIgfaOqXtliK9O81
         A/iVGgYRxVrK0fMVgPzxDezYdRAcUlEGpcnKqHALubRU91PU9LpPuVoAv1IYoZ6rnWk5
         0hzQ==
X-Gm-Message-State: AOJu0YxAELGS305TA5oWv9/1PX2wr3TkY6APmv9yODaILds9dXOLtMOq
	Jd7wNfjKpJQqg91EO55syEX+Pi4AGU+DycGEWhOZLXsX2n+ClWw5BYg9ciIrq4HcmpdjpevPFCC
	syh0c
X-Gm-Gg: Acq92OE/jZPHFnuYj1qdza4tqRvpDhay+XywRXy06EMCVALA4Aa6avXkHl6DPXWIjF9
	QKcO8YPeo0kMjWONZQ5+duBBSebkP6jt1W3Fq18VcY0waE6b5T1kOEie6O1jTeRtIxViL1uKNAS
	Rnwyp2cZTR/ZT1wEL8FjcPhC8MvkR7LPd73frqwAHQz4jFAguPgqrDkwKUnVkL8JDRBzD6j7Ff5
	yAuol6L3dnoNmqkG1xbUN44NhDWuVG5Zv064iXyM0s3gTx9ug0hteJ/9/rTm+0uu3k7RsY+wbma
	MUT+DHIeuyX7jZ8DuIcHP/HdYxF4rFBL1DuJe0Ib+5vzOih6LkbfDfkz2AY0SLXfGFx+aF8HWJr
	zAckMIrBljO/EjYvt1wRmZjMw5tsS+45DRGZlQKs5MHi6KtFnDPTx+Ge7FlQqqZW3x26QLWi37N
	xIi9ClFY6/BmvgiSs1i5QsbQul4II5j/+soxYdlikDgMob+SH1dPpVSXGqFnZRTvFdkSqasIMyt
	HO/OoqkfxrIOa4=
X-Received: by 2002:a05:600c:a009:b0:490:ad8e:11bc with SMTP id 5b1f17b1804b1-490ad8e1279mr52176815e9.31.1780327632817;
        Mon, 01 Jun 2026 08:27:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/2] 4.22 RC1
Date: Mon,  1 Jun 2026 16:27:07 +0100
Message-Id: <20260601152709.2588210-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1780327633-293773FF-FDB94494/0/0
X-purgate-type: clean
X-purgate-size: 324

Andrew Cooper (2):
  Config.mk: Pin QEMU_UPSTREAM_REVISION
  Update Xen version to 4.22.0-rc1

 Config.mk    |  2 +-
 README       | 10 +++++-----
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)


base-commit: d38a353eaceddc97ee41d4cce30ed44fc2044a42
-- 
2.39.5


