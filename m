Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CEAC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 21:57:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412429.1642899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x43op-0003nF-KJ; Tue, 08 Sep 2026 21:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412429.1642899; Tue, 08 Sep 2026 21:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x43op-0003n8-GT; Tue, 08 Sep 2026 21:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1412429;
 Tue, 08 Sep 2026 21:57:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x43on-0003mq-Ky
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 21:57:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x43ol-005f1W-9b
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 23:57:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa08450-bab6-0a2a0a5309dd-0a2a4505ac84-42
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:57:27 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa084c7-4cb1-0a2a45050019-d155802dbd26-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:57:27 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso43358935e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:57:27 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883927a3sm30151604f8f.11.2026.09.08.14.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 14:57:25 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788904647; x=1789509447; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHVAeT2GPyQVTW/x3ZgZmuDMoOXPzwlAseIbiz+kT/w=;
        b=G5nDTKRzNn6Pszq2a5nU5C06KQEwVOuOLRSSefD4qgWCzvbOWJHkDjL+oXMaKEVsss
         PqC6Y+Dl/zaf7uiuxpqehxZs4h84W+ZGVkssvrBl68I2T9DA1p7t4/ygJlSEJTUeScF1
         1iSBGuMoiAFzcWLgSWY/izSjT0+s3lH4wQXz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788904647; x=1789509447;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YHVAeT2GPyQVTW/x3ZgZmuDMoOXPzwlAseIbiz+kT/w=;
        b=i2U9Moobk7DrJsSe4YoS/ILo92LcP+/VlTv1TJyc/OXNTqXWZ4tw4j3Hhuz3WKnEkt
         lIU6zBtgHAmN4qSdMl6rZKVzBR0cNCrs+dHI7dtGPo4fn2oaK60jG2ddbpMNx6MAGjNl
         Az3HbWVhZ2wNY77TYHZ10fpSQLLPo9x9epDcAKYhwYIhZV6XqdltKvAlqNhmnveK6YUs
         Vb9Zw0ElL1I7breo5F2bXkxjxg86UfBV+AZi2G8I7CJ6AtH9qX1qySaH7yytAs89AVe1
         bUpBW+E0QuvrWKKZdvMEu5KsxZZeakhZCM4lpmdiUUduSMNWCaE6e6/cLN3eC7yFqP3j
         ZmuQ==
X-Gm-Message-State: AFuF++leM3jR5fVEkeokhXaiRvhk5Xf+8z2LrG3qPWiFIIeZTdn5JgX9
	BenojUyznZyiICcLw34hmEYVFn6CFZXJz3PTAcP5vNhb6XjHXHnoW555GJ14vKaXBaWd2mtg75Q
	btHtEe3g=
X-Gm-Gg: AYBFou2Xu/mFMG4Qq5IxKJFarX31c4nMRlnsAiq+3356o9L6scPXtt//QQ35JiM3Dko
	mkvdDFtoClxxZhdwRCOzpXiCksSaBLxju0aRZUod2OsuMt+yqqYyhGp79lcbRqt2Wg8VUFl7WLn
	PMRwo/GS5Taon41QjivWMNf/fw2olc/zc132yffEaoAobjEDOLYdUpZXO+LYfE1/sU0JHp/ZKMQ
	YdsDsl1dRccf2hlWwlAng1a8m0v9qr8dQcpzizDtq9O+SayMaiihtyHk8aRNrNypXt9AtpEcPcu
	f+/lOpHdIpGHophP8hCwDpSviTyO+UoYYRPPd6JhP/qRt12bKh7RD0t79YqDyXqfI1z1UWMgAPH
	5WuDD7PGxLVtH8DUCjo+2E6HV+st1BKXojpGjEH/Lej6dnuReY++3B+tZzkbaPsKj7Ix+rGoCAB
	pD2OTPfP2Fj9IPanI6aB9tvgwkkM/x2kBzhddVKly9SDw4606TZWVltqm0mTMZokiDZAFnOmuEs
	xLNpVUpHqfKi3ymBjL09XtI/TnMVxoy/ek6DrU=
X-Received: by 2002:a05:600c:6089:b0:49c:fa21:e73f with SMTP id 5b1f17b1804b1-49cfa21e8b9mr277475065e9.21.1788904645803;
        Tue, 08 Sep 2026 14:57:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 0/3] x86: Fixes for not-quite-XSA in pci_conf_write_intercept()
Date: Tue,  8 Sep 2026 22:57:18 +0100
Message-Id: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1788904647-732B32A1-FE1CBD7B/0/0
X-purgate-type: clean
X-purgate-size: 831

Plumb pci_sbdf_t up and down the callchain to simplify parameter passing and
make it harder to forget the segment.

Andrew Cooper (3):
  x86/pv: Convert struct mmio_ro_emulate_ctxt to use pci_sbdf_t
  x86/pci: Convert pci_mmcfg_{read,write}() to use pci_sbdf_t
  x86/pci: Update pci_conf_write_intercept() to use pci_sbdf_t

 xen/arch/x86/include/asm/pci.h    |  5 ++---
 xen/arch/x86/pci.c                |  6 ++----
 xen/arch/x86/pv/emul-priv-op.c    | 10 +++++-----
 xen/arch/x86/pv/ro-page-fault.c   | 18 ++++++++++--------
 xen/arch/x86/x86_64/mmconfig_64.c | 18 ++++++++----------
 xen/arch/x86/x86_64/pci.c         | 12 ++++++------
 xen/include/xen/pci.h             |  8 ++++----
 7 files changed, 37 insertions(+), 40 deletions(-)


base-commit: a2ca4f8b9890899ca89d6116002e7a9c5957d8c6
-- 
2.39.5


