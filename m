From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/2] xen/pv: Call get_cpu_address_sizes to
 set x86_virt/phys_bits
Date: Sat, 21 Jul 2018 17:25:54 -0400
Message-ID: <90bc371d-a296-51b3-8b78-62106c9690de__17191.4571350955$1532208274$gmane$org@oracle.com>
References: <20180721194909.23903-1-m.v.b@runbox.com>
 <20180721194909.23903-2-m.v.b@runbox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xnes=kf=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fgzNo-0004Nf-8i
 for xen-devel@lists.xenproject.org; Sat, 21 Jul 2018 21:25:44 +0000
In-Reply-To: <20180721194909.23903-2-m.v.b@runbox.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, stable@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjEvMjAxOCAwMzo0OSBQTSwgTS4gVmVmYSBCaWNha2NpIHdyb3RlOgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2LmMKPiBpbmRleCA0MzlhOTRiZjg5YWQuLjg3YWZiMDAwMTQyYSAxMDA2NDQKPiAtLS0gYS9h
cmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2LmMKPiBAQCAtMTI1Nyw2ICsxMjU3LDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBf
X2luaXQgeGVuX3N0YXJ0X2tlcm5lbCh2b2lkKQo+ICAKPiAgCS8qIFdvcmsgb3V0IGlmIHdlIHN1
cHBvcnQgTlggKi8KPiAgCWdldF9jcHVfY2FwKCZib290X2NwdV9kYXRhKTsKPiArCWdldF9jcHVf
YWRkcmVzc19zaXplcygmYm9vdF9jcHVfZGF0YSk7Cj4gIAl4ODZfY29uZmlndXJlX254KCk7CgoK
SGF2ZSB5b3Ugb2JzZXJ2ZWQgYW55IHByb2JsZW1zIHdpdGhvdXQgdGhpcyBjYWxsPyBnZXRfY3B1
X2NhcCgpIGlzIG9ubHkKY2FsbGVkIGhlcmUgdG8gc2V0IFg4Nl9GRUFUVVJFX05YLCBhbmQgaXMg
dGhlbiBjYWxsZWQgYWdhaW4sIHRvZ2V0aGVyCndpdGggZ2V0X2NwdV9hZGRyZXNzX3NpemVzKCks
IGZyb20gZWFybHlfaWRlbnRpZnlfY3B1KCkuCgotYm9yaXMKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
