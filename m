From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] tools: set Dom0 UUID if requested
Date: Fri, 23 Nov 2018 16:25:00 +0000
Message-ID: <20181123162500.7rpd23uttffdr5iq@zion.uk.xensource.com>
References: <20181120180941.1005-1-wei.liu2@citrix.com>
 <20181123152849.GA6902@perard.uk.xensource.com>
 <20181123161841.pt4mms26yenh64vc@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k4pk=oc=citrix.com=prvs=858f4146b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gQEGN-0004Wu-9m
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 16:25:03 +0000
Content-Disposition: inline
In-Reply-To: <20181123161841.pt4mms26yenh64vc@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Edwin =?iso-8859-1?B?VPZy9ms=?= <edvin.torok@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDQ6MTg6NDFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIE5vdiAyMywgMjAxOCBhdCAwMzoyODo0OVBNICswMDAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2hvdHBsdWcvTGludXgvc3lzdGVtZC94
ZW4taW5pdC1kb20wLnNlcnZpY2UuaW4gYi90b29scy9ob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVu
LWluaXQtZG9tMC5zZXJ2aWNlLmluCj4gPiA+IGluZGV4IDNiZWZhZGNlYTMuLmJlZWQzMTI2YzYg
MTAwNjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL2hvdHBsdWcvTGludXgvc3lzdGVtZC94ZW4taW5pdC1k
b20wLnNlcnZpY2UuaW4KPiA+ID4gKysrIGIvdG9vbHMvaG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hl
bi1pbml0LWRvbTAuc2VydmljZS5pbgo+ID4gPiBAQCAtNyw4ICs3LDkgQEAgQ29uZGl0aW9uUGF0
aEV4aXN0cz0vcHJvYy94ZW4vY2FwYWJpbGl0aWVzCj4gPiA+ICBbU2VydmljZV0KPiA+ID4gIFR5
cGU9b25lc2hvdAo+ID4gPiAgUmVtYWluQWZ0ZXJFeGl0PXRydWUKPiA+ID4gK0Vudmlyb25tZW50
RmlsZT1AQ09ORklHX0RJUkAvQENPTkZJR19MRUFGX0RJUkAveGVuY29tbW9ucwo+ID4gPiAgRXhl
Y1N0YXJ0UHJlPS9iaW4vZ3JlcCAtcSBjb250cm9sX2QgL3Byb2MveGVuL2NhcGFiaWxpdGllcwo+
ID4gPiAtRXhlY1N0YXJ0PUBMSUJFWEVDX0JJTkAveGVuLWluaXQtZG9tMAo+ID4gPiArRXhlY1N0
YXJ0PUBMSUJFWEVDX0JJTkAveGVuLWluaXQtZG9tMCAkWEVOX0RPTTBfVVVJRAo+ID4gPiAgCj4g
PiA+ICBbSW5zdGFsbF0KPiA+ID4gIFdhbnRlZEJ5PW11bHRpLXVzZXIudGFyZ2V0Cj4gPiAKPiA+
IERvbid0IHlvdSBuZWVkIHRvIG1vZGlmeSBGcmVlQlNEL3JjLmQveGVuY29tbW9ucy5pbiBhbmQK
PiA+IE5ldEJTRC9yYy5kL3hlbmNvbW1vbnMuaW4gYXMgd2VsbD8KPiAKPiBJIGRpZG4ndCB3YW50
IHRvIG1vZGlmeSB0aGVtIHdpdGhvdXQgaGF2aW5nIGEgdGVzdCBzZXR1cCBmaXJzdC4gIFRoZQo+
IHhlbi1pbml0LWRvbTAgcHJvZ3JhbSBhbHJlYWR5IHRha2VzIGludG8gY29uc2lkZXJhdGlvbiB0
aGF0IHRoZXkgZG9uJ3QKPiBwcm92aWRlIFVVSUQuCj4gCj4gSSBjYW4gZG8gaXQgaW4gdGhlIG5l
eHQgdmVyc2lvbi4KCkFjdHVhbGx5LCBub3cgSSByZW1lbWJlci4gVGhleSBkb24ndCBoYXZlIHRo
ZSBzYW1lIG1lY2hhbmlzbSBhcyBMaW51eCB0bwpzb3VyY2UgYSBzeXN0ZW0gd2lkZSBjb25maWcg
ZmlsZSwgc28gbW9kaWZ5aW5nIHRoZSBzY3JpcHQgd2l0aG91dCBmaXhpbmcKdGhhdCBpc3N1ZSBt
YWRlIG5vIHNlbnNlIHRvIG1lLgoKUm9nZXIsIHdoYXQncyB5b3VyIG9waW5pb24/CgpXZWkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
