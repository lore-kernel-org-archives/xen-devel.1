Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CF2C4332F
	for <xen-devel@archiver.kernel.org>; Mon,  7 Nov 2022 18:07:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.439561.693588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os6XA-0000wr-2I; Mon, 07 Nov 2022 18:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439561.693588; Mon, 07 Nov 2022 18:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os6X9-0000wk-Ut; Mon, 07 Nov 2022 18:07:43 +0000
Received: by outflank-mailman (input) for mailman id 439561;
 Mon, 07 Nov 2022 18:07:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1os6X8-0000wY-PK; Mon, 07 Nov 2022 18:07:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1os6X8-0005aj-OY; Mon, 07 Nov 2022 18:07:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1os6X8-00017E-9t; Mon, 07 Nov 2022 18:07:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1os6X8-0000bH-9S; Mon, 07 Nov 2022 18:07:42 +0000
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
	bh=erAIId0CHOimMxNrC0HqPu2zrBjjFc9Z8rTKvMjdpRo=; b=h4HfZB5/AEul5bKic2YaCUznFT
	0QkWOJ/a/qqSDmQwPDrZyRvtWh6kx1wAUxDBA9i/gm72fbotQ/Fw7bgiPpZhatjLxfEE7UT79hLPF
	XRoF0dyRzmAItANoibeZYNhkesCTP9E+TIn6gDcA7YFU52O3yDwlgrW/3Si1/6OufY3E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174658-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174658: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=239bcf78053f4581cc3468ab961f9d37e859c7d9
X-Osstest-Versions-That:
    ovmf=82e70d9ac0aabf48a0cbda3c373e94ef22413e49
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Nov 2022 18:07:42 +0000

flight 174658 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174658/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 239bcf78053f4581cc3468ab961f9d37e859c7d9
baseline version:
 ovmf                 82e70d9ac0aabf48a0cbda3c373e94ef22413e49

Last test of basis   174657  2022-11-07 12:12:01 Z    0 days
Testing same since   174658  2022-11-07 16:11:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   82e70d9ac0..239bcf7805  239bcf78053f4581cc3468ab961f9d37e859c7d9 -> xen-tested-master

