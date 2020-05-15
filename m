Return-Path: <SRS0=3DVc=65=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52870C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2020 13:15:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C55720709
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2020 13:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="N0y9UstK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C55720709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZaAt-0004xK-9I; Fri, 15 May 2020 13:14:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibeu=65=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jZaAs-0004wo-Am
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 13:14:50 +0000
X-Inumbo-ID: 0e3f1e36-96ae-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e3f1e36-96ae-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rRHSKnL+k2eZme66hGtBi04CkooLu0W1aqs7yQAtIo4=; b=N0y9UstK5Rlw6AjyArmzK93J2
 Sp8y/GtOjJ5A7v4LCTQu/jQYTJNC14mWHJxjwKWOiiR0lp8dtcfyLJg/jHbODLgpiv5sT9aOudSN1
 y2Wsxiv0CC5j41SUQwN7Se/ToFlHiLgoLs+2FQqM4Q8vHL5w/Avy/XCEgAr9QBJzStEOo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZaAr-00080y-9L; Fri, 15 May 2020 13:14:49 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZaAr-0002L1-0a; Fri, 15 May 2020 13:14:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jZaAq-0000sw-Ut; Fri, 15 May 2020 13:14:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150187-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150187: all pass - PUSHED
X-Osstest-Versions-This: ovmf=bcf181a33b2ea46c36c3be701a5b2e232deaece7
X-Osstest-Versions-That: ovmf=f2cdb268ef04eeec51948b5d81eeca5cab5ed9af
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 May 2020 13:14:48 +0000
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

flight 150187 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150187/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bcf181a33b2ea46c36c3be701a5b2e232deaece7
baseline version:
 ovmf                 f2cdb268ef04eeec51948b5d81eeca5cab5ed9af

Last test of basis   150178  2020-05-14 12:39:29 Z    1 days
Testing same since   150187  2020-05-15 01:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Roman Bolshakov <r.bolshakov@yadro.com>
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
   f2cdb268ef..bcf181a33b  bcf181a33b2ea46c36c3be701a5b2e232deaece7 -> xen-tested-master

