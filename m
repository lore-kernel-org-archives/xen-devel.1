Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CC5C25B7E
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2024 14:21:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.733744.1140077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD37p-0007bq-49; Fri, 31 May 2024 14:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733744.1140077; Fri, 31 May 2024 14:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD37p-0007bj-0s; Fri, 31 May 2024 14:20:57 +0000
Received: by outflank-mailman (input) for mailman id 733744;
 Fri, 31 May 2024 14:20:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sD37n-0007bW-4w; Fri, 31 May 2024 14:20:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sD37n-0000x3-24; Fri, 31 May 2024 14:20:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sD37m-0007jW-Pt; Fri, 31 May 2024 14:20:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sD37m-0000SJ-Pa; Fri, 31 May 2024 14:20:54 +0000
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
	bh=Wsnz4fBfL5NjkcajVv/MFfBdUJJ8OxkNKgLeapRl8RY=; b=leS25ISK4l2CkOvE0ilnZWJK8v
	Ow+O/rusaXJtFSQF3lv3ITP9dFvOubygXOCkrIr5bPHjIQ7jk/yPb6bv+4k0gK3gHgY8Lmdqis14t
	RDLnjwbUfE8UbZ0zxoNRjfElokmDLUYdey4YPDH8iOPJ5RdMP2sVBh1HwjmvMZVZrMpU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186210-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186210: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7c584bb04874bb5bad16fcf3996f5a893cc81a1c
X-Osstest-Versions-That:
    ovmf=746cc5cc40bef22d606cd22d1feb10d73a7b3d11
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 31 May 2024 14:20:54 +0000

flight 186210 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186210/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7c584bb04874bb5bad16fcf3996f5a893cc81a1c
baseline version:
 ovmf                 746cc5cc40bef22d606cd22d1feb10d73a7b3d11

Last test of basis   186209  2024-05-31 08:13:05 Z    0 days
Testing same since   186210  2024-05-31 12:44:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Qingyu <qingyu.shang@intel.com>

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
   746cc5cc40..7c584bb048  7c584bb04874bb5bad16fcf3996f5a893cc81a1c -> xen-tested-master

