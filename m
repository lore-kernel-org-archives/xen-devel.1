Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E950BC3DA59
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jul 2024 20:34:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.759799.1169482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTosX-00022D-1j; Tue, 16 Jul 2024 20:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759799.1169482; Tue, 16 Jul 2024 20:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTosW-000226-Ux; Tue, 16 Jul 2024 20:34:28 +0000
Received: by outflank-mailman (input) for mailman id 759799;
 Tue, 16 Jul 2024 20:34:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTosV-00021w-Qd; Tue, 16 Jul 2024 20:34:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTosV-0007eV-PI; Tue, 16 Jul 2024 20:34:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTosV-0005By-Dt; Tue, 16 Jul 2024 20:34:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTosV-0008RT-DN; Tue, 16 Jul 2024 20:34:27 +0000
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
	bh=mggBoOsO+U8VQTsZcbQVTZV9FObFlCXlaiRwXKKAAwY=; b=PMqcyAGI2ay3tws5Wj91V5PKB0
	QfpJlIvjPOKsdJ8NZkGF2sy3g9SyRTEPR6Uie3+wpca6hIFgUC/KjDYt/nRWve/Vthcr2JEq7nNRv
	VtdOMnQJJ79W9OxUu+M+vivZetBcuDsMVI81Bey1JZuHNBAfaUNH5B8qSxQwjO+58mS8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186822-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186822: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=690f13fcb4a7b74b30091c7067a18bb7971982d8
X-Osstest-Versions-That:
    ovmf=f9c373c8388f819166e57365197bc423d56209a6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Jul 2024 20:34:27 +0000

flight 186822 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186822/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 690f13fcb4a7b74b30091c7067a18bb7971982d8
baseline version:
 ovmf                 f9c373c8388f819166e57365197bc423d56209a6

Last test of basis   186817  2024-07-16 10:12:56 Z    0 days
Testing same since   186822  2024-07-16 15:43:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Levi Yun <yeoreum.yun@arm.com>
  levi.yun <yeoreum.yun@arm.com>

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
   f9c373c838..690f13fcb4  690f13fcb4a7b74b30091c7067a18bb7971982d8 -> xen-tested-master

