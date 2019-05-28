From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 54/60] xen/sched: add minimalistic idle
 scheduler for free cpus
Date: Tue, 28 May 2019 13:58:45 +0200
Message-ID: <5ea454f1-79f7-2974-0736-3262870446ab@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-55-jgross@suse.com>
 <5CED1FDC0200007800233141@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVakk-0001oo-Sf
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:58:50 +0000
In-Reply-To: <5CED1FDC0200007800233141@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDUvMjAxOSAxMzo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDUuMTkg
YXQgMTI6MzMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJbnN0ZWFkIG9mIGhhdmluZyBh
IGZ1bGwgYmxvd24gc2NoZWR1bGVyIHJ1bm5pbmcgZm9yIHRoZSBmcmVlIGNwdXMKPj4gYWRkIGEg
dmVyeSBtaW5pbWFsaXN0aWMgc2NoZWR1bGVyIGZvciB0aGF0IHB1cnBvc2Ugb25seSBldmVyIHNj
aGVkdWxpbmcKPj4gdGhlIHJlbGF0ZWQgaWRsZSB2Y3B1LiBUaGlzIGhhcyB0aGUgYmlnIGFkdmFu
dGFnZSBvZiBub3QgbmVlZGluZyBhbnkKPj4gcGVyLWNwdSwgcGVyLWRvbWFpbiBvciBwZXItc2No
ZWR1bGluZyB1bml0IGRhdGEgZm9yIGZyZWUgY3B1cyBhbmQgaW4KPj4gdHVybiBzaW1wbGlmeWlu
ZyBtb3ZpbmcgY3B1cyB0byBhbmQgZnJvbSBjcHVwb29scyBhIGxvdC4KPiAKPiBBbmQgdGhlIG51
bGwgc2NoZWR1bGVyIGlzIG5vdCBtaW5pbWFsaXN0aWMgZW5vdWdoPwoKVGhlIG1haW4gZGlzYWR2
YW50YWdlIG9mIHRoZSBudWxsIHNjaGVkdWxlciBhcmUgdGhlIG5lZWQgZm9yIHByaXZhdGUKZGF0
YSAod2hpY2ggaGFzIHRvIGJlIGFsbG9jYXRlZC9mcmVlZCBvbiBzY2hlZHVsZXIgc3dpdGNoKSwg
aXRzIG5vdAp5ZXQgcGVyZmVjdCBzdGFiaWxpdHksIGFuZCBpdHMgImNvbXBsZXhpdHkiIChlLmcu
IDkwMCBsaW5lcyB2cy4gNTApLgoKPiAKPj4gLS0tIGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYwo+
PiArKysgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jCj4+IEBAIC0zNTAsOCArMzUwLDYgQEAgdm9p
ZCBzdGFydF9zZWNvbmRhcnkodW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAo+PiAgCj4+
ICAgICAgc2V0dXBfY3B1X3NpYmxpbmdfbWFwKGNwdWlkKTsKPj4gIAo+PiAtICAgIHNjaGVkdWxl
cl9wZXJjcHVfaW5pdChjcHVpZCk7Cj4+IC0KPj4gICAgICAvKiBSdW4gbG9jYWwgbm90aWZpZXJz
ICovCj4+ICAgICAgbm90aWZ5X2NwdV9zdGFydGluZyhjcHVpZCk7Cj4+ICAgICAgLyoKPj4gLS0t
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5j
Cj4+IEBAIC0zODIsOCArMzgyLDYgQEAgdm9pZCBzdGFydF9zZWNvbmRhcnkodm9pZCAqdW51c2Vk
KQo+PiAgCj4+ICAgICAgc2V0X2NwdV9zaWJsaW5nX21hcChjcHUpOwo+PiAgCj4+IC0gICAgc2No
ZWR1bGVyX3BlcmNwdV9pbml0KGNwdSk7Cj4+IC0KPj4gICAgICBpbml0X3BlcmNwdV90aW1lKCk7
Cj4+ICAKPj4gICAgICBzZXR1cF9zZWNvbmRhcnlfQVBJQ19jbG9jaygpOwo+IAo+IFNlZWluZyB5
b3UgcmV2ZXJ0IGhlcmUgd2hhdCBhbiBlYXJsaWVyIHBhdGNoIGluIHRoZSBzZXJpZXMgaGFzIGFk
ZGVkLAo+IEkgZG9uJ3Qgc3VwcG9zZSByZS1vcmRlcmluZyBjb3VsZCBhdm9pZCB0aGlzIGNvZGUg
Y2h1cm4/CgpUaGlzIHdvdWxkIHJlcXVpcmUgYW5vdGhlciBtYWpvciBzaHVmZmxpbmcgb2YgcGF0
Y2hlcy4gSSdkIGxpa2UgdG8gYXZvaWQKdGhhdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
