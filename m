Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CEAC25B7C
	for <xen-devel@archiver.kernel.org>; Sat, 25 May 2024 03:37:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.730087.1135447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAiD8-0005n2-7U; Sat, 25 May 2024 03:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730087.1135447; Sat, 25 May 2024 03:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAiD8-0005mv-4n; Sat, 25 May 2024 03:36:46 +0000
Received: by outflank-mailman (input) for mailman id 730087;
 Sat, 25 May 2024 03:36:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAiD7-0005ml-91; Sat, 25 May 2024 03:36:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAiD6-0002Jt-WD; Sat, 25 May 2024 03:36:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAiD6-0001Hy-KJ; Sat, 25 May 2024 03:36:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sAiD6-0008Gd-Jp; Sat, 25 May 2024 03:36:44 +0000
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
	bh=6/asTN7iO/hEtDQqSuAJogzCyPbVgXJBDbupXdZacKg=; b=B0/Le13rePsMUSMI8JYYHnJg3U
	O1XzdRKgAq8f20TB+THkzVuZDx/7Ot2wLWbvcFIcNA0GWZcQ6qEAgAfgf41I/ewOtqHjmr3MtOKaL
	s6foaszy9+Pi+VB6Twot2gcWhlIjzkvqcSFG7GmGownfIjdMngcVGPFrQ8paZ/uubV6Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186142-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186142: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ac572152e578a8853de0534384c1539ec21f11e0
X-Osstest-Versions-That:
    xen=2172a01c4cecbaa1d79bad200bfe3b996a3e4ba5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 May 2024 03:36:44 +0000

flight 186142 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186142/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ac572152e578a8853de0534384c1539ec21f11e0
baseline version:
 xen                  2172a01c4cecbaa1d79bad200bfe3b996a3e4ba5

Last test of basis   186139  2024-05-24 17:00:22 Z    0 days
Testing same since   186142  2024-05-25 00:02:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Henry Wang <xin.wang2@amd.com>
  Julien Grall <jgrall@amazon.com>
  Stefano Stabellini <stefano.stabellini@amd.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Vikram Garhwal <fnu.vikram@xilinx.com>

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
   2172a01c4c..ac572152e5  ac572152e578a8853de0534384c1539ec21f11e0 -> smoke

