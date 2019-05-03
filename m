From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 02/20] xen/arm: Rename SCTLR_* defines and
 remove unused one
Date: Fri, 3 May 2019 18:56:23 +0300
Message-ID: <03aa74a3-5a27-f6e3-d01f-eb93d91c73b7@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaY0-0006fO-SE
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:56:28 +0000
Received: by mail-lj1-x242.google.com with SMTP id r72so5619250ljb.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:56:27 -0700 (PDT)
In-Reply-To: <20190422164937.21350-3-julien.grall@arm.com>
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
aGUgU0NUTFJfKiBhcmUgY3VycmVudGx5IHVzZWQgZm9yIFNDVExSL0hTQ1RMUiAoYXJtMzIpIGFu
ZAo+IFNDVExSX0VMMS9TQ1RMUl9FTDIgKGFybTY0KS4KPiAKPiBUaGUgbmFtaW5nIHNjaGVtZSBp
cyBhY3R1YWxseSBxdWl0ZSBjb25mdXNpbmcgYmVjYXVzZSB0aGV5IG1heSBvbmx5IGJlCj4gZGVm
aW5lZCBmb3IgYW4gYXJjaGljdHVyZSAob3IgZXZlbiBhbiBleGNlcHRpb24gbGV2ZWwpLiBTbyBp
dCBpcyBub3QgZWFzeQo+IGZvciB0aGUgZGV2ZWxvcGVyIHRvIGtub3cgd2hpY2ggb25lIHRvIHVz
ZS4KPiAKPiBUaGUgbmFtaW5nIHNjaGVtZSBpcyByZXdvcmtlZCBieSBhZGRpbmcgQXh4X0VMeCBp
biBlYWNoIGRlZmluZToKPiAgICAgICogeHggaXMgcmVwbGFjZWQgYnkgMzIgb3IgNjQgaWYgc3Bl
Y2lmaWMgdG8gYW4gYXJjaGl0ZWN0dXJlCj4gICAgICAqIHggaXMgcmVwbGFjZWQgYnkgMiAoaHlw
ZXJ2aXNvcikgb3IgMSAoa2VybmVsKSBpZiBzcGVjaWZpYyB0byBhbgo+ICAgICAgZXhjZXB0aW9u
IGxldmVsCj4gCj4gV2hpbGUgZG9pbmcgdGhlIHJlbmFtaW5nLCByZW1vdmUgdGhlIHVudXNlZCBk
ZWZpbmVzIChvciBhdCBsZWFzdCB0aGUgb25lcwo+IHRoYXQgYXJlIHVubGlrZWx5IGdvaW5nIHRv
IGJlIHVzZWQpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFt
LmNvbT4KCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
