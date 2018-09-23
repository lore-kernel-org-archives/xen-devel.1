From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5 2/3] x86/altp2m: Add a hvmop for setting
 the suppress #VE bit
Date: Sun, 23 Sep 2018 20:09:00 +0300
Message-ID: <b3b923d9-e370-b902-4a8d-c2b83ec9c4c6@bitdefender.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-3-apop@bitdefender.com>
 <4e54473d-1233-7d8c-17b8-b4bd949bf380@citrix.com>
 <2530a1bc-aa84-87ea-5ba2-8141747d6500@bitdefender.com>
 <CAFLBxZY0am2E01iLpZDcboFG7a1-S47Dwnd-qjp5YqQxGAdejQ@mail.gmail.com>
 <CAFLBxZaR3Ugx=OJny=qgvb_AxWkUa3KgsA200mskOCW9Pxv3NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sqn8=mf=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g47sV-0004Q8-2Q
 for xen-devel@lists.xenproject.org; Sun, 23 Sep 2018 17:09:03 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 30211305FFA8
 for <xen-devel@lists.xenproject.org>; Sun, 23 Sep 2018 20:09:01 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 1BEE47FBF3
 for <xen-devel@lists.xenproject.org>; Sun, 23 Sep 2018 20:09:01 +0300 (EEST)
