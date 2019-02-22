From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V2 3/3] xen/arm: Add SCIFA UART support for
 early printk
Date: Fri, 22 Feb 2019 19:34:01 +0200
Message-ID: <226075fe-396e-15f7-221c-8beb17651c23@gmail.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-4-git-send-email-olekstysh@gmail.com>
 <c3ae0a46-8418-c426-c87a-96f30730bbda@arm.com>
 <7fb34ed2-f763-938c-0884-844d1fbe1127@gmail.com>
 <a4f9f1f1-aa25-0faf-4938-78fe396a1ebc@gmail.com>
 <ffc9d12a-0579-bcfd-428b-401524949009@arm.com>
 <0839f3bf-384b-ceb6-4412-677575367387@gmail.com>
 <2ccd6cca-57c0-d9b0-2a82-7459b72ab555@gmail.com>
 <854eb0c4-c5e5-d19f-cc50-ba623d19a24f@arm.com>
 <52ea302e-20fa-f689-5eec-c40945ae6006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fuT0=Q5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gxEi6-0005v3-U1
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 17:34:06 +0000
Received: by mail-lj1-x243.google.com with SMTP id g80so2326089ljg.6
 for <xen-devel@lists.xenproject.org>; Fri, 22 Feb 2019 09:34:04 -0800 (PST)
In-Reply-To: <52ea302e-20fa-f689-5eec-c40945ae6006@gmail.com>
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

CkhpLCBKdWxpZW4KCgo+PiBZb3VyIHNvbHV0aW9uIGJlbG93IHJlcXVpcmUgdG8gb3ZlcndyaXRl
IEVBUkxZX1BSSU5US19JTkMgYW5kIG5vdCAKPj4gdmVyeSBlYXN5IHRvIGV4dGVuZCBvZiBvdGhl
ciB2ZXJzaW9uIChlLmcgc2NpZmIpLiBBcyBJIHN1Z2dlc3RlZCAKPj4gZWFybGllciwgd2UgY2Fu
IGludHJvZHVjZSBhbiBvcHRpb24gdGhlIHNhbWUgd2F5IFJFR19TSElGVCBleGlzdCBmb3IgCj4+
IDgyNTAuIFRoZSBkZWZpbml0aW9uIG9mIENPTkZJR19FQVJMWV9QUklOVEsgaXM6Cj4+Cj4+IENP
TkZJR19FQVJMWV9QUklOVEs9PElOQz4sPEJBU0VfQUREUkVTUz4sPE9USEVSX09QVElPTlM+Cj4+
Cj4+IDxPVEhFUl9PUFRJT05TPiB3b3VsZCBiZSB0aGUgdmVyc2lvbi4gTm90aGluZyBmb3IgU0NJ
RiBhbmQgQSBmb3IgU0NGSUEuCj4+Cj4+IFRoZW4gaW4gUnVsZXMubWssIHlvdSB3b3VsZCBoYXZl
IHNvbWV0aGluZyBsaWtlOgo+Pgo+PiBpZm5lcSAoJCh3b3JkIDMsJChFQVJMWV9QUklOVEtfQ0ZH
KSksKQo+PiBDRkxBR1MteSArPSAtRENPTkZJR19FQVJMWV9QUklOVEtfVkVSU0lPTl8kKHdvcmQg
MywgJChFQVJMWV9QUklOVEtfQ0ZHKQo+PiBlbHNlCj4+IENGTEFHUy15ICs9IC1EQ09ORklHX0VB
UkxZX1BSSU5US19WRVJTSU9OX05PTkUKPj4gZW5kaWYKPj4KPj4gZGVidWctc2NpZi5pbmMgd291
bGQgdGhlbiBjb250YWluOgo+Pgo+PiAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5US19WRVJTSU9O
X0EKPj4gI2RlZmluZSBmb28KPj4gI2RlZmluZSBiYXIKPj4gI2VsaWZkZWYgQ09ORklHX0VBUkxZ
X1BSSU5US19WRVJTSU9OX05PTkUKPj4gI2RlZmluZSBmb28KPj4gI2RlZmluZSBiYXIKPj4gI2Vu
ZGlmCj4+Cj4+IFRoZSBDT05GSUdfRUFSTFlfUFJJTlRLX1ZFUlNJT05fTk9ORSBpcyBoZXJlIHRv
IGhlbHAgY2F0Y2hpbmcgbmV3IAo+PiBhZGRpdGlvbi4gSWYgc29tZW9uZSBpZiB1c2luZyBhIGRp
ZmZlcmVudCB2ZXJzaW9uLCBpdCB3b3VsZCBub3QgY29tcGlsZS4KPj4gQWxzbywgdGhlIGNvZGUg
aW4gUnVsZXMubWsgaXMgZ2VuZXJpYyBlbm91Z2ggdG8gZXh0ZW5kIGZvciBvdGhlciAKPj4gdmVy
c2lvbiAoZS5nIHNjaWZiKS4KPj4KPj4gRG9lcyBpdCBtYWtlIHNlbnNlPwo+Cj4gQWJzb2x1dGVs
eS4gVGhhbmsgeW91CgoKSWRlYSB3b3JrcyBhcyBleHBlY3RlZC4KCgpKdXN0IGEgcXVpY2sgcXVl
c3Rpb24uCgpTaGFsbCBJIGRvIHRoaXMgYnkgYSBzaW5nbGUgcGF0Y2ggb3IgdGhpcyBzaG91bGQg
YmUgc3BpdHRlZCBpbiB0d28gCnBhdGNoZXM6ICJyZXdvcmtpbmcgY3VycmVudCBjb2RlIiBmb2xs
b3dlZCBieSAiYWRkaW5nIFNDSUZBIj8KCgo+Cj4KPj4KPj4gQ2hlZXJzLAo+PgotLSAKUmVnYXJk
cywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
