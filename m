From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v9 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Fri, 14 Dec 2018 18:13:10 -0500
Message-ID: <f7578f80-9bfb-3c90-69fe-11514209db7f__24414.3621334389$1544829198$gmane$org@oracle.com>
References: <1544468734-32763-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtUr=OX=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gXwel-0006fI-6f
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 23:14:07 +0000
In-Reply-To: <1544468734-32763-1-git-send-email-maran.wilson@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, pbonzini@redhat.com, jgross@suse.com
Cc: thomas.lendacky@amd.com, mchehab@kernel.org, hpa@zytor.com, rkrcmar@redhat.com, gregkh@linuxfoundation.org, dave.hansen@linux.intel.com, hch@infradead.org, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggMjowNSBQTSwgTWFyYW4gV2lsc29uIHdyb3RlOgo+IEZvciBjZXJ0YWluIGFw
cGxpY2F0aW9ucyBpdCBpcyBkZXNpcmFibGUgdG8gcmFwaWRseSBib290IGEgS1ZNIHZpcnR1YWwK
PiBtYWNoaW5lLiBJbiBjYXNlcyB3aGVyZSBsZWdhY3kgaGFyZHdhcmUgYW5kIHNvZnR3YXJlIHN1
cHBvcnQgd2l0aGluIHRoZQo+IGd1ZXN0IGlzIG5vdCBuZWVkZWQsIFFlbXUgc2hvdWxkIGJlIGFi
bGUgdG8gYm9vdCBkaXJlY3RseSBpbnRvIHRoZQo+IHVuY29tcHJlc3NlZCBMaW51eCBrZXJuZWwg
YmluYXJ5IHdpdGhvdXQgdGhlIG5lZWQgdG8gcnVuIGZpcm13YXJlLgo+Cj4gVGhlcmUgYWxyZWFk
eSBleGlzdHMgYW4gQUJJIHRvIGFsbG93IHRoaXMgZm9yIFhlbiBQVkggZ3Vlc3RzIGFuZCB0aGUg
QUJJCj4gaXMgc3VwcG9ydGVkIGJ5IExpbnV4IGFuZCBGcmVlQlNEOgo+Cj4gICAgaHR0cHM6Ly94
ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9taXNjL3B2aC5odG1sCj4KPiBUaGlzIHBhdGNo
IHNlcmllcyB3b3VsZCBlbmFibGUgUWVtdSB0byB1c2UgdGhhdCBzYW1lIGVudHJ5IHBvaW50IGZv
cgo+IGJvb3RpbmcgS1ZNIGd1ZXN0cy4KPgoKCkFwcGxpZWQgdG8gZm9yLWxpbnVzLTQuMjEKCgot
Ym9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
