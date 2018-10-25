From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Thu, 25 Oct 2018 17:45:35 +0000
Message-ID: <b8a2e687-2d15-950d-dd6e-f184de9e6672@epam.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
 <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
 <23a2ae51-670e-8fb2-b589-4e63a4a27e7c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23a2ae51-670e-8fb2-b589-4e63a4a27e7c@arm.com>
Content-Language: en-US
Content-ID: <51F52BD8BBF57A4BAEFE71D26F4E63A2@EPAM.onmicrosoft.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDI1LjEwLjE4IDE3OjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gWW91IG1pc3JlYWQgd2hh
dCBJIHdyb3RlLiBUaGV5IGFyZSBub3QgbmVlZGVkIHRvIGNvdmVyIHRoZSB2R0lDIGZvciAKPiBH
SUN2MiBwbGF0Zm9ybS4gSG93ZXZlciB0aGV5IGFyZSBzdGlsbCBuZWNlc3NhcnksIGZvciBpbnN0
YW5jZSwgZm9yIAo+IHRoZSB0aW1lciBhcyBpdCBpcyBhY2Nlc3NpYmxlIHZpYSBzeXN0ZW0gcmVn
aXN0ZXJzLgoKQWgsIE9LLgoKCj4gSGVyZSB0aGUgaXNiKCkgc2l0cyBiZXR3ZWVuIGFjaygpIGFu
ZCBkb19JUlEoKS4KPgo+IFRoaXMgZW5zdXJlIHRoZSBzeXN0ZW0gcmVnaXN0ZXJzIGFyZSBzeW5j
aHJvbml6ZWQgYWZ0ZXIgeW91IAo+IGFja25vd2xlZGdlIGFuIGludGVycnVwdC4KCkkgc2VlLgoK
Ci0tIAoKKkFuZHJpaSBBbmlzb3YqCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
