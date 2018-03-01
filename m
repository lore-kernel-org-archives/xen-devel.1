From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v4 2/7] xen/pvh: Move PVH entry code out
 of Xen specific tree
Date: Thu, 1 Mar 2018 09:46:23 +0100
Message-ID: <98eda294-8491-35a2-b278-aeedc079640f__45351.5801149935$1519893931$gmane$org@redhat.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-3-git-send-email-maran.wilson@oracle.com>
 <20180228210814.GK11576@char.us.oracle.com>
 <e9133f97-7ecf-2868-6883-3f0cda7bbb2f@redhat.com>
 <20f82d4c-9591-7770-aeca-0331a7940f5d@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tgaz=fx=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1erJrD-0002Qj-U6
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 08:46:31 +0000
In-Reply-To: <20f82d4c-9591-7770-aeca-0331a7940f5d@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, JBeulich@suse.com, hpa@zytor.com, tglx@linutronix.de, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, andrew.cooper3@citrix.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDMvMjAxOCAwNzoxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gUHJvYmFibHkgYSBi
ZXR0ZXIgcGxhY2UgZm9yIHRoZXNlIHdvdWxkIGJlCj4+IGFyY2gveDg2L3BsYXRmb3JtL3B2aC97
ZW5saWdodGVuLmMsaGVhZC5TfS4gIChKdXN0IGJlY2F1c2UgdGhlcmUgYXJlIG5vCj4+IC5jIG9y
IC5TIGZpbGVzIGluIGFyY2gveDg2KS4KPiBSaWdodC4KPiAKPj4gTWF5YmUgWGVuIG91Z2h0IHRv
IGJlIG1vdmVkIHVuZGVyCj4+IGFyY2gveDg2L3BsYXRmb3JtIHRvby4KPiBBbmQgaHlwZXJ2IGFu
ZCBrdm0sIHRvbz8KCkFjdHVhbGx5IHllcywgdGhvdWdoIGZvciBrdm0gSSdkIG1vdmUgdGhlIGZp
bGVzIGluIGFyY2gveDg2L2tlcm5lbAooYXJjaC94ODYva3ZtIGlzIHRoZSBoeXBlcnZpc29yIGl0
c2VsZiwgbm90IHRoZSAicGxhdGZvcm0iKS4KCj4gTm8sIEkgdGhpbmsgYXJjaC94ODYveGVuLyBp
cyBmaW5lLgoKbnAsIGl0IHdhcyBqdXN0IGEgKHNvbWV3aGF0IGNyYXp5KSBzdWdnZXN0aW9uLiA6
KQoKUGFvbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
