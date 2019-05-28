From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: remove on-stack cpumask from
 stop_machine_run()
Date: Tue, 28 May 2019 16:41:52 +0200
Message-ID: <75f2b5ce-142a-9788-f847-2ee81a183822@suse.com>
References: <20190528130811.26480-1-jgross@suse.com>
 <5CED46600200007800233274@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVdIb-0007zL-6V
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 14:41:57 +0000
In-Reply-To: <5CED46600200007800233274@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDUvMjAxOSAxNjozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDUuMTkg
YXQgMTU6MDgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL3N0
b3BfbWFjaGluZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc3RvcF9tYWNoaW5lLmMKPj4gQEAgLTY5
LDggKzY5LDggQEAgc3RhdGljIHZvaWQgc3RvcG1hY2hpbmVfd2FpdF9zdGF0ZSh2b2lkKQo+PiAg
Cj4+ICBpbnQgc3RvcF9tYWNoaW5lX3J1bihpbnQgKCpmbikodm9pZCAqKSwgdm9pZCAqZGF0YSwg
dW5zaWduZWQgaW50IGNwdSkKPj4gIHsKPj4gLSAgICBjcHVtYXNrX3QgYWxsYnV0c2VsZjsKPj4g
ICAgICB1bnNpZ25lZCBpbnQgaSwgbnJfY3B1czsKPj4gKyAgICB1bnNpZ25lZCBpbnQgbXlfY3B1
ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+IAo+IFZhcmlhYmxlcyBzdGFydGluZyB3aXRoIG15XyBi
ZWluZyBjb21tb25seSB1c2VkIGluIGludHJvZHVjdG9yeQo+IGV4YW1wbGVzLCBJJ2QgcHJlZmVy
IHRvIGF2b2lkIHN1Y2ggbmFtZXMuIEVsc2V3aGVyZSB3ZSB1c2UKPiAidGhpc19jcHUiLCAibWUi
LCBvciBtYXliZSAidGhpcyIgaWYgcGxhaW4gImNwdSIgaXMgYWxyZWFkeSB0YWtlbi4KCk9rYXku
Cgo+IAo+PiBAQCAtNzksOSArNzksNyBAQCBpbnQgc3RvcF9tYWNoaW5lX3J1bihpbnQgKCpmbiko
dm9pZCAqKSwgdm9pZCAqZGF0YSwgdW5zaWduZWQgaW50IGNwdSkKPj4gICAgICBpZiAoICFnZXRf
Y3B1X21hcHMoKSApCj4+ICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4+ICAKPj4gLSAgICBjcHVt
YXNrX2FuZG5vdCgmYWxsYnV0c2VsZiwgJmNwdV9vbmxpbmVfbWFwLAo+PiAtICAgICAgICAgICAg
ICAgICAgIGNwdW1hc2tfb2Yoc21wX3Byb2Nlc3Nvcl9pZCgpKSk7Cj4+IC0gICAgbnJfY3B1cyA9
IGNwdW1hc2tfd2VpZ2h0KCZhbGxidXRzZWxmKTsKPj4gKyAgICBucl9jcHVzID0gY3B1bWFza193
ZWlnaHQoJmNwdV9vbmxpbmVfbWFwKSAtIDE7Cj4gCj4gSGF2aW5nIGxvb2tlZCBhdCBhIGxvdCBv
ZiBDUFUgb2ZmbGluaW5nIGNvZGUgcmVjZW50bHksIEkgbm90aWNlIHRoaXMKPiBpc24ndCBzdHJp
Y3RseSBjb3JyZWN0OiBZb3UgaW1wbHkgY3B1X29ubGluZShteV9jcHUpIHRvIHByb2R1Y2UKPiAi
dHJ1ZSIuIEkgdGhpbmsgYXQgcHJlc2VudCB0aGlzIHdpbGwgYWx3YXlzIGhvbGQsIGJ1dCBJJ2Qg
cHJlZmVyIGlmIHdlCj4gY291bGQgYXZvaWQgZ2FpbmluZyBzdWNoIGEgZGVwZW5kZW5jeS4gQW5k
IGl0IGRvZXNuJ3QgbG9vayBvdmVybHkKPiBkaWZmaWN1bHQgdG8gYXZvaWQgaXQuCgpZZXMsIEkg
aGF2ZSB0aG91Z2h0IGFib3V0IGl0LiBJZiB5b3UgbGlrZSBpdCBiZXR0ZXIgSSB0ZXN0IGZvciB0
aGUKcnVubmluZyBjcHUgdG8gYmUgaW4gY3B1X29ubGluZV9tYXAuCgo+IEFsc28gcGxlYXNlIGRv
bid0IG9wZW4tY29kZSBudW1fb25saW5lX2NwdXMoKS4KCkFoLCBvZiBjb3Vyc2UhCgo+IAo+PiBA
QCAtMTAwLDggKzk4LDkgQEAgaW50IHN0b3BfbWFjaGluZV9ydW4oaW50ICgqZm4pKHZvaWQgKiks
IHZvaWQgKmRhdGEsIHVuc2lnbmVkIGludCBjcHUpCj4+ICAKPj4gICAgICBzbXBfd21iKCk7Cj4+
ICAKPj4gLSAgICBmb3JfZWFjaF9jcHUgKCBpLCAmYWxsYnV0c2VsZiApCj4+IC0gICAgICAgIHRh
c2tsZXRfc2NoZWR1bGVfb25fY3B1KCZwZXJfY3B1KHN0b3BtYWNoaW5lX3Rhc2tsZXQsIGkpLCBp
KTsKPj4gKyAgICBmb3JfZWFjaF9jcHUgKCBpLCAmY3B1X29ubGluZV9tYXAgKQo+IAo+IFNhbWUg
aGVyZSBmb3IgZm9yX2VhY2hfb25saW5lX2NwdSgpLgoKWWVzLgoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
