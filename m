From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86: invpcid support
Date: Fri, 2 Mar 2018 17:01:32 +0000
Message-ID: <37c82cf8-14d4-616a-ba4a-0c6022ff2a8e@citrix.com>
References: <20180302162338.21772-1-wei.liu2@citrix.com>
 <5A998E4102000078001ADFF4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=prhv=fy=citrix.com=prvs=592350325=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ero41-0003es-TT
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 17:01:45 +0000
In-Reply-To: <5A998E4102000078001ADFF4@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTY6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAzLjE4IGF0
IDE3OjIzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ICtzdGF0aWMgaW5saW5lIHZv
aWQgaW52cGNpZCh1bnNpZ25lZCBpbnQgcGNpZCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHR5cGUpCj4+ICt7Cj4+ICsgICAg
c3RydWN0IHsKPj4gKyAgICAgICAgdWludDY0X3QgcGNpZDoxMjsKPj4gKyAgICAgICAgdWludDY0
X3QgcmVzZXJ2ZWQ6NTI7Cj4+ICsgICAgICAgIHVpbnQ2NF90IGFkZHI7Cj4+ICsgICAgfSBkZXNj
ID0geyAucGNpZCA9IHBjaWQsIC5hZGRyID0gYWRkciB9Owo+PiArCj4+ICsgICAgYXNtIHZvbGF0
aWxlICgKPj4gKyNpZmRlZiBIQVZFX0FTX0lOVlBDSUQKPj4gKyAgICAgICAgICAgICAgICAgICJp
bnZwY2lkICVbZGVzY10sICVxW3R5cGVdIgo+PiArICAgICAgICAgICAgICAgICAgOiAvKiBObyBv
dXRwdXQgKi8KPj4gKyAgICAgICAgICAgICAgICAgIDogW2Rlc2NdICJtIiAoZGVzYyksIFt0eXBl
XSAiciIgKHR5cGUpCj4+ICsjZWxzZQo+PiArICAgICAgICAgICAgICAgICAgSU5WUENJRF9PUENP
REUgTU9EUk1fRUNYXzAxCj4+ICsgICAgICAgICAgICAgICAgICA6IC8qIE5vIG91dHB1dCAqLwo+
PiArICAgICAgICAgICAgICAgICAgOiAiYSIgKHR5cGUpLCAiYyIgKCZkZXNjKQo+PiArI2VuZGlm
Cj4+ICsgICAgICAgICAgICAgICAgICA6ICJtZW1vcnkiICk7Cj4gSSBjYW4gc2VlIHdoeSB5b3Ug
bmVlZCB0aGUgbWVtb3J5IGNsb2JiZXIgaW4gdGhlICNlbHNlIGNhc2UKPiAoYWxiZWl0IGV2ZW4g
dGhlcmUgaXQgY291bGQgYmUgYXZvaWRlZCBieSBhbHNvIHByb3Blcmx5IHNwZWNpZnlpbmcKPiB0
aGUgaW5wdXQpLCBidXQgd2hhdCBpcyB0aGlzIGdvb2QgZm9yIGluIHRoZSAjaWYgY2FzZT8KClRo
aXMgaXMgYSB0bGIgZmx1c2ggb3BlcmF0aW9uLsKgIEkgZG9uJ3QgdGhpbmsgYW55dGhpbmcgZ29v
ZCB3aWxsIGNvbWUKZnJvbSBoYXZpbmcgb3RoZXIgb3BlcmF0aW9ucyByZW9yZGVyZWQgYXJvdW5k
IGl0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
