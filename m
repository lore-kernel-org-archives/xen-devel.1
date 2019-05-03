From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 05/20] xen/arm: Rework secondary_start
 prototype
Date: Fri, 3 May 2019 18:56:43 +0300
Message-ID: <41447e74-1dab-72d3-74b7-cf5d5fabf45d@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYK-0006jS-BZ
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:56:48 +0000
Received: by mail-lj1-x243.google.com with SMTP id s7so224577ljh.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:56:46 -0700 (PDT)
In-Reply-To: <20190422164937.21350-6-julien.grall@arm.com>
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

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBO
b25lIG9mIHRoZSBwYXJhbWV0ZXJzIG9mIHNlY29uZGFyeV9zdGFydCBhcmUgYWN0dWFsbHkgdXNl
ZC4gU28gdHVybgo+IHNlY29uZGFyeV9zdGFydCB0byBhIGZ1bmN0aW9uIHdpdGggbm8gcGFyYW1l
dGVycy4KPiAKPiBBbHNvIG1vZGlmeSB0aGUgYXNzZW1ibHkgY29kZSB0byBhdm9pZCBzZXR0aW5n
LXVwIHRoZSByZWdpc3RlcnMgYmVmb3JlCj4gY2FsbGluZyBzZWNvbmRhcnlfc3RhcnQuCgpXaGF0
IGlzIG5vdCByZWFsbHkgbWFuZGF0b3J5LgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKVGhvdWdoOgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
