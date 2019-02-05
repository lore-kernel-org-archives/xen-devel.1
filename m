From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Mon, 4 Feb 2019 17:10:47 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902041705520.22962@sstabellini-ThinkPad-X260>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
 <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
 <1eaf158a-427f-a89d-5132-eed5bf6e95fc@arm.com>
 <3bd93c19-9264-4494-52ce-3e2672c1e573@gmail.com>
 <325628f3-9fc9-d021-fefc-5d06c82dfff5@arm.com>
 <b84c9e8a-e551-2c88-d275-14665835fde8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYof=QM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gqpGE-0007K6-4j
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 01:10:50 +0000
In-Reply-To: <b84c9e8a-e551-2c88-d275-14665835fde8@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyOSBKYW4gMjAxOSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBPbiAyOS4wMS4xOSAx
NzoxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gTm8gd2UgZG9uJ3QgaGF2ZSB0by4KPiBJIG1l
YW4sIEVQQU0gc3lzdGVtcyBhcyBhIFhFTiBiYXNlZCB2aXJ0dWFsaXphdGlvbiBzb2x1dGlvbiBw
cm92aWRlciBoYXZlIHRvCj4gaGFuZGxlIHRoYXQgaXNzdWUuCj4gCj4gPiBUaGV5IGhhdmUgYmVl
biBsdWNreSB0byBzZWUgdGhpcyB3b3JraW5nIGV2ZW4gb24gYmFyZW1ldGFsLgo+ID4gU2V0L1dh
eSBvcGVyYXRpb25zIGhhdmUgYmVlbiBkcm9wcGVkIGZyb20gTGludXggZm9yIGEgbG9uZyB0aW1l
LCBzbyBJIHJlYWxseQo+ID4gY2FuJ3Qgc2VlIHdoeSBhIHByb3ByaWV0YXJ5IGRyaXZlciBpcyBz
dGlsbCB1c2luZyB0aGVtLgo+IEkgZ3Vlc3MgdGhlcmUgd2VyZSBzb21lIHBlcmZvcm1hbmNlIGNv
bmNlcm5zLiBBbmQgdGhleSBhcmUgcmVhbGx5IGx1Y2t5LCBzbwo+IHRoZXkgZGlkIG5vdCBmYWNl
IHJlbGF0ZWQgaXNzdWVzIG9uIGJhcmVtZXRhbC4KPiAKPiA+IEkgdGhpbmsgdGhlIHBvbGljeSBm
b3IgU2V0L1dheSBvcGVyYXRpb25zIGlzIGNvcnJlY3QgaW4gWGVuLiBUaGlzIHdvcmtzIHRvCj4g
PiBhdm9pZCBicmVha2luZyBiYXNpYyBjYXNlIGJ1dCB0aGUgbW9zdCBjb21wbGV4IG9uZSBhcmUg
Z29pbmcgdG8gYnJlYWsuCj4gTWF5YmUgaXQgd29ydGggdG8gZ2V0IGEgbm90aWZpY2F0aW9uIGZy
b20gWEVOLCBpLmUuIFdBUk5fT05DRSwgc2F5aW5nIHRoYXQKPiBTZXQvV2F5IGNhY2hlIG9wZXJh
dGlvbnMgYXJlIHVuZGVzaXJhYmxlIGluIFZNIGFuZCB3aWxsIGxlYWQgdG8gdGhlIHN5c3RlbQo+
IHBlcmZvcm1hbmNlIGRyb3AsIG9yIGV2ZW4gaW5zdGFiaWxpdHkgaW4gY2FzZSBvZiBJT01NVSBz
aGFyaW5nIHAybSB3aXRoIENQVS4KPiBUaGlzIG1pZ2h0IHNhdmUgZGF5cyBvZiBkZWJ1Z2dpbmcg
dG8gWEVOIG9uIEFSTSB1c2Vycy4KCkEgV0FSTl9PTkNFIHdvdWxkIGJlIG5pY2UuIElmIHlvdSBz
ZW5kIGEgcGF0Y2ggSSB3b3VsZCBiZSBoYXBweSB0byB0YWtlCmluIDQuMTIgKGlmIHRoZSByZWxl
YXNlIG1hbmFnZXIgYWdyZWVzKS4KCgo+ID4gWW91IHNvbHV0aW9uIGlzIG9ubHkgZGVsYXlpbmcg
dGhlIHJlYWwgZml4Cj4gSSB3b3VsZCBub3Qgc2F5IGl0IGlzIGRlbGF5aW5nIHRoZSBmaXgsIGJ1
dCBhbGxvd3MgdXMgdG8gaGF2ZSBhIGZ1bmN0aW9uYWwKPiBzeXN0ZW0gdW50aWwgd2UgZ2V0IHRo
YXQgZml4Lgo+IAo+ID4gKGkuZSByZW1vdmluZyBTZXQvV2F5IG9wZXJhdGlvbiBmcm9tIHRoZSBz
b2Z0d2FyZSkuIFNvIGhlcmUgdGhlIGJlc3QKPiA+IHNvbHV0aW9uIGlzIHRvIGdvIHRvIHRoZSB2
ZW5kb3IgYW5kIGFzayB0aGVtIHRvIGZpeCB0aGVpciBzb2Z0d2FyZS4KPiBBY3R1YWxseSBlc2Nh
bGF0aW9uIHRoZSBpc3N1ZSB0byB0aGUgdmVuZG9yIGlzIG9uZSBvZiBvdXIgbmV4dCBzdGVwcyBo
ZXJlLgoKWW91IHJlYWxseSB3YW50IHRvIGZpeCB0aGlzIGluIHRoZSBMaW51eCBkcml2ZXIgaWYg
eW91IGNhbiwgYmVjYXVzZQp5b3UnbGwgZ2V0IGJldHRlciBwZXJmb3JtYW5jZSBhbmQgYSBtb3Jl
IHN0YWJsZSBzeXN0ZW0uIEluIHRoZSBzaG9ydAp0ZXJtLCBJIHdvdWxkIHN1Z2dlc3QgeW91IGtl
ZXAgdGhlIHdvcmstYXJvdW5kIGluIHlvdXIgcHJpdmF0ZSB0cmVlLgpIb3dldmVyLCBkbyBsZXQg
dXMga25vdyBob3cgdGhlIGVzY2FsYXRpb24gd2l0aCB0aGUgdmVuZG9yIHByb2NlZWRzIGFuZApp
ZiB5b3UgaGF2ZSBhbnkgdHJvdWJsZXMgd2l0aCBpdC4gSnVsaWVuIGFuZCBJIHdvdWxkIGJlIGhh
cHB5IHRvIHByb3ZpZGUKaGVscCBpbiB0ZXJtcyBvZiBpbmZvcm1hdGlvbiBhbmQgZG9jcyBvbiB0
aGUgcmVhc29ucyB3aHkgdGhpcyBzaG91bGQgYmUKZml4ZWQgaW4gdGhlIGRyaXZlci4gSnVsaWVu
IG1pZ2h0IGV2ZW4gYmUgYWJsZSB0byBoZWxwIGZ1cnRoZXIgdmlhIGhpcwplbXBsb3llci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
