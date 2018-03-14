From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 11/11] vpci/msix: add MSI-X handlers
Date: Wed, 14 Mar 2018 11:04:00 -0600
Message-ID: <5AA9641002000078001B1B1F@prv-mh.provo.novell.com>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-12-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=0lyu=ge=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ew9or-00065k-QR
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 17:04:05 +0000
In-Reply-To: <20180314140408.40947-12-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDE1OjA0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9kb20wX2J1aWxkLmMKPiBAQCAtMTExNyw3ICsxMTE3LDcgQEAgaW50IF9faW5pdCBkb20w
X2NvbnN0cnVjdF9wdmgoc3RydWN0IGRvbWFpbiAqZCwgY29uc3QgbW9kdWxlX3QgKmltYWdlLAo+
ICAKPiAgICAgIHB2aF9zZXR1cF9tbWNmZyhkKTsKPiAgCj4gLSAgICBwYW5pYygiQnVpbGRpbmcg
YSBQVkh2MiBEb20wIGlzIG5vdCB5ZXQgc3VwcG9ydGVkLiIpOwo+ICsgICAgcHJpbnRrKCJXQVJO
SU5HOiBQVkggaXMgYW4gZXhwZXJpbWVudGFsIG1vZGUgd2l0aCBsaW1pdGVkIGZ1bmN0aW9uYWxp
dHlcbiIpOwo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KCkRvZXMgdGhpcyBuZWVkIHRvIGJlIGFjY29t
cGFuaWVkIGJ5IGEgbmV3IGVudHJ5IGluIFNVUFBPUlQubWQsCmFzIFBWSCBEb20wIGJlY29tZXMg
dXNhYmxlIG5vdz8gT3RvaCBpc3N1ZXMgd2l0aCBEb20wIHN1cHBvcnQKYXJlbid0IG5vcm1hbGx5
IHNlY3VyaXR5IGlzc3Vlcy4KCj4gK3ZvaWQgdnBjaV9tc2l4X2FyY2hfcHJpbnQoY29uc3Qgc3Ry
dWN0IHZwY2lfbXNpeCAqbXNpeCkKPiArewo+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4gKwo+ICsg
ICAgZm9yICggaSA9IDA7IGkgPCBtc2l4LT5tYXhfZW50cmllczsgaSsrICkKPiArICAgIHsKPiAr
ICAgICAgICBjb25zdCBzdHJ1Y3QgdnBjaV9tc2l4X2VudHJ5ICplbnRyeSA9ICZtc2l4LT5lbnRy
aWVzW2ldOwo+ICsKPiArICAgICAgICBwcmludGsoIiU2dSB2ZWM9JTAyeCU3cyU2cyUzc2Fzc2Vy
dCU1cyU3cyBkZXN0X2lkPSVsdSBtYXNrPSV1IHBpcnE6ICVkXG4iLAo+ICsgICAgICAgICAgICAg
ICBpLCBNQVNLX0VYVFIoZW50cnktPmRhdGEsIE1TSV9EQVRBX1ZFQ1RPUl9NQVNLKSwKPiArICAg
ICAgICAgICAgICAgZW50cnktPmRhdGEgJiBNU0lfREFUQV9ERUxJVkVSWV9MT1dQUkkgPyAibG93
ZXN0IiA6ICJmaXhlZCIsCj4gKyAgICAgICAgICAgICAgIGVudHJ5LT5kYXRhICYgTVNJX0RBVEFf
VFJJR0dFUl9MRVZFTCA/ICJsZXZlbCIgOiAiZWRnZSIsCj4gKyAgICAgICAgICAgICAgIGVudHJ5
LT5kYXRhICYgTVNJX0RBVEFfTEVWRUxfQVNTRVJUID8gIiIgOiAiZGUiLAo+ICsgICAgICAgICAg
ICAgICBlbnRyeS0+YWRkciAmIE1TSV9BRERSX0RFU1RNT0RFX0xPR0lDID8gImxvZyIgOiAicGh5
cyIsCj4gKyAgICAgICAgICAgICAgIGVudHJ5LT5hZGRyICYgTVNJX0FERFJfUkVESVJFQ1RJT05f
TE9XUFJJID8gImxvd2VzdCIgOiAiZml4ZWQiLAo+ICsgICAgICAgICAgICAgICBNQVNLX0VYVFIo
ZW50cnktPmFkZHIsIE1TSV9BRERSX0RFU1RfSURfTUFTSyksCj4gKyAgICAgICAgICAgICAgIGVu
dHJ5LT5tYXNrZWQsIGVudHJ5LT5hcmNoLnBpcnEpOwo+ICsgICAgICAgIGlmICggIShpICUgNTAp
ICkKClBsZWFzZSB1c2UgYSBudW1iZXIgc3VjaCB0aGF0IHRoZSBjb21waWxlciBjYW4gY29udmVy
dCB0aGlzIHRvIGEKc2hpZnQuCgo+ICsgICAgICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGly
cXMoKTsKCkNhcmVmdWwgLSBpcyB0aGlzIHZhbGlkIHdpdGggYSBzcGluIGxvY2sgaGVsZD8gTm90
ZSBob3cgZS5nLgpkdW1wX2RvbWFpbnMoKSBob2xkcyBhbiBSQ1UgbG9jayBvbmx5LgoKSmFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
