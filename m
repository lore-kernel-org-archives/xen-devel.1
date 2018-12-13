From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Wed, 12 Dec 2018 21:10:50 -0500
Message-ID: <ceb7b059-b9d9-7c3a-8fbc-bb0e0bfa79e2@oracle.com>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
 <5C0FED5702000078002053C6@prv1-mh.provo.novell.com>
 <20181211181652.GC25566@otc-nc-03>
 <5C10B8200200007800205515@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zBmR=OW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gXGT0-00061f-W9
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 02:11:11 +0000
In-Reply-To: <5C10B8200200007800205515@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Ashok Raj <ashok.raj@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Borislav Petkov <bp@suse.de>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTIvMTggMjoyNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTEuMTIuMTgg
YXQgMTk6MTYsIDxhc2hvay5yYWpAaW50ZWwuY29tPiB3cm90ZToKPj4gQlRXOiBBcGFydCBmcm9t
IHRoZSBmYWN0IGl0cyB1Z2x5IGFuZCB0YWtlIGEgbG9vb29uZyB0aW1lIHRvIGNvbXBsZXRlLCBk
byB5b3UKPj4gaGF2ZSBhbnkgcHJhY3RpY2FsIGlzc3N1ZXMgeW91IHdhbnQgdG8gaGlnaGxpZ2h0
PyBtYXliZSB0aGF0IGNhbiAKPj4gaGVscCB1cHN0cmVhbSBhcyB3ZWxsLgo+IFRoZSBzaXR1YXRp
b24gZm9yIGEga2VybmVsIGFuZCBhIGh5cGVydmlzb3IgbWlnaHQgYmUgZGlmZmVyZW50IGhlcmUK
PiAoYnV0IGluIHRoZSBMaW51eCBjYXNlIG1heSB0aGVuIGJlIG1vcmUgaHlwZXJ2aXNvci1saWtl
IHdoZW4KPiBjb25zaWRlcmluZyBLVk0pOiBUaGUgaHlwZXJ2aXNvciBuZWVkcyB0byBtYWtlIHN1
cmUgaW4gcGFydGljdWxhcgo+IHRpbWUgbWFuYWdlbWVudCB3aXRoaW4gZ3Vlc3RzIHdvbid0IGJy
ZWFrLiBTdG9wcGluZyB0aGUKPiBtYWNoaW5lIGZvciBhbiBleHRlbmRlZCBwZXJpb2Qgb2YgdGlt
ZSBtYXkgbm90IGJlIGhlbHBmdWwgdGhlcmUuCj4gRm9yIHByb2Nlc3NlcyBpbiBhbiBPUyB0aGUg
Y29uc3RyYWludHMgbWlnaHQgbm90IGJlIGFzIHRpZ2h0LCBidXQKPiBJIGNvdWxkIGltYWdpbmcg
cHJvYmxlbXMgZXZlbiB0aGVyZSBpbiBzb21lIGxlc3MgY29tbW9uIGNhc2VzLgo+Cj4gVGhhdCBz
YWlkLCBJJ20gbm90IGNvbnZpbmNlZCBhdCBhbGwgaXQgaXMgYSBnb29kIGlkZWEgdG8gbG9hZCBu
ZXcKPiB1Y29kZSB3aGlsZSBfYW55XyBndWVzdHMgYXJlIHJ1bm5pbmcsIGJ1dCB3ZSdyZSB0YWxr
aW5nIGFib3V0IGEKPiBsYXN0IHJlc29ydCBhcHByb2FjaCBoZXJlIGFueXdheS4KPgoKQlRXLCBv
bmUgdGhpbmcgSSBtZWFudCB0byBtZW50aW9uIGFib3V0IHRoaXMgcGF0Y2ggZWFybGllcjogd2Ug
b2JzZXJ2ZWQKdGhhdCB1cGRhdGluZyBtaWNyb2NvZGUgZnJvbSBvbmx5IG9uZSBzaWJsaW5nIHJl
c3VsdGVkIGluIGd1ZXN0IHJlYWRpbmcKc3RhbGUgdmVyc2lvbiB2YWx1ZSBmcm9tIGFub3RoZXIg
dGhyZWFkLiBUaGlzIGNhdXNlcyBhdCBsZWFzdCBzb21lCldpbmRvd3MgdmVyc2lvbnMgdG8gY3Jh
c2guCgpXZSBlbmRlZCB1cCBleGVjdXRpbmcgIndybXNyKDB4OGIsIDApOyBjcHVpZF9lYXgoMSk7
IiBvbiBhbGwgdGhyZWFkcwphZnRlciB0aGUgdXBkYXRlLiAoQW5vdGhlciBhbHRlcm5hdGl2ZSBj
b3VsZCBiZSB0byBpbnRlcmNlcHQgdGhlIHJlYWRzKQoKLWJvcmlzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
