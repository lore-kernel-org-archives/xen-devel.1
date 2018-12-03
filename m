From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 10/16] gic:vgic:gic-vgic: introduce non-atomic
 bitops
Date: Mon, 3 Dec 2018 13:08:28 +0000
Message-ID: <78d263ee-7d71-e4bc-efb0-435f32577431@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-11-git-send-email-andrii.anisov@gmail.com>
 <20181129121416.222da0d5@donnerap.cambridge.arm.com>
 <f71bead8-4450-7f51-06d4-f4f6021df8d6@gmail.com>
 <0225bd51-824f-2f98-afa5-c4f5e9456885@arm.com>
 <5864e1ee-3a2c-e408-fe2f-28ccc5afcbd0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=od2x=om=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gTny9-0004GR-Mh
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 13:09:01 +0000
In-Reply-To: <5864e1ee-3a2c-e408-fe2f-28ccc5afcbd0@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8xMi8yMDE4IDEzOjA1LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAwMy4xMi4xOCAxNDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGF0J3Mg
bWljcm8gb3B0aW1pemluZyBYZW4uLi4gdGhlcmUgYXJlIGJldHRlciAoYW5kIGxlc3Mgcmlza3kp
IHBsYWNlIHRvIGxvb2sgCj4+IGZvciBvcHRpbWl6YXRpb24uCj4gSSB3b3VsZCBhcHByZWNpYXRl
IHlvdSBwb2ludCBtZSB0aG9zZSBwbGFjZXMuCgpJIGFscmVhZHkgcG9pbnRlZCB0aGVtIGluIHZh
cmlvdXMgdGhyZWFkcyB3aXRoIHlvdS4gSW4gYW55IGNhc2UsIEkgd2lsbCBub3QgCmNvbnNpZGVy
IGFueSBwYXRjaCB3aXRob3V0IGJlbmNobWFyayB1bmxlc3MgdGhlIHBhdGNoZXMgYXJlIGZvciBj
b3JyZWN0bmVzcy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
