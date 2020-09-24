Return-Path: <SRS0=okQV=DB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF32C4363D
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 21:36:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F9020758
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 21:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="r8G+ba9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F9020758
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLYuJ-0003Or-6N; Thu, 24 Sep 2020 21:36:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUiC=DB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kLYuH-0003OR-G9
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 21:36:01 +0000
X-Inumbo-ID: 22058dec-d2c9-4a63-ab49-b7a24925cfc8
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22058dec-d2c9-4a63-ab49-b7a24925cfc8;
 Thu, 24 Sep 2020 21:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=/27upWmJhY293Yyl81ZEgsi+xzFNJomXBTX1pNlUKvg=; b=r8G+ba9nNv2LcsrHe3jx8xTc1x
 UWgAgLYS8/pwERjWq0kAIIwpRFCvid/BN2zcFiNgRBrfxS9yz0Ty6E+b7O8PS/a/G87lIn1hV+X0M
 egsIuKStIvEqZrOjjmnAvWQMIRLHtWyutE5PdArT2he8uOts6ueMVlA4njQq7ylFCmvg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLYuB-0001Qv-1x; Thu, 24 Sep 2020 21:35:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLYuA-0002m2-R7; Thu, 24 Sep 2020 21:35:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kLYuA-0005dI-Qd; Thu, 24 Sep 2020 21:35:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154651-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 154651: tolerable all pass - PUSHED
X-Osstest-Failures: xtf:test-xtf-amd64-amd64-3:xtf/test-pv32pae-xsa-339:fail:nonblocking
 xtf:test-xtf-amd64-amd64-1:xtf/test-pv32pae-xsa-339:fail:nonblocking
 xtf:test-xtf-amd64-amd64-5:xtf/test-pv32pae-xsa-339:fail:nonblocking
 xtf:test-xtf-amd64-amd64-4:xtf/test-pv32pae-xsa-339:fail:nonblocking
 xtf:test-xtf-amd64-amd64-2:xtf/test-pv32pae-xsa-339:fail:nonblocking
X-Osstest-Versions-This: xtf=a1bb00c99b92202ee818d9df6464484f89989d80
X-Osstest-Versions-That: xtf=17d372b763cb0b2e2e6b5a637c11f3997d2533fa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 24 Sep 2020 21:35:54 +0000
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

flight 154651 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154651/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-xtf-amd64-amd64-3       93 xtf/test-pv32pae-xsa-339     fail   never pass
 test-xtf-amd64-amd64-1       93 xtf/test-pv32pae-xsa-339     fail   never pass
 test-xtf-amd64-amd64-5       93 xtf/test-pv32pae-xsa-339     fail   never pass
 test-xtf-amd64-amd64-4       93 xtf/test-pv32pae-xsa-339     fail   never pass
 test-xtf-amd64-amd64-2       93 xtf/test-pv32pae-xsa-339     fail   never pass

version targeted for testing:
 xtf                  a1bb00c99b92202ee818d9df6464484f89989d80
baseline version:
 xtf                  17d372b763cb0b2e2e6b5a637c11f3997d2533fa

Last test of basis   152564  2020-08-11 19:41:10 Z   44 days
Testing same since   154651  2020-09-23 16:09:54 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   17d372b..a1bb00c  a1bb00c99b92202ee818d9df6464484f89989d80 -> xen-tested-master

