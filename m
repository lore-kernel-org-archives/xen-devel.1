From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/7] xen/domain: Drop all DOMCRF_* constants
Date: Fri, 9 Mar 2018 14:16:22 +0000
Message-ID: <20180309141622.avhafg7r6mcmsic6@citrix.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-3-git-send-email-andrew.cooper3@citrix.com>
 <20180309141244.fegtnnheruwjbpqe@citrix.com>
 <c0769273-af48-6566-97cc-03d68ad9e806@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <c0769273-af48-6566-97cc-03d68ad9e806@citrix.com>
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

T24gRnJpLCBNYXIgMDksIDIwMTggYXQgMDI6MTQ6NDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwOS8wMy8xOCAxNDoxMiwgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgTWFy
IDA5LCAyMDE4IGF0IDAxOjE4OjM3UE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4g
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9uL2RvbWN0bC5jCj4g
Pj4gaW5kZXggNTBmNzQyMi4uYTczZTFhNCAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vY29tbW9uL2Rv
bWN0bC5jCj4gPj4gKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYwo+ID4+IEBAIC00OTgsNyArNDk4
LDYgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3Qp
IHVfZG9tY3RsKQo+ID4+ICAgICAgewo+ID4+ICAgICAgICAgIGRvbWlkX3QgICAgICAgIGRvbTsK
PiA+PiAgICAgICAgICBzdGF0aWMgZG9taWRfdCByb3ZlciA9IDA7Cj4gPj4gLSAgICAgICAgdW5z
aWduZWQgaW50IGRvbWNyX2ZsYWdzOwo+ID4+ICAKPiA+PiAgICAgICAgICByZXQgPSAtRUlOVkFM
Owo+ID4+ICAgICAgICAgIGlmICggKG9wLT51LmNyZWF0ZWRvbWFpbi5mbGFncyAmCj4gPj4gQEAg
LTUzMywxOSArNTMyLDggQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4
ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQo+ID4+ICAgICAgICAgICAgICByb3ZlciA9IGRvbTsKPiA+
PiAgICAgICAgICB9Cj4gPj4gIAo+ID4+IC0gICAgICAgIGRvbWNyX2ZsYWdzID0gMDsKPiA+PiAt
ICAgICAgICBpZiAoIG9wLT51LmNyZWF0ZWRvbWFpbi5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2
bV9ndWVzdCApCj4gPj4gLSAgICAgICAgICAgIGRvbWNyX2ZsYWdzIHw9IERPTUNSRl9odm07Cj4g
Pj4gLSAgICAgICAgaWYgKCBvcC0+dS5jcmVhdGVkb21haW4uZmxhZ3MgJiBYRU5fRE9NQ1RMX0NE
Rl9oYXAgKQo+ID4+IC0gICAgICAgICAgICBkb21jcl9mbGFncyB8PSBET01DUkZfaGFwOwo+ID4+
IC0gICAgICAgIGlmICggb3AtPnUuY3JlYXRlZG9tYWluLmZsYWdzICYgWEVOX0RPTUNUTF9DREZf
czNfaW50ZWdyaXR5ICkKPiA+PiAtICAgICAgICAgICAgZG9tY3JfZmxhZ3MgfD0gRE9NQ1JGX3Mz
X2ludGVncml0eTsKPiA+PiAtICAgICAgICBpZiAoIG9wLT51LmNyZWF0ZWRvbWFpbi5mbGFncyAm
IFhFTl9ET01DVExfQ0RGX29vc19vZmYgKQo+ID4+IC0gICAgICAgICAgICBkb21jcl9mbGFncyB8
PSBET01DUkZfb29zX29mZjsKPiA+PiAtICAgICAgICBpZiAoIG9wLT51LmNyZWF0ZWRvbWFpbi5m
bGFncyAmIFhFTl9ET01DVExfQ0RGX3hzX2RvbWFpbiApCj4gPj4gLSAgICAgICAgICAgIGRvbWNy
X2ZsYWdzIHw9IERPTUNSRl94c19kb21haW47Cj4gPj4gLQo+ID4gUGxlYXNlIGNvbnNpZGVyIGFk
ZGluZyBhIHRlc3QgdG8gcmVqZWN0IGZsYWdzIFhlbiBkb2Vzbid0IHJlY29nbmlzZS4KPiAKPiBU
aGVyZSBhbHJlYWR5IGlzLCBiZXR3ZWVuIHRoZXNlIHR3byBodW5rcy4gOikKPiAKClllcywgaW5k
ZWVkLgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
