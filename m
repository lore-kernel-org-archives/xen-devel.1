Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5A2D3E194
	for <xen-devel@archiver.kernel.org>; Sat, 19 Oct 2024 02:00:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.822298.1236289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ylR-0003cT-Qs; Sat, 19 Oct 2024 02:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822298.1236289; Sat, 19 Oct 2024 02:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ylR-0003cM-OH; Sat, 19 Oct 2024 02:00:21 +0000
Received: by outflank-mailman (input) for mailman id 822298;
 Sat, 19 Oct 2024 02:00:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1ylR-0003cC-81; Sat, 19 Oct 2024 02:00:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1ylR-0001yo-67; Sat, 19 Oct 2024 02:00:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1ylQ-0004oh-W5; Sat, 19 Oct 2024 02:00:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1ylQ-0001Zy-Vb; Sat, 19 Oct 2024 02:00:20 +0000
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
	bh=8IFuOm8CcHzYFqvaIIbp0nmkKS3Nlyku8dIoP8bRLDY=; b=QsFO6b9XUaW1V98n+LDDAeoSUN
	fCDMTUyawP7zoQVok/WRW3fr3BaX8ZkAhK0d8hhdlHdz/teaVotxdVk1xrtqEgkv5gJBomQNc9Aoy
	WEO2k6SHU4xbPsS4JMEORPIEokPq/+EllihNWHbA+FGl4cVrBwHXAf8INP09pMqYFEfY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188274-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 188274: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e9f227685e7204cb2293576ee5b745b828cb3cd7
X-Osstest-Versions-That:
    xen=4c21b6affb4c5a3afe22cbc144362091de063366
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Oct 2024 02:00:20 +0000

flight 188274 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188274/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e9f227685e7204cb2293576ee5b745b828cb3cd7
baseline version:
 xen                  4c21b6affb4c5a3afe22cbc144362091de063366

Last test of basis   188244  2024-10-18 11:00:25 Z    0 days
Testing same since   188274  2024-10-18 23:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrei Cherechesu <andrei.cherechesu@nxp.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Julien Grall <jgrall@amazon.com>
  Peter van der Perk <peter.vander.perk@nxp.com>

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
   4c21b6affb..e9f227685e  e9f227685e7204cb2293576ee5b745b828cb3cd7 -> smoke

