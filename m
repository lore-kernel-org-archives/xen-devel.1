From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Date: Thu, 14 Mar 2019 07:38:39 -0600
Message-ID: <5C8A595F020000780021EA4E@prv1-mh.provo.novell.com>
References: <20190314130111.32603-1-paul.durrant@citrix.com>
 <20190314130111.32603-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4QZJ-0005oP-3o
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 13:38:45 +0000
In-Reply-To: <20190314130111.32603-2-paul.durrant@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDE0OjAxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC0xMjE1LDEwICsxMTk2LDE1IEBAIHN0YXRpYyBib29sIHZteF9zZXRfZ3Vlc3RfYm5k
Y2ZncyhzdHJ1Y3QgdmNwdSAqdiwgdTY0IHZhbCkKPiAgICAgIHJldHVybiB0cnVlOwo+ICB9Cj4g
IAo+IC1zdGF0aWMgYm9vbCB2bXhfZ2V0X2d1ZXN0X2JuZGNmZ3Moc3RydWN0IHZjcHUgKnYsIHU2
NCAqdmFsKQo+ICtzdGF0aWMgYm9vbCB2bXhfZ2V0X2d1ZXN0X2JuZGNmZ3MoY29uc3Qgc3RydWN0
IHZjcHUgKmN2LCB1NjQgKnZhbCkKPiAgewo+ICsgICAgc3RydWN0IHZjcHUgKnY7Cj4gKwo+ICAg
ICAgQVNTRVJUKGNwdV9oYXNfbXB4ICYmIGNwdV9oYXNfdm14X21weCk7Cj4gIAo+ICsgICAgLyog
R2V0IGEgbm9uLWNvbnN0IHBvaW50ZXIgZm9yIHZteF92bWNzX2VudGVyKCkgKi8KPiArICAgIHYg
PSBjdi0+ZG9tYWluLT52Y3B1W2N2LT52Y3B1X2lkXTsKCkFueSBjaGFuY2UgdGhpcyBjb3VsZCBi
ZSBtYWRlIHRoZSBpbml0aWFsaXplciBvZiB0aGUgdmFyaWFibGU/Cgo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tc3IuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwo+IEBAIC0xNjAsNiArMTYwLDEy
IEBAIGludCBndWVzdF9yZG1zcihjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNyLCB1
aW50NjRfdCAqdmFsKQo+ICAgICAgICAgIHJldCA9IGd1ZXN0X3JkbXNyX3gyYXBpYyh2LCBtc3Is
IHZhbCk7Cj4gICAgICAgICAgYnJlYWs7Cj4gIAo+ICsgICAgY2FzZSBNU1JfSUEzMl9CTkRDRkdT
Ogo+ICsgICAgICAgIGlmICggIWNwLT5mZWF0Lm1weCB8fCAhaHZtX2dldF9ndWVzdF9ibmRjZmdz
KHYsIHZhbCkgKQo+ICsgICAgICAgICAgICBnb3RvIGdwX2ZhdWx0OwoKRGlkbid0IHdlIHNldHRs
ZSBvbiBBU1NFUlQoaXNfaHZtXyopPwoKPiBAQCAtMzIzLDYgKzMyOSwxMiBAQCBpbnQgZ3Vlc3Rf
d3Jtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwgdWludDY0X3QgdmFsKQo+ICAgICAg
ICAgIHJldCA9IGd1ZXN0X3dybXNyX3gyYXBpYyh2LCBtc3IsIHZhbCk7Cj4gICAgICAgICAgYnJl
YWs7Cj4gIAo+ICsgICAgY2FzZSBNU1JfSUEzMl9CTkRDRkdTOgo+ICsgICAgICAgIGlmICggIWNw
LT5mZWF0Lm1weCB8fCAhaHZtX3NldF9ndWVzdF9ibmRjZmdzKHYsIHZhbCkgKQo+ICsgICAgICAg
ICAgICBnb3RvIGdwX2ZhdWx0OwoKU2FtZSBoZXJlPyBPciBkaWQgQW5kcmV3IHRlbGwgeW91IG90
aGVyd2lzZT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
