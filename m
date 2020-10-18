Return-Path: <SRS0=S1vZ=DZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2737AC433DF
	for <xen-devel@archiver.kernel.org>; Sun, 18 Oct 2020 11:05:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C027B20897
	for <xen-devel@archiver.kernel.org>; Sun, 18 Oct 2020 11:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="t561U7w9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C027B20897
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8512.22705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kU6Up-0008Ao-4I; Sun, 18 Oct 2020 11:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8512.22705; Sun, 18 Oct 2020 11:05:03 +0000
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
	id 1kU6Up-0008Ah-1K; Sun, 18 Oct 2020 11:05:03 +0000
Received: by outflank-mailman (input) for mailman id 8512;
 Sun, 18 Oct 2020 11:05:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MNWJ=DZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kU6Un-0008Ac-Ph
 for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 11:05:01 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c90927b6-7baa-4a32-b6fc-ab82ad491c3c;
 Sun, 18 Oct 2020 11:05:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kU6Ul-00009a-WF; Sun, 18 Oct 2020 11:05:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kU6Ul-0003J2-Mc; Sun, 18 Oct 2020 11:04:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kU6Ul-0004SS-M5; Sun, 18 Oct 2020 11:04:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MNWJ=DZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kU6Un-0008Ac-Ph
	for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 11:05:01 +0000
X-Inumbo-ID: c90927b6-7baa-4a32-b6fc-ab82ad491c3c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c90927b6-7baa-4a32-b6fc-ab82ad491c3c;
	Sun, 18 Oct 2020 11:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=XPyAnAJnardDVqqHXppcGzWDhFKW+0FiMdnz4rao4dU=; b=t561U7w9ebM9V1UqcWXyrkDj5X
	ggzeBYKWt5kXe/uQkOm2uheytBGvshtGHSnV0xcKTNrXSolBId3gleHWuuSr1giEsSUlgfiBO8s+e
	M+FlG9OKXVDtU7gFnzXNdtkNbxKAOsSyo6QWv7PbbLmaCihzA3FcMbkm8ZE7DlbiEFIs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kU6Ul-00009a-WF; Sun, 18 Oct 2020 11:05:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kU6Ul-0003J2-Mc; Sun, 18 Oct 2020 11:04:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kU6Ul-0004SS-M5; Sun, 18 Oct 2020 11:04:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155942-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155942: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=73e3cb6c7eea4f5db81c87574dcefe1282de4772
X-Osstest-Versions-That:
    ovmf=30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 18 Oct 2020 11:04:59 +0000

flight 155942 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155942/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 73e3cb6c7eea4f5db81c87574dcefe1282de4772
baseline version:
 ovmf                 30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1

Last test of basis   155908  2020-10-16 18:15:11 Z    1 days
Testing same since   155942  2020-10-18 01:09:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Matthew Carlson <macarl@microsoft.com>
  Matthew Carlson <matthewfcarlson@gmail.com>

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
   30f0ec8d80..73e3cb6c7e  73e3cb6c7eea4f5db81c87574dcefe1282de4772 -> xen-tested-master

