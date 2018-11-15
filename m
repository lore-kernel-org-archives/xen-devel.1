From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 3/3] x86/shadow: emulate_gva_to_mfn() should
 respect p2m_ioreq_server
Date: Thu, 15 Nov 2018 05:51:48 -0700
Message-ID: <5BED6BE402000078001FC625@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BED6A7E02000078001FC615@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNH7g-00016X-Ot
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 12:51:52 +0000
In-Reply-To: <5BED6A7E02000078001FC615@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V3JpdGVzIHRvIHN1Y2ggcGFnZXMgbmVlZCB0byBiZSBoYW5kZWQgdG8gdGhlIGVtdWxhdG9yLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IFJl
dHVybiBCQURfR0ZOX1RPX01GTiBpbnN0ZWFkLgoKLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRv
dy9odm0uYworKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2h2bS5jCkBAIC0zMzgsNiArMzM4
LDExIEBAIHN0YXRpYyBtZm5fdCBlbXVsYXRlX2d2YV90b19tZm4oc3RydWN0IHYKICAgICB7CiAg
ICAgICAgIHJldHVybiBfbWZuKEJBRF9HRk5fVE9fTUZOKTsKICAgICB9CisgICAgaWYgKCBwMm10
ID09IHAybV9pb3JlcV9zZXJ2ZXIgKQorICAgIHsKKyAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cisg
ICAgICAgIHJldHVybiBfbWZuKEJBRF9HRk5fVE9fTUZOKTsKKyAgICB9CiAgICAgaWYgKCBwMm1f
aXNfZGlzY2FyZF93cml0ZShwMm10KSApCiAgICAgewogICAgICAgICBwdXRfcGFnZShwYWdlKTsK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
