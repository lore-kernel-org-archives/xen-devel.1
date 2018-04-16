From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: Remove use of VLAs
Date: Mon, 16 Apr 2018 09:27:24 -0400
Message-ID: <7cf66c00-74c2-62bb-81f5-4332313a5a6e__9864.52615256912$1523885083$gmane$org@oracle.com>
References: <20180413221146.28476-1-labbott@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1yjk=hf=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f848v-0002t1-51
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 13:26:01 +0000
In-Reply-To: <20180413221146.28476-1-labbott@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laura Abbott <labbott@redhat.com>, Juergen Gross <jgross@suse.com>
Cc: kernel-hardening@lists.openwall.com, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTMvMjAxOCAwNjoxMSBQTSwgTGF1cmEgQWJib3R0IHdyb3RlOgo+IFRoZXJlJ3MgYW4g
b25nb2luZyBlZmZvcnQgdG8gcmVtb3ZlIFZMQXNbMV0gZnJvbSB0aGUga2VybmVsIHRvIGV2ZW50
dWFsbHkKPiB0dXJuIG9uIC1XdmxhLiBUaGUgZmV3IFZMQXMgaW4gdXNlIGhhdmUgYW4gdXBwZXIg
Ym91bmQgYmFzZWQgb24gYSBzaXplCj4gb2YgNjRLLiBUaGlzIGRvZXNuJ3QgcHJvZHVjZSBhbiBl
eGNlc3NpdmVseSBsYXJnZSBzdGFjayBzbyBqdXN0IHN3aXRjaAo+IHRoZSB1cHBlciBib3VuZC4K
Pgo+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC8zLzcvNjIxCj4KPiBTaWduZWQtb2Zm
LWJ5OiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgYXJjaC94ODYv
eGVuL2VubGlnaHRlbl9wdi5jIHwgNiArKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPiBpbmRleCBjMzZkMjNh
YTZjMzUuLmQ5NmE1YTUzNWNiYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2LmMKPiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPiBAQCAtNDIxLDggKzQy
MSw3IEBAIHN0YXRpYyB2b2lkIHhlbl9sb2FkX2dkdChjb25zdCBzdHJ1Y3QgZGVzY19wdHIgKmR0
cikKPiAgewo+ICAJdW5zaWduZWQgbG9uZyB2YSA9IGR0ci0+YWRkcmVzczsKPiAgCXVuc2lnbmVk
IGludCBzaXplID0gZHRyLT5zaXplICsgMTsKPiAtCXVuc2lnbmVkIHBhZ2VzID0gRElWX1JPVU5E
X1VQKHNpemUsIFBBR0VfU0laRSk7CgoKCklzbid0IGR0ci0+c2l6ZSBhbHdheXMgZWl0aGVyIEdE
VF9TSVpFIG9yIDA/CgotYm9yaXMKCgoKCj4gLQl1bnNpZ25lZCBsb25nIGZyYW1lc1twYWdlc107
Cj4gKwl1bnNpZ25lZCBsb25nIGZyYW1lc1tESVZfUk9VTkRfVVAoU1pfNjRLLCBQQUdFX1NJWkUp
XTsKPiAgCWludCBmOwo+ICAKPiAgCS8qCj4gQEAgLTQ3MCw4ICs0NjksNyBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgeGVuX2xvYWRfZ2R0X2Jvb3QoY29uc3Qgc3RydWN0IGRlc2NfcHRyICpkdHIpCj4g
IHsKPiAgCXVuc2lnbmVkIGxvbmcgdmEgPSBkdHItPmFkZHJlc3M7Cj4gIAl1bnNpZ25lZCBpbnQg
c2l6ZSA9IGR0ci0+c2l6ZSArIDE7Cj4gLQl1bnNpZ25lZCBwYWdlcyA9IERJVl9ST1VORF9VUChz
aXplLCBQQUdFX1NJWkUpOwo+IC0JdW5zaWduZWQgbG9uZyBmcmFtZXNbcGFnZXNdOwo+ICsJdW5z
aWduZWQgbG9uZyBmcmFtZXNbRElWX1JPVU5EX1VQKFNaXzY0SywgUEFHRV9TSVpFKV07Cj4gIAlp
bnQgZjsKPiAgCj4gIAkvKgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
