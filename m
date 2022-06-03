Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAD1C433EF
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jun 2022 14:45:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.341554.566789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8YT-0002r5-QF; Fri, 03 Jun 2022 14:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341554.566789; Fri, 03 Jun 2022 14:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8YT-0002qy-Kw; Fri, 03 Jun 2022 14:45:37 +0000
Received: by outflank-mailman (input) for mailman id 341554;
 Fri, 03 Jun 2022 14:45:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nx8YR-0002qo-Ry; Fri, 03 Jun 2022 14:45:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nx8YR-00063V-NA; Fri, 03 Jun 2022 14:45:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nx8YR-0005ck-9Q; Fri, 03 Jun 2022 14:45:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nx8YR-00015u-8y; Fri, 03 Jun 2022 14:45:35 +0000
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
	bh=ygX5k92vk+UB4dQ75YIxnRETOe4MbtSnSxtdaqnE68E=; b=qP03qClsJqNa6XVLnjBLtZjSFe
	ZUwfiXYcp5yb11fWlepTCA80eiPdnWjmhZ6bA635Wwgc3R8QYzMzyiMJ+BoV743DLHvfKvNakSYl2
	paS9AvMthlcDuL/eYXchG+KARVwca2CYO8lqyXIeQQ9J6mkqbnfImhv1Vc/SUK1yYOrM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170819-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170819: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0a4019ec9de64c6565ea545dc8d847afe2b30d6c
X-Osstest-Versions-That:
    ovmf=632574ced10fe184d5665b73c62c959109c39961
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Jun 2022 14:45:35 +0000

flight 170819 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170819/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0a4019ec9de64c6565ea545dc8d847afe2b30d6c
baseline version:
 ovmf                 632574ced10fe184d5665b73c62c959109c39961

Last test of basis   170818  2022-06-03 10:46:12 Z    0 days
Testing same since   170819  2022-06-03 12:40:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiewen Yao <jiewen.yao@intel.com>
  Min Xu <min.m.xu@intel.com>
  Sebastien Boeuf <sebastien.boeuf@intel.com>

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
   632574ced1..0a4019ec9d  0a4019ec9de64c6565ea545dc8d847afe2b30d6c -> xen-tested-master

