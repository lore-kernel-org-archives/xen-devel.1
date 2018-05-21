From: Huaisheng HS1 Ye <yehs1@lenovo.com>
Subject: [RFC PATCH v2 06/12] drivers/xen/swiotlb-xen: update
 usage of address zone modifiers
Date: Mon, 21 May 2018 17:58:29 +0000
Message-ID: <HK2PR03MB1684F5870EE8D64A2B54635692950__41894.0024952919$1526961136$gmane$org@HK2PR03MB1684.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ozro=ii=lenovo.com=yehs1@srs-us1.protection.inumbo.net>)
 id 1fKp56-0001Wj-17
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 17:58:48 +0000
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "willy@infradead.org" <willy@infradead.org>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "jgross@suse.com" <jgross@suse.com>, "mhocko@suse.com" <mhocko@suse.com>, Ocean HY1 He <hehy1@lenovo.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "colyli@suse.de" <colyli@suse.de>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, "hch@lst.de" <hch@lst.de>, "vbabka@suse.cz" <vbabka@suse.cz>
List-Id: xen-devel@lists.xenproject.org

VXNlIF9fR0ZQX1pPTkVfTUFTSyB0byByZXBsYWNlIChfX0dGUF9ETUEgfCBfX0dGUF9ISUdITUVN
KS4KCkluIGZ1bmN0aW9uIHhlbl9zd2lvdGxiX2FsbG9jX2NvaGVyZW50LCBpdCBpcyBvYnZpb3Vz
IHRoYXQgX19HRlBfRE1BMzIKaXMgbm90IHRoZSBleHBlY3Rpbmcgem9uZSB0eXBlLgoKX19fR0ZQ
X0RNQSwgX19fR0ZQX0hJR0hNRU0gYW5kIF9fX0dGUF9ETUEzMiBoYXZlIGJlZW4gZGVsZXRlZCBm
cm9tIEdGUCAKYml0bWFza3MsIHRoZSBib3R0b20gdGhyZWUgYml0cyBvZiBHRlAgbWFzayBpcyBy
ZXNlcnZlZCBmb3Igc3RvcmluZwplbmNvZGVkIHpvbmUgbnVtYmVyLgpfX0dGUF9ETUEsIF9fR0ZQ
X0hJR0hNRU0gYW5kIF9fR0ZQX0RNQTMyIHNob3VsZCBub3QgYmUgb3BlcmF0ZWQgd2l0aAplYWNo
IG90aGVycyBieSBPUi4gCgpTaWduZWQtb2ZmLWJ5OiBIdWFpc2hlbmcgWWUgPHllaHMxQGxlbm92
by5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMveGVuL3N3aW90bGIteGVu
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIGIvZHJpdmVycy94ZW4vc3dp
b3RsYi14ZW4uYwppbmRleCA1YmI3MmQzLi4wMGU4MzY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hl
bi9zd2lvdGxiLXhlbi5jCisrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKQEAgLTMxNSw3
ICszMTUsNyBAQCBpbnQgX19yZWYgeGVuX3N3aW90bGJfaW5pdChpbnQgdmVyYm9zZSwgYm9vbCBl
YXJseSkKICAgICAgICAqIG1hY2hpbmUgcGh5c2ljYWwgbGF5b3V0LiAgV2UgY2FuJ3QgYWxsb2Nh
dGUgaGlnaG1lbQogICAgICAgICogYmVjYXVzZSB3ZSBjYW4ndCByZXR1cm4gYSBwb2ludGVyIHRv
IGl0LiAKICAgICAgICAqLwotICAgICAgIGZsYWdzICY9IH4oX19HRlBfRE1BIHwgX19HRlBfSElH
SE1FTSk7CisgICAgICAgZmxhZ3MgJj0gfl9fR0ZQX1pPTkVfTUFTSzsKIAogICAgICAgIC8qIE9u
IEFSTSB0aGlzIGZ1bmN0aW9uIHJldHVybnMgYW4gaW9yZW1hcCdwZWQgdmlydHVhbCBhZGRyZXNz
IGZvciAKICAgICAgICAgKiB3aGljaCB2aXJ0X3RvX3BoeXMgZG9lc24ndCByZXR1cm4gdGhlIGNv
cnJlc3BvbmRpbmcgcGh5c2ljYWwKLS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
