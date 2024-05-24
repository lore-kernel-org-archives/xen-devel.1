Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D2EC25B74
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2024 18:15:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.729689.1134892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAZRb-0007YQ-6Y; Fri, 24 May 2024 18:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729689.1134892; Fri, 24 May 2024 18:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAZRb-0007YJ-3j; Fri, 24 May 2024 18:15:07 +0000
Received: by outflank-mailman (input) for mailman id 729689;
 Fri, 24 May 2024 18:15:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAZRa-0007Y8-45; Fri, 24 May 2024 18:15:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAZRa-0003Mg-00; Fri, 24 May 2024 18:15:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAZRZ-0005up-N5; Fri, 24 May 2024 18:15:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sAZRZ-0000Cf-Ma; Fri, 24 May 2024 18:15:05 +0000
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
	bh=P8yXWmKNXSfPcnct+KvFK0UUHOvH6P0v1QsrCNvKbr8=; b=Vg+P7T6bNNfeqlWG4XWtqusIxj
	X/Zzf8zpEhCLa5/1JTDQRc6qDApj8y93gYJisi6klaJOMwkC2I00QvF1w2h6+FgXO1gTsodHzq4Ib
	9zpHzEyG1FtGqXuR117q9V2nGZkZNYeytL1lumMHHJQ8fxHPOBOib2/MMCkEyyh/domk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186137-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186137: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3e722403cd16388a0e4044e705a2b34c841d76ca
X-Osstest-Versions-That:
    ovmf=7142e648416ff5d3eac6c6d607874805f5de0ca8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 May 2024 18:15:05 +0000

flight 186137 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186137/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3e722403cd16388a0e4044e705a2b34c841d76ca
baseline version:
 ovmf                 7142e648416ff5d3eac6c6d607874805f5de0ca8

Last test of basis   186054  2024-05-21 02:43:06 Z    3 days
Testing same since   186137  2024-05-24 16:12:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Doug Flick <dougflick@microsoft.com>
  Doug Flick [MSFT] <doug.edk2@gmail.com>
  Flickdm <douglas.flick@microsoft.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewe Yao <Jiewen.yao@intel.com>

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
   7142e64841..3e722403cd  3e722403cd16388a0e4044e705a2b34c841d76ca -> xen-tested-master

