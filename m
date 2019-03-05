From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
Date: Tue, 5 Mar 2019 14:53:25 +0100
Message-ID: <55039c66-447d-6aa5-446e-58b0e3496e97@suse.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1AVg-0001SW-1z
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 13:53:32 +0000
In-Reply-To: <5C7E798E020000780021BB43@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGNvbW1pdCByZS1p
bnRyb2R1Y2luZyBpdCAoMTRlYjNiNDFkMCBbInhlbjogcmVpbnN0YXRlIHByZXZpb3VzbHkKPiB1
bnVzZWQgWEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNtYXAgaHlwZXJjYWxsIl0pIGFzIHdlbGwgYXMg
dGhlIG9uZSBoYXZpbmcKPiBvcmlnaW5hbGx5IGludHJvZHVjZWQgaXQgKGQ4MThmM2NiN2MgWyJo
dm06IFVzZSBtYWluIG1lbW9yeSBmb3IgdmlkZW8KPiBtZW1vcnkiXSkgYW5kIHRoZSBvbmUgdGhl
biBwdXJnaW5nIGl0IGFnYWluICg3OGMzMDk3ZTRmIFsiUmVtb3ZlIHVudXNlZAo+IFhFTk1FTV9y
ZW1vdmVfZnJvbV9waHlzbWFwIl0pIG1ha2UgY2xlYXIgdGhhdCB0aGlzIG9wZXJhdGlvbiBpcyBp
bnRlbmRlZAo+IGZvciB1c2Ugb24gSFZNIChpLmUuIHRyYW5zbGF0ZWQpIGd1ZXN0cyBvbmx5LiBS
ZXN0cmljdCBpdCBhdCBsZWFzdCBhcwo+IG11Y2gsIGJlY2F1c2UgZm9yIFBWIGd1ZXN0cyBkb2N1
bWVudGF0aW9uIChpbiB0aGUgcHVibGljIGhlYWRlcikgZG9lcwo+IG5vdCBldmVuIG1hdGNoIHRo
ZSBpbXBsZW1lbnRhdGlvbjogSXQgdGFsa3MgYWJvdXQgR1BGTiBhcyBpbnB1dCwgYnV0Cj4gZ2V0
X3BhZ2VfZnJvbV9nZm4oKSBhc3N1bWVzIGEgR01GTiBpbiB0aGUgbm9uLXRyYW5zbGF0ZWQgY2Fz
ZSAoYW5kIGhhbmRzCj4gYmFjayB0aGUgdmFsdWUgcGFzc2VkIGluKS4KPiAKPiBBbHNvIGxpZnQg
dGhlIGNoZWNrIGluIFhFTk1FTV9hZGRfdG9fcGh5c21hcHssX2JhdGNofSBoYW5kbGluZyB1cAo+
IGRpcmVjdGx5IGludG8gdG9wIGxldmVsIGh5cGVyY2FsbCBoYW5kbGluZywgYW5kIGNsYXJpZnkg
dGhpbmdzIGluIHRoZQo+IHB1YmxpYyBoZWFkZXIgYWNjb3JkaW5nbHkuCj4gCj4gVGFrZSB0aGUg
bGliZXJ0eSBhbmQgYWxzbyByZXBsYWNlIGEgcG9pbnRsZXNzIHVzZSBvZiAiY3VycmVudCIgd2l0
aCBhCj4gbW9yZSBlZmZpY2llbnQgdXNlIG9mIGFuIGV4aXN0aW5nIGxvY2FsIHZhcmlhYmxlIChv
ciBmdW5jdGlvbiBwYXJhbWV0ZXIKPiB0byBiZSBwcmVjaXNlKS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpEbyBJIHJlYWQgdGhpcyBjb3JyZWN0
bHk6IG5vdGhpbmcgYmFkIGZvciB0aGUgaG9zdCBjYW4gaGFwcGVuIHdpdGhvdXQKdGhpcyBwYXRj
aD8gSWYgdGhpcyBpcyBjb3JyZWN0IEknZCBsaWtlIHRvIGRlZmVyIHRoaXMgcGF0Y2ggdW50aWwg
NC4xMy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
