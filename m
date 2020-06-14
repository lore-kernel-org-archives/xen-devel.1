Return-Path: <SRS0=IUS7=73=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A85CC433DF
	for <xen-devel@archiver.kernel.org>; Sun, 14 Jun 2020 05:45:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8C3720776
	for <xen-devel@archiver.kernel.org>; Sun, 14 Jun 2020 05:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="Fc4pqjEu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8C3720776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkLRy-0003In-E4; Sun, 14 Jun 2020 05:44:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BL3k=73=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jkLRx-0003Ii-9p
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 05:44:57 +0000
X-Inumbo-ID: 2d289b22-ae02-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d289b22-ae02-11ea-b7bb-bc764e2007e4;
 Sun, 14 Jun 2020 05:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XiQ1xmFgIQYYDdUYhdz/JkQF6jXycfVVhkhqlhYyi0A=; b=Fc4pqjEu9FpouL37cicjNSKsT
 Ax9K4R2v3e7zPCuS9PmviHLdpT3I+X1aM4eeeDcf1Brz/KfiS+5jxN3zddI8/s6pZ1K22hpZCfmRK
 vKj2RTLh+xKdMsQfazg2KkMgN+v3wBYLFDlhkXhi/p3XQYg3rsvvUmyUyteGkw0Mu2th4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jkLRv-0002x1-8t; Sun, 14 Jun 2020 05:44:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jkLRu-0000Kq-LO; Sun, 14 Jun 2020 05:44:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jkLRu-0008PQ-Kk; Sun, 14 Jun 2020 05:44:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151069-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151069: all pass - PUSHED
X-Osstest-Versions-This: ovmf=9af1064995d479df92e399a682ba7e4b2fc78415
X-Osstest-Versions-That: ovmf=3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Jun 2020 05:44:54 +0000
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

flight 151069 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151069/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9af1064995d479df92e399a682ba7e4b2fc78415
baseline version:
 ovmf                 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985

Last test of basis   151054  2020-06-11 23:04:05 Z    2 days
Testing same since   151069  2020-06-13 06:49:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Chasel Chiu <chasel.chiu@intel.com>
  Gaurav Jain <gaurav.jain@nxp.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Sami Mujawar <Sami.Mujawar@arm.com>
  Shenglei Zhang <shenglei.zhang@intel.com>

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
   3ee4f6cb36..9af1064995  9af1064995d479df92e399a682ba7e4b2fc78415 -> xen-tested-master

