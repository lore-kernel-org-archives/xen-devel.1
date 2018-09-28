From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/altp2m: propagate ept.ad changes to all
 active altp2ms
Date: Fri, 28 Sep 2018 08:52:27 -0600
Message-ID: <5BAE402B02000078001ECEEB@prv1-mh.provo.novell.com>
References: <1538135750-14222-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ucvl=mk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5u89-0005oA-UP
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 14:52:33 +0000
In-Reply-To: <1538135750-14222-1-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA5LjE4IGF0IDEzOjU1LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gQEAgLTEyMTgsMzQgKzEyMTksNjcgQEAgc3RhdGljIHZvaWQgZXB0X3RsYl9mbHVzaChz
dHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+ICAgICAgZXB0X3N5bmNfZG9tYWluX21hc2socDJtLCBw
Mm0tPmRvbWFpbi0+ZGlydHlfY3B1bWFzayk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIGVwdF9z
ZXRfYWRfc3luYyhzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBpbnQgdmFsdWUpCgpDYW4gdGhlIHNl
Y29uZCBwYXJhbWV0ZXIgYmUgYm9vbCBwbGVhc2UgKGFuZCB0aGUgdHJ1ZS9mYWxzZQphcmd1bWVu
dHMgaW4gdGhlIGNhbGxlcnMpPwoKPiArewo+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IHAybS0+
ZG9tYWluOwo+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4gKwo+ICsgICAgaWYgKCBsaWtlbHkoIWFs
dHAybV9hY3RpdmUoZCkpICkKPiArICAgIHsKPiArICAgICAgICBwMm1fbG9jayhwMm0pOwo+ICsg
ICAgICAgIHAybS0+ZXB0LmFkID0gdmFsdWU7Cj4gKyAgICAgICAgcDJtX3VubG9jayhwMm0pOwo+
ICsKPiArICAgICAgICByZXR1cm47Cj4gKyAgICB9CgpXaHkgd291bGQgeW91IHdhbnQgdG8gc2tp
cCB1cGRhdGluZyB0aGUgaG9zdCBwMm0ncyBmbGFnIHdoZW4KYWx0cDJtIGlzIGFjdGl2ZT8KCj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5j
Cj4gQEAgLTM2MCwxMSArMzYwLDcgQEAgdm9pZCBwMm1fZW5hYmxlX2hhcmR3YXJlX2xvZ19kaXJ0
eShzdHJ1Y3QgZG9tYWluICpkKQo+ICAgICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IHAybV9n
ZXRfaG9zdHAybShkKTsKPiAgCj4gICAgICBpZiAoIHAybS0+ZW5hYmxlX2hhcmR3YXJlX2xvZ19k
aXJ0eSApCj4gLSAgICB7Cj4gLSAgICAgICAgcDJtX2xvY2socDJtKTsKPiAgICAgICAgICBwMm0t
PmVuYWJsZV9oYXJkd2FyZV9sb2dfZGlydHkocDJtKTsKPiAtICAgICAgICBwMm1fdW5sb2NrKHAy
bSk7Cj4gLSAgICB9Cj4gIH0KPiAgCj4gIHZvaWQgcDJtX2Rpc2FibGVfaGFyZHdhcmVfbG9nX2Rp
cnR5KHN0cnVjdCBkb21haW4gKmQpCj4gQEAgLTM3MiwxMSArMzY4LDcgQEAgdm9pZCBwMm1fZGlz
YWJsZV9oYXJkd2FyZV9sb2dfZGlydHkoc3RydWN0IGRvbWFpbiAqZCkKPiAgICAgIHN0cnVjdCBw
Mm1fZG9tYWluICpwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7Cj4gIAo+ICAgICAgaWYgKCBwMm0t
PmRpc2FibGVfaGFyZHdhcmVfbG9nX2RpcnR5ICkKPiAtICAgIHsKPiAtICAgICAgICBwMm1fbG9j
ayhwMm0pOwo+ICAgICAgICAgIHAybS0+ZGlzYWJsZV9oYXJkd2FyZV9sb2dfZGlydHkocDJtKTsK
PiAtICAgICAgICBwMm1fdW5sb2NrKHAybSk7Cj4gLSAgICB9Cj4gIH0KCkkgZG9uJ3QgdW5kZXJz
dGFuZCBob3cgdGhpcyByZW1vdmFsIGNhbiBiZSBjb3JyZWN0LgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
