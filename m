From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Wed, 12 Dec 2018 13:17:01 -0500
Message-ID: <f6fa8b66-393d-f36d-aef9-137f1a254400__20052.2257284776$1544638600$gmane$org@oracle.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
 <faae2cec-1ff2-74eb-69c8-b75f64cfca3a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OA2k=OV=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gX94n-000770-4t
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 18:17:41 +0000
In-Reply-To: <faae2cec-1ff2-74eb-69c8-b75f64cfca3a@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, mchehab@kernel.org, hpa@zytor.com, rkrcmar@redhat.com, gregkh@linuxfoundation.org, dave.hansen@linux.intel.com, hch@infradead.org, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTIvMTggMTowOSBQTSwgTWFyYW4gV2lsc29uIHdyb3RlOgo+IE9uIDEyLzYvMjAxOCAx
OjIxIFBNLCBQYW9sbyBCb256aW5pIHdyb3RlOgo+PiBPbiAwNi8xMi8xOCAwNzowMiwgTWFyYW4g
V2lsc29uIHdyb3RlOgo+Pj4gRm9yIGNlcnRhaW4gYXBwbGljYXRpb25zIGl0IGlzIGRlc2lyYWJs
ZSB0byByYXBpZGx5IGJvb3QgYSBLVk0gdmlydHVhbAo+Pj4gbWFjaGluZS4gSW4gY2FzZXMgd2hl
cmUgbGVnYWN5IGhhcmR3YXJlIGFuZCBzb2Z0d2FyZSBzdXBwb3J0IHdpdGhpbiB0aGUKPj4+IGd1
ZXN0IGlzIG5vdCBuZWVkZWQsIFFlbXUgc2hvdWxkIGJlIGFibGUgdG8gYm9vdCBkaXJlY3RseSBp
bnRvIHRoZQo+Pj4gdW5jb21wcmVzc2VkIExpbnV4IGtlcm5lbCBiaW5hcnkgd2l0aG91dCB0aGUg
bmVlZCB0byBydW4gZmlybXdhcmUuCj4+Pgo+Pj4gVGhlcmUgYWxyZWFkeSBleGlzdHMgYW4gQUJJ
IHRvIGFsbG93IHRoaXMgZm9yIFhlbiBQVkggZ3Vlc3RzIGFuZCB0aGUKPj4+IEFCSQo+Pj4gaXMg
c3VwcG9ydGVkIGJ5IExpbnV4IGFuZCBGcmVlQlNEOgo+Pj4KPj4+IMKgwqDCoCBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21pc2MvcHZoLmh0bWwKPj4+Cj4+PiBUaGlzIHBh
dGNoIHNlcmllcyB3b3VsZCBlbmFibGUgUWVtdSB0byB1c2UgdGhhdCBzYW1lIGVudHJ5IHBvaW50
IGZvcgo+Pj4gYm9vdGluZyBLVk0gZ3Vlc3RzLgo+PiBUaGFua3MhwqAgSSBzaG91bGQgYmUgYWJs
ZSB0byBwb3N0IGEgVGVzdGVkLWJ5IG5leHQgTW9uZGF5LsKgIEJvcmlzLCBhcmUKPj4geW91IGdv
aW5nIHRvIHBpY2sgaXQgdXAgZm9yIDQuMjE/CgoKSnVzdCByZWFsaXplZCBJIG5ldmVyIGFuc3dl
cmVkIHRoaXMgLS0tIHllcywgSSBhbS4gTm93IHRoYXQgQm9yaXNQLgphY2tlZCB0aGlzLCBoYXZp
bmcgeW91ciBULWIgd291bGQgYmUgZ29vZC4KCi1ib3JpcwoKCj4KPiBIaSBQYW9sbywKPgo+IEFy
ZSB5b3Ugc3RpbGwgcGxhbm5pbmcgb24gcnVubmluZyBzb21lIHRlc3Rpbmcgb2YgeW91ciBvd24g
Zm9yIHRoZXNlCj4gcGF0Y2hlcz8gU2hvdWxkIEJvcmlzIHdhaXQgdG8gaGVhciBmcm9tIHlvdSBi
ZWZvcmUgbW92aW5nIGZvcndhcmQ/Cj4KPiBUaGFua3MsCj4gLU1hcmFuCj4KPj4gUGFvbG8KPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
