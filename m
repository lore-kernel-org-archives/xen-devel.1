Return-Path: <SRS0=4CTN=DE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E793C4346E
	for <xen-devel@archiver.kernel.org>; Sun, 27 Sep 2020 19:12:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E296923A03
	for <xen-devel@archiver.kernel.org>; Sun, 27 Sep 2020 19:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="3NE/vDRr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E296923A03
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMc5d-0002Tx-Tk; Sun, 27 Sep 2020 19:12:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mno3=DE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kMc5c-0002TX-M3
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 19:12:04 +0000
X-Inumbo-ID: f02bb3f3-0d23-42dc-9ca5-d069e091ba09
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f02bb3f3-0d23-42dc-9ca5-d069e091ba09;
 Sun, 27 Sep 2020 19:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=MBltQYlU7rdwDiJdYeLtFfvrD0Q7N68JHf5Dh4tlI5Q=; b=3NE/vDRrKU9U4Zb9yDJapaoHKl
 9GrMEKtln3F8nZqFkTIWUwQQyI3by2ui4BBMRzup+ff9kLjlbHGyxf+7A6J6lMoFH3KIDjeCPowln
 UxoDZBW7IO8SAy9EQlq+bJyjNdyt5dKQxfQKM9hke6aiM59r3RhF9frzxs5EUDBQ46b4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMc5U-00030F-T6; Sun, 27 Sep 2020 19:11:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMc5U-0007Uw-L5; Sun, 27 Sep 2020 19:11:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kMc5U-0005fU-KY; Sun, 27 Sep 2020 19:11:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154814-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 154814: trouble: blocked/broken/pass
X-Osstest-Failures: seabios:build-i386:<job status>:broken:regression
 seabios:build-i386-pvops:<job status>:broken:regression
 seabios:build-i386-xsm:<job status>:broken:regression
 seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job
 status>:broken:regression
 seabios:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
 seabios:test-amd64-amd64-qemuu-freebsd12-amd64:<job status>:broken:regression
 seabios:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
 seabios:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
 seabios:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job
 status>:broken:regression
 seabios:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job
 status>:broken:regression
 seabios:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 seabios:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job
 status>:broken:regression
 seabios:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
 seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
 seabios:test-amd64-amd64-qemuu-nested-intel:host-install(4):broken:regression
 seabios:build-i386-pvops:host-install(4):broken:regression
 seabios:build-i386-xsm:host-install(4):broken:regression
 seabios:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(4):broken:regression
 seabios:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(4):broken:regression
 seabios:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(4):broken:regression
 seabios:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(4):broken:regression
 seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(4):broken:regression
 seabios:build-i386:host-install(4):broken:regression
 seabios:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(4):broken:regression
 seabios:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(4):broken:regression
 seabios:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(4):broken:regression
 seabios:test-amd64-amd64-qemuu-nested-amd:host-install(4):broken:regression
 seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(4):broken:regression
 seabios:build-i386-libvirt:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: seabios=41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5
X-Osstest-Versions-That: seabios=155821a1990b6de78dde5f98fa5ab90e802021e0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Sep 2020 19:11:56 +0000
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

flight 154814 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154814/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel  4 host-install(4) broken REGR. vs. 152554
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 152554
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 152554
 test-amd64-amd64-qemuu-freebsd12-amd64 4 host-install(4) broken REGR. vs. 152554
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 4 host-install(4) broken REGR. vs. 152554
 test-amd64-amd64-qemuu-freebsd11-amd64 4 host-install(4) broken REGR. vs. 152554
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 4 host-install(4) broken REGR. vs. 152554
 test-amd64-amd64-xl-qemuu-ws16-amd64 4 host-install(4) broken REGR. vs. 152554
 build-i386                    4 host-install(4)        broken REGR. vs. 152554
 test-amd64-amd64-xl-qemuu-win7-amd64 4 host-install(4) broken REGR. vs. 152554
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 4 host-install(4) broken REGR. vs. 152554
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 4 host-install(4) broken REGR. vs. 152554
 test-amd64-amd64-qemuu-nested-amd  4 host-install(4)   broken REGR. vs. 152554
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 4 host-install(4) broken REGR. vs. 152554

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 seabios              41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5
baseline version:
 seabios              155821a1990b6de78dde5f98fa5ab90e802021e0

Last test of basis   152554  2020-08-10 15:41:45 Z   48 days
Testing same since   154814  2020-09-25 16:10:32 Z    2 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Berrangé <berrange@redhat.com>
  Matt DeVillier <matt.devillier@puri.sm>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               broken  
 build-amd64                                                  pass    
 build-i386                                                   broken  
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       broken  
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 


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

broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-step test-amd64-amd64-qemuu-nested-intel host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step test-amd64-amd64-qemuu-freebsd12-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(4)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(4)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(4)
broken-step build-i386 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(4)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(4)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(4)

Not pushing.

------------------------------------------------------------
commit 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5
Author: Matt DeVillier <matt.devillier@puri.sm>
Date:   Fri Sep 11 12:54:21 2020 -0500

    usb.c: Fix devices using non-primary interface descriptor
    
    A fair number of USB devices (keyboards in particular) use an
    interface descriptor
    other than the first available, making them non-functional currently.
    To correct this, iterate through all available interface descriptors
    until one with the correct class/subclass is found, then proceed to set the
    configuration and setup the driver.
    
    Tested on an ultimate hacking keyboard (UHK 60)
    
    Signed-off-by: Matt DeVillier <matt.devillier@puri.sm>

commit 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue Sep 8 16:16:53 2020 +0100

    smbios: avoid integer overflow when adding SMBIOS type 0 table
    
    SeaBIOS implements the SMBIOS 2.1 entry point which is limited to a
    maximum length of 0xffff. If the SMBIOS data received from QEMU is large
    enough, then adding the type 0 table will cause integer overflow. This
    results in fun behaviour such as KVM crash, or hangs in SeaBIOS.
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

