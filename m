From: Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH] x86: Meltdown band-aid against malicious
	64-bit PV guests
Date: Mon, 15 Jan 2018 11:54:21 -0500
Message-ID: <9BA6D188-B18A-4782-A5D4-AADC38FA731C@gmail.com>
References: <5A5899CA020000780019E014@prv-mh.provo.novell.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=yb56=ek=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1eb81h-0007Jt-B9
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 16:54:25 +0000
Received: by mail-io0-x22c.google.com with SMTP id t63so13745422iod.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2018 08:54:23 -0800 (PST)
In-Reply-To: <5A5899CA020000780019E014@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, security@xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gSmFuIDEyLCAyMDE4LCBhdCAwNToxOSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
PiB3cm90ZToKPiAKPiBUaGlzIGlzIGEgdmVyeSBzaW1wbGlzdGljIGNoYW5nZSBsaW1pdGluZyB0
aGUgYW1vdW50IG9mIG1lbW9yeSBhIHJ1bm5pbmcKPiA2NC1iaXQgUFYgZ3Vlc3QgaGFzIG1hcHBl
ZCAoYW5kIGhlbmNlIGF2YWlsYWJsZSBmb3IgYXR0YWNraW5nKTogT25seSB0aGUKPiBtYXBwaW5n
cyBvZiBzdGFjaywgSURULCBhbmQgVFNTIGFyZSBiZWluZyBjbG9uZWQgZnJvbSB0aGUgZGlyZWN0
IG1hcAo+IGludG8gcGVyLUNQVSBwYWdlIHRhYmxlcy4gR3Vlc3QgY29udHJvbGxlZCBwYXJ0cyBv
ZiB0aGUgcGFnZSB0YWJsZXMgYXJlCj4gYmVpbmcgY29waWVkIGludG8gdGhvc2UgcGVyLUNQVSBw
YWdlIHRhYmxlcyB1cG9uIGVudHJ5IGludG8gdGhlIGd1ZXN0Lgo+IENyb3NzLXZDUFUgc3luY2hy
b25pemF0aW9uIG9mIHRvcCBsZXZlbCBwYWdlIHRhYmxlIGVudHJ5IGNoYW5nZXMgaXMKPiBiZWlu
ZyBlZmZlY3RlZCBieSBmb3JjaW5nIG90aGVyIGFjdGl2ZSB2Q1BVLXMgb2YgdGhlIGd1ZXN0IGlu
dG8gdGhlCj4gaHlwZXJ2aXNvci4KPiAKPiBUaGUgY2hhbmdlIHRvIGNvbnRleHRfc3dpdGNoKCkg
aXNuJ3Qgc3RyaWN0bHkgbmVjZXNzYXJ5LCBidXQgdGhlcmUncyBubwo+IHJlYXNvbiB0byBrZWVw
IHN3aXRjaGluZyBwYWdlIHRhYmxlcyBvbmNlIGEgUFYgZ3Vlc3QgaXMgYmVpbmcgc2NoZWR1bGVk
Cj4gb3V0Lgo+IAo+IFRoZXJlIGlzIGNlcnRhaW5seSBtdWNoIHJvb20gZm9yIGltcHJvdmVtZW50
LCBlc3BlY2lhbGx5IG9mIHBlcmZvcm1hbmNlLAo+IGhlcmUgLSBmaXJzdCBhbmQgZm9yZW1vc3Qg
c3VwcHJlc3NpbmcgYWxsIHRoZSBuZWdhdGl2ZSBlZmZlY3RzIG9uIEFNRAo+IHN5c3RlbXMuIEJ1
dCBpbiB0aGUgaW50ZXJlc3Qgb2YgYmFja3BvcnRhYmlsaXR5IChpbmNsdWRpbmcgdG8gcmVhbGx5
IG9sZAo+IGh5cGVydmlzb3JzLCB3aGljaCBtYXkgbm90IGV2ZW4gaGF2ZSBhbHRlcm5hdGl2ZSBw
YXRjaGluZykgYW55IHN1Y2ggaXMKPiBiZWluZyBsZWZ0IG91dCBoZXJlLgoKVGhhbmtzIGZvciBy
ZWxlYXNpbmcgdGhpcyBwYXRjaCB0byBzdXBwb3J0IHVzZSBjYXNlcyBub3QgY292ZXJlZCBieSB0
aGUgcHJldmlvdXMgbWl0aWdhdGlvbnMuICBJcyB0aGVyZSBhIG5hbWUgb3IgYWNyb255bSB3ZSBj
YW4gdXNlIHRvIHJlZmVyZW5jZSB0aGlzIHBhdGNoIGluIHRoZSBGQVEsIFhTQSBhbmQgb3RoZXIg
c3VwcG9ydCBkb2N1bWVudHM/CgpSaWNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
