From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V4 2/3] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Fri, 9 Nov 2018 14:39:20 +0200
Message-ID: <8e48adcb-a155-7eeb-5b64-35e7b053e002@bitdefender.com>
References: <1541083542-22464-1-git-send-email-rcojocaru@bitdefender.com>
 <1541083542-22464-3-git-send-email-rcojocaru@bitdefender.com>
 <e3c716fd-bdb3-cdb9-aa98-d24db16f6efd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y7e3=nu=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gL64M-0001yS-ME
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 12:39:26 +0000
In-Reply-To: <e3c716fd-bdb3-cdb9-aa98-d24db16f6efd@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvOS8xOCAyOjI5IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDExLzEvMTggMjo0
NSBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+PiBUaGlzIHBhdGNoIGlzIGEgcHJlLXJlcXVp
c2l0ZSBmb3IgdGhlIG9uZSBmaXhpbmcgVkdBIGxvZ2RpcnR5Cj4+IGZyZWV6ZXMgd2hlbiB1c2lu
ZyBhbHRwMm0uIEl0IG9ubHkgY29uY2VybnMgaXRzZWxmIHdpdGggdGhlCj4+IHJhbmdlcyBhbGxv
Y2F0aW9uIC8gZGVhbGxvY2F0aW9uIC8gaW5pdGlhbGl6YXRpb24gcGFydC4gV2hpbGUKPj4gdG91
Y2hpbmcgdGhlIGNvZGUsIEkndmUgc3dpdGNoZWQgZ2xvYmFsX2xvZ2RpcnR5IGZyb20gYm9vbF90
Cj4+IHRvIGJvb2wuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiAKPiBBbGdvcml0aG0gbG9va3MgZ29vZDsgb25lIGlzc3Vl
Ogo+IAo+PiAgLyogSW5pdCB0aGUgZGF0YXN0cnVjdHVyZXMgZm9yIGxhdGVyIHVzZSBieSB0aGUg
cDJtIGNvZGUgKi8KPj4gIHN0YXRpYyBpbnQgcDJtX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAq
ZCwgc3RydWN0IHAybV9kb21haW4gKnAybSkKPj4gIHsKPj4gQEAgLTEwOCw3ICsxMzAsMTAgQEAg
ZnJlZV9wMm06Cj4+ICBzdGF0aWMgdm9pZCBwMm1fZnJlZV9vbmUoc3RydWN0IHAybV9kb21haW4g
KnAybSkKPj4gIHsKPj4gICAgICBpZiAoIGhhcF9lbmFibGVkKHAybS0+ZG9tYWluKSAmJiBjcHVf
aGFzX3ZteCApCj4+ICsgICAgewo+PiArICAgICAgICBwMm1fZnJlZV9sb2dkaXJ0eShwMm0pOwo+
PiAgICAgICAgICBlcHRfcDJtX3VuaW5pdChwMm0pOwo+PiArICAgIH0KPiAKPiBUaGlzIGlzIHdy
b25nIC0tIHRoZSByYW5nZXNldCBpcyBjcmVhdGVkIGV2ZW4gaWYgIWhhcF9lbmFibGVkKCkgb3IK
PiAhY3B1X2hhc192bXgsIGJ1dCBvbmx5IGRlc3Ryb3llZCBoZXJlIGlmIGJvdGguCj4gCj4gRXZl
cnl0aGluZyBlbHNlIGxvb2tzIE9LLgoKUmlnaHQsIEknbGwgZ2V0IHRvIGZpeGluZyB0aGF0LiA6
KQoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
