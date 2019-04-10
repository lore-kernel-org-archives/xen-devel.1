From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/mem-sharing: statically initialize
 audit list head and lock
Date: Wed, 10 Apr 2019 07:23:43 -0600
Message-ID: <CABfawhnL+rXfZnFLYQ_444_o5PeHCW_FREqKGXsZ4onaGAO7Gg@mail.gmail.com>
References: <5CADCC40020000780022621E@prv1-mh.provo.novell.com>
 <2930e42d-5ba2-abb7-0dd7-c9dabfc7ddfe@citrix.com>
 <4382b3ef-83e3-472d-0713-152a6192de6f@citrix.com>
 <5CADDEF0020000780022635A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JgJP=SM=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEDEG-00010Q-3q
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 13:25:28 +0000
Received: by mail-wm1-f52.google.com with SMTP id z11so2629166wmi.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2019 06:24:22 -0700 (PDT)
In-Reply-To: <5CADDEF0020000780022635A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgNjoxNyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDEwLjA0LjE5IGF0IDEzOjIwLCA8Z2VvcmdlLmR1bmxh
cEBjaXRyaXguY29tPiB3cm90ZToKPiA+IE9uIDQvMTAvMTkgMTI6MTMgUE0sIEFuZHJldyBDb29w
ZXIgd3JvdGU6Cj4gPj4gT24gMTAvMDQvMjAxOSAxMTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4g
Pj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBleGVjdXRlIGFueSBpbnN0cnVjdGlvbnMgZm9yIGRvaW5n
IHNvLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gPj4+IC0tLQo+ID4+PiBJIHdvbmRlciB3aGV0aGVyIG1lbV9zaGFyaW5nX2luaXQo
KSBzaG91bGRuJ3QgZ28gYXdheSBhbHRvZ2V0aGVyIHRoZW4uCj4gPj4KPiA+PiBJIHZvdGUgZm9y
IHJlbW92aW5nIGl0IGNvbXBsZXRlbHkuICBUaGUgcHJpbnRrIGlzIGEgb3V0LW9mLWNoYXJhY3Rl
cgo+ID4+IGNvbXBhcmVkIHRvIG90aGVyIHN1YnN5c3RlbXMgaW4gWGVuLgo+ID4KPiA+ICsxCj4K
PiBJbiBhbnkgZXZlbnQgSSdsbCB3YWl0IGZvciBUYW1hcydlcyBvcGluaW9uLiBUaGVyZSBtaWdo
dCBiZSBwbGFucyB0byBwdXQKPiBmdXJ0aGVyIG1lYXQgaW50byB0aGUgZnVuY3Rpb24sIGFmdGVy
IGFsbC4KCisxIGZyb20gbWUgdG9vLCBubyBwbGFucyBvbiBhZGRpbmcgc3R1ZmYgaGVyZS4KClRo
YW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
