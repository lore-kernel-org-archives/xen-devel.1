From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [GRUB PATCH 1/2] verifiers: Xen fallout cleanup
Date: Thu, 6 Dec 2018 16:40:35 +0100
Message-ID: <20181206154035.iuqtozijvnt5u5nb@tomti.i.net-space.pl>
References: <20181206134033.19884-1-daniel.kiper@oracle.com>
 <20181206134033.19884-2-daniel.kiper@oracle.com>
 <794ff5c1-2ccd-ace9-3c41-c7b6c08c198e@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TpBQ=OP=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1gUvmg-0002Qy-Gc
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 15:41:50 +0000
Content-Disposition: inline
In-Reply-To: <794ff5c1-2ccd-ace9-3c41-c7b6c08c198e@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: grub-devel@gnu.org, phcoder@gmail.com, xudong.hao@intel.com, farrah.chen@intel.com, julien.grall@arm.com, leif.lindholm@linaro.org, xen-devel@lists.xenproject.org, lee.jones@linaro.org, fu.wei@linaro.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMTA6Mzc6NDNBTSAtMDUwMCwgUm9zcyBQaGlsaXBzb24g
d3JvdGU6Cj4gT24gMTIvMDYvMjAxOCAwODo0MCBBTSwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+ID4g
WGVuIGZhbGxvdXQgY2xlYW51cCBhZnRlciBjb21taXQgY2EwYTRmNjg5ICh2ZXJpZmllcnM6IEZp
bGUgdHlwZSBmb3IKPiA+IGZpbmUtZ3JhaW5lZCBzaWduYXR1cmUtdmVyaWZpY2F0aW9uIGNvbnRy
b2xsaW5nKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgS2lwZXIgPGRhbmllbC5raXBl
ckBvcmFjbGUuY29tPgo+ID4gLS0tCj4gPiAgZ3J1Yi1jb3JlL2xvYWRlci9pMzg2L3hlbi5jIHwg
MTQgKysrKysrKy0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9ncnViLWNvcmUvbG9hZGVyL2kzODYv
eGVuLmMgYi9ncnViLWNvcmUvbG9hZGVyL2kzODYveGVuLmMKPiA+IGluZGV4IDFhOTljYTcyYy4u
OGY2NjJjOGFjIDEwMDY0NAo+ID4gLS0tIGEvZ3J1Yi1jb3JlL2xvYWRlci9pMzg2L3hlbi5jCj4g
PiArKysgYi9ncnViLWNvcmUvbG9hZGVyL2kzODYveGVuLmMKPiA+IEBAIC02NDUsMTAgKzY0NSwx
MCBAQCBncnViX2NtZF94ZW4gKGdydWJfY29tbWFuZF90IGNtZCBfX2F0dHJpYnV0ZV9fICgodW51
c2VkKSksCj4gPgo+ID4gICAgZ3J1Yl94ZW5fcmVzZXQgKCk7Cj4gPgo+ID4gLSAgZ3J1Yl9jcmVh
dGVfbG9hZGVyX2NtZGxpbmUgKGFyZ2MgLSAxLCBhcmd2ICsgMSwKPiA+IC0JCQkgICAgICAoY2hh
ciAqKSB4ZW5fc3RhdGUubmV4dF9zdGFydC5jbWRfbGluZSwKPiA+IC0JCQkgICAgICBzaXplb2Yg
KHhlbl9zdGF0ZS5uZXh0X3N0YXJ0LmNtZF9saW5lKSAtIDEpOwo+ID4gLSAgZXJyID0gZ3J1Yl92
ZXJpZnlfc3RyaW5nICh4ZW5fc3RhdGUubmV4dF9zdGFydC5jbWRfbGluZSwgR1JVQl9WRVJJRllf
TU9EVUxFX0NNRExJTkUpOwo+ID4gKyAgZXJyID0gZ3J1Yl9jcmVhdGVfbG9hZGVyX2NtZGxpbmUg
KGFyZ2MgLSAxLCBhcmd2ICsgMSwKPiA+ICsJCQkJICAgIChjaGFyICopIHhlbl9zdGF0ZS5uZXh0
X3N0YXJ0LmNtZF9saW5lLAo+ID4gKwkJCQkgICAgc2l6ZW9mICh4ZW5fc3RhdGUubmV4dF9zdGFy
dC5jbWRfbGluZSkgLSAxLAo+ID4gKwkJCQkgICAgR1JVQl9WRVJJRllfS0VSTkVMX0NNRExJTkUp
Owo+Cj4gSG93IGRpZCB0aGlzIGNvbXBpbGUgcHJldmlvdXNseSBpZiB5b3Ugd2VyZSBtaXNzaW5n
IGFuIGFyZ3VtZW50IHRvCj4gZ3J1Yl9jcmVhdGVfbG9hZGVyX2NtZGxpbmU/CgpUaGlzIGlzIG9u
bHkgYnVpbGQgaWYgeGVuIHBsYXRmb3JtIGlzIGVuYWJsZWQuIE90aGVyd2lzZSB0aGlzIGZpbGUg
aXMKbm90IHVzZWQuCgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
