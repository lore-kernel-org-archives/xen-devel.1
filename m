From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v6.1 05/11] libxl_qmp: Implementation of
 libxl__ev_qmp_*
Date: Wed, 14 Nov 2018 15:49:41 +0000
Message-ID: <23532.17429.892802.594876@mariner.uk.xensource.com>
References: <20181113122844.17908-1-anthony.perard@citrix.com>
 <23530.52790.262983.714138@mariner.uk.xensource.com>
 <20181113154254.GJ1302@perard.uk.xensource.com>
 <23530.63341.244254.286242@mariner.uk.xensource.com>
 <20181114114025.GK1302@perard.uk.xensource.com>
 <23532.17069.90374.75227@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c2by=nz=citrix.com=prvs=849dfa6a4=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gMxQU-0005Vg-2E
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 15:49:58 +0000
In-Reply-To: <23532.17069.90374.75227@mariner.uk.xensource.com>
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

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCB2Ni4xIDA1LzExXSBsaWJ4bF9xbXA6IElt
cGxlbWVudGF0aW9uIG9mIGxpYnhsX19ldl9xbXBfKiIpOgo+IEl0IGlzIHByb2JhYmx5IGVhc2ll
ciB0byBpbnRyb2R1Y2UgdGhlIG5ldyBwdWJsaWMgQnJva2VuIHN0YXRlLgoKSWYgeW91IGRvIHRo
aXMgeW91IHNob3VsZCB0aGluayBhYm91dCB3aGF0IHNob3VsZCBoYXBwZW4gaWYgeW91ciBuZXh0
CmxheWVyIHVwIGF0dGVtcHRzIHRvIHJldXNlIGEgQnJva2VuIGxpYnhsX19ldl9xbXAgZm9yIGFu
IHVucmVsYXRlZApjb21tYW5kLiAgSSB0aGluayBzb21lIG9mIHRoZSB0ZWFyZG93biBhZnRlciBm
YWlsZWQgZG9tYWluIGNyZWF0aW9uCm1pZ2h0IGVuZCB1cCBkb2luZyB0aGF0LgoKSWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
