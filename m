From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 15/24] hw: i386: Export the
 i386 ACPI SRAT build method
Date: Mon, 26 Nov 2018 16:47:51 +0100
Message-ID: <20181126164751.4e304b46@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-16-sameo@linux.intel.com>
 <20181115142854.1c62f32f@redhat.com>
 <20181121232733.GC4450@caravaggio>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qdkI=OF=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gRJ7E-0006FV-7x
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 15:48:04 +0000
In-Reply-To: <20181121232733.GC4450@caravaggio>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMiBOb3YgMjAxOCAwMDoyNzozMyArMDEwMApTYW11ZWwgT3J0aXogPHNhbWVvQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IE9uIFRodSwgTm92IDE1LCAyMDE4IGF0IDAyOjI4OjU0
UE0gKzAxMDAsIElnb3IgTWFtbWVkb3Ygd3JvdGU6Cj4gPiBPbiBNb24sICA1IE5vdiAyMDE4IDAy
OjQwOjM4ICswMTAwCj4gPiBTYW11ZWwgT3J0aXogPHNhbWVvQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6Cj4gPiAgIAo+ID4gPiBUaGlzIGlzIHRoZSBzdGFuZGFyZCB3YXkgb2YgYnVpbGRpbmcgU1JB
VCBvbiB4ODYgcGxhdGZvbXMuIEJ1dCBmdXR1cmUKPiA+ID4gbWFjaGluZSB0eXBlcyBjb3VsZCBk
ZWNpZGUgdG8gZGVmaW5lIHRoZWlyIG93biBjdXN0b20gU1JBVCBidWlsZCBtZXRob2QKPiA+ID4g
dGhyb3VnaCB0aGUgQUNQSSBidWlsZGVyIG1ldGhvZHMuCj4gPiA+IE1vcmVvdmVyLCB3ZSB3aWxs
IGFsc28gbmVlZCB0byByZWFjaCBidWlsZF9zcmF0KCkgZnJvbSBvdXRzaWRlIG9mCj4gPiA+IGFj
cGktYnVpbGQgaW4gb3JkZXIgdG8gdXNlIGl0IGFzIHRoZSBBQ1BJIGJ1aWxkZXIgU1JBVCBidWls
ZCBtZXRob2QuICAKPiA+IFNSQVQgaXMgdXN1YWxseSBoaWdobHkgbWFjaGluZSBzcGVjaWZpYyAo
bWVtb3J5IGhvbGVzLCBsYXlvdXQsIGd1ZXN0IE9TCj4gPiBzcGVjaWZpYyBxdWlya3MpIHNvIGl0
J3MgaGFyZCB0byBnZW5lcmFsaXplIGl0LiAgCj4gSGVuY2UgdGhlIG5lZWQgZm9yIGFuIFNSQVQg
YnVpbGRlciBpbnRlcmZhY2UuCnNvIGZhciBidWlsZGVyIGludGVyZmFjZSAodHJ5aW5nIHRvIGdl
bmVyYWxpemUgYWNwaV9idWlsZCgpKSBsb29rcwpub3QgbmVjZXNzYXJ5LgpJJ2Qgc3VnZ2VzdCB0
byBkcm9wIGFuZCBjYWxsIGJ1aWxkX3N0YXJ0KCkgZGlyZWN0bHkuCgo+ID4gSSdkICBkcm9wIFNS
QVQgcmVsYXRlZCBwYXRjaGVzIGZyb20gdGhpcyBzZXJpZXMgYW5kIGludHJvZHVjZQo+ID4gaTM4
Ni92aXJ0IHNwZWNpZmljIFNSQVQgd2hlbiB5b3UgcG9zdCBwYXRjaGVzIGZvciBpdC4gIAo+IHZp
cnQgdXNlcyB0aGUgZXhpc3RpbmcgaTM4NiBidWlsZF9zcmF0KCkgcm91dGluZSwgdGhlcmUncyBu
b3RoaW5nCj4gc3BlY2lhbCBhYm91dCBpdC4gU28gdGhpcyB3b3VsZCBiZSBwdXJlbHkgZHVwbGlj
YXRlZCBjb2RlLgpMb29raW5nIGF0IGJ1aWxkX3NyYXQoKSwgaXQgaGFzIGEgYnVuY2ggb2YgY29k
ZSB0byBoYW5kbGUgbGVnYWN5ClBDIGxheW91dC4gWW91IHByb2JhYmx5IGRvbid0IG5lZWQgYW55
IG9mIGl0IGZvciBuZXcgaXM4Ni92aXJ0Cm1hY2hpbmUgYW5kIGNhbiBtYWtlIHNpbXBsZXIgdmVy
c2lvbiBvZiBpdC4KCkluIGFkZGl0aW9uIChwcm9iYWJseSByZXBlYXRpbmcgcXVlc3Rpb24gSSd2
ZSBhc2tlZCBlbHNld2hlcmUpLApEbyB5b3UgaGF2ZSB0byB1c2Ugc3BsaXQgaW5pdGlhbCBtZW1v
cnkgbW9kZWwgZm9yIG5ldyBtYWNoaW5lPwpJcyBpdCBwb3NzaWJsZSB0byB1c2Ugb25seSBwYy1k
aW1tcyBib3RoIGZvciBpbml0aWFsIGFuZCBob3RwbHVnZ2VkIG1lbW9yeQphdCBzb21lIGFkZHJl
c3MgKDRHYj8pIHdpdGhvdXQgY3V0dGluZyBvdXQgUENJIGhvbGUgb3IgYW55IHRvaGVyIGhvbGVz
IGluIFJBTSBsYXlvdXQ/Cgo+IENoZWVycywKPiBTYW11ZWwuCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
