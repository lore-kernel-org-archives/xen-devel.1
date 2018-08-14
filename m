From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/15] xen/arm: cpregs: Fix typo in the
 documentation of TTBCR
Date: Tue, 14 Aug 2018 13:39:45 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808141339400.15066@sstabellini-ThinkPad-X260>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pgrk=k5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fpg6W-0004kG-LZ
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 20:39:48 +0000
In-Reply-To: <20180716172712.20294-3-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxNiBKdWwgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKPiAtLS0KPiAgeGVuL2lu
Y2x1ZGUvYXNtLWFybS9jcHJlZ3MuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vY3ByZWdzLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwcmVncy5oCj4gaW5kZXggNGM3NGU4
MTYxYi4uMDdlNTc5MTk4MyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwcmVn
cy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jcHJlZ3MuaAo+IEBAIC0xNDEsNyArMTQx
LDcgQEAKPiAgI2RlZmluZSBIU1RSICAgICAgICAgICAgcDE1LDQsYzEsYzEsMyAgIC8qIEh5cC4g
U3lzdGVtIFRyYXAgUmVnaXN0ZXIgKi8KPiAgCj4gIC8qIENQMTUgQ1IyOiBUcmFuc2xhdGlvbiBU
YWJsZSBCYXNlIGFuZCBDb250cm9sIFJlZ2lzdGVycyAqLwo+IC0jZGVmaW5lIFRUQkNSICAgICAg
ICAgICBwMTUsMCxjMixjMCwyICAgLyogVHJhbnNsYXRhdGlvbiBUYWJsZSBCYXNlIENvbnRyb2wg
UmVnaXN0ZXIgKi8KPiArI2RlZmluZSBUVEJDUiAgICAgICAgICAgcDE1LDAsYzIsYzAsMiAgIC8q
IFRyYW5zbGF0aW9uIFRhYmxlIEJhc2UgQ29udHJvbCBSZWdpc3RlciAqLwo+ICAjZGVmaW5lIFRU
QlIwICAgICAgICAgICBwMTUsMCxjMiAgICAgICAgLyogVHJhbnNsYXRpb24gVGFibGUgQmFzZSBS
ZWcuIDAgKi8KPiAgI2RlZmluZSBUVEJSMSAgICAgICAgICAgcDE1LDEsYzIgICAgICAgIC8qIFRy
YW5zbGF0aW9uIFRhYmxlIEJhc2UgUmVnLiAxICovCj4gICNkZWZpbmUgSFRUQlIgICAgICAgICAg
IHAxNSw0LGMyICAgICAgICAvKiBIeXAuIFRyYW5zbGF0aW9uIFRhYmxlIEJhc2UgUmVnaXN0ZXIg
Ki8KPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
