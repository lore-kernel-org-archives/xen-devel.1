From: Julien Grall <julien.grall@arm.com>
Subject: Re: arm: xl vcpu-pin leads to oom-killer slashing
 processes
Date: Wed, 5 Dec 2018 11:45:59 +0000
Message-ID: <6bc804b4-df7a-08fd-9bf0-7384015a2b74@arm.com>
References: <2c2385f9-515d-1c13-2618-d22d52901abc@gmail.com>
 <cfad156f-19ef-5e87-7af0-3dbbf361dc8a@arm.com>
 <9f2f6edf-c96d-fda9-851b-a2bae8fb25ec@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=agku=oo=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gUVcx-0005Fn-5Y
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 11:46:03 +0000
In-Reply-To: <9f2f6edf-c96d-fda9-851b-a2bae8fb25ec@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8xMi8yMDE4IDEwOjU5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpLAoKPiBPbiAwNS4xMi4xOCAxMjo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBJIGFt
IG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQgd2hhdCBpcyB0aGUgcmVsYXRpb24gYmV0d2VlbiB0aGUg
dHdvLgo+IE1lIGNvbmZ1c2VkIGFzIHdlbGwuIEkganVzdCBub3RpZmllZCBhYm91dCBteSBvYnNl
cnZhdGlvbnMuCj4gCj4+IFdoYXQgaXMgdGhlIGxhdGVzdCBYZW4gY29tbWl0IHdoZXJlIHRoZSBv
b20ta2lsbGVyIGRvZXMgbm90IHRyaWdnZXI/Cj4gSSBkaWRuJ3QgYmlzZWN0IGl0IG5vciBkaWdn
ZWQgaW50byBpdC4gSSdtIHRyeWluZyB0byBtZWFzdXJlIElSUSBsYXRlbmN5IGFzIAo+IFN0ZWZh
bm8gZGlkLgo+IAo+PiBIb3cgbXVjaCBtZW1vcnkgZG8geW91IGhhdmUgaW4gRG9tMD8gRG8geW91
IGhhdmUgYW55IG1lbW9yeSBodW5ncnkgcHJvY2VzcyAKPj4gcnVubmluZz8KPiBEb20wIGhhcyAz
R2IgUkFNLiBCdXQgaXQncyBub3QgYWJvdXQgdGhlIG1lbW9yeSwgSSdtIHByZXR0eSBzdXJlLlVu
dGlsIEkgCj4gZGVjaWRlZCB0byBwaW4gdmNwdXMsIEkgZGlkIGFsbCBteSByb3V0aW5lIHdpdGhv
dXQgYW55IGlzc3Vlcy4KCldlbGwsIGF0IGxlYXN0IHRoZSBrZXJuZWwgdGhpbmtzIGl0IGRvZXMg
bm90IGhhdmUgYW55bW9yZSBtZW1vcnkgKHNlZSB0aGUgY2FsbCAKdHJhY2UpLgoKV2hhdCBkbyB5
b3UgbWVhbiBieSBhbGwgeW91ciByb3V0aW5lPyBIb3cgbXVjaCB3b3JrIGRpZCB5b3UgZG8gb24g
dGhlIHBsYXRmb3JtIApiZWZvcmUgdHJpZ2dlcmluZyBvZW0ta2lsbGVyPwoKTG9va2luZyBhdCB5
b3VyIGxvZywgeW91IGRvbid0IHNlZW0gdG8gaGF2ZSBzd2FwLiBXaXRoIGFsbCB5b3VyIHJvdXRp
bmUsIGhvdyAKb2Z0ZW4gYXJlIHlvdSBjbG9zZSB0byB0aGUgbWF4aW11bSBtZW1vcnk/CgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
