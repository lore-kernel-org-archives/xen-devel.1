Return-Path: <SRS0=IXL8=37=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56058C352A3
	for <xen-devel@archiver.kernel.org>; Tue, 11 Feb 2020 09:16:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E3C420870
	for <xen-devel@archiver.kernel.org>; Tue, 11 Feb 2020 09:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E3C420870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1ReZ-0006KI-3t; Tue, 11 Feb 2020 09:16:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lVjU=37=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1ReY-0006KD-2w
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 09:16:22 +0000
X-Inumbo-ID: 2a606b04-4caf-11ea-b535-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a606b04-4caf-11ea-b535-12813bfff9fa;
 Tue, 11 Feb 2020 09:16:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 852FCACCE;
 Tue, 11 Feb 2020 09:16:19 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <cf992d6e4dd09acc48afb42d43be4a900baee189.1581362050.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f620590a-147b-eeb8-707c-72cac10753bd@suse.com>
Date: Tue, 11 Feb 2020 10:16:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <cf992d6e4dd09acc48afb42d43be4a900baee189.1581362050.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 1/5] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAyMDoyMSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFRoZSBvd25lciBk
b21haW4gb2Ygc2hhcmVkIHBhZ2VzIGlzIGRvbV9jb3csIHVzZSB0aGF0IGZvciBnZXRfcGFnZQo+
IG90aGVyd2lzZSB0aGUgZnVuY3Rpb24gZmFpbHMgdG8gcmV0dXJuIHRoZSBjb3JyZWN0IHBhZ2Ug
dW5kZXIgc29tZQo+IHNpdHVhdGlvbnMuIFRoZSBjaGVjayBpZiBkb21fY293IHNob3VsZCBiZSB1
c2VkIHdhcyBvbmx5IHBlcmZvcm1lZCBpbgo+IGEgc3Vic2V0IG9mIHVzZS1jYXNlcy4gRml4aW5n
IHRoZSBlcnJvciBhbmQgc2ltcGxpZnlpbmcgdGhlIGV4aXN0aW5nIGNoZWNrCj4gc2luY2Ugd2Ug
Y2FuJ3QgaGF2ZSBhbnkgc2hhcmVkIGVudHJpZXMgd2l0aCBkb21fY293IGJlaW5nIE5VTEwuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNv
bT4KCkkgZmluZCBpdCBxdWl0ZSBkaXNhcHBvaW50aW5nIHRoYXQgdGhlIGJsYW5rIGxpbmVzIHJl
cXVlc3RlZCB0byBiZQphZGRlZCAuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4g
KysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gQEAgLTU3NCwxMSArNTc0LDEyIEBAIHN0cnVj
dCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbigKPiAgICAgICAgICAgICAgICAgIGlm
ICggZmRvbSA9PSBOVUxMICkKPiAgICAgICAgICAgICAgICAgICAgICBwYWdlID0gTlVMTDsKPiAg
ICAgICAgICAgICAgfQo+IC0gICAgICAgICAgICBlbHNlIGlmICggIWdldF9wYWdlKHBhZ2UsIHAy
bS0+ZG9tYWluKSAmJgo+IC0gICAgICAgICAgICAgICAgICAgICAgLyogUGFnZSBjb3VsZCBiZSBz
aGFyZWQgKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICghZG9tX2NvdyB8fCAhcDJtX2lzX3No
YXJlZCgqdCkgfHwKPiAtICAgICAgICAgICAgICAgICAgICAgICAhZ2V0X3BhZ2UocGFnZSwgZG9t
X2NvdykpICkKPiAtICAgICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOwo+ICsgICAgICAgICAgICBl
bHNlCj4gKyAgICAgICAgICAgIHsKPiArICAgICAgICAgICAgICAgIHN0cnVjdCBkb21haW4gKmQg
PSAhcDJtX2lzX3NoYXJlZCgqdCkgPyBwMm0tPmRvbWFpbiA6IGRvbV9jb3c7Cj4gKyAgICAgICAg
ICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBkKSApCgouLiBhYm92ZSBoZXJlIGFuZCAuLi4K
Cj4gQEAgLTU5NCw4ICs1OTUsOSBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1fZ2V0X3BhZ2VfZnJv
bV9nZm4oCj4gICAgICBtZm4gPSBnZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuX3goZ2ZuKSwg
dCwgYSwgcSwgTlVMTCk7Cj4gICAgICBpZiAoIHAybV9pc19yYW0oKnQpICYmIG1mbl92YWxpZCht
Zm4pICkKPiAgICAgIHsKPiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkID0gIXAybV9pc19zaGFy
ZWQoKnQpID8gcDJtLT5kb21haW4gOiBkb21fY293Owo+ICAgICAgICAgIHBhZ2UgPSBtZm5fdG9f
cGFnZShtZm4pOwoKLi4uIGFib3ZlIGhlcmUgc3RpbGwgaGF2ZW4ndCBhcHBlYXJlZC4gTm8gbWF0
dGVyIHRoYXQgaXQncyBlYXN5IHRvCmRvIHNvIHdoaWxlIGNvbW1pdHRpbmcsIHdoZW4geW91IHNl
bmQgYSBuZXcgdmVyc2lvbiB5b3Ugc2hvdWxkCnJlYWxseSBhZGRyZXNzIHN1Y2ggcmVtYXJrcyB5
b3Vyc2VsZiwgSSB0aGluay4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
