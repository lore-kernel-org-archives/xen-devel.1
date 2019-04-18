Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFCAC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 19:00:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06D1214DA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 19:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozPouXPr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06D1214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHCGd-0000Fm-IA; Thu, 18 Apr 2019 19:00:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tnl2=SU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHCGc-0000Fg-5a
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 19:00:14 +0000
X-Inumbo-ID: 319ff13e-620c-11e9-a738-c3cc2954bded
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 319ff13e-620c-11e9-a738-c3cc2954bded;
 Thu, 18 Apr 2019 19:00:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A77C9214DA;
 Thu, 18 Apr 2019 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555614012;
 bh=b7adokKI46HPwjqy27l94KfVV9hyNMKCTj2fsP+Ewnc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ozPouXPr4WcDrtAii6c3pH+2PYJ/GBN16L/nO3ew+bxXLYEWxrBiiaNW0UXzLxGfL
 C3HywO3iBbvXwoS+4pa7DV2rvTB0i6yatmryG3QphgxeB4nDvPsfpsVw2SubjTw1Fw
 3tY+py9pXKELKJntv3dVJEjYQHO9KgK/2TdRiYqs=
Date: Thu, 18 Apr 2019 12:00:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <eb9dd02e-3b0d-19fc-9103-c7ceccc626ab@arm.com>
Message-ID: <alpine.DEB.2.10.1904181159440.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-6-julien.grall@arm.com>
 <2af3ed7f-00d4-2eb7-0dde-c9570578dd4e@citrix.com>
 <bac73177-1ff7-7b7c-6852-832f88707555@arm.com>
 <alpine.DEB.2.10.1904171322560.1370@sstabellini-ThinkPad-X260>
 <888ddebb-7019-45b7-aa84-9ba3cf4bfe7e@arm.com>
 <alpine.DEB.2.10.1904181131450.1370@sstabellini-ThinkPad-X260>
 <eb9dd02e-3b0d-19fc-9103-c7ceccc626ab@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 05/12] xen/arm64: bitops: Match the register
 size with the value size in flsl
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
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418190011.KvkBjCaR1KvdI7LVntpl-JvlWvOb7VRwKcV4SARxdC4@z>

