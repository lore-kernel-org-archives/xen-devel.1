From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH] xen/grant_table: Remove stall comment on top of
 map_grant_ref
Date: Thu,  1 Nov 2018 10:16:58 +0000
Message-ID: <20181101101658.31442-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8xl/=nm=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gIA2F-0003OR-N4
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 10:17:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UmVtb3ZlIHRoZSAyIHBhcnQgY29tbWVudCBvbiB0b3Agb2YgbWFwX2dyYW50X3JlZjoKICAgIC0g
VGhlIGZpcnN0IHBhcnQgbWVudGlvbiB0aGUgcmV0dXJuIHZhbHVlIHdoaWNoIGhhcyBiZWVuIHZv
aWQgc2luY2UKICAgIDIwMDYhCiAgICAtIFRoZSBzZWNvbmQgcGFydCBtZW50aW9uIGEgbG9jYWwg
dmFyaWFibGUgJ2FkZHInIHdoaWNoIGRvZXMgbm90CiAgICBleGlzdCBhbnltb3JlLgoKU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vY29t
bW9uL2dyYW50X3RhYmxlLmMgfCA3IC0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24v
Z3JhbnRfdGFibGUuYwppbmRleCA4NzhlNjY4YmY1Li4wYjU4OTRhMDcwIDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCkBA
IC04OTAsMTMgKzg5MCw2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbWFwa2luZCgKICAgICByZXR1
cm4ga2luZDsKIH0KIAotLyoKLSAqIFJldHVybnMgMCBpZiBUTEIgZmx1c2ggLyBpbnZhbGlkYXRl
IHJlcXVpcmVkIGJ5IGNhbGxlci4KLSAqIHZhIHdpbGwgaW5kaWNhdGUgdGhlIGFkZHJlc3MgdG8g
YmUgaW52YWxpZGF0ZWQuCi0gKgotICogYWRkciBpcyBfZWl0aGVyXyBhIGhvc3QgdmlydHVhbCBh
ZGRyZXNzLCBvciB0aGUgYWRkcmVzcyBvZiB0aGUgcHRlIHRvCi0gKiB1cGRhdGUsIGFzIGluZGlj
YXRlZCBieSB0aGUgR05UTUFQX2NvbnRhaW5zX3B0ZSBmbGFnLgotICovCiBzdGF0aWMgdm9pZAog
bWFwX2dyYW50X3JlZigKICAgICBzdHJ1Y3QgZ250dGFiX21hcF9ncmFudF9yZWYgKm9wKQotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
