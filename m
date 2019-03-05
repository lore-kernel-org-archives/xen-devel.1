From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen ARM GPU passthrough without IOMMU
Date: Tue, 5 Mar 2019 09:15:37 +0000
Message-ID: <05071c02-311b-202f-0664-3bff0f40b416@arm.com>
References: <tencent_A242CD7209FC8C35E62C9B0A95AF98E13D08@qq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6IM3=RI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h16Ap-0006QL-5e
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 09:15:43 +0000
In-Reply-To: <tencent_A242CD7209FC8C35E62C9B0A95AF98E13D08@qq.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jinchen <jinchen1227@qq.com>, xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Andrii Anisov <andrii_anisov@epam.com>, Peng Fan <peng.fan@nxp.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzLzUvMTkgMTo1NSBBTSwgamluY2hlbiB3cm90ZToKPiAKPiAgICAgPiBIaSwKPiAg
ICAgSGVsbG8sCj4gICAgICA+IEnigJltIHVzaW5nIHRoZSBOWFAgaS5teDhxeHAgbWVuIGJvYXJk
IGFuZCB3YW50IHRvIGNyZWF0ZSBhbgo+ICAgICBBbmRyb2lkIGRvbXUgb24gWGVuLAo+ICAgICAg
PiBidXQgdGhpcyBib2FyZCBkb2VzbuKAmXQgaGF2ZSBJT01NVS4gRG9lcyBhbnlvbmUga25vd3Mg
dGhhdCBjYW4gSQo+ICAgICBwYXNzdGhyb3VnaCBHUFUgd2l0aG91dCBJT01NVSBvbiBpdD8KPiAg
ICAgRGV2aWNlIERNQS1jYXBhYmxlIHBhc3N0aHJvdWdoIHdpdGhvdXQgSU9NTVUgaXMgbm90IHJl
Y29tbWVuZGVkIGFzCj4gICAgIHlvdSB3b3VsZAo+ICAgICB1bmRlcm1pbmUgdGhlIGd1ZXN0IGlz
b2xhdGlvbiBmcm9tIHRoZSByZXN0IG9mIHRoZSBwbGF0Zm9ybS4KPiAgICAgSSBhbSBub3QgYXdh
cmUgb2YgYW55IHBsYW4gdG8gc3VwcG9ydCB0aGlzIGluIFhlbiBmb3Igbm93LiBJZiB5b3UKPiAg
ICAgd2FudCB0byBhZGQKPiAgICAgdGhlIHN1cHBvcnQgYnkgeW91cnNlbGYsIHlvdSB3b3VsZCB0
aGVuIG5lZWQgdG8gbWFrZSBzdXJlIHRoZSBndWVzdAo+ICAgICBtZW1vcnkgaXMKPiAgICAgZGly
ZWN0IG1hcHBlZCAoaS5lIHRoZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzID0gaG9zdCBwaHlzaWNh
bCBhZGRyZXNzKS4KPiAgICAgQW5vdGhlciBhbHRlcm5hdGl2ZSBpcyB0byB1c2UgUFYgZHJpdmVy
cyBmb3IgcHJvdmlkaW5nIGdyYXBoaWMKPiAgICAgYWNjZXNzIHRvIHlvdXIKPiAgICAgQW5kcm9p
ZCBndWVzdC4KPiAgICAgSSBob3BlIHRoYXQgaGVscHMuCj4gCj4gVGhhbmsgeW91IGZvciB5b3Vy
IGFuc3dlciEKPiBEbyB5b3UgaGF2ZSBzb21lIGd1aWRlIGZvciBQViBkcml2ZXJzIHRvIHJ1biBh
bmRyb2lkIGRvbXU/Cj4gSSBjYW4gb25seSBydW4gdG8gdGhlIGNvbnNvbGUgaW4gYW5kcm9pZCBi
dXQgY2FuJ3Qgc3RhcnQgdGhlIGdyYXBoaWMgCj4gc3VjY2Vzc2Z1bGx5LgoKSSBhbSBub3QgZmFt
aWxpYXIgd2l0aCBBbmRyb2lkIHJ1bm5pbmcgaW4gZ3Vlc3QuIENDaW5nIHNvbWUgcGVvcGxlIHRo
YXQgCm1heSBrbm93LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
