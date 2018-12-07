From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Fri, 7 Dec 2018 07:02:13 +0100
Message-ID: <2c289956-0e6a-700c-605d-83685fbb08f9__39978.7546521567$1544162472$gmane$org@suse.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kC+f=OQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gV9DP-0006os-QN
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 06:02:19 +0000
In-Reply-To: <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAyMzoxMSwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAwNi8xMi8xOCAw
NzowNCwgTWFyYW4gV2lsc29uIHdyb3RlOgo+PiArY29uZmlnIFBWSAo+PiArCWJvb2wgIlN1cHBv
cnQgZm9yIHJ1bm5pbmcgUFZIIGd1ZXN0cyIKPj4gKwktLS1oZWxwLS0tCj4+ICsJICBUaGlzIG9w
dGlvbiBlbmFibGVzIHRoZSBQVkggZW50cnkgcG9pbnQgZm9yIGd1ZXN0IHZpcnR1YWwgbWFjaGlu
ZXMKPj4gKwkgIGFzIHNwZWNpZmllZCBpbiB0aGUgeDg2L0hWTSBkaXJlY3QgYm9vdCBBQkkuCj4+
ICsKPiAKPiBJSVVDIHRoaXMgYnJlYWtzICJub3JtYWwiIGJ6SW1hZ2UgYm9vdCwgc28gd2Ugc2hv
dWxkIGhhdmUgc29tZXRoaW5nIGxpa2UKPiAKPiAJVGhlIHJlc3VsdGluZyBrZXJuZWwgd2lsbCBu
b3QgYm9vdCB3aXRoIG1vc3QgeDg2IGJvb3QgbG9hZGVycwo+IAlzdWNoIGFzIEdSVUIgb3IgU1lT
TElOVVguICBVbmxlc3MgeW91IHBsYW4gdG8gc3RhcnQgdGhlIGtlcm5lbAo+IAl1c2luZyBRRU1V
IG9yIFhlbiwgeW91IHByb2JhYmx5IHdhbnQgdG8gc2F5IE4gaGVyZS4KClRoZSByZXN1bHRpbmcg
a2VybmVsIHNob3VsZCBiZSBhYmxlIHRvIGJlIGJvb3RlZCBlaXRoZXIgaW4gUFZIIG1vZGUKdmlh
IHRoZSBQVkggZW50cnkgcG9pbnQgb3IgdGhlICJub3JtYWwiIHdheSB2aWEgdGhlIHN0aWxsIGV4
aXN0aW5nCm9sZCBlbnRyeSBwb2ludChzKS4KCkl0IGlzIGFuIF9hZGRpdGlvbmFsXyB3YXkgdG8g
Ym9vdCB0aGUga2VybmVsLCBub3QgYW4gZXhjbHVzaXZlCmFsdGVybmF0aXZlLgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
