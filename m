From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v7 06/14] libxl_qmp: Implementation of
 libxl__ev_qmp_*
Date: Fri, 21 Dec 2018 15:59:40 +0000
Message-ID: <23581.3564.333685.362459@mariner.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-7-anthony.perard@citrix.com>
 <23581.2162.571088.595084@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CRbA=O6=citrix.com=prvs=886b937d6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gaNDJ-00023P-Bj
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 15:59:49 +0000
In-Reply-To: <23581.2162.571088.595084@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCB2NyAwNi8xNF0gbGlieGxfcW1wOiBJbXBs
ZW1lbnRhdGlvbiBvZiBsaWJ4bF9fZXZfcW1wXyoiKToKPiBJIGhhdmUgb25seSBmYWlybHkgbWlu
b3IgY29tbWVudHMgbm93LiAgVGhlIGJpZ2dlc3Qgb25lIHJlbWFpbmluZyBpcwo+IGFib3V0IHRo
ZSB1c2Ugb2YgRUdDX0dDIHdoaWNoIEkgdGhpbmsgcHJvYmFibHkgd2FudHMgdG8gYmVjb21lCj4g
U1RBVEVfQU9fR0MgdGhyb3VnaG91dC4gIFNlZSBiZWxvdy4uLgoKSSByZWFsaXNlIHRoYXQgSSBz
aG91bGQgc3RhdGUgZXhwbGljaXRseSB0aGF0IGxpYnhsX19ldl9xbXBfY2FsbGJhY2sKbXVzdCBz
dGlsbCBnZXQgYW4gZWdjLgoKVGhlIGVnYyBzaG91bGQgYmUgcGFzc2VkIHRocm91Z2ggYWxsIHRo
ZSBsYXllcnMsIGJ1dCBpdHMgZ2Mgc2hvdWxkCmdlbmVyYWxseSBub3QgYmUgdXNlZC4KCklhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
