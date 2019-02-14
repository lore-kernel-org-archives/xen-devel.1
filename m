From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 6/7] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Thu, 14 Feb 2019 04:25:49 -0700
Message-ID: <5C65503D0200007800216A49@prv1-mh.provo.novell.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guF9M-0001s2-U3
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 11:25:52 +0000
In-Reply-To: <20190211174642.38046-7-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAyLjE5IGF0IDE4OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC05NDgsNiArOTUxLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwMm1fZW50cnlfbW9kaWZ5
KHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIHAybV90eXBlX3QgbnQsCj4gICAgICAgICAgcDJtLT5p
b3JlcS5lbnRyeV9jb3VudCsrOwo+ICAgICAgICAgIGJyZWFrOwo+ICAKPiArICAgIGNhc2UgcDJt
X21hcF9mb3JlaWduOgo+ICsgICAgICAgIEJVR19PTighbWZuX3ZhbGlkKG5mbikgfHwKPiArICAg
ICAgICAgICAgICAgIXBhZ2VfZ2V0X293bmVyX2FuZF9yZWZlcmVuY2UobWZuX3RvX3BhZ2UobmZu
KSkpOwo+ICsgICAgICAgIGJyZWFrOwoKQXNzZXJ0aW5nIHRoYXQgdGhlIHBhc3NlZCBpbiBNRk4g
aXMgdmFsaWQgaXMgZmluZS4gQXNzZXJ0aW5nIHRoYXQgYQpyZWZlcmVuY2UgY2FuIGJlIGdvdCBp
cyBub3QsIGFzIHRoaXMgc2V0cyB1cyB1cCBmb3IgYSBEb1MgaW4gY2FzZQpvZiBhIHJlZmNvdW50
IG92ZXJmbG93LCBvciB0aGUgcGFnZSBoYXZpbmcgZ290IGJhbGxvb25lZCBvdXQgYnkKaXRzIG93
bmVyLiBUaGF0IGlzLCB0aGUgaXNzdWUgb2YgeW91IGZvbGRpbmcgdGhlIHR3byBvcmlnaW5hbCBj
YWxscwppbnRvIG9uZSBpcyB3aWRlciB0aGFuIGp1c3QgdGhlIHR3byBkaXN0aW5jdCBlcnJvciBj
b2RlcyBnZXR0aW5nIGxvc3QKdGhhdCB3ZXJlIHByZXZpb3VzbHkgcHJvZHVjZWQgLSB5b3UgY2Fu
J3QgKGN1cnJlbnRseSkgcmVwb3J0IHVwCmFueSBlcnJvciBmcm9tIHRoaXMgbG93IGxheWVyLiAo
QW5kIEknbSBzb3JyeSwgSSBzaG91bGQgaGF2ZSBub3RpY2VkCnRoaXMgb24gdjEgYWxyZWFkeS4p
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
