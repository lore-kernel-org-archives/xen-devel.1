Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E19EB64DA
	for <xen-devel@archiver.kernel.org>; Thu, 20 Jul 2023 22:19:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.566761.886036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbzl-0000vg-Um; Thu, 20 Jul 2023 22:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566761.886036; Thu, 20 Jul 2023 22:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbzl-0000vZ-RG; Thu, 20 Jul 2023 22:19:37 +0000
Received: by outflank-mailman (input) for mailman id 566761;
 Thu, 20 Jul 2023 22:19:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMbzl-0000vP-FT; Thu, 20 Jul 2023 22:19:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMbzl-0001Z0-6e; Thu, 20 Jul 2023 22:19:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMbzk-0005WF-Qx; Thu, 20 Jul 2023 22:19:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qMbzk-0003Tq-QR; Thu, 20 Jul 2023 22:19:36 +0000
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
	bh=q8HfO8iqhr1Diqn2QHZtXDSeATZrkaZ19N2MFuX38WI=; b=DnxV36+yAu0ullRBWZFdp7+eBM
	eQIg6uWsnht0Fefs6Y9rZyyIMtIeWYvAsm4Kx4l6DYKN4JojgXtxZuhxUER2AbqrJ8lkg2czjntuX
	kroM5SJTBBq15Mt9mt4gkZES3QrtutJX9g2V2tIoZfAi3LlPip4X4NSp3sjHiz54fLsw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181937-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181937: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c6b512962e92ae54a895bdfd2147abaf2c9e3e22
X-Osstest-Versions-That:
    ovmf=b2de9ec5a759aa4a7ac029cda9079dce077bf856
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Jul 2023 22:19:36 +0000

flight 181937 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181937/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c6b512962e92ae54a895bdfd2147abaf2c9e3e22
baseline version:
 ovmf                 b2de9ec5a759aa4a7ac029cda9079dce077bf856

Last test of basis   181922  2023-07-20 08:11:06 Z    0 days
Testing same since   181937  2023-07-20 20:42:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin12@gmail.com>

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
   b2de9ec5a7..c6b512962e  c6b512962e92ae54a895bdfd2147abaf2c9e3e22 -> xen-tested-master

