From: Brian Woods <brian.woods@amd.com>
Subject: Re: [PATCH] x86: use VMLOAD for PV context switch
Date: Thu, 16 Aug 2018 17:04:09 -0500
Message-ID: <20180816220408.GC9630@amd.com>
References: <5B4486F302000078001D290A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/srj=k7=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1fqQNO-0002qv-2A
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 22:04:18 +0000
Content-Disposition: inline
In-Reply-To: <5B4486F302000078001D290A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMDQ6MTQ6MTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSGF2aW5nIG5vdGljZWQgdGhhdCBWTUxPQUQgYWxvbmUgaXMgYWJvdXQgYXMgZmFzdCBh
cyBhIHNpbmdsZSBvZiB0aGUKPiBpbnZvbHZlZCBXUk1TUnMsIEkgdGhvdWdodCBpdCBtaWdodCBi
ZSBhIHJlYXNvbmFibGUgaWRlYSB0byBhbHNvIHVzZSBpdAo+IGZvciBQVi4gTWVhc3VyZW1lbnRz
LCBob3dldmVyLCBoYXZlIHNob3duIHRoYXQgYW4gYWN0dWFsIGltcHJvdmVtZW50IGNhbgo+IGJl
IGFjaGlldmVkIG9ubHkgd2l0aCBhbiBlYXJseSBwcmVmZXRjaCBvZiB0aGUgVk1DQiAodGhhbmtz
IHRvIEFuZHJldwo+IGZvciBzdWdnZXN0aW5nIHRvIHRyeSB0aGlzKSwgd2hpY2ggSSBoYXZlIHRv
IGFkbWl0IEkgY2FuJ3QgcmVhbGx5Cj4gZXhwbGFpbi4gVGhpcyB3YXkgb24gbXkgRmFtMTUgYm94
IGNvbnRleHQgc3dpdGNoIHRha2VzIG92ZXIgMTAwIGNsb2Nrcwo+IGxlc3Mgb24gYXZlcmFnZSAo
dGhlIG1lYXN1cmVkIHZhbHVlcyBhcmUgaGVhdmlseSB2YXJ5aW5nIGluIGFsbCBjYXNlcywKPiB0
aG91Z2gpLgo+IAo+IFRoaXMgaXMgaW50ZW50aW9uYWxseSBub3QgdXNpbmcgYSBuZXcgaHZtX2Z1
bmNzIGhvb2s6IEZvciBvbmUsIHRoaXMgaXMKPiBhbGwgYWJvdXQgUFYsIGFuZCBzb21ldGhpbmcg
c2ltaWxhciBjYW4gaGFyZGx5IGJlIGRvbmUgZm9yIFZNWC4KPiBGdXJ0aGVybW9yZSB0aGUgaW5k
aXJlY3QgdG8gZGlyZWN0IGNhbGwgcGF0Y2hpbmcgdGhhdCBpcyBtZWFudCB0byBiZQo+IGFwcGxp
ZWQgdG8gbW9zdCBodm1fZnVuY3MgaG9va3Mgd291bGQgYmUgdWdseSB0byBtYWtlIHdvcmsgd2l0
aAo+IGZ1bmN0aW9ucyBoYXZpbmcgbW9yZSB0aGFuIDYgcGFyYW1ldGVycy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJIGhhdmUgY29uZmlybWVk
IGl0IHdpdGggYSBzZW5pb3IgaGFyZHdhcmUgZW5naW5lZXIgYW5kIHVzaW5nIHZtbG9hZCBpbgp0
aGlzIGZhc2hpb24gaXMgc2FmZSBhbmQgcmVjb21tZW5kZWQgZm9yIHBlcmZvcm1hbmNlLiAgQXMg
ZmFyIGFzIHVzaW5nCnZtbG9hZCB3aXRoIFBWLgoKQWNrZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlh
bi53b29kc0BhbWQuY29tPgoKLS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
