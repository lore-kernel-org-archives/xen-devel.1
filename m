From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 10/50] x86emul: support AVX512{F, BW,
 _VBMI} full permute insns
Date: Fri, 17 May 2019 17:50:45 +0100
Message-ID: <a3d60d70-ffd0-33f6-7417-fbc6c58e53be@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B816C020000780021F167@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRg4L-0005mS-Ij
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 16:50:53 +0000
In-Reply-To: <5C8B816C020000780021F167@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGFrZSB0aGUgbGliZXJ0
eSBhbmQgYWxzbyBjb3JyZWN0IHRoZSAocHVibGljIGludGVyZmFjZSkgbmFtZSBvZiB0aGUKPiBB
Vlg1MTJfVkJNSSBmZWF0dXJlIGZsYWcsIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgbm8gZXh0ZXJu
YWwgY29uc3VtZXIKPiBoYXMgYWN0dWFsbHkgYmVlbiB1c2luZyB0aGF0IGZsYWcgc28gZmFyLgoK
SSd2ZSBiZWVuIGdpdmluZyB0aGlzIHNvbWUgdGhvdWdodCwgYW5kIEkgdGhpbmsgcHV0dGluZyB0
aGVzZSBpbiB0aGUKcHVibGljIGludGVyZmFjZSB3YXMgYSBtaXN0YWtlLgoKVGhleSBhcmUgYSBy
ZXByZXNlbnRhdGlvbiBvZiBvdGhlciBwZW9wbGVzIHN0YWJsZSBBQkksIGFuZCBhcmUgb25seSB1
c2VkCmluIHRvb2xzIGludGVyZmFjZXMgYXMgZmFyIGFzIFhlbiBpcyBjb25jZXJuZWQgKFNZU0NU
TF9nZXRfZmVhdHVyZXNldCwKRE9NQ1RMX2dldF9jcHVfcG9saWN5KQoKVGhlIG9ubHkgZXh0ZXJu
YWwgcmVwcmVzZW50YXRpb25zIGFyZSB4ZW5fY3B1aWRfbGVhZl90L3hlbl9tc3JfZW50cnlfdAp3
aGljaCBkb24ndCBuZWVkIGNvbnN0YW50cyB0byBnbyB3aXRoIHRoZW0uCgpHaXZlbiB0aGUgYWR2
ZW50IG9mIGxpYng4NiwgSSB0aGluayB0aGUgZmVhdHVyZSBkZWZpbml0aW9ucyBvdWdodCB0bwpt
b3ZlIHRoZXJlLCBhbmQgYmUgcmVtb3ZlZCBmcm9tIFhlbidzIHB1YmxpYyBpbnRlcmZhY2UuwqAg
QWxvbmcgd2l0aAp0aGF0LCBJIHNlZSBubyByZWFzb24gdG8ga2VlcCB0aGVpciB2YXJpYWJsZS1w
cmVmaXgtbmVzcywgd2hpY2ggd2lsbAphbGxvdyB0aGVtIHRvIGJlIHNlYXJjaGFibGUgYWdhaW4u
Cgo+ICBGdXJ0aGVybW9yZSBtYWtlIGl0IGhhdmUKPiBBVlg1MTJCVyBpbnN0ZWFkIG9mIEFWWDUx
MkYgYXMgYSBwcmVyZXF1aXNpdGUsIGZvciByZXF1aXJpbmcgZnVsbAo+IDY0LWJpdCBtYXNrIHJl
Z2lzdGVycyAodGhlIHVwcGVyIDQ4IGJpdHMgb2Ygd2hpY2ggY2FuJ3QgYmUgYWNjZXNzZWQKPiBv
dGhlciB0aGFuIHRocm91Z2ggWFNBVkUvWFJTVE9SIHdpdGhvdXQgQVZYNTEyQlcgc3VwcG9ydCku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBcyBm
b3IgdGhlIHJlc3QsIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPiBidXQKd2UgcGVyaGFwcyB3YW50IHRvIHNvcnQgb3V0IHRoZSBwb3NpdGlvbiBpbiB0
aGUgcHVibGljIGludGVyZmFjZSBiZWZvcmUKY2hhbmdpbmcgQVZYNTEyVkJNSS4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
