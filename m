Return-Path: <SRS0=BKM6=K6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C4CC4743C
	for <xen-devel@archiver.kernel.org>; Fri,  4 Jun 2021 17:35:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4ED26140C
	for <xen-devel@archiver.kernel.org>; Fri,  4 Jun 2021 17:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4ED26140C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.136960.253766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpDjM-0005VL-Ql; Fri, 04 Jun 2021 17:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136960.253766; Fri, 04 Jun 2021 17:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpDjM-0005VE-Nc; Fri, 04 Jun 2021 17:35:36 +0000
Received: by outflank-mailman (input) for mailman id 136960;
 Fri, 04 Jun 2021 17:35:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpDjL-0005V4-9v; Fri, 04 Jun 2021 17:35:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpDjL-0001Cx-58; Fri, 04 Jun 2021 17:35:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpDjK-0000mU-Su; Fri, 04 Jun 2021 17:35:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lpDjK-0004T9-SN; Fri, 04 Jun 2021 17:35:34 +0000
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
	bh=exAT1rBVPOSO6GA3tHCs9ko+p7SZZvz2k274nG+yFL4=; b=Q2u+hfDyKGJjl4Dg/cC+6muzDd
	HlkcuQJetKRt0QKhQ9QfNMpyN9zkCpeu4wONIM8sQi8k8eH5M7LWxlWLHZy28kWEioi0yUS8W0o5L
	C/5VtzcVyc4VHqrAlEWQPlZhd69OKJgqhpD1Prc7nkWRIEFoWcKQa4yJeEkKwO4XP2wE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162368-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162368: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:starved:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    ovmf=924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0
X-Osstest-Versions-That:
    ovmf=c410ad4da4b7785170d3d42a3ba190c2caac6feb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Jun 2021 17:35:34 +0000

flight 162368 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162368/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate             starved n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  3 hosts-allocate              starved n/a

version targeted for testing:
 ovmf                 924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0
baseline version:
 ovmf                 c410ad4da4b7785170d3d42a3ba190c2caac6feb

Last test of basis   162359  2021-06-04 03:40:08 Z    0 days
Testing same since   162368  2021-06-04 15:42:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liming Gao <gaoliming@byosoft.com.cn>
  Ni, Ray <ray.ni@intel.com>
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
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         starved 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          starved 


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
   c410ad4da4..924c2b847f  924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0 -> xen-tested-master

