From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH MM-PART2 RESEND v2 06/19] xen/arm: Rework
 secondary_start prototype
Date: Thu, 30 May 2019 19:18:55 +0300
Message-ID: <1a24c6e0-d3be-ea0d-d848-565b2a1a3c55@gmail.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201527460.16404@sstabellini-ThinkPad-T480s>
 <d91870a5-e8d5-2f6d-b8f5-839c9f206fab@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPnK=T6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hWNld-0005pY-VM
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:19:02 +0000
Received: by mail-lf1-x142.google.com with SMTP id r15so5480725lfm.11
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 09:19:00 -0700 (PDT)
In-Reply-To: <d91870a5-e8d5-2f6d-b8f5-839c9f206fab@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOS4wNS4xOSAyMDowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDIw
LzA1LzIwMTkgMjM6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gVHVlLCAxNCBN
YXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gTm9uZSBvZiB0aGUgcGFyYW1ldGVycyBv
ZiBzZWNvbmRhcnlfc3RhcnQgYXJlIGFjdHVhbGx5IHVzZWQuIFNvIHR1cm4KPj4+IHNlY29uZGFy
eV9zdGFydCB0byBhIGZ1bmN0aW9uIHdpdGggbm8gcGFyYW1ldGVycy4KPj4+Cj4+PiBBbHNvIG1v
ZGlmeSB0aGUgYXNzZW1ibHkgY29kZSB0byBhdm9pZCBzZXR0aW5nLXVwIHRoZSByZWdpc3RlcnMg
YmVmb3JlCj4+PiBjYWxsaW5nIHNlY29uZGFyeV9zdGFydC4KPj4KPj4gSXQgaXMgY2FsbGVkICJz
dGFydF9zZWNvbmRhcnkiIHJhdGhlciB0aGFuICJzZWNvbmRhcnlfc3RhcnQiLiBQbGVhc2UgZml4
Cj4+IHRoZSBjb21taXQgbWVzc2FnZS4gVGhlbiB5b3UgY2FuIGFkZAo+IAo+IFdob29wcywgSSB3
aWxsIHVwZGF0ZSBpdC4KPiAKPj4KPj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpGV0lXLCB3aXRoIHRoZSBuYW1lIGZpeGVkCgpS
ZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCgotLSAK
U2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
