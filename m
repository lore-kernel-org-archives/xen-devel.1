Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D89C35274
	for <xen-devel@archiver.kernel.org>; Mon, 18 Dec 2023 09:04:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.655714.1023448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF9Y7-0004OQ-55; Mon, 18 Dec 2023 09:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655714.1023448; Mon, 18 Dec 2023 09:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF9Y7-0004OJ-2K; Mon, 18 Dec 2023 09:04:31 +0000
Received: by outflank-mailman (input) for mailman id 655714;
 Mon, 18 Dec 2023 09:04:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rF9Y5-0004O9-91; Mon, 18 Dec 2023 09:04:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rF9Y4-0001Eb-SQ; Mon, 18 Dec 2023 09:04:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rF9Y4-0001GG-IT; Mon, 18 Dec 2023 09:04:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rF9Y4-0001tV-I5; Mon, 18 Dec 2023 09:04:28 +0000
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
	bh=PLA1lCyabivRuz9Z6ASlfFpnObM0ox6xATOYkkPcueM=; b=jKv7lKfGOfB/TNHE82mXdHT18U
	cu9T00jlq7bdJfPeaQA7ywNcYhz6S0hFWTl0NIWDsiw/Io8J5RZTgjRiHoS3VlosndXQbxq1CbWsV
	uMeQYyCfCYBsANTuod2y+w988PGNGWQJukuNH04yk1eWXEJH78V/cH2rtqhD9AFWKwkg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184163-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184163: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=74daeded0cabe87d26546f07f9a3911cb60ec0e1
X-Osstest-Versions-That:
    ovmf=3ce5f2d445e51efe2aebaa227a055e5c8522d00b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Dec 2023 09:04:28 +0000

flight 184163 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184163/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 74daeded0cabe87d26546f07f9a3911cb60ec0e1
baseline version:
 ovmf                 3ce5f2d445e51efe2aebaa227a055e5c8522d00b

Last test of basis   184142  2023-12-14 22:12:46 Z    3 days
Testing same since   184163  2023-12-18 06:42:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel Nguyen <daniel.nguyen@arm.com>

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
   3ce5f2d445..74daeded0c  74daeded0cabe87d26546f07f9a3911cb60ec0e1 -> xen-tested-master

