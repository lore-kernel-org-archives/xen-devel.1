From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Tue, 2 Apr 2019 18:04:52 +0100
Message-ID: <796dcc34-ba35-44c1-f4ab-71e0e10dea49@citrix.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
 <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
 <3584da10-e33c-b382-bbb3-c12b538de30a@hygon.cn>
 <5CA337400200007800223D81@prv1-mh.provo.novell.com>
 <6341db2c-2504-efb0-acae-f0b2b1b42c98@hygon.cn>
 <5CA383BB0200007800223F56@prv1-mh.provo.novell.com>
 <b100d894-fda5-a74c-ae24-596914366042@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QSF0=SE=citrix.com=prvs=9886cf734=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBMzZ-0000vv-9G
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 17:14:33 +0000
In-Reply-To: <b100d894-fda5-a74c-ae24-596914366042@hygon.cn>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDQvMjAxOSAxNzoxNCwgUHUgV2VuIHdyb3RlOgo+IE9uIDIwMTkvNC8yIDIzOjQ2LCBK
YW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDIuMDQuMTkgYXQgMTM6NTgsIDxwdXdlbkBoeWdvbi5j
bj4gd3JvdGU6Cj4+PiBPbiAyMDE5LzQvMiAxODoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMDIuMDQuMTkgYXQgMDg6NDYsIDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+Pj4+IE9uIDIw
MTkvNC8xIDE2OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDMwLjAzLjE5IGF0IDEx
OjQyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4+Pj4+IFRoZXJlIGlzIG5vIE1TUl9JTlRF
TF9QTEFURk9STV9JTkZPIGZvciBBTUQgYW5kIEh5Z29uIGZhbWlsaWVzLgo+Pj4+Pj4+IFNvIGRp
cmVjdGx5Cj4+Pj4+Pj4gcmV0dXJuIGZhbHNlIGluIHRoZSBmdW5jdGlvbiBwcm9iZV9jcHVpZF9m
YXVsdGluZygpIGlmCj4+Pj4+Pj4gIWNwdV9oYXNfaHlwZXJ2aXNvci4KPj4+Pj4+Cj4+Pj4+PiBJ
IHRoaW5rIGl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIHlvdSBoYWQgbWVudGlvbmVkIHRoZSBy
ZWFsCj4+Pj4+PiByZWFzb24gd2h5IHlvdSB3YW50IHRvIGJ5cGFzcyB0aGUgTVNSIGFjY2Vzc2Vz
LiBUaGlzIHdheSBpdAo+Pj4+Pj4gc291bmRzIGFzIGlmIHRoZSBjaGFuZ2Ugd2FzIG9ubHkgY29z
bWV0aWMsIGFuZCBoZW5jZSBjb3VsZCBiZQo+Pj4+Pj4gbGVmdCBvdXQuCj4+Pj4+Cj4+Pj4+IE9r
YXksIGhvdyBhYm91dCB0aGUgbmV3IGRlc2NyaXB0aW9uOgo+Pj4+PiBUaGVyZSBpcyBubyBNU1Jf
SU5URUxfUExBVEZPUk1fSU5GTyBmb3IgQU1EIGFuZCBIeWdvbiBmYW1pbGllcy4gUmVhZAo+Pj4+
PiB0aGlzIE1TUiB3aWxsIHN0b3AgdGhlIFhlbiBpbml0aWFsaXphdGlvbiBwcm9jZXNzCj4+Pj4K
Pj4+PiAiLi4uIGZvciBzb21lIGVhcmx5IEh5Z29uIHN0ZXBwaW5ncyIoPykuIEknbSB1bmF3YXJl
IG9mIEFNRCBDUFVzCj4+Pgo+Pj4gWWVzLGZvciBzb21lIGVhcmx5IEh5Z29uIHN0ZXBwaW5ncy4K
Pj4+Cj4+Pj4gaGF2aW5nIHRoaXMgaXNzdWUgLSBhcmUgeW91IHRlbGxpbmcgdXMgb3RoZXJ3aXNl
Pwo+Pj4KPj4+IEkgdGVzdGVkIHdpdGggYW4gQU1EIENQVShGYW1pbHkgMTdoLCBNb2RlbCAxLCBT
dGVwcGluZyAxKSB0b2RheSwgYW5kCj4+PiBpdCBhbHNvIHN0b3BwZWQgd2hlbiByZWFkaW5nIHRo
ZSBNU1JfSU5URUxfUExBVEZPUk1fSU5GTyBpbnN0ZWFkIG9mCj4+PiBwcm9kdWNpbmcgI0dQKDAp
Lgo+Pgo+PiBJJ3ZlIHlldCB0byB0cnkgaXQgb3V0IG9uIG15IFJvbWUgc3lzdGVtLCBidXQgSSBo
YXZlIHRvIGFkbWl0IEkKPgo+IFdlIGhhdmUgUm9tZSBzeXN0ZW0gdG9vLCBJJ2xsIGhhdmUgYSB0
cnkgb24gaXQgYXMgd2VsbC4KCkkndmUganVzdCBzcG9rZW4gdG8gYSBjb250YWN0IGF0IEFNRCwg
YW5kIHRoZXkndmUgbmV2ZXIgZW5jb3VudGVyZWQgYW4KaXNzdWUgbGlrZSB0aGlzLgoKSWYgaXQg
YmVoYXZpb3VyIGRvZXMgbWFuaWZlc3QsIHRoZW4gaXQgaXMgdmVyeSBjb25jZXJuaW5nLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
