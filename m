Return-Path: <SRS0=yWKO=DX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC3EC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 09:26:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0203206DD
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 09:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="EPEUgefl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0203206DD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.7850.20677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTM0H-0005Mj-2Y; Fri, 16 Oct 2020 09:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7850.20677; Fri, 16 Oct 2020 09:26:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTM0G-0005Mc-Vj; Fri, 16 Oct 2020 09:26:24 +0000
Received: by outflank-mailman (input) for mailman id 7850;
 Fri, 16 Oct 2020 09:26:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcLu=DX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kTM0F-0005MA-JT
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 09:26:23 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dff46635-d760-4e78-9c72-d9a24daed830;
 Fri, 16 Oct 2020 09:26:17 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTM09-00088L-3H; Fri, 16 Oct 2020 09:26:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTM08-0001oD-QM; Fri, 16 Oct 2020 09:26:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kTM08-0003k3-Ps; Fri, 16 Oct 2020 09:26:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VcLu=DX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kTM0F-0005MA-JT
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 09:26:23 +0000
X-Inumbo-ID: dff46635-d760-4e78-9c72-d9a24daed830
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dff46635-d760-4e78-9c72-d9a24daed830;
	Fri, 16 Oct 2020 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=K7nFD8ulU1BrdRX4c/Di2KlCmOk8+6M3tyW+QNUYMmg=; b=EPEUgefl94pcNzQg/Fa3gNWw1j
	kzW3kuLDHsBuNt8Uaa0HjJG6rY4KbNwu+WoNvpF+2ccvIowZPCruVHNwsUc7qRk4B+1KEn+0AgKi6
	eROLr9g4ULD3dpm3Qx3Q3sAI0Gv+c09ymSaO+07RTrhu2Vg4es+PmC5wCXosYx+FFM+I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTM09-00088L-3H; Fri, 16 Oct 2020 09:26:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTM08-0001oD-QM; Fri, 16 Oct 2020 09:26:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTM08-0003k3-Ps; Fri, 16 Oct 2020 09:26:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155881-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155881: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d25fd8710d6c8fc11582210fb1f8480c0d98416b
X-Osstest-Versions-That:
    ovmf=19c87b7d446c3273e84b238cb02cd1c0ae69c43e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 16 Oct 2020 09:26:16 +0000

flight 155881 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155881/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d25fd8710d6c8fc11582210fb1f8480c0d98416b
baseline version:
 ovmf                 19c87b7d446c3273e84b238cb02cd1c0ae69c43e

Last test of basis   155837  2020-10-15 07:14:20 Z    1 days
Testing same since   155881  2020-10-16 01:40:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Compostella, Jeremy <jeremy.compostella@intel.com>
  Jeremy Compostella <jeremy.compostella@intel.com>

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
   19c87b7d44..d25fd8710d  d25fd8710d6c8fc11582210fb1f8480c0d98416b -> xen-tested-master

