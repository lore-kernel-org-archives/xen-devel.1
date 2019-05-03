From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 04/20] xen/arm: Rework HSCTLR_BASE
Date: Fri, 3 May 2019 19:17:45 +0300
Message-ID: <0b9442d3-6d3f-9632-862c-9dca202781c0@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-5-julien.grall@arm.com>
 <baf59ec5-cc0a-5ffc-f637-6bbfd29dd589@gmail.com>
 <f3491a70-c5c4-024f-235e-e00a842b81d7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMasg-0002j5-Fz
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:17:50 +0000
Received: by mail-lj1-x233.google.com with SMTP id w12so5661957ljh.12
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 09:17:48 -0700 (PDT)
In-Reply-To: <f3491a70-c5c4-024f-235e-e00a842b81d7@arm.com>
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

CgpPbiAwMy4wNS4xOSAxOToxMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aGF0IGlzIHlvdXIgInNlY29uZCIuIERvZXMgaXQgbWVhbiB5b3UgYXJlIGhhcHB5IHdp
dGggdGhlIGlkZWEgb2YgdGhlIHBhdGNoIGJ1dCB3ZSBzaG91bGQgYWdyZWUgb24gdGhlIG5hbWlu
ZyBmaXJzdD8KClllcywgSSdtIG9rIHdpdGggdGhlIGNoYW5nZS4KQWN0dWFsbHkgSSBsaWtlIHRo
ZSBwYXJ0IHdpdGggSFNDVExSX0NMRUFSIGFzIGEgY29tcGlsYXRpb24gdGltZSBndWFyZC4KQnV0
IG5hbWluZyBzaG91bGQgYmUgYWdyZWVkIGZpcnN0LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFu
aXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
