From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] libxc: don't fail domain creation when
 unpacking initrd fails
Date: Tue, 23 Jan 2018 06:24:20 -0700
Message-ID: <5A67459402000078001A18E7@prv-mh.provo.novell.com>
References: <5A2551C10200007800194608@prv-mh.provo.novell.com>
 <20180123105547.hol5cqlsnnibd62t@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edyYw-0004Ev-Ds
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 13:24:30 +0000
In-Reply-To: <20180123105547.hol5cqlsnnibd62t@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDExOjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgRGVjIDA0LCAyMDE3IGF0IDA1OjQ2OjQxQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBBdCBsZWFzdCBMaW51eCBrZXJuZWxzIGhhdmUgYmVlbiBhYmxlIHRvIHdvcmsgd2l0
aCBnemlwLWVkIGluaXRyZCBmb3IKPj4gcXVpdGUgc29tZSB0aW1lOyBpbml0cmQgY29tcHJlc3Nl
ZCB3aXRoIG90aGVyIG1ldGhvZHMgYXJlbid0IGV2ZW4gYmVpbmcKPj4gYXR0ZW1wdGVkIHRvIHVu
cGFjay4gRnVydGhlcm1vcmUgdGhlIHVuemlwLWluZyByb3V0aW5lIHVzZWQgaGVyZSBpc24ndAo+
PiBjYXBhYmxlIG9mIGRlYWxpbmcgd2l0aCB2YXJpb3VzIGZvcm1zIG9mIGNvbmNhdGVuYXRlZCBm
aWxlcywgZWFjaCBvZgo+PiB3aGljaCB3YXMgZ3ppcC1lZCBzZXBhcmF0ZWx5IChpdCBpcyB0aGlz
IHBhcnRpY3VsYXIgY2FzZSB3aGljaCBoYXMgYmVlbgo+PiB0aGUgc291cmNlIG9mIG9ic2VydmVk
IFZNIGNyZWF0aW9uIGZhaWx1cmVzKS4KPj4gCj4+IEhlbmNlLCBpZiB1bnBhY2tpbmcgZmFpbHMs
IHNpbXBseSBoYW5kIHRoZSB0aGUgY29tcHJlc3NlZCBibG9iIHRvIHRoZQo+PiBndWVzdCBhcyBp
cy4KPiAKPiBTYWRseSB0aGlzIHdpbGwgaGF2ZSB0byBiZSByZWJhc2VkIG9uIHRvcCBvZiBzdGFn
aW5nLAo+IHhjX2RvbV9idWlsZF9yYW1kaXNrIHdhcyByZW5hbWVkIHRvIHhjX2RvbV9idWlsZF9t
b2R1bGUuCgpUaGF0IHNob3VsZG4ndCBiZSBkaWZmaWN1bHQgdG8gZG8sIGJ1dCBtYWtlcyBsaXR0
bGUgc2Vuc2UgdW50aWwgSSBrbm93CkkgZG9uJ3QgbmVlZCB0byBtYWtlIG90aGVyIGNoYW5nZXMu
IE5vdGUgZm9yIGhvdyBsb25nIHRoZSBwYXRjaApoYXMgYmVlbiBwZW5kaW5nLgoKPj4gQEAgLTEw
MjAsMTEgKzEwMTUsMTggQEAgc3RhdGljIGludCB4Y19kb21fYnVpbGRfcmFtZGlzayhzdHJ1Y3Qg
eAo+PiAgICAgIGlmICggdW56aXBsZW4gKQo+PiAgICAgIHsKPj4gICAgICAgICAgaWYgKCB4Y19k
b21fZG9fZ3VuemlwKGRvbS0+eGNoLCBkb20tPnJhbWRpc2tfYmxvYiwgZG9tLT5yYW1kaXNrX3Np
emUsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICByYW1kaXNrbWFwLCByYW1kaXNr
bGVuKSA9PSAtMSApCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByYW1kaXNrbWFw
LCB1bnppcGxlbikgIT0gLTEgKQo+PiArICAgICAgICAgICAgcmV0dXJuIDA7Cj4+ICsgICAgICAg
IGlmICggZG9tLT5yYW1kaXNrX3NpemUgPiByYW1kaXNrbGVuICkKPiAKPiBBRkFJQ1QgdGhpcyB3
b3VsZCBtZWFuIHRoYXQgdGhlIG5vbi1nemlwcGVkIHJhbWRpc2sgd291bGQgYmUgYmlnZ2VyCj4g
dGhhbiB0aGUgZ3ppcHBlZCBvbmU/CgpZZXMgKGFuIGF0IGxlYXN0IHRoZW9yZXRpY2FsIHBvc3Np
YmlsaXR5KS4KCj4gVGhlIGNvZGUgTEdUTS4KClRoYW5rcywgSmFuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
