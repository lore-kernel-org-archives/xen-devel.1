From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V2 3/3] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Fri, 26 Oct 2018 09:04:59 -0600
Message-ID: <5BD32D1B02000078001F5472@prv1-mh.provo.novell.com>
References: <1540300744-7406-1-git-send-email-rcojocaru@bitdefender.com>
 <1540300744-7406-4-git-send-email-rcojocaru@bitdefender.com>
 <5BD328F402000078001F540F@prv1-mh.provo.novell.com>
 <48c7a0be-40f3-32ef-0f7a-d5d3b44a189e@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n7n6=ng=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gG3fc-0006fE-Ok
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:05:04 +0000
In-Reply-To: <48c7a0be-40f3-32ef-0f7a-d5d3b44a189e@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjEwLjE4IGF0IDE3OjAwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMTAvMjYvMTggNTo0NyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIz
LjEwLjE4IGF0IDE1OjE5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+PiAg
eGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyB8ICA4ICsrKysrCj4+PiAgeGVuL2FyY2gveDg2L21t
L3AybS5jICAgICB8IDgzIAo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tCj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKPj4gCj4+IFdoYXQgYWJvdXQgcDJtLXB0LmM/Cj4gCj4gSSB0aG91Z2h0IGFsdHAy
bSB3YXMgYW4gRVBULW9ubHkgdG9vbCwKClJpZ2h0LCBJIGhhZCB0aG91Z2h0IG9mIHRoaXMgYWZ0
ZXIgc2VuZGluZywgeWV0IEkgc3RpbGwgdGhpbmsgLi4uCgo+IGRvIHlvdSBtZWFuIHRoYXQgSSBz
aG91bGQgYWxzbwo+IGl0ZXJhdGUgb3ZlciBwb3NzaWJseSBhY3RpdmUgYWx0cDJtcyBpbiBwMm1f
cHRfaGFuZGxlX2RlZmVycmVkX2NoYW5nZXMoKQo+IHRoZXJlIGFzIHdlbGw/CgouLi4gaGF2aW5n
IHRoYXQgY29kZSBpbiBzeW5jIF9taWdodF8gYmUgYSBnb29kIGlkZWEuIFdhaXQgZm9yCkdlb3Jn
ZSdzIG9waW5pb24gdGhvdWdoIGJlZm9yZSB5b3UgaW52ZXN0IHRpbWUgdGhlcmUuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
