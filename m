Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EF6EB64D7
	for <xen-devel@archiver.kernel.org>; Fri, 30 Jun 2023 19:06:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.557613.871122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFJRW-0002za-Kc; Fri, 30 Jun 2023 19:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557613.871122; Fri, 30 Jun 2023 19:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFJRW-0002zT-Hk; Fri, 30 Jun 2023 19:06:06 +0000
Received: by outflank-mailman (input) for mailman id 557613;
 Fri, 30 Jun 2023 19:06:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFJRW-0002zJ-25; Fri, 30 Jun 2023 19:06:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFJRW-0006tN-1D; Fri, 30 Jun 2023 19:06:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFJRV-0004Od-HW; Fri, 30 Jun 2023 19:06:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qFJRV-0006my-H1; Fri, 30 Jun 2023 19:06:05 +0000
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
	bh=i82Rpw0/knL4o7CF18yRdtRC+1GEOSx/AlQIT9/L+RU=; b=4E7boqJSlZ59fW9CSkNx7Oay5p
	gPVwvjTkKKG2O8Sz+Xxfb+/KAdk/91HqwM3KELWJLJjTFkNUhasVfHYfaQDDNAf3bCNqUH5pEhy9F
	ZOxM7cZKuDp5np8qINY3ffegevowBSJmXXJ0d+FnpIVdgF0LKEWUAb/eCI13SZCcD7ss=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181659-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181659: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5a13f5c2fa5ada2eb2fcb961aa3745fd236620bd
X-Osstest-Versions-That:
    ovmf=f5c987fcac567b1f84a418826f30d8ef2b46860e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Jun 2023 19:06:05 +0000

flight 181659 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181659/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5a13f5c2fa5ada2eb2fcb961aa3745fd236620bd
baseline version:
 ovmf                 f5c987fcac567b1f84a418826f30d8ef2b46860e

Last test of basis   181652  2023-06-30 05:42:20 Z    0 days
Testing same since   181659  2023-06-30 16:42:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>

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
   f5c987fcac..5a13f5c2fa  5a13f5c2fa5ada2eb2fcb961aa3745fd236620bd -> xen-tested-master

