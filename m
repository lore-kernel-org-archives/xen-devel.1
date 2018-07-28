From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 16/17] driver/edac: enable Hygon support
 to AMD64 EDAC driver
Date: Sun, 29 Jul 2018 01:42:17 +0200
Message-ID: <b24739e8-0833-8509-0850-815758accaee__20928.3214099289$1532821291$gmane$org@redhat.com>
References: <1532352037-7151-1-git-send-email-puwen@hygon.cn>
 <1532352037-7151-17-git-send-email-puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rakf=km=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1fjYqx-0007NA-7W
 for xen-devel@lists.xenproject.org; Sat, 28 Jul 2018 23:42:27 +0000
In-Reply-To: <1532352037-7151-17-git-send-email-puwen@hygon.cn>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>, tglx@linutronix.de, bp@alien8.de, thomas.lendacky@amd.com, mingo@redhat.com, hpa@zytor.com, peterz@infradead.org, tony.luck@intel.com, rkrcmar@redhat.com, boris.ostrovsky@oracle.com, jgross@suse.com, rjw@rjwysocki.net, lenb@kernel.org, viresh.kumar@linaro.org, mchehab@kernel.org, trenn@suse.com, shuah@kernel.org, JBeulich@suse.com, x86@kernel.org
Cc: linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDcvMjAxOCAxNToyMCwgUHUgV2VuIHdyb3RlOgo+IEBAIC0yMTEsNyArMjExLDcgQEAg
c3RhdGljIGludCBfX3NldF9zY3J1Yl9yYXRlKHN0cnVjdCBhbWQ2NF9wdnQgKnB2dCwgdTMyIG5l
d19idywgdTMyIG1pbl9yYXRlKQo+ICAKPiAgCXNjcnVidmFsID0gc2NydWJyYXRlc1tpXS5zY3J1
YnZhbDsKPiAgCj4gLQlpZiAocHZ0LT5mYW0gPT0gMHgxNykgewo+ICsJaWYgKHB2dC0+ZmFtID09
IDB4MTcgfHwgcHZ0LT5mYW0gPT0gMHgxOCkgewo+ICAJCV9fZjE3aF9zZXRfc2NydWJ2YWwocHZ0
LCBzY3J1YnZhbCk7Cj4gIAl9IGVsc2UgaWYgKHB2dC0+ZmFtID09IDB4MTUgJiYgcHZ0LT5tb2Rl
bCA9PSAweDYwKSB7Cj4gIAkJZjE1aF9zZWxlY3RfZGN0KHB2dCwgMCk7CgpUaGlzLCBhbmQgbWFu
eSBvdGhlciBvY2N1cnJlbmNlcyBpbiB0aGlzIGZpbGUsIHNob3VsZCBpbiBteSBvcGluaW9uCmF2
b2lkIHRlc3RpbmcgZmFtaWx5IDE4aCB3aXRob3V0IGFsc28gY2hlY2tpbmcgZm9yIEh5Z29uIGFz
IGEgdmVuZG9yLgpZb3UgcHJvYmFibHkgbmVlZCB0byBhZGQgYSB2ZW5kb3IgZmllbGQgdG8gc3Ry
dWN0IGFtZDY0X3B2dCBhbmQKaW5pdGlhbGl6ZSBpdCBpbiBwZXJfZmFtaWx5X2luaXQuCgpQYW9s
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
