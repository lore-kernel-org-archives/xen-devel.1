From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC 11/16] irq: skip action avalability check for
 guest's IRQ
Date: Wed, 12 Dec 2018 16:58:03 +0200
Message-ID: <6d82b734-acbf-a089-858e-9fa0475ac127@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-12-git-send-email-andrii.anisov@gmail.com>
 <3be90d82-cdcd-b3d5-c734-6da90ecd7344@arm.com>
 <c7678ede-86c5-f742-e749-acc4841d7481@gmail.com>
 <17e191b5-7252-c1d7-1f0f-39f98fdb9895@arm.com>
 <934f091c-234c-9bd6-52bc-2e78f9de4e17@gmail.com>
 <74fb1410-5ba6-2da8-2be3-6de3bd89af38@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX5xh-000894-AA
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 14:58:09 +0000
Received: by mail-lf1-x135.google.com with SMTP id c16so13721604lfj.8
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 06:58:07 -0800 (PST)
In-Reply-To: <74fb1410-5ba6-2da8-2be3-6de3bd89af38@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi4xMi4xOCAxNjo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFTU0VSVCBvbmx5IHRl
bGxzIHlvdSB0aGF0IGRlc2MtPmFjdGlvbiB3YXMgTlVMTC4gSXQgZG9lcyBub3QgdGVsbCB5b3Ug
d2hpY2ggSVJRIGhhcyB0aGUgZGVzYy0+YWN0aW9uID09IE5VTEwuCkFoLCB5ZXMuCgo+IEl0IGlz
IGEgYml0IGEgc2hhbWUgd2UgZG9uJ3QgaGF2ZSB3YXkgdG8gcHJvdmlkZSBhbm90aGVyIG1lc3Nh
Z2Ugd2l0aCBBU1NFUlQgdG8gaGVscCB5b3UgZGVidWdnaW5nLgpXZSBtaWdodCBoYXZlIGltcGxl
bWVudGVkIGFuIGFzc2VydCB3aXRoIGEgbWVzc2FnZS4KQW5kIGd1eXMgb24gc3RhY2tvdmVyZmxv
dyBzdWdnZXN0IGZvciB3b3JrYXJvdW5kIGBBU1NFUlQoY29uZGl0aW9uICYmICJlcnJvciBtZXNz
YWdlIilgLgoKPiBObywgSSBhbSBzdWdnZXN0aW5nIHRvIGhhdmUgdGhlIGN1cnJlbnQgaWYgKCB0
ZXN0X2JpdCguLi4pICkgcHJvdGVjcmVkIHdpdGggI2lmbmRlZiBOREVCVUcuIE5vIGNvZGUgZHVw
bGljYXRpb24uCkkgd291bGQgbm90IGxpa2UgdG8gbGVhdmUgZXZlbiBub24tZGVidWcgYnVpbGQg
d2l0aG91dCB0aGUgY2hlY2suCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
