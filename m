From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/xpti: don't map stack guard pages
Date: Fri, 02 Mar 2018 09:49:30 -0700
Message-ID: <5A998EAA02000078001ADFF7@prv-mh.provo.novell.com>
References: <5A996DF202000078001ADD10@prv-mh.provo.novell.com>
 <5A996F3302000078001ADD40@suse.com>
 <4a2caefc-4ad7-7e23-37aa-a500f118f879@suse.com>
 <5A99858002000078001ADF38@suse.com>
 <1923068a-6adb-6860-9cd1-e541b09bedd9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=z0cn=fy=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ernsD-000191-RN
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 16:49:33 +0000
In-Reply-To: <1923068a-6adb-6860-9cd1-e541b09bedd9@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAzLjE4IGF0IDE3OjQxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
Mi8wMy8xOCAxNzoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAyLjAzLjE4IGF0IDE2
OjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDAyLzAzLzE4IDE1OjM1LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+Pj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS5jCj4+Pj4gQEAgLTU1NzYsNiArNTU3NiwxNCBAQCB2b2lkIG1lbWd1YXJk
X3VuZ3VhcmRfc3RhY2sodm9pZCAqcCkKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
U1RBQ0tfU0laRSAtIFBSSU1BUllfU1RBQ0tfU0laRSAtIElTVF9NQVggKiBQQUdFX1NJWkUpOwo+
Pj4+ICB9Cj4+Pj4gIAo+Pj4+ICtib29sIG1lbWd1YXJkX2lzX3N0YWNrX2d1YXJkX3BhZ2UodW5z
aWduZWQgbG9uZyBhZGRyKQo+Pj4+ICt7Cj4+Pj4gKyAgICBhZGRyICY9IFNUQUNLX1NJWkUgLSAx
Owo+Pj4+ICsKPj4+PiArICAgIHJldHVybiBhZGRyID49IElTVF9NQVggKiBQQUdFX1NJWkUgJiYK
Pj4+PiArICAgICAgICAgICBhZGRyIDwgU1RBQ0tfU0laRSAtIFBSSU1BUllfU1RBQ0tfU0laRTsK
Pj4+PiArfQo+Pj4+ICsKPj4+Cj4+PiBXaGF0IGFib3V0IG1ha2luZyB1c2Ugb2YgbWVtZ3VhcmRf
aXNfc3RhY2tfZ3VhcmRfcGFnZSgpIGluCj4+PiBtZW1ndWFyZF9bdW5dZ3VhcmRfc3RhY2soKSA/
Cj4+IAo+PiBJIHdhcyBjb25zaWRlcmluZyB0aGlzIGFzIGEgZm9sbG93LXVwIHN0ZXAuCj4+IAo+
Pj4gVGhpcyB3b3VsZCBhdCBvbmNlIGVuc3VyZSB0aGUgb3RoZXIgdW51c2VkCj4+PiBwYWdlcyB3
b24ndCBiZSBhY2Nlc3NlZCBhY2NpZGVudGFsbHkgc29tZXdoZXJlLgo+PiAKPj4gSSBkb24ndCB1
bmRlcnN0YW5kIHRoaXMgcGFydCwgdGhvdWdoLgo+IAo+IFRvZGF5IG1lbWd1YXJkX2d1YXJkX3N0
YWNrKCkgdG91Y2hlcyBvbmx5IG9uZSBvZiB0aGUgdW51c2VkIHBhZ2VzLCBub3QKPiBhbGwgb2Yg
dGhlbS4KClRoYXQgd2FzIGVhcmxpZXIgdG9kYXksIGJ1dCBub3QgYW55bW9yZSBhdCB0aGUgdGlt
ZSBJIHNlbnQgdGhpcwpwYXRjaC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
