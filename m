Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901ABEB64D7
	for <xen-devel@archiver.kernel.org>; Fri, 23 Jun 2023 20:21:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.554427.865593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCnGj-0002Z3-JH; Fri, 23 Jun 2023 20:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554427.865593; Fri, 23 Jun 2023 20:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCnGj-0002Yw-Fw; Fri, 23 Jun 2023 20:20:33 +0000
Received: by outflank-mailman (input) for mailman id 554427;
 Fri, 23 Jun 2023 20:20:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCnGh-0002Ym-Rg; Fri, 23 Jun 2023 20:20:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCnGh-0002b2-EV; Fri, 23 Jun 2023 20:20:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCnGh-0001vh-16; Fri, 23 Jun 2023 20:20:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qCnGh-0000cY-0h; Fri, 23 Jun 2023 20:20:31 +0000
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
	bh=oSIlQd3tmSDTgGE/3cmRoQed7dnuYozz74xFACI9qgA=; b=J1eaVgKsZSpYEKrbbrBfpUV+zG
	fW411r3VrhsmwVT3tyCYBlgIcUZZ6RYqZyCTL2o+XwRmi83LwbExvVjsnVE7quLW42vrcK6ruOHMP
	CyNnJWFP7lrv6loGAEA2hkmo+aKQLB3VyYCbXy160t5zlfF6tFZVbFvBU0dNoqBPSe1g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181567-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181567: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=6ee981c858daeb08c8ab6d357a55c131875aae3a
X-Osstest-Versions-That:
    ovmf=49f06b664018105090a42a0684fb5e6ea4c909cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Jun 2023 20:20:31 +0000

flight 181567 ovmf real [real]
flight 181568 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181567/
http://logs.test-lab.xenproject.org/osstest/logs/181568/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install  fail pass in 181568-retest

version targeted for testing:
 ovmf                 6ee981c858daeb08c8ab6d357a55c131875aae3a
baseline version:
 ovmf                 49f06b664018105090a42a0684fb5e6ea4c909cd

Last test of basis   181561  2023-06-23 05:12:24 Z    0 days
Testing same since   181567  2023-06-23 16:40:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin12@gmail.com>

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
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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
   49f06b6640..6ee981c858  6ee981c858daeb08c8ab6d357a55c131875aae3a -> xen-tested-master

