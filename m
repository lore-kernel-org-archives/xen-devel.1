Return-Path: <SRS0=vogb=5B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACD2C0044D
	for <xen-devel@archiver.kernel.org>; Mon, 16 Mar 2020 10:01:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6C1F2051A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Mar 2020 10:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6C1F2051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDmYD-0001kO-AB; Mon, 16 Mar 2020 10:00:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+XhT=5B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jDmYC-0001kG-LM
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 10:00:48 +0000
X-Inumbo-ID: 0224c12b-676d-11ea-b7e2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0224c12b-676d-11ea-b7e2-12813bfff9fa;
 Mon, 16 Mar 2020 10:00:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 12DF2AE71;
 Mon, 16 Mar 2020 10:00:47 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200313143755.31870-1-jgross@suse.com>
 <20200313143755.31870-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <02525413-9641-4d94-babd-cc10428947bc@suse.com>
Date: Mon, 16 Mar 2020 11:00:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313143755.31870-3-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/spinlocks: fix placement of
 preempt_[dis|en]able()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAxNTozNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBjYXNlIFhlbiBl
dmVyIGdhaW5zIHByZWVtcHRpb24gc3VwcG9ydCB0aGUgc3BpbmxvY2sgY29kaW5nJ3MKPiBwbGFj
ZW1lbnQgb2YgcHJlZW1wdF9kaXNhYmxlKCkgYW5kIHByZWVtcHRfZW5hYmxlKCkgc2hvdWxkIGJl
IG91dHNpZGUKPiBvZiB0aGUgbG9ja2VkIHNlY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
