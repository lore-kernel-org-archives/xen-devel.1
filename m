From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v5 2/3] x86/altp2m: Add a hvmop for setting
 the suppress #VE bit
Date: Sun, 23 Sep 2018 17:33:36 +0100
Message-ID: <CAFLBxZaR3Ugx=OJny=qgvb_AxWkUa3KgsA200mskOCW9Pxv3NQ@mail.gmail.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-3-apop@bitdefender.com>
 <4e54473d-1233-7d8c-17b8-b4bd949bf380@citrix.com>
 <2530a1bc-aa84-87ea-5ba2-8141747d6500@bitdefender.com>
 <CAFLBxZY0am2E01iLpZDcboFG7a1-S47Dwnd-qjp5YqQxGAdejQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ei9l=mf=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1g47KR-00024W-5W
 for xen-devel@lists.xenproject.org; Sun, 23 Sep 2018 16:33:51 +0000
Received: by mail-qt1-x842.google.com with SMTP id c25-v6so842757qtp.6
 for <xen-devel@lists.xenproject.org>; Sun, 23 Sep 2018 09:33:49 -0700 (PDT)
In-Reply-To: <CAFLBxZY0am2E01iLpZDcboFG7a1-S47Dwnd-qjp5YqQxGAdejQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

U29ycnksIGxvb2tzIGxpa2UgdGhpcyBtYXkgbm90IGhhdmUgZ29uZSB0aHJvdWdoLgogLUcKT24g
VGh1LCBTZXAgMjAsIDIwMTggYXQgNTowOCBQTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMjAsIDIwMTggYXQgNDo1MyBQTSBS
YXp2YW4gQ29qb2NhcnUKPiA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gT24gOS8yMC8xOCAyOjM0IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+ID4gPj4gK2ludCBw
Mm1fc2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgYm9vbCBzdXBw
cmVzc192ZSwKPiA+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYWx0
cDJtX2lkeCkKPiA+ID4gVGhpcyBzaG91bGQgY2xlYXJseSBiZSBpbiBwMm0uYywgYW5kLi4uCj4g
PiA+Cj4gPiA+PiArewo+ID4gPj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdF9wMm0gPSBw
Mm1fZ2V0X2hvc3RwMm0oZCk7Cj4gPiA+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICphcDJtID0g
TlVMTDsKPiA+ID4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKnAybTsKPiA+ID4+ICsgICAgbWZu
X3QgbWZuOwo+ID4gPj4gKyAgICBwMm1fYWNjZXNzX3QgYTsKPiA+ID4+ICsgICAgcDJtX3R5cGVf
dCB0Owo+ID4gPj4gKyAgICBpbnQgcmM7Cj4gPiA+PiArCj4gPiA+PiArICAgIGlmICggIWNwdV9o
YXNfdm14X3ZpcnRfZXhjZXB0aW9ucyApCj4gPiA+PiArICAgICAgICByZXR1cm4gLUVPUE5PVFNV
UFA7Cj4gPiA+IFdlIHNob3VsZCBhdm9pZCBJbnRlbC1zcGVjaWZpYyBjaGVja3MgaW4gY29tbW9u
IGNvZGUuCj4gPiA+Cj4gPiA+IEluIGZhY3QsIHRoaXMgaXMgd3JvbmcsIGJlY2F1c2UgeW91IGNh
biBjaG9vc2UgdG8gcnVuIGEgZ3Vlc3QgaW4gc2hhZG93Cj4gPiA+IG1vZGUgZXZlbiBvbiBhIHN5
c3RlbSB3aXRoIHZpcnQgZXhjZXB0aW9ucyAtLSBpbiB3aGljaCBjYXNlIHlvdSdkCj4gPiA+IHRy
aWdnZXIgdGhlIEFTU0VSVCgpIGluIHAybS1wdC5jOnAybV9wdF9zZXRfZW50cnkoKS4KPiA+ID4K
PiA+ID4gUHJvYmFibHkgd2hhdCBzaG91bGQgaGFwcGVuIGlzIHRoYXQgd2Ugc2hvdWxkIG1vdmUg
dGhlIHZteCBjaGVjayBpbnRvCj4gPiA+IHAybS1lcHQuYzpwMm1fZXB0X3NldF9lbnRyeSgpLCBh
bmQgcmVwbGFjZSB0aGUgQVNTRVJUKHN2ZSA9IDApIGluCj4gPiA+IHAybS1wdC5jOnAybV9wdF9z
ZXRfZW50cnkoKSB3aXRoICJpZiAoIHN2ZSAhPSAwICkgcmV0dXJuIC1FTk9UU1VQUDsiLgo+ID4g
Pgo+ID4gPiBBbHRob3VnaCB3aGF0IHNob3VsZCBwcm9iYWJseSAqcmVhbGx5KiBoYXBwZW4gaXMg
dGhhdAo+ID4gPiBgSFZNT1BfYWx0cDJtX3ZjcHVfZW5hYmxlX25vdGlmeWAgc2hvdWxkIGZhaWwg
d2l0aCAtRU9QTk9UU1VQUCBpbnN0ZWFkCj4gPiA+IG9mIHNpbGVudGx5IHN1Y2NlZWRpbmcuCj4g
Pgo+ID4gRG8geW91IG1lYW4gSFZNT1BfYWx0cDJtX3NldF9zdXBwcmVzc192ZSBoZXJlLCBvciBh
bSBJIG1pc3VuZGVyc3RhbmRpbmcKPiA+IHlvdXIgY29tbWVudD8gSSdtIGhhcHB5IHRvIGRvIHRo
ZSBleGFjdCBtb2RpZmljYXRpb25zIHlvdSd2ZSByZXF1ZXN0ZWQKPiA+IGFib3ZlIGJ1dCBJJ20g
YWZyYWlkIEkgZG9uJ3QgZm9sbG93IHRoZSBIVk1PUF9hbHRwMm1fdmNwdV9lbmFibGVfbm90aWZ5
Cj4gPiBjb21tZW50Lgo+Cj4gQXQgdGhlIG1vbWVudCwgaXQgYXBwZWFycyB0aGF0IHlvdSBjYW4g
Y2FsbAo+IEhWTU9QX2FsdHAybV92Y3B1X2VuYWJsZV9ub3RpZnkgdG8gc2V0IGEgdmNwdSdzIHZl
aW5mb19nZm4gZXZlbiBpZiB0aGUKPiBoYXJkd2FyZSBvciB0aGUgcDJtIG1vZGUgZG9lc24ndCBz
dXBwb3J0ICNWRS4gIEl0IHdvdWxkIGJlIGJldHRlciBpZgo+IGNhbGxlcnMgZ290IHRoZSAtRU9Q
Tk9UU1VQUCBlcnJvciBhdCB0aGF0IHBvaW50LCByYXRoZXIgdGhhbiBoYXZpbmcKPiB2Y3B1X2Vu
YWJsZV9ub3RpZnkgc3VjY2VlZCBhbmQgdGhlbiBoYXZpbmcgc2V0X3N1cHByZXNzX3ZlIGZhaWwu
Cj4KPiBUbyBiZSBjbGVhciwgSSdtIG5vdCByZXF1aXJpbmcgdGhhdCBhcyBhIGNsZWFuLXVwLCBJ
J20ganVzdCBzYXlpbmcKPiB0aGF0IHN1Y2ggYSBjaGFuZ2Ugd291bGQgYmUgYW4gaW1wcm92ZW1l
bnQgKHdoaWNoIHlvdSBtYXkgY29uc2lkZXIKPiBkb2luZyBpZiB5b3Ugd2lzaCkuCj4KPiAgLUdl
b3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
