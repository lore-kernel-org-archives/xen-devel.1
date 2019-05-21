From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH MM-PART2 RESEND v2 16/19] xen/arm: mm:
 Protect Xen page-table update with a spinlock
Date: Tue, 21 May 2019 13:04:02 +0300
Message-ID: <76eaa8e2-3bff-6046-a06d-870f2f284560@gmail.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wdSZ=TV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hT1ct-0003Tj-AQ
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:04:07 +0000
Received: by mail-lj1-x243.google.com with SMTP id a10so15316126ljf.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 03:04:06 -0700 (PDT)
In-Reply-To: <20190514122456.28559-17-julien.grall@arm.com>
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC4wNS4xOSAxNToyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBj
cmVhdGVfeGVuX2VudHJpZXMoKSBtYXkgYmUgY2FsbGVkIGNvbmN1cnJlbnRseS4gRm9yCj4gaW5z
dGFuY2UsIHdoaWxlIHRoZSB2bWFwIGFsbG9jYXRpb24gaXMgcHJvdGVjdGVkIGJ5IGEgc3Bpbmxv
Y2ssIHRoZQo+IG1hcHBpbmcgaXMgbm90Lgo+IAo+IFRoZSBpbXBsZW1lbnRhdGlvbiBjcmVhdGVf
eGVuX2VudHJpZXMoKSBjb250YWlucyBxdWl0ZSBhIGZldyBUT0NUT1UKPiByYWNlcyBzdWNoIGFz
IHdoZW4gYWxsb2NhdGluZyB0aGUgM3JkLWxldmVsIHBhZ2UtdGFibGVzLgo+IAo+IFRoYW5rZnVs
bHksIHRoZXkgYXJlIHByZXR0eSBoYXJkIHRvIHJlYWNoIGFzIHBhZ2UtdGFibGVzIGFyZSBhbGxv
Y2F0ZWQKPiBvbmNlIGFuZCBuZXZlciByZWxlYXNlZC4gWWV0IGl0IGlzIHBvc3NpYmxlLCBzbyB3
ZSBuZWVkIHRvIHByb3RlY3Qgd2l0aAo+IGEgc3BpbmxvY2sgdG8gYXZvaWQgY29ycnVwdGluZyB0
aGUgcGFnZS10YWJsZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KPiAKPiAtLS0KPiAgICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAg
LSBSZXdvcmsgdGhlIGNvbW1pdCBtZXNzYWdlCj4gLS0tCgpSZXZpZXdlZC1ieTogQW5kcmlpIEFu
aXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlz
b3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
