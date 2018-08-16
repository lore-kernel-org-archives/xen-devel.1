From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Thu, 16 Aug 2018 05:27:56 -0600
Message-ID: <5B755FBC02000078001DEDBF@prv1-mh.provo.novell.com>
References: <20180810103714.5112-1-paul.durrant@citrix.com>
 <5B6D7E9C02000078001DCF26@prv1-mh.provo.novell.com>
 <d60afbae4e264d6bb6f29c9ae0445133@AMSPEX02CL03.citrite.net>
 <5B6D816402000078001DCF55@prv1-mh.provo.novell.com>
 <990684b4ff644494bdf006a8c9f69bf5@AMSPEX02CL03.citrite.net>
 <5B6D86F302000078001DCF85@prv1-mh.provo.novell.com>
 <e8cff3ca6c154b67a2a932af83719354@AMSPEX02CL03.citrite.net>
 <fdf19f7d-1b92-a9c0-3602-b1c9807bf610@citrix.com>
 <a735b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net>
 <5B6DAF9F02000078001DD040@prv1-mh.provo.novell.com>
 <e2f77af0b2394b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net>
 <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B75521102000078001DED13@prv1-mh.provo.novell.com>
 <11c0c965-9af7-2cec-1420-4541e281183a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x9l4=k7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqGRc-0002Ov-Jc
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 11:28:00 +0000
In-Reply-To: <11c0c965-9af7-2cec-1420-4541e281183a@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, george.dunlap@citrix.com, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA4LjE4IGF0IDEyOjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDgvMTggMTE6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBGb2xsb3dpbmcg
c29tZSBmdXJ0aGVyIGRpc2N1c3Npb24gd2l0aCBBbmRyZXcsIGhlIGxvb2tzIHRvIGJlCj4+IGNv
bnZpbmNlZCB0aGF0IHRoZSBpc3N1ZSBpcyB0byBiZSBmaXhlZCBpbiB0aGUgYmFsbG9vbiBkcml2
ZXIsCj4+IHdoaWNoIHNvIGZhciAoaW50ZW50aW9uYWxseSBhZmFpY3QpIGRvZXMgbm90IHJlbW92
ZSB0aGUgZGlyZWN0Cj4+IG1hcCBlbnRyaWVzIGZvciBiYWxsb29uZWQgb3V0IHBhZ2VzIGluIHRo
ZSBIVk0gY2FzZS4gSSdtIG5vdAo+PiBjb252aW5jZWQgb2YgdGhpcywgYnV0IEknZCBuZXZlcnRo
ZWxlc3MgbGlrZSB0byBpbnF1aXJlIHdoZXRoZXIKPj4gc3VjaCBhIGNoYW5nZSAocmVzdWx0aW5n
IGluIHNoYXR0ZXJlZCBzdXBlciBwYWdlIG1hcHBpbmdzKQo+PiB3b3VsZCBiZSBhY2NlcHRhYmxl
IGluIHRoZSBmaXJzdCBwbGFjZS4KPiAKPiBXZSBkb24ndCB0b2xlcmF0ZSBhbnl0aGluZyBlbHNl
IGluIHRoZSBkaXJlY3RtYXAgcG9pbnRpbmcgdG8KPiBpbnZhbGlkL3VuaW1wbGVtZW50ZWQgZnJh
bWVzLiAgV2h5IHNob3VsZCBiYWxsb29uaW5nIGJlIGFueSBkaWZmZXJlbnQ/CgpCZWNhdXNlIGJh
bGxvb25pbmcgaXMgc29tZXRoaW5nIHZpcnR1YWxpemF0aW9uIHNwZWNpZmljLCB3aGljaApkb2Vz
bid0IGhhdmUgYW55IGVxdWl2YWxlbnQgb24gYmFyZSBoYXJkd2FyZSAobWVtb3J5IGhvdAp1bnBs
dWcgZG9lc24ndCBjb21lIHF1aXRlIGNsb3NlIGVub3VnaCBpbW8sIG5vdCB0aGUgbGVhc3QKYmVj
YXVzZSB0aGF0IGRvZXNuJ3Qgd29yayBvbiBhIHBhZ2UgZ3JhbnVsYXIgYmFzaXMpLiBIZW5jZQp3
ZSdyZSB0byBkZWZpbmUgdGhlIGV4YWN0IGJlaGF2aW9yIGhlcmUsIGFuZCBoZW5jZSBzdWNoIGEK
ZGVmaW5pdGlvbiBjb3VsZCBhcyB3ZWxsIGluY2x1ZGUgc3BlY2lhbCBiZWhhdmlvciBvZiBhY2Nl
c3Nlcwp0byB0aGUgaW52b2x2ZWQgZ3Vlc3QtcGh5c2ljYWwgYWRkcmVzc2VzLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
