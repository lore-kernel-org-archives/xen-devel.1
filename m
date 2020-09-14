Return-Path: <SRS0=xX5W=CX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518D2C433E2
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 07:12:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACE0217BA
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 07:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="CZQD8Hd4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CACE0217BA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHiel-0008RX-G2; Mon, 14 Sep 2020 07:12:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qj2e=CX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kHiek-0008RD-E3
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 07:12:06 +0000
X-Inumbo-ID: 45da8af8-5d50-4f16-873f-af7882d8c651
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45da8af8-5d50-4f16-873f-af7882d8c651;
 Mon, 14 Sep 2020 07:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=IsF2ZieNeosaQMRJnw9Uw4/MhMPMkJ+mgxocK7Eqr80=; b=CZQD8Hd4Mkrg3mAiWGz2YVsvsV
 tyAXsVk+lBrARJxdd+yz7RUODv1Dk/B/7p1ZL/Fj6cl9r7hFoh36Fn5i5R/f7qpa37oMosZ2erMEZ
 1DW7aFO7rVSidR1wPpkv1sR9js9rdOrs3Md5FjLQo/pepnuxWdFHY3TqnH/4ybV0QcWA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHieJ-0005TO-S8; Mon, 14 Sep 2020 07:11:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHieJ-0003je-KP; Mon, 14 Sep 2020 07:11:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kHieJ-0002RA-K0; Mon, 14 Sep 2020 07:11:39 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154312-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154312: all pass - PUSHED
X-Osstest-Versions-This: ovmf=067503a8c675ddd38b099a0c604bc1a565e83838
X-Osstest-Versions-That: ovmf=317d84abe3bfbdff10ae1cc4f38b49307838c6c4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Sep 2020 07:11:39 +0000
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

flight 154312 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154312/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 067503a8c675ddd38b099a0c604bc1a565e83838
baseline version:
 ovmf                 317d84abe3bfbdff10ae1cc4f38b49307838c6c4

Last test of basis   154021  2020-09-09 12:09:40 Z    4 days
Testing same since   154312  2020-09-14 04:09:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>

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
   317d84abe3..067503a8c6  067503a8c675ddd38b099a0c604bc1a565e83838 -> xen-tested-master

