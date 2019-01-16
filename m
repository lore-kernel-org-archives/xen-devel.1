From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/mm: Clean up p2m_finish_type_change
 return value
Date: Wed, 16 Jan 2019 08:39:53 -0700
Message-ID: <5C3F5049020000780020E67C@prv1-mh.provo.novell.com>
References: <20190116151231.10210-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gjnIP-00038B-F7
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 15:40:01 +0000
In-Reply-To: <20190116151231.10210-1-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE5IGF0IDE2OjEzLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IENoYW5nZWQgdGhlIHJldHVybiB2YWx1ZSBvZiAxIHRvIDAgc28gbm93IHAybV9maW5pc2hf
dHlwZV9jaGFuZ2UgcmV0dXJucwo+IDAgZm9yIHN1Y2Nlc3Mgb3IgPDAgZm9yIGVycm9yLgoKVGhp
cyBpcyBhIHZhbGlkIGFsdGVybmF0aXZlIHJldHVybiB2YWx1ZSBtb2RlbC4gQm90aCBoYXZlIHRo
ZWlyIG1lcml0cy4KSGVuY2UgaWYgeW91IHdhbnQgdG8gY2hhbmdlIGZyb20gb25lIHRvIHRoZSBv
dGhlciwgeW91IHNob3VsZCBnaXZlCmEgcmVhc29uLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0v
cDJtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBAQCAtMTE3OCw2ICsxMTc4LDcg
QEAgaW50IHAybV9maW5pc2hfdHlwZV9jaGFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwKPiAgCj4gICAg
ICBpZiAoIHJjIDwgMCApCj4gICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICByYyA9IDA7CgpJbnN0
ZWFkIG9mIHRoaXMgYW5kIC4uLgoKPiBAQCAtMTE4OCwxOSArMTE4OSwxNCBAQCBpbnQgcDJtX2Zp
bmlzaF90eXBlX2NoYW5nZShzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgICAgICAgICBpZiAoIGQt
PmFyY2guYWx0cDJtX2VwdHBbaV0gIT0gbWZuX3goSU5WQUxJRF9NRk4pICkKPiAgICAgICAgICAg
ICAgewo+ICAgICAgICAgICAgICAgICAgc3RydWN0IHAybV9kb21haW4gKmFsdHAybSA9IGQtPmFy
Y2guYWx0cDJtX3AybVtpXTsKPiAtICAgICAgICAgICAgICAgIGludCByYzE7Cj4gIAo+ICAgICAg
ICAgICAgICAgICAgcDJtX2xvY2soYWx0cDJtKTsKPiAtICAgICAgICAgICAgICAgIHJjMSA9IGZp
bmlzaF90eXBlX2NoYW5nZShhbHRwMm0sIGZpcnN0X2dmbiwgbWF4X25yKTsKPiArICAgICAgICAg
ICAgICAgIHJjID0gZmluaXNoX3R5cGVfY2hhbmdlKGFsdHAybSwgZmlyc3RfZ2ZuLCBtYXhfbnIp
Owo+ICAgICAgICAgICAgICAgICAgcDJtX3VubG9jayhhbHRwMm0pOwo+ICAKPiAtICAgICAgICAg
ICAgICAgIGlmICggcmMxIDwgMCApCj4gLSAgICAgICAgICAgICAgICB7Cj4gLSAgICAgICAgICAg
ICAgICAgICAgcmMgPSByYzE7Cj4gKyAgICAgICAgICAgICAgICBpZiAoIHJjIDwgMCApCj4gICAg
ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gLSAgICAgICAgICAgICAgICB9Cj4gLQo+IC0g
ICAgICAgICAgICAgICAgcmMgfD0gcmMxOwo+ICsgICAgICAgICAgICAgICAgcmMgPSAwOwoKLi4u
IHRoaXMsIHdoeSBkb24ndCB5b3Ugc2ltcGx5IHNldCAicmMiIHRvIHplcm8gb25jZSAuLi4KCj4g
ICAgICAgICAgICAgIH0KPiAgICAgIH0KPiAgI2VuZGlmCgouLi4gYmVsb3cgaGVyZSAoYnV0IGFo
ZWFkIG9mIHRoZSAib3V0IiBsYWJlbCk/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
