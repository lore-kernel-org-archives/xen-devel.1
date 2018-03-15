From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 11/11] vpci/msix: add MSI-X handlers
Date: Thu, 15 Mar 2018 16:33:02 +0000
Message-ID: <20180315163302.rqolvhuejjgzhoo5@MacBook-Pro-de-Roger.local>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-12-roger.pau@citrix.com>
 <5AA9641002000078001B1B1F@prv-mh.provo.novell.com>
 <20180315120150.atxleuqdm3dbw7kz@MacBook-Pro-de-Roger.local>
 <5AAA791602000078001B2214@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i8qd=gf=citrix.com=prvs=6054e4102=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ewWDx-0008ND-IN
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 16:59:29 +0000
Content-Disposition: inline
In-Reply-To: <5AAA791602000078001B2214@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMDY6NDU6NThBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE1LjAzLjE4IGF0IDEzOjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTE6MDQ6MDBBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE0LjAzLjE4IGF0IDE1OjA0LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gKyAgICAgICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0
aXJxcygpOwo+ID4+IAo+ID4+IENhcmVmdWwgLSBpcyB0aGlzIHZhbGlkIHdpdGggYSBzcGluIGxv
Y2sgaGVsZD8gTm90ZSBob3cgZS5nLgo+ID4+IGR1bXBfZG9tYWlucygpIGhvbGRzIGFuIFJDVSBs
b2NrIG9ubHkuCj4gPiAKPiA+IEl0IHdvcmtzIEFUTSwgYnV0IEkgZ3Vlc3MgdGhlcmUgY291bGQg
YmUgaXNzdWVzIGlmIGF0IHNvbWUgcG9pbnQgdGhlCj4gPiBzb2Z0aXJxcyBuZWVkIHRvIHVzZSB0
aGUgdnBjaSBsb2NrLiBJIHdpbGwgYWRkIGEgcGFpciBvZiB1bmxvY2svbG9jawo+ID4gYXJvdW5k
IGl0Lgo+IAo+IFByb3ZpZGVkIHRoYXQgaXMgc2FmZS4KCkhtLCBtc2l4IGNvdWxkIGJlIGZyZWVk
IHVuZGVyIG91ciBmZWV0LCBidXQgSSBkb24ndCBzZWUgYW55IG90aGVyCm9idmlvdXMgc29sdXRp
b24gdG8gdGhpcyBpc3N1ZSBBVE0uIEkgdGhpbmsgYXMgYSBmb2xsb3cgdXAgSSBzaG91bGQKbW92
ZSB0aGUgdnBjaSBsb2NrIG91dHNpZGUgb2YgdGhlIHZwY2kgc3RydWN0LgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
