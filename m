From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 2/5] vpci: fix deferral of long operations
Date: Fri, 16 Nov 2018 15:57:42 +0100
Message-ID: <20181116145742.5zy5dwo2elogzq6q@mac>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-3-roger.pau@citrix.com>
 <5BEEB3FB02000078001FCBBB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F3fv=N3=citrix.com=prvs=8510c96a3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gNfZK-0007Xa-JJ
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 14:58:02 +0000
Content-Disposition: inline
In-Reply-To: <5BEEB3FB02000078001FCBBB@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMDU6MTE6MzlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjExLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQ3VycmVudCBsb2dpYyB0byBoYW5kbGUgbG9uZyBydW5uaW5nIG9wZXJhdGlvbnMg
aGFzIHR3byBmbGF3czoKPiA+IAo+ID4gIC0gaHZtX2lvX3BlbmRpbmcgaXMgb25seSB1c2VkIGJ5
IEludGVsIGNvZGUsIGZpeCB0aGlzIGJ5IG1vdmluZyB0aGUKPiA+ICAgIGNhbGwgdG8gdnBjaV9w
cm9jZXNzX3BlbmRpbmcgaW50byBoYW5kbGVfaHZtX2lvX2NvbXBsZXRpb24uCj4gCj4gQXMgbWVu
dGlvbmVkIGJlZm9yZSwgdGhlIHJlZmVyZW5jZSB0byBJbnRlbCBjb2RlIGlzIHdyb25nIGhlcmUu
Cj4gVGhlIG1haW4gY2FsbGVyIGlzIGhhbmRsZV9waW8oKSwgYW5kIHRoZSBJbnRlbCBzcGVjaWZp
YyBvbmUgc2l0cyBpbgo+IG5lc3RlZCBWTVggY29kZSBhbnl3YXksIHNvIGlzIG9mIGJhc2ljYWxs
eSBubyBpbnRlcmVzdCBmb3IgdGhlCj4gcHVycG9zZXMgaGVyZS4KPiAKPiA+IEBAIC0xODYsNiAr
MTgzLDkgQEAgYm9vbCBoYW5kbGVfaHZtX2lvX2NvbXBsZXRpb24oc3RydWN0IHZjcHUgKnYpCj4g
PiAgICAgIGVudW0gaHZtX2lvX2NvbXBsZXRpb24gaW9fY29tcGxldGlvbjsKPiA+ICAgICAgdW5z
aWduZWQgaW50IGlkOwo+ID4gIAo+ID4gKyAgICBpZiAoIGhhc192cGNpKGQpICYmIHZwY2lfcHJv
Y2Vzc19wZW5kaW5nKHYpICkKPiA+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPiAKPiBJIHRoaW5r
IHRoaXMgd291bGQgYmUgdGhlIGJldHRlciBwbGFjZSB0byByYWlzZSB0aGUgc2NoZWR1bGVyIHNv
ZnRpcnEuCj4gdnBjaV9wcm9jZXNzX3BlbmRpbmcoKSBzaG91bGQgaW5kaWNhdGVkIHRvIGl0cyBj
YWxsZXIganVzdCB3aGV0aGVyCj4gcHJlZW1wdGlvbiBpcyBuZWVkZWQsIGJ1dCBzaG91bGQgbm90
IGNhcmUgaG93IHRoaXMgaXMgYWN0dWFsbHkgdG8KPiBiZSBlZmZlY3RlZC4gVGhpcyBpcyBiZW5p
Z24gbm93LCBidXQgbWlnaHQgY2hhbmdlIGlmIGEgc2Vjb25kCj4gY2FsbGVyIHdvdWxkIG5lZWQg
YWRkaW5nLgoKQWNrLgoKPiA+IEBAIC0xODIsNiArMTg1LDcgQEAgc3RhdGljIHZvaWQgZGVmZXJf
bWFwKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ID4gICAgICBjdXJy
LT52cGNpLm1lbSA9IG1lbTsKPiA+ICAgICAgY3Vyci0+dnBjaS5jbWQgPSBjbWQ7Cj4gPiAgICAg
IGN1cnItPnZwY2kucm9tX29ubHkgPSByb21fb25seTsKPiA+ICsgICAgcmFpc2Vfc29mdGlycShT
Q0hFRFVMRV9TT0ZUSVJRKTsKPiA+ICB9Cj4gCj4gV2h5IGlzIHRoaXMgbmVlZGVkPyBUaGUgZGVz
Y3JpcHRpb24gZG9lc24ndCBtZW50aW9uIGl0LgoKdlBDSSBuZWVkcyB0byByYWlzZSBhIHNoY2Vk
dWxlciBzb2Z0aXJxIGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIGd1ZXN0CmZyb20gcmVzdW1pbmcg
ZXhlY3V0aW9uIGFmdGVyIGRlZmVycmluZyBhIG1hcC91bm1hcCBvcGVyYXRpb24uIFdpdGhvdXQK
dGhpcyB0aGUgZ3Vlc3QgbWlnaHQganVzdCByZXN1bWUgZXhlY3V0aW9uIHdoaWxlIGhhdmluZyBw
ZW5kaW5nIHdvcmsKaWYgdGhlcmUncyBubyBzY2hlZHVsZXIgc29mdGlycSBhbHJlYWR5IHBlbmRp
bmcuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
