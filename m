Return-Path: <SRS0=OxlN=G3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EECC433DB
	for <xen-devel@archiver.kernel.org>; Sun, 24 Jan 2021 10:02:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93D2622ADC
	for <xen-devel@archiver.kernel.org>; Sun, 24 Jan 2021 10:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93D2622ADC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.73615.132490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3cDi-00089h-Iy; Sun, 24 Jan 2021 10:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73615.132490; Sun, 24 Jan 2021 10:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3cDi-00089a-Fx; Sun, 24 Jan 2021 10:02:10 +0000
Received: by outflank-mailman (input) for mailman id 73615;
 Sun, 24 Jan 2021 10:02:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3cDh-00089S-B4; Sun, 24 Jan 2021 10:02:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3cDh-0002Sq-3K; Sun, 24 Jan 2021 10:02:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3cDg-0004FB-Qq; Sun, 24 Jan 2021 10:02:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l3cDg-0005em-QM; Sun, 24 Jan 2021 10:02:08 +0000
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
	bh=lt1dkjjkQg8sUAd1nqrq1/S47G5N9OICShbu2t3mrI4=; b=IGUA2S1upBtmlpNbpfuzkxSIJP
	9jc1SUesRkBJg/CrxDW1DXsqpXUx1pyMWCB6RlES96KuSCZd5c1qkcRDtMI3RmiO8HLpLMK1cfSJl
	i3+5oEdd3V0ehoBQKHZpTkHLUMpunIRt1Vy1YEuaVx+rLq25Ywq7N8CHJhcNAnyRx5+A=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158599-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158599: all pass - PUSHED
X-Osstest-Versions-This:
    xen=452ddbe3592b141b05a7e0676f09c8ae07f98fdd
X-Osstest-Versions-That:
    xen=3487f4cf8bf5cef47a4c3918c13a502afc9891f6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 Jan 2021 10:02:08 +0000

flight 158599 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158599/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  452ddbe3592b141b05a7e0676f09c8ae07f98fdd
baseline version:
 xen                  3487f4cf8bf5cef47a4c3918c13a502afc9891f6

Last test of basis   158538  2021-01-20 09:19:56 Z    4 days
Testing same since   158599  2021-01-24 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Doug Goldstein <cardoe@cardoe.com>
  Edwin Török <edvin.torok@citrix.com>
  Hans Reiser <hr@sec.uni-passau.de>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@amazon.com>
  Michal Orzel <michal.orzel@arm.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <pdurrant@amazon.com>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Vladimir Murzin <vladimir.murzin@arm.com>
  Wei Chen <wei.chen@arm.com>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   3487f4cf8b..452ddbe359  452ddbe3592b141b05a7e0676f09c8ae07f98fdd -> coverity-tested/smoke

