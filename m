Return-Path: <SRS0=Fpha=EB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D21C4363A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 09:46:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 836F4223EA
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 09:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="quwqQZVM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 836F4223EA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12172.31903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWz57-0001QL-KC; Mon, 26 Oct 2020 09:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12172.31903; Mon, 26 Oct 2020 09:46:25 +0000
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
	id 1kWz57-0001QE-Gi; Mon, 26 Oct 2020 09:46:25 +0000
Received: by outflank-mailman (input) for mailman id 12172;
 Mon, 26 Oct 2020 09:46:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRSk=EB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kWz56-0001Ou-Dy
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:46:24 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 623cd873-d9f4-4d80-9ace-69f806647549;
 Mon, 26 Oct 2020 09:46:18 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWz50-00087f-5O; Mon, 26 Oct 2020 09:46:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWz4z-0003DN-T6; Mon, 26 Oct 2020 09:46:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kWz4z-0007Kz-SY; Mon, 26 Oct 2020 09:46:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WRSk=EB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kWz56-0001Ou-Dy
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:46:24 +0000
X-Inumbo-ID: 623cd873-d9f4-4d80-9ace-69f806647549
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 623cd873-d9f4-4d80-9ace-69f806647549;
	Mon, 26 Oct 2020 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=/gIA32XdbAKB4NRFhS72e94jNYiYhLF6gN6orWS8RN4=; b=quwqQZVM8aAMTfvdf+GJ3Zo86g
	oikE50eOuJh3US8Lbm/Y+8WDSSWSuP1NPQizreTFbkaCKnC8w6iNTGszOu+y3Mfq4ewGBlnZuU2Ju
	8Zh4gqMBT+CYJd10Wp9dGuFZDm/pBT2P1jPzPZZEgM5glnxHPh87YHoBYvTyAAFbQxps=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWz50-00087f-5O; Mon, 26 Oct 2020 09:46:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWz4z-0003DN-T6; Mon, 26 Oct 2020 09:46:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWz4z-0007Kz-SY; Mon, 26 Oct 2020 09:46:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156232-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156232: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b70c4fdcde83689d8cd1e5e2faf598d0087934a3
X-Osstest-Versions-That:
    ovmf=264eccb5dfc345c2e004883f00e62959f818fafd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Oct 2020 09:46:17 +0000

flight 156232 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156232/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b70c4fdcde83689d8cd1e5e2faf598d0087934a3
baseline version:
 ovmf                 264eccb5dfc345c2e004883f00e62959f818fafd

Last test of basis   156102  2020-10-22 17:10:41 Z    3 days
Testing same since   156232  2020-10-26 03:10:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>

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
   264eccb5df..b70c4fdcde  b70c4fdcde83689d8cd1e5e2faf598d0087934a3 -> xen-tested-master

