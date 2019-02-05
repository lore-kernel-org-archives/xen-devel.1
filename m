From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v7 10/15] argo: implement the notify op
Date: Mon, 4 Feb 2019 18:55:18 -0800
Message-ID: <CACMJ4GbDA1k-ZpA7nBWKM2P-r8Eu2xjwmEQRveUxMC0pL-UoVA@mail.gmail.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-11-git-send-email-christopher.w.clark@gmail.com>
 <5C58563C0200007800213B38@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4dBt=QM=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gqqta-0007jI-6U
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 02:55:34 +0000
Received: by mail-lj1-x241.google.com with SMTP id t9-v6so1661784ljh.6
 for <xen-devel@lists.xenproject.org>; Mon, 04 Feb 2019 18:55:32 -0800 (PST)
In-Reply-To: <5C58563C0200007800213B38@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgNCwgMjAxOSBhdCA3OjEyIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMzEuMDEuMTkgYXQgMDU6MjgsIDxjaHJpc3RvcGhlci53
LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBAQCAtMTgwMiw2ICsyMTU3LDIxIEBAIGRvX2Fy
Z29fb3AodW5zaWduZWQgaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcx
LAo+ID4gICAgICAgICAgYnJlYWs7Cj4gPiAgICAgIH0KPiA+Cj4gPiArICAgIGNhc2UgWEVOX0FS
R09fT1Bfbm90aWZ5Ogo+ID4gKyAgICB7Cj4gPiArICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BB
UkFNKHhlbl9hcmdvX3JpbmdfZGF0YV90KSByaW5nX2RhdGFfaG5kID0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgZ3Vlc3RfaGFuZGxlX2Nhc3QoYXJnMSwgeGVuX2FyZ29fcmluZ19kYXRhX3QpOwo+
ID4gKwo+ID4gKyAgICAgICAgaWYgKCB1bmxpa2VseSgoIWd1ZXN0X2hhbmRsZV9pc19udWxsKGFy
ZzIpKSB8fCBhcmczIHx8IGFyZzQpICkKPiA+ICsgICAgICAgIHsKPiA+ICsgICAgICAgICAgICBy
YyA9IC1FSU5WQUw7Cj4gPiArICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICB9Cj4gPiAr
Cj4gPiArICAgICAgICByYyA9IG5vdGlmeShjdXJyZCwgcmluZ19kYXRhX2huZCk7Cj4gPiArICAg
ICAgICBicmVhazsKPiA+ICsgICAgfQo+ID4gKwo+ID4gICAgICBkZWZhdWx0Ogo+ID4gICAgICAg
ICAgcmMgPSAtRU9QTk9UU1VQUDsKPiA+ICAgICAgICAgIGJyZWFrOwo+ID4gQEAgLTE5MTIsNiAr
MjI4MiwyMSBAQCBjb21wYXRfYXJnb19vcCh1bnNpZ25lZCBpbnQgY21kLCBYRU5fR1VFU1RfSEFO
RExFX1BBUkFNKHZvaWQpIGFyZzEsCj4gPiAgICAgICAgICBicmVhazsKPiA+ICAgICAgfQo+ID4K
PiA+ICsgICAgY2FzZSBYRU5fQVJHT19PUF9ub3RpZnk6Cj4gPiArICAgIHsKPiA+ICsgICAgICAg
IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2FyZ29fcmluZ19kYXRhX3QpIHJpbmdfZGF0YV9o
bmQgPQo+ID4gKyAgICAgICAgICAgICAgICAgICBndWVzdF9oYW5kbGVfY2FzdChhcmcxLCB4ZW5f
YXJnb19yaW5nX2RhdGFfdCk7Cj4gPiArCj4gPiArICAgICAgICBpZiAoIHVubGlrZWx5KCghZ3Vl
c3RfaGFuZGxlX2lzX251bGwoYXJnMikpIHx8IGFyZzMgfHwgYXJnNCkgKQo+ID4gKyAgICAgICAg
ewo+ID4gKyAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiA+ICsgICAgICAgICAgICBicmVhazsK
PiA+ICsgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgIHJjID0gbm90aWZ5KGN1cnJkLCByaW5n
X2RhdGFfaG5kKTsKPiA+ICsgICAgICAgIGJyZWFrOwo+ID4gKyAgICB9Cj4KPiBBdCB0aGUgZXhh
bXBsZSBvZiB0aGlzIChsaWtlbHkgYXBwbGllcyB0byBlYXJsaWVyIHBhdGNoZXMgYXMgbXVjaCk6
IEFyZW4ndAo+IHlvdSBhZnJhaWQgb2YgdGhpcyByZWN1cnJpbmcgZHVwbGljYXRpb24/IEl0J3Mg
cXVpdGUgZWFzeSwgZXNwZWNpYWxseSB3aGVuCj4gdGhlIGZ1bmN0aW9ucyBoZXJlIGdyb3cgYSBs
aXR0bGUgZnVydGhlciwgZm9yIHNvbWVvbmUgdG8gZm9yZ2V0IHVwZGF0aW5nCj4gb25lIChtb3Jl
IGxpa2VseSB0aGUgY29tcGF0IG9uZSBvYnZpb3VzbHkpLiBEaWQgeW91IGNvbnNpZGVyIGZvcndh
cmRpbmcKPiBhbGwgb3BlcmF0aW9ucyBub3QgbmVlZGluZyB0cmFuc2xhdGlvbiBzdHJhaWdodCBp
bnRvIGRvX2FyZ29fb3AoKSwgYW5kCj4gaGFuZGxpbmcgb25seSB0aGUgc2VuZHYgb25lIGhlcmU/
CgpBY2ssIG9rLgoKQ2hyaXN0b3BoZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
