Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6007C433FE
	for <xen-devel@archiver.kernel.org>; Fri, 11 Nov 2022 03:45:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.442299.696379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otKyd-00054L-Qx; Fri, 11 Nov 2022 03:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442299.696379; Fri, 11 Nov 2022 03:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otKyd-00054E-Ny; Fri, 11 Nov 2022 03:45:11 +0000
Received: by outflank-mailman (input) for mailman id 442299;
 Fri, 11 Nov 2022 03:45:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1otKyb-000532-QB; Fri, 11 Nov 2022 03:45:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1otKyb-0001gg-OQ; Fri, 11 Nov 2022 03:45:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1otKyb-00043E-Dt; Fri, 11 Nov 2022 03:45:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1otKyb-0007oi-DS; Fri, 11 Nov 2022 03:45:09 +0000
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
	bh=1KtlFoO0P4sWU94I8nirUvhZYHb/0O6rq6hN8iVqUME=; b=fS5NBirPRYrQGZH1smDJvTOinj
	WR+uJ7tprWM2GmMY32MbBJ3cNgOZrGOLALCvsT2x2yZxYCs9EFB8omG/YE/w8Ckrq+WuKW1t/vDkx
	xgu9Y3BCqxVU5uYYG1vMPvZ1o7PNG+NX4z8zyQtO7TbzJoJzOCxMYIo7z4/bmkUuQzkA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174729-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174729: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=342813a3f7794bf67405a236053f27c916804d36
X-Osstest-Versions-That:
    ovmf=b0fd3097193d9c6825979e57e78e6278163bfd8e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Nov 2022 03:45:09 +0000

flight 174729 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174729/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 342813a3f7794bf67405a236053f27c916804d36
baseline version:
 ovmf                 b0fd3097193d9c6825979e57e78e6278163bfd8e

Last test of basis   174692  2022-11-09 15:13:33 Z    1 days
Testing same since   174729  2022-11-11 01:10:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   b0fd309719..342813a3f7  342813a3f7794bf67405a236053f27c916804d36 -> xen-tested-master

