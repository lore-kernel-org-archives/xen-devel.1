Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31548C5AC67
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383599.1626859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3A-0000gZ-E9; Wed, 05 Aug 2026 14:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383599.1626859; Wed, 05 Aug 2026 14:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3A-0000gS-Ax; Wed, 05 Aug 2026 14:56:56 +0000
Received: by outflank-mailman (input) for mailman id 1383599;
 Wed, 05 Aug 2026 14:56:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd38-0000gF-Hx
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:56:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd37-004z8Z-DV
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:56:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f04-5cb7-0a2a0a5109dd-0a2a450beae0-18
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:53 +0200
Received: from [202.12.124.152] (helo=fhigh-b1-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f33-b7e8-0a2a450b0019-ca0c7c9883bd-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:52 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 34C4D7A008E;
 Wed,  5 Aug 2026 10:56:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 10:56:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:56:50 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1785941811; x=1786028211; bh=YEDuDEwDOK77MggXfQc8ZDeI/hZyM8at
	FiPKnftVAqg=; b=x7GlZqCsludFrj/q5XXF9teD8yNd7di7sCnKuAPP3waJ88oZ
	QJ3vP3pEEryJuIyC76dEtZqe4CibOsVj3WJDBN1cBcqJw+wl845AaNnQkzWRvit6
	mYkG1sX16ZgipiWnL6GG/Mr2J9b2+stSas7/UkAunhJYmAd9x7K8WKO1KYCH+fKu
	AcLNPnVnibmoEVS+ynQieinyeNsv+xBPZe8A3XelaHEhtDiK/8Im+5UDOtUM1oUY
	R61uEdVMu6RicADqAK4DAGT1KjJgq3BOEeJjUV28q0eYQbihJ7RZ0K4PbJLjSDn1
	sqjbWmzEECMASqwIAZzR9G9a5ZW3mEm789o9xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1785941811; x=1786028211; bh=YEDuDEwDOK77MggXfQc8ZDeI/hZy
	M8atFiPKnftVAqg=; b=jb6orZKg4GFdwpW+oKBcCTkdbiYDujxp1sUaTZSL+Qqn
	In6xj3vPmti0SR7AdPWYs2r2hTYWH9uEbc/XeLoPhQ8v5Pzawp5PcJp5QF1PA7ND
	gknek+iPRjH+90JwVURw21X72RoRUt11X/JNDIlR8TIWsCyyKdVk4ffcmi5fGvdN
	aVXOYk/ZUktbopIbVgzMI7oeJ6PcqmzLS8d6sRc2xbUzuwRUrTefMCZSyrFsviU3
	6mE5jtMyRcMN8LNoxsAmq+0KAOD5uzSf+w9XLutQ6KbvErHyJql0zJ6iHYa0Jm3G
	SYmWVIWthtqsEUTWbJsloYicWaleo3a9SGv6aHPgaQ==
X-ME-Sender: <xms:Mk9zalrxYE4irgR7PDHKmwhBjeVH1oiI3CSQEweXrEaAFD0MPmCEAA>
    <xme:Mk9zavGW57QtepkE3o6wSuwZqiH5wslrTM6nhNMj6TXFVr2ZwzREhFJGrhgoTj2o1
    _xLrj4o_F5a0PByrdj0w1iA5oiiy5ec4SQ8K9xXFre2Nfe7WA>
X-ME-Received: <xmr:Mk9zavnS4XByn026JwsU3uasTC4CcGQk1erDn0f4k-MPvLoMVOXdOK_zoBsvvUuNCLGtSqRC-WAGFN2ylERDz7Auyw2OIOuPo4hBlHyeO4Q>
X-ME-Proxy-Cause: dmFkZTFS2I1DSF/oTs2YQfmubyAQWQKrS9o1T9OtKuY9CuWqDf88oVZfpzRXmQuQDDJlCl
    9cmEs94RusrZIbcOtjToT0S5XlxTu0/NKy/T3ezOs80gUEweOM8EWQajxRiCc2sDk21uFi
    a4W+iCgUtDsR5dmCnaQ56nlW2fJozQqjHRcYXuCeeFL+jQmZGgs0ZNlC0/gFWKng4/Hr+C
    8Gn0wpielhGrWVaWgN6OXQIoyclA+ItQI53S5PNvID0Kpf5iYNI3phx9/STnOHfBHybjoR
    bIZxgdoC1Dc79u2nQ91uWl/a9KidXZ1rnyWoT2gMs6tv7i5vCoPE48r/uiqnWUQ6JAxTpO
    dHLGpTRmNkGEgXxcid+oX7qhV5XmaLsm2Iobk/jPDr1Z+nFsKVGtKaXt1K6wqa/qBOMHm4
    mKMX1+QC+rBgAHV1tMvUhHh+DnqvKq/ekWLMsp6J2o9LZbSFhHhzn6KsLWQoQ9xZiNbyZr
    ZsPlp++qS09qmFkioyY43rtam+hb7uSUGRHDf88kPTzzGXkPZWX1+f8HG9zphrA9B9tJQv
    lNETVsasGQxTMHgIk/IxD9XAvMMoITMXnVTCgYujClddSWU4DUREwXiF+1k9EM2XWcvrj+
    A+gc5z/3jGby+q6Qw1cdQnHzBXvrUUeMMES1D2PLO8HcablrxcH89z+eK5Vw
X-ME-Proxy: <xmx:Mk9zaqkNCUiLS-JFiztHr_qQEQl3DGZc7DOvX7XUBRtdQ3CpjB6vBA>
    <xmx:Mk9zaosiTl75rh28knDc7zUPM6btlC_Z8Z9dcHEetbn2lAwavhMbIQ>
    <xmx:Mk9zalkYA8eChIS6R5BaC-VXPdK_OhBbObW_EZhPtdWUr49UNMOvlA>
    <xmx:Mk9zartdEJLoO-_hL6PzCErrr1Sqhkob7SQvuiJU-H-obD2bs5DpLQ>
    <xmx:M09zat1AhrzcAx0z7JA50rp0MNoZNg8IHhsvL4t4qo5biRKBhkpbLLEe>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v5 00/13] Add several more tests
