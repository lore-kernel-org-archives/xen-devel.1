Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE1FC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:52:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73D8720651
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x2r2oihJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73D8720651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHC9L-0007iY-Am; Thu, 18 Apr 2019 18:52:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tnl2=SU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHC9J-0007iT-Po
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 18:52:41 +0000
X-Inumbo-ID: 240db9e4-620b-11e9-97de-bf2ff0f29328
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 240db9e4-620b-11e9-97de-bf2ff0f29328;
 Thu, 18 Apr 2019 18:52:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 837B520651;
 Thu, 18 Apr 2019 18:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555613559;
 bh=X0aTfj7vV+ZKnVhSFUonxeORAaS+TAzEY8LzB/HGmZw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=x2r2oihJpLHOIj0IlT8114mzS9BnSqfoXF1CDLNQ6bZdUi9MjEw8Up8uGKsjE75V2
 Td9UNnJk4JhOOg4geZQ+9xaAMyEwW/zsyFMc2ABJQ/XjSH+bu15F50oFdKm8G2Gz/H
 CT3Tv/o7Z20wfweckiGR/dGkuz5Z1Tj1/I7r8QNc=
Date: Thu, 18 Apr 2019 11:52:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <66c0b06a-bd34-9044-0aa4-35eee52c3d98@arm.com>
Message-ID: <alpine.DEB.2.10.1904181148300.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
 <970bfa4e-192e-967a-b211-16dee9cb7ed8@arm.com>
 <alpine.DEB.2.10.1904181104360.1370@sstabellini-ThinkPad-X260>
 <66c0b06a-bd34-9044-0aa4-35eee52c3d98@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 07/12] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418185239.SapPM8_kwZzt4S8Cm450qReGV89yfsDjf116jPL460A@z>

