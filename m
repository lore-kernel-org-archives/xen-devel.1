From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Thu, 4 Oct 2018 15:10:20 +0300
Message-ID: <76b63db5-7f59-3a45-e9a1-cb2a3805501d@bitdefender.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
 <20181003131405.w6bwl76xqmqawj4y@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uicy=mq=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g82SX-0003wn-1t
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 12:10:25 +0000
In-Reply-To: <20181003131405.w6bwl76xqmqawj4y@zion.uk.xensource.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, george.dunlap@eu.citrix.com, tamas@tklengyel.com
Cc: sstabellini@kernel.org, konrad.wilk@oracle.com, andrew.cooper3@citrix.com, Adrian Pop <apop@bitdefender.com>, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMy8xOCA0OjE0IFBNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFRodSwgU2VwIDI3LCAyMDE4
IGF0IDEwOjU4OjU0QU0gKzAzMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gQ3VycmVudGx5
IHRoZXJlIGlzIGEgc3Vib3AgZm9yIHNldHRpbmcgdGhlIG1lbWFjY2VzcyBvZiBhIHBhZ2UsIGJ1
dCBub3QKPj4gZm9yIGNvbnN1bHRpbmcgaXQuICBUaGUgbmV3IEhWTU9QX2FsdHAybV9nZXRfbWVt
X2FjY2VzcyBhZGRzIHRoaXMKPj4gZnVuY3Rpb25hbGl0eS4KPj4KPj4gQm90aCBhbHRwMm0gZ2V0
L3NldCBtZW0gYWNjZXNzIGZ1bmN0aW9ucyB1c2UgdGhlIHN0cnVjdAo+PiB4ZW5faHZtX2FsdHAy
bV9tZW1fYWNjZXNzIHdoaWNoIGhhcyBub3cgZHJvcHBlZCB0aGUgYHNldCcgcGFydCBhbmQgaGFz
Cj4+IGJlZW4gcmVuYW1lZCBmcm9tIHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUG9wIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+
Pgo+PiAtLS0KPj4gQ2hhbmdlcyBzaW5jZSBWNToKPj4gIC0gRml4ZWQgdGhlIGJ1aWxkIGJ5IGNv
bmRpdGlvbmFsbHktY29tcGlsaW5nIHRoZSBhbHRwMm0gY29kZQo+PiAgICBnYXRlZCBvbiBDT05G
SUdfSFZNIGJlaW5nICNkZWZpbmVkLgo+PiAtLS0KPj4gIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVu
Y3RybC5oICAgfCAgMyArKysKPj4gIHRvb2xzL2xpYnhjL3hjX2FsdHAybS5jICAgICAgICAgfCAz
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAKPiBBY2tlZC1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoYW5rcyEgVGFtYXMsIEdlb3JnZSwgaXMgdGhlIHBh
dGNoIE9LIHdpdGggeW91PwoKClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
