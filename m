From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 1/8] dom0/pvh: align allocation and
 mapping order to start address
Date: Tue, 05 Feb 2019 04:38:34 -0700
Message-ID: <5C5975BA0200007800213EA7@prv1-mh.provo.novell.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-2-roger.pau@citrix.com>
 <5C586B3E0200007800213BCA@prv1-mh.provo.novell.com>
 <20190204171108.dud4pm5wynb6cpmj@mac>
 <5C593E4A0200007800213D0F@prv1-mh.provo.novell.com>
 <20190205102631.4u4a3yb3zte5xn4q@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gqz3n-0005mX-T3
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 11:38:39 +0000
In-Reply-To: <20190205102631.4u4a3yb3zte5xn4q@mac>
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

Pj4+IE9uIDA1LjAyLjE5IGF0IDExOjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFdvdWxkIHlvdSBiZSBmaW5lIHdpdGggdGhlIGZvbGxvd2luZyBtZXNzYWdlOgo+IAo+ICIKPiBU
aGUgcDJtIGFuZCBpb21tdSBtYXBwaW5nIGNvZGUgYWx3YXlzIGhhZCB0aGUgcmVxdWlyZW1lbnQg
dGhhdAo+IGFkZHJlc3NlcyBhbmQgb3JkZXJzIG11c3QgYmUgYWxpZ25lZCB3aGVuIHBvcHVsYXRp
bmcgdGhlIHAybSBvciB0aGUKPiBpb21tdSBwYWdlIHRhYmxlcy4KPiAKPiBQVkggZG9tMCBidWls
ZGVyIGRpZG4ndCB0YWtlIHRoaXMgcmVxdWlyZW1lbnQgaW50byBhY2NvdW50LCBhbmQgY2FuCj4g
Y2FsbCBpbnRvIHRoZSBwMm0vaW9tbXUgbWFwcGluZyBoZWxwZXJzIHdpdGggYWRkcmVzc2VzIGFu
ZCBvcmRlcnMgdGhhdAo+IGFyZSBub3QgYWxpZ25lZC4KPiAKPiBGaXggdGhpcyBieSBtYWtpbmcg
c3VyZSB0aGUgb3JkZXJzIHBhc3NlZCB0byB0aGUgcGh5c21hcCBwb3B1bGF0aW9uCj4gaGVscGVy
cyBhcmUgYWx3YXlzIGFsaWduZWQgdG8gdGhlIGd1ZXN0IGFkZHJlc3MgdG8gYmUgcG9wdWxhdGVk
Lgo+ICIKCkxHVE0sIGJ1dCBpdCBsb29rcyB0aGVyZSdzIHdpZGVyIGRpc2FncmVlbWVudCAoYXMg
cGVyIHRoZSBvdGhlcgpzdWItdGhyZWFkKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
