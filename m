From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Thu, 8 Nov 2018 12:44:57 +0100
Message-ID: <20181108114457.4l4owo5ceyp45a3a@mac.citrite.net>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-6-roger.pau@citrix.com>
 <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
 <20181107111146.ksaemioxod3uk5p4@mac.citrite.net>
 <5BE2FF5802000078001F9313@prv1-mh.provo.novell.com>
 <20181107171517.7p34q6vjpggmzb4i@mac.citrite.net>
 <5BE4082C02000078001F97FE@prv1-mh.provo.novell.com>
 <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
 <4b3046ea-03a9-ff8d-842f-2315b92c7678@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/xu1=nt=citrix.com=prvs=843091f4c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gKikH-0002Tl-NX
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 11:45:09 +0000
Content-Disposition: inline
In-Reply-To: <4b3046ea-03a9-ff8d-842f-2315b92c7678@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMTE6NDI6MzVBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IFNvcnJ5IHRvIGp1bXAgaW4gdGhlIGNvbnZlcnNhdGlvbiBsYXRlLgo+
IAo+IE9uIDExLzgvMTggMTE6MjkgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+IFdo
eSB3b3VsZCB0aGF0IGJlPyBUaGUgZG9fc29mdGlycSgpIGludm9jYXRpb24gc2l0cyBvbiB0aGUg
ZXhpdC0KPiA+ID4gdG8tZ3Vlc3QgcGF0aCwgZXhwbGljaXRseSBhdm9pZGluZyBhbnkgc3VjaCBu
ZXN0aW5nIHVubGVzcyB0aGVyZQo+ID4gPiB3YXMgYSBkb19zb2Z0aXJxKCkgaW52b2NhdGlvbiBz
b21ld2hlcmUgaW4gYSBzb2Z0aXJxIGhhbmRsZXIuCj4gPiAKPiA+IEl0IHNpdHMgb24gYW4gZXhp
dC10by1ndWVzdCBwYXRoLCBidXQgdGhlIGZvbGxvd2luZyBjaHVuazoKPiA+IAo+ID4gcmFpc2Vf
c29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKTsKPiA+IGRvX3NvZnRpcnEoKTsKPiA+IAo+ID4gV291
bGQgcHJldmVudCB0aGUgcGF0aCBmcm9tIGV2ZXIgcmVhY2hpbmcgdGhlIGV4aXQtdG8tZ3Vlc3Qg
YW5kCj4gPiBuZXN0aW5nIG9uIGl0c2VsZiwgdW5sZXNzIHRoZSB2Q1BVIGlzIG1hcmtlZCBhcyBi
bG9ja2VkLCB3aGljaAo+ID4gcHJldmVudHMgaXQgZnJvbSBiZWluZyBzY2hlZHVsZWQgdGh1cyBh
dm9pZGluZyB0aGlzIHJlY3Vyc2lvbi4KPiAKPiBJIGNhbid0IHNlZSBob3cgdGhlIHJlY3Vyc2lv
biBjb3VsZCBoYXBwZW4gb24gQXJtLiBTbyBpcyBpdCBhbiB4ODYgaXNzdWU/CgpUaGlzIGlzIG5v
dCBhbiBpc3N1ZSB3aXRoIHRoZSBjdXJyZW50IGNvZGUsIEkgd2FzIGp1c3QgZGlzY3Vzc2luZyB3
aXRoCkphbiBob3cgdG8gcHJvcGVybHkgaW1wbGVtZW50IHZQQ0kgbG9uZyBydW5uaW5nIG9wZXJh
dGlvbnMgdGhhdCBuZWVkCnRvIGJlIHByZWVtcHRlZC4KClJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
