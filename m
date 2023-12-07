Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C92AC4167B
	for <xen-devel@archiver.kernel.org>; Thu,  7 Dec 2023 03:29:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.649536.1014134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB54G-0006CC-Et; Thu, 07 Dec 2023 03:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649536.1014134; Thu, 07 Dec 2023 03:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB54G-0006C5-C2; Thu, 07 Dec 2023 03:28:52 +0000
Received: by outflank-mailman (input) for mailman id 649536;
 Thu, 07 Dec 2023 03:28:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rB54F-0006Bv-1Z; Thu, 07 Dec 2023 03:28:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rB54E-00081m-NX; Thu, 07 Dec 2023 03:28:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rB54E-0006gU-Fn; Thu, 07 Dec 2023 03:28:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rB54E-0003qB-FK; Thu, 07 Dec 2023 03:28:50 +0000
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
	bh=b9r4ZWSIJjVHWAoJtat10xe6vM09Lf6HBDaJxuyYLAU=; b=eMnRpIdIT1sRho/T5scyAoyfTW
	mWseh3rG8kzcSdV+42r9Zz+AzJkm04hhiG/zCB2a4C5R7668KMUPYdiap9NiF4vGY9g+y56sLd/1J
	fl4URu31KdfIZNk67Ij9sbTZMPkbeM8+knnX/Pm4cE0BIey/P1h02YYD6hCAA5vWB/rI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184017-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184017: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ff4c49a5ee38d613384fb2e318d891a800d32999
X-Osstest-Versions-That:
    ovmf=df2ec2aab0876d34025968030d1f26ad8e5106ec
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Dec 2023 03:28:50 +0000

flight 184017 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184017/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ff4c49a5ee38d613384fb2e318d891a800d32999
baseline version:
 ovmf                 df2ec2aab0876d34025968030d1f26ad8e5106ec

Last test of basis   184016  2023-12-06 23:12:43 Z    0 days
Testing same since   184017  2023-12-07 01:45:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nate DeSimone <nathaniel.l.desimone@intel.com>

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
   df2ec2aab0..ff4c49a5ee  ff4c49a5ee38d613384fb2e318d891a800d32999 -> xen-tested-master

