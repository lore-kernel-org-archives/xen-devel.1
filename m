Return-Path: <SRS0=tVq8=ER=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390D9C4742C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 09:58:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD6C20639
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 09:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="7BAlBW4/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD6C20639
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.24577.51883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcmtS-0005p2-Ig; Wed, 11 Nov 2020 09:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24577.51883; Wed, 11 Nov 2020 09:58:22 +0000
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
	id 1kcmtS-0005ov-FQ; Wed, 11 Nov 2020 09:58:22 +0000
Received: by outflank-mailman (input) for mailman id 24577;
 Wed, 11 Nov 2020 09:58:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcmtR-0005oq-OR
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 09:58:21 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55b48ee9-b115-4306-a927-e410cc40e570;
 Wed, 11 Nov 2020 09:58:18 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcmtO-0007l4-LL; Wed, 11 Nov 2020 09:58:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcmtO-0004P7-CK; Wed, 11 Nov 2020 09:58:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcmtO-0006pf-Br; Wed, 11 Nov 2020 09:58:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcmtR-0005oq-OR
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 09:58:21 +0000
X-Inumbo-ID: 55b48ee9-b115-4306-a927-e410cc40e570
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 55b48ee9-b115-4306-a927-e410cc40e570;
	Wed, 11 Nov 2020 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=WaxgwJEGqmVlw3XbgZmBHyGcqij0ZC6YIAztjmIioXM=; b=7BAlBW4/qd3KBIb0n8KVTaBwZ/
	RIpCO/qyoVN4zbm4lRMXuIgBx8Y1VDG/bY1LeaVZHQulFQyR+Ke9RLerwsnaIs/7lvalEMJyU+guO
	IrAaNaRCajQrsZFdh7rbBeJahFmLl/jnKwKeF9GfvF2EhA4cggers0CbeKtlv0Lkthj4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcmtO-0007l4-LL; Wed, 11 Nov 2020 09:58:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcmtO-0004P7-CK; Wed, 11 Nov 2020 09:58:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcmtO-0006pf-Br; Wed, 11 Nov 2020 09:58:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156681-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 156681: all pass - PUSHED
X-Osstest-Versions-This:
    xen=3059178798a23ba870ff86ff54d442a07e6651fc
X-Osstest-Versions-That:
    xen=0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Nov 2020 09:58:18 +0000

flight 156681 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156681/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  3059178798a23ba870ff86ff54d442a07e6651fc
baseline version:
 xen                  0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258

Last test of basis   156554  2020-11-08 09:20:27 Z    3 days
Testing same since   156681  2020-11-11 09:19:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   0a5e0ce0fb..3059178798  3059178798a23ba870ff86ff54d442a07e6651fc -> coverity-tested/smoke

