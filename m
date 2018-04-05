From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [for-4.11][PATCH v7 02/16] xen/arm: setup: use
 maddr_to_mfn rather than _mfn(paddr_to_pfn(...))
Date: Thu, 5 Apr 2018 12:55:33 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1804051255050.6016@sstabellini-ThinkPad-X260>
References: <20180403153251.19595-1-julien.grall@arm.com>
 <20180403153251.19595-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180403153251.19595-3-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAzIEFwciAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4gQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAKPiAgICAgQ2hhbmdlcyBpbiB2NjoK
PiAgICAgICAgIC0gUmVtb3ZlIHRoZSBqdXN0aWZpY2F0aW9uIGZyb20gdGhlIGNvbW1pdCBtZXNz
YWdlCj4gICAgICAgICAtIEFkZCBHZW9yZ2UncyByZXZpZXdlZC1ieQo+IAo+ICAgICBDaGFuZ2Vz
IGluIHY0Ogo+ICAgICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vc2V0
dXAuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNo
L2FybS9zZXR1cC5jCj4gaW5kZXggYjE3Nzk3ZGM5Ny4uMWNlNmEyNmU4NCAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gQEAg
LTI2OCw4ICsyNjgsOCBAQCB2b2lkIF9faW5pdCBkaXNjYXJkX2luaXRpYWxfbW9kdWxlcyh2b2lk
KQo+ICAgICAgICAgIGlmICggbWktPm1vZHVsZVtpXS5raW5kID09IEJPT1RNT0RfWEVOICkKPiAg
ICAgICAgICAgICAgY29udGludWU7Cj4gIAo+IC0gICAgICAgIGlmICggIW1mbl92YWxpZChfbWZu
KHBhZGRyX3RvX3BmbihzKSkpIHx8Cj4gLSAgICAgICAgICAgICAhbWZuX3ZhbGlkKF9tZm4ocGFk
ZHJfdG9fcGZuKGUpKSkpCj4gKyAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKG1hZGRyX3RvX21mbihz
KSkgfHwKPiArICAgICAgICAgICAgICFtZm5fdmFsaWQobWFkZHJfdG9fbWZuKGUpKSApCj4gICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+ICAKPiAgICAgICAgICBkdF91bnJlc2VydmVkX3JlZ2lvbnMo
cywgZSwgaW5pdF9kb21oZWFwX3BhZ2VzLCAwKTsKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
