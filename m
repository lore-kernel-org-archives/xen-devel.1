From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 04/20] xen/arm: Rework HSCTLR_BASE
Date: Fri, 3 May 2019 17:10:48 +0100
Message-ID: <f3491a70-c5c4-024f-235e-e00a842b81d7@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-5-julien.grall@arm.com>
 <baf59ec5-cc0a-5ffc-f637-6bbfd29dd589@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMaly-0002CW-N0
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:10:54 +0000
In-Reply-To: <baf59ec5-cc0a-5ffc-f637-6bbfd29dd589@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8wNS8yMDE5IDE2OjU2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9uIDIyLjA0
LjE5IDE5OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IMKgIC8qIEhDUiBIeXAgQ29uZmlndXJh
dGlvbiBSZWdpc3RlciAqLwo+PiDCoCAjZGVmaW5lIEhDUl9SV8KgwqDCoMKgwqDCoMKgwqDCoCAo
X0FDKDEsVUwpPDwzMSkgLyogUmVnaXN0ZXIgV2lkdGgsIEFSTTY0IG9ubHkgKi8KPj4KPiAKPiBS
ZXNvbHV0aW9uIG9mIHRoZSBkaXNwdXRlIHdpdGggSmFuIGFib3V0IFtQQVRDSCAwMS8yMF0gaXMg
cmVxdWlyZWQgZmlyc3QuCgpJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBpcyB5b3VyICJzZWNvbmQi
LiBEb2VzIGl0IG1lYW4geW91IGFyZSBoYXBweSB3aXRoIHRoZSAKaWRlYSBvZiB0aGUgcGF0Y2gg
YnV0IHdlIHNob3VsZCBhZ3JlZSBvbiB0aGUgbmFtaW5nIGZpcnN0PwoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
