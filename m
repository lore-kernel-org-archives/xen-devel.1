From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/acpi: off by one in read_acpi_id()
Date: Wed, 28 Mar 2018 13:57:20 +0200
Message-ID: <12f59a38-ac39-d62a-6951-bd8393d45f12@suse.com>
References: <20180328114747.GB29050@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=v6x5=gs=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f19hk-00073u-Hh
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 11:57:24 +0000
In-Reply-To: <20180328114747.GB29050@mwanda>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: xen-devel@lists.xenproject.org, Joao Martins <joao.m.martins@oracle.com>, kernel-janitors@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMTggMTM6NDcsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gSWYgYWNwaV9pZCBpcyA9
PSBucl9hY3BpX2JpdHMsIHRoZW4gd2UgYWNjZXNzIG9uZSBlbGVtZW50IGJleW9uZCB0aGUgZW5k
Cj4gb2YgdGhlIGFjcGlfcHNkW10gYXJyYXkgb3Igd2Ugc2V0IG9uZSBiaXQgYmV5b25kIHRoZSBl
bmQgb2YgdGhlIGJpdCBtYXAKPiB3aGVuIHdlIGRvIF9fc2V0X2JpdChhY3BpX2lkLCBhY3BpX2lk
X2NzdF9wcmVzZW50KTsKPiAKPiBGaXhlczogNTlhNTY4MDI5MTgxICgieGVuL2FjcGktcHJvY2Vz
c29yOiBDIGFuZCBQLXN0YXRlIGRyaXZlciB0aGF0IHVwbG9hZHMgc2FpZCBkYXRhIHRvIGh5cGVy
dmlzb3IuIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9y
YWNsZS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nv
ci5jIGIvZHJpdmVycy94ZW4veGVuLWFjcGktcHJvY2Vzc29yLmMKPiBpbmRleCBjODAxOTVlOGZi
ZDEuLmQyM2M5YzE1MDE5OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tYWNwaS1wcm9j
ZXNzb3IuYwo+ICsrKyBiL2RyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jCj4gQEAgLTM2
NCw3ICszNjQsNyBAQCByZWFkX2FjcGlfaWQoYWNwaV9oYW5kbGUgaGFuZGxlLCB1MzIgbHZsLCB2
b2lkICpjb250ZXh0LCB2b2lkICoqcnYpCj4gIAl9Cj4gIAkvKiBUaGVyZSBhcmUgbW9yZSBBQ1BJ
IFByb2Nlc3NvciBvYmplY3RzIHRoYW4gaW4geDJBUElDIG9yIE1BRFQuCj4gIAkgKiBUaGlzIGNh
biBoYXBwZW4gd2l0aCBpbmNvcnJlY3QgQUNQSSBTU0RUIGRlY2xlcmF0aW9ucy4gKi8KPiAtCWlm
IChhY3BpX2lkID4gbnJfYWNwaV9iaXRzKSB7Cj4gKwlpZiAoYWNwaV9pZCA+PSBucl9hY3BpX2Jp
dHMpIHsKPiAgCQlwcl9kZWJ1ZygiV2Ugb25seSBoYXZlICV1LCB0cnlpbmcgdG8gc2V0ICV1XG4i
LAo+ICAJCQkgbnJfYWNwaV9iaXRzLCBhY3BpX2lkKTsKCkNhbiB5b3UgcGxlYXNlIG1vZGlmeSB0
aGlzIG1lc3NhZ2UsIHRvbz8gRS5nLiBzb21ldGhpbmcgbGlrZToKCnByX2RlYnVnKCJtYXggYWNw
aSBpZCAldSwgdHJ5aW5nIHRvIHNldCAldVxuIiwKICAgICAgICAgbnJfYWNwaV9iaXRzIC0gMSwg
YWNwaV9pZCk7CgpXaXRoIHRoYXQ6CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
