From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] tools: set Dom0 UUID if requested
Date: Fri, 23 Nov 2018 18:35:18 +0100
Message-ID: <20181123173518.pwxdiwitefsafknj@mac>
References: <20181120180941.1005-1-wei.liu2@citrix.com>
 <20181123152849.GA6902@perard.uk.xensource.com>
 <20181123161841.pt4mms26yenh64vc@zion.uk.xensource.com>
 <20181123162500.7rpd23uttffdr5iq@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2k7W=OC=citrix.com=prvs=8582a9f6d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gQFMa-0003yY-1d
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 17:35:32 +0000
Content-Disposition: inline
In-Reply-To: <20181123162500.7rpd23uttffdr5iq@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDQ6MjU6MDBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIE5vdiAyMywgMjAxOCBhdCAwNDoxODo0MVBNICswMDAwLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gT24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDM6Mjg6NDlQTSArMDAwMCwgQW50aG9ueSBQ
RVJBUkQgd3JvdGU6Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2hvdHBsdWcvTGludXgvc3lz
dGVtZC94ZW4taW5pdC1kb20wLnNlcnZpY2UuaW4gYi90b29scy9ob3RwbHVnL0xpbnV4L3N5c3Rl
bWQveGVuLWluaXQtZG9tMC5zZXJ2aWNlLmluCj4gPiA+ID4gaW5kZXggM2JlZmFkY2VhMy4uYmVl
ZDMxMjZjNiAxMDA2NDQKPiA+ID4gPiAtLS0gYS90b29scy9ob3RwbHVnL0xpbnV4L3N5c3RlbWQv
eGVuLWluaXQtZG9tMC5zZXJ2aWNlLmluCj4gPiA+ID4gKysrIGIvdG9vbHMvaG90cGx1Zy9MaW51
eC9zeXN0ZW1kL3hlbi1pbml0LWRvbTAuc2VydmljZS5pbgo+ID4gPiA+IEBAIC03LDggKzcsOSBA
QCBDb25kaXRpb25QYXRoRXhpc3RzPS9wcm9jL3hlbi9jYXBhYmlsaXRpZXMKPiA+ID4gPiAgW1Nl
cnZpY2VdCj4gPiA+ID4gIFR5cGU9b25lc2hvdAo+ID4gPiA+ICBSZW1haW5BZnRlckV4aXQ9dHJ1
ZQo+ID4gPiA+ICtFbnZpcm9ubWVudEZpbGU9QENPTkZJR19ESVJAL0BDT05GSUdfTEVBRl9ESVJA
L3hlbmNvbW1vbnMKPiA+ID4gPiAgRXhlY1N0YXJ0UHJlPS9iaW4vZ3JlcCAtcSBjb250cm9sX2Qg
L3Byb2MveGVuL2NhcGFiaWxpdGllcwo+ID4gPiA+IC1FeGVjU3RhcnQ9QExJQkVYRUNfQklOQC94
ZW4taW5pdC1kb20wCj4gPiA+ID4gK0V4ZWNTdGFydD1ATElCRVhFQ19CSU5AL3hlbi1pbml0LWRv
bTAgJFhFTl9ET00wX1VVSUQKPiA+ID4gPiAgCj4gPiA+ID4gIFtJbnN0YWxsXQo+ID4gPiA+ICBX
YW50ZWRCeT1tdWx0aS11c2VyLnRhcmdldAo+ID4gPiAKPiA+ID4gRG9uJ3QgeW91IG5lZWQgdG8g
bW9kaWZ5IEZyZWVCU0QvcmMuZC94ZW5jb21tb25zLmluIGFuZAo+ID4gPiBOZXRCU0QvcmMuZC94
ZW5jb21tb25zLmluIGFzIHdlbGw/Cj4gPiAKPiA+IEkgZGlkbid0IHdhbnQgdG8gbW9kaWZ5IHRo
ZW0gd2l0aG91dCBoYXZpbmcgYSB0ZXN0IHNldHVwIGZpcnN0LiAgVGhlCj4gPiB4ZW4taW5pdC1k
b20wIHByb2dyYW0gYWxyZWFkeSB0YWtlcyBpbnRvIGNvbnNpZGVyYXRpb24gdGhhdCB0aGV5IGRv
bid0Cj4gPiBwcm92aWRlIFVVSUQuCj4gPiAKPiA+IEkgY2FuIGRvIGl0IGluIHRoZSBuZXh0IHZl
cnNpb24uCj4gCj4gQWN0dWFsbHksIG5vdyBJIHJlbWVtYmVyLiBUaGV5IGRvbid0IGhhdmUgdGhl
IHNhbWUgbWVjaGFuaXNtIGFzIExpbnV4IHRvCj4gc291cmNlIGEgc3lzdGVtIHdpZGUgY29uZmln
IGZpbGUsIHNvIG1vZGlmeWluZyB0aGUgc2NyaXB0IHdpdGhvdXQgZml4aW5nCj4gdGhhdCBpc3N1
ZSBtYWRlIG5vIHNlbnNlIHRvIG1lLgo+IAo+IFJvZ2VyLCB3aGF0J3MgeW91ciBvcGluaW9uPwoK
SSB0aGluayBpdCdzIGZpbmUgdG8gbGVhdmUgdGhlbSBhcy1pcy4gU2luY2UgdGhlcmUncyBubyBj
b25maWd1cmF0aW9uCmZpbGUgZm9yIEJTRHMgaW5pdCBzY3JpcHRzIG1vZGlmeWluZyB0aGVtIHRv
IGFkZCBzdWNoIHBhcmFtZXRlciBpcwpwb2ludGxlc3MuCgpJZiB5b3UgZmVlbCBsaWtlIEkgZ3Vl
c3MgeW91IGNvdWxkIGFkZCBhIHBsYWNlaG9sZGVyIHRvIHNldCB0aGUgVVVJRAppbiB0aGUgaW5p
dCBzY3JpcHQgaXRzZWxmLCBidXQgdGhhdCdzIG1vcmUgbGlrZSBhIGhhY2sgc2luY2UgdXNlcnMg
YXJlCm5vdCBzdXBwb3NlZCB0byBtb2RpZnkgc3VjaCBzY3JpcHRzLgoKUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
