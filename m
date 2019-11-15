Return-Path: <SRS0=w8Ow=ZH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8108BC432C3
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 15:27:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B0F02073A
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 15:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B0F02073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdV3-0004rD-0l; Fri, 15 Nov 2019 15:27:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVdV2-0004r5-25
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:27:04 +0000
X-Inumbo-ID: 5f214f58-07bc-11ea-a275-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f214f58-07bc-11ea-a275-12813bfff9fa;
 Fri, 15 Nov 2019 15:27:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9703EB9E0;
 Fri, 15 Nov 2019 15:27:01 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <1573828317.2460.0@crc.id.au>
 <c8ee22b9-5823-a362-4ca3-e7bcec105b99@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd43f974-5915-c2d5-a019-ec1adc8597b3@suse.com>
Date: Fri, 15 Nov 2019 16:27:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c8ee22b9-5823-a362-4ca3-e7bcec105b99@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxNjowNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBGVFIsIHBsZWFzZSBh
dm9pZCB0b3AtcG9zdGluZy4gOi0pCj4gCj4gT24gMTEvMTUvMTkgMjozMSBQTSwgU3RldmVuIEhh
aWdoIHdyb3RlOgo+PiBKdXN0IHJlZ2FyZGluZyB0aGUgdXNlIG9mIGEgc3lzdGVtIGVudmlyb25t
ZW50IHZhcmlhYmxlIHRvIHR1cm4gdGhpcwo+PiBmZWF0dXJlIC8gYnVnZml4IC8gaGFjayBvbiBh
bmQgb2ZmIC0gdGhpcyB3b3VsZCBwcm9iYWJseSBicmVhayBzdGFydGluZwo+PiB0aGUgVk0gdmlh
IHRoZSB4ZW5kb21haW5zIHNjcmlwdC4KPj4KPj4gSWYgdGhlIFZNIGRlZmluaXRpb24gaXMgaW4g
L2V0Yy94ZW4vYXV0by8sIHRoZW4gdGhlcmUgd291bGQgYmUgbm90aGluZwo+PiB0byBzZXQgdGhl
IGVudmlyb25tZW50IHZhcmlhYmxlIGJlZm9yZSB0aGUgVk0gaXMgbGF1bmNoZWQgLSBoZW5jZSBp
dAo+PiB3b3VsZCBub3QgYmUgYXBwbGllZCBhbmQgYSBndWVzdCBjcmFzaCB3b3VsZCBvY2N1ci4u
Lgo+Pgo+PiBEZXBlbmRpbmcgb24gdGhlIFZNJ3Mgc2V0dGluZ3MsIHRoaXMgd291bGQgZWl0aGVy
IGNvbnRpbnVlIHRvIHN0YXJ0ICYKPj4gY3Jhc2ggLSBvciBqdXN0IHN0b3AgYWdhaW4gdW50aWwg
aXQgY291bGQgYmUgc3RhcnRlZCB3aXRoIHRoZSBFTlYgdmFyaWFibGUuCj4gCj4gUmlnaHQuICBT
byBhIGNvdXBsZSBvZiBvcHRpb25zOgo+IAo+IDEuIFVzZXJzIG9mIHhlbmRvbWFpbnMgY291bGQg
c2V0IHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBpbiB0aGVpcgo+IHhlbmRvbWFpbnMgc2NyaXB0
Cj4gCj4gMi4gV2UgY291bGQgYWRkIGEgeGwuY2ZnIG9wdGlvbi4gIFVua25vd24geGwuY2ZnIGVu
dHJpZXMgYXJlIGlnbm9yZWQKPiAoZm9yIGJldHRlciBvciBmb3Igd29yc2UpOyBpbiB0aGUgZnV0
dXJlLCB3aGVuIHRoZSAiZmFrZSBodCIgdGhpbmcgaXMKPiByZXBsYWNlZCwgd2UgY2FuIGVpdGhl
ciBjb250aW51ZSBpZ25vcmluZyBpdCwgb3IgZ2l2ZSBhIHVzZWZ1bCBlcnJvcgo+IG1lc3NhZ2Ug
c2F5aW5nIGhvdyBpdCBzaG91bGQgYmUgY2hhbmdlZC4KPiAKPiAyYS4gIFdlIGNvdWxkIGhhdmUg
dGhlIGNvbmZpZyBvcHRpb24gKnJlcGxhY2UqIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZTsKPiBp
biB3aGljaCBjYXNlIHdlJ2QgbGVhdmUgbGlidmlydCB1c2VycyBoaWdoIGFuZCBkcnkKPiAKPiAy
Yi4gV2UgY291bGQgaGF2ZSB0aGUgY29uZmlnIG9wdGlvbiBjYXVzZSB4bCB0byAqc2V0KiB0aGUg
ZW52aXJvbm1lbnQKPiB2YXJpYWJsZSwgd2hpY2ggc2hvdWxkIGNvbnRpbnVlIHRvIGFsbG93IG90
aGVyIHRvb2xzdGFja3MgKGV2ZW4gdGhvc2UKPiBub3QgdXNpbmcgbGlieGwpIHRvIHBvdGVudGlh
bGx5IHdvcmsgYXJvdW5kIHRoZSBpc3N1ZS4KCkFuZCBob3cgd291bGQgYW55IG9mIHRoZXNlIGFs
bG93IHRvIGRlYWwgd2l0aCBoZXRlcm9nZW5lb3VzIHNldHMgb2YKZ3Vlc3RzPwoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
