From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 1/2] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
Date: Wed, 8 May 2019 11:10:40 +0100
Message-ID: <69609dfd-bb84-a03d-2657-0a06074a9863@citrix.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-2-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1556007026-31057-2-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yMy8xOSA5OjEwIEFNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gVGhlIGh5cGVyY2FsbCBlbXBsb3lz
IHRoZSBzYW1lIHZjcHVfcmVnaXN0ZXJfcnVuc3RhdGVfbWVtb3J5X2FyZWEKPiBzdHJ1Y3R1cmUg
Zm9yIHRoZSBpbnRlcmZhY2UsIGJ1dCByZXF1aXJlcyByZWdpc3RlcmVkIGFyZWEgdG8gbm90Cj4g
Y3Jvc3MgYSBwYWdlIGJvdW5kYXJ5LgoKVGhpcyBuZWVkcyBhIGxvdCBtb3JlIGluZm9ybWF0aW9u
LgoKSSB1c2UgdGhlIGZvbGxvd2luZyB0ZW1wbGF0ZSB3aGVuIHdyaXRpbmcgY2hhbmdlbG9nIGVu
dHJpZXM6CgoqIFdoYXQncyB0aGUgY3VycmVudCBzaXR1YXRpb24KKiBXaHkgaXMgdGhhdCBhIHBy
b2JsZW0KKiBIb3cgdGhpcyBwYXRjaCBmaXhlcyBpdAoqIEFueSBvdGhlciBpbmZvcm1hdGlvbiBu
ZWVkZWQgdG8gdW5kZXJzdGFuZCB0aGUgcGF0Y2guCgpZb3UgY2FuIGRyb3AgdGhpbmdzIHdoZW4g
aXQncyBvYnZpb3VzLCBidXQgaXQncyBub3QgYXQgYWxsIG9idmlvdXMgaW4KdGhpcyBjYXNlLCBh
dCBsZWFzdCB0byBtZS4KClRoaXMgc2VlbXMgdG8gYmUgaW1wbGVtZW50aW5nIGEgVkNQVU9QIHdo
aWNoIGR1cGxpY2F0ZXMgYW5vdGhlciBWQ1BVT1AncwpmdW5jdGlvbmFsaXR5LCB3aXRoIHNvbWUg
dHdlYWtzLiAgSSBjYW4gYmFjay1ndWVzcyB3aGF0IHRoZSBkaWZmZXJlbmNlcwphcmUgZnJvbSB0
aGUgZGVzY3JpcHRpb24gKGUuZywuIHRoZSBvdGhlciBvbmUgbXVzdCBiZSBhIHZpcnR1YWwgYWRk
cmVzcywKbWF5IGNyb3NzIGEgcGFnZSBib3VuZGFyeSwgJmMpLCBidXQgSSBjYW4ndCB0ZWxsIHdo
eSB0aGF0J3MgYSBwcm9ibGVtLgoKQWxzbywgSSBkb24ndCBzZWUgdGhlIHBvaW50IG9mIHNlcGFy
YXRpbmcgdGhlIGRlZmluaXRpb24gZnJvbSB0aGUKaW1wbGVtZW50YXRpb24gLS0gd2h5IG5vdCBz
cXVhc2ggdGhlc2UgdHdvIHBhdGNoZXMgdG9nZXRoZXI/CgogLUdlb3JnZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
