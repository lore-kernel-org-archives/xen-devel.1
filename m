From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [RFC PATCH v4 6/7] xen/pvh: Add memory map pointer
 to hvm_start_info struct
Date: Thu, 01 Mar 2018 00:41:59 -0700
Message-ID: <5A97AEC70200007800128C14__46798.6583979384$1519890056$gmane$org@prv-mh.provo.novell.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-7-git-send-email-maran.wilson@oracle.com>
 <81b64427-4d4e-8758-436a-f2b98e3e6829@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ib05=fx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1erIqw-00063q-4b
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 07:42:10 +0000
In-Reply-To: <81b64427-4d4e-8758-436a-f2b98e3e6829@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: maran.wilson@oracle.com, Juergen Gross <jgross@suse.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, hpa@zytor.com, tglx@linutronix.de, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, andrew.cooper3@citrix.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+PiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IDAzLzAxLzE4IDg6MjkgQU0gPj4+
Cj5PbiAyOC8wMi8xOCAxOToyOCwgTWFyYW4gV2lsc29uIHdyb3RlOgo+PiBUaGUgc3RhcnQgaW5m
byBzdHJ1Y3R1cmUgdGhhdCBpcyBkZWZpbmVkIGFzIHBhcnQgb2YgdGhlIHg4Ni9IVk0gZGlyZWN0
IGJvb3QKPj4gQUJJIGFuZCB1c2VkIGZvciBzdGFydGluZyBYZW4gUFZIIGd1ZXN0cyB3b3VsZCBi
ZSBtb3JlIHZlcnNhdGlsZSBpZiBpdCBhbHNvCj4+IGluY2x1ZGVkIGEgd2F5IHRvIHBhc3MgaW5m
b3JtYXRpb24gYWJvdXQgdGhlIG1lbW9yeSBtYXAgdG8gdGhlIGd1ZXN0LiBUaGlzCj4+IHdvdWxk
IGFsbG93IEtWTSBndWVzdHMgdG8gc2hhcmUgdGhlIHNhbWUgZW50cnkgcG9pbnQuCj4+IAo+PiBT
aWduZWQtb2ZmLWJ5OiBNYXJhbiBXaWxzb24gPG1hcmFuLndpbHNvbkBvcmFjbGUuY29tPgo+Cj5J
J20gZmluZSB3aXRoIHRoaXMsIGJ1dCB3ZSBuZWVkIHRoaXMgY2hhbmdlIGJlaW5nIGFjY2VwdGVk
IGJ5IHRoZSBYZW4KPmNvbW11bml0eSBmaXJzdC4gU28gYW4gQWNrIGZyb20gSmFuIG9yIEFuZHJl
dyBpcyByZXF1aXJlZCBhcyB0aGUgc2FtZQo+Y2hhbmdlIHNob3VsZCBiZSBkb25lIG9uIFhlbiBz
aWRlLgoKQW5kIGZvciBhbiBhY2sgdG8gYmUgZ2l2ZW4gSSBjb250aW51ZSB0byBkZW1hbmQgdGhh
dCBhIHBhdGNoIGJlIHNlbnQgYWdhaW5zdAp0aGUgWGVuIHRyZWUuIFRoYXQgc2FpZCwgdGhlIGNo
YW5nZSBsb29rcyBmaW5lIHRvIG1lIG5vdyAoYXMgaW5kaWNhdGVkIGJlZm9yZSkuCgpKYW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