In-Reply-To: <CAFLBxZaR3Ugx=OJny=qgvb_AxWkUa3KgsA200mskOCW9Pxv3NQ@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMy8xOCA3OjMzIFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IFNvcnJ5LCBsb29rcyBs
aWtlIHRoaXMgbWF5IG5vdCBoYXZlIGdvbmUgdGhyb3VnaC4KPiAgLUcKPiBPbiBUaHUsIFNlcCAy
MCwgMjAxOCBhdCA1OjA4IFBNIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT4gd3JvdGU6Cj4+Cj4+IE9uIFRodSwgU2VwIDIwLCAyMDE4IGF0IDQ6NTMgUE0gUmF6dmFuIENv
am9jYXJ1Cj4+IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+Cj4+PiBPbiA5
LzIwLzE4IDI6MzQgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4+ICtpbnQgcDJtX3NldF9z
dXBwcmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIGJvb2wgc3VwcHJlc3NfdmUs
Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYWx0cDJtX2lkeCkK
Pj4+PiBUaGlzIHNob3VsZCBjbGVhcmx5IGJlIGluIHAybS5jLCBhbmQuLi4KPj4+Pgo+Pj4+PiAr
ewo+Pj4+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpob3N0X3AybSA9IHAybV9nZXRfaG9zdHAy
bShkKTsKPj4+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSA9IE5VTEw7Cj4+Pj4+ICsg
ICAgc3RydWN0IHAybV9kb21haW4gKnAybTsKPj4+Pj4gKyAgICBtZm5fdCBtZm47Cj4+Pj4+ICsg
ICAgcDJtX2FjY2Vzc190IGE7Cj4+Pj4+ICsgICAgcDJtX3R5cGVfdCB0Owo+Pj4+PiArICAgIGlu
dCByYzsKPj4+Pj4gKwo+Pj4+PiArICAgIGlmICggIWNwdV9oYXNfdm14X3ZpcnRfZXhjZXB0aW9u
cyApCj4+Pj4+ICsgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4+PiBXZSBzaG91bGQgYXZv
aWQgSW50ZWwtc3BlY2lmaWMgY2hlY2tzIGluIGNvbW1vbiBjb2RlLgo+Pj4+Cj4+Pj4gSW4gZmFj
dCwgdGhpcyBpcyB3cm9uZywgYmVjYXVzZSB5b3UgY2FuIGNob29zZSB0byBydW4gYSBndWVzdCBp
biBzaGFkb3cKPj4+PiBtb2RlIGV2ZW4gb24gYSBzeXN0ZW0gd2l0aCB2aXJ0IGV4Y2VwdGlvbnMg
LS0gaW4gd2hpY2ggY2FzZSB5b3UnZAo+Pj4+IHRyaWdnZXIgdGhlIEFTU0VSVCgpIGluIHAybS1w
dC5jOnAybV9wdF9zZXRfZW50cnkoKS4KPj4+Pgo+Pj4+IFByb2JhYmx5IHdoYXQgc2hvdWxkIGhh
cHBlbiBpcyB0aGF0IHdlIHNob3VsZCBtb3ZlIHRoZSB2bXggY2hlY2sgaW50bwo+Pj4+IHAybS1l
cHQuYzpwMm1fZXB0X3NldF9lbnRyeSgpLCBhbmQgcmVwbGFjZSB0aGUgQVNTRVJUKHN2ZSA9IDAp
IGluCj4+Pj4gcDJtLXB0LmM6cDJtX3B0X3NldF9lbnRyeSgpIHdpdGggImlmICggc3ZlICE9IDAg
KSByZXR1cm4gLUVOT1RTVVBQOyIuCj4+Pj4KPj4+PiBBbHRob3VnaCB3aGF0IHNob3VsZCBwcm9i
YWJseSAqcmVhbGx5KiBoYXBwZW4gaXMgdGhhdAo+Pj4+IGBIVk1PUF9hbHRwMm1fdmNwdV9lbmFi
bGVfbm90aWZ5YCBzaG91bGQgZmFpbCB3aXRoIC1FT1BOT1RTVVBQIGluc3RlYWQKPj4+PiBvZiBz
aWxlbnRseSBzdWNjZWVkaW5nLgo+Pj4KPj4+IERvIHlvdSBtZWFuIEhWTU9QX2FsdHAybV9zZXRf
c3VwcHJlc3NfdmUgaGVyZSwgb3IgYW0gSSBtaXN1bmRlcnN0YW5kaW5nCj4+PiB5b3VyIGNvbW1l
bnQ/IEknbSBoYXBweSB0byBkbyB0aGUgZXhhY3QgbW9kaWZpY2F0aW9ucyB5b3UndmUgcmVxdWVz
dGVkCj4+PiBhYm92ZSBidXQgSSdtIGFmcmFpZCBJIGRvbid0IGZvbGxvdyB0aGUgSFZNT1BfYWx0
cDJtX3ZjcHVfZW5hYmxlX25vdGlmeQo+Pj4gY29tbWVudC4KPj4KPj4gQXQgdGhlIG1vbWVudCwg
aXQgYXBwZWFycyB0aGF0IHlvdSBjYW4gY2FsbAo+PiBIVk1PUF9hbHRwMm1fdmNwdV9lbmFibGVf
bm90aWZ5IHRvIHNldCBhIHZjcHUncyB2ZWluZm9fZ2ZuIGV2ZW4gaWYgdGhlCj4+IGhhcmR3YXJl
IG9yIHRoZSBwMm0gbW9kZSBkb2Vzbid0IHN1cHBvcnQgI1ZFLiAgSXQgd291bGQgYmUgYmV0dGVy
IGlmCj4+IGNhbGxlcnMgZ290IHRoZSAtRU9QTk9UU1VQUCBlcnJvciBhdCB0aGF0IHBvaW50LCBy
YXRoZXIgdGhhbiBoYXZpbmcKPj4gdmNwdV9lbmFibGVfbm90aWZ5IHN1Y2NlZWQgYW5kIHRoZW4g
aGF2aW5nIHNldF9zdXBwcmVzc192ZSBmYWlsLgo+Pgo+PiBUbyBiZSBjbGVhciwgSSdtIG5vdCBy
ZXF1aXJpbmcgdGhhdCBhcyBhIGNsZWFuLXVwLCBJJ20ganVzdCBzYXlpbmcKPj4gdGhhdCBzdWNo
IGEgY2hhbmdlIHdvdWxkIGJlIGFuIGltcHJvdmVtZW50ICh3aGljaCB5b3UgbWF5IGNvbnNpZGVy
Cj4+IGRvaW5nIGlmIHlvdSB3aXNoKS4KClVuZGVzdG9vZCwgdGhhbmsgeW91IGZvciB0aGUgY2xh
cmlmaWNhdGlvbiEgV2UnbGwgZm9sbG93IHVwIHdpdGggYSBwYXRjaApvbiB0aGF0LgoKSSBoYXZl
IGluIHRoZSBtZWFudGltZSBzZW50IG91dCBhIHBhdGNoIHdpdGggdGhlIHJlcXVlc3RlZCBhbHRw
Mm0KY2xlYW51cCAoY29kZSBtb3ZlZCB0byBwMm0uYyBhbmQgY2hlY2tzIG1vdmVkIHRvIHAybS1l
cHQuYy4gSSBoYXZlbid0CnNlZW4gYSByZXBseSB0byBteSBxdWVzdGlvbiBhYm91dCB3aGV0aGVy
IHRoaXMgaXMgd2hhdCB5b3UgbWVhbnQKKHBlcmhhcHMgaXQgZ290IGxvc3QgYXMgd2VsbD8pLCBz
byBJIGhvcGUgSSd2ZSB1bmRlcnN0b29kIHlvdXIgcmVxdWVzdApjb3JyZWN0bHkuCgoKVGhhbmtz
LApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
