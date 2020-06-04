Return-Path: <SRS0=3Mnr=7R=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BF2C433DF
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2020 10:55:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37AAC207D3
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2020 10:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="fs8MqAxN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37AAC207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgnWJ-0002ZD-Mu; Thu, 04 Jun 2020 10:54:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DmD4=7R=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jgnWI-0002Z8-Nc
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 10:54:46 +0000
X-Inumbo-ID: cc9a3480-a651-11ea-ae63-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc9a3480-a651-11ea-ae63-12813bfff9fa;
 Thu, 04 Jun 2020 10:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xvc3tk3MgveuCCv+xgkUU20Otl5YBfB8LGN8wrnHOX4=; b=fs8MqAxNW0wwFTtBzgefiezDS
 LvXMlbSsiC2A2yWAsxYVC7enjm868HyF1w2oP4LDpxqQV7aNDT1pK9FIw92vDcL0Q1VzrwsvvcIMM
 PTMvIKeTPEziv2/jnYJRZfOk2oOMPubvi7mHGl7gm3DeQ9PotSGED6ONZF2PRHGXQWOOU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgnWG-0002C9-6d; Thu, 04 Jun 2020 10:54:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgnWF-0003lR-UT; Thu, 04 Jun 2020 10:54:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jgnWF-0001Uc-Tv; Thu, 04 Jun 2020 10:54:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150687-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150687: all pass - PUSHED
X-Osstest-Versions-This: ovmf=bb78cfbec07eda45118b630a09b0af549b43a135
X-Osstest-Versions-That: ovmf=68d720fd92bbdbbfae5adee02d6d9fd24ca38f30
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Jun 2020 10:54:43 +0000
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

flight 150687 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150687/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bb78cfbec07eda45118b630a09b0af549b43a135
baseline version:
 ovmf                 68d720fd92bbdbbfae5adee02d6d9fd24ca38f30

Last test of basis   150668  2020-06-03 21:39:18 Z    0 days
Testing same since   150687  2020-06-04 09:14:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Derek Lin <derek.lin2@hpe.com>
  Nickle Wang <nickle.wang@hpe.com>
  Ray Ni <ray.ni@intel.com>

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
   68d720fd92..bb78cfbec0  bb78cfbec07eda45118b630a09b0af549b43a135 -> xen-tested-master

