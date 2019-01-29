From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v2 4/8] viridian: add missing context save
 helpers into synic and time modules
Date: Tue, 29 Jan 2019 06:04:35 -0700
Message-ID: <5C504F63020000780014B8E7@prv1-mh.provo.novell.com>
References: <20190108151811.19510-1-paul.durrant@citrix.com>
 <20190108151811.19510-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1goT4B-0007lD-PS
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 13:04:39 +0000
In-Reply-To: <20190108151811.19510-5-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: paul.durrant@citrix.com
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IDAxLzA4LzE5IDQ6MTgg
UE0gPj4+Cj5DdXJyZW50bHkgdGhlIHRpbWUgbW9kdWxlIGxhY2tzIHZjcHUgY29udGV4dCBzYXZl
IGhlbHBlcnMgYW5kIHRoZSBzeW5pYwo+bW9kdWxlIGxhY2tzIGRvbWFpbiBjb250ZXh0IHNhdmUg
aGVscGVycy4gVGhlc2UgaGVscGVycyBhcmUgbm90IHlldAo+cmVxdWlyZWQgYnV0IHN1YnNlcXVl
bnQgcGF0Y2hlcyB3aWxsIHJlcXVpcmUgYXQgbGVhc3Qgc29tZSBvZiB0aGVtIHNvIHRoaXMKPnBh
dGNoIGNvbXBsZXRlcyB0aGUgc2V0IHRvIGF2b2lkIGludHJvZHVjaW5nIHRoZW0gaW4gYW4gYWQt
aG9jIHdheS4KCkJ1dCB0aGV5J3JlIGludHJvZHVjZWQgd2l0aG91dCBjYWxsZXJzIC0gYXMgdGhl
eSBkbyBub3RoaW5nIHJpZ2h0IG5vdywKd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGFkZCB0aGUg
Y2FsbCBzaXRlcyByaWdodCBoZXJlLCBmb3IgdGhlbSB0byBub3QKbGF0ZXIgZ2V0IGFkZGVkIC0g
YXMgeW91IHNheSAtIGluIGFuIGFkIGhvYyB3YXk/CgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92
aXJpZGlhbi9zeW5pYy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vc3luaWMuYwpA
QCAtMTc5LDYgKzE3OSwxNyBAQCB2b2lkIHZpcmlkaWFuX3N5bmljX2xvYWRfdmNwdV9jdHh0KAog
ICAgIHYtPmFyY2guaHZtLnZpcmlkaWFuLT5hcGljX2Fzc2lzdF9wZW5kaW5nID0gY3R4dC0+YXBp
Y19hc3Npc3RfcGVuZGluZzsKIH0KIAordm9pZCB2aXJpZGlhbl9zeW5pY19zYXZlX2RvbWFpbl9j
dHh0KAorICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBodm1fdmlyaWRpYW5fZG9t
YWluX2NvbnRleHQgKmN0eHQpCit7Cit9CisKK3ZvaWQgdmlyaWRpYW5fc3luaWNfbG9hZF9kb21h
aW5fY3R4dCgKKyAgICBzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgaHZtX3ZpcmlkaWFu
X2RvbWFpbl9jb250ZXh0ICpjdHh0KQoreworfQorCisKIC8qCgpXb3VsZCB5b3UgbWluZCBhdm9p
ZGluZyB0aGUgZG91YmxlIGJsYW5rIGxvaW5lIGluc2VydGlvbiBoZXJlPwoKCkphbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
