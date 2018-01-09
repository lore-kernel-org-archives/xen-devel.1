From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 57/74] x86/pv-shim: shadow PV
 console's page for L2 DomU
Date: Tue, 09 Jan 2018 09:28:04 -0700
Message-ID: <5A54FBA4020000780019CD44@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-58-wei.liu2@citrix.com>
 <5A5495BD020000780019C96B@prv-mh.provo.novell.com>
 <1515512623.4118.3.camel@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=o7xp=ee=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYwl4-00031W-A1
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 16:28:14 +0000
In-Reply-To: <1515512623.4118.3.camel@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAxLjE4IGF0IDE2OjQzLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiBUdWUsIDIwMTgtMDEtMDkgYXQgMDI6MTMgLTA3MDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+PiA+ID4gPiBPbiAwNC4wMS4xOCBhdCAxNDowNiwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+ICtzaXplX3QgY29uc29sZWRfZ3Vlc3Rfcngodm9pZCkKPj4gPiArewo+PiA+ICsg
ICAgc2l6ZV90IHJlY3YgPSAwLCBpZHggPSAwOwo+PiA+ICsgICAgWEVOQ09OU19SSU5HX0lEWCBj
b25zLCBwcm9kOwo+PiA+ICsKPj4gPiArICAgIGlmICggIWNvbnNfcmluZyApCj4+ID4gKyAgICAg
ICAgcmV0dXJuIDA7Cj4+ID4gKwo+PiA+ICsgICAgc3Bpbl9sb2NrKCZyeF9sb2NrKTsKPj4gPiAr
Cj4+ID4gKyAgICBjb25zID0gY29uc19yaW5nLT5vdXRfY29uczsKPj4gPiArICAgIHByb2QgPSBB
Q0NFU1NfT05DRShjb25zX3JpbmctPm91dF9wcm9kKTsKPj4gPiArICAgIEFTU0VSVCgocHJvZCAt
IGNvbnMpIDw9IHNpemVvZihjb25zX3JpbmctPm91dCkpOwo+PiA+ICsKPj4gPiArICAgIC8qIElz
IHRoZSByaW5nIGVtcHR5PyAqLwo+PiA+ICsgICAgaWYgKCBjb25zID09IHByb2QgKQo+PiA+ICsg
ICAgICAgIGdvdG8gb3V0Owo+PiA+ICsKPj4gPiArICAgIC8qIFVwZGF0ZSBwb2ludGVycyBiZWZv
cmUgYWNjZXNzaW5nIHRoZSByaW5nICovCj4+ID4gKyAgICBzbXBfcm1iKCk7Cj4+IAo+PiBJIHRo
aW5rIHRoaXMgbmVlZCB0byBtb3ZlIHVwIGFoZWFkIG9mIHRoZSBpZigpLiBJbiB0aGUgY29tbWVu
dAo+PiBwZXJoYXBzIHMvVXBkYXRlL0xhdGNoLz8KPiAKPiBUaGUgcmVhZC93cml0ZSBtZW1vcnkg
YmFycmllcnMgaGVyZSBhcmUgYmV0d2VlbiByZWFkL3dyaXRlIGFjY2Vzc2VzIHRvCj4gcmluZy0+
b3V0X3Byb2QgYW5kIHJpbmctPm91dCBhcnJheS4gU28gdGhlcmUgaXMgbm8gbmVlZCB0byBtb3Zl
IHRoZW0uCj4gKHRoZSBzYW1lIGdvZXMgZm9yIHRoZSBpbnB1dCByaW5nKQoKQW5kIHRoZXJlIGlz
IG5vIG11bHRpcGxlLXJlYWQgaXNzdWUgaGVyZT8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
