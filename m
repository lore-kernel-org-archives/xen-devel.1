Return-Path: <SRS0=ERFX=CN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0066EC433E2
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 06:37:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0C2020748
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 06:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="55zfD25w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0C2020748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE5Ll-00016Q-Jm; Fri, 04 Sep 2020 06:37:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiF3=CN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kE5Lj-00014T-NA
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 06:37:27 +0000
X-Inumbo-ID: a5c770ea-0116-4c27-84f5-e8eeb0053236
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5c770ea-0116-4c27-84f5-e8eeb0053236;
 Fri, 04 Sep 2020 06:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=s0vD4ipYjwIKYNzW6Cxj8PKJDeryHa7Hy4KAsN8MCDo=; b=55zfD25wXTNJPYnYuN7gL6Dtgx
 TBRj91bxD857Gg4KRIx9JkUlSgWQ1FFNv/KuT+PlSLsQuz00uu1v4lJPONd4RoDDAEIsKoWgeGhcJ
 bpE52i2ZJyMg5xGkA7knK5TbsUnbyW9ZqStW/4cKPnHxq+2nGdsaoVvzY11j9QdpP8mE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kE5Ld-0004Uu-24; Fri, 04 Sep 2020 06:37:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kE5Lc-0002ac-QJ; Fri, 04 Sep 2020 06:37:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kE5Lc-0004m8-Pq; Fri, 04 Sep 2020 06:37:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153689-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 153689: regressions - FAIL
X-Osstest-Failures: ovmf:build-i386-xsm:xen-build:fail:regression
 ovmf:build-amd64-xsm:xen-build:fail:regression
 ovmf:build-amd64:xen-build:fail:regression
 ovmf:build-i386:xen-build:fail:regression
 ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
 ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
 ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=06dc822d045c2bb42e497487935485302486e151
X-Osstest-Versions-That: ovmf=63d92674d240ab4ecab94f98e1e198842bb7de00
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Sep 2020 06:37:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 153689 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153689/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-xsm                6 xen-build                fail REGR. vs. 152863
 build-amd64-xsm               6 xen-build                fail REGR. vs. 152863
 build-amd64                   6 xen-build                fail REGR. vs. 152863
 build-i386                    6 xen-build                fail REGR. vs. 152863

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 06dc822d045c2bb42e497487935485302486e151
baseline version:
 ovmf                 63d92674d240ab4ecab94f98e1e198842bb7de00

Last test of basis   152863  2020-08-26 16:09:47 Z    8 days
Failing since        152915  2020-08-27 18:09:42 Z    7 days  133 attempts
Testing same since   153646  2020-09-03 17:39:43 Z    0 days    6 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Paul <paul.grimes@amd.com>
  Paul G <paul.grimes@amd.com>
  Qi Zhang <qi1.zhang@intel.com>
  Shenglei Zhang <shenglei.zhang@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  Zhang, Shenglei <shenglei.zhang@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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

(No revision log; it would be 302 lines long.)