Date: Wed,  5 Aug 2026 16:55:28 +0200
Message-ID: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785941813-A94C39EA-3731F3D2/0/0
X-purgate-type: clean
X-purgate-size: 2791

This series used to be about just driver domains test, but over time got a few
more. Now it includes:
- fix to detect test failure early, instead of a timeout (at least in some cases)
- simple driver domains test (network backend in domU)
- UKI version of xen.efi booting from firmware directly and via grub2
- domU suspend/resume test (detects recent migration bug)
- fix for macos build jobs being stuck in personal repos

https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2734175811

This series requires companion test-artifacts series pushed first (it's fully
acked already):
https://lore.kernel.org/xen-devel/cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com/#r

---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>

Marek Marczykowski-Górecki (13):
  CI: set LOG_MSG as end-of-test marker consistently
  CI: Reduce timeout on test failure
  CI: Add driver domains tests
  CI: Add configure --enable-systemd for full build
  CI: Run driver domains test on Debian too
  CI: extract building domU/dom0 out of qemu-alpine-x86_64.sh
  CI: add a smoke test for UKI xen.efi
  CI: add tests booting UKI via grub
  CI: enable xenconsoled logging in alpine tests
  CI: add oops=panic to smoke tests
  CI: Extend qemu-alpine-lib.sh to allow simple networking test
  CI: Add simple domU suspend test
  CI: gate macos build jobs with MACOS_JOBS variable

 automation/build/debian/13-x86_64.dockerfile          |   4 +-
 automation/gitlab-ci/build.yaml                       |   6 +-
 automation/gitlab-ci/test.yaml                        |  51 ++++-
 automation/scripts/build                              |   1 +-
 automation/scripts/console.exp                        |   1 +-
 automation/scripts/qemu-alpine-domU-suspend-x86_64.sh |  71 +++++-
 automation/scripts/qemu-alpine-lib.sh                 |  86 ++++++-
 automation/scripts/qemu-alpine-x86_64.sh              |  60 +----
 automation/scripts/qemu-driverdomains-x86_64.sh       | 149 +++++++++++-
 automation/scripts/qemu-smoke-dom0-arm32.sh           |   1 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh           |   1 +-
 automation/scripts/qemu-smoke-dom0less-arm32.sh       |   5 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh       |   1 +-
 automation/scripts/qemu-smoke-x86-64-efi-uki.sh       |  92 +++++++-
 14 files changed, 468 insertions(+), 61 deletions(-)
 create mode 100755 automation/scripts/qemu-alpine-domU-suspend-x86_64.sh
 create mode 100755 automation/scripts/qemu-alpine-lib.sh
 create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh
 create mode 100755 automation/scripts/qemu-smoke-x86-64-efi-uki.sh

base-commit: 0dc67f3aab0a080b756f9e54b8a58a4a887f702b
-- 
git-series 0.9.1

