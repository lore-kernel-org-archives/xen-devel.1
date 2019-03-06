From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 6/9] xen/common: use DECLARE_BOUNDS as
 required
Date: Wed, 06 Mar 2019 08:37:33 -0700
Message-ID: <5C7FE93D020000780021C2DA@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-6-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u+pJ=RJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1Ybz-0006J8-W6
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 15:37:40 +0000
In-Reply-To: <1551825512-8975-6-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, ian.jackson@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE5IGF0IDIzOjM4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2NvbW1vbi9rZXJuZWwuYwo+ICsrKyBiL3hlbi9jb21tb24va2VybmVsLmMK
PiBAQCAtMzA2LDIwICszMDYsMjUgQEAgdm9pZCBhZGRfdGFpbnQodW5zaWduZWQgaW50IGZsYWcp
Cj4gICAgICB0YWludGVkIHw9IGZsYWc7Cj4gIH0KPiAgCj4gLWV4dGVybiBjb25zdCBpbml0Y2Fs
bF90IF9faW5pdGNhbGxfc3RhcnRbXSwgX19wcmVzbXBfaW5pdGNhbGxfZW5kW10sCj4gLSAgICBf
X2luaXRjYWxsX2VuZFtdOwo+ICtERUNMQVJFX0FSUkFZX0JPVU5EUyhpbml0Y2FsbCk7Cj4gK3R5
cGVkZWYgaW5pdGNhbGxfdCBwcmVzbXBfaW5pdGNhbGxfdDsKPiArREVDTEFSRV9BUlJBWV9CT1VO
RFMocHJlc21wX2luaXRjYWxsKTsKPiAgCj4gIHZvaWQgX19pbml0IGRvX3ByZXNtcF9pbml0Y2Fs
bHModm9pZCkKPiAgewo+ICAgICAgY29uc3QgaW5pdGNhbGxfdCAqY2FsbDsKPiAtICAgIGZvciAo
IGNhbGwgPSBfX2luaXRjYWxsX3N0YXJ0OyBjYWxsIDwgX19wcmVzbXBfaW5pdGNhbGxfZW5kOyBj
YWxsKysgKQo+ICsgICAgZm9yICggY2FsbCA9IF9fcHJlc21wX2luaXRjYWxsX3N0YXJ0Owo+ICsJ
CSAgcHJlc21wX2luaXRjYWxsX2x0KGNhbGwsIF9fcHJlc21wX2luaXRjYWxsX2VuZCk7Cj4gKwkJ
ICBjYWxsKysgKQoKSGFyZCB0YWJzIHNsaXBwZWQgaW4uIEFsc28gd291bGQgeW91IG1pbmQgYWRk
aW5nIHRoZSBtaXNzaW5nIGJsYW5rIGxpbmUKYWhlYWQgb2YgdGhlIG9uZSB5b3UgbW9kaWZ5PwoK
PiAgICAgICAgICAoKmNhbGwpKCk7Cj4gIH0KPiAgCj4gIHZvaWQgX19pbml0IGRvX2luaXRjYWxs
cyh2b2lkKQo+ICB7Cj4gICAgICBjb25zdCBpbml0Y2FsbF90ICpjYWxsOwo+IC0gICAgZm9yICgg
Y2FsbCA9IF9fcHJlc21wX2luaXRjYWxsX2VuZDsgY2FsbCA8IF9faW5pdGNhbGxfZW5kOyBjYWxs
KysgKQo+ICsgICAgZm9yICggY2FsbCA9IF9faW5pdGNhbGxfc3RhcnQ7Cj4gKyAgICAgICAgICBp
bml0Y2FsbF9sdChjYWxsLCBfX2luaXRjYWxsX2VuZCk7Cj4gKyAgICAgICAgICBjYWxsKysgKQoK
QWdhaW4gbm8gbmVlZCBmb3Igc3BsaXR0aW5nIHRoZSBsaW5lIGFzIGl0IHNlZW1zLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
