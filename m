From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 07/12] xen/arm: mm: Rework
 xen_pt_update_entry to avoid use xenmap_operation
Date: Mon, 6 May 2019 15:48:34 +0300
Message-ID: <f895a2cf-fb8c-6a3a-e10b-8696123b452c@gmail.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-8-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2t-0007Tf-K7
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:39 +0000
Received: by mail-lf1-x141.google.com with SMTP id u27so8769807lfg.10
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:37 -0700 (PDT)
In-Reply-To: <20190424165955.23718-8-julien.grall@arm.com>
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdpdGggdGhlIG5ld2x5
IGludHJvZHVjZWQgZmxhZ3MsIGl0IGlzIG5vdyBwb3NzaWJsZSB0byBrbm93IGhvdyB0aGUgcGFn
ZQo+IHdpbGwgYmUgdXBkYXRlZCB0aHJvdWdoIHRoZSBmbGFncy4KPiAKPiBBbGwgdGhlIHVzZSBv
ZiB4ZW5tYXBfb3BlcmF0aW9uIGFyZSBub3QgcmVwbGFjZWQgd2l0aCB0aGUgZmxhZ3MuIEF0IHRo
ZQoKSSBzdXBwb3NlIGl0IHNob3VsZCBiZSAiYXJlIG5vVyByZXBsYWNlZCB3aXRoIHRoZSBmbGFn
cyIuCgo+IHNhbWUgdGltZSwgdmFsaWRpdHkgY2hlY2sgYXJlIG5vdyByZW1vdmVkIGFzIHRoZXkg
YXJlIGdhdGhlcmVkIGluCj4geGVuX3B0X2NoZWNrX2VudHJ5KCkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KCgpSZXZpZXdlZC1i
eTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHks
CkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
