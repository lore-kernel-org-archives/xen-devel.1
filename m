Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F2ECF8571
	for <xen-devel@archiver.kernel.org>; Thu,  3 Oct 2024 09:29:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.809228.1221446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swI9O-0008HL-54; Thu, 03 Oct 2024 09:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809228.1221446; Thu, 03 Oct 2024 09:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swI9O-0008HE-1n; Thu, 03 Oct 2024 09:29:34 +0000
Received: by outflank-mailman (input) for mailman id 809228;
 Thu, 03 Oct 2024 09:29:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swI9M-0008H0-HT; Thu, 03 Oct 2024 09:29:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swI9M-0007GA-8z; Thu, 03 Oct 2024 09:29:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swI9M-0001ud-0L; Thu, 03 Oct 2024 09:29:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1swI9M-0006ql-03; Thu, 03 Oct 2024 09:29:32 +0000
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
	bh=oh1RzQzyoLmrA6XyObSrIc5CU9XVLlRlFOS5xeUil2s=; b=ikE6fzlcYif7L+HyPw3/+9xhk7
	A4WI18H877oaYX63eNOmOCTSc5j9z+Qm35JwRC/Cv4ZJsZ++UcM3Sr8ELqvruhvvNARtz0hiOfifx
	WhFwuphzjKSY8YWnbSf/N6XCoG3cO7xGZ3gzGRtKRvefZTNVdDkXSJQVU216WuLho9QE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187947-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187947: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d2e8118461ef82c975d9e1ce3855a2b9d44fa719
X-Osstest-Versions-That:
    ovmf=e73ec569429ba72fbb6829518d6c192b4cd3346f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 03 Oct 2024 09:29:32 +0000

flight 187947 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187947/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d2e8118461ef82c975d9e1ce3855a2b9d44fa719
baseline version:
 ovmf                 e73ec569429ba72fbb6829518d6c192b4cd3346f

Last test of basis   187942  2024-10-02 20:14:00 Z    0 days
Testing same since   187947  2024-10-03 07:43:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   e73ec56942..d2e8118461  d2e8118461ef82c975d9e1ce3855a2b9d44fa719 -> xen-tested-master

