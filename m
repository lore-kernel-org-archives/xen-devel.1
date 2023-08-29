Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64607C71153
	for <xen-devel@archiver.kernel.org>; Tue, 29 Aug 2023 14:44:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.592355.925057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazwv-0003km-70; Tue, 29 Aug 2023 14:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592355.925057; Tue, 29 Aug 2023 14:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazwv-0003kf-3o; Tue, 29 Aug 2023 14:44:09 +0000
Received: by outflank-mailman (input) for mailman id 592355;
 Tue, 29 Aug 2023 14:44:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qazwu-0003kU-42; Tue, 29 Aug 2023 14:44:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qazwt-0004t2-Rc; Tue, 29 Aug 2023 14:44:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qazwt-00043n-BI; Tue, 29 Aug 2023 14:44:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qazwt-0000Ka-Ar; Tue, 29 Aug 2023 14:44:07 +0000
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
	bh=cvVNLi8jVm2flYW3ys20pvoGMavf3c9qenyQ/iXf8uM=; b=Fq/M+8Qcy/7OtrRCtyyGfoQeIy
	gdSEqZ8yqJcgGxxkGqevXcNTsWSdzSBliq1EF+gSURFev7bWzzjJ7JdaQkt1wVUusEIGMi2Qcsxif
	xsNw8teWOOwOaJz0J65r3eNMk7UtiWPlfxcOpfT2h6bBfLqabEfPzFoNpHLMO/vXuNkg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182554-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182554: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=14bf2cb411cae5306fd9efa8222264e8cf9ecc19
X-Osstest-Versions-That:
    ovmf=020cc9e2e7053bb62247b0babbbe80cb855592e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Aug 2023 14:44:07 +0000

flight 182554 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182554/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 14bf2cb411cae5306fd9efa8222264e8cf9ecc19
baseline version:
 ovmf                 020cc9e2e7053bb62247b0babbbe80cb855592e5

Last test of basis   182551  2023-08-29 07:13:48 Z    0 days
Testing same since   182554  2023-08-29 12:43:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   020cc9e2e7..14bf2cb411  14bf2cb411cae5306fd9efa8222264e8cf9ecc19 -> xen-tested-master

