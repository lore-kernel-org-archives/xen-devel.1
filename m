Return-Path: <SRS0=pLaW=GJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1584EC433E0
	for <xen-devel@archiver.kernel.org>; Wed,  6 Jan 2021 03:31:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF8CA22D01
	for <xen-devel@archiver.kernel.org>; Wed,  6 Jan 2021 03:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF8CA22D01
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.62289.110227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwzXN-0004dL-Iv; Wed, 06 Jan 2021 03:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62289.110227; Wed, 06 Jan 2021 03:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwzXN-0004dC-Cj; Wed, 06 Jan 2021 03:31:05 +0000
Received: by outflank-mailman (input) for mailman id 62289;
 Wed, 06 Jan 2021 03:31:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwzXM-0004d4-CP; Wed, 06 Jan 2021 03:31:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwzXM-0006n4-1K; Wed, 06 Jan 2021 03:31:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwzXL-0004RW-O4; Wed, 06 Jan 2021 03:31:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kwzXL-000840-Nc; Wed, 06 Jan 2021 03:31:03 +0000
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
	bh=1A12Q0MCQ4n0z+jXq3IAot0Xez6VGfuvmFepy8gI4Y4=; b=YE+nBHwscGZC6jUOAJRPKOCWyN
	g8c+VOWAED76IENAVE60Kn51qJcwRKDSnKbfijRab9bFgBHVwA0KXkI4ZcAV6Jsl1+A/cWUrH/UTV
	ewirwxYU7pnczQ9fjgBuN9vIv28wmfrhaSnwuf2SQa5S1LA+opKpWBNI7m5A1TcODUis=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158181-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158181: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=20b292d0cdf7dce58d824fdf9ab1613c2a1ad2ec
X-Osstest-Versions-That:
    ovmf=4ad1bd63b28ca103eba21e383c4375a3a91080cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Jan 2021 03:31:03 +0000

flight 158181 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158181/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 20b292d0cdf7dce58d824fdf9ab1613c2a1ad2ec
baseline version:
 ovmf                 4ad1bd63b28ca103eba21e383c4375a3a91080cf

Last test of basis   158165  2021-01-05 14:39:42 Z    0 days
Testing same since   158181  2021-01-06 01:40:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>

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
   4ad1bd63b2..20b292d0cd  20b292d0cdf7dce58d824fdf9ab1613c2a1ad2ec -> xen-tested-master

