From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 15/31] libxl_qmp_ev: Implement fd
 callback and read data
Date: Wed, 27 Jun 2018 16:10:18 +0100
Message-ID: <23347.43226.684654.141150@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-16-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYC5S-0002UP-0E
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 15:10:26 +0000
In-Reply-To: <20180601143720.24637-16-anthony.perard@citrix.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDE1LzMxXSBsaWJ4bF9xbXBfZXY6IElt
cGxlbWVudCBmZCBjYWxsYmFjayBhbmQgcmVhZCBkYXRhIik6Cj4gRmlyc3Qgc3RlcCBpbnRvIHRh
a2luZyBjYXJlIG9mIHRoZSBpbnB1dCBmcm9tIFFFTVUncyBRTVAgc29ja2V0LiBGb3IKPiBub3cs
IHdlIHJlYWQgZGF0YSBhbmQgc3RvcmUgdGhlbSBpbiBidWZmZXJzLgoKSG93IGJpZyBpcyB0aGlz
IGRhdGEgPyAgSXMgYWxsIHRoaXMgYnVzaW5lc3Mgd2l0aCBhIGxpbmtlZCBsaXN0IG9mCmJ1ZmZl
cnMgcmVhbGx5IG5lY2Vzc2FyeSA/CgooTWF5YmUgSSBzaG91bGQgYmUgcmVhZGluZyB0aGlzIGFz
IGEgZmluYWwgdHJlZSBzdGF0ZSByYXRoZXIgdGhhbiBhcwppbmRpdmlkdWFsIHBhdGNoZXMuKQoK
SWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
