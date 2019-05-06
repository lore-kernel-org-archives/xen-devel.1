From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 02/12] xen/arm: mm: Rename
 create_xen_entries() to xen_pt_update()
Date: Mon, 6 May 2019 15:48:04 +0300
Message-ID: <067aa134-e16f-c0df-4802-04cceeb5af68@gmail.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2O-0007IH-JQ
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:08 +0000
Received: by mail-lf1-x144.google.com with SMTP id j11so9054759lfm.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:07 -0700 (PDT)
In-Reply-To: <20190424165955.23718-3-julien.grall@arm.com>
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGNyZWF0ZV94ZW5fZW50
cmllcygpIGlzIGRvaW5nIG1vcmUgdGhhbiBjcmVhdGluZyBlbnRyaWVzLiBJdCBjYW4gYWxzbwo+
IG1vZGlmeSBhbmQgcmVtb3ZlIGVudHJpZXMuCj4gCj4gUmVuYW1lIHRoZSBmdW5jdGlvbiB0byBt
YWtlIGNsZWFyIHdoYXQgdGhlIGZ1bmN0aW9uIGlzIGFjdHVhbGx5IGRvaW5nLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1i
eTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHks
CkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
