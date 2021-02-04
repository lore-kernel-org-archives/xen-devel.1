Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F31C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 16:16:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C07A64D5D
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 16:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C07A64D5D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81360.150257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hIT-0003yI-GJ; Thu, 04 Feb 2021 16:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81360.150257; Thu, 04 Feb 2021 16:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hIT-0003yB-CT; Thu, 04 Feb 2021 16:15:57 +0000
Received: by outflank-mailman (input) for mailman id 81360;
 Thu, 04 Feb 2021 16:15:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7hIS-0003y2-BD; Thu, 04 Feb 2021 16:15:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7hIS-0006rK-2m; Thu, 04 Feb 2021 16:15:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7hIR-0004Mi-Ro; Thu, 04 Feb 2021 16:15:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l7hIR-0003Bg-RJ; Thu, 04 Feb 2021 16:15:55 +0000
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
	bh=i1PQkXOM4QRAjsOWQRMblW2J93LX6M5jqsKtdZFhfVo=; b=H+v+xKLVB3DwrkvrMi7K3j729Q
	cO2mNG1+K/Y1pA1J5xS54jcMCtO0C+N//3hW+fG2/BhXt7IYHdffUYeprIGgM30+oyHJvZfcHhCcn
	q5zRmjdKDcEP3zjx2idPMELouUi6usLAqYi5vCjkAUsofsv9kYZ1fpZhyd+S2PXqLRkU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159014-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 159014: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:<job status>:broken:regression
    xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=92f5ffa58d188c9f9a9f1bcdccb6d6348d9df612
X-Osstest-Versions-That:
    xen=d203dbd69f1a02577dd6fe571d72beb980c548a6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Feb 2021 16:15:55 +0000

flight 159014 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159014/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm                 <job status>                 broken
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 158993

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  92f5ffa58d188c9f9a9f1bcdccb6d6348d9df612
baseline version:
 xen                  d203dbd69f1a02577dd6fe571d72beb980c548a6

Last test of basis   158993  2021-02-03 21:00:26 Z    0 days
Testing same since   159014  2021-02-04 14:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
commit 92f5ffa58d188c9f9a9f1bcdccb6d6348d9df612
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Feb 4 14:02:32 2021 +0100

    x86/efi: enable MS ABI attribute on clang
    
    Or else the EFI service calls will use the wrong calling convention.
    
    The __ms_abi__ attribute is available on all supported versions of
    clang. Add a specific Clang check because the GCC version reported by
    Clang is below the required 4.4 to use the __ms_abi__ attribute.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit da20c93108226cb2eb2ed1a13225337f2318a642
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Feb 4 14:01:21 2021 +0100

    IOREQ: fix waiting for broadcast completion
    
    Checking just a single server is not enough - all of them must have
    signaled that they're done processing the request.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>

commit 7b93d92a35dc7c0a6e5f1f79b3c887aa3e66ddc0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Feb 4 13:59:56 2021 +0100

    x86/string: correct memmove()'s forwarding to memcpy()
    
    With memcpy() expanding to the compiler builtin, we may not hand it
    overlapping source and destination. We strictly mean to forward to our
    own implementation (a few lines up in the same source file).
    
    Fixes: 78825e1c60fa ("x86/string: Clean up x86/string.h")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

