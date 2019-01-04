From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: take alignment into
 account when populating p2m in PVH mode
Date: Fri, 04 Jan 2019 07:42:35 -0700
Message-ID: <5C2F70DB020000780020A3EC@prv1-mh.provo.novell.com>
References: <20181228111857.49444-1-roger.pau@citrix.com>
 <20181228111857.49444-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gfQgM-0003y7-QI
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 14:42:42 +0000
In-Reply-To: <20181228111857.49444-2-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjEyLjE4IGF0IDEyOjE4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9kb20wX2J1aWxkLmMKPiBAQCAtOTEsMTYgKzkxLDU0IEBAIHN0YXRpYyBpbnQgX19pbml0
IHB2aF9wb3B1bGF0ZV9tZW1vcnlfcmFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgbnJfcGFnZXMpCj4gIHsKPiAtICAgIHVuc2lnbmVkIGludCBvcmRlciA9IE1BWF9PUkRFUiwg
aSA9IDA7Cj4gKyAgICBzdHJ1Y3Qgewo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgYWxpZ247CgpJ
dCdzIC5pbml0LiogZGF0YSBvbmx5LCBidXQgYW55d2F5IC0gd2h5ICJsb25nIiBpbnN0ZWFkIG9m
ICJpbnQiPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
