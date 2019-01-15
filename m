From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 08/15] argo: implement the unregister op
Date: Tue, 15 Jan 2019 00:11:58 -0800
Message-ID: <CACMJ4GYeHDa8==YY=3oVst57gW5xemGs=Y=iNuW-e-dHixvTOA@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-9-git-send-email-christopher.w.clark@gmail.com>
 <5C3CA56B020000780020D569@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rejp=PX=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gjJpW-0005Ng-9f
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 08:12:14 +0000
Received: by mail-lj1-x244.google.com with SMTP id k19-v6so1483270lji.11
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jan 2019 00:12:12 -0800 (PST)
In-Reply-To: <5C3CA56B020000780020D569@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgNzowNiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDA3LjAxLjE5IGF0IDA4OjQyLCA8Y2hyaXN0b3BoZXIu
dy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gQEAgLTY2Niw2ICs2NjcsMTA1IEBAIHJpbmdf
ZmluZF9pbmZvKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBhcmdvX3Jpbmdf
aWQgKmlkKQo+ID4gICAgICByZXR1cm4gTlVMTDsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBzdHJ1
Y3QgYXJnb19zZW5kX2luZm8gKgo+ID4gK3NlbmRfZmluZF9pbmZvKGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQsIGNvbnN0IHN0cnVjdCBhcmdvX3JpbmdfaWQgKmlkKQo+Cj4gQXMgcGVyIHRoZSBjb21t
ZW50IG9uIHBhdGNoIDcsIHBlcmhhcHMgZmluZF9zZW5kX2luZm8oKT8KCmFjaywgeWVzLCByZW5h
bWVkLgoKPgo+ID4gK3sKPiA+ICsgICAgc3RydWN0IGhsaXN0X25vZGUgKm5vZGU7Cj4KPiBjb25z
dD8KCnVuZGVyc3Rvb2Q7IG5vdCBnb3QgdGhpcyBvbmUgZG9uZSB5ZXQsIGJ1dCB5ZXMuCgo+Cj4g
PiArc3RhdGljIGxvbmcKPiA+ICt1bnJlZ2lzdGVyX3Jpbmcoc3RydWN0IGRvbWFpbiAqY3VycmQs
Cj4gPiArICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2FyZ29fdW5y
ZWdpc3Rlcl9yaW5nX3QpIHVucmVnX2huZCkKPiA+ICt7Cj4gPiArICAgIHhlbl9hcmdvX3VucmVn
aXN0ZXJfcmluZ190IHVucmVnOwo+ID4gKyAgICBzdHJ1Y3QgYXJnb19yaW5nX2lkIHJpbmdfaWQ7
Cj4gPiArICAgIHN0cnVjdCBhcmdvX3JpbmdfaW5mbyAqcmluZ19pbmZvOwo+ID4gKyAgICBzdHJ1
Y3QgYXJnb19zZW5kX2luZm8gKnNlbmRfaW5mbzsKPiA+ICsgICAgc3RydWN0IGRvbWFpbiAqZHN0
X2QgPSBOVUxMOwo+ID4gKyAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICByZXQgPSBjb3B5X2Zy
b21fZ3Vlc3QoJnVucmVnLCB1bnJlZ19obmQsIDEpID8gLUVGQVVMVCA6IDA7Cj4gPiArICAgIGlm
ICggcmV0ICkKPiA+ICsgICAgICAgIGdvdG8gb3V0Owo+ID4gKwo+ID4gKyAgICByZXQgPSB1bnJl
Zy5wYWQgPyAtRUlOVkFMIDogMDsKPiA+ICsgICAgaWYgKCByZXQgKQo+ID4gKyAgICAgICAgZ290
byBvdXQ7Cj4gPiArCj4gPiArICAgIHJpbmdfaWQucGFydG5lcl9pZCA9IHVucmVnLnBhcnRuZXJf
aWQ7Cj4gPiArICAgIHJpbmdfaWQucG9ydCA9IHVucmVnLnBvcnQ7Cj4gPiArICAgIHJpbmdfaWQu
ZG9tYWluX2lkID0gY3VycmQtPmRvbWFpbl9pZDsKPiA+ICsKPiA+ICsgICAgcmVhZF9sb2NrKCZh
cmdvX2xvY2spOwo+ID4gKwo+ID4gKyAgICBpZiAoICFjdXJyZC0+YXJnbyApCj4gPiArICAgIHsK
PiA+ICsgICAgICAgIHJldCA9IC1FTk9ERVY7Cj4gPiArICAgICAgICBnb3RvIG91dF91bmxvY2s7
Cj4gPiArICAgIH0KPiA+ICsKPiA+ICsgICAgd3JpdGVfbG9jaygmY3VycmQtPmFyZ28tPmxvY2sp
Owo+ID4gKwo+ID4gKyAgICByaW5nX2luZm8gPSByaW5nX2ZpbmRfaW5mbyhjdXJyZCwgJnJpbmdf
aWQpOwo+ID4gKyAgICBpZiAoIHJpbmdfaW5mbyApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIHJp
bmdfcmVtb3ZlX2luZm8oY3VycmQsIHJpbmdfaW5mbyk7Cj4gPiArICAgICAgICBjdXJyZC0+YXJn
by0+cmluZ19jb3VudC0tOwo+ID4gKyAgICB9Cj4gPiArCj4gPiArICAgIGRzdF9kID0gZ2V0X2Rv
bWFpbl9ieV9pZChyaW5nX2lkLnBhcnRuZXJfaWQpOwo+ID4gKyAgICBpZiAoIGRzdF9kICkKPiA+
ICsgICAgewo+ID4gKyAgICAgICAgaWYgKCBkc3RfZC0+YXJnbyApCj4gPiArICAgICAgICB7Cj4g
PiArICAgICAgICAgICAgc3Bpbl9sb2NrKCZkc3RfZC0+YXJnby0+c2VuZF9sb2NrKTsKPiA+ICsK
PiA+ICsgICAgICAgICAgICBzZW5kX2luZm8gPSBzZW5kX2ZpbmRfaW5mbyhkc3RfZCwgJnJpbmdf
aWQpOwo+ID4gKyAgICAgICAgICAgIGlmICggc2VuZF9pbmZvICkKPiA+ICsgICAgICAgICAgICB7
Cj4gPiArICAgICAgICAgICAgICAgIGhsaXN0X2RlbCgmc2VuZF9pbmZvLT5ub2RlKTsKPiA+ICsg
ICAgICAgICAgICAgICAgeGZyZWUoc2VuZF9pbmZvKTsKPiA+ICsgICAgICAgICAgICB9Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgc3Bpbl91bmxvY2soJmRzdF9kLT5hcmdvLT5zZW5kX2xvY2spOwo+
Cj4gQXMgcGVyIHRoZSBjb21tZW50IHRvIGFuIGVhcmxpZXIgcGF0Y2gsIGlmIGF0IGFsbCBwb3Nz
aWJsZSBjYWxsCj4gYWxsb2NhdGlvbiAoYW5kIGhlbmNlIGFsc28gZnJlZWluZykgZnVuY3Rpb25z
IHdpdGggYXMgbGl0dGxlCj4gbG9ja3MgaGVsZCBhcyBwb3NzaWJsZS4gUHVsbGluZyBpdCBvdXQg
b2YgdGhlIGlubmVybW9zdCBsb2NrCj4gaGVyZSBsb29rcyBzdHJhaWdodGZvcndhcmQgYXQgbGVh
c3QuCgphY2ssIGhhdmUgcHVsbGVkIGl0IG91dCBvZiBib3RoIEwycyBub3cgd2hpY2ggd2lsbCBo
ZWxwLgoKdGhhbmtzCgpDaHJpc3RvcGhlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
