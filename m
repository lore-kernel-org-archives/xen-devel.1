Return-Path: <SRS0=QUjn=AW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC257C433E0
	for <xen-devel@archiver.kernel.org>; Sat, 11 Jul 2020 06:33:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 768BB206F4
	for <xen-devel@archiver.kernel.org>; Sat, 11 Jul 2020 06:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="iGf8ENs6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 768BB206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ju94h-0005v1-31; Sat, 11 Jul 2020 06:33:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oRR=AW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ju94g-0005ud-1x
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2020 06:33:26 +0000
X-Inumbo-ID: 6976abfc-c340-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6976abfc-c340-11ea-bb8b-bc764e2007e4;
 Sat, 11 Jul 2020 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w6q3aj7JzV+GzJiWAc8oks4Zx/08dL3M+K+c/4T1yaY=; b=iGf8ENs6gGc7Fz4WQl7NUZCXK
 pF4VV3NEts5vQqN3vkC8PSC4yRz63EjKP3PL4EZGpHlmDMwRu3RgcxcIvdQiK95awR4GwozEuEIHK
 H+YQxbKFjHAg2AoNoIzPTS6t41vvP7uqkkIO6ukpv7wLfZPO6ot42YAKHoAi0gsfzGsuI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ju94Z-0001Lu-AX; Sat, 11 Jul 2020 06:33:19 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ju94Y-000081-Qy; Sat, 11 Jul 2020 06:33:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ju94Y-0002sF-QI; Sat, 11 Jul 2020 06:33:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151812-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151812: all pass - PUSHED
X-Osstest-Versions-This: ovmf=f7f1b33282b7dc52a0c77860d3f4523b231a750f
X-Osstest-Versions-That: ovmf=bdafda8c457eb90c65f37026589b54258300f05c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Jul 2020 06:33:18 +0000
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

flight 151812 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151812/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f7f1b33282b7dc52a0c77860d3f4523b231a750f
baseline version:
 ovmf                 bdafda8c457eb90c65f37026589b54258300f05c

Last test of basis   151725  2020-07-07 23:40:20 Z    3 days
Testing same since   151812  2020-07-10 22:11:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>

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
   bdafda8c45..f7f1b33282  f7f1b33282b7dc52a0c77860d3f4523b231a750f -> xen-tested-master

