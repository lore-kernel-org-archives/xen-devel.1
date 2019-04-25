From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
Date: Thu, 25 Apr 2019 04:06:31 -0600
Message-ID: <5CC186A70200007800228F49@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904151515180.29275@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJbH8-0005js-OF
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:06:42 +0000
In-Reply-To: <alpine.DEB.2.10.1904151515180.29275@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA0LjE5IGF0IDAwOjE3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gV2VkLCAxMyBNYXIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4gQEAgLTIxNSw2
ICsyMTYsOSBAQCB2b2lkIF9faHdkb21faW5pdCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21h
aW4gKmQpCj4+ID4gICAgICAgICAgLyogVXNlIHdoaWxlLWJyZWFrIHRvIGF2b2lkIGNvbXBpbGVy
IHdhcm5pbmcgKi8KPj4gPiAgICAgICAgICB3aGlsZSAoIGlvbW11X2lvdGxiX2ZsdXNoX2FsbChk
LCBmbHVzaF9mbGFncykgKQo+PiA+ICAgICAgICAgICAgICBicmVhazsKPj4gPiArI2Vsc2UKPj4g
PiArICAgICAgICByYyA9IC1FTk9TWVM7Cj4+IAo+PiAtRU9QTk9UU1VQUCBwbGVhc2UuCj4gCj4g
VGhlIHBhdGNoIGlzIGZpbmUgYnkgbWUgYW5kIEkgYW0gYWxzbyBmaW5lIHdpdGggSmFuJ3MgY29t
bWVudHMuCj4gCj4gSSBvbmx5IHdhbnQgdG8gcG9pbnQgb3V0IHRoYXQgd2UgaGF2ZW4ndCBiZWVu
IGVudGlyZWx5IGNvbnNpc3RlbnQgd2l0aAo+IC1FTk9TWVMgYW5kL29yIC1FT1BOT1RTVVBQLiBX
ZSBoYXZlIGxvdHMgb2YgcGxhY2VzIHRoYXQgcmV0dXJuIC1FTk9TWVMuCj4gU2hvdWxkIHdlIGNo
YW5nZSB0aGVtIHRvIC1FT1BOT1RTVVBQIGdvaW5nIGZvcndhcmQ/CgpJZGVhbGx5IHdlIHdvdWxk
LCBidXQgaWlyYyBhIHNtYWxsIHN0ZXAgSSBoYWQgb25jZSBtYWRlIGluIHRoYXQKZGlyZWN0aW9u
IGRpZCBmYWNlIHJlc2lzdGFuY2UuIEhlbmNlIEkndmUgY2hhbmdlZCB0byB0aGUgbW9kZQpvZiBz
aW1wbHkgdHJ5aW5nIHRvIGtlZXAgbmV3IGluc3RhbmNlcyBvZiBFTk9TWVMgYWJ1c2UgZnJvbQpn
b2luZyBpbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
