From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] [v2] xen: avoid link error on ARM
Date: Tue, 5 Mar 2019 08:43:38 -0500
Message-ID: <35654e1a-d066-0581-749f-7e3b65023988__36152.4119902001$1551793496$gmane$org@oracle.com>
References: <20190305133057.3998926-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d/bt=RI=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h1AMT-0000Pc-Mz
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 13:44:01 +0000
In-Reply-To: <20190305133057.3998926-1-arnd@arndb.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, Paul Durrant <paul.durrant@citrix.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy81LzE5IDg6MzAgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gIAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3hlbi9wcml2Y21kLmMgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKPiBpbmRleCBi
MjRkZGFjMTYwNGIuLjI5MGI2YWNhN2UxZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi9wcml2
Y21kLmMKPiArKysgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKPiBAQCAtNzIzLDI2ICs3MjMsNiBA
QCBzdGF0aWMgbG9uZyBwcml2Y21kX2lvY3RsX3Jlc3RyaWN0KHN0cnVjdCBmaWxlICpmaWxlLCB2
b2lkIF9fdXNlciAqdWRhdGEpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAtc3RydWN0IHJlbWFw
X3BmbiB7Cj4gLQlzdHJ1Y3QgbW1fc3RydWN0ICptbTsKPiAtCXN0cnVjdCBwYWdlICoqcGFnZXM7
Cj4gLQlwZ3Byb3RfdCBwcm90Owo+IC0JdW5zaWduZWQgbG9uZyBpOwo+IC19Owo+IC0KPiAtc3Rh
dGljIGludCByZW1hcF9wZm5fZm4ocHRlX3QgKnB0ZXAsIHBndGFibGVfdCB0b2tlbiwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAo+IC0JCQl2b2lkICpkYXRhKQo+IC17Cj4gLQlzdHJ1Y3QgcmVtYXBfcGZu
ICpyID0gZGF0YTsKPiAtCXN0cnVjdCBwYWdlICpwYWdlID0gci0+cGFnZXNbci0+aV07Cj4gLQlw
dGVfdCBwdGUgPSBwdGVfbWtzcGVjaWFsKHBmbl9wdGUocGFnZV90b19wZm4ocGFnZSksIHItPnBy
b3QpKTsKPiAtCj4gLQlzZXRfcHRlX2F0KHItPm1tLCBhZGRyLCBwdGVwLCBwdGUpOwo+IC0Jci0+
aSsrOwo+IC0KPiAtCXJldHVybiAwOwo+IC19Cj4gLQo+ICBzdGF0aWMgbG9uZyBwcml2Y21kX2lv
Y3RsX21tYXBfcmVzb3VyY2Uoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgX191c2VyICp1ZGF0YSkK
PiAgewo+ICAJc3RydWN0IHByaXZjbWRfZGF0YSAqZGF0YSA9IGZpbGUtPnByaXZhdGVfZGF0YTsK
PiBAQCAtODA5LDE1ICs3ODksNyBAQCBzdGF0aWMgbG9uZyBwcml2Y21kX2lvY3RsX21tYXBfcmVz
b3VyY2Uoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgX191c2VyICp1ZGF0YSkKPiAgCQlnb3RvIG91
dDsKPiAgCj4gIAlpZiAoeGVuX2ZlYXR1cmUoWEVORkVBVF9hdXRvX3RyYW5zbGF0ZWRfcGh5c21h
cCkpIHsKPiAtCQlzdHJ1Y3QgcmVtYXBfcGZuIHIgPSB7Cj4gLQkJCS5tbSA9IHZtYS0+dm1fbW0s
Cj4gLQkJCS5wYWdlcyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhLAo+IC0JCQkucHJvdCA9IHZtYS0+
dm1fcGFnZV9wcm90LAo+IC0JCX07Cj4gLQo+IC0JCXJjID0gYXBwbHlfdG9fcGFnZV9yYW5nZShy
Lm1tLCBrZGF0YS5hZGRyLAo+IC0JCQkJCSBrZGF0YS5udW0gPDwgUEFHRV9TSElGVCwKPiAtCQkJ
CQkgcmVtYXBfcGZuX2ZuLCAmcik7Cj4gKwkJcmMgPSB4ZW5fcmVtYXBfdm1hX3JhbmdlKHZtYSwg
a2RhdGEuYWRkciwga2RhdGEubnVtIDw8IFBBR0VfU0hJRlQpOwoKSSB3b25kZXIgd2hldGhlciBk
cml2ZXJzL3hlbi94bGF0ZV9tbXUuYyBtaWdodCBiZSBhIGdvb2QgcGxhY2UgZm9yIHRoZXNlCnJv
dXRpbmVzLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
