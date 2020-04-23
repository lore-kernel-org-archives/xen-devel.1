Return-Path: <SRS0=af7b=6H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C234C54FD0
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2020 14:31:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD8220728
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2020 14:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="fSX4xQcW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DD8220728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRctD-0007EA-1Q; Thu, 23 Apr 2020 14:31:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HETR=6H=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRctC-0007E5-DA
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 14:31:42 +0000
X-Inumbo-ID: 229f9cc0-856f-11ea-9389-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 229f9cc0-856f-11ea-9389-12813bfff9fa;
 Thu, 23 Apr 2020 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UWektqf9Jnbx7D/5B6Q0OmTPSQFHorx1vNIWWI+rITA=; b=fSX4xQcWMnjP/2zU9iFcWrit9
 kfZIEBU+X+XrvhqAYVw6UlZ3jAmWrUaYbB4I/6fqNdxnE4nQGcDF1lzqnAwqsSZtDcr2iWHS1SXmA
 FBHMlsLCCKH15n+gIqCzrXx1JgtKZCIPoUvgAae6l2aM3REEcxM2jZpnODdJU+z93PMGs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRct5-0005b2-HN; Thu, 23 Apr 2020 14:31:35 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRct5-0006fA-8m; Thu, 23 Apr 2020 14:31:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRct5-00051D-8A; Thu, 23 Apr 2020 14:31:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149747-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149747: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3a3a3af4a29ee36b1db11842d40b74f2de892a35
X-Osstest-Versions-That: ovmf=93f6df5f3b2553b8f5188d2a6ba70f3f5cfab0bb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Apr 2020 14:31:35 +0000
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

flight 149747 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149747/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3a3a3af4a29ee36b1db11842d40b74f2de892a35
baseline version:
 ovmf                 93f6df5f3b2553b8f5188d2a6ba70f3f5cfab0bb

Last test of basis   149742  2020-04-22 23:10:49 Z    0 days
Testing same since   149747  2020-04-23 07:21:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Fan, Zhiju <zhijux.fan@intel.com>
  Zhiju.Fan <zhijux.fan@intel.com>

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
   93f6df5f3b..3a3a3af4a2  3a3a3af4a29ee36b1db11842d40b74f2de892a35 -> xen-tested-master

