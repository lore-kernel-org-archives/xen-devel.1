Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33A0C56201
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 09:03:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32012206DC
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 09:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="oZknsAsM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32012206DC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12696.32930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXKsu-00007O-Hc; Tue, 27 Oct 2020 09:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12696.32930; Tue, 27 Oct 2020 09:03:16 +0000
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
	id 1kXKsu-00007H-ES; Tue, 27 Oct 2020 09:03:16 +0000
Received: by outflank-mailman (input) for mailman id 12696;
 Tue, 27 Oct 2020 09:03:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJOX=EC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kXKst-00006W-O0
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 09:03:15 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82fb8dbc-563b-439e-ab88-951916e08052;
 Tue, 27 Oct 2020 09:03:09 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kXKsm-0001yN-QZ; Tue, 27 Oct 2020 09:03:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kXKsm-0002dl-KQ; Tue, 27 Oct 2020 09:03:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kXKsm-0002DV-Jw; Tue, 27 Oct 2020 09:03:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WJOX=EC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kXKst-00006W-O0
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 09:03:15 +0000
X-Inumbo-ID: 82fb8dbc-563b-439e-ab88-951916e08052
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 82fb8dbc-563b-439e-ab88-951916e08052;
	Tue, 27 Oct 2020 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=6iEUxXMgBY1wBCGIXqjxqIuJErsln6MceQK2vDQKUuY=; b=oZknsAsM3FBcX/9/MmigGWeY2o
	2amXyFsOZzck05PiY7uxZhc9WGe3E0z7ArrB7gqGpmtco9UubNowmw+rxShcKXT2u29ChmW0fR216
	vlh1yfSnc23+qimWcPPT+pKCNNprpNVO74EUR+ZAR3x0QbuTLTiWG1LqaiLIzVXSjyHI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXKsm-0001yN-QZ; Tue, 27 Oct 2020 09:03:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXKsm-0002dl-KQ; Tue, 27 Oct 2020 09:03:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXKsm-0002DV-Jw; Tue, 27 Oct 2020 09:03:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156252-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156252: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a3212009d95bbcba7d08076aba2eee51eb1f8e7c
X-Osstest-Versions-That:
    ovmf=b70c4fdcde83689d8cd1e5e2faf598d0087934a3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Oct 2020 09:03:08 +0000

flight 156252 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156252/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a3212009d95bbcba7d08076aba2eee51eb1f8e7c
baseline version:
 ovmf                 b70c4fdcde83689d8cd1e5e2faf598d0087934a3

Last test of basis   156232  2020-10-26 03:10:04 Z    1 days
Testing same since   156252  2020-10-27 01:41:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heng Luo <heng.luo@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Luo, Heng <heng.luo@intel.com>

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
   b70c4fdcde..a3212009d9  a3212009d95bbcba7d08076aba2eee51eb1f8e7c -> xen-tested-master

