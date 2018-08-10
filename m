From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/hvm/emulate: make sure rep I/O
 emulation does not cross GFN boundaries
Date: Fri, 10 Aug 2018 05:59:03 -0600
Message-ID: <5B6D7E0702000078001DCF0A@prv1-mh.provo.novell.com>
References: <20180810103714.5112-1-paul.durrant@citrix.com>
 <20180810103714.5112-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=aouf=kz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fo64R-00008M-Tw
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 11:59:07 +0000
In-Reply-To: <20180810103714.5112-3-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA4LjE4IGF0IDEyOjM3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9lbXVsYXRlLmMKPiBAQCAtMTg0LDggKzE4NCwyMyBAQCBzdGF0aWMgaW50IGh2bWVtdWxf
ZG9faW8oCj4gICAgICAgICAgaHZtdHJhY2VfaW9fYXNzaXN0KCZwKTsKPiAgICAgIH0KPiAgCj4g
LSAgICB2aW8tPmlvX3JlcSA9IHA7Cj4gKyAgICAvKgo+ICsgICAgICogTWFrZSBzdXJlIHRoYXQg
d2UgdHJ1bmNhdGUgcmVwIE1NSU8gYXQgYW55IEdGTiBib3VuZGFyeS4gVGhpcyBpcwo+ICsgICAg
ICogbmVjZXNzYXJ5IHRvIGVuc3VyZSB0aGF0IHRoZSBjb3JyZWN0IGRldmljZSBtb2RlbCBpcyB0
YXJnZXR0ZWQKPiArICAgICAqIG9yIHRoYXQgd2UgY29ycmVjdGx5IGhhbmRsZSBhIHJlcCBvcCBz
cGFubmluZyBNTUlPIGFuZCBSQU0uCj4gKyAgICAgKi8KPiArICAgIGlmICggdW5saWtlbHkocC5j
b3VudCA+IDEpICYmIHAudHlwZSA9PSBJT1JFUV9UWVBFX0NPUFkgKQo+ICsgICAgewo+ICsgICAg
ICAgIHVuc2lnbmVkIGxvbmcgb2ZmID0gcC5hZGRyICYgflBBR0VfTUFTSzsKPiAgCj4gKyAgICAg
ICAgcC5jb3VudCA9IG1pbl90KHVuc2lnbmVkIGxvbmcsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgIHAuY291bnQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHAuZGYgPwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAob2ZmICsgcC5zaXplKSAvIHAuc2l6ZSA6Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIChQQUdFX1NJWkUgLSBvZmYpIC8gcC5zaXplKTsKCkZvciBtaXNhbGlnbmVk
IHJlcXVlc3RzIHlvdSBuZWVkIHRvIG1ha2Ugc3VyZSBwLmNvdW50IGRvZXNuJ3QgZW5kCnVwIGFz
IHplcm8gKHdoaWNoIGNhbiBub3cgaGFwcGVuIGluIHRoZSBmb3J3YXJkcyBjYXNlKS4gT3IgZG8g
eW91CnJlbHkgb24gY2FsbGVycyAoaHZtZW11bF9kb19pb19hZGRyKCkgaW4gcGFydGljdWxhcikg
c3BsaXR0aW5nIHN1Y2gKcmVxdWVzdHMgYWxyZWFkeT8gWWV0IGluIHRoYXQgY2FzZSBpdCdzIG5v
dCBjbGVhciB0byBtZSB3aGV0aGVyCmFueXRoaW5nIG5lZWRzIGNoYW5naW5nIGhlcmUgaW4gdGhl
IGZpcnN0IHBsYWNlLiAoU2ltaWxhcmx5IGluIHRoZQpiYWNrd2FyZHMgY2FzZSBJIHRoaW5rIHRo
ZSBmaXJzdCBpdGVyYXRpb24gcmlza3MgY3Jvc3NpbmcgYSBwYWdlCmJvdW5kYXJ5LCBhbmQgdGhl
biB0aGUgYmF0Y2ggc2hvdWxkIGJlIGNsaXBwZWQgdG8gY291bnQgMS4pCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
