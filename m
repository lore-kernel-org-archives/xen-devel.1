From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Fri, 9 Mar 2018 19:05:08 +0100
Message-ID: <4fb72f31-683d-1de3-db90-4788a379b0bd@suse.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
 <5AA2B67302000078001B0567@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vgtz=f7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1euMOL-0003VO-4Q
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 18:05:17 +0000
In-Reply-To: <5AA2B67302000078001B0567@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDMvMTggMTY6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA1LjAzLjE4IGF0
IDEwOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC0xMjAsMTEgKzEyMSwy
NCBAQCB1bnNpZ25lZCBpbnQgZmx1c2hfYXJlYV9sb2NhbChjb25zdCB2b2lkICp2YSwgdW5zaWdu
ZWQgaW50IGZsYWdzKQo+PiAgICAgICAgICBlbHNlCj4+ICAgICAgICAgIHsKPj4gICAgICAgICAg
ICAgIHUzMiB0ID0gcHJlX2ZsdXNoKCk7Cj4+IC0gICAgICAgICAgICB1bnNpZ25lZCBsb25nIGNy
NCA9IHJlYWRfY3I0KCk7Cj4+ICAKPj4gLSAgICAgICAgICAgIHdyaXRlX2NyNChjcjQgJiB+WDg2
X0NSNF9QR0UpOwo+PiAtICAgICAgICAgICAgYmFycmllcigpOwo+PiAtICAgICAgICAgICAgd3Jp
dGVfY3I0KGNyNCk7Cj4+ICsgICAgICAgICAgICBpZiAoICFjcHVfaGFzX2ludnBjaWQgKQo+PiAr
ICAgICAgICAgICAgewo+PiArICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgY3I0ID0gcmVh
ZF9jcjQoKTsKPj4gKwo+PiArICAgICAgICAgICAgICAgIHdyaXRlX2NyNChjcjQgJiB+WDg2X0NS
NF9QR0UpOwo+PiArICAgICAgICAgICAgICAgIGJhcnJpZXIoKTsKPj4gKyAgICAgICAgICAgICAg
ICB3cml0ZV9jcjQoY3I0KTsKPj4gKyAgICAgICAgICAgIH0KPj4gKyAgICAgICAgICAgIGVsc2UK
Pj4gKyAgICAgICAgICAgIHsKPj4gKyAgICAgICAgICAgICAgICAvKgo+PiArICAgICAgICAgICAg
ICAgICAqIFVzaW5nIGludnBjaWQgdG8gZmx1c2ggYWxsIG1hcHBpbmdzIHdvcmtzCj4+ICsgICAg
ICAgICAgICAgICAgICogcmVnYXJkbGVzcyBvZiB3aGV0aGVyIFBDSUQgaXMgZW5hYmxlZCBvciBu
b3QuCj4+ICsgICAgICAgICAgICAgICAgICogSXQgaXMgZmFzdGVyIHRoYW4gcmVhZC1tb2RpZnkt
d3JpdGUgQ1I0Lgo+PiArICAgICAgICAgICAgICAgICAqLwo+PiArICAgICAgICAgICAgICAgIGlu
dnBjaWRfZmx1c2hfYWxsKCk7Cj4+ICsgICAgICAgICAgICB9Cj4gCj4gQXMganVzdCB2YWxpZGx5
IGluZGljYXRlZCBieSBKw7xyZ2VuLCB0aGlzIGlzIHdoZXJlIG15IGNvbW1lbnQgSQo+IGdhdmUg
dG8gb25lIG9mIGhpcyBwYXRjaGVzIGFjdHVhbGx5IGJlbG9uZ3M6IFRoaXMgaXMgY29ycmVjdCBm
b3IKPiBGTFVTSF9UTEJfR0xPQkFMLCBidXQgZ29lcyB0b28gZmFyIGZvciBGTFVTSF9UTEIuCgpB
bmQgYWdhaW4gaXQgd2FzIHNvIGV2ZW4gYmVmb3JlIHRoaXMgcGF0Y2guCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
