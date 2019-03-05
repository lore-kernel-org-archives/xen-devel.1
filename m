From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [BUG linux-4.9.x] xen hotplug cpu leads to 100%
 steal usage
Date: Tue, 5 Mar 2019 10:19:42 +0800
Message-ID: <22c1eb51-1e09-3eb4-f88a-d404b4ffcdb4__46657.6957072661$1551752224$gmane$org@oracle.com>
References: <841bb9a9-1cba-483f-a353-1209684f7c74@default>
 <alpine.DEB.2.21.1903020030320.1638@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AQrg=RI=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1h0zcq-00038B-BD
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 02:16:12 +0000
In-Reply-To: <alpine.DEB.2.21.1903020030320.1638@nanos.tec.linutronix.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: jgross@suse.com, Herbert Van Den Bergh <herbert.van.den.bergh@oracle.com>, sstabellini@kernel.org, sboyd@kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, john.stultz@linaro.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

SGkgVGhvbWFzLAoKT24gMy8yLzE5IDc6NDMgQU0sIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBP
biBUaHUsIDI4IEZlYiAyMDE5LCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4+Cj4+IFRoZSByb290IGNh
dXNlIGlzIHRoYXQgdGhlIHJldHVybiB0eXBlIG9mIGppZmZpZXNfdG9fdXNlY3MoKSBpcyAndW5z
aWduZWQgaW50JywKPj4gYnV0IG5vdCAndW5zaWduZWQgbG9uZycuIEFzIGEgcmVzdWx0LCB0aGUg
bGVhZGluZyAzMiBiaXRzIGFyZSBkaXNjYXJkZWQuCj4gCj4gRXJybS4gTm8uIFRoZSByb290IGNh
dXNlIGlzIHRoYXQgamlmZmllc190b191c2VjcygpIGlzIHVzZWQgZm9yIHRoYXQgaW4gdGhlCj4g
Zmlyc3QgcGxhY2UuIFRoZSBmdW5jdGlvbiBoYXMgYmVlbiB0aGF0IHdheSBmb3JldmVyIGFuZCBh
bGwgdXNhZ2Ugc2l0ZXMKPiAoZXhjZXB0IGEgYnJva2VuIGRldl9kZWJ1ZyBwcmludCBpbiBpbmZp
bmliYW5kKSBmZWVkIGRlbHRhIHZhbHVlcy4gWWVzLCBpdAo+IGNvdWxkIGhhdmUgZG9jdW1lbnRh
dGlvbi4uLi4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSBleHBsYW5hdGlvbi4gSXQgd291
bGQgaGVscCB0aGUgZGV2ZWxvcGVycyBjbGFyaWZ5CnRoZSB1c2FnZSBvZiBqaWZmaWVzX3RvX3Vz
ZWNzKCkgKHdoaWNoIHdlIHNob3VsZCBhbHdheXMgZmVlZCB3aXRoIGRlYWx0IHZhbHVlKQp3aXRo
IGNvbW1lbnRzIGFib3ZlIGl0LgoKSW5kZWVkLCB0aGUgaW5wdXQgdmFsdWUgaW4gdGhpcyBidWcg
aXMgYWxzbyBhIGRlbHRhIHZhbHVlLiBCZWNhdXNlIG9mIHRoZQpzcGVjaWFsIG1lY2hhbmlzbXMg
dXNlZCBieSB4ZW4gdG8gYWNjb3VudCBzdGVhbCBjbG9jaywgdGhlIGluaXRpYWwgZGVsdGEgdmFs
dWUKaXMgYWx3YXlzIHZlcnkgbGFyZ2UsIG9ubHkgd2hlbiB0aGUgbmV3IGNwdSBpcyBhZGRlZCBh
ZnRlciB0aGUgVk0gaXMgYWxyZWFkeSB1cApmb3IgdmVyeSBsb25nIHRpbWUuCgpEb25nbGkgWmhh
bmcKCgo+IAo+PiBqaWZmaWVzX3RvX3VzZWNzKCkgaXMgaW5kaXJlY3RseSB0cmlnZ2VyZWQgYnkg
Y3B1dGltZV90b19uc2VjcygpIGF0IGxpbmUgMjY0Lgo+PiBJZiBndWVzdCBpcyBhbHJlYWR5IHVw
IGZvciBsb25nIHRpbWUsIHRoZSBpbml0aWFsIHN0ZWFsIHRpbWUgZm9yIG5ldyB2Y3B1IG1pZ2h0
Cj4+IGJlIGxhcmdlIGFuZCB0aGUgbGVhZGluZyAzMiBiaXRzIG9mIGppZmZpZXNfdG9fdXNlY3Mo
KSB3b3VsZCBiZSBkaXNjYXJkZWQuCj4gCj4+IFNvIGZhciwgSSBoYXZlIHR3byBzb2x1dGlvbnM6
Cj4+Cj4+IDEuIENoYW5nZSB0aGUgcmV0dXJuIHR5cGUgZnJvbSAndW5zaWduZWQgaW50JyB0byAn
dW5zaWduZWQgbG9uZycgYXMgaW4gYWJvdmUKPj4gbGluayBhbmQgSSBhbSBhZnJhaWQgaXQgd291
bGQgYnJpbmcgc2lkZSBlZmZlY3QuIFRoZSByZXR1cm4gdHlwZSBpbiBsYXRlc3QKPj4gbWFpbmxp
bmUga2VybmVsIGlzIHN0aWxsICd1bnNpZ25lZCBpbnQnLgo+IAo+IENoYW5naW5nIGl0IHRvIHVu
c2lnbmVkIGxvbmcgd291bGQganVzdCBzb2x2ZSB0aGUgaXNzdWUgZm9yIDY0Yml0Lgo+IAo+IFRo
YW5rcywKPiAKPiAJdGdseAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
