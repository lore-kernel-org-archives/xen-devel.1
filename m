From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Interrupt injection with ISR set on Intel hardware
Date: Mon, 29 Oct 2018 16:44:34 +0000
Message-ID: <df262b14-148b-ad63-265c-b1d5352040df@citrix.com>
References: <20181015103015.cyvld52tngd4d3qy@mac.bytemobile.com>
 <5BD7364702000078001F5EE6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rbrb=nj=citrix.com=prvs=833c35ccb=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gHAed-0001Uv-ET
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 16:44:39 +0000
In-Reply-To: <5BD7364702000078001F5EE6@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMTAvMTggMTY6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE1LjEwLjE4IGF0
IDEyOjMwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiAoWEVOKSAgIFsyMjY0MV0g
UFVTSCAgICAge3NwICAwLCBpcnEgIDMwLCB2ZWMgMHgyMX0KPiBUaGlzIGlzIHRoZSBsYXN0IHB1
c2ggb3IgcG9wLgo+Cj4+IChYRU4pICAgWzIyNjUwXSBXQUtFICAgICBQUFIgMHgwMDAwMDAyMAo+
PiAoWEVOKSAgICAgICAgICAgICAgICAgICAgSVJSIDAwMDAwMDAwMDIwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKPj4gKFhFTikgICAgICAgICAg
ICAgICAgICAgIElTUiAwMDAwMDAwMDAyMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwCj4gRm9yIG9uZSBJJ20gaGF2aW5nIHRyb3VibGUgdW5kZXJz
dGFuZGluZyB3aHkgSVJSIGhlcmUgaXMgZGlmZmVyZW50Cj4gZnJvbSAuLi4KPgo+PiAoWEVOKSBB
bGwgTEFQSUMgc3RhdGU6Cj4+IChYRU4pICAgW3ZlY3Rvcl0gICAgICBJU1IgICAgICBUTVIgICAg
ICBJUlIKPj4gKFhFTikgICBbMWY6MDBdICAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMAo+PiAo
WEVOKSAgIFszZjoyMF0gIDAwMDAwMDAyIDAwMDAwMDAwIDAwMDAwMDAwCj4+IChYRU4pICAgWzVm
OjQwXSAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAKPj4gKFhFTikgICBbN2Y6NjBdICAwMDAw
MDAwMCAwMDAwMDAwMCAwMDAwMDAwMAo+PiAoWEVOKSAgIFs5Zjo4MF0gIDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwCj4+IChYRU4pICAgW2JmOmEwXSAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDAKPj4gKFhFTikgICBbZGY6YzBdICAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMAo+PiAoWEVO
KSAgIFtmZjplMF0gIDAwMDAwMDAwIDAwMDAwMDAwIDA0MDAwMDAwCj4gLi4uIElSUiBoZXJlLgoK
WW91IHNob3VsZG4ndCBleHBlY3QgdGhlbSB0byBiZSB0aGUgc2FtZS4KClRoZSBXQUtFIGxpbmUg
aXMgc2FtcGxlZCBiZWZvcmUgd2UgZW5hYmxlIGludGVycnVwdHMsIGFuZCB0aGUgIkFsbCBMQVBJ
QwpzdGF0ZSIgaXMgYWZ0ZXIgd2UgZW5hYmxlIGludGVycnVwdHMgYW5kIChlcnJvbmVvdXNseSkg
YWNjZXB0IHZlY3RvcgoweDIxIGEgc2Vjb25kIHRpbWUuCgpJbiB0aGUgbWVhbnRpbWUsIGEgVExC
IGZsdXNoIGhhcyBiZWNvbWUgcGVuZGluZywgYnV0IGludGVycnVwdHMgYXJlCmN1cnJlbnRseSBk
aXNhYmxlZCBzbyBpdCBoYXMgeWV0IHRvIGJlIGFjY2VwdGVkLsKgIFJlbWVtYmVyIHRoYXQgYml0
cwphY2N1bXVsYXRlIGluIElSUiBlbnRpcmVseSBhc3luY2hyb25vdXNseS4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
