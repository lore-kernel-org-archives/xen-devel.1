From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 v3 3/8] xen/arm: Add support for
 read-only foreign mappings
Date: Fri, 21 Dec 2018 19:27:19 +0200
Message-ID: <0e703c1b-8316-9495-c04c-0900f65a07c0@gmail.com>
References: <20181221162650.11515-1-julien.grall@arm.com>
 <20181221162650.11515-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaOa4-0005mB-28
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 17:27:24 +0000
Received: by mail-lf1-x144.google.com with SMTP id a16so4447825lfg.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 09:27:22 -0800 (PST)
In-Reply-To: <20181221162650.11515-4-julien.grall@arm.com>
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
Cc: sstabellini@kernel.org, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS4xMi4xOCAxODoyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEN1cnJlbnRseSwgZm9y
ZWlnbiBtYXBwaW5ncyBjYW4gb25seSBiZSByZWFkLXdyaXRlLiBBIGZvbGxvdy11cCBwYXRjaCB3
aWxsCj4gZXh0ZW5kIGZvcmVpZ24gbWFwcGluZyBmb3IgWGVuIGJhY2tlbmQgbWVtb3J5ICh2aWEg
WEVOX0RPTUlEKSwgc29tZSBvZgo+IHRoYXQgbWVtb3J5IHNob3VsZCBvbmx5IGJlIHJlYWQgYWNj
ZXNzaWJsZSBmb3IgdGhlIG1hcHBpbmcgZG9tYWluLgo+IAo+IEludHJvZHVjZSBhIG5ldyBwMm1f
dHlwZSB0byBjYXRlciByZWFkLW9ubHkgZm9yZWlnbiBtYXBwaW5ncy4gRm9yIG5vdywKPiB0aGUg
ZGVjaXNpb24gYmV0d2VlbiB0aGUgdHdvIGZvcmVpZ24gbWFwcGluZyB0eXBlIGlzIGJhc2VkIG9u
IHRoZSB0eXBlCj4gb2YgdGhlIGd1ZXN0IHBhZ2UgbWFwcGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBbmRyaWkgQW5pc292IDxhbmRy
aWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
