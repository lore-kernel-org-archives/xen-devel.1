From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen/time: fix section mismatch for
 xen_init_time_ops()
Date: Tue, 2 Jan 2018 09:18:33 -0500
Message-ID: <52b547c5-509a-3a82-12cd-4d9d0a06b53f__26433.981039054$1514902478$gmane$org@oracle.com>
References: <1514083813-27047-1-git-send-email-nick.desaulniers@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=swgl=d5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eWNLl-0006QE-Kp
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 14:15:29 +0000
In-Reply-To: <1514083813-27047-1-git-send-email-nick.desaulniers@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjMvMjAxNyAwOTo1MCBQTSwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPiBUaGUgaGVh
ZGVyIGRlY2xhcmVzIHRoaXMgZnVuY3Rpb24gYXMgX19pbml0IGJ1dCBpcyBkZWZpbmVkIGluIF9f
cmVmCj4gc2VjdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5pY2su
ZGVzYXVsbmllcnNAZ21haWwuY29tPgoKQUZBSUsgc2VjdGlvbiBhdHRyaWJ1dGVzIGluIGhlYWRl
ciBmaWxlcyBhcmUgaWdub3JlZCBieSBjb21waWxlciBhbnl3YXkKc28gSSdkIHJlbW92ZSBhbGwg
b2YgdGhlbS4KCi1ib3JpcwoKCj4gLS0tCj4gIGFyY2gveDg2L3hlbi94ZW4tb3BzLmggfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94ZW4tb3BzLmggYi9hcmNoL3g4Ni94ZW4veGVuLW9wcy5o
Cj4gaW5kZXggNzUwMTFiOC4uM2IzNDc0NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4veGVu
LW9wcy5oCj4gKysrIGIvYXJjaC94ODYveGVuL3hlbi1vcHMuaAo+IEBAIC03Miw3ICs3Miw3IEBA
IHU2NCB4ZW5fY2xvY2tzb3VyY2VfcmVhZCh2b2lkKTsKPiAgdm9pZCB4ZW5fc2V0dXBfY3B1X2Ns
b2NrZXZlbnRzKHZvaWQpOwo+ICB2b2lkIHhlbl9zYXZlX3RpbWVfbWVtb3J5X2FyZWEodm9pZCk7
Cj4gIHZvaWQgeGVuX3Jlc3RvcmVfdGltZV9tZW1vcnlfYXJlYSh2b2lkKTsKPiAtdm9pZCBfX2lu
aXQgeGVuX2luaXRfdGltZV9vcHModm9pZCk7Cj4gK3ZvaWQgX19yZWYgeGVuX2luaXRfdGltZV9v
cHModm9pZCk7Cj4gIHZvaWQgX19pbml0IHhlbl9odm1faW5pdF90aW1lX29wcyh2b2lkKTsKPiAg
Cj4gIGlycXJldHVybl90IHhlbl9kZWJ1Z19pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqZGV2X2lk
KTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
