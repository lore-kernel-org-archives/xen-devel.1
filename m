Return-Path: <SRS0=BMa3=HO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C46C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 12 Feb 2021 02:04:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E637F64DB1
	for <xen-devel@archiver.kernel.org>; Fri, 12 Feb 2021 02:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E637F64DB1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.84110.157709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lANoW-0006ZB-2W; Fri, 12 Feb 2021 02:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84110.157709; Fri, 12 Feb 2021 02:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lANoV-0006Z4-Ug; Fri, 12 Feb 2021 02:04:07 +0000
Received: by outflank-mailman (input) for mailman id 84110;
 Fri, 12 Feb 2021 02:04:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lANoU-0006Yw-V3; Fri, 12 Feb 2021 02:04:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lANoU-0003Ix-MJ; Fri, 12 Feb 2021 02:04:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lANoU-00050U-Dm; Fri, 12 Feb 2021 02:04:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lANoU-0000HJ-DL; Fri, 12 Feb 2021 02:04:06 +0000
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
	bh=SF5afrLRDmWWM5T3rjAisrEHsawVAD03S5StD9WhDjw=; b=52+DI9lMUzwBoCtC3nTyhu/REN
	BY+Y+GnlIXPQ3yWay1NJcGnshQWZFDNwkVEHoKzMwZ2f+lEsC5Lf/mKjLUG5aHfyMhXN2Wvll0t8m
	szdjTC/2thDDh86o6KQowfC23o1zDZw7HrZUY7oG9vi9GcSCfqQES4vbVAovKeKdsPNc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159273-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 159273: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:<job status>:broken:regression
    xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=d66cf56fa26a052bce2f8c746dc0dbac9061b593
X-Osstest-Versions-That:
    xen=f3e1eb2f0234c955243a915d69ebd84f26eec130
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Feb 2021 02:04:06 +0000

flight 159273 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159273/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm                 <job status>                 broken
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 159258

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d66cf56fa26a052bce2f8c746dc0dbac9061b593
baseline version:
 xen                  f3e1eb2f0234c955243a915d69ebd84f26eec130

Last test of basis   159258  2021-02-11 17:00:27 Z    0 days
Testing same since   159266  2021-02-11 21:00:28 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              broken  
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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

broken-job build-arm64-xsm broken
broken-step build-arm64-xsm host-install(4)

Not pushing.

------------------------------------------------------------
commit d66cf56fa26a052bce2f8c746dc0dbac9061b593
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Feb 11 13:25:58 2021 +0000

    automation: Add Ubuntu Focal builds
    
    Logical continuation of c/s eb52442d7f "automation: Add Ubuntu:focal
    container".
    
    No further changes required.  Everything builds fine.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 9ca7632bc45cf045fa78a9d7e1275af55240b243
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Feb 10 13:51:21 2021 +0000

    tools/libxl: Document where the magic MAC numbers come from
    
    Matches the comment in the xl-network-configuration manpage.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>
(qemu changes not included)

