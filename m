From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 10/31] libxl_qmp: Move buffers to the
 stack of qmp_next.
Date: Wed, 27 Jun 2018 15:32:32 +0100
Message-ID: <23347.40960.451387.595477@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-11-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYBVI-00066f-Vo
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 14:33:05 +0000
In-Reply-To: <20180601143720.24637-11-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDEwLzMxXSBsaWJ4bF9xbXA6IE1vdmUg
YnVmZmVycyB0byB0aGUgc3RhY2sgb2YgcW1wX25leHQuIik6Cj4gVGhhdCBidWZmZXIgaXMgb25s
eSB1c2VkIGxvY2FsbHksIGFuZCBuZXZlciByZXVzZSBhY2Nyb3NzIGRpZmZlcmVudCBjYWxsCj4g
b2YgcW1wX25leHQuIFNvIHJlbW92ZSBpdCBmb3JtIHRoZSBoYW5kbGVyLgoKSG93IGJpZyBpcyB0
aGlzIGJ1ZmZlciA/ICBJIHRoaW5rIHlvdSdyZSBtb3ZpbmcgaXQgZnJvbSB0aGUgaGVhcCB0bwp0
aGUgc3RhY2sgPyAgRG8gd2UgbmVlZCB0byB3b3JyeSBhYm91dCBzdGFjayBzaXplID8KClRoYW5r
cywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
