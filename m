From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Notes for xen summit 2018 design session] Graphic
 virtualization
Date: Fri, 3 Aug 2018 10:46:02 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808030807250.1127@sstabellini-ThinkPad-X260>
References: <c05f24a4-6c10-282f-3945-c63dcee168ba@arm.com>
 <c8de3993-cac5-0e94-22d9-63294d52095b@epam.com>
 <2c43233d-f140-834c-3620-a36ded9269b4@arm.com>
 <aeeb938e-6d1c-1e08-7bfd-9cbbfb69e78a@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xvd5=ks=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fle9P-0001rM-Bt
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 17:46:07 +0000
In-Reply-To: <aeeb938e-6d1c-1e08-7bfd-9cbbfb69e78a@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Artem Mygaiev <artem_mygaiev@epam.com>
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Rich Persaud <persaur@gmail.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAzIEF1ZyAyMDE4LCBBcnRlbSBNeWdhaWV2IHdyb3RlOgo+ID4gVW5mb3J0dW5hdGVs
eSwgUFYgT3BlbkdMIGlzIG5vdCBhdmFpbGFibGUgdXBzdHJlYW0gYXQgdGhlIG1vbWVudC4gSXQg
d2FzIG5vdAo+ID4gY2xlYXIgd2hldGhlciB0aGUgYmFja2VuZCBhbmQgZnJvbnRlbmQgd291bGQg
ZXZlciBiZSB1cHN0cmVhbWVkIGFuZCB3aGVuLgo+ID4gCj4gPiBIb3dldmVyLCB0aGUgd29yayBs
b29rcyBxdWl0ZSBzaW1pbGFyIHRvIHZpcmdpbAo+ID4gKGh0dHBzOi8vdmlyZ2lsM2QuZ2l0aHVi
LmlvLykuIEl0IGlzIEdyYXBoaWMgdmlydHVhbGl6YXRpb24gc29sdXRpb24gYmFzZWQKPiA+IG9u
IHZpcnRpbyBmb3IgdGhlIHRyYW5zcG9ydC4gSSB0aGluayBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byByZS11c2UgaXQgYnkKPiA+IGp1c3QgcmVwbGFjaW5nIHRoZSB0cmFuc3BvcnQgbGF5ZXIuCj4g
PiAKPiA+IEFub3RoZXIgc29sdXRpb24gaXMgdG8gaW1wbGVtZW50IHZpcnRpbyBvbiBYZW4gKHNl
ZSB0aGUgZGlzY3Vzc2lvbiBvbiB0aGUKPiA+IGxhc3QgY29tbXVuaXR5IGNhbGwpLgo+IAo+IERv
IHdlIHBsYW4gc29tZSBmb2xsb3ctdXAgZGlzY3Vzc2lvbiBvbiB0aGlzPyBJIGhhdmUgbWlzc2Vk
IHRoZSBjYWxsIGR1ZSB0bwo+IHRyYXZlbHMgbGFzdCBjb3VwbGUgd2Vla3Mgc28gSSBtYXkgbm90
IGhhdmUgYSBmdWxsIHBpY3R1cmUuLi4KClllcywgdGhlcmUgd2lsbCBiZSBtb3JlIGRpc2N1c3Np
b25zLiBXZSB0YWxrZWQgYWJvdXQgdGhlIGNoYW5nZXMgd2UKd291bGQgbmVlZCB0byB0aGUgdmly
dGlvIHNwZWNpZmljYXRpb24gKHRoZW4sIHRoZSB2aXJ0aW8gZnJvbnRlbmRzIGFuZApiYWNrZW5k
cykgdG8gbWFrZSBpdCBwb3NzaWJsZSB0byB1c2UgdGhlbSBlZmZlY3RpdmVseSBpbiB0aGUgZnV0
dXJlLCBhbmQKd2l0aCBwcm9wZXIgaXNvbGF0aW9uLCB3aXRoIFhlbiAobWFraW5nIGRyaXZlciBk
b21haW5zIHBvc3NpYmxlLCBldGMpLiBBCmNvdXBsZSBvZiBpZGVhcyB3ZXJlIHByb3Bvc2VkLCBi
dXQgd2UgZG9uJ3QgaGF2ZSBhIGNvbXByZWhlbnNpdmUgbGlzdAp5ZXQuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
