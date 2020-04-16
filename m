Return-Path: <SRS0=l70B=6A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BD3C2BA2B
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 05:34:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB3A8206E9
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 05:34:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="SoCLFDmB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB3A8206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOxAN-0000Rq-EG; Thu, 16 Apr 2020 05:34:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=amLm=6A=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jOxAL-0000Rj-Qr
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 05:34:21 +0000
X-Inumbo-ID: ec17cc84-7fa3-11ea-8b4d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec17cc84-7fa3-11ea-8b4d-12813bfff9fa;
 Thu, 16 Apr 2020 05:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YdR5OD6kf4pD4jE4kSneKDTKRzO/mpKH9hXKiXE9+AQ=; b=SoCLFDmBD5Uw66PEvX1csChD5
 mMlVh/hEkzrNGUSSbaJBCheEEb1BvcIRPtrp0dZyegeueTOLtHW8nz0g5lnagkw4ANHO4JjbEOKSR
 CNP/8e6QwSYq4ddgxg/y5spJYpMeo0fQLQFIQZoOyo6DEvTvri9jBwApANXe8CjgXoSus=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jOxAK-0003g3-C5; Thu, 16 Apr 2020 05:34:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jOxAK-000818-2M; Thu, 16 Apr 2020 05:34:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jOxAK-0005QZ-1a; Thu, 16 Apr 2020 05:34:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149665-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149665: all pass - PUSHED
X-Osstest-Versions-This: ovmf=8c654bb3ec0b5232dec2b2b07234c5479eb14d62
X-Osstest-Versions-That: ovmf=bd6aa93296de36c5afabd34e4fa4083bccb8488d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Apr 2020 05:34:20 +0000
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

flight 149665 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149665/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c654bb3ec0b5232dec2b2b07234c5479eb14d62
baseline version:
 ovmf                 bd6aa93296de36c5afabd34e4fa4083bccb8488d

Last test of basis   149638  2020-04-13 10:09:17 Z    2 days
Testing same since   149665  2020-04-15 01:40:25 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christopher J Zurcher <christopher.j.zurcher@intel.com>
  Zurcher, Christopher J <christopher.j.zurcher@intel.com>

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
   bd6aa93296..8c654bb3ec  8c654bb3ec0b5232dec2b2b07234c5479eb14d62 -> xen-tested-master

