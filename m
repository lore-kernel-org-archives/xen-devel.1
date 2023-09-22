Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C22ACD4847
	for <xen-devel@archiver.kernel.org>; Fri, 22 Sep 2023 18:25:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.606972.945111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjkqD-0000vQ-2A; Fri, 22 Sep 2023 18:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606972.945111; Fri, 22 Sep 2023 18:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjkqC-0000vJ-Tz; Fri, 22 Sep 2023 18:25:24 +0000
Received: by outflank-mailman (input) for mailman id 606972;
 Fri, 22 Sep 2023 18:25:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjkqB-0000v9-2N; Fri, 22 Sep 2023 18:25:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjkqA-0000xW-QY; Fri, 22 Sep 2023 18:25:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qjkqA-0007gC-Du; Fri, 22 Sep 2023 18:25:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qjkqA-0006Mn-DJ; Fri, 22 Sep 2023 18:25:22 +0000
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
	bh=ZrxrFLMC+AAXJTDLynZBUlv3MJ69cY1ywdBDA36Ak2s=; b=fvUBoo01gbqkjfV7bkgxbm+BpQ
	3bcPzCg0CZhTcRtzeJP/RH+rkyrWtGTFTgQePNxbJbO7x7wtJQfrI1PumRMnfHKNIEHoeDVmriswg
	cDAeoijlcZ42w8wdZxHfBx/6CYO7un80S2uUIWo5zIDXA+5IBlewEmIacMtNeY2fa6gw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183119-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183119: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8b2e6b90b85fd4b1f7f921da09b16f5175acea8a
X-Osstest-Versions-That:
    ovmf=b5003ab72564b51892f4c933eb39d7d6083f3824
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 22 Sep 2023 18:25:22 +0000

flight 183119 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183119/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8b2e6b90b85fd4b1f7f921da09b16f5175acea8a
baseline version:
 ovmf                 b5003ab72564b51892f4c933eb39d7d6083f3824

Last test of basis   183115  2023-09-22 10:43:46 Z    0 days
Testing same since   183119  2023-09-22 15:12:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>
  Vidya Sagar <vidyas@nvidia.com>

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
   b5003ab725..8b2e6b90b8  8b2e6b90b85fd4b1f7f921da09b16f5175acea8a -> xen-tested-master

