Return-Path: <SRS0=6cHO=NR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A49C432BE
	for <xen-devel@archiver.kernel.org>; Thu, 26 Aug 2021 00:25:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0BA61053
	for <xen-devel@archiver.kernel.org>; Thu, 26 Aug 2021 00:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B0BA61053
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.172634.315014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ3CT-0000uc-Hw; Thu, 26 Aug 2021 00:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172634.315014; Thu, 26 Aug 2021 00:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ3CT-0000uV-DB; Thu, 26 Aug 2021 00:24:57 +0000
Received: by outflank-mailman (input) for mailman id 172634;
 Thu, 26 Aug 2021 00:24:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mJ3CS-0000uL-Bi; Thu, 26 Aug 2021 00:24:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mJ3CS-0001jO-5V; Thu, 26 Aug 2021 00:24:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mJ3CR-00035Y-Rl; Thu, 26 Aug 2021 00:24:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mJ3CR-0003CL-RJ; Thu, 26 Aug 2021 00:24:55 +0000
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
	bh=Mbt72KlWP/aXh7Auol/DtMk/DxyisD8Fpk8o5TlC0ZA=; b=ddzr3xYqM3J349YlOI9Cxa9BeF
	l+c9nge1Pc6Fxe2ToXesIjLi6HnXevy/gI1bD8porNkEHrgZnjWLB58v1cBxx170EkGc5tz0ukeHQ
	UfPMDfj7CtOtglH9/Oy+kD601lXzduOx/L3o5TfTn/K3rAd/VdXWCeJadXAdEia9Bcrs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164461-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164461: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
X-Osstest-Versions-That:
    ovmf=8dd4fc5be6189666b37e5b00131a4173c6a2b085
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Aug 2021 00:24:55 +0000

flight 164461 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164461/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
baseline version:
 ovmf                 8dd4fc5be6189666b37e5b00131a4173c6a2b085

Last test of basis   164406  2021-08-23 08:10:21 Z    2 days
Testing same since   164461  2021-08-24 22:15:18 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chris Stewart <chris.stewart@hp.com>
  Stewart, Chris (SW Architect) via groups.io <chris.stewart=hp.com@groups.io>

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
   8dd4fc5be6..7b4a99be8a  7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 -> xen-tested-master

