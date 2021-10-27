Return-Path: <SRS0=eAWX=PP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF088C433F5
	for <xen-devel@archiver.kernel.org>; Wed, 27 Oct 2021 09:50:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99D5460EDF
	for <xen-devel@archiver.kernel.org>; Wed, 27 Oct 2021 09:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99D5460EDF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.216825.376582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffa3-0003Ei-Bl; Wed, 27 Oct 2021 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216825.376582; Wed, 27 Oct 2021 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffa3-0003Eb-6G; Wed, 27 Oct 2021 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 216825;
 Wed, 27 Oct 2021 09:50:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mffa2-0003EK-3L; Wed, 27 Oct 2021 09:50:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mffa1-0000KE-UI; Wed, 27 Oct 2021 09:50:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mffa1-0000Mj-KE; Wed, 27 Oct 2021 09:50:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mffa1-0007Ij-Jj; Wed, 27 Oct 2021 09:50:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=OeWdZX4mj1t84mUnTT3m1pfo4Y2M63EwRInHW5U700Q=; b=rraUUdVA25DJQWHKY5NKkNRdbH
	7bY2WR4TfhTPf30MvyR2jP/PSuYB9/r5koPw6ouLNp8cdlOjeNkce00ilG8ysEprsvHMXsY2AAIvR
	4E5nV8rmtKkOQcvTXuT7n6XKSKNAhNV31BAiKHdJtfztFp3vXHrsuOpnJzjSPWXteTSk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165895-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165895: all pass - PUSHED
X-Osstest-Versions-This:
    xen=b0fce57a6a491c120f2554ad7cc9a0c43ee5defa
X-Osstest-Versions-That:
    xen=23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Oct 2021 09:50:45 +0000

flight 165895 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165895/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  b0fce57a6a491c120f2554ad7cc9a0c43ee5defa
baseline version:
 xen                  23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9

Last test of basis   165836  2021-10-24 09:18:30 Z    3 days
Testing same since   165895  2021-10-27 09:18:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>

jobs:
 coverity-amd64                                               pass    


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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   23ec1ebc8a..b0fce57a6a  b0fce57a6a491c120f2554ad7cc9a0c43ee5defa -> coverity-tested/smoke

