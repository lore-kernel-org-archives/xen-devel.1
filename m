From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] vpci/msi: fix updating already bound
 MSI interrupts
Date: Tue, 8 May 2018 10:40:28 +0100
Message-ID: <20180508094028.m4tpifnchhyolkaj@MacBook-Pro-de-Roger.local>
References: <20180508092359.6829-1-roger.pau@citrix.com>
 <75378768-2fb2-1ec3-3091-62380224fb96@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=klyg=h3=citrix.com=prvs=65938511e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fFz6r-0006Em-0d
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 09:40:37 +0000
Content-Disposition: inline
In-Reply-To: <75378768-2fb2-1ec3-3091-62380224fb96@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMDgsIDIwMTggYXQgMTE6MzA6MThBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAwOC8wNS8xOCAxMToyMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gSGVs
bG8sCj4gPiAKPiA+IFRoZXJlJ3MgYSBidWcgaW4gY3VycmVudCB2cGNpIGNvZGUgZm9yIE1TSSBl
bXVsYXRpb24gd2hlbiB1cGRhdGluZyBhbgo+ID4gYWxyZWFkeSBib3VuZCBpbnRlcnJ1cHQuIFRo
ZSBjb2RlIHdpbGwgZGlzYWJsZSBhbmQgZW5hYmxlIHRoZSBpbnRlcnJ1cHQKPiA+IGluIG9yZGVy
IHRvIHVwZGF0ZSB0aGUgYmluZGluZywgd2hpY2ggY2FsbHMgdW5tYXBfZG9tYWluX3BpcnEgdGhh
dAo+ID4gZGlzYWJsZXMgdGhlIGdsb2JhbCBNU0kgZW5hYmxlIGZsYWcgaW4gdGhlIGNvbnRyb2wg
cmVnaXN0ZXIuCj4gPiAKPiA+IEluIG9yZGVyIHRvIGZpeCB0aGlzIGluY29ycmVjdCBiZWhhdmlv
ciBpbnRyb2R1Y2UgYSBuZXcgdXBkYXRlIGhlbHBlcgo+ID4gdGhhdCBzaG91bGQgYmUgdXNlZCB0
byB1cGRhdGUgdGhlIGJpbmRpbmdzIG9mIGFuIGFscmVhZHkgZW5hYmxlZCBncm91cAo+ID4gb2Yg
TVNJIGludGVycnVwdHMuCj4gPiAKPiA+IFRoYW5rcywgUm9nZXIuCj4gPiAKPiA+IFJvZ2VyIFBh
dSBNb25uZSAoMik6Cj4gPiAgIHZwY2kvbXNpOiBzcGxpdCBjb2RlIHRvIGJpbmQgcGlycQo+ID4g
ICB2cGNpL21zaTogZml4IHVwZGF0ZSBvZiBib3VuZCBNU0kgaW50ZXJydXB0cwo+ID4gCj4gPiAg
eGVuL2FyY2gveDg2L2h2bS92bXNpLmMgfCA5NiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLQo+ID4gIHhlbi9kcml2ZXJzL3ZwY2kvbXNpLmMgIHwgIDMgKy0KPiA+ICB4
ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICB8ICAyICsKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDcxIGlu
c2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQo+ID4gCj4gCj4gSSBndWVzcyB0aGlzIGlzIDQu
MTEgbWF0ZXJpYWw/CgpIbSwgSSB0aGluayBzbyBnaXZlbiBQVkggRG9tMCBpcyBleHBlcmltZW50
YWwuIE9UT0ggdGhpcyBjaGFuZ2VzIGFyZQp0byBjb2RlIHVzZWQgZXhjbHVzaXZlbHkgYnkgUFZI
IERvbTAsIHNvIHRoZXJlJ3Mgbm8gY2hhbmNlIG9mIGJyZWFraW5nCmFueXRoaW5nIGVsc2UuIExl
dCdzIHNlZSB3aGF0IHRoZSBtYWludGFpbmVycyB0aGluayBhbmQgSSBjYW4gQ2MgeW91CmxhdGVy
IGlmIHJlcXVpcmVkLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
