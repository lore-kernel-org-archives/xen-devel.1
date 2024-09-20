Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03592CF58F4
	for <xen-devel@archiver.kernel.org>; Fri, 20 Sep 2024 09:01:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.801068.1211089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srZWE-0004eX-38; Fri, 20 Sep 2024 09:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801068.1211089; Fri, 20 Sep 2024 09:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srZWE-0004eQ-0X; Fri, 20 Sep 2024 09:01:38 +0000
Received: by outflank-mailman (input) for mailman id 801068;
 Fri, 20 Sep 2024 09:01:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srZWC-0004eG-R5; Fri, 20 Sep 2024 09:01:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srZWC-0004FL-Q0; Fri, 20 Sep 2024 09:01:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srZWC-00016p-Ig; Fri, 20 Sep 2024 09:01:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1srZWC-0003qf-IG; Fri, 20 Sep 2024 09:01:36 +0000
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
	bh=L9O9pHOt4Odrw7uDiAfOFws8DfmW2M3yXsI5g1XTAIg=; b=LGyB6czOZv4x2cJ6H2tPfaybgO
	sB11Df6wub3otp0EmbDDCoYH6sRSdOKWDyu3R6aJ/8CK4rmNaE8UMv25eLg4ExY5bu9E/SwLtYcoE
	X4CAn2gd0bwu2bWX5hBYlLUnLPi+nlmf16wPkA5XR1TKSAsBfryq43/70m3JMixre0gE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187775-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187775: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c3580093520809cbfe2abd0e702d53707b7782a9
X-Osstest-Versions-That:
    ovmf=3a3b12cbdae2e89b0e365eb01c378891d0d9037c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Sep 2024 09:01:36 +0000

flight 187775 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187775/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c3580093520809cbfe2abd0e702d53707b7782a9
baseline version:
 ovmf                 3a3b12cbdae2e89b0e365eb01c378891d0d9037c

Last test of basis   187772  2024-09-20 02:43:17 Z    0 days
Testing same since   187775  2024-09-20 06:43:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Matt DeVillier <matt.devillier@gmail.com>

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
   3a3b12cbda..c358009352  c3580093520809cbfe2abd0e702d53707b7782a9 -> xen-tested-master

