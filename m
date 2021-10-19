Return-Path: <SRS0=1/kX=PH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1BAC433EF
	for <xen-devel@archiver.kernel.org>; Tue, 19 Oct 2021 14:15:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875D561057
	for <xen-devel@archiver.kernel.org>; Tue, 19 Oct 2021 14:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 875D561057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenbits.xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.213313.371490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpto-0002FX-9K; Tue, 19 Oct 2021 14:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213313.371490; Tue, 19 Oct 2021 14:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpto-0002FQ-50; Tue, 19 Oct 2021 14:15:28 +0000
Received: by outflank-mailman (input) for mailman id 213313;
 Tue, 19 Oct 2021 14:15:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>) id 1mcptm-0002FK-NI
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 14:15:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mcptl-00038f-Dx; Tue, 19 Oct 2021 14:15:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mcptl-0000A9-7H; Tue, 19 Oct 2021 14:15:25 +0000
Received: from iwj by osstest.test-lab.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mcptl-0002fM-6i; Tue, 19 Oct 2021 14:15:25 +0000
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
To: jgross@suse.com,iwj@xenproject.org,xen-devel@lists.xenproject.org
Subject: [adhoc test] 165675: truncated
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-Id: <E1mcptl-0002fM-6i@osstest.test-lab.xenproject.org>
From: iwj@xenbits.xen.org
Date: Tue, 19 Oct 2021 14:15:25 +0000

[adhoc play] <testing.git (HEAD detached at 14a279c4) /dev/pts/3>
harness 14a279c4: osstest: explicitly enable building qemu-traditional
165675: truncated

flight 165675 xen-unstable play [play]
http://logs.test-lab.xenproject.org/osstest/logs/165675/

Perfect :-)
All tests in this flight passed as required
baseline version:
 flight               165635

jobs:
 build-amd64                                                  truncated


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


