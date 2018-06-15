From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] tools/libxencalls: add new function to
 query hypercall buffer safety
Date: Fri, 15 Jun 2018 08:06:29 -0600
Message-ID: <5B23C7E502000078001CBA03@prv1-mh.provo.novell.com>
References: <20180615132641.5461-1-jgross@suse.com>
 <20180615132641.5461-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9pmr=jb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fTpN2-0003xb-Nn
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 14:06:32 +0000
In-Reply-To: <20180615132641.5461-3-jgross@suse.com>
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA2LjE4IGF0IDE1OjI2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBBZGQg
YSBuZXcgZnVuY3Rpb24gdG8gcXVlcnkgd2hldGhlciBoeXBlcmNhbGwgYnVmZmVycyBhcmUgYWx3
YXlzIHNhZmUKPiB0byBhY2Nlc3MgYnkgdGhlIGh5cGVydmlzb3Igb3IgbWlnaHQgcmVzdWx0IGlu
IEVGQVVMVC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gLS0tCj4gIHRvb2xzL2xpYnMvY2FsbC9NYWtlZmlsZSAgICAgICAgICB8IDIgKy0KPiAg
dG9vbHMvbGlicy9jYWxsL2ZyZWVic2QuYyAgICAgICAgIHwgNSArKysrKwo+ICB0b29scy9saWJz
L2NhbGwvaW5jbHVkZS94ZW5jYWxsLmggfCA3ICsrKysrKysKPiAgdG9vbHMvbGlicy9jYWxsL2xp
YnhlbmNhbGwubWFwICAgIHwgNSArKysrKwo+ICB0b29scy9saWJzL2NhbGwvbGludXguYyAgICAg
ICAgICAgfCA1ICsrKysrCj4gIHRvb2xzL2xpYnMvY2FsbC9taW5pb3MuYyAgICAgICAgICB8IDUg
KysrKysKPiAgdG9vbHMvbGlicy9jYWxsL25ldGJzZC5jICAgICAgICAgIHwgNSArKysrKwo+ICB0
b29scy9saWJzL2NhbGwvc29sYXJpcy5jICAgICAgICAgfCA1ICsrKysrCj4gIDggZmlsZXMgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKRGlkIHlvdSB2ZXJpZnkgYWxs
IG9mIHRoZW0gdG8gaW5kZWVkIGJlIHNhZmU/IElmIG5vdCwgd291bGRuJ3QgaXQgYmUgYmV0dGVy
IHRvCmRlZmF1bHQgdG8gdW5zYWZlPwoKRm9yIExpbnV4LCBpcyB0aGVyZSBwZXJoYXBzIGEgd2F5
IHRvIGZpZ3VyZSBvdXQgd2hldGhlciB0aGUgcHJvYmxlbQpmZWF0dXJlcyBkb24ndCBleGlzdCAo
b3IgYXJlIGRpc2FibGVkKSBpbiB0aGUga2VybmVsLCBzbyB0aGF0IChlc3BlY2lhbGx5Cm9uIG9s
ZGVyIGtlcm5lbHMsIHdoZXJlIHRoZSBwcml2Y21kIGRyaXZlciBzdXJlbHkgaXMgYW4gb2xkIG9u
ZSkgeW91CmRvbid0IG5lZWRsZXNzbHkgZG8gdGhlIHJldHJpZXM/CgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
