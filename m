From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vm_event: correctly gather gs_shadow
 value
Date: Wed, 1 May 2019 08:38:47 +0100
Message-ID: <69a54da5-c4d2-77e8-7d24-a07dcd32aa9c@citrix.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <2924b458-c79d-0993-b54f-924fec1f0caf@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2zDm=TB=citrix.com=prvs=017a1499b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hLjpV-0004Vx-Mv
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 07:39:01 +0000
In-Reply-To: <2924b458-c79d-0993-b54f-924fec1f0caf@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDUvMjAxOSAwODoxNywgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDUvMS8xOSA3
OjIyIEFNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+IEN1cnJlbnRseSB0aGUgZ3Nfc2hhZG93
IHZhbHVlIGlzIG9ubHkgY2FjaGVkIHdoZW4gdGhlIHZDUFUgaXMgYmVpbmcgc2NoZWR1bGVkCj4+
IG91dCBieSBYZW4uIFJlcG9ydGluZyB0aGlzICh1c3VhbGx5KSBzdGFsZSB2YWx1ZSB0aHJvdWdo
IHZtX2V2ZW50IGlzIGluY29ycmVjdCwKPj4gc2luY2UgaXQgZG9lc24ndCByZXByZXNlbnQgdGhl
IGFjdHVhbCBzdGF0ZSBvZiB0aGUgdkNQVSBhdCB0aGUgdGltZSB0aGUgZXZlbnQKPj4gd2FzIHJl
Y29yZGVkLiBUaGlzIHByZXZlbnRzIHZtX2V2ZW50IHN1YnNjcmliZXJzIGZyb20gY29ycmVjdGx5
IGZpbmRpbmcga2VybmVsCj4+IHN0cnVjdHVyZXMgaW4gdGhlIGd1ZXN0IHdoZW4gaXQgaXMgdHJh
cHBlZCB3aGlsZSBpbiByaW5nMy4KPiBJc24ndCB0aGUgVkNQVSBhbHdheXMgc2NoZWR1bGVkIG91
dCAoc2luY2UgaXQgaXMgcGF1c2VkKSB3aXRoIHN5bmMKPiB2bV9ldmVudHM/IElzIHRoaXMgYW4g
YXN5bmMgZml4IG9ubHk/CgpQYXVzZWQgaXNuJ3QgYWx3YXlzIHNjaGVkdWxlZCBvdXQuwqAgSXQg
Y2FuIGJlIGhhbGYtaWRsZSB3aXRoIHN0YXRlIHN0aWxsCmluIGhhcmR3YXJlLgoKPgo+IEluIGFu
eSBjYXNlLAo+Cj4gQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVu
ZGVyLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
