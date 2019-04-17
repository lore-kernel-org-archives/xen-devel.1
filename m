From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 01/15] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Wed, 17 Apr 2019 16:03:52 +0100
Message-ID: <20190417150352.GA30543@zion.uk.xensource.com>
References: <cover.1554382869.git.puwen@hygon.cn>
 <0d6839a65753c60f4fd1738560a551ca7df7b1e8.1554382869.git.puwen@hygon.cn>
 <614b4eab-065a-c911-7759-2663ab6a9657@citrix.com>
 <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
 <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
 <a14a1f04-eab0-dac6-7a7b-6125578cd3e5@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGm6f-0005nK-ON
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 15:04:13 +0000
Content-Disposition: inline
In-Reply-To: <a14a1f04-eab0-dac6-7a7b-6125578cd3e5@hygon.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBBcHIgMTMsIDIwMTkgYXQgMTI6MTQ6MTRBTSArMDgwMCwgUHUgV2VuIHdyb3RlOgo+
IE9uIDIwMTkvNC81IDE1OjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDA0LjA0LjE5IGF0
IDE4OjM5LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+ID4gPiBPbiAyMDE5LzQvNCAyMjowNywg
QW5kcmV3IENvb3BlciB3cm90ZToKPiA+ID4gPiBUaGlzIG5lZWRzIHRoZSBmb2xsb3dpbmcgaHVu
ayBmb2xkaW5nIGluCj4gPiA+ID4gd2hpY2ggY2FuIGJlIGRvbmUgb24gY29tbWl0IHRvIGF2b2lk
IHNlbmRpbmcgeWV0IGFub3RoZXIgdmVyc2lvbi4KPiA+ID4gCj4gPiA+IERvIHlvdSBtZWFuIEkg
bmVlZCB0byBzZW5kIGEgaW5kaXZpZHVhbCBwYXRjaCBmb3IgdGhpcyBmaWxlIGluc3RlYWQgb2YK
PiA+ID4gcmV3b3JraW5nIHRoZSB3aG9sZSBzZXJpZXM/Cj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsg
dGhhdCdzIG5lY2Vzc2FyeSwgdW5sZXNzIG90aGVyIHJlYXNvbnMgYXJpc2UgZm9yIHRoZXJlCj4g
PiB0byBiZSB5ZXQgYW5vdGhlciByb3VuZCBuZWNlc3NhcnkuIEFzIEFuZHJldyBzYXlzIC0gdGhp
cyBjYW4gZWFzaWx5Cj4gPiBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcuCj4gCj4gSGkgSmFuIGFu
ZCBBbmRyZXcsCj4gCj4gSG93IGFib3V0IHRoZSBwYXRjaGVzIHRpbGwgbm93PyBBcmUgdGhleSBh
Y2NlcHRhYmxlIHRvIGNvbW1pdD8KCkZZSSB3ZSdyZSB0cnlpbmcgdG8gc29ydCBvdXQgaXNzdWVz
IHdpdGggdXBzdHJlYW0gQ0kgc3lzdGVtLCBzbwpjb21taXR0aW5nIHRoZXNlIHBhdGNoZXMgbmVl
ZCB0byB3YWl0IGEgYml0LiBCdXQgZG9uJ3Qgd29ycnksIHRoZXkgd2lsbApldmVudHVhbGx5IGJl
IGNvbW1pdHRlZCAoYXNzdW1pbmcgYWxsIHRoZSBhY2tzIGFuZCBSYnMgYXJlIGluIHBsYWNlKS4K
CldlaS4KCj4gCj4gVGh4Lgo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gUHUgV2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
