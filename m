Return-Path: <SRS0=APZ7=A3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEB2C433E4
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2020 15:32:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C07F2065F
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2020 15:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="iRvv+7Rk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C07F2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw5rg-0001Yi-Ui; Thu, 16 Jul 2020 15:32:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sYN5=A3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jw5rf-0001Yd-Fs
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 15:32:03 +0000
X-Inumbo-ID: 7f1e7b82-c779-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f1e7b82-c779-11ea-8496-bc764e2007e4;
 Thu, 16 Jul 2020 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YK5+rWAzPxg5iH3SvNGtYxLpTilZXgC6lrTxFI5DUMk=; b=iRvv+7Rk4frBkH3zs/5JxoOGS
 +GAt2gC3d/Q5kNGgwKcA9+9sKjJnVyzZ/7um5l9K0ON45J8SnworQZmcx7niSIhSlPKqwwZ6VQQG8
 hThNlqHtq/Gv3urLegpPiOZhGfPERrvTfmEFbw3YYVo7E/V+wVcDQc8DE4H15LcHwjLWM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jw5re-0000q1-AC; Thu, 16 Jul 2020 15:32:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jw5rd-0001EW-UQ; Thu, 16 Jul 2020 15:32:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jw5rd-0006WL-Ts; Thu, 16 Jul 2020 15:32:01 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151937-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151937: all pass - PUSHED
X-Osstest-Versions-This: ovmf=d9269d69138860edb1ec9796ed48549dc6ba5735
X-Osstest-Versions-That: ovmf=e77966b341b993291ab2d95718b88a6a0d703d0c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Jul 2020 15:32:01 +0000
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

flight 151937 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151937/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d9269d69138860edb1ec9796ed48549dc6ba5735
baseline version:
 ovmf                 e77966b341b993291ab2d95718b88a6a0d703d0c

Last test of basis   151923  2020-07-15 16:10:49 Z    0 days
Testing same since   151937  2020-07-16 04:25:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gary Lin <glin@suse.com>

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
   e77966b341..d9269d6913  d9269d69138860edb1ec9796ed48549dc6ba5735 -> xen-tested-master

