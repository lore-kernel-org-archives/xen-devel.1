Return-Path: <SRS0=lRzm=4H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E07CC34047
	for <xen-devel@archiver.kernel.org>; Wed, 19 Feb 2020 13:00:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7FE20801
	for <xen-devel@archiver.kernel.org>; Wed, 19 Feb 2020 13:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD7FE20801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4OxF-0003WY-Mv; Wed, 19 Feb 2020 12:59:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4OxE-0003WT-Fi
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:59:52 +0000
X-Inumbo-ID: b75b1450-5317-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b75b1450-5317-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 12:59:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD26AAFF0;
 Wed, 19 Feb 2020 12:59:50 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b278189-c96a-796a-1733-a3584809227f@suse.com>
Date: Wed, 19 Feb 2020 13:59:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200213113237.58795-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IERvbid0IGFsbG93
IGNwdV9ob3RwbHVnX2JlZ2luIHRvIGZhaWwgYnkgY29udmVydGluZyB0aGUgdHJ5bG9jayBpbnRv
IGEKPiBibG9ja2luZyBsb2NrIGFjcXVpc2l0aW9uLiBXcml0ZSB1c2VycyBvZiB0aGUgY3B1X2Fk
ZF9yZW1vdmVfbG9jayBhcmUKPiBsaW1pdGVkIHRvIENQVSBwbHVnL3VucGx1ZyBvcGVyYXRpb25z
LCBhbmQgY2Fubm90IGRlYWRsb2NrIGJldHdlZW4KPiB0aGVtc2VsdmVzIG9yIG90aGVyIHVzZXJz
IHRha2luZyB0aGUgbG9jayBpbiByZWFkIG1vZGUgYXMKPiBjcHVfYWRkX3JlbW92ZV9sb2NrIGlz
IGFsd2F5cyBsb2NrZWQgd2l0aCBpbnRlcnJ1cHRzIGVuYWJsZWQuIFRoZXJlCj4gYXJlIGFsc28g
bm8gb3RoZXIgbG9ja3MgdGFrZW4gZHVyaW5nIHRoZSBwbHVnL3VucGx1ZyBvcGVyYXRpb25zLgoK
SSBkb24ndCB0aGluayB0aGUgZ29hbCB3YXMgZGVhZGxvY2sgYXZvaWRhbmNlLCBidXQgcmF0aGVy
IGxpbWl0aW5nCm9mIHRoZSB0aW1lIHNwZW50IHNwaW5uaW5nIHdoaWxlIHRyeWluZyB0byBhY3F1
aXJlIHRoZSBsb2NrLCBpbgpmYXZvciBvZiBoYXZpbmcgdGhlIGNhbGxlciByZXRyeS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
