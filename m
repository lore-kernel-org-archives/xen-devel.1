Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128E8EB64DE
	for <xen-devel@archiver.kernel.org>; Tue, 10 Sep 2024 10:52:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.795401.1204754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyTP-0007RO-UJ; Tue, 10 Sep 2024 10:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795401.1204754; Tue, 10 Sep 2024 10:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyTP-0007RH-RX; Tue, 10 Sep 2024 10:51:51 +0000
Received: by outflank-mailman (input) for mailman id 795401;
 Tue, 10 Sep 2024 10:51:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snyTO-0007R3-7p; Tue, 10 Sep 2024 10:51:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snyTO-00065l-5w; Tue, 10 Sep 2024 10:51:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snyTN-0006Yt-Rm; Tue, 10 Sep 2024 10:51:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1snyTN-0002sz-R3; Tue, 10 Sep 2024 10:51:49 +0000
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
	bh=9YnQN2/3gs8kX74MrlF1wCBpcAqkxjjzmmnEsbZa1iM=; b=vCGVjcMIZPnCiyUlx8UQdlb565
	jRHK95ncZfSo3ZAXI+ZyYRMi7AOHq/NiLHqu5RE09IuzQc4hIejAlgUSdQuqQkAoH58g5X9suHjTs
	c4eGVDlASTUT5Ac8tFiahF7mUcu+vz08a3sQ5b4AVKFnCOxsCOrNg9Pt7JnMXRvOygnQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187638-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187638: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b1ce2e1b67ff3b2478739976e952ac719010f019
X-Osstest-Versions-That:
    ovmf=61f9695f20a575085d0579a0d3efc41b322ce1ac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Sep 2024 10:51:49 +0000

flight 187638 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187638/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b1ce2e1b67ff3b2478739976e952ac719010f019
baseline version:
 ovmf                 61f9695f20a575085d0579a0d3efc41b322ce1ac

Last test of basis   187628  2024-09-10 01:13:27 Z    0 days
Testing same since   187638  2024-09-10 09:12:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Vishal Oliyil Kunnil <quic_vishalo@quicinc.com>
  Vishal Oliyil Kunnil <vishalo@qti.qualcomm.com>

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
   61f9695f20..b1ce2e1b67  b1ce2e1b67ff3b2478739976e952ac719010f019 -> xen-tested-master

