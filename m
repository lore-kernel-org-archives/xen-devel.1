Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A6DC3DA49
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jul 2024 01:32:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.759830.1169518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTtWi-0006Ah-TY; Wed, 17 Jul 2024 01:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759830.1169518; Wed, 17 Jul 2024 01:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTtWi-0006AZ-O8; Wed, 17 Jul 2024 01:32:16 +0000
Received: by outflank-mailman (input) for mailman id 759830;
 Wed, 17 Jul 2024 01:32:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTtWh-0006AP-6e; Wed, 17 Jul 2024 01:32:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTtWh-00086u-51; Wed, 17 Jul 2024 01:32:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTtWg-0007nY-6t; Wed, 17 Jul 2024 01:32:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTtWg-00032N-3S; Wed, 17 Jul 2024 01:32:14 +0000
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
	bh=UwUevQ31CfuCqL6jrL+eL/kgRk/4Jbn7WWPKiFqtmzc=; b=YVYEhNIVtvZC8e4bJn30/Jnp93
	Iuf29F511BX1sCmo3gHG5OSB/mCTZeolNwn6Tv6+zt+Ex5RpbSNdSZ/VNuw2/8cD+RohqoRGcbEzY
	bWlNM5V6osvMhieqQhUbTlS3WHZmos8hIhTgYIc6RDVog3ooJC5AkNL0aIxLGrxTQahw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186829-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186829: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=55b043732d20305c769c6243e0a9a6e1f5ae879d
X-Osstest-Versions-That:
    ovmf=690f13fcb4a7b74b30091c7067a18bb7971982d8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jul 2024 01:32:14 +0000

flight 186829 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186829/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 55b043732d20305c769c6243e0a9a6e1f5ae879d
baseline version:
 ovmf                 690f13fcb4a7b74b30091c7067a18bb7971982d8

Last test of basis   186822  2024-07-16 15:43:03 Z    0 days
Testing same since   186829  2024-07-16 23:41:12 Z    0 days    1 attempts

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
   690f13fcb4..55b043732d  55b043732d20305c769c6243e0a9a6e1f5ae879d -> xen-tested-master