T24gVGh1LCAxOCBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDE4
LzA0LzIwMTkgMTk6NDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdlZCwgMTcg
QXByIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gT24gNC8xNy8xOSA5OjI0IFBNLCBT
dGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCAyNyBNYXIgMjAxOSwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gSGksCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9uIDI3
LzAzLzIwMTkgMTk6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIDI3LzAz
LzIwMTkgMTg6NDUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiA+ID4gPiBDbGFuZyBpcyBw
aWNraWVyIHRoYW4gR0NDIGZvciB0aGUgcmVnaXN0ZXIgc2l6ZSBpbiBhc20gc3RhdGVtZW50Lgo+
ID4gPiA+ID4gPiA+IEl0Cj4gPiA+ID4gPiA+ID4gZXhwZWN0cwo+ID4gPiA+ID4gPiA+IHRoZSBy
ZWdpc3RlciBzaXplIHRvIG1hdGNoIHRoZSB2YWx1ZSBzaXplLgo+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+IFRoZSBpbnN0cnVjdGlvbiBjbHogaXMgZXhwZWN0aW5nIHRoZSB0d28gb3BlcmFu
ZHMgdG8gYmUgdGhlIHNhbWUKPiA+ID4gPiA+ID4gPiBzaXplCj4gPiA+ID4gPiA+ID4gKGkuZSAz
Mi1iaXQgb3IgNjQtYml0KS4gQXMgdGhlIGZsc2wgZnVuY3Rpb24gaXMgZGVhbGluZyB3aXRoCj4g
PiA+ID4gPiA+ID4gNjQtYml0Cj4gPiA+ID4gPiA+ID4gdmFsdWUsIHdlIG5lZWQgdG8gbWFrZSB0
aGUgZGVzdGluYXRpb24gdmFyaWFibGUgNjQtYml0IGFzIHdlbGwuCj4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gV2hpbGUgYXQgaXQsIGFkZCBhIG5ld2xpbmUgYmVmb3JlIHRoZSByZXR1cm4g
c3RhdGVtZW50Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+
ID4gPiA+ID4gICAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmggfCAzICsrLQo+
ID4gPiA+ID4gPiA+ICAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmgKPiA+ID4gPiA+ID4gPiBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vYXJtNjQvYml0b3BzLmgKPiA+ID4gPiA+ID4gPiBpbmRleCA2YmYxOTIyNjgwLi4wNTA0
NWYxMTA5IDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJt
NjQvYml0b3BzLmgKPiA+ID4gPiA+ID4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0
L2JpdG9wcy5oCj4gPiA+ID4gPiA+ID4gQEAgLTM0LDEyICszNCwxMyBAQCBzdGF0aWMgLypfXyov
YWx3YXlzX2lubGluZSB1bnNpZ25lZCBsb25nCj4gPiA+ID4gPiA+ID4gX19mZnModW5zaWduZWQg
bG9uZyB3b3JkKQo+ID4gPiA+ID4gPiA+ICAgICAgICBzdGF0aWMgaW5saW5lIGludCBmbHNsKHVu
c2lnbmVkIGxvbmcgeCkKPiA+ID4gPiA+ID4gPiAgICAgewo+ID4gPiA+ID4gPiA+IC0gICAgICAg
IGludCByZXQ7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgdWludDY0X3QgcmV0Owo+ID4gPiA+ID4g
PiA+ICAgICAgICAgICAgICAgIGlmIChfX2J1aWx0aW5fY29uc3RhbnRfcCh4KSkKPiA+ID4gPiA+
ID4gPiAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGdlbmVyaWNfZmxzbCh4KTsKPiA+ID4gPiA+
ID4gPiAgICAgICAgICAgICAgICBhc20oImNselx0JTAsICUxIiA6ICI9ciIgKHJldCkgOiAiciIg
KHgpKTsKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEFzIHggaXMgZml4ZWQgYnkgdGhlIEFCSSwg
cmV0IHNob3VsZCBiZSB1bnNpZ25lZCBsb25nIHRvIG1hdGNoLAo+ID4gPiA+ID4gPiBzdXJlbHk/
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IE5vIG5lZWQgZm9yIGl0LiBUaGUgcmVzdWx0IG9mIHRoZSBp
bnN0cnVjdGlvbiBjbHogd2lsbCBhbHdheXMgYmUKPiA+ID4gPiA+IHNtYWxsZXIKPiA+ID4gPiA+
IHRoYW4gNjQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgc3VzcGVjdCB0aGV5IHJlcXVpcmUgYSA2
NC1iaXQgcmVnaXN0ZXIganVzdCBmb3Igc2ltcGxpY2l0eSBhcyB0aGV5Cj4gPiA+ID4gPiBlbmNv
ZGUgdGhlIHNpemUgZm9yIHRoZSAyIHJlZ2lzdGVycyBpbiBvbmx5IGEgc2luZ2xlIGJpdCAoaS5l
IHNmKS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhpcyB3aWxsIGNvbXBp
bGUgYXMgaXQgaXMgYXJtNjQgc3BlY2lmaWMsIGJ1dCBpdCBsb29rcyBqdXN0IGFzCj4gPiA+ID4g
PiA+IHdyb25nCj4gPiA+ID4gPiA+IChwZXIgdGhlIGNvbW1pdCBtZXNzYWdlKSBhcyB1c2luZyBp
bnQgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4gPiA+ID4gU2VlIGFib3ZlLiBJIGNhbiBjbGFyaWZ5
IGl0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KPiA+ID4gPiAKPiA+ID4gPiBJIGFncmVlIHdpdGgg
QW5kcmV3OiBJIGNhbiBzZWUgdGhhdCB0aGUgY29kZSBpcyBjb3JyZWN0LCBidXQgaXQgcmVhbGx5
Cj4gPiA+ID4gbG9va3Mgd3JvbmcgYXQgZmlyc3Qgc2lnaHQuIFdoeSBub3QgdXNlIHVuc2lnbmVk
IGxvbmc/IFRoaXMgaXMgYW4gYXJtNjQKPiA+ID4gPiBoZWFkZXIgYW55d2F5Lgo+ID4gPiAKPiA+
ID4gV2hpbGUgdGhpcyBpcyBpbXBsZW1lbnRlZCBpbiBhcm02NCwgdGhpcyBpcyBhIGZ1bmN0aW9u
IHVzZWQgaW4gY29tbW9uCj4gPiA+IGNvZGUuLi4KPiA+ID4gU28gdGhlIHByb3RvdHlwZSB3b3Vs
ZCBoYXZlIHRvIGJlIGNoYW5nZWQgZXZlcnl3aGVyZS4KPiA+ID4gCj4gPiA+IEhvd2V2ZXIsIGFz
IEkgcG9pbnRlZCBvdXQgdGhpcyBpcyBhIGRlc2lnbiBkZWNpc2lvbiBmcm9tIEFybTY0IGFuZCBJ
IHRoaW5rCj4gPiA+IGl0Cj4gPiA+IHdvdWxkIGJlIHdyb25nIHRvIHJldHVybiB1bnNpZ25lZCBs
b25nLgo+ID4gPiAKPiA+ID4gSSBvZmZlcmVkIHRoZSBzdWdnZXN0aW9uIHRvIHVwZGF0ZSB0aGUg
Y29tbWl0IG1lc3NhZ2UuIEkgY2FuIGFsc28gYWRkIGEKPiA+ID4gY29tbWVudCBpbiB0aGUgY29k
ZS4KPiA+IAo+ID4gUmVhZGluZyB5b3VyIHJlcGx5LCBJIGFtIHByZXR0eSBzdXJlIHRoYXQgd2Ug
YXJlIHRhbGtpbmcgYWJvdXQgZGlmZmVyZW50Cj4gPiB0aGluZ3MuIEkgYWdyZWUgdGhhdCB3ZSBk
b24ndCB3YW50IHRvIGNoYW5nZSB0aGUgcHJvdG90eXBlIGV2ZXJ5d2hlcmUsCj4gPiBhcm0zMiwg
eDg2LiBJdCB3b3VsZCBiZSBnb29kIHRvIGFkZCBhIGNvbW1lbnQgdG8gdGhlIGNvZGUgb3IgdGhl
IGNvbW1pdAo+ID4gbWVzc2FnZSwgSSBsZWF2ZSBpdCB0byB5b3UuCj4gPiAKPiA+IE15IHN1Z2dl
c3Rpb24gd2FzIGJhc2ljYWxseSAiY29kZSBzdHlsZSIuIEkgb25seSBtZWFudCB0aGUgYmVsb3cu
IFRvIG1lCj4gPiBpdCBsb29rcyBuaWNlciBiZWNhdXNlIGF0IGxlYXN0IHRoZSByZXQgdmFyIGlz
IHRoZSBzYW1lIHR5cGUgb2YgdGhlCj4gPiBhcmd1bWVudCwgYW5kIGl0IGlzIG1vcmUgaW1tZWRp
YXRlbHkgb2J2aW91cyB0aGF0IHRoZSBjbHogb3BlcmF0aW9uIGlzCj4gPiBjb3JyZWN0LiBOb3Qg
YSBiaWcgZGVhbC4KPiAKPiBJIGZpbmQgcXVpdGUgYW11c2luZyB0aGF0IHlvdSBzdWdnZXN0IHRo
aXMgd2hlbiBpbiB0aGUgcGF0Y2ggIzcgeW91IG1lbnRpb24KPiB0aGUgTUlTUkEgcnVsZSAxMC4x
IHdoaWNoIGZvcmJpZCBhc3NpZ25pbmcgYSB2YWx1ZSB0byBhIG5hcnJvd2VyIHR5cGUKPiAodW5z
aWduZWQgbG9uZyAtPiBpbnQpLgo+IAo+IFJlZ2FyZGxlc3MgdGhhdCwgY2x6IG9wZXJhdGlvbiBj
bGVhcmx5IGFzayBmb3IgYSA2NC1iaXQgdmFsdWUuIFNvIHVpbnQ2NF90Cj4gbWFrZXMgbXVjaCBt
b3JlIHNlbnNlIHRoYW4gInVuc2lnbmVkIGxvbmciLiBJbiBnZW5lcmFsLCBJIGFtIGEgc3Ryb25n
IGFkdm9jYXRlCj4gdG8gdXNlIHVpbnRYX3Qgd2hlbiB0aGUgc2l6ZSBpcyBrbm93bi4gInVuc2ln
bmVkIGxvbmciIHNob3VsZCBvbmx5IGJlIHVzZWQgaW4KPiBwbGFjZSB5b3UgbmVlZCBjb21wYXQg
YmV0d2VlbiAzMi1iaXQgYW5kIDY0LWJpdCBjb2RlLgoKYWxsIHJpZ2h0LCBPSyBieSBtZQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