T24gVGh1LCAxOCBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDE4
LzA0LzIwMTkgMTk6MjMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdlZCwgMTcg
QXByIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGksCj4gPiA+IAo+ID4gPiBPbiA0
LzE3LzE5IDk6MjggUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiBPbiBXZWQs
IDI3IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiBDbGFuZyBpcyBwaWNr
aWVyIHRoYW4gR0NDIGZvciB0aGUgcmVnaXN0ZXIgc2l6ZSBpbiBhc20gc3RhdGVtZW50LiBJdAo+
ID4gPiA+ID4gZXhwZWN0cyB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUgc2l6
ZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIGFzbSBzdGF0ZW1lbnQgZXhwZWN0cyBhIDMyLWJp
dCAocmVzcC4gNjQtYml0KSB2YWx1ZSBvbiBBcm0zMgo+ID4gPiA+ID4gKHJlc3AuIEFybTY0KSB3
aGVyZWFzIHRoZSB2YWx1ZSBpcyBhIGJvb2xlYW4gKENsYW5nIGNvbnNpZGVyIHRvIGJlCj4gPiA+
ID4gPiAzMi1iaXQpLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byBpbXBvc2UgMzItYml0IHJlZ2lzdGVyIGZvciBib3RoIGFyY2hpdGVjdHVyZQo+ID4gPiA+ID4g
YnV0IHRoaXMgcmVxdWlyZSB0aGUgY29kZSB0byB1c2UgX19PUDMyLiBIb3dldmVyLCBpdCBkb2Vz
IG5vdCByZWFsbHkKPiA+ID4gPiA+IGltcHJvdmUgdGhlIGFzc2VtYmx5IGdlbmVyYXRlZC4gSW5z
dGVhZCwgcmVwbGFjZSBzd2l0Y2ggdGhlIHZhcmlhYmxlCj4gPiA+ID4gPiB0byB1c2UgcmVnaXN0
ZXJfdC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gICAgeGVuL2luY2x1
ZGUvYXNtLWFybS9jcHVlcnJhdGEuaCB8IDIgKy0KPiA+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaAo+ID4gPiA+ID4gYi94ZW4v
aW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oCj4gPiA+ID4gPiBpbmRleCA1NWRkZmRhMjcyLi44
OGVmM2NhOTM0IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVl
cnJhdGEuaAo+ID4gPiA+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaAo+
ID4gPiA+ID4gQEAgLTE0LDcgKzE0LDcgQEAgc3RhdGljIGlubGluZSBib29sIGNoZWNrX3dvcmth
cm91bmRfIyNlcnJhdHVtKHZvaWQpCj4gPiA+ID4gPiBcCj4gPiA+ID4gPiAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gPiA+ID4gICAgICAgIGVsc2UgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ICAgICAgICB7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiAtICAg
ICAgICBib29sIHJldDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ID4gPiA+ICsgICAgICAgIHJlZ2lzdGVyX3QgcmV0OyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+
ICAgICAgICAgICAgYXNtIHZvbGF0aWxlIChBTFRFUk5BVElWRSgibW92ICUwLCAjMCIsICAgICAg
ICAgICAgICAgICBcCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIm1vdiAlMCwgIzEiLCAgICAgICAgICAgICAgICAgXAo+ID4gPiA+IAo+ID4gPiA+IFRoaXMg
aXMgT0suIENvdWxkIHlvdSBwbGVhc2UgYWxzbyBjaGFuZ2UgdGhlIHJldHVybiBzdGF0ZW1lbnQg
YmVsb3c/Cj4gPiA+ID4gTWF5YmUgc29tZXRoaW5nIGxpa2U6Cj4gPiA+ID4gCj4gPiA+ID4gICAg
IHJldHVybiB1bmxpa2VseSghIXJldCk7Cj4gPiA+IFdoeT8gVGhlIGNvbXBpbGVyIHdpbGwgaW1w
bGljaXRseSBjb252ZXJ0IHRoZSBpbnQgdG8gYm9vbC4gMCB3aWxsIHR1cm4gdG8KPiA+ID4gZmFs
c2UsIGFsbCB0aGUgb3RoZXIgd2lsbCBiZSB0cnVlLgo+ID4gPiAKPiA+ID4gV2UgYWN0dWFsbHkg
YmVlbiBhY3RpdmVseSByZW1vdmluZyAhISB3aGVuIHRoZSB0eXBlIGlzIGJvb2wgKHNlZSB0aGUK
PiA+ID4gZXhhbXBsZQo+ID4gPiBpbiBnZXRfcGFnZWRfZnJhbWUgaW4gY29tbW9uL2dyYW50X3Rh
YmxlLmMpLgo+ID4gCj4gPiBSZWFsbHk/IFRvbyBiYWQsIEkgbG92ZWQgdGhlIGV4cGxpY2l0IGNv
bnZlcnNpb25zIHRvIGJvb2wuIFRoaXMgaXMgYQo+ID4gbWF0dGVyIG9mIGNvZGUgc3R5bGUsIG5v
dCBjb3JyZWN0bmVzcywgc28gdXN1YWxseSBJIHdvdWxkbid0IGNhcmUgbXVjaC4KPiA+IEJ1dCBJ
IHdlbnQgdG8gcmVhZCBNSVNSQS1DIHRvIGZpZ3VyZSBvdXQgaWYgdGhlcmUgYXJlIGFueSBkaWZm
ZXJlbmNlcwo+ID4gZnJvbSB0aGF0IHBvaW50IG9mIHZpZXcuIEZyb20gUnVsZSAxMC4zLCBpdCBs
b29rcyBsaWtlIGl0IGlzIG5vdAo+ID4gY29tcGxpYW50LCBiZWNhdXNlIHRoZXkgc2F5IHRoYXQ6
Cj4gPiAKPiA+ICAgIGJvb2xfdCBibGEgPSAwOwo+ID4gCj4gPiBpcyBub3QgTUlTUkEtQyBjb21w
bGlhbnQuIFdoaWxlOgo+ID4gCj4gPiAgICBpbnQgYyA9IDE7Cj4gPiAgICBib29sX3QgYmxhID0g
YyA9PSAwOwo+ID4gCj4gPiBpcyBjb21wbGlhbnQuIFNvLCBpZiBJIHJlYWQgdGhpcyByaWdodDoK
PiA+IAo+ID4gICAgcmV0dXJuICEhcmV0IC8vY29tcGxpYW50Cj4gPiAgICByZXR1cm4gcmV0OyAg
Ly9ub3QgY29tcGxpYW50Cj4gPiAKPiA+IEkgYW0gbm90IDEwMCUgc3VyZSB0aG91Z2guCj4gCj4g
QW5kIGlmIHlvdSByZWFkIHRoYXQgcnVsZSB0aGUgZm9sbG93aW5nIHdvdWxkIGFsc28gYmUgbm9u
LWNvbXBsaWFudAo+IAo+IGJvb2wgaXNfbm9uemVybyhpbnQgYikKPiB7Cj4gICByZXR1cm4gYjsK
PiB9CgpZZXMsIEkgdGhpbmsgeW91IGFyZSByaWdodC4KCgo+IEkga25vdyB0aGlzIGV4YW1wbGUg
aXMgcHJldHR5IGV4YWdnZXJhdGVkIGJ1dCB0aGVuIGRvZXMgaXQgbWVhbiB0aGUgZm9sbG93aW5n
Cj4gY29kZSBpcyBhbHNvIG5vbi1jb21wbGlhbnQ/Cj4gCj4gYm9vbCBpc19ub256ZXJvKGludCBi
KQo+IHsKPiAgICAgaWYgKGIpCj4gICAgICAgcmV0dXJuIHRydWU7Cj4gICAgIGVsc2UKPiAgICAg
ICByZXR1cm4gZmFsc2U7Cj4gfQo+IAo+IElmIGl0IGlzIGNvbnNpZGVyZWQgY29tcGxpYW50LCB0
aGVuIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UuCgpZZXMsIEkgdGhpbmsgdGhpcyBpcyBub3QgY29t
cGxpYW50IHRvby4gQWxzbywgZnJvbSB3aGF0IEkgaGF2ZSBiZWVuCnRvbGQsIHRoaXMgZXhhbXBs
ZSBpcyBmYW1vdXMgZm9yIGJlaW5nIG9uZSBvZiB0aGUgbW9zdCBleHRyZW1lIGV4YW1wbGVzCm9m
IE1JU1JBLUMgbm9uLWNvbXBsaWFuY2UuIEkgdGhpbmsgdGhlIGNvbXBsaWFudCB2ZXJzaW9uIHdv
dWxkIGJlOgoKYm9vbCBpc19ub256ZXJvKGludCBiKQp7CiAgICBpZiAoYiAhPSAwKQogICAgICBy
ZXR1cm4gdHJ1ZTsKICAgIGVsc2UKICAgICAgcmV0dXJuIGZhbHNlOwp9CgpUaGlzIGlzIGFsc28g
Y29tcGxpYW50OgoKYm9vbCBpc19ub256ZXJvKGludCBiKQp7CiAgICByZXR1cm4gKGIgIT0gMCk7
Cn0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
