From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 03/20] xen/arm: processor: Use _BITUL
 instead of _AC(1, U) in SCTLR_ defines
Date: Fri, 3 May 2019 18:56:27 +0300
Message-ID: <450df8f5-676d-9b1d-814a-1888342bdacf@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaY4-0006ff-9x
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:56:32 +0000
Received: by mail-lj1-x242.google.com with SMTP id z26so828947ljj.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:56:30 -0700 (PDT)
In-Reply-To: <20190422164937.21350-4-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgbmV3bHkgaW50cm9kdWNlZCBtYWNybyBfQklUVUwgbWFrZXMgdGhlIGNvZGUgbW9yZSByZWFk
YWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgo+IC0tLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCB8IDE4ICsrKysr
KysrKy0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3Iu
aCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgKPiBpbmRleCBjNmY1NjQ5MGIzLi4x
YTE0M2ZiNmEzIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5oCj4gQEAgLTExNSwyMCArMTE1
LDIwIEBACj4gICAKPiAgIC8qIEJpdHMgc3BlY2lmaWMgdG8gU0NUTFJfRUwxIGZvciBBcm0zMiAq
Lwo+ICAgCj4gLSNkZWZpbmUgU0NUTFJfQTMyX0VMMV9WICAgICAoX0FDKDEsVSk8PDEzKQo+ICsj
ZGVmaW5lIFNDVExSX0EzMl9FTDFfViAgICAgX0JJVFVMKDEzKQo+ICAgCj4gICAvKiBDb21tb24g
Yml0cyBmb3IgU0NUTFJfRUx4IGZvciBBcm0zMiAqLwo+ICAgCj4gLSNkZWZpbmUgU0NUTFJfQTMy
X0VMeF9URSAgICAoX0FDKDEsVSk8PDMwKQo+IC0jZGVmaW5lIFNDVExSX0EzMl9FTHhfRkkgICAg
KF9BQygxLFUpPDwyMSkKPiArI2RlZmluZSBTQ1RMUl9BMzJfRUx4X1RFICAgIF9CSVRVTCgzMCkK
PiArI2RlZmluZSBTQ1RMUl9BMzJfRUx4X0ZJICAgIF9CSVRVTCgyMSkKPiAgIAo+ICAgLyogQ29t
bW9uIGJpdHMgZm9yIFNDVExSX0VMeCBvbiBhbGwgYXJjaGl0ZWN0dXJlcyAqLwo+IC0jZGVmaW5l
IFNDVExSX0F4eF9FTHhfRUUgICAgKF9BQygxLFUpPDwyNSkKPiAtI2RlZmluZSBTQ1RMUl9BeHhf
RUx4X1dYTiAgIChfQUMoMSxVKTw8MTkpCj4gLSNkZWZpbmUgU0NUTFJfQXh4X0VMeF9JICAgICAo
X0FDKDEsVSk8PDEyKQo+IC0jZGVmaW5lIFNDVExSX0F4eF9FTHhfQyAgICAgKF9BQygxLFUpPDwy
KQo+IC0jZGVmaW5lIFNDVExSX0F4eF9FTHhfQSAgICAgKF9BQygxLFUpPDwxKQo+IC0jZGVmaW5l
IFNDVExSX0F4eF9FTHhfTSAgICAgKF9BQygxLFUpPDwwKQo+ICsjZGVmaW5lIFNDVExSX0F4eF9F
THhfRUUgICAgX0JJVFVMKDI1KQo+ICsjZGVmaW5lIFNDVExSX0F4eF9FTHhfV1hOICAgX0JJVFVM
KDE5KQo+ICsjZGVmaW5lIFNDVExSX0F4eF9FTHhfSSAgICAgX0JJVFVMKDEyKQo+ICsjZGVmaW5l
IFNDVExSX0F4eF9FTHhfQyAgICAgX0JJVFVMKDIpCj4gKyNkZWZpbmUgU0NUTFJfQXh4X0VMeF9B
ICAgICBfQklUVUwoMSkKPiArI2RlZmluZSBTQ1RMUl9BeHhfRUx4X00gICAgIF9CSVRVTCgwKQo+
ICAgCj4gICAjZGVmaW5lIEhTQ1RMUl9CQVNFICAgICBfQUMoMHgzMGM1MTg3OCxVKQo+ICAgCj4g
CgpSZXNvbHV0aW9uIG9mIHRoZSBkaXNwdXRlIHdpdGggSmFuIGFib3V0IFtQQVRDSCAwMS8yMF0g
aXMgcmVxdWlyZWQgZmlyc3QuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
