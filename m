From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/8] viridian: add init hooks
Date: Fri, 25 Jan 2019 14:22:49 +0000
Message-ID: <20190125142249.a3r4edbhe6wb3bip@zion.uk.xensource.com>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-2-paul.durrant@citrix.com>
 <08055d6c-0c5b-85cc-b7f6-444d5da0a56a@citrix.com>
 <bd9e0ba5-4ad7-c98e-0504-c56e13d6f239@citrix.com>
 <15c77645353348ee83194138812a619f@AMSPEX02CL03.citrite.net>
 <285d67a3782d49089121b57b503b8fda@AMSPEX02CL03.citrite.net>
 <72f4e1d06e254dd486819d5494393ca5@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jZp+=QB=citrix.com=prvs=921c531d3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gn2Ni-000596-4D
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 14:22:54 +0000
Content-Disposition: inline
In-Reply-To: <72f4e1d06e254dd486819d5494393ca5@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMDMsIDIwMTkgYXQgMDI6MTg6MThQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KWy4uLl0KPiA+IAo+ID4gTG9va2lu
ZyBhdCB0aGlzIGEgbGl0dGxlIG1vcmUuLi4gVmlyaWRpYW4gaXMgYW4geDg2IHNwZWNpZmljIHRo
aW5nLCBzbyBhbgo+ID4gZXh0cmEgZmxhZyBpbiB4ZW5fYXJjaF9kb21haW5jb25maWcgd291bGQg
c2VlbSBtb3N0IGFwcHJvcHJpYXRlLiBUaGlzCj4gPiB3b3VsZCB0aGVuIG5lZWQgdG8gd2lyZWQg
aW50byB0aGUgYXBwcm9wcmlhdGUgcGxhY2UocykgaW4gbGlieGwuIEknbGwgaGF2ZQo+ID4gYSBs
b29rIGF0IGhvdyBtdWNoIHdvcmsgdGhpcyBpcyBsaWtlbHkgdG8gYmUuCj4gCj4gV291bGQgc29t
ZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZiB0aGUgZm9sbG93aW5nIChhcyB5ZXQgdW50ZXN0ZWQg
YW5kIGluY29tcGxldGUpIHBhdGNoIGJlIGFjY2VwdGFibGU/Cj4gCj4gKEkndmUgYmxpbmRseSBj
b2RlZCB0aGUgT2NhbWwgJE1BR0lDIGFuZCBqdXN0IGhhcmRjb2RlZCB0aGUgZmxhZyBpbiB0aGUg
c3R1YikKPiAKCk5vdCBzdXJlIGlmIHlvdXIgcXVlc3Rpb24gaXMgZGlyZWN0ZWQgdG8gbWUgb3Ig
bm90LgoKSSB0aGluayB0aGlzIHBhdGNoIGlzIGluZGVwZW5kZW50IG9mIHRoaXMgc2VyaWVzIHRv
IGhhbmQ/Cgo+IC0tLTg8LS0tCj4gCj4gLWludCBodm1fZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0
IGRvbWFpbiAqZCkKPiAraW50IGh2bV9kb21haW5faW5pdGlhbGlzZShzdHJ1Y3QgZG9tYWluICpk
LCBib29sIGVuYWJsZV92aXJpZGlhbikKPiAgewo+ICAgICAgdW5zaWduZWQgaW50IG5yX2dzaXM7
Cj4gICAgICBpbnQgcmM7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2
bS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKPiBpbmRleCA3ODkyZjk4YzdiLi42
YmRlNjEzZGQ4IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCj4g
KysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKPiBAQCAtMjQxLDcgKzI0MSw3IEBA
IGV4dGVybiBzOCBodm1fcG9ydDgwX2FsbG93ZWQ7Cj4gIGV4dGVybiBjb25zdCBzdHJ1Y3QgaHZt
X2Z1bmN0aW9uX3RhYmxlICpzdGFydF9zdm0odm9pZCk7Cj4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qg
aHZtX2Z1bmN0aW9uX3RhYmxlICpzdGFydF92bXgodm9pZCk7Cj4gCj4gLWludCBodm1fZG9tYWlu
X2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAqZCk7Cj4gK2ludCBodm1fZG9tYWluX2luaXRpYWxp
c2Uoc3RydWN0IGRvbWFpbiAqZCwgYm9vbCBlbmFibGVfdmlyaWRpYW4pOwoKaHZtX2RvbWFpbl9p
bml0aWFsaXNlIChhbmQgcHZfZG9tYWluX2luaXRpYWxpc2UpIHVzZWQgdG8gdGFrZSBhCnhlbl9h
cmNoX2RvbWFpbl9jb25maWcuIEkgdGhpbmsgeW91IGNhbiBpbnRyb2R1Y2UgaXQgYmFjay4KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
