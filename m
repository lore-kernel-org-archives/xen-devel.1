From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC V2 42/45] xen/sched: add fall back to
 idle vcpu when scheduling item
Date: Thu, 16 May 2019 07:05:09 -0600
Message-ID: <5CDD6005020000780022FA9A@prv1-mh.provo.novell.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-43-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRG4O-00041w-T3
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:05:12 +0000
In-Reply-To: <20190506065644.7415-43-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA1LjE5IGF0IDA4OjU2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBA
QCAtMTU0LDYgKzE1NCwyNCBAQCBzdGF0aWMgdm9pZCBpZGxlX2xvb3Aodm9pZCkKPiAgICAgIH0K
PiAgfQo+ICAKPiArLyoKPiArICogSWRsZSBsb29wIGZvciBzaWJsaW5ncyBvZiBhY3RpdmUgc2No
ZWR1bGUgaXRlbXMuCj4gKyAqIFdlIGRvbid0IGRvIGFueSBzdGFuZGFyZCBpZGxlIHdvcmsgbGlr
ZSB0YXNrbGV0cywgcGFnZSBzY3J1YmJpbmcgb3IKPiArICogbGl2ZXBhdGNoaW5nLgo+ICsgKiBV
c2UgZGVmYXVsdF9pZGxlKCkgaW4gb3JkZXIgdG8gc2ltdWxhdGUgdi0+aXNfdXJnZW50LgoKSSBn
dWVzcyBJJ20gbWlzc2luZyBhIHBhcnQgb2YgdGhlIGRlc2NyaXB0aW9uIHdoaWNoIGV4cGxhaW5z
IGFsbCB0aGlzOgpXaGF0J3Mgd3Jvbmcgd2l0aCBkb2luZyBzY3J1YmJpbmcgd29yaywgZm9yIGV4
YW1wbGU/IFdoeSBpcwpkb2luZyB0YXNrbGV0IHdvcmsgbm90IG9rYXksIGJ1dCBzb2Z0aXJxcyBh
cmU/IFdoYXQgaXMgdGhlIGRlYWwgd2l0aAp2LT5pc191cmdlbnQsIGkuZS4gd2hhdCBqdXN0aWZp
ZXMgbm90IGVudGVyaW5nIGEgZGVjZW50IHBvd2VyCnNhdmluZyBtb2RlIGhlcmUgb24gSW50ZWws
IGJ1dCBkb2luZyBzbyBvbiBBTUQ/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oCj4gQEAgLTc2LDYgKzc2LDkgQEAgdm9p
ZCBzZXRfbnJfc29ja2V0cyh2b2lkKTsKPiAgLyogUmVwcmVzZW50aW5nIEhUIGFuZCBjb3JlIHNp
YmxpbmdzIGluIGVhY2ggc29ja2V0LiAqLwo+ICBleHRlcm4gY3B1bWFza190ICoqc29ja2V0X2Nw
dW1hc2s7Cj4gIAo+ICsjZGVmaW5lIGdldF9jcHVfY3VycmVudChjcHUpIFwKPiArICAgIChnZXRf
Y3B1X2luZm9fZnJvbV9zdGFjaygodW5zaWduZWQgbG9uZylzdGFja19iYXNlW2NwdV0pLT5jdXJy
ZW50X3ZjcHUpCgpZZXQgYW5vdGhlciwgc2xpZ2h0bHkgZGlmZmVyZW50IG5vdGlvbiBvZiAiY3Vy
cmVudCIuIElmICJjdXJyZW50IgppdHNlbGYgaXMgbm90IHN1aXRhYmxlIChJIGNhbid0IGltbWVk
aWF0ZWx5IHNlZSB3aHkgdGhhdCB3b3VsZCBiZSwKYnV0IEkgYWxzbyBkaWRuJ3QgbG9vayBhdCBh
bGwgdGhlIHNjaGVkdWxlciBzcGVjaWZpYyBjaGFuZ2VzIGVhcmxpZXIKaW4gdGhpcyBzZXJpZXMp
LCB3aHkgaXNuJ3QgcGVyX2NwdShjdXJyX3ZjcHUsIGNwdSkgZWl0aGVyPwoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
