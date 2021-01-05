Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436DDC433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 03:54:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E425E22597
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 03:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E425E22597
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61709.108663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwdPb-0003Zb-Kt; Tue, 05 Jan 2021 03:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61709.108663; Tue, 05 Jan 2021 03:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwdPb-0003ZU-HH; Tue, 05 Jan 2021 03:53:35 +0000
Received: by outflank-mailman (input) for mailman id 61709;
 Tue, 05 Jan 2021 03:53:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwdPa-0003ZK-Ab; Tue, 05 Jan 2021 03:53:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwdPa-0007QT-3z; Tue, 05 Jan 2021 03:53:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwdPZ-0001YB-Rz; Tue, 05 Jan 2021 03:53:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kwdPZ-0004no-RU; Tue, 05 Jan 2021 03:53:33 +0000
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
	bh=96WgwCuBymoSfYulUwABoZjvoeNAGNcXq98Fgi5n8dA=; b=x1TmHDd4mBp3IqyR+8ZuZSvAxr
	f89Q+FOh6+lz5FUgyoi3XG+hvnYBsqOZzNgaYXxAGynIVm6EMoSsrFForMxLY9auv2KC7qRSZiJ5V
	dVXCaP/N8vncFkE9HlHR6TW6uP/a99NnQAfiTfiJleaGPSsquhFrc5+im5oT5fcIS4Ig=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158141-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158141: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4e511554872c318f8bce196f1cddf69432886bfa
X-Osstest-Versions-That:
    ovmf=e5908945368163bb15c8c1a49745f4c1138f1ab4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 05 Jan 2021 03:53:33 +0000

flight 158141 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158141/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4e511554872c318f8bce196f1cddf69432886bfa
baseline version:
 ovmf                 e5908945368163bb15c8c1a49745f4c1138f1ab4

Last test of basis   158137  2021-01-04 18:10:46 Z    0 days
Testing same since   158141  2021-01-05 01:54:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Masahisa Kojima <masahisa.kojima@linaro.org>

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
   e590894536..4e51155487  4e511554872c318f8bce196f1cddf69432886bfa -> xen-tested-master

