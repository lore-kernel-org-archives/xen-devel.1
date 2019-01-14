From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 08/15] argo: implement the unregister op
Date: Mon, 14 Jan 2019 08:06:19 -0700
Message-ID: <5C3CA56B020000780020D569@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-9-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gj3op-0008Sq-6b
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 15:06:27 +0000
In-Reply-To: <1546846968-7372-9-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDA4OjQyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IEBAIC02NjYsNiArNjY3LDEwNSBAQCByaW5nX2ZpbmRfaW5mbyhjb25zdCBzdHJ1
Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgYXJnb19yaW5nX2lkICppZCkKPiAgICAgIHJldHVy
biBOVUxMOwo+ICB9Cj4gIAo+ICtzdGF0aWMgc3RydWN0IGFyZ29fc2VuZF9pbmZvICoKPiArc2Vu
ZF9maW5kX2luZm8oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IGFyZ29fcmlu
Z19pZCAqaWQpCgpBcyBwZXIgdGhlIGNvbW1lbnQgb24gcGF0Y2ggNywgcGVyaGFwcyBmaW5kX3Nl
bmRfaW5mbygpPwoKPiArewo+ICsgICAgc3RydWN0IGhsaXN0X25vZGUgKm5vZGU7Cgpjb25zdD8K
Cj4gK3N0YXRpYyBsb25nCj4gK3VucmVnaXN0ZXJfcmluZyhzdHJ1Y3QgZG9tYWluICpjdXJyZCwK
PiArICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2FyZ29fdW5yZWdp
c3Rlcl9yaW5nX3QpIHVucmVnX2huZCkKPiArewo+ICsgICAgeGVuX2FyZ29fdW5yZWdpc3Rlcl9y
aW5nX3QgdW5yZWc7Cj4gKyAgICBzdHJ1Y3QgYXJnb19yaW5nX2lkIHJpbmdfaWQ7Cj4gKyAgICBz
dHJ1Y3QgYXJnb19yaW5nX2luZm8gKnJpbmdfaW5mbzsKPiArICAgIHN0cnVjdCBhcmdvX3NlbmRf
aW5mbyAqc2VuZF9pbmZvOwo+ICsgICAgc3RydWN0IGRvbWFpbiAqZHN0X2QgPSBOVUxMOwo+ICsg
ICAgaW50IHJldDsKPiArCj4gKyAgICByZXQgPSBjb3B5X2Zyb21fZ3Vlc3QoJnVucmVnLCB1bnJl
Z19obmQsIDEpID8gLUVGQVVMVCA6IDA7Cj4gKyAgICBpZiAoIHJldCApCj4gKyAgICAgICAgZ290
byBvdXQ7Cj4gKwo+ICsgICAgcmV0ID0gdW5yZWcucGFkID8gLUVJTlZBTCA6IDA7Cj4gKyAgICBp
ZiAoIHJldCApCj4gKyAgICAgICAgZ290byBvdXQ7Cj4gKwo+ICsgICAgcmluZ19pZC5wYXJ0bmVy
X2lkID0gdW5yZWcucGFydG5lcl9pZDsKPiArICAgIHJpbmdfaWQucG9ydCA9IHVucmVnLnBvcnQ7
Cj4gKyAgICByaW5nX2lkLmRvbWFpbl9pZCA9IGN1cnJkLT5kb21haW5faWQ7Cj4gKwo+ICsgICAg
cmVhZF9sb2NrKCZhcmdvX2xvY2spOwo+ICsKPiArICAgIGlmICggIWN1cnJkLT5hcmdvICkKPiAr
ICAgIHsKPiArICAgICAgICByZXQgPSAtRU5PREVWOwo+ICsgICAgICAgIGdvdG8gb3V0X3VubG9j
azsKPiArICAgIH0KPiArCj4gKyAgICB3cml0ZV9sb2NrKCZjdXJyZC0+YXJnby0+bG9jayk7Cj4g
Kwo+ICsgICAgcmluZ19pbmZvID0gcmluZ19maW5kX2luZm8oY3VycmQsICZyaW5nX2lkKTsKPiAr
ICAgIGlmICggcmluZ19pbmZvICkKPiArICAgIHsKPiArICAgICAgICByaW5nX3JlbW92ZV9pbmZv
KGN1cnJkLCByaW5nX2luZm8pOwo+ICsgICAgICAgIGN1cnJkLT5hcmdvLT5yaW5nX2NvdW50LS07
Cj4gKyAgICB9Cj4gKwo+ICsgICAgZHN0X2QgPSBnZXRfZG9tYWluX2J5X2lkKHJpbmdfaWQucGFy
dG5lcl9pZCk7Cj4gKyAgICBpZiAoIGRzdF9kICkKPiArICAgIHsKPiArICAgICAgICBpZiAoIGRz
dF9kLT5hcmdvICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHNwaW5fbG9jaygmZHN0X2Qt
PmFyZ28tPnNlbmRfbG9jayk7Cj4gKwo+ICsgICAgICAgICAgICBzZW5kX2luZm8gPSBzZW5kX2Zp
bmRfaW5mbyhkc3RfZCwgJnJpbmdfaWQpOwo+ICsgICAgICAgICAgICBpZiAoIHNlbmRfaW5mbyAp
Cj4gKyAgICAgICAgICAgIHsKPiArICAgICAgICAgICAgICAgIGhsaXN0X2RlbCgmc2VuZF9pbmZv
LT5ub2RlKTsKPiArICAgICAgICAgICAgICAgIHhmcmVlKHNlbmRfaW5mbyk7Cj4gKyAgICAgICAg
ICAgIH0KPiArCj4gKyAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZkc3RfZC0+YXJnby0+c2VuZF9s
b2NrKTsKCkFzIHBlciB0aGUgY29tbWVudCB0byBhbiBlYXJsaWVyIHBhdGNoLCBpZiBhdCBhbGwg
cG9zc2libGUgY2FsbAphbGxvY2F0aW9uIChhbmQgaGVuY2UgYWxzbyBmcmVlaW5nKSBmdW5jdGlv
bnMgd2l0aCBhcyBsaXR0bGUKbG9ja3MgaGVsZCBhcyBwb3NzaWJsZS4gUHVsbGluZyBpdCBvdXQg
b2YgdGhlIGlubmVybW9zdCBsb2NrCmhlcmUgbG9va3Mgc3RyYWlnaHRmb3J3YXJkIGF0IGxlYXN0
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
