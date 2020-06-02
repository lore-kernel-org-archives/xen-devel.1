Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54ADC433E1
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 11:55:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7921D2074B
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 11:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="mfwEYwMH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7921D2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg5VP-00043g-Ix; Tue, 02 Jun 2020 11:54:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NiWU=7P=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jg5VN-00043b-SK
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 11:54:53 +0000
X-Inumbo-ID: dbc562a8-a4c7-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbc562a8-a4c7-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kf4rrLec+XLg/DmZFrjWNhvjqKekXm9hFEX1Okphkx8=; b=mfwEYwMHAFFRdaKI6QvFBa1nO
 aYZmA44xCN40E5ZwHt11Wqr3IZa20hPe7mw7kqxg0tJkQX7JG1/jqSIYLKkr8I+HoA80InpUbPnkI
 xMRC2fJUDwQ0U1YVA76NsQKFrlGjTSvW/uVBvr7P4im3PmNfcwjOxvL+cYB+3oV1iX/VU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jg5VH-0002kx-Ed; Tue, 02 Jun 2020 11:54:47 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jg5VH-00019E-59; Tue, 02 Jun 2020 11:54:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jg5VH-0005xQ-4W; Tue, 02 Jun 2020 11:54:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150614-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150614: all pass - PUSHED
X-Osstest-Versions-This: ovmf=ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9
X-Osstest-Versions-That: ovmf=4403bbd7c0964144ea72f27e2bc8048b0c0a26e1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Jun 2020 11:54:47 +0000
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

flight 150614 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150614/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9
baseline version:
 ovmf                 4403bbd7c0964144ea72f27e2bc8048b0c0a26e1

Last test of basis   150611  2020-06-02 03:09:41 Z    0 days
Testing same since   150614  2020-06-02 08:10:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Gary Lin <glin@suse.com>
  Laszlo Ersek <lersek@redhat.com>

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
   4403bbd7c0..ca407c7246  ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 -> xen-tested-master

