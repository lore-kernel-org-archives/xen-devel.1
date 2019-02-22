From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Fri, 22 Feb 2019 13:21:22 +0200
Message-ID: <1a9017e6-9f97-9cf2-fca1-11a2db23e232@gmail.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jiny=Q5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gx8tT-0002M4-5x
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 11:21:27 +0000
Received: by mail-lf1-x141.google.com with SMTP id z196so740025lff.4
 for <xen-devel@lists.xenproject.org>; Fri, 22 Feb 2019 03:21:25 -0800 (PST)
In-Reply-To: <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, julien.grall@arm.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gQW5kcmV3LAoKT24gMjIuMDIuMTkgMTI6MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4g
T24gMjIvMDIvMjAxOSAwOTo1NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+IEZy
b206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFt
LmNvbT4KPj4KPj4gSGVsbG8sIGV2ZXJ5Ym9keSEKPj4KPj4gV2UgYXQgRVBBTSBTeXN0ZW1zIHdv
dWxkIGxpa2UgdG8gcHJlc2VudCBmaXJzdCBzZXJpZXMgb2YgcGF0Y2hlcyB0YXJnZXRpbmcgWGVu
Cj4+IG9uIEFSTSBGdW5jdGlvbmFsIFNhZmV0eSBjZXJ0aWZpY2F0aW9uIChJU082MTUwOCBiYXNl
ZCk6IGltcGxlbWVudGF0aW9uIG9mCj4+IE1JU1JBIFsxXSBDOjIwMTIgUnVsZSAxNi40IHdoaWNo
IHJlcXVpcmVzIHRoYXQgZXZlcnkgc3dpdGNoIHN0YXRlbWVudCBoYXMgYQo+PiBkZWZhdWx0IGxh
YmVsIGFzIGEgbWVhc3VyZSBvZiBkZWZlbnNpdmUgcHJvZ3JhbW1pbmcgdGVjaG5pcXVlLgo+IAo+
IEhhbmcgb24gLSB3aGF0Pwo+IAo+IENhbiBzb21lb25lIGF0dGVtcHQgdG8ganVzdGlmeSB3aHkg
YWN0aXZlbHkgYnJlYWtpbmcgLVdzd2l0Y2ggaXMgZ29pbmcKPiB0byByZXN1bHQgaW4gc2FmZXIv
YmV0dGVyIGNvZGU/CgpJIHdvdWxkIGV4cHJlc3MgbXkgdmlzaW9uIG9mIHRoYXQgTUlTUkEgcnVs
ZSByZXF1aXJlbWVudDoKSXQgcmVxdWlyZXMgaGFuZGxpbmcgKGluIGFueSBtZWFuaW5nKSBhbGwg
cG9zc2libGUgaW5jb21pbmcgdmFsdWVzIGV4cGxpY2l0bHkuClN3aXRjaGluZyB0aHJvdWdoIGVu
dW0gc3RpbGwgY291bGQgYmUgZ3VhcmRlZCBieSBCVUcvQVNTRVJUX1VOUkVBQ0hBQkxFIHVuZGVy
IGRlZmF1bHQgbGFiZWwuIFRob3VnaCBhdCBydW50aW1lLCBub3QgY29tcGlsYXRpb24gdGltZS4K
Ci0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
