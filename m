From: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Tue, 11 Dec 2018 10:16:53 -0800
Message-ID: <20181211181652.GC25566@otc-nc-03>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
 <5C0FED5702000078002053C6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sS70=OU=intel.com=ashok.raj@srs-us1.protection.inumbo.net>)
 id 1gWmaV-00066c-DF
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 18:16:55 +0000
Content-Disposition: inline
In-Reply-To: <5C0FED5702000078002053C6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Borislav Petkov <bp@suse.de>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMTA6MDE6MTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjExLjE4IGF0IDA2OjM0LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90
ZToKPiA+IFRoaXMgcGF0Y2ggcG9ydHMgbWljcm9jb2RlIGltcHJvdmVtZW50IHBhdGNoZXMgZnJv
bSBsaW51eCBrZXJuZWwuCj4gPiAKPiA+IEJlZm9yZSB5b3UgcmVhZCBhbnkgZnVydGhlcjogdGhl
IGVhcmx5IGxvYWRpbmcgbWV0aG9kIGlzIHN0aWxsIHRoZQo+ID4gcHJlZmVycmVkIG9uZSBhbmQg
eW91IHNob3VsZCBhbHdheXMgZG8gdGhhdC4gVGhlIGZvbGxvd2luZyBwYXRjaCBpcwo+ID4gaW1w
cm92aW5nIHRoZSBsYXRlIGxvYWRpbmcgbWVjaGFuaXNtIGZvciBsb25nIHJ1bm5pbmcgam9icyBh
bmQgY2xvdWQgdXNlCj4gPiBjYXNlcy4KPiA+IAo+ID4gR2F0aGVyIGFsbCBjb3JlcyBhbmQgc2Vy
aWFsaXplIHRoZSBtaWNyb2NvZGUgdXBkYXRlIG9uIHRoZW0gYnkgZG9pbmcgaXQKPiA+IG9uZS1i
eS1vbmUgdG8gbWFrZSB0aGUgbGF0ZSB1cGRhdGUgcHJvY2VzcyBhcyByZWxpYWJsZSBhcyBwb3Nz
aWJsZSBhbmQKPiA+IGF2b2lkIHBvdGVudGlhbCBpc3N1ZXMgY2F1c2VkIGJ5IHRoZSBtaWNyb2Nv
ZGUgdXBkYXRlLgo+IAo+IFNvIHlvdSBzdGlsbCBkaWRuJ3Qgc3dpdGNoIHRvIHByb2Nlc3MgY29y
ZXMgb3IgYXQgdGhlIHZlcnkgbGVhc3QKPiBzb2NrZXRzIGluIHBhcmFsbGVsPwoKTGV0IG1lIHN5
bmMgd2l0aCBHYW8gb24gdGhpcy4uIHdlIGRpZCBkbyBhIHBhdGNoIGZvciB1cHN0cmVhbSBrZXJu
ZWwKYnV0IEJvcmlzIHdhc24ndCBpbnRlcmVzdGVkIGluIHRhbGtpbmcgYW55IHBhdGNoZXMgdG8g
aW1wcm92ZQpsaXZlIG1pY3JvY29kZSB1cGRhdGUgYmVjYXVzZSB0aGVyZSBpcyBubyByZXBvcnQg
b2YgYnJlYWthZ2Ugd2l0aCB3aGF0IHdlIGRvCnRvZGF5IHdpdGggdGhlIGJpZyBoYW1tZXIgYXBw
cm9hY2guIFBsdXMgdGhlIHByZWZlcnJlZCBwYXRoIHNob3VsZCBiZSBCSU9TLApuZXh0IGlzIGVh
cmx5IGxvYWQgYW5kIDNyZCBvcHRpb24gaXMgbGl2ZSB1cGRhdGUuIAoKQnV0IHNpbmNlIHRoaXMg
aXMgeGVuIGEgZGlmZmVyZW50IHNvdXJjZSBiYXNlIHlvdSBhcmUgZnJlZSB0byBtYWtlCnRob3Nl
IGNoYW5nZXMuCgpCVFc6IEFwYXJ0IGZyb20gdGhlIGZhY3QgaXRzIHVnbHkgYW5kIHRha2UgYSBs
b29vb25nIHRpbWUgdG8gY29tcGxldGUsIGRvIHlvdQpoYXZlIGFueSBwcmFjdGljYWwgaXNzc3Vl
cyB5b3Ugd2FudCB0byBoaWdobGlnaHQ/IG1heWJlIHRoYXQgY2FuIApoZWxwIHVwc3RyZWFtIGFz
IHdlbGwuCgpDaGVlcnMsCkFzaG9rCgoKPiAKPiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
