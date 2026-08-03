Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41467C55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 12:18:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381419.1624996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrc5-00078D-CY; Mon, 03 Aug 2026 12:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381419.1624996; Mon, 03 Aug 2026 12:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrc5-000786-9j; Mon, 03 Aug 2026 12:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1381419;
 Mon, 03 Aug 2026 12:17:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wqrc3-00077S-IK
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 12:17:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqrc2-00EkFX-6l
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:17:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7086e5-5cb7-0a2a0a5109dd-0a2a4504b816-24
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:17:46 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7086e9-b57f-0a2a45040019-d1558035bc43-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:17:45 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so10913155e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 05:17:45 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980878dbaesm385075295e9.12.2026.08.03.05.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 05:17:44 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785759465; x=1786364265; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkyO29GJSH16hZeyxTwBRFcZE8QggRPa17kg4rPW+xA=;
        b=VnRBB3Aw1q5+bxfBTzXuCAS3UuYSMOALweyDCRorryARCf5PFFwMNgJ8STKlhlDFBw
         ys4D2hQkRh+ilxRhZTbog021Ngx7t14B/qFOa9QohCmmMRBMNhSmhRFp0I1srIwL22kw
         C6ijzoeGRjvRip1I4yGFm6JvgDaDugWkXx7Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759465; x=1786364265;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gkyO29GJSH16hZeyxTwBRFcZE8QggRPa17kg4rPW+xA=;
        b=UD76hbY5kQ6D3H59pO5+RcBFzsUUPpyy5JsCWdkB2HPcGizBfhiYLGmMiMZzGyOse2
         oqNTOCUOuXpKH4rdGcwhg17D4W2Wc75/4AuFJb4oDiWFzFeFRGgAsPnxWk1NQmtpCzSa
         axuBMyY2HnQ2rP0K3+NUKHTqheLjrLZiBgrUJUWlVSbdcTwKTATKumD/tX1QzNIMIJfi
         ne3CddUK51FwAfPXrJkQanZ6gzfmq09dDA8XgbEZxRMzaIH8S01kLcJoeGxT343m4TD2
         KUm7g+shc+ALINi7jpEnLm0GIiwbtiH1GCsB/wSFl51XaasU7maAc4RqUmIctdFZF+kv
         7NDQ==
X-Gm-Message-State: AOJu0Yy0XgPAF0j0w73OwHdJGi/YRAF6IbzDtc5ocsDPHLmQjn26AgYY
	7xbrvGqANCppfXn342NFwEH2fVe2pAn2poox7eMrzMBuT+J6W8evMzubA8uhCEna1FZh56st7pg
	BD8OlTFQ=
X-Gm-Gg: AR+sD134GkHR6FYjeFExSMcoMc7+8BrE/6CI9FCLLTlkanJpS8Lg32aBjGQre+6WNBs
	zw+8cMUcDVxy7P3NBcRb/fUEDLlBFGavb9zpGWqIIYHZ/VWOKGgR6wQk8vbHAZOupVtbhKZ3mzB
	aH5AlcQnSK/GT/UQugRuxGA6El45h7s6BIuYQEsz7BxIQAcJdw2rMEDtE+5YYTM7TE+9vhC8wp+
	sczBbYaKe7qCQvSIgRzIgLub+CGGxOJSXRws/qAzfDJDzjzsDZ8ha4ylV3tmhvddNqaeeSFKkHg
	mrnYp+fMwOvagQs7GMB8pXBQsCFEnG+h7FaSGii6GHPMsYgRXpWSo2hRmlOEFn8WUTiJYkWqnv9
	9abaKGFikzbfS5bugOvb6Wzu7sA1LqnhynOVSqW/o6Eo9CJtynnHD/lKwkCqJRA66+/HjINg5vY
	jpknSjQOA4aK9SCNZe9klYGw1jP2Sp5iKvCTcrb4Gx7SIlzp3jmm1/9lIEzXaU0GhVmBzMEZTuK
	Wce8r+t7eRqbi4qMVUCfi02yNXKxb4Jh67tumc=
X-Received: by 2002:a05:600c:4e94:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4980ee9ce83mr174598615e9.11.1785759465068;
        Mon, 03 Aug 2026 05:17:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: [PATCH 0/2] xen/mm: Alter get_outstanding_claims() to return information by value
Date: Mon,  3 Aug 2026 13:17:37 +0100
Message-Id: <20260803121739.370951-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785759465-50AD8B50-06B1DC1C/0/0
X-purgate-type: clean
X-purgate-size: 529

Changes to help unwedge the XenServer patchqueue following commit 44adbac3c7a6
("xen/mm: Introduce per-node free page counter").

Andrew Cooper (2):
  xen/mm: Alter get_outstanding_claims() to return information by value
  xen/mm: Return claim information from avail_node_heap_pages()

 xen/common/numa.c       |  2 +-
 xen/common/page_alloc.c | 18 ++++++++++++------
 xen/common/sysctl.c     | 10 +++++++---
 xen/include/xen/mm.h    |  8 ++++++--
 4 files changed, 26 insertions(+), 12 deletions(-)

-- 
2.39.5


