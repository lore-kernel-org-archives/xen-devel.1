Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488EEC55172
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 05:55:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381882.1625324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr86n-00007I-KZ; Tue, 04 Aug 2026 05:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381882.1625324; Tue, 04 Aug 2026 05:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr86n-000078-Ga; Tue, 04 Aug 2026 05:54:37 +0000
Received: by outflank-mailman (input) for mailman id 1381882;
 Tue, 04 Aug 2026 05:54:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wr86m-000072-8i
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 05:54:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr86k-00DoFh-Vo
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 07:54:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a717e9a-5cb7-0a2a0a5109dd-0a2a4506a80c-4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 07:54:34 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a717e9a-195a-0a2a45060019-d155dd36b8d1-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 07:54:34 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47362928f65so3965165f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 22:54:34 -0700 (PDT)
Received: from notebook.. ([78.173.117.189]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994a100e14sm55453775e9.14.2026.08.03.22.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 22:54:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785822874; x=1786427674; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vVyXrNs9xN2FQ9GoJBozZev2DVipZjRBvvshex9mY0=;
        b=fM+wfhklcbhwjMZpKXXkcO4EN89o4knpSzTw5uZMu34KsJ3nettbBIvsx555K0URED
         WkSA4SyvM+6xXGg55f4BMDCOpHG6uBmJqdEQm1u7AodoM2cip9tT7WK3DWF0I1GxXtVM
         Mrf4P0eTyVWh90lgmsQMrBJaH/WbT+/mqSpD5QTqsEcimzF7J3xwjBNb+S57n/o11H8q
         zZHlvGfB4vDsdgbcALuEEHqe6Y2Alq+wcHxqGBXc/KQu1BmaYjacpbX7B9gN/aTPf1ch
         YYZsyaLgPHhgaFXdWiKqi21LCOh1aqEWydtMEFrXbldWlGJhW7/6ox460CgWVzCAJADC
         YyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785822874; x=1786427674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vVyXrNs9xN2FQ9GoJBozZev2DVipZjRBvvshex9mY0=;
        b=SnlUlAQUVSrPPi3eC20QKIu+4tCOGrnVWrNLPUr0+ErSvufTmbKj8keHensrL2xPRc
         PVQcMMrtAFbxRYBtVZFDeB2p+dN6/cB75G+gXNGhFAuEnVPkrs4WbzUX5nqeFNIjEU+5
         GYcqqyroSKyGv6eX0jpCDIyZA/yv8EFdebPM2JDZ475/+pb/717yfJvWyGSE0tfR9eaT
         1XltuxN76fsruk7QSW3Biaf2erJtfbS1uldCABKy8OfCoE4qRNx2Efi79osu33cXE1WL
         6vnzSieorMret515CqvmLV+869H51MVzAkLG5XGBbhfEbtLkFPHO+uEQYFLSl3ksmQky
         ziXw==
X-Gm-Message-State: AOJu0YwNTyYxp7WEdSZee6GlufbjbtvGSTZ4Mwu4xq9ParEoVqY8ocIt
	uHR6L84ZBqXBq/nGFZx1bFC6qbdO7aQqGWAUov6LjkP3QNKc5sHexsLS5/L37g==
X-Gm-Gg: AR+sD13ee9ssu1CZdR2nL+8uYgv7Moz+aNEWOZx4OjfD0zEQZU6fl1O7EntqSI1LTSj
	1dBxSt4FgZCHwznd+IGSXqkc4JCk+agBUGP/rxTE0AU64iGTe78hBcktgFjDT7REi9pVxyx+r+V
	OsxqBLnPt8fgcXdfEptOnCNf7Bs89ALkjSJLTcSpjJv0iIKAvxDxpflH1zirF/WbHA8KY1GnWb6
	pLYS4VwFzuOu2Z3W+Z3kUAOHmQPFm+vEB8jARWxxfnfK569rEoxuvjch2vSPQQcJZ5lGs+Pv81n
	zjS673r5GlwRefFhu56ZdPNPVP8Za5PCPJOxEgOgSMIhcuW0336ymG4P2uJqCg4JsBlBDFedvmn
	WH6RafYSAXlAiSPPp/cWmcPRRA+JmRk+8FOIIeoFUJOnrJP+4/bJTX1WMwE7xumK01D5nf75JYS
	c8/5D7nVTX8cP1rT6LBmFzQlvEQWCIgUELv0G9xoPvG/FZu82JWS1i66tBDzl9Ew==
X-Received: by 2002:a05:600c:1908:b0:495:7838:7e25 with SMTP id 5b1f17b1804b1-4980ee9f00fmr276868105e9.15.1785822874289;
        Mon, 03 Aug 2026 22:54:34 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	dfaggioli@suse.com,
	stewart.hildebrand@amd.com,
	nathan.studer@dornerworks.com,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	michal.orzel@amd.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	teddy.astie@vates.tech,
	tpearson@raptorengineering.com,
	alistair.francis@wdc.com,
	connojdavis@gmail.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2 0/2] xen/sched: split scheduler vtable from scheduler
Date: Tue,  4 Aug 2026 08:53:25 +0300
Message-Id: <20260804055327.22119-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785822874-F4E0677B-0796F279/0/0
X-purgate-type: clean
X-purgate-size: 2000

Each struct scheduler currently doubles as both a scheduler 
backend's static vtable (name, opt_name, sched_id and every 
function pointer) and the per-cpupool runtime object that 
scheduler_alloc() allocates. Because these are the same type, 
scheduler_alloc() memcpy()s the entire vtable into a fresh heap 
allocation for every cpupool it creates. With N cpupools running 
the same scheduler, this duplicates N copies of identical function 
pointers and identifying fields that never differ between 
instances - the only fields that are genuinely per-cpupool are 
sched_data and cpupool.

This series splits the vtable out into its own type, struct 
sched_ops, so it can be shared by every cpupool using a given 
scheduler instead of copied per cpupool. struct scheduler is left 
holding only what is actually per-instance: a pointer to the 
shared sched_ops, plus sched_data and cpupool.

Patch 1 contains the whole functional change: struct sched_ops is 
introduced, every in-tree scheduler backend is converted to it, 
and struct scheduler is shrunk accordingly.
Patch 2 is a pure rename of the symbols to match the new sched_ops.

v2: folded the previous 7-patch series into two patches.

Furkan Caliskan (2):
  xen/sched: split scheduler vtable from struct scheduler
  xen/sched: rename scheduler registration symbols

 xen/arch/arm/xen.lds.S      |   2 +-
 xen/arch/ppc/xen.lds.S      |   2 +-
 xen/arch/riscv/xen.lds.S    |   2 +-
 xen/arch/x86/xen.lds.S      |   2 +-
 xen/common/sched/arinc653.c |  11 +---
 xen/common/sched/core.c     |  81 ++++++++++++++++-------------
 xen/common/sched/cpupool.c  |   7 +--
 xen/common/sched/credit.c   |   5 +-
 xen/common/sched/credit2.c  |   5 +-
 xen/common/sched/null.c     |   5 +-
 xen/common/sched/private.h  | 100 +++++++++++++++++++-----------------
 xen/common/sched/rt.c       |   5 +-
 xen/include/xen/xen.lds.h   |  10 ++--
 13 files changed, 119 insertions(+), 118 deletions(-)

-- 
2.34.1


