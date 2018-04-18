From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 1/9] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Wed, 18 Apr 2018 10:12:10 -0600
Message-ID: <5AD76E5A02000078001BC770@prv1-mh.provo.novell.com>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iali=hh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f8pgm-0007zY-OP
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 16:12:08 +0000
In-Reply-To: <20180418083051.8334-2-jgross@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA0LjE4IGF0IDEwOjMwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MTYwLDUgKzE2MSwyMCBAQCB1bnNpZ25lZCBpbnQgZmx1c2hfYXJlYV9sb2NhbChjb25zdCB2b2lk
ICp2YSwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICAKPiAgICAgIGxvY2FsX2lycV9yZXN0b3JlKGly
cWZsKTsKPiAgCj4gKyAgICBpZiAoIGZsYWdzICYgRkxVU0hfUk9PVF9QR1RCTCApCj4gKyAgICAg
ICAgZ2V0X2NwdV9pbmZvKCktPnJvb3RfcGd0X2NoYW5nZWQgPSB0cnVlOwo+ICsKPiAgICAgIHJl
dHVybiBmbGFnczsKPiAgfQo+ICsKPiArdm9pZCBmbHVzaF9yb290X3BndF9tYXNrKGNwdW1hc2tf
dCAqbWFzaykKCmNvbnN0Cgo+ICt7Cj4gKyAgICBpbnQgY3B1OwoKdW5zaWduZWQgaW50Cgo+ICsg
ICAgc3RydWN0IGNwdV9pbmZvICpjcHVfaW5mbzsKCkRlY2xhcmF0aW9uIGluIG1vc3QgbmFycm93
IHBvc3NpYmxlIHNjb3BlIHBsZWFzZS4KCj4gKyAgICBmb3JfZWFjaF9jcHUoY3B1LCBtYXNrKQo+
ICsgICAgewo+ICsgICAgICAgIGNwdV9pbmZvID0gKHN0cnVjdCBjcHVfaW5mbyAqKShzdGFja19i
YXNlW2NwdV0gKyBTVEFDS19TSVpFKSAtIDE7Cj4gKyAgICAgICAgY3B1X2luZm8tPnJvb3RfcGd0
X2NoYW5nZWQgPSB0cnVlOwo+ICsgICAgfQo+ICt9CgpTbyB3aHkgaXMgdGhpcyBub3Qgc2VuZGlu
ZyBhbiBJUEkgdG8gdHJpZ2dlciB0aGUgRkxVU0hfUk9PVF9QR1RCTCBwcm9jZXNzaW5nCnZpc2li
bGUgYWJvdmU/IEVzcGVjaWFsbHkgdGhlIGNhc3QgeW91IG5lZWQgaGVyZSBsb29rcyBxdWl0ZSB1
bmRlc2lyYWJsZS4gUGx1cyBJCnRoaW5rIHRoaXMgaXMgcmFjeSAoZXZlbiBpZiBxdWl0ZSB1bmxp
a2VseSB0byB0cmlnZ2VyKSB3aXRoIGEgQ1BVIGJlaW5nIGJyb3VnaHQgZG93bjoKV2hhdCBpZiBz
dGFja19iYXNlW2NwdV0gYmVjb21lcyBOVUxMIGFmdGVyIHlvdSd2ZSBmb3VuZCB0aGUgcmVzcGVj
dGl2ZSBiaXQgaW4KbWFzayBzZXQuIEVzcGVjaWFsbHkgd2hlbiBYZW4gcnVucyBpdHNlbGYgdmly
dHVhbGl6ZWQsIChhbG1vc3QpIGFyYml0cmFyaWx5IGxvbmcKcGVyaW9kcyBvZiB0aW1lIG1heSBw
YXNzIGJldHdlZW4gYW55IHR3byBpbnN0cnVjdGlvbnMuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
