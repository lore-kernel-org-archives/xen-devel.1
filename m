From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 09/31] libxl_qmp: Move struct sockaddr_un
 variable to qmp_open()
Date: Wed, 27 Jun 2018 15:31:21 +0100
Message-ID: <23347.40889.162742.609028@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-10-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYBTh-0005yt-Si
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 14:31:25 +0000
In-Reply-To: <20180601143720.24637-10-anthony.perard@citrix.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDA5LzMxXSBsaWJ4bF9xbXA6IE1vdmUg
c3RydWN0IHNvY2thZGRyX3VuIHZhcmlhYmxlIHRvIHFtcF9vcGVuKCkiKToKLi4uCj4gQW5kIGFs
bG93IHN0cm5jcHkgdG8gdXNlIGFsbCB0aGUgc3BhY2UgaW4gc3VuX3BhdGguCgpJIHdhc24ndCBh
YmxlIHRvIHNlZSBpbiB0aGUgZGlmZiB3aGF0IHRoaXMgZW50cnkgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlCnJlZmVycyB0by4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
