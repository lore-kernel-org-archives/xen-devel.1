From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] xen/domain: Drop all DOMCRF_* constants
Date: Fri, 9 Mar 2018 14:14:48 +0000
Message-ID: <c0769273-af48-6566-97cc-03d68ad9e806@citrix.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-3-git-send-email-andrew.cooper3@citrix.com>
 <20180309141244.fegtnnheruwjbpqe@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180309141244.fegtnnheruwjbpqe@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDMvMTggMTQ6MTIsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBNYXIgMDksIDIwMTgg
YXQgMDE6MTg6MzdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9uL2RvbWN0bC5jCj4+IGluZGV4IDUwZjc0
MjIuLmE3M2UxYTQgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9jb21tb24vZG9tY3RsLmMKPj4gKysrIGIv
eGVuL2NvbW1vbi9kb21jdGwuYwo+PiBAQCAtNDk4LDcgKzQ5OCw2IEBAIGxvbmcgZG9fZG9tY3Rs
KFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkKPj4gICAgICB7
Cj4+ICAgICAgICAgIGRvbWlkX3QgICAgICAgIGRvbTsKPj4gICAgICAgICAgc3RhdGljIGRvbWlk
X3Qgcm92ZXIgPSAwOwo+PiAtICAgICAgICB1bnNpZ25lZCBpbnQgZG9tY3JfZmxhZ3M7Cj4+ICAK
Pj4gICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPj4gICAgICAgICAgaWYgKCAob3AtPnUuY3JlYXRl
ZG9tYWluLmZsYWdzICYKPj4gQEAgLTUzMywxOSArNTMyLDggQEAgbG9uZyBkb19kb21jdGwoWEVO
X0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQo+PiAgICAgICAgICAg
ICAgcm92ZXIgPSBkb207Cj4+ICAgICAgICAgIH0KPj4gIAo+PiAtICAgICAgICBkb21jcl9mbGFn
cyA9IDA7Cj4+IC0gICAgICAgIGlmICggb3AtPnUuY3JlYXRlZG9tYWluLmZsYWdzICYgWEVOX0RP
TUNUTF9DREZfaHZtX2d1ZXN0ICkKPj4gLSAgICAgICAgICAgIGRvbWNyX2ZsYWdzIHw9IERPTUNS
Rl9odm07Cj4+IC0gICAgICAgIGlmICggb3AtPnUuY3JlYXRlZG9tYWluLmZsYWdzICYgWEVOX0RP
TUNUTF9DREZfaGFwICkKPj4gLSAgICAgICAgICAgIGRvbWNyX2ZsYWdzIHw9IERPTUNSRl9oYXA7
Cj4+IC0gICAgICAgIGlmICggb3AtPnUuY3JlYXRlZG9tYWluLmZsYWdzICYgWEVOX0RPTUNUTF9D
REZfczNfaW50ZWdyaXR5ICkKPj4gLSAgICAgICAgICAgIGRvbWNyX2ZsYWdzIHw9IERPTUNSRl9z
M19pbnRlZ3JpdHk7Cj4+IC0gICAgICAgIGlmICggb3AtPnUuY3JlYXRlZG9tYWluLmZsYWdzICYg
WEVOX0RPTUNUTF9DREZfb29zX29mZiApCj4+IC0gICAgICAgICAgICBkb21jcl9mbGFncyB8PSBE
T01DUkZfb29zX29mZjsKPj4gLSAgICAgICAgaWYgKCBvcC0+dS5jcmVhdGVkb21haW4uZmxhZ3Mg
JiBYRU5fRE9NQ1RMX0NERl94c19kb21haW4gKQo+PiAtICAgICAgICAgICAgZG9tY3JfZmxhZ3Mg
fD0gRE9NQ1JGX3hzX2RvbWFpbjsKPj4gLQo+IFBsZWFzZSBjb25zaWRlciBhZGRpbmcgYSB0ZXN0
IHRvIHJlamVjdCBmbGFncyBYZW4gZG9lc24ndCByZWNvZ25pc2UuCgpUaGVyZSBhbHJlYWR5IGlz
LCBiZXR3ZWVuIHRoZXNlIHR3byBodW5rcy4gOikKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
