Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475C1C388F7
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 17:52:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B351C20797
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 17:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="63EHJP1N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B351C20797
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23563.50376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXnu-0002pl-68; Tue, 10 Nov 2020 17:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23563.50376; Tue, 10 Nov 2020 17:51:38 +0000
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
	id 1kcXnu-0002pc-30; Tue, 10 Nov 2020 17:51:38 +0000
Received: by outflank-mailman (input) for mailman id 23563;
 Tue, 10 Nov 2020 17:51:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcXns-0002pX-CF
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:51:36 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da43741a-5327-4bfc-8f35-e00968d183e7;
 Tue, 10 Nov 2020 17:51:35 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcXnq-0006WV-P7; Tue, 10 Nov 2020 17:51:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcXnq-0006gR-Gy; Tue, 10 Nov 2020 17:51:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcXnq-0003LF-GW; Tue, 10 Nov 2020 17:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcXns-0002pX-CF
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:51:36 +0000
X-Inumbo-ID: da43741a-5327-4bfc-8f35-e00968d183e7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id da43741a-5327-4bfc-8f35-e00968d183e7;
	Tue, 10 Nov 2020 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=5QoJWVefmJg9JGEni6go5uGLbQytKU8t4dqGrNpBIbk=; b=63EHJP1NzsaPpMSixuMawr8BEg
	F6ovdKdA6QoheyzSrTxn3d8eaZ9dV8ZrDXhMCCvwRJkuSP/Vd3rIhrgaCv0LZX6erhW2pRHMawwg6
	Prfh+zWWpRNHWtonn5dia0NWj9gJh8kooLzAGCKysDv/cv3GyZT1Ocw3wogqVdSEI2Ws=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcXnq-0006WV-P7; Tue, 10 Nov 2020 17:51:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcXnq-0006gR-Gy; Tue, 10 Nov 2020 17:51:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcXnq-0003LF-GW; Tue, 10 Nov 2020 17:51:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156606-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156606: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0af7f8e6a9253960ba820cd6ddfd8c36543d30cb
X-Osstest-Versions-That:
    ovmf=1366cd58cd4459f00b4ecf5abed13e77ac4ad06c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Nov 2020 17:51:34 +0000

flight 156606 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156606/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0af7f8e6a9253960ba820cd6ddfd8c36543d30cb
baseline version:
 ovmf                 1366cd58cd4459f00b4ecf5abed13e77ac4ad06c

Last test of basis   156545  2020-11-07 20:41:45 Z    2 days
Testing same since   156606  2020-11-10 00:39:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mingyue Liang <mingyuex.liang@intel.com>

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
   1366cd58cd..0af7f8e6a9  0af7f8e6a9253960ba820cd6ddfd8c36543d30cb -> xen-tested-master

