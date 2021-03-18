Return-Path: <SRS0=7FyG=IQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19294C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 18 Mar 2021 15:00:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C158864F04
	for <xen-devel@archiver.kernel.org>; Thu, 18 Mar 2021 15:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C158864F04
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.99034.188095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMu7a-0002Rq-Mz; Thu, 18 Mar 2021 14:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99034.188095; Thu, 18 Mar 2021 14:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMu7a-0002Rj-JN; Thu, 18 Mar 2021 14:59:34 +0000
Received: by outflank-mailman (input) for mailman id 99034;
 Thu, 18 Mar 2021 14:59:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMu7Z-0002Rb-J9; Thu, 18 Mar 2021 14:59:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMu7Z-0002Mr-DS; Thu, 18 Mar 2021 14:59:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMu7Z-0004br-5n; Thu, 18 Mar 2021 14:59:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lMu7Z-0003Hm-56; Thu, 18 Mar 2021 14:59:33 +0000
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
	bh=zDHqKSFqhyJH+jlbnQL4MT7/0cpjbIpvvzVIqBD3w+k=; b=JyhvFrOwEFkzDF7a36kssjsbCt
	Ftsk5Zcv1GCBLemiXdgR1v9eR7yoIHhzVNtzZtaMOjGDeuhj3y7NCN7B9hITtychYoI0QTBRMOnty
	ox7C/6P/cpbkvrkR0mH3AkTMNyb1fv162sUgEYp8LnyMdbhE6YCLl5yE+ViGJYQDdr44=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160123-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160123: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1
X-Osstest-Versions-That:
    ovmf=030ba3097a6e7d08b99f8a9d19a322f61409c1f6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Mar 2021 14:59:33 +0000

flight 160123 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160123/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1
baseline version:
 ovmf                 030ba3097a6e7d08b99f8a9d19a322f61409c1f6

Last test of basis   160117  2021-03-17 20:41:58 Z    0 days
Testing same since   160123  2021-03-18 04:45:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <Jiaxin.wu@intel.com>
  Mars CC Lin <mars_cc_lin@phoenix.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
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
   030ba3097a..9fd7e88c23  9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 -> xen-tested-master

