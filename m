Return-Path: <SRS0=yhtS=OY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680F1C433EF
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 19:17:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18BB76113A
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 19:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18BB76113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenbits.xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.201690.356305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXTS7-0003fT-Fp; Mon, 04 Oct 2021 19:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201690.356305; Mon, 04 Oct 2021 19:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXTS7-0003fM-CH; Mon, 04 Oct 2021 19:16:43 +0000
Received: by outflank-mailman (input) for mailman id 201690;
 Mon, 04 Oct 2021 19:16:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>) id 1mXTS6-0003fG-1N
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 19:16:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mXTS5-0002c1-Ki; Mon, 04 Oct 2021 19:16:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mXTS5-0001Ss-A1; Mon, 04 Oct 2021 19:16:41 +0000
Received: from iwj by osstest.test-lab.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mXTS5-00046z-9X; Mon, 04 Oct 2021 19:16:41 +0000
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
To: xen-devel@lists.xenproject.org,jbeulich@suse.com,julien.grall.oss@gmail.com,iwj@xenproject.org,sstabellini@kernel.org,dpsmith@apertussolutions.com
Subject: [adhoc test] 165359: tolerable truncated
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-Id: <E1mXTS5-00046z-9X@osstest.test-lab.xenproject.org>
From: iwj@xenbits.xen.org
Date: Mon, 04 Oct 2021 19:16:41 +0000

[adhoc play] <testing.git master not a tty>
harness 3a3089c9: mfi-common: Drop Linux dom0 i386 tests for newer Lin...
165359: tolerable truncated

flight 165359 xen-unstable play [play]
http://logs.test-lab.xenproject.org/osstest/logs/165359/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail  like 165218
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail  like 165218

baseline version:
 flight               165218

jobs:
 test-arm64-arm64-libvirt-raw                                 truncated


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


