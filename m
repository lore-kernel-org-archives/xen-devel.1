Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B588C25B48
	for <xen-devel@archiver.kernel.org>; Thu, 26 Oct 2023 17:19:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.623941.972245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw40f-0005EE-VV; Thu, 26 Oct 2023 17:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623941.972245; Thu, 26 Oct 2023 17:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw40f-0005E7-SN; Thu, 26 Oct 2023 17:19:05 +0000
Received: by outflank-mailman (input) for mailman id 623941;
 Thu, 26 Oct 2023 17:19:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qw40f-0005Dx-0z; Thu, 26 Oct 2023 17:19:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qw40e-0001dO-TI; Thu, 26 Oct 2023 17:19:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qw40e-0002Ar-HM; Thu, 26 Oct 2023 17:19:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qw40e-0007Q8-Gz; Thu, 26 Oct 2023 17:19:04 +0000
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
	bh=9s34CyJMNtqykfUrTgmsVPqc5cpi63NO2m1cLpfyIMM=; b=Ct3wY0g754ye+qup7saezLEU5g
	Ck67Xt8S1pDiStu677NIuUxmY2ADDN6YdISYcqXpTfCu89ICXoyKJ4BawQ/lwN5yJaedv3R9aEBNk
	8Sma/cRKzSIZBxJuHEhKYiQv3lRoApQXLnElPYrnUf2Viuf9A2h/XE+YWiJA8sfH/Geg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183539-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183539: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fe43b426762c31c2f1958444d3aca388ec8d4702
X-Osstest-Versions-That:
    ovmf=8765f3eb428f86974033215fe08f8d3d85deedae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Oct 2023 17:19:04 +0000

flight 183539 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183539/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fe43b426762c31c2f1958444d3aca388ec8d4702
baseline version:
 ovmf                 8765f3eb428f86974033215fe08f8d3d85deedae

Last test of basis   183536  2023-10-26 07:44:22 Z    0 days
Testing same since   183539  2023-10-26 15:43:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>

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
   8765f3eb42..fe43b42676  fe43b426762c31c2f1958444d3aca388ec8d4702 -> xen-tested-master

