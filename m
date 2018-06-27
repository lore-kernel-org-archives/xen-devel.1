From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 29/31] libxl_disk: Have
 libxl_cdrom_insert use libxl__ev_qmp
Date: Wed, 27 Jun 2018 17:12:18 +0100
Message-ID: <23347.46946.14935.527965@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-30-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYD3O-0008HY-AI
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 16:12:22 +0000
In-Reply-To: <20180601143720.24637-30-anthony.perard@citrix.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDI5LzMxXSBsaWJ4bF9kaXNrOiBIYXZl
IGxpYnhsX2Nkcm9tX2luc2VydCB1c2UgbGlieGxfX2V2X3FtcCIpOgo+IFNvIHdoZW4gUUVNVSBp
cyBpbnZvbHZlLCB0aGUgb3BlcmF0aW9uIHdpbGwgYmUgYXN5bmNocm9uZSBhbmQgd2lsbAo+IGZp
bmlzaCBsYXRlci4KClRoaXMgbG9va3Mgcm91Z2hseSBwbGF1c2libGUsIGluIHRoZSBzZW5zZSB0
aGF0IGlmIHlvdSBhZGRyZXNzIG15CmludGVybmFsIEFQSSBjb25jZXJucywgYW5kIG1ha2UgdGhp
cyBwYXJ0IGZpdCBhZ2FpbiwgaXQgd2lsbCBwcm9iYWJseQpiZSBnb29kLgoKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
