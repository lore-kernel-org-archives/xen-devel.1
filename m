From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 09/15] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Thu, 10 Jan 2019 23:12:52 -0800
Message-ID: <CACMJ4GaAGg5tEHToSE1U1cWy5TUa3U+KKkUNirhica9pCN7Yxw@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-10-git-send-email-christopher.w.clark@gmail.com>
 <20190110214106.aswi6vcsb2bpv2hv@legion>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qd1d=PT=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ghr06-00007o-Pj
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 07:13:06 +0000
Received: by mail-lj1-x22e.google.com with SMTP id k15-v6so11980798ljc.8
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 23:13:05 -0800 (PST)
In-Reply-To: <20190110214106.aswi6vcsb2bpv2hv@legion>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall@arm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Rich Persaud <persaur@gmail.com>, Ross Philipson <ross.philipson@gmail.com>, James McKenzie <james@bromium.com>, Daniel Smith <dpsmith@apertussolutions.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgMTo0MSBQTSBFcmljIENoYW51ZGV0IDxlcmljLmNoYW51
ZGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiAwNi8wMS8xOSBhdCAxMTo0MnBtLCBDaHJpc3Rv
cGhlciBDbGFyayB3cm90ZToKPiA+K21lbWNweV90b19ndWVzdF9yaW5nKHN0cnVjdCBhcmdvX3Jp
bmdfaW5mbyAqcmluZ19pbmZvLCB1aW50MzJfdCBvZmZzZXQsCj4gPisgICAgICAgICAgICAgICAg
ICAgICBjb25zdCB2b2lkICpzcmMsIFhFTl9HVUVTVF9IQU5ETEUodWludDhfdCkgc3JjX2huZCwK
PiA+KyAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGxlbikKPiA+K3sKPiA+KyAgICB1bnNp
Z25lZCBpbnQgbWZuc19pbmRleCA9IG9mZnNldCA+PiBQQUdFX1NISUZUOwo+ID4rICAgIHZvaWQg
KmRzdDsKPiA+KyAgICBpbnQgcmV0Owo+ID4rICAgIHVuc2lnbmVkIGludCBzcmNfb2Zmc2V0ID0g
MDsKPiA+Kwo+ID4rICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmcmluZ19pbmZvLT5sb2NrKSk7
Cj4gPisKPiA+KyAgICBvZmZzZXQgJj0gflBBR0VfTUFTSzsKPiA+Kwo+ID4rICAgIGlmICggKGxl
biA+IFhFTl9BUkdPX01BWF9SSU5HX1NJWkUpIHx8IChvZmZzZXQgPiBYRU5fQVJHT19NQVhfUklO
R19TSVpFKSApCj4gPisgICAgICAgIHJldHVybiAtRUZBVUxUOwo+IFdpdGggb2Zmc2V0IDwgUEFH
RV9TSVpFIHdpdGggdGhlIHByZXZpb3VzIG1hc2ssIHNob3VsZG4ndCB0aGUgc2FuaXR5Cj4gY2hl
Y2sgYmU6Cj4gICAgIGlmIChsZW4gKyBvZmZzZXQgPiBYRU5fQVJHT19NQVhfUklOR19TSVpFKQoK
WWVzLCB0aGF0J3MgY29ycmVjdCAtIHRoYW5rcy4KSSdsbCBzd2l0Y2ggdGhlIGxlbiBhbmQgb2Zm
c2V0IGFyZ3VtZW50cyB0byB1bnNpZ25lZCBpbnQgd2hpbGUgYXQgaXQuCgpDaHJpc3RvcGhlcgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
