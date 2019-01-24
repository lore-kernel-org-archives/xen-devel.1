From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 07/11] nospec: enable
 lfence on Intel
Date: Thu, 24 Jan 2019 22:29:48 +0000
Message-ID: <996754ba-3eab-6e96-5f75-e7cafeef6503@citrix.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244655-32180-7-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jbrD=QA=citrix.com=prvs=920b187fd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gmnVS-000229-8L
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 22:29:54 +0000
In-Reply-To: <1548244655-32180-7-git-send-email-nmanthey@amazon.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Bjoern Doebel <doebel@amazon.de>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMjAxOSAxMTo1NywgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IFdoaWxlIHRoZSBs
ZmVuY2UgaW5zdHJ1Y3Rpb24gd2FzIGFkZGVkIGZvciBhbGwgeDg2IHBsYXRmb3JtIGluIHRoZQo+
IGJlZ2lubmluZywgaXQncyB1c2VmdWwgdG8gbm90IGJsb2NrIHBsYXRmb3JtcyB0aGF0IGFyZSBu
b3QgYWZmZWN0ZWQKPiBieSB0aGUgTDFURiB2dWxuZXJhYmlsaXR5LiBUaGVyZWZvcmUsIHRoZSBs
ZmVuY2UgaW5zdHJ1Y3Rpb24gc2hvdWxkCj4gb25seSBiZSBpbnRyb2R1Y2VkLCBpbiBjYXNlIHRo
ZSBjdXJyZW50IENQVSBpcyBhbiBJbnRlbCBDUFUgdGhhdCBpcwo+IGNhcGFibGUgb2YgaHlwZXIg
dGhyZWFkaW5nLiBUaGlzIGNvbWJpbmF0aW9uIG9mIGZlYXR1cmVzIGlzIGFkZGVkCj4gdG8gdGhl
IGZlYXR1cmVzIHRoYXQgYWN0aXZhdGUgdGhlIGFsdGVybmF0aXZlLgo+Cj4gVGhpcyBjb21taXQg
aXMgcGFydCBvZiB0aGUgU3BlY3RyZVYxK0wxVEYgbWl0aWdhdGlvbiBwYXRjaCBzZXJpZXMuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPgo+
IC0tLQo+ICB4ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmggfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUveGVuL25vc3BlYy5oIGIveGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCj4gLS0t
IGEveGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL25vc3Bl
Yy5oCj4gQEAgLTcsNiArNyw3IEBACj4gICNpZm5kZWYgWEVOX05PU1BFQ19ICj4gICNkZWZpbmUg
WEVOX05PU1BFQ19ICj4gIAo+ICsjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4gICNpbmNs
dWRlIDxhc20vc3lzdGVtLmg+Cj4gIAo+ICAvKioKPiBAQCAtNjgsNyArNjksMTAgQEAgc3RhdGlj
IGlubGluZSB1bnNpZ25lZCBsb25nIGFycmF5X2luZGV4X21hc2tfbm9zcGVjKHVuc2lnbmVkIGxv
bmcgaW5kZXgsCj4gICAqIGFsbG93IHRvIGluc2VydCBhIHJlYWQgbWVtb3J5IGJhcnJpZXIgaW50
byBjb25kaXRpb25hbHMKPiAgICovCj4gICNpZmRlZiBDT05GSUdfWDg2Cj4gLXN0YXRpYyBpbmxp
bmUgYm9vbCBsZmVuY2VfdHJ1ZSh2b2lkKSB7IHJtYigpOyByZXR1cm4gdHJ1ZTsgfQo+ICtzdGF0
aWMgaW5saW5lIGJvb2wgbGZlbmNlX3RydWUodm9pZCkgewo+ICsgICAgYWx0ZXJuYXRpdmUoIiIs
ICJsZmVuY2UiLCBYODZfVkVORE9SX0lOVEVMKTsKClRoaXMgZG9lc24ndCBkbyB3aGF0IHlvdSBl
eHBlY3QuwqAgSXQgd2lsbCBjYXVzZSB0aGUgbGZlbmNlcyB0byBiZQpwYXRjaGVkIGludG8gZXhp
c3RlbmNlIG9uIGFueSBoYXJkd2FyZSB3aXRoIGFuIEZQVSAoYmVmb3JlIGEgcmVjZW50CnBhdGNo
IG9mIG1pbmUpIG9yIHdpdGggVk1FIChhZnRlciBhIHJlY2VudCBwYXRjaCkuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
