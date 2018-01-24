From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 6/7] ARM: vGICv3: always use architected
	redist stride
Date: Wed, 24 Jan 2018 17:24:05 +0000
Message-ID: <f244295d-04f0-1f38-607d-21d43cdccf0e@linaro.org>
References: <20180124143517.18469-1-andre.przywara@linaro.org>
 <20180124143517.18469-7-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=szm7=et=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eeOmQ-0002Zj-GQ
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 17:24:10 +0000
Received: by mail-wm0-x234.google.com with SMTP id f3so10103298wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 09:24:08 -0800 (PST)
In-Reply-To: <20180124143517.18469-7-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAyNC8wMS8xOCAxNDozNSwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gVGhl
IHJlZGlzdHJpYnV0b3Itc3RyaWRlIHByb3BlcnR5IGluIGEgR0lDdjMgRFQgbm9kZSBpcyBvbmx5
IHRoZXJlIHRvCj4gY292ZXIgYnJva2VuIHBsYXRmb3JtcyB3aGVyZSB0aGlzIHZhbHVlIGRldmlh
dGVzIGZyb20gdGhlIGFyY2hpdGVjdGVkIG9uZS4KPiBTaW5jZSB3ZSBlbXVsYXRlIHRoZSBHSUN2
MyBkaXN0cmlidXRvciBldmVuIGZvciBEb20wLCB3ZSBkb24ndCBuZWVkIHRvCj4gY29weSB0aGUg
YnJva2VuIGJlaGF2aW91ci4gQWxsIHRoZSBzcGVjaWFsIGhhbmRsaW5nIGZvciBEb20wcyB1c2lu
Zwo+IEdJQ3YzIGlzIGp1c3QgZm9yIHVzaW5nIHRoZSBoYXJkd2FyZSdzIG1lbW9yeSBtYXAsIHdo
aWNoIGlzIHVuYWZmZWN0ZWQKPiBieSB0aGUgcmVkaXN0cmlidXRvciBzdHJpZGUgLSBpdCBjYW4g
bmV2ZXIgYmUgc21hbGxlciB0aGFuIHRoZQo+IGFyY2hpdGVjdGVkIHR3byBwYWdlcy4KCkRvIHdl
IHdhbnQgYSBCVUdfT04oKSBqdXN0IGluIGNhc2U/Cgo+IFJlbW92ZSB0aGUgcmVkaXN0cmlidXRv
ci1zdHJpZGUgcHJvcGVydHkgZnJvbSBEb20wJ3MgRFQgbm9kZSBhbmQgYWxzbwo+IHJlbW92ZSB0
aGUgY29kZSB0aGF0IHRyaWVkIHRvIHJldXNlIHRoZSBoYXJkd2FyZSB2YWx1ZSBmb3IgRG9tMCdz
IEdJQ3YzCj4gZW11bGF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxh
bmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgoKSW4gYW55IGNhc2U6CgpBY2tlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJvLm9yZz4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
