From: Sarah Newman <srn@prgmr.com>
Subject: Re: [PATCH RFC v1 57/74] x86/pv-shim: shadow PV
 console's page for L2 DomU
Date: Thu, 11 Jan 2018 23:03:57 -0800
Message-ID: <dddeba2d-797a-2c99-6713-991eae5b0609@prgmr.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-58-wei.liu2@citrix.com>
 <5A5495BD020000780019C96B@prv-mh.provo.novell.com>
 <1515512623.4118.3.camel@citrix.com>
 <5A54FBA4020000780019CD44@prv-mh.provo.novell.com>
 <1515603370.3383.1.camel@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=9gxg=eh=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1eZtNg-0006fb-Fb
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 07:04:00 +0000
In-Reply-To: <1515603370.3383.1.camel@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "JBeulich@suse.com" <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMjAxOCAwODo1NiBBTSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiBUdWUsIDIw
MTgtMDEtMDkgYXQgMDk6MjggLTA3MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwOS4w
MS4xOCBhdCAxNjo0MywgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4g
T24gVHVlLCAyMDE4LTAxLTA5IGF0IDAyOjEzIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4+PiBPbiAwNC4wMS4xOCBhdCAxNDowNiwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+
Pj4+Pgo+Pj4+PiArc2l6ZV90IGNvbnNvbGVkX2d1ZXN0X3J4KHZvaWQpCj4+Pj4+ICt7Cj4+Pj4+
ICsgICAgc2l6ZV90IHJlY3YgPSAwLCBpZHggPSAwOwo+Pj4+PiArICAgIFhFTkNPTlNfUklOR19J
RFggY29ucywgcHJvZDsKPj4+Pj4gKwo+Pj4+PiArICAgIGlmICggIWNvbnNfcmluZyApCj4+Pj4+
ICsgICAgICAgIHJldHVybiAwOwo+Pj4+PiArCj4+Pj4+ICsgICAgc3Bpbl9sb2NrKCZyeF9sb2Nr
KTsKPj4+Pj4gKwo+Pj4+PiArICAgIGNvbnMgPSBjb25zX3JpbmctPm91dF9jb25zOwo+Pj4+PiAr
ICAgIHByb2QgPSBBQ0NFU1NfT05DRShjb25zX3JpbmctPm91dF9wcm9kKTsKPj4+Pj4gKyAgICBB
U1NFUlQoKHByb2QgLSBjb25zKSA8PSBzaXplb2YoY29uc19yaW5nLT5vdXQpKTsKPj4+Pj4gKwo+
Pj4+PiArICAgIC8qIElzIHRoZSByaW5nIGVtcHR5PyAqLwo+Pj4+PiArICAgIGlmICggY29ucyA9
PSBwcm9kICkKPj4+Pj4gKyAgICAgICAgZ290byBvdXQ7Cj4+Pj4+ICsKPj4+Pj4gKyAgICAvKiBV
cGRhdGUgcG9pbnRlcnMgYmVmb3JlIGFjY2Vzc2luZyB0aGUgcmluZyAqLwo+Pj4+PiArICAgIHNt
cF9ybWIoKTsKPj4+Pgo+Pj4+IEkgdGhpbmsgdGhpcyBuZWVkIHRvIG1vdmUgdXAgYWhlYWQgb2Yg
dGhlIGlmKCkuIEluIHRoZSBjb21tZW50Cj4+Pj4gcGVyaGFwcyBzL1VwZGF0ZS9MYXRjaC8/Cj4+
Pgo+Pj4gVGhlIHJlYWQvd3JpdGUgbWVtb3J5IGJhcnJpZXJzIGhlcmUgYXJlIGJldHdlZW4gcmVh
ZC93cml0ZSBhY2Nlc3NlcyB0bwo+Pj4gcmluZy0+b3V0X3Byb2QgYW5kIHJpbmctPm91dCBhcnJh
eS4gU28gdGhlcmUgaXMgbm8gbmVlZCB0byBtb3ZlIHRoZW0uCj4+PiAodGhlIHNhbWUgZ29lcyBm
b3IgdGhlIGlucHV0IHJpbmcpCj4+Cj4+IEFuZCB0aGVyZSBpcyBubyBtdWx0aXBsZS1yZWFkIGlz
c3VlIGhlcmU/Cj4gCj4gQXMgQW5kcmV3IGhhcyBraW5kbHkgZXhwbGFpbmVkIHRvIG1lLCB0aGVy
ZSBpcyBhbiBpc3N1ZSBpbmRlZWQuCj4gU28gSSBtb3ZlZCBzbXBfcm1iKCkgdG8gYmUgcmlnaHQg
YWZ0ZXIgY29ucyBhbmQgcHJvZCByZWFkLCBhbmQgdXBkYXRlZAo+IHRoZSBjb21tZW50IHRvIHNh
eToKPiAKPiAiTGF0Y2ggcG9pbnRlcnMgYmVmb3JlIGFjY2Vzc2luZyB0aGUgcmluZy4gSW5jbHVk
ZWQgY29tcGlsZXIgYmFycmllciBhbHNvCj4gZW5zdXJlcyB0aGF0IHBvaW50ZXJzIGFyZSByZWFs
bHkgcmVhZCBvbmx5IG9uY2UgaW50byBsb2NhbCB2YXJpYWJsZXMuIgo+IAoKVGhlcmUgaXMgYW4g
aW5jb21wYXRpYmlsaXR5IGluIHRoaXMgKGFsc28gdml4ZW4ncykgc2VyaWFsIG91dHB1dC4gVGhl
IE5ldEJTRCBpbnN0YWxsZXIgaW5jbHVkZXMgTlVMIGNoYXJhY3RlcnMgaW4gaXRzIG91dHB1dCBh
bmQgZG9lcyBub3QgZGlzcGxheQpwcm9wZXJseSBkdWUgdG8gdGhlIGNhbGwgdG8gcHV0cy4gcHV0
YyBkZW1vbnN0cmFibHkgd29ya3MsIHRob3VnaCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYWRkIGEg
bGVuZ3RoIG9yaWVudGVkIGZ1bmN0aW9uIHRvIHNlcmlhbC5jLgoKLS1TYXJhaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
