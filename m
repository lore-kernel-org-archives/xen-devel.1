From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/pvshim: fix GNTTABOP_query_size
 hypercall forwarding with SMAP
Date: Fri, 26 Jan 2018 15:52:38 +0000
Message-ID: <20180126155238.qxme4udlnpaqmd26@citrix.com>
References: <20180126152910.4320-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9use=ev=citrix.com=prvs=5571302b7=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ef6JP-0002hg-Mj
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 15:53:07 +0000
Content-Disposition: inline
In-Reply-To: <20180126152910.4320-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMDM6Mjk6MTBQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IERpc2FibGUgU01BUCBpbiB0aGUgc2hpbSBiZWZvcmUgYm91bmNpbmcgdGhlIGh5
cGVyY2FsbCwgb3IgZWxzZSBMMAo+IHdpbGwgZmFpbCB0byBnZXQgdGhlIGh5cGVyY2FsbCBidWZm
ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gUmVwb3J0ZWQtYnk6IEZhdGloIEFjYXIgPGZhdGloLmFjYXJAZ2FuZGkubmV0Pgo+
IC0tLQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxJYW4u
SmFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+IC0tLQo+IE5lZWRzIHRvIGJlIGJhY2twb3J0ZWQgdG8gdGhlIDQuMTAuMC1zaGltLWNvbWV0
IGJyYW5jaC4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L3B2L3NoaW0uYyB8IDMgKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L3B2L3NoaW0uYyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKPiBpbmRleCBkNTM4M2RjZmM3Li5l
YjFlZTdkM2M0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKPiArKysgYi94
ZW4vYXJjaC94ODYvcHYvc2hpbS5jCj4gQEAgLTc0OCw3ICs3NDgsMTAgQEAgc3RhdGljIGxvbmcg
cHZfc2hpbV9ncmFudF90YWJsZV9vcCh1bnNpZ25lZCBpbnQgY21kLAo+ICAgICAgfQo+ICAKPiAg
ICAgIGNhc2UgR05UVEFCT1BfcXVlcnlfc2l6ZToKPiArICAgICAgICAvKiBEaXNhYmxlIFNNQVAg
c28gTDAgY2FuIGFjY2VzcyB0aGUgYnVmZmVyLiAqLwoKSW50ZXJlc3RpbmcuCgo+ICsgICAgICAg
IHN0YWMoKTsKPiAgICAgICAgICByYyA9IHhlbl9oeXBlcmNhbGxfZ3JhbnRfdGFibGVfb3AoR05U
VEFCT1BfcXVlcnlfc2l6ZSwgdW9wLnAsIGNvdW50KTsKPiArICAgICAgICBjbGFjKCk7CgpUaGVy
ZSBpcyBzbyBmYXIgb25seSBvbmUgaW5zdGFuY2Ugb2YgdGhpcywgc28gZG9pbmcgdGhpcyBhZC1o
b2Mgc3RhYyAvCmNsYWMgaXMgT0suCgpQcm9iYWJseSBhbm90aGVyIChtb3JlIHVuaWZvcm1lZCkg
d2F5IG9mIGZpeGluZyBpdCBpcyB0byBoYXZlIG91ciBvd24KYnVmZmVyIChmb3JiaWQgcGFzc2lu
ZyB0aHJvdWdoIHVvcCBkaXJlY3RseSkgYW5kIHRoZSBjb3B5IGJhY2sgdGhlCnJlc3VsdC4gT3Ig
d2Ugc2hvdWxkIGludmVudCBhIHNldCBvZiBtYWNyb3MgdG8gZGVhbCB3aXRoIHVvcC4KCkVpdGhl
ciB3YXksIHdlJ2QgYmV0dGVyIGVzdGFibGlzaCBhIHJ1bGUgZ29pbmcgZm9yd2FyZC4KCldlaS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
