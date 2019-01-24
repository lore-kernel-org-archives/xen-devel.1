From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] iommu: fix order of arguments in
 iommu_map call at iommu_hwdom_init
Date: Thu, 24 Jan 2019 02:41:05 -0700
Message-ID: <5C4988310200007800210B94@prv1-mh.provo.novell.com>
References: <20190123180818.78684-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmbVW-0003AB-RY
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 09:41:10 +0000
In-Reply-To: <20190123180818.78684-1-roger.pau@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE5IGF0IDE5OjA4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBvcmRlciBvZiB0aGUgcGFnZV9vcmRlciBhbmQgdGhlIGZsYWdzIHBhcmFtZXRlcnMgYXJl
IGludmVydGVkIGluCj4gdGhlIGNhbGwgdG8gaW9tbXVfbWFwIG1hZGUgaW4gaW9tbXVfaHdkb21f
aW5pdC4KPiAKPiBGaXhlczogZThhZmUxMTI0Y2MxICgiaW9tbXU6IGVsaWRlIGZsdXNoaW5nIGZv
ciBoaWdoZXIgb3JkZXIgbWFwL3VubWFwIG9wZXJhdGlvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCklmIHlvdSBkb24ndCBtaW5kIEknZCBjb252ZXJ0
IHRvIFBBR0VfT1JERVJfNEsgd2hpbGUgY29tbWl0dGluZy4KCkphbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
