From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Xen-unstable PVHdom0: Assertion
 'IS_ALIGNED(dfn_x(dfn), (1ul << page_order))' failed at iommu.c:324
Date: Fri, 8 Feb 2019 16:10:53 +0100
Message-ID: <20190208151053.573gy7jnr7jymu4e@mac>
References: <5ae1965e-9e31-b796-5a37-dfd211b3bd98@eikelenboom.it>
 <20190123182500.fc3nsnjisnbr6qbb@mac>
 <d9272bac-54d6-f4b3-7573-412ac0f048b3@eikelenboom.it>
 <20190124075021.pqwgywacacsun7zd@mac>
 <4da92f88-34ea-30fb-9ff2-5ef72455dab7@eikelenboom.it>
 <20190124101100.iuflmkbbuol3eluz@mac>
 <823f206d-1838-1ed9-0c9f-aaea5afaff3e@eikelenboom.it>
 <20190124120431.hdiojrypvost77pm@mac>
 <20190125143853.3lx7owqixflnygwj@mac>
 <d1414107-2fc8-f686-79ab-77bb38a60b89@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vjt5=QP=citrix.com=prvs=93599dd81=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gs7nu-0006ra-K5
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 15:10:58 +0000
Content-Disposition: inline
In-Reply-To: <d1414107-2fc8-f686-79ab-77bb38a60b89@eikelenboom.it>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgMDc6NDQ6NDBQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IE9uIDI1LzAxLzIwMTkgMTU6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPiBPbiBUaHUsIEphbiAyNCwgMjAxOSBhdCAwMTowNDozMVBNICswMTAwLCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOgo+ID4gU29ycnksIGZpeGluZyB0aGF0IGVycm9yIHRvb2sgbG9uZ2VyIHRo
YW4gZXhwZWN0ZWQsIGFuZCByZXF1aXJlcwo+ID4gbW9kaWZ5aW5nIHF1aXRlIGEgbG90IG9mIGNv
ZGUsIHNvIEknbSBub3Qgc3VyZSB3aGV0aGVyIGl0J3Mgc29tZXRoaW5nCj4gPiB0byBjb25zaWRl
ciBmb3IgNC4xMiwgSSBoYXZlIHRvIHRoaW5rIGFib3V0IGl0Lgo+IAo+IEkgdW5kZXJzdGFuZCwg
ZXNwZWNpYWxseSBzaW5jZSBQVkggZG9tMCBpcyBtYXJrZWQgYXMgZXhwZXJpbWVudGFsLgo+IAo+
ID4gSW4gdGhlIG1lYW50aW1lLCBjYW4geW91IHBsZWFzZSB0ZXN0IHRoZSBmb2xsb3dpbmcgYnJh
bmNoOgo+ID4gCj4gPiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL3JveWdlci94ZW4uZ2l0
IGlvbW11LWZpeGVzLXYyCj4gPiAKPiA+IEkndmUgYmVlbiBhYmxlIHRvIHN1Y2Nlc3NmdWxseSBj
cmVhdGUgYSBQVkggZ3Vlc3QgZnJvbSBhIFBWSCBkb20wIG9uCj4gPiBBTUQgaGFyZHdhcmUgdXNp
bmcgdGhpcyBicmFuY2guCj4gCj4gT24gdGhlIG90aGVyIGhhbmQsIHdpdGggYSBxdWljayB0ZXN0
IEkgY2FuIGNvbmZpcm0gdGhhdCBib290aW5nIGEgUFZIIGd1ZXN0IGZyb20gYSBQVkggZG9tMCBu
b3cgd29ya3MgZm9yIG1lIGFzIHdlbGwgISAKPiAoYW5kIGJvb3RpbmcgdGhpcyBidWlsZCBhcyBQ
ViBkb20wLCB3aXRoIG15IG5vcm1hbCBQVkgvSFZNIG1peCBvZiBndWVzdHMgc3RpbGwgd29ya3Ms
IG5vIHJlZ3Jlc3Npb25zIGZvciBtZSBzbyBmYXIpCgpTb3JyeSBmb3IgYm90aGVyaW5nIHlvdSBh
Z2FpbiwgYnV0IGNvdWxkIHlvdSBnaXZlIHRoZSBmb2xsb3dpbmcgYnJhbmNoCmEgdGVzdDoKCmdp
dDovL3hlbmJpdHMueGVuLm9yZy9wZW9wbGUvcm95Z2VyL3hlbi5naXQgZml4ZXMtNC4xMi12MgoK
WW91IHNob3VsZCBob3BlZnVsbHkgYmUgYWJsZSB0byBib290IGEgcHZoIGRvbTAgYW5kIGNyZWF0
ZSBndWVzdHMgZnJvbQppdCBvbiB5b3VyIEFNRCBoYXJkd2FyZS4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
