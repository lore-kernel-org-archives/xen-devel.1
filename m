From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Fri, 7 Dec 2018 14:41:46 +0100
Message-ID: <0a2f692a-f7df-8ad1-9d34-96f5e36926db__17133.6816660643$1544190039$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <2c289956-0e6a-700c-605d-83685fbb08f9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JtOs=OQ=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gVGOC-0004QX-03
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 13:41:56 +0000
In-Reply-To: <2c289956-0e6a-700c-605d-83685fbb08f9@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTggMDc6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDYvMTIvMjAxOCAy
MzoxMSwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4gT24gMDYvMTIvMTggMDc6MDQsIE1hcmFuIFdp
bHNvbiB3cm90ZToKPj4+ICtjb25maWcgUFZICj4+PiArCWJvb2wgIlN1cHBvcnQgZm9yIHJ1bm5p
bmcgUFZIIGd1ZXN0cyIKPj4+ICsJLS0taGVscC0tLQo+Pj4gKwkgIFRoaXMgb3B0aW9uIGVuYWJs
ZXMgdGhlIFBWSCBlbnRyeSBwb2ludCBmb3IgZ3Vlc3QgdmlydHVhbCBtYWNoaW5lcwo+Pj4gKwkg
IGFzIHNwZWNpZmllZCBpbiB0aGUgeDg2L0hWTSBkaXJlY3QgYm9vdCBBQkkuCj4+PiArCj4+Cj4+
IElJVUMgdGhpcyBicmVha3MgIm5vcm1hbCIgYnpJbWFnZSBib290LCBzbyB3ZSBzaG91bGQgaGF2
ZSBzb21ldGhpbmcgbGlrZQo+Pgo+PiAJVGhlIHJlc3VsdGluZyBrZXJuZWwgd2lsbCBub3QgYm9v
dCB3aXRoIG1vc3QgeDg2IGJvb3QgbG9hZGVycwo+PiAJc3VjaCBhcyBHUlVCIG9yIFNZU0xJTlVY
LiAgVW5sZXNzIHlvdSBwbGFuIHRvIHN0YXJ0IHRoZSBrZXJuZWwKPj4gCXVzaW5nIFFFTVUgb3Ig
WGVuLCB5b3UgcHJvYmFibHkgd2FudCB0byBzYXkgTiBoZXJlLgo+IAo+IFRoZSByZXN1bHRpbmcg
a2VybmVsIHNob3VsZCBiZSBhYmxlIHRvIGJlIGJvb3RlZCBlaXRoZXIgaW4gUFZIIG1vZGUKPiB2
aWEgdGhlIFBWSCBlbnRyeSBwb2ludCBvciB0aGUgIm5vcm1hbCIgd2F5IHZpYSB0aGUgc3RpbGwg
ZXhpc3RpbmcKPiBvbGQgZW50cnkgcG9pbnQocykuCj4gCj4gSXQgaXMgYW4gX2FkZGl0aW9uYWxf
IHdheSB0byBib290IHRoZSBrZXJuZWwsIG5vdCBhbiBleGNsdXNpdmUKPiBhbHRlcm5hdGl2ZS4K
Cll1cCwgdW5kZXJzdG9vZCBub3cuICBEaWZmZXJlbnQgYmluYXJpZXMgYnV0IG9uZSBidWlsZC4K
ClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
