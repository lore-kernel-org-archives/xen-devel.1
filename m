Return-Path: <SRS0=8drl=M2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EFCC4338F
	for <xen-devel@archiver.kernel.org>; Tue,  3 Aug 2021 13:52:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B7C60EE8
	for <xen-devel@archiver.kernel.org>; Tue,  3 Aug 2021 13:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50B7C60EE8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.163509.299506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuqD-00086o-At; Tue, 03 Aug 2021 13:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163509.299506; Tue, 03 Aug 2021 13:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuqD-00086h-7j; Tue, 03 Aug 2021 13:52:21 +0000
Received: by outflank-mailman (input) for mailman id 163509;
 Tue, 03 Aug 2021 13:52:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mAuqB-00086V-Pr; Tue, 03 Aug 2021 13:52:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mAuqB-0004aw-Kj; Tue, 03 Aug 2021 13:52:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mAuqB-0003vp-AR; Tue, 03 Aug 2021 13:52:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mAuqB-0005AV-9z; Tue, 03 Aug 2021 13:52:19 +0000
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
	bh=WAFMV7ALwIq6vAUwo6H2m+1NxjQEwUCDFVGxUOZEjMs=; b=UyXP07DrH8y71HYcG7BcNxhWJg
	WBfvwj/1xhOmOhTb5PPBwLjfs3upuTw6E90NjzxsPGsjtMm3olXEadOFqgTA7H90PpnfXrOLDl5yK
	PsG2JXgs5Om53yH2dKQ1TsAwWtqxZvWMV6fGK36hkrMyJZEDcm0TnrtkH5Z1sXIzNuLs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164090-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164090: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2b47aaecef38b9440a65809cbdaf9d97029f4eeb
X-Osstest-Versions-That:
    ovmf=03e77558d4939b9c21e94f03072360e9b00bb559
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Aug 2021 13:52:19 +0000

flight 164090 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164090/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2b47aaecef38b9440a65809cbdaf9d97029f4eeb
baseline version:
 ovmf                 03e77558d4939b9c21e94f03072360e9b00bb559

Last test of basis   164081  2021-08-02 08:41:13 Z    1 days
Testing same since   164090  2021-08-03 05:10:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Grzegorz Bernacki <gjb@semihalf.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   03e77558d4..2b47aaecef  2b47aaecef38b9440a65809cbdaf9d97029f4eeb -> xen-tested-master

