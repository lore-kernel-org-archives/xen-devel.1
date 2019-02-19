From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/4] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Tue, 19 Feb 2019 01:39:17 -0700
Message-ID: <5C6BC0B50200007800217DF2@prv1-mh.provo.novell.com>
References: <20190218172727.19644-1-roger.pau@citrix.com>
 <20190218172727.19644-4-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C94BC73@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gw0xv-000168-7h
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 08:41:23 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19C94BC73@SHSMSX104.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAyLjE5IGF0IDA3OjE0LCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
PiAgRnJvbTogUm9nZXIgUGF1IE1vbm5lIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4+
IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDE5LCAyMDE5IDE6MjcgQU0KPj4gCj4+IEBAIC03MzQs
OCArNzM1LDE1IEBAIGhhcF93cml0ZV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQKPj4gbG9uZyBnZm4sIGwxX3BnZW50cnlfdCAqcCwKPj4gICAgICAgICAgICAgICYmIHBlcm1z
X3N0cmljdGx5X2luY3JlYXNlZChvbGRfZmxhZ3MsIGwxZV9nZXRfZmxhZ3MobmV3KSkgKTsKPj4g
ICAgICB9Cj4+IAo+PiAtICAgIHAybV9lbnRyeV9tb2RpZnkocDJtX2dldF9ob3N0cDJtKGQpLAo+
PiBwMm1fZmxhZ3NfdG9fdHlwZShsMWVfZ2V0X2ZsYWdzKG5ldykpLAo+PiAtICAgICAgICAgICAg
ICAgICAgICAgcDJtX2ZsYWdzX3RvX3R5cGUob2xkX2ZsYWdzKSwgbGV2ZWwpOwo+PiArICAgIHJj
ID0gcDJtX2VudHJ5X21vZGlmeShwMm1fZ2V0X2hvc3RwMm0oZCksCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgIHAybV9mbGFnc190b190eXBlKGwxZV9nZXRfZmxhZ3MobmV3KSksCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9mbGFnc190b190eXBlKG9sZF9mbGFncyksIGwx
ZV9nZXRfbWZuKG5ldyksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGwxZV9nZXRfbWZu
KCpwKSwgbGV2ZWwpOwo+IAo+IHdoeSBub3QgcGFzc2luZyBvbGQvbmV3IHB0ZSB0byByZWR1Y2Ug
I3BhcmFtZXRlcnMgYW5kIHRodXMgc3RhYmxlCj4gYWdhaW5zdCBmdXR1cmUgY2hhbmdlcz8KClRo
ZSBQVEUgbGF5b3V0IGlzIGRpZmZlcmVudCBiZXR3ZWVuIEVQVCBhbmQgc2hhZG93L05QVCwgeWV0
CnRoZSBmdW5jdGlvbiBoZXJlIGlzIGdlbmVyaWMuIEl0J3Mgbm90IGltcG9zc2libGUgdG8gZG8g
d2hhdCB5b3UKc3VnZ2VzdCwgYnV0IGl0IHdvdWxkIHJlcXVpcmUgZmllbGQgZXh0cmFjdGlvbiBh
YnN0cmFjdGlvbgpmdW5jdGlvbnMsIHdoaWNoIEkgZG9uJ3QgdGhpbmsgaXMgd29ydGggaXQuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
