Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465A0C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 19:11:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB6C60E09
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 19:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB6C60E09
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129634.243253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj57H-0002HW-LW; Tue, 18 May 2021 19:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129634.243253; Tue, 18 May 2021 19:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj57H-0002HP-GQ; Tue, 18 May 2021 19:10:55 +0000
Received: by outflank-mailman (input) for mailman id 129634;
 Tue, 18 May 2021 19:10:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj57G-0002HF-Ue; Tue, 18 May 2021 19:10:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj57G-0001cu-Pt; Tue, 18 May 2021 19:10:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj57G-00055D-GI; Tue, 18 May 2021 19:10:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lj57G-00037n-Fn; Tue, 18 May 2021 19:10:54 +0000
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
	bh=DLTNGSR4hE6YXfDGm6mYuoZFfOqNw0izv5qlGx2jDKI=; b=54lqJxSHEMIdmg7FkJzo3NjCEs
	9vbBP3ygMfD61OjBd2xhsx8AzFtrB9spjf9Q/3e7Joo2w5l85mwadFeduZthGLef8Tn+dUY0+bITE
	AgRXVGX9wVKFqwTTVvIGuV2QiBPpDqfqqE6WcfF8mN4LmLBjlmVNaGtMP/rNEFAvMt5s=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162055-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 162055: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=01d84420fb4a9be2ec474a7c1910bb22c28b53c8
X-Osstest-Versions-That:
    xen=caa9c4471d1d74b2d236467aaf7e63a806ac11a4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 May 2021 19:10:54 +0000

flight 162055 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162055/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 162023
 build-armhf                   6 xen-build                fail REGR. vs. 162023

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  01d84420fb4a9be2ec474a7c1910bb22c28b53c8
baseline version:
 xen                  caa9c4471d1d74b2d236467aaf7e63a806ac11a4

Last test of basis   162023  2021-05-18 13:00:27 Z    0 days
Testing same since   162036  2021-05-18 16:00:26 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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


Not pushing.

------------------------------------------------------------
commit 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:51:48 2021 +0100

    tools/xenmon: xenbaked: Mark const the field text in stat_map_t
    
    The field text in stat_map_t will point to string literals. So mark it
    as const to allow the compiler to catch any modified of the string.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 4b7702727a8d89fea0a239adcbeb18aa2c85ede0
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:51:28 2021 +0100

    tools/top: The string parameter in set_prompt() and set_delay() should be const
    
    Neither string parameter in set_prompt() and set_delay() are meant to
    be modified. In particular, new_prompt can point to a literal string.
    
    So mark the two parameters as const and propagate it.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 5605cfd49a18df41a21fb50cd81528312a39d7c9
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:50:32 2021 +0100

    tools/misc: Use const whenever we point to literal strings
    
    literal strings are not meant to be modified. So we should use const
    char * rather than char * when we we to store a pointer to them.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 89aae4ad8f495b647de33f2df5046b3ce68225f8
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:35:07 2021 +0100

    tools/libs: stat: Use const whenever we point to literal strings
    
    literal strings are not meant to be modified. So we should use const
    char * rather than char * when we want to store a pointer to them.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue May 18 14:34:22 2021 +0100

    tools/libs: guest: Use const whenever we point to literal strings
    
    literal strings are not meant to be modified. So we should use const
    *char rather than char * when we want to store a pointer to them.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>
(qemu changes not included)

