From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Tue, 2 Apr 2019 11:30:47 +0100
Message-ID: <3cdab192-d748-9331-9046-24206bf4ef35@citrix.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
 <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QSF0=SE=citrix.com=prvs=9886cf734=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBGgu-0001KD-Ot
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 10:30:52 +0000
In-Reply-To: <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Pu Wen <puwen@hygon.cn>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAwOTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDMuMTkg
YXQgMTE6NDIsIDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+IFRoZXJlIGlzIG5vIE1TUl9JTlRF
TF9QTEFURk9STV9JTkZPIGZvciBBTUQgYW5kIEh5Z29uIGZhbWlsaWVzLiBTbyBkaXJlY3RseQo+
PiByZXR1cm4gZmFsc2UgaW4gdGhlIGZ1bmN0aW9uIHByb2JlX2NwdWlkX2ZhdWx0aW5nKCkgaWYg
IWNwdV9oYXNfaHlwZXJ2aXNvci4KPiBJIHRoaW5rIGl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlm
IHlvdSBoYWQgbWVudGlvbmVkIHRoZSByZWFsCj4gcmVhc29uIHdoeSB5b3Ugd2FudCB0byBieXBh
c3MgdGhlIE1TUiBhY2Nlc3Nlcy4gVGhpcyB3YXkgaXQKPiBzb3VuZHMgYXMgaWYgdGhlIGNoYW5n
ZSB3YXMgb25seSBjb3NtZXRpYywgYW5kIGhlbmNlIGNvdWxkIGJlCj4gbGVmdCBvdXQuCj4KPj4g
U2lnbmVkLW9mZi1ieTogUHUgV2VuIDxwdXdlbkBoeWdvbi5jbj4KPiBBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gQW5kcmV3LCBJJ2QgbGlrZSB0byBhc2sgZm9y
IGV4cGxpY2l0IGNsYXJpZmljYXRpb24gdGhhdCB5b3UgZG9uJ3Qgb2JqZWN0Cj4gdG8gdGhpcyBh
ZGp1c3RtZW50LiBCdXQgaWYgeW91IGRvLCBwbGVhc2UgY2xhcmlmeSB3aHkuCgpXZSBkZWxpYmVy
YXRlbHkgZW11bGF0ZSBNU1JfSU5URUxfUExBVEZPUk1fSU5GTyBvbiBhbGwgc3lzdGVtcwoKVGhp
cyBpcyB0byBzdXBwb3J0IHB2LXNoaW0sIHNvIHRoZSBMMSBYZW4gY2FuIGV4ZXJ0IGZhdWx0aW5n
IGNvbnRyb2wKb3ZlciB0aGUgTDIgUFYgZ3Vlc3QsIHNvIEwyIGRvZXNuJ3Qgc2VlIEwxJ3MgSFZN
IENQVUlEIGxlYXZlcyBhbmQgY2hva2UuCgpJIHN1cHBvc2UgaXRzIGZpbmUgdG8gaGF2ZSBhICFj
cHVfaGFzX2h5cGVydmlzb3IgZXhjbHVzaW9uIGZvciBub24tSW50ZWwKc3lzdGVtcywgYnV0IEkg
YWxzbyBkb24ndCBzZWUgbXVjaCB2YWx1ZSBpbiBpdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
