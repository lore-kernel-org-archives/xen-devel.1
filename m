From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/7] xen/x86: support per-domain flag for
 xpti
Date: Thu, 22 Mar 2018 09:26:21 -0600
Message-ID: <5AB3D92D02000078001B5326@prv-mh.provo.novell.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ez26k-00013z-GH
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 15:26:26 +0000
In-Reply-To: <20180321125129.28539-4-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAzLjE4IGF0IDEzOjUxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiArdm9p
ZCB4cHRpX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4gK3sKPiArICAgIGlmICggIWlz
X3B2X2RvbWFpbihkKSB8fCBpc19wdl8zMmJpdF9kb21haW4oZCkgKQo+ICsgICAgICAgIHJldHVy
bjsKCkFzIHlvdSByZWx5IG9uIHRoZSB6ZXJvLWluaXRpYWxpemF0aW9uIG9mIHRoZSBmaWVsZCBo
ZXJlLCAuLi4KCj4gKyAgICBzd2l0Y2ggKCBvcHRfeHB0aSApCj4gKyAgICB7Cj4gKyAgICBjYXNl
IFhQVElfT0ZGOgo+ICsgICAgICAgIGQtPmFyY2gucHZfZG9tYWluLnhwdGkgPSBmYWxzZTsKCi4u
LiB0aGlzIGNvdWxkIGdvIGF3YXkgYXMgd2VsbC4KCj4gQEAgLTEwNTAsOCArMTA1MCw3IEBAIHZv
aWQgX19pbml0IHNtcF9wcmVwYXJlX2NwdXModW5zaWduZWQgaW50IG1heF9jcHVzKQo+ICAgICAg
ICAgIHBhbmljKCJFcnJvciAlZCBzZXR0aW5nIHVwIFBWIHJvb3QgcGFnZSB0YWJsZVxuIiwgcmMp
Owo+ICAgICAgaWYgKCBwZXJfY3B1KHJvb3RfcGd0LCAwKSApCj4gICAgICB7Cj4gLSAgICAgICAg
Z2V0X2NwdV9pbmZvKCktPnB2X2NyMyA9IF9fcGEocGVyX2NwdShyb290X3BndCwgMCkpOwo+IC0K
PiArICAgICAgICBnZXRfY3B1X2luZm8oKS0+cHZfY3IzID0gMDsKPiAgICAgICAgICAvKgo+ICAg
ICAgICAgICAqIEFsbCBlbnRyeSBwb2ludHMgd2hpY2ggbWF5IG5lZWQgdG8gc3dpdGNoIHBhZ2Ug
dGFibGVzIGhhdmUgdG8gc3RhcnQKPiAgICAgICAgICAgKiB3aXRoIGludGVycnVwdHMgb2ZmLiBS
ZS13cml0ZSB3aGF0IHB2X3RyYXBfaW5pdCgpIGhhcyBwdXQgdGhlcmUuCgpQbGVhc2UgZG9uJ3Qg
ZHJvcCB0aGUgYmxhbmsgbGluZS4KCj4gQEAgLTM2LDcgKzM4LDggQEAgc3RhdGljIGlubGluZSB2
b2lkIHB2X3ZjcHVfZGVzdHJveShzdHJ1Y3QgdmNwdSAqdikge30KPiAgc3RhdGljIGlubGluZSBp
bnQgcHZfdmNwdV9pbml0aWFsaXNlKHN0cnVjdCB2Y3B1ICp2KSB7IHJldHVybiAtRU9QTk9UU1VQ
UDsgfQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgcHZfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFp
biAqZCkge30KPiAgc3RhdGljIGlubGluZSBpbnQgcHZfZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0
IGRvbWFpbiAqZCkgeyByZXR1cm4gLUVPUE5PVFNVUFA7IH0KPiAtCj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCB4cHRpX2luaXQodm9pZCkge30KPiArc3RhdGljIGlubGluZSB2b2lkIHhwdGlfZG9tYWlu
X2luaXQoc3RydWN0IGRvbWFpbiAqZCkge30KPiAgI2VuZGlmCS8qIENPTkZJR19QViAqLwoKU2Ft
ZSBoZXJlLiBXaXRoIHRoYXQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
