Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD14EC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:41:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22CC2084B
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22CC2084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJbom-0000qM-VZ; Thu, 25 Apr 2019 10:41:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJbol-0000qH-1j
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:41:27 +0000
X-Inumbo-ID: ac96a6c0-6746-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ac96a6c0-6746-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 10:41:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 04:41:24 -0600
Message-Id: <5CC18ED10200007800228FAD@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 04:41:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <5C766799020000780021AA28@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904171359470.1370@sstabellini-ThinkPad-X260>
In-Reply-To: <alpine.DEB.2.10.1904171359470.1370@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425104121.M9IXZSWRF-t60oAhDyBaraKxvn8frO62k0S8kOiTpqU@z>

Pj4+IE9uIDE3LjA0LjE5IGF0IDIzOjEyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gV2VkLCAyNyBGZWIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4+PiBPbiAyNy4w
Mi4xOSBhdCAwMDowNywgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+IC0tLSBh
L3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+PiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9kb21jdGwuaAo+PiA+IEBAIC01NzEsMTIgKzU3MSwxNCBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9i
aW5kX3B0X2lycSB7Cj4+ID4gICovCj4+ID4gICNkZWZpbmUgRFBDSV9BRERfTUFQUElORyAgICAg
ICAgIDEKPj4gPiAgI2RlZmluZSBEUENJX1JFTU9WRV9NQVBQSU5HICAgICAgMAo+PiA+ICsjZGVm
aW5lIENBQ0hFQUJJTElUWV9ERVZNRU0gICAgICAwIC8qIGRldmljZSBtZW1vcnksIHRoZSBkZWZh
dWx0ICovCj4+ID4gKyNkZWZpbmUgQ0FDSEVBQklMSVRZX01FTU9SWSAgICAgIDEgLyogbm9ybWFs
IG1lbW9yeSAqLwo+PiA+ICBzdHJ1Y3QgeGVuX2RvbWN0bF9tZW1vcnlfbWFwcGluZyB7Cj4+ID4g
ICAgICB1aW50NjRfYWxpZ25lZF90IGZpcnN0X2dmbjsgLyogZmlyc3QgcGFnZSAoaHZtIGd1ZXN0
IHBoeXMgcGFnZSkgaW4gCj4gcmFuZ2UgKi8KPj4gPiAgICAgIHVpbnQ2NF9hbGlnbmVkX3QgZmly
c3RfbWZuOyAvKiBmaXJzdCBwYWdlIChtYWNoaW5lIHBhZ2UpIGluIHJhbmdlICovCj4+ID4gICAg
ICB1aW50NjRfYWxpZ25lZF90IG5yX21mbnM7ICAgLyogbnVtYmVyIG9mIHBhZ2VzIGluIHJhbmdl
ICg+MCkgKi8KPj4gPiAgICAgIHVpbnQzMl90IGFkZF9tYXBwaW5nOyAgICAgICAvKiBhZGQgb3Ig
cmVtb3ZlIG1hcHBpbmcgKi8KPj4gPiAtICAgIHVpbnQzMl90IHBhZGRpbmc7ICAgICAgICAgICAv
KiBwYWRkaW5nIGZvciA2NC1iaXQgYWxpZ25lZCBzdHJ1Y3R1cmUgKi8KPj4gPiArICAgIHVpbnQz
Ml90IGNhY2hlX3BvbGljeTsgICAgICAvKiBjYWNoZWFiaWxpdHkgb2YgdGhlIG1lbW9yeSBtYXBw
aW5nICovCj4+ID4gIH07Cj4+IAo+PiBJIGRvbid0IHRoaW5rIERFVk1FTSBhbmQgTUVNT1JZIGFy
ZSBhbnl3aGVyZSBuZWFyIGRlc2NyaXB0aXZlCj4+IGVub3VnaCwgbm9yIC0gaWYgd2Ugd2FudCBz
dWNoIGNvbnRyb2wgYW55d2F5IC0gZmxleGlibGUgZW5vdWdoLiBJCj4+IHRoaW5rIHdoYXQgeW91
IHdhbnQgaXMgdG8gYWN0dWFsbHkgc3BlY2lmeSBjYWNoYWJpbGl0eSwgYWxsb3dpbmcgb24KPj4g
eDg2IHRvIGUuZy4gbWFwIGZyYW1lIGJ1ZmZlcnMgb3IgYWxpa2UgV0MuIFRoZSBhdHRyaWJ1dGUg
dGhlbgo+PiB3b3VsZCAob2J2aW91c2x5IGFuZCBuZWNlc3NhcmlseSkgYmUgYXJjaGl0ZWN0dXJl
IHNwZWNpZmljLgo+IAo+IFllcywgSSBhZ3JlZSB3aXRoIHdoYXQgeW91IHdyb3RlLCBhbmQgYWxz
byB3aXRoIHdoYXQgSnVsaWVuIHdyb3RlLiBOb3cKPiB0aGUgcXVlc3Rpb24gaXMgaG93IGRvIHlv
dSBib3RoIHRoaW5rIHRoaXMgc2hvdWxkIGxvb2sgbGlrZSBpbiBtb3JlCj4gZGV0YWlsczoKPiAK
PiAtIGFyZSB5b3UgT0sgd2l0aCB1c2luZyBtZW1vcnlfcG9saWN5IGluc3RlYWQgb2YgY2FjaGVf
cG9saWN5IGxpa2UKPiAgIEp1bGllbidzIHN1Z2dlc3RlZCBhcyBuYW1lIGZvciB0aGUgZmllbGQ/
CgpZZXMgLSBpbiBmYWN0IGVpdGhlciBpcyBmaW5lIHRvIG1lLgoKPiAtIGFyZSB5b3UgT0sgd2l0
aCB1c2luZyAjZGVmaW5lcyBmb3IgdGhlIHZhbHVlcz8KClllcy4KCj4gLSBzaG91bGQgdGhlICNk
ZWZpbmVzIGZvciBib3RoIHg4NiBhbmQgQXJtIGJlIGRlZmluZWQgaGVyZSBvciBpbiBvdGhlcgo+
ICAgaGVhZGVycz8KCkknZCBzYXkgaGVyZSwgYnV0IEkgd291bGRuJ3Qgb2JqZWN0IHRvIHBsYWNl
bWVudCBpbiBhcmNoLQpzcGVjaWZpYyBwdWJsaWMgaGVhZGVycy4KCj4gLSB3aGF0IHZhbHVlcyB3
b3VsZCB5b3UgbGlrZSB0byBzZWUgZm9yIHg4Nj8KClVubGVzcyB5b3UgaW50ZW5kIHRvIGltcGxl
bWVudCB0aGUgZnVuY3Rpb24gZm9yIHg4NiwgSSdkCnN1Z2dlc3Qgbm90IGFkZGluZyBhbnkgeDg2
ICNkZWZpbmUtcyBhdCBhbGwgZm9yIG5vdy4KCkJ1dCBJIGFncmVlIHdpdGggSnVsaWVuIChpbiBj
YXNlIHRoaXMgd2Fzbid0IGV4cGxpY2l0IGVub3VnaCBmcm9tCm15IGVhcmxpZXIgcmVwbGF5KSB0
aGF0IGl0IGZpcnN0IG5lZWRzIHRvIGJlIGNsYXJpZmllZCB3aGV0aGVyIHN1Y2gKYW4gaW50ZXJm
YWNlIGlzIHdhbnRlZCBpbiB0aGUgZmlyc3QgcGxhY2UuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
