Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363D9C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 10:40:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F6F20704
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 10:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="eMG2FY6J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F6F20704
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15628.38649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYRpQ-0002zR-8J; Fri, 30 Oct 2020 10:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15628.38649; Fri, 30 Oct 2020 10:40:16 +0000
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
	id 1kYRpQ-0002zK-4v; Fri, 30 Oct 2020 10:40:16 +0000
Received: by outflank-mailman (input) for mailman id 15628;
 Fri, 30 Oct 2020 10:40:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mU6k=EF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kYRpP-0002zD-05
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:40:15 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3313538a-dad6-4f6c-9f82-048862176b4a;
 Fri, 30 Oct 2020 10:40:13 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYRpM-0005nv-Mt; Fri, 30 Oct 2020 10:40:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYRpM-0000hz-FE; Fri, 30 Oct 2020 10:40:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kYRpM-0000Y6-Ek; Fri, 30 Oct 2020 10:40:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mU6k=EF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kYRpP-0002zD-05
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:40:15 +0000
X-Inumbo-ID: 3313538a-dad6-4f6c-9f82-048862176b4a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3313538a-dad6-4f6c-9f82-048862176b4a;
	Fri, 30 Oct 2020 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=LnMp38M1K7qF9Zz4fSkjsSW8Kz7GnyTaes32PK9GFgg=; b=eMG2FY6JHxv97mPZmTp6Dqqzji
	7c1We4y+kr0XoJfY1e/65BIIlMeq2IH0wgL07HNLJYpbzpk+lyElB4IwbFPK1xpNu73JCqUPlAPvx
	Dn/SL/VltErtmIzWre55BCwJJxbLqKDbSLoOvduZLEv9VoXqr47xBlkbVb+03Uhygsg4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYRpM-0005nv-Mt; Fri, 30 Oct 2020 10:40:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYRpM-0000hz-FE; Fri, 30 Oct 2020 10:40:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYRpM-0000Y6-Ek; Fri, 30 Oct 2020 10:40:12 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156294-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156294: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c26e291375d1808a0ec5af9002dd0ebca5959020
X-Osstest-Versions-That:
    ovmf=3b87d728742fe58f427f4b775b11250e29d75cc6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Oct 2020 10:40:12 +0000

flight 156294 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156294/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c26e291375d1808a0ec5af9002dd0ebca5959020
baseline version:
 ovmf                 3b87d728742fe58f427f4b775b11250e29d75cc6

Last test of basis   156270  2020-10-28 03:11:01 Z    2 days
Testing same since   156294  2020-10-29 11:26:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liming Gao <gaoliming@byosoft.com.cn>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Siyuan Fu <siyuan.fu@intel.com>

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
   3b87d72874..c26e291375  c26e291375d1808a0ec5af9002dd0ebca5959020 -> xen-tested-master

