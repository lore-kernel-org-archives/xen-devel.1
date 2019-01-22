From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH] iommu: Eliminate an odd local variable
Date: Tue, 22 Jan 2019 11:20:16 +0200
Message-ID: <fe3c24fa-807e-60e1-b078-31ca41c346f2@gmail.com>
References: <1548086648-8102-1-git-send-email-andrii.anisov@gmail.com>
 <5C46D259020000780020FFDB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqM6=P6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1glsEH-0004SF-Lh
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 09:20:21 +0000
Received: by mail-lj1-x241.google.com with SMTP id t18-v6so19938264ljd.4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jan 2019 01:20:20 -0800 (PST)
In-Reply-To: <5C46D259020000780020FFDB@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSmFuLAoKT24gMjIuMDEuMTkgMTA6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdoYXQn
cyBleGNlc3NpdmUgdGhlcmU/IEhvdyBjb21lIHlvdSBhbHRlciB0aGUgZnVuY3Rpb24ncwo+IHJl
dHVybiB2YWx1ZSB3aXRob3V0IHNheWluZyB3aHk/IFRoZSBtb3JlIHRoYXQgeW91IG1ha2UKPiBp
dCBwb3RlbnRpYWxseSByZXR1cm4gc3VjY2VzcyB3aGVuIHRoZXJlIHdhcyBhbiBlcnJvci4KCkFo
LCBJJ3ZlIHJlYWxpemVkIHRoZSBkaWZmZXJlbmNlLiBJbiB1bm1hcCwgZm9yIGhhcmR3YXJlIGRv
bWFpbiwgd2Ugd2lsbCBpdGVyYXRlIHRocm91Z2ggcGFnZXMgZXZlbiBpZiBzb21lIHBhZ2UgZmFp
bGVkIHRvIHVubWFwLCBwcmVzZXJ2aW5nIHRoZSBmaXJzdCBjYXVnaHQgZXJyb3IuClNvIG15IHBh
dGNoIGlzIHdyb25nLgoKU29ycnkgZm9yIGRpc3R1cmJpbmcuCgotLSAKU2luY2VyZWx5LApBbmRy
aWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
