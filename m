From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Thu, 6 Dec 2018 23:14:34 +0100
Message-ID: <63756df6-6f0b-fdfa-932e-b53d173da5be__21836.9068731137$1544134408$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
 <20181206213752.GL3986@zn.tnic>
 <147cc043-b0af-74e9-5259-8c7854f82d8b@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NSIP=OP=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gV1ux-0006Wv-6R
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 22:14:47 +0000
In-Reply-To: <147cc043-b0af-74e9-5259-8c7854f82d8b@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, Maran Wilson <maran.wilson@oracle.com>, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMTggMjI6NTgsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAxMi82LzE4IDQ6
MzcgUE0sIEJvcmlzbGF2IFBldGtvdiB3cm90ZToKPj4gT24gVGh1LCBEZWMgMDYsIDIwMTggYXQg
MTA6MjE6MTJQTSArMDEwMCwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4+IFRoYW5rcyEgIEkgc2hv
dWxkIGJlIGFibGUgdG8gcG9zdCBhIFRlc3RlZC1ieSBuZXh0IE1vbmRheS4gIEJvcmlzLCBhcmUK
Pj4+IHlvdSBnb2luZyB0byBwaWNrIGl0IHVwIGZvciA0LjIxPwo+PiBCb3JpcyBtZSBvciBCb3Jp
cyBPLj8KPj4KPj4gOi0pCj4+Cj4gCj4gTy4gOy0pCj4gCj4gVGhlcmUgYXJlIHNvbWUgbWlub3Ig
Y2hhbmdlcyBpbiBub24teGVuIHg4NiBjb2RlIHNvIGl0IHdvdWxkIGJlIGdvb2QgdG8KPiBnZXQg
eDg2IG1haW50YWluZXJzJyBhY2suCgpJdCdzIG5vdCByZWFsbHkgY29kZSwgb25seSBLY29uZmln
IChhbmQgSSByZW1hcmtlZCBvbiBpdCBqdXN0IG5vdyksIGJ1dAppdCBkb2Vzbid0IGh1cnQgb2Yg
Y291cnNlLgoKPiBBbmQgYXMgZmFyIGFzIHFlbXUvcWJvb3QgY2hhbmdlcywgc2hvdWxkIHdlIGFz
c3VtZSB0aGF0IHRoZSBnZW5lcmFsCj4gYXBwcm9hY2ggaXMgYWNjZXB0YWJsZT8gSSB1bmRlcnN0
YW5kIHRoYXQgdGhlIHBhdGNoZXMgd2lsbCBwcm9iYWJseSBuZWVkCj4gdG8gZ28gdGhyb3VnaCBz
b21lIGl0ZXJhdGlvbnMgYnV0IEkgd2FudCB0byBtYWtlIHN1cmUgd2UgaGF2ZSBhIHBhdGgKPiBm
b3J3YXJkIHRoZXJlLgoKWWVzLCB0aGUgZ2VuZXJhbCBhcHByb2FjaCBpcyBmaW5lLiAgSSBoYXZl
IGFscmVhZHkgcmV2aWV3ZWQgdGhlIHFib290CnBhcnRzLCBJIGd1ZXNzIHdlIHdpbGwgYWxzbyB3
YW50IGFuIG9wdGlvbiBST00gc2ltaWxhciB0bwpsaW51eGJvb3QvbXVsdGlib290IGZvciBTZWFC
SU9TIHN1cHBvcnQgYnV0IHRoYXQncyBzaW1wbGUgbWF0dGVyIG9mCnByb2dyYW1taW5nLiA6KQoK
UGFvbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
