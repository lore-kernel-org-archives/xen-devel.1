From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] x86/mm/p2m: stop checking for IOMMU
 shared page tables in mmio_order()
Date: Tue, 04 Dec 2018 08:51:53 -0700
Message-ID: <5C06A2990200007800202C81@prv1-mh.provo.novell.com>
References: <20181203174017.11956-1-paul.durrant@citrix.com>
 <20181203174017.11956-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUCzP-0001uY-OV
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 15:51:59 +0000
In-Reply-To: <20181203174017.11956-5-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjEyLjE4IGF0IDE4OjQwLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IE5vdyB0aGF0IHRoZSBpb21tdV9tYXAoKSBhbmQgaW9tbXVfdW5tYXAoKSBvcGVyYXRpb25z
IHRha2UgYW4gb3JkZXIKPiBwYXJhbWV0ZXIgYW5kIGVsaWRlIGZsdXNoaW5nIHRoZXJlJ3Mgbm8g
c3Ryb25nIHJlYXNvbiB3aHkgbW9kaWZ5aW5nIE1NSU8KPiByYW5nZXMgaW4gdGhlIHAybSBzaG91
bGQgYmUgcmVzdHJpY3RlZCB0byBhIDRrIGdyYW51bGFyaXR5IHNpbXBseSBiZWNhdXNlCj4gdGhl
IElPTU1VIGlzIGVuYWJsZWQgYnV0IHNoYXJlZCBwYWdlIHRhYmxlcyBhcmUgbm90IGluIG9wZXJh
dGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPgoKQmFzZWQgb24gdGhlIG90aGVyIHJlcGx5IG9mIHlvdXJzOgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
