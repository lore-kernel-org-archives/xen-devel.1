From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 02/34] x86/HVM: grow MMIO cache data size
 to 64 bytes
Date: Fri, 26 Oct 2018 03:04:40 -0600
Message-ID: <5BD2D8A802000078001F4EEC@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BA0E58F02000078001E94CE@prv1-mh.provo.novell.com>
 <5BA0E74702000078001E952E@prv1-mh.provo.novell.com>
 <9c61c76a-3ea4-9d2e-3ba1-46fd81184a3d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n7n6=ng=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gFy2v-0005F9-Ck
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 09:04:45 +0000
In-Reply-To: <9c61c76a-3ea4-9d2e-3ba1-46fd81184a3d@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjEwLjE4IGF0IDIwOjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTgvMDkvMTggMTI6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGlzIGlzIG5l
ZWRlZCBiZWZvcmUgZW5hYmxpbmcgYW55IEFWWDUxMiBpbnNucyBpbiB0aGUgZW11bGF0b3IuIENo
YW5nZQo+PiB0aGUgd2F5IGFsaWdubWVudCBpcyBlbmZvcmNlZCBhdCB0aGUgc2FtZSB0aW1lLgo+
Pgo+PiBBZGQgYSBjaGVjayB0aGF0IHRoZSBidWZmZXIgd29uJ3QgYWN0dWFsbHkgb3ZlcmZsb3cs
IGFuZCB3aGlsZSBhdCBpdAo+PiBhbHNvIGNvbnZlcnQgdGhlIGNoZWNrIGZvciBhY2Nlc3NlcyB0
byBub3QgY3Jvc3MgcGFnZSBib3VuZGFyaWVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiB2MzogTmV3Lgo+Pgo+PiAtLS0gYS94
ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxh
dGUuYwo+PiBAQCAtODY2LDcgKzg2NiwxOCBAQCBzdGF0aWMgaW50IGh2bWVtdWxfcGh5c19tbWlv
X2FjY2VzcygKPj4gICAgICBpbnQgcmMgPSBYODZFTVVMX09LQVk7Cj4+ICAKPj4gICAgICAvKiBB
Y2Nlc3NlcyBtdXN0IGZhbGwgd2l0aGluIGEgcGFnZS4gKi8KPj4gLSAgICBCVUdfT04oKGdwYSAm
IH5QQUdFX01BU0spICsgc2l6ZSA+IFBBR0VfU0laRSk7Cj4+ICsgICAgaWYgKCAoZ3BhICYgflBB
R0VfTUFTSykgKyBzaXplID4gUEFHRV9TSVpFICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIEFTU0VS
VF9VTlJFQUNIQUJMRSgpOwo+PiArICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7
Cj4+ICsgICAgfQo+PiArCj4+ICsgICAgLyogQWNjZXNzZXMgbXVzdCBub3Qgb3ZlcmZsb3cgdGhl
IGNhY2hlJ3MgYnVmZmVyLiAqLwo+PiArICAgIGlmICggc2l6ZSA+IHNpemVvZihjYWNoZS0+YnVm
ZmVyKSApCj4+ICsgICAgewo+PiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPj4gKyAg
ICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOwo+PiArICAgIH0KPj4gIAo+PiAgICAg
IC8qCj4+ICAgICAgICogaHZtZW11bF9kb19pbygpIGNhbm5vdCBoYW5kbGUgbm9uLXBvd2VyLW9m
LTIgYWNjZXNzZXMgb3IKPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oCj4+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZjcHUuaAo+PiBAQCAtNDIsMTUgKzQyLDE0
IEBAIHN0cnVjdCBodm1fdmNwdV9hc2lkIHsKPj4gIH07Cj4+ICAKPj4gIC8qCj4+IC0gKiBXZSBt
YXkgcmVhZCBvciB3cml0ZSB1cCB0byBtMjU2IGFzIGEgbnVtYmVyIG9mIGRldmljZS1tb2RlbAo+
PiArICogV2UgbWF5IHJlYWQgb3Igd3JpdGUgdXAgdG8gbTUxMiBhcyBhIG51bWJlciBvZiBkZXZp
Y2UtbW9kZWwKPj4gICAqIHRyYW5zYWN0aW9ucy4KPj4gICAqLwo+PiAgc3RydWN0IGh2bV9tbWlv
X2NhY2hlIHsKPj4gICAgICB1bnNpZ25lZCBsb25nIGdsYTsKPj4gICAgICB1bnNpZ25lZCBpbnQg
c2l6ZTsKPj4gICAgICB1aW50OF90IGRpcjsKPj4gLSAgICB1aW50OF90IHBhZFszXTsgLyogbWFr
ZSBidWZmZXJbXSBsb25nLWFsaWduZWQgKi8KPj4gLSAgICB1aW50OF90IGJ1ZmZlclszMl07Cj4+
ICsgICAgdWludDhfdCBidWZmZXJbNjRdIF9fYWxpZ25lZChzaXplb2YobG9uZykpOwo+IAo+IERv
bid0IHdlIHdhbnQgaXQgMTYtYnl0ZSBhbGlnbmVkLCByYXRoZXIgdGhhbiA4PwoKV2h5PyBXZSBk
b24ndCBhY2Nlc3MgdGhlIGJ1ZmZlciB2aWEgU0lNRCBpbnNucy4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
