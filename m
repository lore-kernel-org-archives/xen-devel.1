Return-Path: <SRS0=cyMZ=6I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52075C54FCB
	for <xen-devel@archiver.kernel.org>; Fri, 24 Apr 2020 13:50:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA1820700
	for <xen-devel@archiver.kernel.org>; Fri, 24 Apr 2020 13:50:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="7MccT6GN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FA1820700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRyik-0001HR-HL; Fri, 24 Apr 2020 13:50:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzFP=6I=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRyij-0001HJ-Vm
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 13:50:22 +0000
X-Inumbo-ID: 892232d2-8632-11ea-94ac-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 892232d2-8632-11ea-94ac-12813bfff9fa;
 Fri, 24 Apr 2020 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v/njPgk4dearCeZbqrp9wfzKZUi7pTEmp50HKUUAMAU=; b=7MccT6GNUMbQpdUbVMcXG8830
 /4np94V88Ei9anGNav25B1oRxYZAVufiwQlkqYk7jZmb9KhaLL/rwyto7DxImtbvxDB7IzdELfmNi
 H+wIo9xg6uO9Hx0ZzuBckQCb4XFApq9ppGTnvUdXqeLwlPPtVOC5c8CRf7W6O/9HIX7rc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRyig-00018x-Th; Fri, 24 Apr 2020 13:50:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRyig-0004pJ-J8; Fri, 24 Apr 2020 13:50:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRyig-00020z-Hk; Fri, 24 Apr 2020 13:50:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149782-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [examine test] 149782: tolerable trouble: pass/starved
X-Osstest-Failures: examine:examine-albana1:memdisk-try-append:fail:nonblocking
 examine:examine-albana0:memdisk-try-append:fail:nonblocking
 examine:examine-elbling0:hosts-allocate:starved:nonblocking
 examine:examine-rochester0:hosts-allocate:starved:nonblocking
 examine:examine-debina0:hosts-allocate:starved:nonblocking
 examine:examine-godello0:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=149768
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Apr 2020 13:50:18 +0000
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

flight 149782 examine real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149782/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 examine-albana1               4 memdisk-try-append      fail blocked in 149768
 examine-albana0               4 memdisk-try-append      fail blocked in 149768
 examine-elbling0              2 hosts-allocate               starved  n/a
 examine-rochester0            2 hosts-allocate               starved  n/a
 examine-debina0               2 hosts-allocate               starved  n/a
 examine-godello0              2 hosts-allocate               starved  n/a

baseline version:
 flight               149768

jobs:
 examine-albana0                                              pass    
 examine-albana1                                              pass    
 examine-arndale-bluewater                                    pass    
 examine-cubietruck-braque                                    pass    
 examine-chardonnay0                                          pass    
 examine-chardonnay1                                          pass    
 examine-debina0                                              starved 
 examine-debina1                                              pass    
 examine-elbling0                                             starved 
 examine-elbling1                                             pass    
 examine-fiano0                                               pass    
 examine-fiano1                                               pass    
 examine-cubietruck-gleizes                                   pass    
 examine-godello0                                             starved 
 examine-godello1                                             pass    
 examine-huxelrebe0                                           pass    
 examine-huxelrebe1                                           pass    
 examine-italia0                                              pass    
 examine-arndale-lakeside                                     pass    
 examine-laxton0                                              pass    
 examine-laxton1                                              pass    
 examine-arndale-metrocentre                                  pass    
 examine-cubietruck-metzinger                                 pass    
 examine-cubietruck-picasso                                   pass    
 examine-pinot0                                               pass    
 examine-pinot1                                               pass    
 examine-rimava1                                              pass    
 examine-rochester0                                           starved 
 examine-rochester1                                           pass    
 examine-arndale-westfield                                    pass    


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


Push not applicable.


