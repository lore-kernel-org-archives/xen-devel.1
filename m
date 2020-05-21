Return-Path: <SRS0=0mHu=7D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD48C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 07:11:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F2FB20748
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 07:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="TeFT452P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F2FB20748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbfM4-0007nQ-Dv; Thu, 21 May 2020 07:11:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcJi=7D=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jbfM3-0007nL-Rq
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 07:10:59 +0000
X-Inumbo-ID: 3497a9b2-9b32-11ea-aae0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3497a9b2-9b32-11ea-aae0-12813bfff9fa;
 Thu, 21 May 2020 07:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CzF+1w5+sqQ/DUCZkf1HP8t5uaStRKdFjn9MDcPtajo=; b=TeFT452P3BA1BfCptQyCWquzX
 pWfixuDKpURLENfuv+25WqZYh1OyOOnRTYcmz7J0BgXr6sZmq2nyth4wbWTKbJu6WRhZxBe4KmHD9
 kb77OfLFvzA4+hnxAyI9vkXAnU1fflIWWjSB1SfAREdD1Bh6Vbq3cpdG1dNpSC6UmFFSE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbfLv-0002dN-VN; Thu, 21 May 2020 07:10:51 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbfLv-0005uI-OR; Thu, 21 May 2020 07:10:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jbfLv-0007gx-Nt; Thu, 21 May 2020 07:10:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150284-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150284: all pass - PUSHED
X-Osstest-Versions-This: ovmf=bc5012b8fbf9f769a62d8a7a2dbf04343c16d398
X-Osstest-Versions-That: ovmf=7b6327ff03bb4436261ffad246ba3a14de10391f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 May 2020 07:10:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150284 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150284/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bc5012b8fbf9f769a62d8a7a2dbf04343c16d398
baseline version:
 ovmf                 7b6327ff03bb4436261ffad246ba3a14de10391f

Last test of basis   150232  2020-05-18 16:09:20 Z    2 days
Failing since        150278  2020-05-20 13:10:59 Z    0 days    2 attempts
Testing same since   150284  2020-05-20 20:09:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liming Gao <liming.gao@intel.com>
  Oleksiy Yakovlev <oleksiyy@ami.com>
  Shenglei Zhang <shenglei.zhang@intel.com>
  Wei6 Xu <wei6.xu@intel.com>
  Zhang, Shenglei <shenglei.zhang@intel.com>

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
   7b6327ff03..bc5012b8fb  bc5012b8fbf9f769a62d8a7a2dbf04343c16d398 -> xen-tested-master

