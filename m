From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/6] microcode: save all microcodes which
 pass sanity check
Date: Thu, 29 Nov 2018 03:19:25 -0700
Message-ID: <5BFFBD2D02000078002011D7@prv1-mh.provo.novell.com>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-3-git-send-email-chao.gao@intel.com>
 <20181128120014.r6llmchpcjtjlwc6@mac> <20181129024032.GB23701@gao-cwp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=suqh=oi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSJRp-0001ZF-Pj
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 10:21:29 +0000
In-Reply-To: <20181129024032.GB23701@gao-cwp>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjExLjE4IGF0IDAzOjQwLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBXZWQsIE5vdiAyOCwgMjAxOCBhdCAwMTowMDoxNFBNICswMTAwLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+Pk9uIFdlZCwgTm92IDI4LCAyMDE4IGF0IDAxOjM0OjEyUE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+Pj4gQEAgLTQ5MSw2ICs1NTksMjEgQEAgc3RhdGljIGludCBjcHVfcmVxdWVz
dF9taWNyb2NvZGUodW5zaWduZWQgaW50IGNwdSwgY29uc3Qgdm9pZCAqYnVmLAo+Pj4gICAgICB3
aGlsZSAoIChlcnJvciA9IGdldF91Y29kZV9mcm9tX2J1ZmZlcl9hbWQobWNfYW1kLCBidWYsIGJ1
ZnNpemUsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmb2Zmc2V0KSkgPT0gMCApCj4+PiAgICAgIHsKPj4+ICsgICAgICAgIHN0cnVjdCB1Y29kZV9w
YXRjaCAqdWNvZGVfcGF0Y2g7Cj4+PiArCj4+PiArICAgICAgICAvKgo+Pj4gKyAgICAgICAgICog
U2F2ZSB0aGlzIG1pY3JvY29kZSBiZWZvcmUgY2hlY2tpbmcgdGhlIHNpZ25hdHVyZS4gSXQgaXMg
dG8KPj4+ICsgICAgICAgICAqIG9wdGltaXplIG1pY3JvY29kZSB1cGRhdGUgb24gYSBtaXhlZCBm
YW1pbHkgc3lzdGVtLiBQYXJzaW5nCj4+Cj4+RXIsIGlzIGl0IHBvc3NpYmxlIHRvIGhhdmUgYSBz
eXN0ZW0gd2l0aCBDUFVzIG9mIGRpZmZlcmVudCBmYW1pbHk/Cj4+V2hhdCdzIGdvaW5nIHRvIGhh
cHBlbiB3aXRoIENQVXMgaGF2aW5nIGRpZmZlcmVudCBmZWF0dXJlcz8KPiAKPiBJIGhhdmUgbm8g
aWRlYS4gVGhhdCBlYWNoIGNwdSBoYXMgYSBwZXItY3B1IHZhcmlhYmxlIHRvIHN0b3JlIHRoZQo+
IG1pY3JvY29kZSByYXRoZXIgdGhhbiBhIGdsb2JhbCBvbmUgZ2l2ZXMgbWUgYSBmZWVsaW5nIHRo
YXQgdGhlIGN1cnJlbnQKPiBpbXBsZW1lbnRhdGlvbiB3YW50cyB0byBtYWtlIGl0IHdvcmsgb24g
YSBzeXN0ZW0gd2l0aCBDUFVzIG9mIGRpZmZlcmVudAo+IGZhbWlseS4KCkkgdGhpbmsgd2UndmUg
bG9uZyBnaXZlbiB1cCBvbiBzdXBwb3J0aW5nIG1peGVkLW1vZGVsIG9yIGV2ZW4KbWl4ZWQtZmFt
aWx5IHN5c3RlbXMuIFRoZXJlZm9yZSBpbiB0aGlzIG92ZXJoYXVsIGRvaW5nIGF3YXkgd2l0aApw
ZXItQ1BVIHRyYWNraW5nIGJleW9uZCB0aGUgcHJlc2VudCB1Y29kZSBsZXZlbCAod2hpY2ggaW5k
ZWVkCm1heSBkaWZmZXIsIGV2ZW4gaWYgd2UgbWF5IGhhdmUgdG8gY29uc2lkZXIgdG8gcmVmdXNl
IGtlZXBpbmcgdGhlCnN5c3RlbSB1cCBpbiBzdWNoIGEgY2FzZSkgd291bGQgcGVyaGFwcyBiZSBw
cmV0dHkgcmVhc29uYWJsZS4KCk9uZSB0aGluZyBkZWZpbml0ZWx5IG5lZWRzIHRvIHdvcms6IFVw
ZGF0aW5nIG9mIHVjb2RlIHdoZW4KZmlybXdhcmUgaGFzIGxvYWRlZCBkaWZmZXJpbmcgdmVyc2lv
bnMgKHdoaWNoIHVzdWFsbHkgYm9pbHMgZG93bgp0byBmaXJtd2FyZSBuZWdsZWN0aW5nIHRvIGxv
YWQgdWNvZGUgb24gYWxsIGNvcmVzKS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
