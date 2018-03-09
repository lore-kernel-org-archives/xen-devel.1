From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/7] xen/domain: Drop all DOMCRF_* constants
Date: Fri, 9 Mar 2018 14:12:44 +0000
Message-ID: <20180309141244.fegtnnheruwjbpqe@citrix.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1520601522-2886-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDksIDIwMTggYXQgMDE6MTg6MzdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21jdGwuYyBiL3hlbi9jb21tb24vZG9t
Y3RsLmMKPiBpbmRleCA1MGY3NDIyLi5hNzNlMWE0IDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24v
ZG9tY3RsLmMKPiArKysgYi94ZW4vY29tbW9uL2RvbWN0bC5jCj4gQEAgLTQ5OCw3ICs0OTgsNiBA
QCBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9k
b21jdGwpCj4gICAgICB7Cj4gICAgICAgICAgZG9taWRfdCAgICAgICAgZG9tOwo+ICAgICAgICAg
IHN0YXRpYyBkb21pZF90IHJvdmVyID0gMDsKPiAtICAgICAgICB1bnNpZ25lZCBpbnQgZG9tY3Jf
ZmxhZ3M7Cj4gIAo+ICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gICAgICAgICAgaWYgKCAob3At
PnUuY3JlYXRlZG9tYWluLmZsYWdzICYKPiBAQCAtNTMzLDE5ICs1MzIsOCBAQCBsb25nIGRvX2Rv
bWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpCj4gICAg
ICAgICAgICAgIHJvdmVyID0gZG9tOwo+ICAgICAgICAgIH0KPiAgCj4gLSAgICAgICAgZG9tY3Jf
ZmxhZ3MgPSAwOwo+IC0gICAgICAgIGlmICggb3AtPnUuY3JlYXRlZG9tYWluLmZsYWdzICYgWEVO
X0RPTUNUTF9DREZfaHZtX2d1ZXN0ICkKPiAtICAgICAgICAgICAgZG9tY3JfZmxhZ3MgfD0gRE9N
Q1JGX2h2bTsKPiAtICAgICAgICBpZiAoIG9wLT51LmNyZWF0ZWRvbWFpbi5mbGFncyAmIFhFTl9E
T01DVExfQ0RGX2hhcCApCj4gLSAgICAgICAgICAgIGRvbWNyX2ZsYWdzIHw9IERPTUNSRl9oYXA7
Cj4gLSAgICAgICAgaWYgKCBvcC0+dS5jcmVhdGVkb21haW4uZmxhZ3MgJiBYRU5fRE9NQ1RMX0NE
Rl9zM19pbnRlZ3JpdHkgKQo+IC0gICAgICAgICAgICBkb21jcl9mbGFncyB8PSBET01DUkZfczNf
aW50ZWdyaXR5Owo+IC0gICAgICAgIGlmICggb3AtPnUuY3JlYXRlZG9tYWluLmZsYWdzICYgWEVO
X0RPTUNUTF9DREZfb29zX29mZiApCj4gLSAgICAgICAgICAgIGRvbWNyX2ZsYWdzIHw9IERPTUNS
Rl9vb3Nfb2ZmOwo+IC0gICAgICAgIGlmICggb3AtPnUuY3JlYXRlZG9tYWluLmZsYWdzICYgWEVO
X0RPTUNUTF9DREZfeHNfZG9tYWluICkKPiAtICAgICAgICAgICAgZG9tY3JfZmxhZ3MgfD0gRE9N
Q1JGX3hzX2RvbWFpbjsKPiAtCgpQbGVhc2UgY29uc2lkZXIgYWRkaW5nIGEgdGVzdCB0byByZWpl
Y3QgZmxhZ3MgWGVuIGRvZXNuJ3QgcmVjb2duaXNlLgoKVGhlIHJlc3QgbG9va3MgT0suCgpXZWku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
