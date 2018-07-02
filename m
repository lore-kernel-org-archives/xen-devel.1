From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: PCI Pass-through / Config Space emulation for ARM64
Date: Mon, 2 Jul 2018 16:16:05 +0530
Message-ID: <b308cb63-a163-643f-da79-2695732cd228@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b+ax=js=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1fZwLm-0004Kl-Lv
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 10:46:30 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'xen-devel' <xen-devel@lists.xenproject.org>
Cc: 'Vikram Sethi' <vikrams@qti.qualcomm.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQWxsLAoKUENJLVBUIGFuZCBQQ0kgY29uZmlnIHNwYWNlIGVtdWxhdGlvbiBoYXZlIGJlZW4g
aW4gZGlzY3Vzc2lvbiBmb3IgcXVpdGUgCmEgbG9uZyB0aW1lLgpXZSBoYWQgc3RhcnRlZCBzb21l
IHdvcmsgb24gdGhpcyBpbiBwYXN0IGFuZCBpbiBMRUctWEVOIGJ1dCB0aGF0IGRpZG50IApnbyBm
YXIgYW5kIHRoZSBncm91cCBpcyBjbG9zZWQuCgpJIGJlbGlldmUgdGhhdCBQQ0ktUFQgaXMgYSBm
ZWF0dXJlIHdoaWNoIHdvdWxkIGJlIHN1aXRhYmxlIGZvciBub3Qgb25seSAKZm9yIHNlcnZlcnMg
YnV0IGZvciBlbWJlZGRlZCBwbGF0Zm9ybXMgYXMgd2VsbC4KCkkgd291bGQgbGlrZSBrbm93IHRo
ZSBpbnRlcmVzdCBpbiB0aGUgZGV2ZWxvcGVyIGNvbW11bml0eSBvbiB0aGlzLCBzbyAKdGhhdCB3
ZSBjYW4gYmUKYWJsZSB0byBjb21wbGV0ZSB0aGlzIGluIHRoZSB0aW1lIGZyYW1lIG9mIDQuMTIg
cmVsZWFzZS4KTXkgaWRlYSBpcyB0aGF0IHdlIGNhbiBmb3JtIGEgc21hbGwgZ3JvdXAgYW5kIHNw
bGl0IHVwIHRoZSB3b3JrIGFzIHBlciAKaW50ZXJlc3QuCgotVGhhbmtzCk1hbmlzaAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
