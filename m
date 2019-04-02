From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Tue, 02 Apr 2019 09:44:10 -0600
Message-ID: <5CA3834A0200007800223F53@prv1-mh.provo.novell.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
 <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
 <3cdab192-d748-9331-9046-24206bf4ef35@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBLaC-0006Dp-5V
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 15:44:16 +0000
In-Reply-To: <3cdab192-d748-9331-9046-24206bf4ef35@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Pu Wen <puwen@hygon.cn>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDEyOjMwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMDQvMjAxOSAwOTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMw
LjAzLjE5IGF0IDExOjQyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4gVGhlcmUgaXMgbm8g
TVNSX0lOVEVMX1BMQVRGT1JNX0lORk8gZm9yIEFNRCBhbmQgSHlnb24gZmFtaWxpZXMuIFNvIGRp
cmVjdGx5Cj4+PiByZXR1cm4gZmFsc2UgaW4gdGhlIGZ1bmN0aW9uIHByb2JlX2NwdWlkX2ZhdWx0
aW5nKCkgaWYgIWNwdV9oYXNfaHlwZXJ2aXNvci4KPj4gSSB0aGluayBpdCB3b3VsZCBoYXZlIGJl
ZW4gbmljZSBpZiB5b3UgaGFkIG1lbnRpb25lZCB0aGUgcmVhbAo+PiByZWFzb24gd2h5IHlvdSB3
YW50IHRvIGJ5cGFzcyB0aGUgTVNSIGFjY2Vzc2VzLiBUaGlzIHdheSBpdAo+PiBzb3VuZHMgYXMg
aWYgdGhlIGNoYW5nZSB3YXMgb25seSBjb3NtZXRpYywgYW5kIGhlbmNlIGNvdWxkIGJlCj4+IGxl
ZnQgb3V0Lgo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUHUgV2VuIDxwdXdlbkBoeWdvbi5jbj4KPj4g
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4KPj4gQW5kcmV3LCBJ
J2QgbGlrZSB0byBhc2sgZm9yIGV4cGxpY2l0IGNsYXJpZmljYXRpb24gdGhhdCB5b3UgZG9uJ3Qg
b2JqZWN0Cj4+IHRvIHRoaXMgYWRqdXN0bWVudC4gQnV0IGlmIHlvdSBkbywgcGxlYXNlIGNsYXJp
Znkgd2h5Lgo+IAo+IFdlIGRlbGliZXJhdGVseSBlbXVsYXRlIE1TUl9JTlRFTF9QTEFURk9STV9J
TkZPIG9uIGFsbCBzeXN0ZW1zCj4gCj4gVGhpcyBpcyB0byBzdXBwb3J0IHB2LXNoaW0sIHNvIHRo
ZSBMMSBYZW4gY2FuIGV4ZXJ0IGZhdWx0aW5nIGNvbnRyb2wKPiBvdmVyIHRoZSBMMiBQViBndWVz
dCwgc28gTDIgZG9lc24ndCBzZWUgTDEncyBIVk0gQ1BVSUQgbGVhdmVzIGFuZCBjaG9rZS4KPiAK
PiBJIHN1cHBvc2UgaXRzIGZpbmUgdG8gaGF2ZSBhICFjcHVfaGFzX2h5cGVydmlzb3IgZXhjbHVz
aW9uIGZvciBub24tSW50ZWwKPiBzeXN0ZW1zLCBidXQgSSBhbHNvIGRvbid0IHNlZSBtdWNoIHZh
bHVlIGluIGl0LgoKQnV0IHlvdSd2ZSBzZWUgUHUgV2VuJ3MgZXhwbGFuYXRpb24gKG9mIHRoZWly
IENQVXMgaGFuZ2luZyBvbiB0aGF0ClJETVNSIGlzIGF0dGVtcHRlZCk/IEluIGEgbGF0ZXIgcmVw
bHkgaGUgZXZlbiBjbGFpbXMgdGhhdCB0aGlzIGFsc28KaGFwcGVucyBvbiBzb21lIEFNRCBDUFVz
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
