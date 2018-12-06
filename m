From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Thu, 6 Dec 2018 16:58:44 -0500
Message-ID: <147cc043-b0af-74e9-5259-8c7854f82d8b__45691.9787139215$1544133517$gmane$org@oracle.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
 <20181206213752.GL3986@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PAb1=OP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gV1gF-0004P0-GN
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 21:59:35 +0000
In-Reply-To: <20181206213752.GL3986@zn.tnic>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Borislav Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, Maran Wilson <maran.wilson@oracle.com>, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNi8xOCA0OjM3IFBNLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6Cj4gT24gVGh1LCBEZWMg
MDYsIDIwMTggYXQgMTA6MjE6MTJQTSArMDEwMCwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4gVGhh
bmtzISAgSSBzaG91bGQgYmUgYWJsZSB0byBwb3N0IGEgVGVzdGVkLWJ5IG5leHQgTW9uZGF5LiAg
Qm9yaXMsIGFyZQo+PiB5b3UgZ29pbmcgdG8gcGljayBpdCB1cCBmb3IgNC4yMT8KPiBCb3JpcyBt
ZSBvciBCb3JpcyBPLj8KPgo+IDotKQo+CgpPLiA7LSkKClRoZXJlIGFyZSBzb21lIG1pbm9yIGNo
YW5nZXMgaW4gbm9uLXhlbiB4ODYgY29kZSBzbyBpdCB3b3VsZCBiZSBnb29kIHRvCmdldCB4ODYg
bWFpbnRhaW5lcnMnIGFjay4KCkFuZCBhcyBmYXIgYXMgcWVtdS9xYm9vdCBjaGFuZ2VzLCBzaG91
bGQgd2UgYXNzdW1lIHRoYXQgdGhlIGdlbmVyYWwKYXBwcm9hY2ggaXMgYWNjZXB0YWJsZT8gSSB1
bmRlcnN0YW5kIHRoYXQgdGhlIHBhdGNoZXMgd2lsbCBwcm9iYWJseSBuZWVkCnRvIGdvIHRocm91
Z2ggc29tZSBpdGVyYXRpb25zIGJ1dCBJIHdhbnQgdG8gbWFrZSBzdXJlIHdlIGhhdmUgYSBwYXRo
CmZvcndhcmQgdGhlcmUuCgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
