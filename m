From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 01/11] vpci: introduce basic handlers to
 trap accesses to the PCI config space
Date: Wed, 14 Mar 2018 08:31:03 -0600
Message-ID: <5AA9403702000078001B1994@prv-mh.provo.novell.com>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=0lyu=ge=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ew7Qx-0006hD-1w
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 14:31:15 +0000
In-Reply-To: <20180314140408.40947-2-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDE1OjAzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL0tjb25maWcKPiArKysgYi94ZW4vZHJpdmVycy9LY29uZmlnCj4g
QEAgLTEyLDQgKzEyLDYgQEAgc291cmNlICJkcml2ZXJzL3BjaS9LY29uZmlnIgo+ICAKPiAgc291
cmNlICJkcml2ZXJzL3ZpZGVvL0tjb25maWciCj4gIAo+ICtzb3VyY2UgImRyaXZlcnMvdnBjaS9L
Y29uZmlnIgoKQXJlIHRoZXJlIG1vcmUgdGhpbmdzIHRvIGFwcGVhciBpbiB0aGF0IG5ldyBmaWxl
PyBJZiBub3QsIHdoYXQgdGhlCnBvaW50IG9mIGludHJvZHVjaW5nIGl0PwoKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9LY29uZmlnCj4gQEAgLTAsMCArMSw0IEBACj4g
Kwo+ICtjb25maWcgSEFTX1ZQQ0kKPiArCWJvb2wKPiArCWRlcGVuZHMgb24gSEFTX1BDSQoKU28g
dGhpcyBpcyBvbmUgb2YgdGhvc2UgY29tbW9uIEtjb25maWcgaXNzdWVzOiBXaGVuIHRoZXJlJ3Mg
bm8KcHJvbXB0LCBhbnkgImRlcGVuZHMgb24iIGNhbiBhdCBiZXN0IGxlYWQgdG8gd2FybmluZ3Mg
dGhlIHRvb2wKaXNzdWVzIGFuZCBuby1vbmUgcGF5cyBhdHRlbnRpb24gdG8uIEkgY2FuIG9ubHkg
YWR2aXNlIHRvIGF2b2lkCnN1Y2ggZGVwZW5kZW5jaWVzLiBJZiBhbnlvbmUgZ2V0cyB0aGUgc2Vs
ZWN0cyB3cm9uZywgdGhlcmUnbGwKYmUgYSBidWlsZCBmYWlsdXJlIHNvbWV3aGVyZSBpbmRlcGVu
ZGVudCBvZiBzYWlkIHdhcm5pbmcuCgpXaXRoIHRoZXNlIHRha2VuIGNhcmUgb2YsIGZlZWwgZnJl
ZSB0byByZWluc3RhdGUKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KKEkgdGhpbmsgdGhlIGFkanVzdG1lbnRzIGNvdWxkIGFsc28gYmUgZG9uZSB3aGlsZSBjb21t
aXR0aW5nLAppZiBlbm91Z2ggb2YgdGhlIHNlcmllcyBiZWNvbWVzIHJlYWR5IHRvIHdhcnJhbnQg
cHV0dGluZyBpbgphdCBsZWFzdCBwYXJ0IG9mIGl0OyBJIHRoaW5rIGl0IHdhcyByZWFsbHkgdGhl
IGxhY2sgb2YgYW4gQVJNIHNpZGUKYWNrIHdoaWNoIHByZXZlbnRlZCBtZSBmcm9tIGRvaW5nIHRo
aXMgb24gdjggYWxyZWFkeS4pCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
