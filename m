Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16682EB64D9
	for <xen-devel@archiver.kernel.org>; Thu,  6 Jul 2023 18:24:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.559965.875445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHTe7-0000WX-Jr; Thu, 06 Jul 2023 18:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559965.875445; Thu, 06 Jul 2023 18:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHTe7-0000WQ-Fu; Thu, 06 Jul 2023 18:24:03 +0000
Received: by outflank-mailman (input) for mailman id 559965;
 Thu, 06 Jul 2023 18:24:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qHTe6-0000WG-Ko; Thu, 06 Jul 2023 18:24:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qHTe6-00013K-GG; Thu, 06 Jul 2023 18:24:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qHTe6-0007O0-8y; Thu, 06 Jul 2023 18:24:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qHTe6-0002w1-8X; Thu, 06 Jul 2023 18:24:02 +0000
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
	bh=BiE6lVpoVbFr2GzD1z2/dM8gHyiq5W4BSEZ9RtOPxrQ=; b=Web3B4j1RML3a4z6N3RvOYr0rF
	g7gdrdOKxD8t1MzgEBmFz5w1WTb00WBRcKGeCNTuVlHIvkxYtrJQbps8Y/MYLMGLbf4bMKXl0X1Q4
	LiZwnYCIlaOo4Rmoh0/F94VnuwtVz+x4iyXd1diInLEsMHZemRzNLVe/d5APyuKbr8OU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181724-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181724: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=96d691166f07b7ed422f9536832edadc0aea35c9
X-Osstest-Versions-That:
    ovmf=60475162a66a73426cd971174bb3cd853a4619cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 Jul 2023 18:24:02 +0000

flight 181724 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181724/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 96d691166f07b7ed422f9536832edadc0aea35c9
baseline version:
 ovmf                 60475162a66a73426cd971174bb3cd853a4619cf

Last test of basis   181722  2023-07-06 13:42:14 Z    0 days
Testing same since   181724  2023-07-06 16:42:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

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
   60475162a6..96d691166f  96d691166f07b7ed422f9536832edadc0aea35c9 -> xen-tested-master

