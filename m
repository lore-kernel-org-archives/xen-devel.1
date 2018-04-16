From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] x86/xen: Remove use of VLAs
Date: Mon, 16 Apr 2018 11:40:07 +0200
Message-ID: <20180416094007.diuobump2qxraybx__35576.0962972001$1523871572$gmane$org@gmail.com>
References: <20180413221146.28476-1-labbott@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mw8f=hf=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1f80cP-0000Pd-Ek
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 09:40:13 +0000
Received: by mail-wr0-x241.google.com with SMTP id s18so24038072wrg.9
 for <xen-devel@lists.xenproject.org>; Mon, 16 Apr 2018 02:40:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180413221146.28476-1-labbott@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, kernel-hardening@lists.openwall.com, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

CiogTGF1cmEgQWJib3R0IDxsYWJib3R0QHJlZGhhdC5jb20+IHdyb3RlOgoKPiBUaGVyZSdzIGFu
IG9uZ29pbmcgZWZmb3J0IHRvIHJlbW92ZSBWTEFzWzFdIGZyb20gdGhlIGtlcm5lbCB0byBldmVu
dHVhbGx5Cj4gdHVybiBvbiAtV3ZsYS4gVGhlIGZldyBWTEFzIGluIHVzZSBoYXZlIGFuIHVwcGVy
IGJvdW5kIGJhc2VkIG9uIGEgc2l6ZQo+IG9mIDY0Sy4gVGhpcyBkb2Vzbid0IHByb2R1Y2UgYW4g
ZXhjZXNzaXZlbHkgbGFyZ2Ugc3RhY2sgc28ganVzdCBzd2l0Y2gKPiB0aGUgdXBwZXIgYm91bmQu
Cj4gCj4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzMvNy82MjEKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgYXJjaC94
ODYveGVuL2VubGlnaHRlbl9wdi5jIHwgNiArKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4gaW5kZXggYzM2
ZDIzYWE2YzM1Li5kOTZhNWE1MzVjYmIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYveGVuL2VubGln
aHRlbl9wdi5jCj4gKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4gQEAgLTQyMSw4
ICs0MjEsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fbG9hZF9nZHQoY29uc3Qgc3RydWN0IGRlc2NfcHRy
ICpkdHIpCj4gIHsKPiAgCXVuc2lnbmVkIGxvbmcgdmEgPSBkdHItPmFkZHJlc3M7Cj4gIAl1bnNp
Z25lZCBpbnQgc2l6ZSA9IGR0ci0+c2l6ZSArIDE7Cj4gLQl1bnNpZ25lZCBwYWdlcyA9IERJVl9S
T1VORF9VUChzaXplLCBQQUdFX1NJWkUpOwo+IC0JdW5zaWduZWQgbG9uZyBmcmFtZXNbcGFnZXNd
Owo+ICsJdW5zaWduZWQgbG9uZyBmcmFtZXNbRElWX1JPVU5EX1VQKFNaXzY0SywgUEFHRV9TSVpF
KV07Cj4gIAlpbnQgZjsKPiAgCj4gIAkvKgo+IEBAIC00NzAsOCArNDY5LDcgQEAgc3RhdGljIHZv
aWQgX19pbml0IHhlbl9sb2FkX2dkdF9ib290KGNvbnN0IHN0cnVjdCBkZXNjX3B0ciAqZHRyKQo+
ICB7Cj4gIAl1bnNpZ25lZCBsb25nIHZhID0gZHRyLT5hZGRyZXNzOwo+ICAJdW5zaWduZWQgaW50
IHNpemUgPSBkdHItPnNpemUgKyAxOwo+IC0JdW5zaWduZWQgcGFnZXMgPSBESVZfUk9VTkRfVVAo
c2l6ZSwgUEFHRV9TSVpFKTsKPiAtCXVuc2lnbmVkIGxvbmcgZnJhbWVzW3BhZ2VzXTsKPiArCXVu
c2lnbmVkIGxvbmcgZnJhbWVzW0RJVl9ST1VORF9VUChTWl82NEssIFBBR0VfU0laRSldOwo+ICAJ
aW50IGY7CgpSZXZpZXdlZC1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+CgpUaGFu
a3MsCgoJSW5nbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
