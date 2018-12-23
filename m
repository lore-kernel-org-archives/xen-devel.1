From: Tom Psyborg <pozega.tomislav@gmail.com>
Subject: Re: [PATCH 00/20] drop useless LIST_HEAD
Date: Sun, 23 Dec 2018 22:49:15 +0100
Message-ID: <CAKR_QVJefW1vxYb7-qiU8=0YdbFghYo15SK2eGjOC-dntRfyYA__14746.3267938749$1545654053$gmane$org@mail.gmail.com>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NRUG=PA=gmail.com=pozega.tomislav@srs-us1.protection.inumbo.net>)
 id 1gbBca-0007ty-Gv
 for xen-devel@lists.xenproject.org; Sun, 23 Dec 2018 21:49:16 +0000
Received: by mail-oi1-x242.google.com with SMTP id w13so8861503oiw.9
 for <xen-devel@lists.xenproject.org>; Sun, 23 Dec 2018 13:49:15 -0800 (PST)
In-Reply-To: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

V2h5IGRvIHlvdSBDQyB0aGlzIHRvIHNvIG1hbnkgbGlzdHM/CgpPbiAyMy8xMi8yMDE4LCBKdWxp
YSBMYXdhbGwgPEp1bGlhLkxhd2FsbEBsaXA2LmZyPiB3cm90ZToKPiBEcm9wIExJU1RfSEVBRCB3
aGVyZSB0aGUgdmFyaWFibGUgaXQgZGVjbGFyZXMgaXMgbmV2ZXIgdXNlZC4KPgo+IC0tLQo+Cj4g
IGRyaXZlcnMvZG1hL2F0X2hkbWFjLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgNSAtLS0tLQo+ICBkcml2ZXJzL2RtYS9kdy9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDEgLQo+ICBkcml2ZXJzL2RtYS9wbDMzMC5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQo+ICBkcml2ZXJzL2RtYS9zYTExeDAtZG1hLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgLS0KPiAgZHJpdmVycy9kbWEvc3Rf
ZmRtYS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAzIC0tLQo+ICBkcml2
ZXJzL2luZmluaWJhbmQvdWxwL2lwb2liL2lwb2liX2liLmMgICAgICAgICAgICAgICB8ICAgIDEg
LQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWxsYW5veC9tbHg0L3Jlc291cmNlX3RyYWNrZXIu
YyB8ICAgIDUgLS0tLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVsbGFub3gvbWx4NS9jb3Jl
L2VuX3RjLmMgICAgICAgfCAgICAzIC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWxsYW5v
eC9tbHhzdy9zcGVjdHJ1bS5jICAgICAgICB8ICAgIDEgLQo+ICBkcml2ZXJzL25ldC93aXJlbGVz
cy9zdC9jdzEyMDAvcXVldWUuYyAgICAgICAgICAgICAgICB8ICAgIDEgLQo+ICBkcml2ZXJzL3Nj
c2kvbHBmYy9scGZjX252bWUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgLS0KPiAg
ZHJpdmVycy9zY3NpL2xwZmMvbHBmY19zY3NpLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICAyIC0tCj4gIGRyaXZlcnMvc2NzaS9scGZjL2xwZmNfc2xpLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgMSAtCj4gIGRyaXZlcnMvc2NzaS9xbGEyeHh4L3FsYV9pbml0LmMgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgMSAtCj4gIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfZGV2
X2Zyb250ZW5kLmMgICAgICAgICAgICAgIHwgICAgMiAtLQo+ICBmcy9idHJmcy9yZWxvY2F0aW9u
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQo+ICBmcy9uZnMvbmZz
NGNsaWVudC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQo+ICBm
cy9uZnNkL25mczRsYXlvdXRzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
IDEgLQo+ICBmcy94ZnMveGZzX2J1Zi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDEgLQo+ICBmcy94ZnMveGZzX2Zzb3BzLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgIDEgLQo+ICAyMCBmaWxlcyBjaGFuZ2VkLCAzNiBkZWxldGlvbnMo
LSkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
