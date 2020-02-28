Return-Path: <SRS0=X6vN=4Q=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21241C3F2D0
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 08:15:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF39E246A3
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 08:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF39E246A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7anH-0001U8-OB; Fri, 28 Feb 2020 08:14:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7anF-0001Ty-Pz
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 08:14:45 +0000
X-Inumbo-ID: 5ffa1372-5a02-11ea-98b8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ffa1372-5a02-11ea-98b8-12813bfff9fa;
 Fri, 28 Feb 2020 08:14:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1D95CAC69;
 Fri, 28 Feb 2020 08:14:43 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <640545a6-689a-6ba9-4978-a83183df2e1b@suse.com>
 <6d66b34a-b306-3f9b-2e77-4047212b2d53@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0eb7929-e7e8-9ad3-ec51-57ad49cec284@suse.com>
Date: Fri, 28 Feb 2020 09:14:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6d66b34a-b306-3f9b-2e77-4047212b2d53@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: correct handling when XT's
 prereq features are unavailable
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxNjoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNy8wMi8yMDIw
IDE0OjM0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X2luaXQuYwo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQv
aW9tbXVfaW5pdC5jCj4+IEBAIC0xMzY0LDYgKzEzNjQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBh
bWRfaW9tbXVfcHJlcGFyZV9vbmUoCj4+ICBpbnQgX19pbml0IGFtZF9pb21tdV9wcmVwYXJlKGJv
b2wgeHQpCj4+ICB7Cj4+ICAgICAgc3RydWN0IGFtZF9pb21tdSAqaW9tbXU7Cj4+ICsgICAgYm9v
bCBub194dCA9IGZhbHNlOwo+IAo+IEkgdGhpbmsgdGhlIGxvZ2ljIHdvdWxkIGJlIGVhc2llciB0
byBmb2xsb3cgaWYgdGhpcyB3YXMgaGFzX3h0LCB3aXRoCj4gaW52ZXJ0ZWQgbWVhbmluZy4KCkkn
bSBub3QgZnVsbHkgY29udmluY2VkIGl0J2xsIG1ha2UgaXQgZWFzaWVyLCBidXQgSSd2ZSBzd2l0
Y2hlZAp0aGluZ3MgYXJvdW5kLgoKPsKgIEhvd2V2ZXIuLi4KPiAKPj4gICAgICBpbnQgcmMgPSAt
RU5PREVWOwo+PiAgCj4+ICAgICAgQlVHX09OKCAhaW9tbXVfZm91bmQoKSApOwo+PiBAQCAtMTQw
MCw5ICsxNDAxLDggQEAgaW50IF9faW5pdCBhbWRfaW9tbXVfcHJlcGFyZShib29sIHh0KQo+PiAg
ICAgICAgICBpZiAoIHJjICkKPj4gICAgICAgICAgICAgIGdvdG8gZXJyb3Jfb3V0Owo+PiAgCj4+
IC0gICAgICAgIHJjID0gLUVOT0RFVjsKPj4gLSAgICAgICAgaWYgKCB4dCAmJiAoIWlvbW11LT5m
ZWF0dXJlcy5mbGRzLmdhX3N1cCB8fCAhaW9tbXUtPmZlYXR1cmVzLmZsZHMueHRfc3VwKSApCj4+
IC0gICAgICAgICAgICBnb3RvIGVycm9yX291dDsKPj4gKyAgICAgICAgaWYgKCAhaW9tbXUtPmZl
YXR1cmVzLmZsZHMuZ2Ffc3VwIHx8ICFpb21tdS0+ZmVhdHVyZXMuZmxkcy54dF9zdXAgKQo+PiAr
ICAgICAgICAgICAgbm9feHQgPSB0cnVlOwo+PiAgICAgIH0KPj4gIAo+PiAgICAgIGZvcl9lYWNo
X2FtZF9pb21tdSAoIGlvbW11ICkKPiAKPiAuLi4gdGhlIGNvbnRlbnRzIG9mIHRoaXMgbG9vcCBk
ZXBlbmRzIG9uIHRoZSBlYXJseSBleGl0IHBhdGggeW91J3ZlIGp1c3QKPiBkZWxldGVkLgo+IAo+
IEluIHRoZSBjYXNlIG9mIHgyYXBpYyBub3QgYmVpbmcgYXZhaWxhYmxlLCB3ZSdsbCBzdGlsbCBz
ZXQge2dhLHh0fV9lbiB0bwo+IHRoZSBjYWxsZXIgcmVxdWVzdGVkIHZhbHVlLgoKT2gsIGluZGVl
ZCAoYW5kIFJvZ2VyLCB0aGFuayB5b3UgdG9vIGZvciBub3RpY2luZyB0aGlzKS4gSW4gZmFjdApp
dCBleHBsYWlucyBhIGhhbmcgbGF0ZXIgZHVyaW5nIGJvb3QgdGhhdCBJIGRpZCBvYnNlcnZlLCBh
bmQgdGhhdApJIG1lYW50IHRvIGxvb2sgaW50byBsYXRlci4gVGhhdCBzYWlkLCBpbnRlcnJ1cHRz
IGZvciBEb20wIHN0aWxsCmRvbid0IHNlZW0gdG8gd29yayBxdWl0ZSByaWdodCBpbiB0aGlzIChw
YXJ0bHkgYnJva2VuKSBtb2RlIGV2ZW4Kd2l0aCB0aGlzIGZpeGVkICh0aGVyZSBhcmUgc2V2ZXJh
bCAiTm8gaXJxIGhhbmRsZXIgZm9yIHZlY3RvciIKbWVzc2FnZXMsIGFuZCBhdCB0aGUgdmVyeSBs
ZWFzdCB0aGUgZGlzayBkb2Vzbid0IHdvcmspOyBJJ2xsIHNlZQp0byBmaW5kIHRpbWUgdG8gbG9v
ayBpbnRvIHRoYXQgYXMgd2VsbCwgYnV0IEknbSBwcmV0dHkgY29udmluY2VkCml0J3MgYW4gaW5k
ZXBlbmRlbnQgaXNzdWUuIChTZWVpbmcgdGhhdCBpbnRlcnJ1cHQgcmVtYXBwaW5nIGdldHMKZW5h
YmxlZCB0aGlzIHdheSwgYW5kIHgyQVBJQyBpcyBwcmUtZW5hYmxlZCwgSSdtIHN1c3BlY3Rpbmcg
dGhpcwppcyBhbm90aGVyIGNhc2Ugd2hlcmUgd2UgbmVlZCB0byBmb3JjZSBwaHlzaWNhbCBtb2Rl
LikKCkxldCBtZSBibGFtZSB0aGlzIG9uIHRoZSBjb2xkIEknbSBmaWdodGluZywgd2hpY2ggaXNu
J3QgcXVpdGUgYmFkCmVub3VnaCB0byBzdGF5IGhvbWUsIGJ1dCB3aGljaCBhbHNvIGlzbid0IGhl
bHBmdWwuIHYyIGNvbWluZyAuLi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
