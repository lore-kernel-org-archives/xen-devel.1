From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 4/5] xen/domain: Allocate d->vcpu[]
 earlier during domain_create()
Date: Wed, 14 Nov 2018 19:38:21 +0000
Message-ID: <9992702c-ab36-f0ea-9542-0d74e2a0b3be@citrix.com>
References: <017c35d6-689c-b025-6a05-4188a2150332@citrix.com>
 <1542224160-6130-1-git-send-email-andrew.cooper3@citrix.com>
 <d20b3a40-78eb-a41c-9ac2-8810d49baf95@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xswa=nz=citrix.com=prvs=8491ce0b8=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gN0zZ-00020W-97
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 19:38:25 +0000
In-Reply-To: <d20b3a40-78eb-a41c-9ac2-8810d49baf95@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTEvMjAxOCAxOTozNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Cj4KPiBPbiAxNC8xMS8y
MDE4IDE5OjM2LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiArwqDCoMKgIC8qIG1heF92Y3B1cyBk
ZXBlbmRzIG9uIHRoZSBHSUMgdmVyc2lvbiwgYW5kIFhlbidzIGNvbXBpbGVkCj4+IGxpbWl0LiAq
Lwo+PiArwqDCoMKgIG1heF92Y3B1cyA9IG1heCh2Z2ljX21heF92Y3B1cyhjb25maWctPmFyY2gu
Z2ljX3ZlcnNpb24pLAo+PiBNQVhfVklSVF9DUFVTKTsKPgo+IERpZCB5b3UgbWVhbiBtaW4odmdp
YywgTUFYX1ZJUlRfQ1BVUyk/CgpCYWggLSB5ZXMgSSBkaWQuCgp+QW5kcmV3CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
