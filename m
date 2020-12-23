Return-Path: <SRS0=Rlng=F3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90756C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 20:16:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 349B8223E4
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 20:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 349B8223E4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.58587.103187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksAYA-0004y2-MV; Wed, 23 Dec 2020 20:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58587.103187; Wed, 23 Dec 2020 20:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksAYA-0004xv-JV; Wed, 23 Dec 2020 20:15:58 +0000
Received: by outflank-mailman (input) for mailman id 58587;
 Wed, 23 Dec 2020 20:15:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ksAY9-0004xn-4d; Wed, 23 Dec 2020 20:15:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ksAY8-0006Kk-WE; Wed, 23 Dec 2020 20:15:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ksAY8-0004Hi-NW; Wed, 23 Dec 2020 20:15:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ksAY8-0001Uh-N3; Wed, 23 Dec 2020 20:15:56 +0000
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
	bh=YWeaA31/Lp9l6y1vHKTQMMFW82B1I2yzjGSo+WxjEk8=; b=PGBYurlrq5S+AMlJq0ehLGVGar
	xps+P/V/EGz1vyK3TrHIZimqpg6tElKbb8cSbFZMHeFbkE9JaE7/cihh7q+bRjHX/UDDMOXWEVcy1
	XJs5yRDLiWYFOj/udpZGMLsiITySDinQ62HAV9170wqmq4HG5iv49+P3pEoJRyCDlHCw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157856-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157856: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e2747dbb5a44f4a463ecc6dd0f7fd113ee57bd67
X-Osstest-Versions-That:
    ovmf=d15d0d3d8aee1c7d5dab7b636601370061b32612
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Dec 2020 20:15:56 +0000

flight 157856 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157856/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e2747dbb5a44f4a463ecc6dd0f7fd113ee57bd67
baseline version:
 ovmf                 d15d0d3d8aee1c7d5dab7b636601370061b32612

Last test of basis   157848  2020-12-23 07:52:03 Z    0 days
Testing same since   157856  2020-12-23 14:11:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Masahisa Kojima <masahisa.kojima@linaro.org>

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
   d15d0d3d8a..e2747dbb5a  e2747dbb5a44f4a463ecc6dd0f7fd113ee57bd67 -> xen-tested-master

