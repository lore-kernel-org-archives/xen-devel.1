From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Tue, 29 Jan 2019 13:53:08 +0000
Message-ID: <1eaf158a-427f-a89d-5132-eed5bf6e95fc@arm.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
 <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dSfb=QF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1goTpA-0004wR-Hy
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 13:53:12 +0000
In-Reply-To: <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDEvMjAxOSAxMzozNiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBKdWxpZW4s
CgpIaSwKCj4gT24gMjguMDEuMTkgMTg6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVGhlcmUg
c2hvdWxkIGJlIG5vIFNldC9XYXkgaW4gTGludXggNC4xNC4gU28gSSBhbSBhIGJpdCBjb25mdXNl
ZCBob3cgY2FuIAo+PiBldmVuwqByZWFjaMKgdGhpc8KgY29kZS4KPiAKPiBXZWxsLCB0aGF0IGlz
IGEgcHJvcHJpZXRhcnkga2VybmVsIGRyaXZlciBkb2luZyBjYWNoZSBtYWludGVuYW5jZSB1c2lu
ZyBTZXQvV2F5IAo+IG9wZXJhdGlvbnMuIEFuZCBJJ20gbm90IHN1cmUgaWYgd2UgY2FuIGF2b2lk
IHRoYXQgOigKCldoaWNoIHByb3ByaWV0YXJ5IGtlcm5lbCBkcml2ZXI/IEFuZCBpbiB3aGljaCBj
b250ZXh0IGFyZSBTZXQvV2F5IG9wZXJhdGlvbnMgdXNlZD8KClVzaW5nIFNldC9XYXkgaXMgZnVu
ZGFtZW50YWxseSBicm9rZW4gcGFydGx5IGJlY2F1c2UgaXQgZG9lcyBub3QgZGVhbCB3aXRoIApz
eXN0ZW0gY2FjaGVzLiBJdCBhbHNvIG9ubHkgYXBwbGllcyB0byBhIGdpdmVuIGNhY2hlIGFuZCB0
aGUgYmVoYXZpb3Igd2lsbCBub3QgCmJlIHJlcGxpY2F0ZWQgdG8gb3RoZXIgQ1BVcy4gRm9yIG1v
cmUgZGV0YWlscywgaGF2ZSBhIGxvb2sgYXQgWzFdLgoKSWYgeW91IHdvbmRlciwgdGhpcyB3b3Jr
ZWQgYnkgcHVyZSBjaGFuY2UgaW4gb2xkZXIgcmVsZWFzZS4gUnVubmluZyBzdWNoIApzb2Z0d2Fy
ZSBpcyBhIGNhbGwgZm9yIG5hc3R5IGJlaGF2aW9yIGluIHlvdXIgZ3Vlc3QuCgpDaGVlcnMsCgpb
MV0gaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1zMDdmODJpaUktRQoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
