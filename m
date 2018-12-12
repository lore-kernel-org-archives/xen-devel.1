From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Wed, 12 Dec 2018 12:53:28 +0800
Message-ID: <20181212045328.GB12809@gao-cwp>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
 <5C0FED5702000078002053C6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ec6a=OV=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1gWwT1-0004e1-2v
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 04:49:51 +0000
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Borislav Petkov <bp@suse.de>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMTA6MDE6MTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMjguMTEuMTggYXQgMDY6MzQsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+PiBUaGlzIHBhdGNoIHBvcnRzIG1pY3JvY29kZSBpbXByb3ZlbWVudCBwYXRjaGVzIGZyb20g
bGludXgga2VybmVsLgo+PiAKPj4gQmVmb3JlIHlvdSByZWFkIGFueSBmdXJ0aGVyOiB0aGUgZWFy
bHkgbG9hZGluZyBtZXRob2QgaXMgc3RpbGwgdGhlCj4+IHByZWZlcnJlZCBvbmUgYW5kIHlvdSBz
aG91bGQgYWx3YXlzIGRvIHRoYXQuIFRoZSBmb2xsb3dpbmcgcGF0Y2ggaXMKPj4gaW1wcm92aW5n
IHRoZSBsYXRlIGxvYWRpbmcgbWVjaGFuaXNtIGZvciBsb25nIHJ1bm5pbmcgam9icyBhbmQgY2xv
dWQgdXNlCj4+IGNhc2VzLgo+PiAKPj4gR2F0aGVyIGFsbCBjb3JlcyBhbmQgc2VyaWFsaXplIHRo
ZSBtaWNyb2NvZGUgdXBkYXRlIG9uIHRoZW0gYnkgZG9pbmcgaXQKPj4gb25lLWJ5LW9uZSB0byBt
YWtlIHRoZSBsYXRlIHVwZGF0ZSBwcm9jZXNzIGFzIHJlbGlhYmxlIGFzIHBvc3NpYmxlIGFuZAo+
PiBhdm9pZCBwb3RlbnRpYWwgaXNzdWVzIGNhdXNlZCBieSB0aGUgbWljcm9jb2RlIHVwZGF0ZS4K
Pgo+U28geW91IHN0aWxsIGRpZG4ndCBzd2l0Y2ggdG8gcHJvY2VzcyBjb3JlcyBvciBhdCB0aGUg
dmVyeSBsZWFzdAo+c29ja2V0cyBpbiBwYXJhbGxlbD8KClllcy4gVGhpcyBwYXRjaCBhbGxvd3Mg
ZGlmZmVyZW50IGNvcmVzIHRvIHJ1biBtaWNyb2NvZGVfdXBkYXRlX2NwdSgpCmluIHBhcmFsbGVs
LiBJdCBpcyB0aGUgbG9jayBpbiB0aGF0IGZ1bmN0aW9uIHRoYXQgbWFrZSBtaWNyb2NvZGUgdXBk
YXRlCnNlcXVlbnRpYWxseS4gSSBwbGFuIHRvIHJlbW92ZSB0aGUgbG9jayBpbiBhIHNlcGFyYXRl
IHBhdGNoIGFuZCB5b3UgY2FuCmZpbmQgaXQgaW4gbmV4dCB2ZXJzaW9uLgoKVGhhbmtzCkNoYW8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
