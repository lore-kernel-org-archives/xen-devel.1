From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2] qemu: replace "" with <> in headers
Date: Wed, 21 Mar 2018 16:46:32 +0200
Message-ID: <1521642402-197739-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tsj0=gl=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eyf1A-0006p3-6o
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 14:47:08 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Richard W.M.
List-Id: xen-devel@lists.xenproject.org

T3VyIGN1cnJlbnQgc2NoZW1lIGlzIHRvIHVzZQogI2luY2x1ZGUgIiIKZm9yIGludGVybmFsIGhl
YWRlcnMsIGFuZAogI2luY2x1ZGUgPD4KZm9yIGV4dGVybmFsIG9uZXMuCgpVbmZvcnR1bmF0ZWx5
IHRoaXMgaXMgbm90IGJhc2VkIG9uIGNvbXBpbGVyIHN1cHBvcnQ6IGZyb20gQyBwb2ludCBvZgp2
aWV3LCB0aGUgIiIgZm9ybSBtZXJlbHkgbG9va3MgdXAgaGVhZGVycyBpbiB0aGUgY3VycmVudCBk
aXJlY3RvcnkKYW5kIHRoZW4gZmFsbHMgYmFjayBvbiA8PiBkaXJlY3Rvcmllcy4KClRodXMsIGZv
ciBleGFtcGxlLCBhIHN5c3RlbSBoZWFkZXIgdHJhY2UuaCAtIHNob3VsZCBpdCBiZSBwcmVzZW50
IC0gd2lsbApjb25mbGljdCB3aXRoIG91ciBsb2NhbCB0cmFjZS5oCgpBcyBhbm90aGVyIGV4YW1w
bGUgb2YgcHJvYmxlbXMsIGEgaGVhZGVyIGJ5IHRoZSBzYW1lIG5hbWUgaW4gdGhlIHNvdXJjZQpk
aXJlY3Rvcnkgd2lsbCBhbHdheXMgYmUgcGlja2VkIHVwIGZpcnN0IC0gYmVmb3JlIGFueSBoZWFk
ZXJzIGluCnRoZSBpbmNsdWRlIGRpcmVjdG9yeS4KCkxldCdzIGNoYW5nZSB0aGUgc2NoZW1lOiBt
YWtlIHN1cmUgYWxsIGhlYWRlcnMgdGhhdCBhcmUgbm90CmluIHRoZSBzb3VyY2UgZGlyZWN0b3J5
IGFyZSBpbmNsdWRlZCB0aHJvdWdoIGEgcGF0aApzdGFydGluZyB3aXRoIHFlbXUvICwgdGh1czoK
CiAjaW5jbHVkZSA8PgoKaGVhZGVycyBpbiB0aGUgc2FtZSBkaXJlY3RvcnkgYXMgc291cmNlIGFy
ZSBpbmNsdWRlZCB3aXRoCgogI2luY2x1ZGUgIiIKCmFzIHBlciBzdGFuZGFyZC4KClRoaXMgKHVu
dGVzdGVkKSBwYXRjaCBpcyBqdXN0IHRvIHN0YXJ0IHRoZSBkaXNjdXNzaW9uIGFuZCBkb2VzIG5v
dApjaGFuZ2UgYWxsIG9mIHRoZSBjb2RlYmFzZS4gSWYgdGhlcmUncyBhZ3JlZW1lbnQsIHRoaXMg
d2lsbCBiZQpydW4gb24gYWxsIGNvZGUgdG8gY29udmVydGluZyBjb2RlIHRvIHRoaXMgc2NoZW1l
LgoKU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KLS0t
CiBzY3JpcHRzL2NoYW5nZWhlYWRlcnMucGwgfCAyMCArKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDc1NSBzY3JpcHRz
L2NoYW5nZWhlYWRlcnMucGwKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NoYW5nZWhlYWRlcnMucGwg
Yi9zY3JpcHRzL2NoYW5nZWhlYWRlcnMucGwKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAw
MDAwMC4uMjJiZDViOAotLS0gL2Rldi9udWxsCisrKyBiL3NjcmlwdHMvY2hhbmdlaGVhZGVycy5w
bApAQCAtMCwwICsxLDIwIEBACisjIS91c3IvYmluL3BlcmwgLXBpCisKK2lmIChtQF5ccyojaW5j
bHVkZVxzKyIoW14iK10iQG8pIHsKKyAgICBuZXh0OworfQorCitteSAkaGRyID0gJDE7CitteSAk
ZmlsZSA9ICRBUkdWOworJGZpbGUgPX4gc0AvW14vXSskQEBnOworJGZpbGUgLj0gJGhkcjsKKwor
aWYgKC1lICRmaWxlKSB7CisgICAgbmV4dDsKK30KKworaWYgKG1AXlxzKiNpbmNsdWRlXHMrInFl
bXUvQG8pIHsKKyAgICBzQF4oXHMqI2luY2x1ZGVccyspInFlbXUvKFteIl0rKSIoLiopJEAkMTxx
ZW11L2NvbW1vbi8kMj4kM0BvKSB7Cit9IGVsc2UgeworICAgIHNAXihccyojaW5jbHVkZVxzKyki
KFteIl0rKSIoLiopJEAkMTxxZW11LyQyPiQzQG8pIHsKK30KLS0gCk1TVAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
