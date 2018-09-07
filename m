From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] x86/idle: re-arrange dead-idle handling
Date: Fri, 7 Sep 2018 18:08:08 +0100
Message-ID: <d10cfc13-e027-b4f2-9d42-45a1085d43da@citrix.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C45502000078001D9F62@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=debd=lv=citrix.com=prvs=7814f7a92=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fyKEt-0007gO-9n
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 17:08:11 +0000
In-Reply-To: <5B61C45502000078001D9F62@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMTggMTU6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluIG9yZGVyIHRvIGJlIGFi
bGUgdG8gd2FrZSBwYXJrZWQgQ1BVcyBmcm9tIGRlZmF1bHRfZGVhZF9pZGxlKCksIHRoZQo+IGZ1
bmN0aW9uIG11c3Qgbm90IGl0c2VsZiBsb29wLiBNb3ZlIHRoZSBsb29wIGludG8gcGxheV9kZWFk
KCksIGFuZCB1c2UKPiBwbGF5X2RlYWQoKSBhcyB3ZWxsIG9uIHRoZSBBUCBib290IGVycm9yIHBh
dGguCj4KPiBGdXJ0aGVybW9yZSwgbm90IHRoZSBsZWFzdCBjb25zaWRlcmluZyB0aGUgY29tbWVu
dCBpbiBwbGF5X2RlYWQoKSwKPiBtYWtlIHN1cmUgTk1JIHJhaXNlZCAoZm9yIG5vdyB0aGlzIHdv
dWxkIGJlIGEgYnVnIGVsc2V3aGVyZSwgYnV0IHRoYXQncwo+IGFib3V0IHRvIGNoYW5nZSkgYWdh
aW5zdCBhIHBhcmtlZCBvciBmdWxseSBvZmZsaW5lIENQVSB3b24ndCBpbnZva2UgdGhlCj4gYWN0
dWFsLCBmdWxsLWJsb3duIE5NSSBoYW5kbGVyLgoKSSdtIGNvbmNlcm5lZCBieSB0aGlzLsKgIEl0
IGlzbid0IG5lY2Vzc2FyaWx5IGEgYnVnIGVsc2V3aGVyZSwgYmVjYXVzZQp0aGUgQ1BVIGNhbiBz
dGlsbCBwYXJ0aWNpcGF0ZSBpbiBTTU0sIGFuZCBzdGlsbCBoYXZlIHRoZSBTTU0gaGFuZGxlcgpy
YWlzZSBhbiBOTUkuCgpFcXVhbGx5LCBpdCBtYXkgc3RpbGwgYmUgYWJsZSB0byBzZXJ2aWNlICNN
QydzLCBzbyBJIGNhbid0IHNlZSBob3cgaXQgaXMKc2FmZSBmb3IgdXMgdG8gZXZlciBmcmVlIHRo
ZSBwZXJjcHUgZGF0YS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
