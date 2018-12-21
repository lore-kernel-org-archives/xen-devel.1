From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 1/8] xen/arm: Only set necessary
 flags when initializing HCR_EL2
Date: Fri, 21 Dec 2018 16:33:38 +0200
Message-ID: <7624cece-4fd1-6ea7-e425-79f31c1cf872@gmail.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaLrz-0001Oa-KP
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 14:33:43 +0000
Received: by mail-lj1-x244.google.com with SMTP id v15-v6so4900588ljh.13
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 06:33:42 -0800 (PST)
In-Reply-To: <20181128164939.8329-2-julien.grall@arm.com>
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOC4xMS4xOCAxODo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9ubHkge0EsRixJfU1P
IGFyZSBuZWNlc3NhcnkgdG8gcmVjZWl2ZSBpbnRlcnJ1cHRzIHVudGlsIGEgZ3Vlc3QgdkNQVSBp
cwo+IGxvYWRlZC4KPiAKPiBUaGUgcmVzdCBoYXZlIG5vIGVmZmVjdCBvbiBYZW4gYW5kIGl0IGlz
IGJldHRlciB0byBhdm9pZCBzZXR0aW5nIHRoZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS90cmFw
cy5jIHwgOCArKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVw
YW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
