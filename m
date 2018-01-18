From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm: more sure APIC assist is aborted
 if guest EOIs APIC
Date: Thu, 18 Jan 2018 01:32:57 -0700
Message-ID: <5A6069C9020000780019FB8D@prv-mh.provo.novell.com>
References: <20180117125353.3301-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udw+=en=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ec5dD-00088J-NE
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 08:33:07 +0000
In-Reply-To: <20180117125353.3301-1-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE4IGF0IDEzOjUzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL3ZsYXBpYy5jCj4gQEAgLTQyMiw2ICs0MjIsMTMgQEAgdm9pZCB2bGFwaWNfRU9JX3NldChz
dHJ1Y3QgdmxhcGljICp2bGFwaWMpCj4gICAgICBpZiAoIHZlY3RvciA9PSAtMSApCj4gICAgICAg
ICAgcmV0dXJuOwo+ICAKPiArICAgIC8qCj4gKyAgICAgKiBJdCBpcyBwb3NzaWJsZSB0aGF0IEFQ
SUMgYXNzaXN0IGhhcyBiZWVuIGVuYWJsZWQgYnkgdGhlIGd1ZXN0IGJ1dAo+ICsgICAgICogaXQg
aGFzIGNob3NlbiBub3QgdG8gdXNlIGl0LCBieSBFT0lpbmcgbm9ybWFsbHkuIEl0IGlzIHRoZXJl
Zm9yZQo+ICsgICAgICogbmVjZXNzYXJ5IHRvIGFib3J0IGFueSBBUElDIGFzc2lzdCB0aGF0IG1h
eSBoYXZlIGJlZW4gc3RhcnRlZAo+ICsgICAgICogdG8gYXZvaWQgY29uZnVzaW5nIHRoZSBzdGF0
ZSBtYWNoaW5lLgo+ICsgICAgICovCj4gKyAgICB2aXJpZGlhbl9hYm9ydF9hcGljX2Fzc2lzdCh2
bGFwaWNfdmNwdSh2bGFwaWMpKTsKPiAgICAgIHZsYXBpY19jbGVhcl92ZWN0b3IodmVjdG9yLCAm
dmxhcGljLT5yZWdzLT5kYXRhW0FQSUNfSVNSXSk7CgpGdW5kYW1lbnRhbGx5IGZpbmUsIGJ1dCBp
cyBjbGVhcmluZyBiaXQgMCBpbiB0aGUgc2hhcmVkIGxvY2F0aW9uIGEKdmFsaWQgdGhpbmcgdG8g
ZG8gaW4gdGhpcyBjYXNlPyBQbHVzIHNob3VsZG4ndCB5b3UgcGFzcyBpbiB0aGUgdmVjdG9yLApz
byB0aGUgYWJvcnQgd291bGQgb25seSBoYXBwZW4gZm9yIHRoZSB2ZXJ5IHZlY3RvciB0aGF0IGlz
IHBlbmRpbmc/CklpcmMgd2l0aCBuZXN0ZWQgaW50ZXJydXB0cyBub3JtYWwgRU9JIG1pZ2h0IHN0
aWxsIG5lZWQgdG8gYmUgdXNlZApieSBXaW5kb3dzIChhcyBvbmx5IGEgc2luZ2xlIHZlY3RvciBj
YW4gYmUgaW4gZmxpZ2h0IGluIHRoZSBhc3Npc3QpLCBzbwpjbGVhcmluZyB0aGUgYXNzaXN0IGZv
ciB0aGUgd3JvbmcgdmVjdG9yIG1pZ2h0IGFjdHVhbGx5IGNhdXNlIGhhcm0uCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
