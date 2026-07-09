Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3690C44501
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 07:44:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357589.1611960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQn-000710-6u; Thu, 09 Jul 2026 07:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357589.1611960; Thu, 09 Jul 2026 07:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQn-00070t-2o; Thu, 09 Jul 2026 07:44:25 +0000
Received: by outflank-mailman (input) for mailman id 1357589;
 Thu, 09 Jul 2026 07:44:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whjQl-00070h-Ku
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:44:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whjQk-002ZqU-GO
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:44:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f5155-5cb7-0a2a0a5109dd-0a2a4509a666-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:22 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f5156-97e6-0a2a45090019-d155802db085-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:22 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493b1710405so9016555e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 00:44:22 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3b85sm69114695e9.2.2026.07.09.00.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 00:44:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783583062; x=1784187862; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9Ev5/3VmXu2ItFHnNq8C1LQpsVOvg7Hdv1NLg1FbQs=;
        b=CUSWUD0zq9PxMC3rA91siBKvLEI2fLrecGWxDeqk3jBRsKk0Z4OnUSOd3F5WRQpxG2
         4IWZqCGZzk9L2OiXFdCagGapI0J51RUUWZP0zDL/2aEZ0NQ9M5hKSY/vm4cviKBMVX2u
         vduxBbsctlBZTzaVFAPZ28TYadVaXfqlbWsas3dhSGoAT+9fjCRXdDWAfOE8iskCj/Ne
         NmeuJS8zUGaRCesynK1ZqkGSnm1e1Qgu5BUM5RI8HvdUtwZ8WnBr9E+O5TqFmG7hXGUp
         VOM/oweLRAbRhDLhzi6l6IRnvvIgqzcMq6AKXrFWwHODqQmttlKfSquVDrgfDkk8UGLm
         10lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583062; x=1784187862;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g9Ev5/3VmXu2ItFHnNq8C1LQpsVOvg7Hdv1NLg1FbQs=;
        b=qsIlPtGFShsmv4SBeUkb2e360HRxGaNzMLV3ypFhxeCQcfpKhnacsRYrwRvfFQm1F4
         DZQmdPemFU4mZx0qUWJlvhP+niymAfFUYSvqzQlSdfpuKZ+mekYntG/7uMaNqQW6+cHA
         er+eoX1CzBEc+jlWyFEi0TUATzVos9ZgaM7IqFupF3hPZfMsimRCmUO5WPMLjmKxsx7Y
         5dZMD1hzgKSxcOjw7u4L+QSfjtK3DUHkeiiDjbuDGeUTxXRZASCykLKK6I4FZo6f/QLj
         Ppt0a8AjF3vyOLqyg55qnqmm3h81Tn8iCa0ecitZLTxGfhbQ0uvPFUKKCwGsP5UHYHIa
         KHEA==
X-Gm-Message-State: AOJu0YwO9aT43QVNfoJpu7VMeCLi2pg0uMIrClKY2hGytAwdY+8cKSQn
	FAABkk0PIPgK3BWr8u59F32zk20GlBS+Yu64dsk72WvwMtBUqowin+LPf27OjweRE4E=
X-Gm-Gg: AfdE7ckXzsTji+sA7VGF8ZCdX59sT+3RGOUqKGmbjJk5LnYCme8EOpOva9cXJqcqCZ8
	XU9GdFeBu71BbosUJ+pPoDrig5XIy+psKNxpVRTwfacyQV3vU4LXRlW3MsVJPKuW0lL0utWf5ky
	YAl6b6ml13pSS5UqhsKsibWQHn343LquV+GVYcLqAQIdPMYsBnaSdgm3zja4Ra9UAs2b7Qyt8hL
	WKb8l4WLN1WdvYOL2yyQvsLdlx57xTkwRFVmZehJbWiwqdBEIlg/yMdAcjqaYcAMUZWGWXmw5Ck
	uYQSyR70HheasoLU+yzIe7lEQea9xTp4S4MUxGil56siRBa9dG9Uq8S5U7O1enp1UI8SbNyBuad
	nF/rI36np86cF44HO3bojr8He9DhOizqRl9TKiIJr3eydaPLV0+2fe2dIHzEimUSCeuPfr6A8Hx
	/8/SDrpMMfk5quSHh528vApNsXVa6NKoUSwcFzIelSnfbmdhRUBee1vjEq19E6M480avZ132c7Y
	bXKHPYb2ue5lAAhNmbed/n5J66LDg==
X-Received: by 2002:a05:600c:8a0d:10b0:493:d9f7:a3cf with SMTP id 5b1f17b1804b1-493e695bcf9mr43466365e9.17.1783583061713;
        Thu, 09 Jul 2026 00:44:21 -0700 (PDT)
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
Subject: [PATCH v7 0/6] xenguest optimisations
Date: Thu,  9 Jul 2026 08:43:51 +0100
Message-ID: <20260709074358.256084-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1783583062-46538986-ED33651B/0/0
X-purgate-type: clean
X-purgate-size: 2113

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

Edwin Török (3):
  libs/call: cache up to 4 pages in hypercall bounce buffers
  libs/guest: move batch_pfns into a separate structure
  libs/guest: allocate various migration arrays just once

Frediano Ziglio (3):
  libs/ctrl: Allow writev_exact() to change the iov array
  libs/guest: fill directly iov structure collapsing them
  libs/guest: use Valgrind to detect various buffer overflows

 tools/libs/call/buffer.c        |  34 ++++++----
 tools/libs/call/core.c          |   3 +-
 tools/libs/call/private.h       |   8 ++-
 tools/libs/ctrl/xc_private.c    |  65 +++++--------------
 tools/libs/ctrl/xc_private.h    |  11 +++-
 tools/libs/guest/xg_sr_common.h |  19 +++++-
 tools/libs/guest/xg_sr_save.c   | 107 +++++++++++++++-----------------
 7 files changed, 124 insertions(+), 123 deletions(-)

-- 
2.43.0


