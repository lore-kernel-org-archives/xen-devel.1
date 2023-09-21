Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70893E706F0
	for <xen-devel@archiver.kernel.org>; Thu, 21 Sep 2023 08:44:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.606221.943987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFIP-0001m5-Vm; Thu, 21 Sep 2023 08:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606221.943987; Thu, 21 Sep 2023 08:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFIP-0001ly-Rk; Thu, 21 Sep 2023 08:44:25 +0000
Received: by outflank-mailman (input) for mailman id 606221;
 Thu, 21 Sep 2023 08:44:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjFIP-0001lj-12; Thu, 21 Sep 2023 08:44:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjFIP-0001SU-0I; Thu, 21 Sep 2023 08:44:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjFIO-00056j-O4; Thu, 21 Sep 2023 08:44:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qjFIO-00075S-Ne; Thu, 21 Sep 2023 08:44:24 +0000
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
	bh=mP9Fx5FcFrNXj/iFNYJd5ygA6V71mk5MMs9SdofClZk=; b=5m/+9rfHnZfa3uvnNtpJkJ2BI7
	xxNkDyPCVkc5YlkkvXI2jmCfDgmv0tKkR7rwqqa13KkPRPWqj+X/ZPVWGRXNmhE/tJnWzr5djIVoz
	TQslzm7AFs799T6hCgJxuDMF/i9F3+6bUweLaT9x8gfdC0wogwMHj4ifoZzV94TMc7hs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183099-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183099: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ea628f28e59849ee7b91e6660c0ecd1a5c6e0884
X-Osstest-Versions-That:
    ovmf=89dad77cfbffda0303383a11026d854008c1b731
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 Sep 2023 08:44:24 +0000

flight 183099 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183099/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ea628f28e59849ee7b91e6660c0ecd1a5c6e0884
baseline version:
 ovmf                 89dad77cfbffda0303383a11026d854008c1b731

Last test of basis   183087  2023-09-20 15:10:51 Z    0 days
Testing same since   183099  2023-09-21 05:10:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrei Warkentin <andrei.warkentin@intel.com>

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
   89dad77cfb..ea628f28e5  ea628f28e59849ee7b91e6660c0ecd1a5c6e0884 -> xen-tested-master

