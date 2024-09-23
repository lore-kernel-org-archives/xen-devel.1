Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC89DCF9C6F
	for <xen-devel@archiver.kernel.org>; Mon, 23 Sep 2024 18:37:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.802292.1212510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssnvQ-0002wS-S5; Mon, 23 Sep 2024 18:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802292.1212510; Mon, 23 Sep 2024 18:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssnvQ-0002wL-O0; Mon, 23 Sep 2024 18:36:44 +0000
Received: by outflank-mailman (input) for mailman id 802292;
 Mon, 23 Sep 2024 18:36:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssnvQ-0002wB-6K; Mon, 23 Sep 2024 18:36:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssnvQ-0004dr-4h; Mon, 23 Sep 2024 18:36:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssnvP-0004Ri-Pv; Mon, 23 Sep 2024 18:36:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ssnvP-0006fK-PN; Mon, 23 Sep 2024 18:36:43 +0000
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
	bh=+YUnhkI77M41DaCkDv6s4geOHXK7U0W3Snt5oSRWac0=; b=XeGRcL4xoe7n+UZ8nf01DLjVbD
	rL5Ey2DmPMNO23Q25sbM6mPFMUlqP7vljABamm5oVVIoGon8AEBEZe6SuCerPCQSuPFNsKMdDQffA
	7j4B9nsHHSM0BrKM0Fme8ks/pGCqaATdk2zFM+vJtoPMtvcJvfJ/BufSZ3bNjh73plo4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187829-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187829: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4c3bffaeb3cff662686e33c506802132147c4fbf
X-Osstest-Versions-That:
    ovmf=1a89c690a1df8a22bd2157be72d438b741c96854
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Sep 2024 18:36:43 +0000

flight 187829 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187829/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4c3bffaeb3cff662686e33c506802132147c4fbf
baseline version:
 ovmf                 1a89c690a1df8a22bd2157be72d438b741c96854

Last test of basis   187824  2024-09-23 06:43:33 Z    0 days
Testing same since   187829  2024-09-23 16:13:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   1a89c690a1..4c3bffaeb3  4c3bffaeb3cff662686e33c506802132147c4fbf -> xen-tested-master

