Return-Path: <SRS0=Wd3Q=3Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CF0C35254
	for <xen-devel@archiver.kernel.org>; Wed,  5 Feb 2020 13:20:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0736217BA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Feb 2020 13:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0736217BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKas-0005gL-MT; Wed, 05 Feb 2020 13:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKaq-0005gE-Mm
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:19:48 +0000
X-Inumbo-ID: 2e998f50-481a-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e998f50-481a-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 13:19:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 839A5AFCD;
 Wed,  5 Feb 2020 13:19:46 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Message-ID: <3abccfcf-3609-9232-8961-b17fc7817ee1@suse.com>
Date: Wed, 5 Feb 2020 14:19:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/6] misc hardening and some cleanup
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxNDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSWxqYSBoYXMgcmVwb3J0
ZWQgYSBjb3VwbGUgb2YgaXNzdWVzIHdoaWNoIHdlcmUgb24gdGhlIGJvdW5kYXJ5IG9mCj4gbmVl
ZGluZyBhbiBYU0EsIGR1ZSB0byBzb21lIHZhZ3VlbmVzcyBvZiB0aGUgc3RhdGVtZW50cyByZXN1
bHRpbmcKPiBmcm9tIFhTQS03Ny4gVGhlIGZpcnN0IDMgcGF0Y2hlcyBoZXJlIGFkZHJlc3MgdGhl
c2UgcmVwb3J0cywgYWZ0ZXIKPiBoYXZpbmcgc2V0dGxlZCB3aXRoaW4gdGhlIFNlY3VyaXR5IFRl
YW0gdGhhdCB3ZSBjYW4ndCBmaW5kIGFueW9uZSAvCj4gYW55dGhpbmcgYWN0dWFsbHkgYmVpbmcg
cG90ZW50aWFsbHkgYWZmZWN0ZWQgaW4gcmVhbGl0eS4KPiAKPiBJbiB0aGUgY291cnNlIG9mIGF1
ZGl0aW5nIGZvciBwb3NzaWJsZSBhY3R1YWwgaXNzdWVzIHJlc3VsdGluZyBmcm9tCj4gdGhlIG1p
c3Npbmcgb3ZlcmZsb3cgY2hlY2sgYWRkcmVzc2VkIGJ5IHBhdGNoIDMsIGEgZmV3IG1vcmUgY2xl
YW51cAo+IG9wcG9ydHVuaXRpZXMgd2VyZSBub3RpY2VkLCB3aGljaCB0aGUgcmVtYWluaW5nIDMg
cGF0Y2hlcyB0YWtlIGNhcmUKPiBvZi4KPiAKPiAxOiBFRkk6IHJlLWNoZWNrIHtnZXQsc2V0fS12
YXJpYWJsZSBuYW1lIHN0cmluZ3MgYWZ0ZXIgY29weWluZyBpbgo+IDI6IEVGSTogZG9uJ3QgbGVh
ayBoZWFwIGNvbnRlbnRzIHRocm91Z2ggWEVOX0VGSV9nZXRfbmV4dF92YXJpYWJsZV9uYW1lCj4g
MzogeG1hbGxvYzogZ3VhcmQgYWdhaW5zdCBpbnRlZ2VyIG92ZXJmbG93CgpTaW5jZSB0aGVzZSB0
aHJlZSBwYXRjaGVzIGhhdmUgYmVlbiBzdWl0YWJseSBhY2stZWQsIGFuZCBzaW5jZQp0aGV5IGFs
c28gYXJlbid0IG5ldyB0byB0aGUgbWFqb3JpdHkgb2YgdGhlIFJFU1QgbWFpbnRhaW5lcnMsCkkn
bSBpbnRlbmRpbmcgdG8gY29tbWl0IHRoZW0gbm8gbGF0ZXIgdGhhbiB0b21vcnJvdywgcGVyaGFw
cwpldmVuIGJlZm9yZSBJIGxlYXZlIHRvZGF5LiBVbmxlc3MsIG9mIGNvdXJzZSwgSSBoZWFyIG9i
amVjdGlvbnMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
