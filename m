From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: Access I2C bus from guest/DomU on ARM board
Date: Tue, 16 Jan 2018 17:52:19 +0200
Message-ID: <37217807-7f20-bdbf-f852-033fcae1bd01@epam.com>
References: <CAONE6OA9h6omWptvGQE6EdD+s0geCbUcGUwX1NKPj16PF7_TNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=umwe=el=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1ebTXR-0002lP-6d
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 15:52:37 +0000
In-Reply-To: <CAONE6OA9h6omWptvGQE6EdD+s0geCbUcGUwX1NKPj16PF7_TNA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Saumya Rajesh <saumyarajesh93@gmail.com>, xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RGVhciBSYWplc2gsCgoKWW91IGNhbiB0cnkgdG8gZ2V0IGFuIEkyQyBidXMgY29udHJvbGxlciBp
biBEb21VIGluIFBJTyBtb2RlIGZvbGxvd2luZyAKWzFdLCBrZWVwaW5nIGluIG1pbmQgWzJdLgoK
SWYgeW91IHdhbnQgaXQgRE1BIGNhcGFibGUgeW91IG5lZWQgUmVuZXNhcyBJUE1NVSBzdXBwb3J0
IGluIFhFTiBbM10sIApbNF0gdG8gYmUgaW5jb3Jwb3JhdGVkLgoKClsxXSAtIGh0dHBzOi8veGVu
Yml0cy54ZW4ub3JnL2RvY3MvdW5zdGFibGUvbWlzYy9hcm0vcGFzc3Rocm91Z2gudHh0CgpbMl0g
LSAKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi11c2Vycy8y
MDE3LTEwL21zZzAwMDMxLmh0bWwKClszXSAtIApodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTctMDcvbXNnMDI1NDUuaHRtbAoKWzRdIC0gCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0w
Ny9tc2cwMjY3OS5odG1sCgoKLS0gCgoqQW5kcmlpIEFuaXNvdioKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
