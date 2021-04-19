Return-Path: <SRS0=K98N=JQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2559C433ED
	for <xen-devel@archiver.kernel.org>; Mon, 19 Apr 2021 21:29:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BDA86113C
	for <xen-devel@archiver.kernel.org>; Mon, 19 Apr 2021 21:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BDA86113C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.113211.215720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYbSV-0006g5-Oi; Mon, 19 Apr 2021 21:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113211.215720; Mon, 19 Apr 2021 21:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYbSV-0006fy-La; Mon, 19 Apr 2021 21:29:31 +0000
Received: by outflank-mailman (input) for mailman id 113211;
 Mon, 19 Apr 2021 21:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYbSV-0006fq-1Y; Mon, 19 Apr 2021 21:29:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYbSU-0002Pj-Pu; Mon, 19 Apr 2021 21:29:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYbSU-0000dr-Hv; Mon, 19 Apr 2021 21:29:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lYbSU-0008Ay-HO; Mon, 19 Apr 2021 21:29:30 +0000
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
	bh=3CQadhMXX+zrzfUplCoASAkPOW2QYcBB9lb0gGz5WpM=; b=Qbc5xM8rT4vGjRY0+M/POiAjkV
	4xkkRoR/Ql5MigFTs6Kco4nnXalCXE/6WnT6/JUYhw2AXim3zRViC3dW/79zAd2jne8GjQp/1gJ7C
	4wZ6agRvE7mjqZFDMANBLn1pf2/C0P6ElkNiAkkQ4+2vzA2Wn/04oL2kypH2qeLbbc98=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161291-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161291: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8c75a0720800e934c29aae75e3fb1cb42c0d0728
X-Osstest-Versions-That:
    ovmf=99e7e48cc7117c37fc1c08a741872d0875595796
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Apr 2021 21:29:30 +0000

flight 161291 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161291/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c75a0720800e934c29aae75e3fb1cb42c0d0728
baseline version:
 ovmf                 99e7e48cc7117c37fc1c08a741872d0875595796

Last test of basis   161204  2021-04-16 12:04:01 Z    3 days
Testing same since   161291  2021-04-19 13:43:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Gouly <joey.gouly@arm.com>

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
   99e7e48cc7..8c75a07208  8c75a0720800e934c29aae75e3fb1cb42c0d0728 -> xen-tested-master

