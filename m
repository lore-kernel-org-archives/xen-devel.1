Return-Path: <SRS0=JyiM=EJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E9BC56201
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 10:07:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1205121D91
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 10:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="RfoMXM0e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1205121D91
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.18160.43027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtDC-0007nk-Tq; Tue, 03 Nov 2020 10:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18160.43027; Tue, 03 Nov 2020 10:06:46 +0000
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
	id 1kZtDC-0007nd-Qi; Tue, 03 Nov 2020 10:06:46 +0000
Received: by outflank-mailman (input) for mailman id 18160;
 Tue, 03 Nov 2020 10:06:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hh/q=EJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kZtDC-0007mz-1a
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:06:46 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db784db4-22a8-4b63-9a5f-1d410bdd47e0;
 Tue, 03 Nov 2020 10:06:39 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZtD5-0007Ai-N7; Tue, 03 Nov 2020 10:06:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZtD5-0007B4-CO; Tue, 03 Nov 2020 10:06:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kZtD5-0003oH-Bu; Tue, 03 Nov 2020 10:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hh/q=EJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kZtDC-0007mz-1a
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:06:46 +0000
X-Inumbo-ID: db784db4-22a8-4b63-9a5f-1d410bdd47e0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id db784db4-22a8-4b63-9a5f-1d410bdd47e0;
	Tue, 03 Nov 2020 10:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=p69p33bfWAgRRLMqXzUDfhZu2cU9FbjpvINoDO9wa3s=; b=RfoMXM0e2BahTgAQ58CIfDb6r1
	r9sYwm5KL5GZASyz8dtSsMUivscrRKzAXDAOVOgkkBuzjEXYr3rxTOjSUSBc2amBfWOJlVGe9Axtn
	02vcErxxX50sF9Tp5WfRVhbDrPSm5BvY5KYJIAETF1CdpaQtIVZyzPsmL1hFENunaxgY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZtD5-0007Ai-N7; Tue, 03 Nov 2020 10:06:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZtD5-0007B4-CO; Tue, 03 Nov 2020 10:06:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZtD5-0003oH-Bu; Tue, 03 Nov 2020 10:06:39 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156374-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156374: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0166dad49698fbe263759755382006d64a0ac825
X-Osstest-Versions-That:
    ovmf=ffddac3e0f2e0af54b48a86848193a5ad30def10
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Nov 2020 10:06:39 +0000

flight 156374 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156374/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0166dad49698fbe263759755382006d64a0ac825
baseline version:
 ovmf                 ffddac3e0f2e0af54b48a86848193a5ad30def10

Last test of basis   156359  2020-11-02 08:43:26 Z    1 days
Testing same since   156374  2020-11-03 01:55:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  fengyunhua <fengyunhua@byosoft.com.cn>
  Yunhua Feng <fengyunhua@byosoft.com.cn>

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
   ffddac3e0f..0166dad496  0166dad49698fbe263759755382006d64a0ac825 -> xen-tested-master

