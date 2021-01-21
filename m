Return-Path: <SRS0=QJUc=GY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A15C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 04:50:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF0123715
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 04:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CF0123715
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71879.129074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Rv1-00055h-0t; Thu, 21 Jan 2021 04:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71879.129074; Thu, 21 Jan 2021 04:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Rv0-00054y-Tw; Thu, 21 Jan 2021 04:50:02 +0000
Received: by outflank-mailman (input) for mailman id 71879;
 Thu, 21 Jan 2021 04:50:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Ruz-0004uY-M1; Thu, 21 Jan 2021 04:50:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Ruz-0007jX-Dv; Thu, 21 Jan 2021 04:50:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Ruz-0002ZK-2Q; Thu, 21 Jan 2021 04:50:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Ruz-0001io-1x; Thu, 21 Jan 2021 04:50:01 +0000
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
	bh=1mi+y64OlXy++Acji0YyOutU5N3IuXSx9wwbCrKMCKw=; b=RPdRcDI3jOT4lfaWI5/k2BYNaK
	1LZt8+AbXcHk6WpzNEAiMeXEiXYyW+F8yOMDtF2kYfSp8vEke53eQ+wXVOa0cwqD2buIrHlN/ejSL
	VQqlILndJqY82USTXDi3LBBVZw8qiVZ8B3iNce4clALVSRAfGNUlvulwcaK42SOpv3WU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158546-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158546: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=339371ef78eb3a6f2e9848f8b058379de5e87d39
X-Osstest-Versions-That:
    ovmf=ca272b9513a6de5772e6e8ef5bbecd2e23cf9fb3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 Jan 2021 04:50:01 +0000

flight 158546 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158546/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 339371ef78eb3a6f2e9848f8b058379de5e87d39
baseline version:
 ovmf                 ca272b9513a6de5772e6e8ef5bbecd2e23cf9fb3

Last test of basis   158541  2021-01-20 12:39:43 Z    0 days
Testing same since   158546  2021-01-20 20:10:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Jiahui Cen <cenjiahui@huawei.com>
  Jiahui Cen via groups.io <cenjiahui=huawei.com@groups.io>
  Laszlo Ersek <lersek@redhat.com>
  Ray Ni <ray.ni@intel.com>
  Yubo Miao <miaoyubo@huawei.com>

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
   ca272b9513..339371ef78  339371ef78eb3a6f2e9848f8b058379de5e87d39 -> xen-tested-master

