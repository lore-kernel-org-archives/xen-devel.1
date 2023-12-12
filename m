Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72C7C4332F
	for <xen-devel@archiver.kernel.org>; Tue, 12 Dec 2023 04:25:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.652624.1018594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCuKF-0003dz-8G; Tue, 12 Dec 2023 04:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652624.1018594; Tue, 12 Dec 2023 04:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCuKF-0003ds-4D; Tue, 12 Dec 2023 04:24:55 +0000
Received: by outflank-mailman (input) for mailman id 652624;
 Tue, 12 Dec 2023 04:24:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCuKD-0003di-D2; Tue, 12 Dec 2023 04:24:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCuKD-0004ll-9N; Tue, 12 Dec 2023 04:24:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCuKC-0007zr-PZ; Tue, 12 Dec 2023 04:24:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rCuKC-0005qU-OY; Tue, 12 Dec 2023 04:24:52 +0000
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
	bh=CkD411KDf7Vf2X+Do2llXV6BBC8TX/lbkKeWPHWorxQ=; b=JpFchinof97KtLhJz1xPAcfoMc
	YvHnw2Cv5aODgzssRP7cAbt79PAWRGXXyA2Y865N3Tk6MjYM0r+5BhzViLAiEt3IfIh4AKhkB7tDI
	6LfVbmkWSjTWlMy8p7pehqH6jINtW5Ltl5Aw66wvuJGwXt0odPNITbgR6+BvvspOI5kA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184097-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184097: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=725acd0b9cc047b20a1b9379e46f05d3ebcf485e
X-Osstest-Versions-That:
    ovmf=1d50544aa2321e4efcd9c193d534fb4096d64dbf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Dec 2023 04:24:52 +0000

flight 184097 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184097/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 725acd0b9cc047b20a1b9379e46f05d3ebcf485e
baseline version:
 ovmf                 1d50544aa2321e4efcd9c193d534fb4096d64dbf

Last test of basis   184095  2023-12-11 21:42:52 Z    0 days
Testing same since   184097  2023-12-12 01:43:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>

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
   1d50544aa2..725acd0b9c  725acd0b9cc047b20a1b9379e46f05d3ebcf485e -> xen-tested-master

