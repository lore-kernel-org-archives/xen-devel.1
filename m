Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6E4C27C4F
	for <xen-devel@archiver.kernel.org>; Sat, 15 Jun 2024 09:37:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.741018.1148068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIPq9-0003I4-6M; Sat, 15 Jun 2024 09:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741018.1148068; Sat, 15 Jun 2024 09:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIPq9-0003Hx-3M; Sat, 15 Jun 2024 09:36:53 +0000
Received: by outflank-mailman (input) for mailman id 741018;
 Sat, 15 Jun 2024 09:36:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIPq7-0003Hn-PL; Sat, 15 Jun 2024 09:36:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIPq7-00064K-L4; Sat, 15 Jun 2024 09:36:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIPq7-0001FT-Ak; Sat, 15 Jun 2024 09:36:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sIPq7-0002lt-AF; Sat, 15 Jun 2024 09:36:51 +0000
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
	bh=ipCbP95R2Ibsk3a5plgTcKGHY+WEv73gnBGFlAFcZi0=; b=Chy3stNiOYlJRAVD91HznVe/fE
	EFYxuOLsAk3WoSZ4bWYdS322gU1ZhLCBdSY4QH4B2cG6/ZMHFb/undfTUhU8AmLmTTikUiE85ieNG
	Yfr91f+NIb61SYh2+72cjAC+sWgyx2yCODR1cK7HCxhPsWAofZa/E2z3BX3l5Ky3xnVA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186360-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186360: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a84876ba283176eb683dc84274bc6c66faffc7a0
X-Osstest-Versions-That:
    ovmf=cf323e2839ce260fde43487baae205527dee1b2f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Jun 2024 09:36:51 +0000

flight 186360 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186360/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a84876ba283176eb683dc84274bc6c66faffc7a0
baseline version:
 ovmf                 cf323e2839ce260fde43487baae205527dee1b2f

Last test of basis   186358  2024-06-15 04:11:23 Z    0 days
Testing same since   186360  2024-06-15 07:42:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ross Lagerwall <ross.lagerwall@citrix.com>

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
   cf323e2839..a84876ba28  a84876ba283176eb683dc84274bc6c66faffc7a0 -> xen-tested-master

