Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156B8C30653
	for <xen-devel@archiver.kernel.org>; Tue, 25 Jun 2024 10:04:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.747536.1154970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM322-0005g1-84; Tue, 25 Jun 2024 10:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747536.1154970; Tue, 25 Jun 2024 10:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM322-0005fu-5L; Tue, 25 Jun 2024 10:04:10 +0000
Received: by outflank-mailman (input) for mailman id 747536;
 Tue, 25 Jun 2024 10:04:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sM320-0005fk-7E; Tue, 25 Jun 2024 10:04:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sM320-0001ff-5d; Tue, 25 Jun 2024 10:04:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sM31z-0005Yt-QC; Tue, 25 Jun 2024 10:04:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sM31z-00006q-PY; Tue, 25 Jun 2024 10:04:07 +0000
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
	bh=v7HRd/nUGQtK3Ts5Dc0Tv3XAHtnMaTVReeeJp3tKR3E=; b=kotj8Rt0bxl3v9Dvh8kO9VG2zh
	vwJ0lf58AY9f1rdZELmzTEXTVJdhksBSmg/JZfkE5Z6YZtcX32psZUKMljuZeQSQPnz0RySCuVTmc
	EZDfuGHfbwqG8OS8WguprohyNwoo30Kmcf2rrFEQ1cXg/IypVpXvVO/qOsr96eqiijpM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186479-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186479: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b14dae96c07ef27cc7f8107ddaa16989e9ab024b
X-Osstest-Versions-That:
    xen=c56f1ef577831ec70645ca5874d54f2e698c6761
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Jun 2024 10:04:07 +0000

flight 186479 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186479/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b14dae96c07ef27cc7f8107ddaa16989e9ab024b
baseline version:
 xen                  c56f1ef577831ec70645ca5874d54f2e698c6761

Last test of basis   186470  2024-06-24 19:02:11 Z    0 days
Testing same since   186473  2024-06-25 01:00:22 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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
   c56f1ef577..b14dae96c0  b14dae96c07ef27cc7f8107ddaa16989e9ab024b -> smoke

