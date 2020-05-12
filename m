Return-Path: <SRS0=FkqA=62=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E82CC54E4A
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 10:59:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E8E720675
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 10:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E8E720675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYScd-00080V-0I; Tue, 12 May 2020 10:58:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYScb-00080Q-2A
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 10:58:49 +0000
X-Inumbo-ID: 8e341eaa-943f-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e341eaa-943f-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 10:58:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DBFF4ABB2;
 Tue, 12 May 2020 10:58:49 +0000 (UTC)
To: Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: use of "stat -"
Message-ID: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
Date: Tue, 12 May 2020 12:58:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

now that I've been able to do a little bit of work from the office
again, I've run into a regression from b72682c602b8 "scripts: Use
stat to check lock claim". On one of my older machines I've noticed
guests wouldn't launch anymore, which I've tracked down to the
system having an old stat on it. Yes, the commit says the needed
behavior has been available since 2009, but please let's not forget
that we continue to support building with tool chains from about
2007.

Putting in place and using newer tool chain versions without
touching the base distro is pretty straightforward. Replacing the
coreutils package isn't, and there's not even an override available
by which one could point at an alternative one. Hence I think
bumping the minimum required versions of basic tools should be
done even more carefully than bumping required tool chain versions
(which we've not dared to do in years). After having things
successfully working again with a full revert, I'm now going to
experiment with adapting behavior to stat's capabilities. Would
something like that be acceptable (if it works out)?

Jan

