From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: fix build after f20a6e309
Date: Mon, 9 Apr 2018 10:30:00 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1804091029510.18448@sstabellini-ThinkPad-X260>
References: <20180409134949.13032-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5d38=g6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f5acM-0005m7-2D
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 17:30:10 +0000
In-Reply-To: <20180409134949.13032-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA5IEFwciAyMDE4LCBXZWkgTGl1IHdyb3RlOgo+IENvbW1pdCBmMjBhNmUzMDkgcmVt
b3ZlZCBhIHBhcmFtZXRlciBmcm9tIHNtcF9wcmVwYXJlX2NwdXMgYnV0IG9ubHkKPiB0aGUgeDg2
IHBhcnRzIHdlcmUgc3VibWl0dGVkIGFuZCBjb21taXR0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+IC0tLQo+IENjOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgfCAyICstCj4g
IHhlbi9hcmNoL2FybS9zbXBib290LmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
c2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gaW5kZXggNmU0OWU4ZmQxZi4uMWQ2ZjZi
ZjM3ZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNo
L2FybS9zZXR1cC5jCj4gQEAgLTgwNCw3ICs4MDQsNyBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4o
dW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAo+ICAgICAgbG9jYWxfaXJxX2VuYWJsZSgp
Owo+ICAgICAgbG9jYWxfYWJvcnRfZW5hYmxlKCk7Cj4gIAo+IC0gICAgc21wX3ByZXBhcmVfY3B1
cyhjcHVzKTsKPiArICAgIHNtcF9wcmVwYXJlX2NwdXMoKTsKPiAgCj4gICAgICBpbml0aWFsaXpl
X2tleXRhYmxlKCk7Cj4gIAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc21wYm9vdC5jIGIv
eGVuL2FyY2gvYXJtL3NtcGJvb3QuYwo+IGluZGV4IDYyZjc5NWY2OGUuLmIyMTE2ZjBkMmQgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9z
bXBib290LmMKPiBAQCAtMjgzLDcgKzI4Myw3IEBAIHNtcF9nZXRfbWF4X2NwdXMgKHZvaWQpCj4g
IH0KPiAgCj4gIHZvaWQgX19pbml0Cj4gLXNtcF9wcmVwYXJlX2NwdXMgKHVuc2lnbmVkIGludCBt
YXhfY3B1cykKPiArc21wX3ByZXBhcmVfY3B1cyh2b2lkKQo+ICB7Cj4gICAgICBjcHVtYXNrX2Nv
cHkoJmNwdV9wcmVzZW50X21hcCwgJmNwdV9wb3NzaWJsZV9tYXApOwo+ICAKPiAtLSAKPiAyLjEx
LjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
