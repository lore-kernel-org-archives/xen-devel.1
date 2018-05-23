From: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [PATCH v7 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Wed, 23 May 2018 09:56:56 -0700
Message-ID: <798dbae2-89ae-5ce3-9054-34f0f9bf1996__5081.06053243882$1527094585$gmane$org@oracle.com>
References: <1523920175-27287-1-git-send-email-maran.wilson@oracle.com>
 <505290b7-416f-cc97-35ff-e416ceb532c2@oracle.com>
 <911f4739-1a92-8ad3-4c0c-5541312c39fb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=psms=ik=oracle.com=maran.wilson@srs-us1.protection.inumbo.net>)
 id 1fLX56-0006wG-DF
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:57:44 +0000
In-Reply-To: <911f4739-1a92-8ad3-4c0c-5541312c39fb@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, jgross@suse.com, hpa@zytor.com, mingo@redhat.com, tglx@linutronix.de
Cc: thomas.lendacky@amd.com, mchehab@kernel.org, rkrcmar@redhat.com, gregkh@linuxfoundation.org, dave.hansen@linux.intel.com, hch@infradead.org, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, boris.ostrovsky@oracle.com, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gNS8xOC8yMDE4IDQ6MzEgQU0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMTYvMDUvMjAx
OCAyMjoyNywgTWFyYW4gV2lsc29uIHdyb3RlOgo+PiBGcmllbmRseSBwaW5nLiBJIGFtIGhvcGVm
dWwgb25lIG9mIHRoZSB4ODYgYW5kL29yIEtWTSBtYWludGFpbmVycyBoYXMgYQo+PiBmZXcgY3lj
bGVzIHRvIHNwYXJlIHRvIGxvb2sgdGhpcyBvdmVyLgo+Pgo+PiBBbmQgdGhhbmtzIHRvIGV2ZXJ5
b25lIHdobyBoYXMgaGVscGVkIHRodXMgZmFyIGJ5IHByb3ZpZGluZyB2YWx1YWJsZQo+PiBmZWVk
YmFjayBhbmQgcmV2aWV3aW5nLgo+Pgo+PiAgwqDCoCBodHRwczovL2xrbWwub3JnL2xrbWwvMjAx
OC80LzE2LzEwMDIKPiBLVk0gYml0cyBsb29rIGZpbmUuICBUaGlzIHdvdWxkIGJlIHRoZSByaWdo
dCB0aW1lIHRvIHBvc3QgdGhlIFFFTVUKPiBwYXRjaGVzLi4uCgpUaGFua3MgUGFvbG8uIFllcywg
d2Ugd2lsbCBoYXZlIHRoZSBRZW11IHBhdGNoZXMgb3V0IHNvb24uIEl0IGlzIGJlaW5nIAphY3Rp
dmVseSB3b3JrZWQuIFdlIGhhdmUgaGFkIG9uZSBpbXBsZW1lbnRhdGlvbiBpbiBwbGFjZSwgYnV0
IGRlY2lkZWQgdG8gCnJlLWltcGxlbWVudCB0aGluZ3Mgc2xpZ2h0bHkgYmFzZWQgb24gc29tZSBw
cmVsaW1pbmFyeSBmZWVkYmFjayBiZWZvcmUgCnNlbmRpbmcgaXQgb3V0IHRvIHRoZSB3aWRlciBj
b21tdW5pdHkuCgpUaGFua3MsCi1NYXJhbgoKPiBQYW9sbwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
