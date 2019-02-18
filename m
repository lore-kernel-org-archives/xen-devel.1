From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V2 3/3] xen/arm: Add SCIFA UART support for
 early printk
Date: Mon, 18 Feb 2019 22:45:01 +0200
Message-ID: <a4f9f1f1-aa25-0faf-4938-78fe396a1ebc@gmail.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-4-git-send-email-olekstysh@gmail.com>
 <c3ae0a46-8418-c426-c87a-96f30730bbda@arm.com>
 <7fb34ed2-f763-938c-0884-844d1fbe1127@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ity+=QZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gvpmj-0001jR-B5
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 20:45:05 +0000
Received: by mail-lj1-x243.google.com with SMTP id d14so4342217ljl.9
 for <xen-devel@lists.xenproject.org>; Mon, 18 Feb 2019 12:45:03 -0800 (PST)
In-Reply-To: <7fb34ed2-f763-938c-0884-844d1fbe1127@gmail.com>
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDE4LjAyLjE5IDIyOjQxLCBPbGVrc2FuZHIgd3JvdGU6Cj4KPiBPbiAxOC4wMi4xOSAxNjow
NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPgo+Cj4gSGkKPgo+Cj4+Cj4+IE9uIDAxLzAy
LzIwMTkgMTI6MzcsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+Pj4gRnJvbTogT2xla3Nh
bmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4KPj4+IEFk
ZCBzdXBwb3J0IGZvciBSZW5lc2FzICJTdG91dCIgZGV2ZWxvcG1lbnQgYm9hcmQgYmFzZWQgb24K
Pj4+IFItQ2FyIEgyIFNvQyB3aGljaCBoYXMgU0NJRkEgY29tcGF0aWJsZSBVQVJULgo+Pj4KPj4+
IEFjdHVhbGx5IGV4aXN0aW5nIFNDSUYgVUFSVCBzdXBwb3J0IChkZWJ1Zy1zY2lmLmluYykgYW5k
Cj4+PiBuZXdseSBhZGRlZCBTQ0lGQSBVQVJUIHN1cHBvcnQgKGRlYnVnLXNjaWZhLmluYykgZGlm
ZmVyIG9ubHkKPj4+IGluIHJlZ2lzdGVycyBvZmZzZXRzLgo+Pgo+PiBDYW4gd2UgdHJ5IHRvIG1l
cmdlIHRoZSB0d28gdGhlbj8gT25lIHNvbHV0aW9uIGlzIHRvIHByb3ZpZGUgYW5vdGhlciAKPj4g
b3B0aW9ucyBzaW1pbGFyIHRvIGhvdyB3ZSBkZWFsIHdpdGggUkVHX1NISUZUIG9uIHRoZSA4MjUw
Lgo+Cj4KPiBBY3R1YWxseSwgdGhlIG1haW4gZGlmZmVyZW5jZSBmb3IgdGhlICJlYXJseSBwcmlu
dGsiIHN1cHBvcnQgaXMgaW4gdHdvIAo+IHJlZyBvZmZzZXRzOgo+Cj4gKyNkZWZpbmUgU0NJRkFf
U0NBU1NSwqDCoCAweDE0wqDCoMKgIC8qIFNlcmlhbCBzdGF0dXMgcmVnaXN0ZXIgKi8KPiArI2Rl
ZmluZSBTQ0lGQV9TQ0FGVERSwqAgMHgyMMKgwqDCoCAvKiBUcmFuc21pdCBGSUZPIGRhdGEgcmVn
aXN0ZXIgKi8KPgo+ICsjZGVmaW5lIFNDSUZfU0NGU1LCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MHgxMMKgwqDCoCAvKiBTZXJpYWwgc3RhdHVzIHJlZ2lzdGVyICovCj4gKyNkZWZpbmUgU0NJRl9T
Q0ZURFLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MGPCoMKgwqAgLyogVHJhbnNtaXQgRklGTyBk
YXRhIHJlZ2lzdGVyICovCj4KPgo+IEkgYW0gbm90IG1pc3Rha2VuLCB3ZSB3aWxsIGhhdmUgdG8g
aW50cm9kdWNlIHR3byBvcHRpb25zIHRvIGNvdmVyIHRoaXMgCj4gY2FzZSwgYXMgdGhlIG9mZnNl
dHMgYXJlIG5vdCBjb3JyZWxhdGVkIHdpdGggZWFjaCBvdGhlciwgbm8/CgpTb3JyeSwgaXQgc2hv
dWxkIHJlYWQgYXM6CgoqSWYqIEkgYW0gbm90IG1pc3Rha2VuIC4uLgoKCj4KPgo+Pgo+PiBDaGVl
cnMsCj4+Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
