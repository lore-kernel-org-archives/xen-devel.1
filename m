Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734B2C3DA4A
	for <xen-devel@archiver.kernel.org>; Sat, 10 Aug 2024 04:27:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.775011.1185377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scdhC-0001Yb-G9; Sat, 10 Aug 2024 04:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775011.1185377; Sat, 10 Aug 2024 04:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scdhC-0001YU-Cc; Sat, 10 Aug 2024 04:27:14 +0000
Received: by outflank-mailman (input) for mailman id 775011;
 Sat, 10 Aug 2024 04:27:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1scdhA-0001YK-AS; Sat, 10 Aug 2024 04:27:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1scdhA-0002kE-1s; Sat, 10 Aug 2024 04:27:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1scdh9-0003ce-EC; Sat, 10 Aug 2024 04:27:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1scdh9-0006Kg-D2; Sat, 10 Aug 2024 04:27:11 +0000
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
	bh=kWpi+lcXDcSfI7gyA4kONy523y93bEjGW3aSF9hC0rs=; b=oCu0KkFjcRAS0CDzafPPwWFK5H
	7F/bhKvvRW2hBpKse19xjTho/fgUHjFZxUIg3ao418SFQhnoBM7ee2SZUU5S9UpeL0aawu7ANzHEf
	UVMu6bNjLUnqgBoNTN5y7GCrx6lgPmN3mrwTBcK7nMXvN+Hx9mZcdu+TfjnTAL5GqVKE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187203-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187203: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=d61248b0fa2cdfc0be1d806c43d1b211a72b5d49
X-Osstest-Versions-That:
    xen=08aacc392d86d4c7dbebdb5e664060ae2af72057
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Aug 2024 04:27:11 +0000

flight 187203 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187203/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d61248b0fa2cdfc0be1d806c43d1b211a72b5d49
baseline version:
 xen                  08aacc392d86d4c7dbebdb5e664060ae2af72057

Last test of basis   187190  2024-08-08 12:06:01 Z    1 days
Testing same since   187203  2024-08-10 01:02:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Michal Orzel <michal.orzel@amd.com>

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
   08aacc392d..d61248b0fa  d61248b0fa2cdfc0be1d806c43d1b211a72b5d49 -> smoke

