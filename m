Return-Path: <SRS0=9gwS=BD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2023C433E4
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 09:39:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3BA206EB
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 09:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="P+CazwBI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3BA206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyuAf-0008Sp-8z; Fri, 24 Jul 2020 09:39:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjWU=BD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jyuAd-0008SQ-A5
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 09:39:15 +0000
X-Inumbo-ID: 854f86f4-cd91-11ea-a393-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 854f86f4-cd91-11ea-a393-12813bfff9fa;
 Fri, 24 Jul 2020 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RkOtHijcxDUwC63vvbpCulKS6tzqjVjQRWQrgxZ8JKY=; b=P+CazwBINhKJDtDZmcW6+rf+i
 KrowM4T6r2GG8RGUs5qLJLZKLHtc2jItqfVKe/po37MIsf0I/2ArQheS5sEZY2HOpNO7HMtGYehgT
 0fxu6WtrnN1lLzIy6QV4hPMutZXJsPlY7OOc5TS1sivsP1Q9f3KrChEmlyHEPyAHBfEMU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyuAV-0003pt-9O; Fri, 24 Jul 2020 09:39:07 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyuAV-0006ug-0R; Fri, 24 Jul 2020 09:39:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jyuAU-0005zo-W1; Fri, 24 Jul 2020 09:39:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152157-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152157: all pass - PUSHED
X-Osstest-Versions-This: ovmf=e43d0884ed93ffd8044e48e8d5d2d010a46aab33
X-Osstest-Versions-That: ovmf=3d2f7953b2ba9d27b1905c864c369fe624c74a3f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Jul 2020 09:39:06 +0000
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

flight 152157 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152157/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e43d0884ed93ffd8044e48e8d5d2d010a46aab33
baseline version:
 ovmf                 3d2f7953b2ba9d27b1905c864c369fe624c74a3f

Last test of basis   152131  2020-07-23 01:10:42 Z    1 days
Testing same since   152157  2020-07-23 15:45:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Feng, YunhuaX <YunhuaX.Feng@intel.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Leif Lindholm <leif@nuviainc.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Yunhua Feng <yunhuax.feng@intel.com>

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
   3d2f7953b2..e43d0884ed  e43d0884ed93ffd8044e48e8d5d2d010a46aab33 -> xen-tested-master

