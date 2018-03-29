From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 29 Mar 2018 02:35:37 -0600
Message-ID: <5ABCC17902000078001B709B@prv1-mh.provo.novell.com>
References: <20180327092655.28530-1-olaf@aepfle.de>
 <5ABCBA3502000078001B7055@prv1-mh.provo.novell.com>
 <20180329081755.GG30726@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180329081755.GG30726@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE4IGF0IDEwOjE3LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IE9uIFRo
dSwgTWFyIDI5LCBKYW4gQmV1bGljaCB3cm90ZToKPiAKPj4gPj4+IE9uIDI3LjAzLjE4IGF0IDEx
OjI2LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+PiA+ICsgICAgICAgICAgICBraHpfZGlmZiA9
IGNwdV9raHogPiBndHNjX2toeiA/Cj4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY3B1X2to
eiAtIGd0c2Nfa2h6IDogZ3RzY19raHogLSBjcHVfa2h6Owo+PiBhYnMoKSAob3Igc29tZSB2YXJp
YW50IG9mIGl0LCBsaWtlIF9fYnVpbHRpbl9hYnNsKCksIHNlZWluZyB0aGF0IHdlCj4+IGRvbid0
IGFwcGVhciB0byBoYXZlIGFueSBhYnN0cmFjdGlvbiByaWdodCBub3cpPwo+IAo+IEkgc2VlIG5v
IG90aGVyIHVzYWdlIG9mICphYnMqLiBSZWFsbHkgb3B0aW1pemUgdGhhdCBvbmUtc2hvdCBmdW5j
dGlvbj8KCldoZW4geW91IHVzZSBhYnMoKSBvciBhbGlrZSBpbiBwbGFjZXMgbGlrZSB0aGlzLCBp
dCBpcyBtb3JlIGltbWVkaWF0ZWx5Cm9idmlvdXMgdG8gdGhlIHJlYWRlciB3aGF0IHlvdSdyZSBk
b2luZy4KCj4+IGQlZAo+IAo+IEEgZm9yIGFuIHVuc2lnbmVkIHR5cGU/IEJ1dCBJIHNlZSBpdCBp
cyBkb25lIGVsc2V3aGVyZSwgc28gaXQgbXVzdCBiZQo+IGNvcnJlY3QuCgpUaGUgdHlwZSBzZWVu
IGJ5IHByaW50aygpIGlzICJpbnQiIChpLmUuIHNpZ25lZCkgZHVlIHRvIHRoZSB3YXkgQydzCmlu
dGVncmFsIHR5cGUgcHJvbW90aW9ucyB3b3JrLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
