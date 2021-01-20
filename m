Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4600DC433E6
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 20:06:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2A8323440
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 20:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2A8323440
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71740.128721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jjv-0003La-6b; Wed, 20 Jan 2021 20:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71740.128721; Wed, 20 Jan 2021 20:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jjv-0003LT-3T; Wed, 20 Jan 2021 20:06:03 +0000
Received: by outflank-mailman (input) for mailman id 71740;
 Wed, 20 Jan 2021 20:06:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Jjt-0003LL-QK; Wed, 20 Jan 2021 20:06:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Jjt-0000Gp-Gu; Wed, 20 Jan 2021 20:06:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Jjt-0000kf-6G; Wed, 20 Jan 2021 20:06:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Jjt-0007mA-5k; Wed, 20 Jan 2021 20:06:01 +0000
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
	bh=N9se7pqveW5vEKFSYCaINyEwDOGUVHhCG8h+C9vJIFI=; b=4iC9lKbv5X2ZheyHGft36F6U7V
	NRo6H6QelYU67eABKv/5LdMzJlc1YyUdqykFnV6TlviEHF9e4cyiMv5GWxbvwGExEgvFYBl1KtA3P
	erNJnhTs5BEccpnQdQwUj+TH7O6zFdEpOfJvB2P7/i1jeBYgI+dlw8Ej+icps/0qnZ88=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158541-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158541: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ca272b9513a6de5772e6e8ef5bbecd2e23cf9fb3
X-Osstest-Versions-That:
    ovmf=6e5586863148773c15399ead249711143a74d2d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Jan 2021 20:06:01 +0000

flight 158541 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158541/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ca272b9513a6de5772e6e8ef5bbecd2e23cf9fb3
baseline version:
 ovmf                 6e5586863148773c15399ead249711143a74d2d0

Last test of basis   158531  2021-01-19 22:15:41 Z    0 days
Testing same since   158541  2021-01-20 12:39:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  GregX Yeh <gregx.yeh@intel.com>

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
   6e55868631..ca272b9513  ca272b9513a6de5772e6e8ef5bbecd2e23cf9fb3 -> xen-tested-master

