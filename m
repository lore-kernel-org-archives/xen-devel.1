Return-Path: <SRS0=9A1V=LF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453F1C4743D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Jun 2021 06:46:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05DE8611B0
	for <xen-devel@archiver.kernel.org>; Fri, 11 Jun 2021 06:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05DE8611B0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.140201.259101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lraw8-0005vf-SB; Fri, 11 Jun 2021 06:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140201.259101; Fri, 11 Jun 2021 06:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lraw8-0005vY-OS; Fri, 11 Jun 2021 06:46:36 +0000
Received: by outflank-mailman (input) for mailman id 140201;
 Fri, 11 Jun 2021 06:46:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lraw7-0005vI-4N; Fri, 11 Jun 2021 06:46:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lraw6-00074o-Vs; Fri, 11 Jun 2021 06:46:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lraw6-0007rd-OO; Fri, 11 Jun 2021 06:46:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lraw6-0007JN-Nu; Fri, 11 Jun 2021 06:46:34 +0000
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
	bh=JypJ9f4NbQgGYqU3Y/6ASbDIN4Vee/Iz58p8dmdvTvc=; b=x8SEFbPunLv40JphStmorH38+/
	c3YevuGgHbA8WqMPdfQi1JokRWXy2YHx9wLJDIuILs+atXhFw81USBgsolHUYlQyyNA0+T69mPoJR
	cSaWkDgsuTOq1aZ3zEnKXazWavWVD7xv8t+yF3RjvGdcS6Pq6W246Mraze4izFWvD3o8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162630-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 162630: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start/debian.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=2bb17a45b1814b0b6aa4646eff58e16f876281fd
X-Osstest-Versions-That:
    xen=3e09045991cde360432bc7437103f8f8a6699359
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Jun 2021 06:46:34 +0000

flight 162630 xen-unstable-smoke real [real]
flight 162634 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/162630/
http://logs.test-lab.xenproject.org/osstest/logs/162634/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 162574

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  2bb17a45b1814b0b6aa4646eff58e16f876281fd
baseline version:
 xen                  3e09045991cde360432bc7437103f8f8a6699359

Last test of basis   162574  2021-06-09 14:00:34 Z    1 days
Failing since        162584  2021-06-10 00:00:27 Z    1 days    8 attempts
Testing same since   162607  2021-06-10 15:00:30 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Jan Beulich <jbeulich@suse.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
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


Not pushing.

------------------------------------------------------------
commit 2bb17a45b1814b0b6aa4646eff58e16f876281fd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Jun 10 16:56:24 2021 +0200

    x86: please Clang in arch_set_info_guest()
    
    Clang 10 reports
    
    domain.c:1328:10: error: variable 'cr3_mfn' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        if ( !compat )
             ^~~~~~~
    domain.c:1334:34: note: uninitialized use occurs here
        cr3_page = get_page_from_mfn(cr3_mfn, d);
                                     ^~~~~~~
    domain.c:1328:5: note: remove the 'if' if its condition is always true
        if ( !compat )
        ^~~~~~~~~~~~~~
    domain.c:1042:18: note: initialize the variable 'cr3_mfn' to silence this warning
        mfn_t cr3_mfn;
                     ^
                      = 0
    domain.c:1189:14: error: variable 'fail' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
            if ( !compat )
                 ^~~~~~~
    domain.c:1211:9: note: uninitialized use occurs here
            fail |= v->arch.pv.gdt_ents != c(gdt_ents);
            ^~~~
    domain.c:1189:9: note: remove the 'if' if its condition is always true
            if ( !compat )
            ^~~~~~~~~~~~~~
    domain.c:1187:18: note: initialize the variable 'fail' to silence this warning
            bool fail;
                     ^
                      = false
    
    despite this being a build with -O2 in effect, and despite "compat"
    being constant "false" when CONFIG_COMPAT (and hence CONFIG_PV32) is not
    defined, as it gets set at the top of the function from the result of
    is_pv_32bit_domain().
    
    Re-arrange the two "offending" if()s such that when COMPAT=n the
    respective variables will be seen as unconditionally initialized. The
    original aim was to have the !compat cases first, though.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit dfcffb128be46a3e413eaa941744536fe53c94b6
Author: Stefano Stabellini <sstabellini@kernel.org>
Date:   Wed Jun 9 10:37:59 2021 -0700

    xen/arm32: SPSR_hyp/SPSR
    
    SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
    trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.
    See: ARM DDI 0487D.b page G8-5993.
    
    This fixes booting Xen/arm32 on QEMU.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
    Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
(qemu changes not included)

