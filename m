From: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [PATCH v7 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Wed, 2 May 2018 14:37:52 -0700
Message-ID: <485951af-ebf4-33f9-d32c-a5e331f43884__13790.7250122682$1525297064$gmane$org@oracle.com>
References: <1523920175-27287-1-git-send-email-maran.wilson@oracle.com>
 <CACRpkdZNm54ukoggpta4o5XfALryHSO4Ptx0EhzNDG5HLLSSRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x2tc=hv=oracle.com=maran.wilson@srs-us1.protection.inumbo.net>)
 id 1fDzSW-0003m0-OG
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 21:38:44 +0000
In-Reply-To: <CACRpkdZNm54ukoggpta4o5XfALryHSO4Ptx0EhzNDG5HLLSSRw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, jgross@suse.com, Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, pbonzini@redhat.com, "David S. Miller" <davem@davemloft.net>, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gNC8xOC8yMDE4IDE6MTEgQU0sIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gSSB3b25kZXIgd2h5
IEkgYW0gc3RhcnRpbmcgdG8gZ2V0IENDZWQgb24gWGVuIHBhdGNoZXMgYWxsIG9mIGEgc3VkZGVu
Lgo+Cj4gSSBoYXBwZW5lZCB0byBydW4gaW50byBKw7xyZ2VuIGF0IGEgY29uZmVyZW5jZSBvbmx5
IGxhc3Qgd2Vla2VuZCwgYnV0Cj4gSSBzdGlsbCBkb24ndCBrbm93IGFueXRoaW5nIHdoYXRzb2V2
ZXIgYWJvdXQgWGVuIG9yIGhvdyBpdCB3b3Jrcy4KPgo+IElmIGdldF9tYWludGFpbmVyLnBsIGhh
cyBzdGFydGVkIHRvIHJldHVybiBteSBuYW1lIG9uIHRoaXMgc3R1ZmYgSQo+IHJlYWxseSB3YW50
IHRvIGtub3cgd2h5IDovCgpJdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIFhlbiBhY3R1YWxseS4g
QnV0IGZvciBzb21lIHJlYXNvbiwgdGhlIApnZXRfbWFpbnRhaW5lci5wbCBzY3JpcHQgaXMgcmV0
dXJuaW5nIHlvdXIgbmFtZSBmb3IgYW55IHBhdGNoIHRoYXQgCm1vZGlmaWVzIHRoZSBNQUlOVEFJ
TkVSUyBmaWxlLiBBbHRob3VnaCB3aHkgdGhhdCBpcyB0aGUgY2FzZSB3YXNuJ3QgCmNsZWFyIHRv
IG1lIGJhc2VkIG9uIGEgcXVpY2sgbG9vayBhdCBib3RoIHRob3NlIGZpbGVzLgoKLU1hcmFuCgo+
IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
