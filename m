From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] iommu: fix order of arguments in
 iommu_map call at iommu_hwdom_init
Date: Thu, 24 Jan 2019 02:49:58 -0700
Message-ID: <5C498A460200007800210BB4@prv1-mh.provo.novell.com>
References: <20190123180818.78684-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmbe5-0003sh-QZ
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 09:50:01 +0000
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE5IGF0IDE5OjA4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBvcmRlciBvZiB0aGUgcGFnZV9vcmRlciBhbmQgdGhlIGZsYWdzIHBhcmFtZXRlcnMgYXJl
IGludmVydGVkIGluCj4gdGhlIGNhbGwgdG8gaW9tbXVfbWFwIG1hZGUgaW4gaW9tbXVfaHdkb21f
aW5pdC4KPiAKPiBGaXhlczogZThhZmUxMTI0Y2MxICgiaW9tbXU6IGVsaWRlIGZsdXNoaW5nIGZv
ciBoaWdoZXIgb3JkZXIgbWFwL3VubWFwIG9wZXJhdGlvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKSSBub3RpY2UgeW91IGRpZG4n
dCBDYyBKw7xyZ2VuIC0gbm93IGRvbmUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
