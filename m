Return-Path: <SRS0=l9VS=EX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8641C63697
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 21:44:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F64524181
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 21:44:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="VD3vlogM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F64524181
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.29281.58607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf8m7-00047O-FX; Tue, 17 Nov 2020 21:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29281.58607; Tue, 17 Nov 2020 21:44:31 +0000
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
	id 1kf8m7-00047H-C7; Tue, 17 Nov 2020 21:44:31 +0000
Received: by outflank-mailman (input) for mailman id 29281;
 Tue, 17 Nov 2020 21:44:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2yZ=EX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kf8m6-00046h-Qg
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 21:44:30 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35a38147-0000-480b-87d8-9875e7ece607;
 Tue, 17 Nov 2020 21:44:24 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kf8m0-0000ft-ED; Tue, 17 Nov 2020 21:44:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kf8m0-00070i-3e; Tue, 17 Nov 2020 21:44:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kf8m0-0008IS-38; Tue, 17 Nov 2020 21:44:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=g2yZ=EX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kf8m6-00046h-Qg
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 21:44:30 +0000
X-Inumbo-ID: 35a38147-0000-480b-87d8-9875e7ece607
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 35a38147-0000-480b-87d8-9875e7ece607;
	Tue, 17 Nov 2020 21:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=X1+AjzSHCDiZvudZ1gr54AAoah4GEyDrSKhbhyIFAzU=; b=VD3vlogMsVktfYhi3ZhLSf3oS6
	JXbhw6MlkuViMG369vajjRdg7IdsD8r1cPJS41g6SAbj1Bp/uDt0ml+1rQy0bNkie41Y+e2mgpx3E
	l6yeNcSTNzitG0y+jymi6ogHd7kekc0guMUcJl9g0qpAFknqvksLZkJkJ5EgcNkVDdt0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kf8m0-0000ft-ED; Tue, 17 Nov 2020 21:44:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kf8m0-00070i-3e; Tue, 17 Nov 2020 21:44:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kf8m0-0008IS-38; Tue, 17 Nov 2020 21:44:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156838-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156838: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e6a12a0fc817e26ac05e8301e89433c2367ff362
X-Osstest-Versions-That:
    ovmf=29d59baa3907277782e9f26ecaa99704ff57e3f1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 17 Nov 2020 21:44:24 +0000

flight 156838 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156838/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e6a12a0fc817e26ac05e8301e89433c2367ff362
baseline version:
 ovmf                 29d59baa3907277782e9f26ecaa99704ff57e3f1

Last test of basis   156829  2020-11-17 04:47:02 Z    0 days
Testing same since   156838  2020-11-17 19:39:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gao, Zhichao <zhichao.gao@intel.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
   29d59baa39..e6a12a0fc8  e6a12a0fc817e26ac05e8301e89433c2367ff362 -> xen-tested-master

