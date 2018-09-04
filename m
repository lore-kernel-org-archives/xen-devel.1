From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 02/14] iommu: make use of type-safe BFN
 and MFN in exported functions
Date: Tue, 04 Sep 2018 04:29:41 -0600
Message-ID: <5B8E5E9502000078001E5107@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fx8ag-0007Rp-Rd
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 10:29:46 +0000
In-Reply-To: <20180823094711.21376-3-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ2LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlIGRlY2xhcmF0aW9uIG9mIHRoZSBlbnRyeSBwb2lu
dHMgdG8gdGhlIElPTU1VCj4gc3ViLXN5c3RlbSB0byB1c2UgYmZuX3QgYW5kIG1mbl90IGluIHBs
YWNlIG9mIHVuc2lnbmVkIGxvbmcuIEEgc3Vic2VxdWVudAo+IHBhdGNoIHdpbGwgc2ltaWxhcmx5
IG1vZGlmeSB0aGUgbWV0aG9kcyBpbiB0aGUgaW9tbXVfb3BzIHN0cnVjdHVyZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmll
d2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CihvYnZpb3VzbHkgc3ViamVjdCB0byBwb3NzaWJsZSByZW5hbWluZyBh
cyBwZXIgZGlzY3Vzc2lvbiBvbiBwYXRjaCAxKQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
