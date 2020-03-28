Return-Path: <SRS0=CqUQ=5N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BF2C43331
	for <xen-devel@archiver.kernel.org>; Sat, 28 Mar 2020 15:41:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F122073B
	for <xen-devel@archiver.kernel.org>; Sat, 28 Mar 2020 15:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="zXI1/Aqu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21F122073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIDZn-0003gG-Kd; Sat, 28 Mar 2020 15:40:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fYQ=5N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jIDZm-0003g7-7Z
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 15:40:46 +0000
X-Inumbo-ID: 7c2fe30e-710a-11ea-8bc5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c2fe30e-710a-11ea-8bc5-12813bfff9fa;
 Sat, 28 Mar 2020 15:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZH9k42iMkIVYSaZF5BF9fCp0/4RDMi/d7cQH6cUA6WQ=; b=zXI1/Aqu6JS3hg1+JmR9JWeIk
 z91kBJzSe1A4WUmJ/hW0prPTJcJ0tSiU2Y3kqKv6/cAKO6Ivgi72Pwe+pxGVza/pcWIgvULDEekhN
 yK+XE4q9dmalMUGGBLwSvN20A1uHIhOpMFiY/egvQgzu93QiNaPR+0nTOogPmT6d/29Lk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jIDZj-0004zD-B0; Sat, 28 Mar 2020 15:40:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jIDZj-0004gw-2Z; Sat, 28 Mar 2020 15:40:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jIDZj-0005aC-1o; Sat, 28 Mar 2020 15:40:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149116-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=6e9bd495b38e05ece5f53872df62d66052f29bb6
X-Osstest-Versions-That: ovmf=695d90b9b156573d0dafb20afecea09dc9a914f4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Mar 2020 15:40:43 +0000
Subject: [Xen-devel] [ovmf test] 149116: all pass - PUSHED
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149116 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149116/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6e9bd495b38e05ece5f53872df62d66052f29bb6
baseline version:
 ovmf                 695d90b9b156573d0dafb20afecea09dc9a914f4

Last test of basis   149071  2020-03-27 01:46:00 Z    1 days
Testing same since   149116  2020-03-27 19:31:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>
  GuoMinJ <newexplorerj@gmail.com>
  Jian J Wang <jian.j.wang@intel.com>

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
   695d90b9b1..6e9bd495b3  6e9bd495b38e05ece5f53872df62d66052f29bb6 -> xen-tested-master

