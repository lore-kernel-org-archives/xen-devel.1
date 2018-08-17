From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] rangeset: make inquiry functions tolerate NULL
 inputs
Date: Fri, 17 Aug 2018 03:20:11 -0600
Message-ID: <5B76934B02000078001DF480@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqavW-0007EA-Qv
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 09:20:14 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

UmF0aGVyIHRoYW4gc3BlY2lhbCBjYXNpbmcgdGhlIC0+aW9tZW1fY2FwcyBjaGVjayBpbiB4ODYn
cwpnZXRfcGFnZV9mcm9tX2wxZSgpIGZvciB0aGUgZG9tX3hlbiBjYXNlLCBsZXQncyBiZSBtb3Jl
IHRvbGVyYW50IGluCmdlbmVyYWwsIGFsb25nIHRoZSBsaW5lcyBvZiByYW5nZXNldF9pc19lbXB0
eSgpOiBBIG5ldmVyIGFsbG9jYXRlZApyYW5nZXNldCBjYW4ndCBwb3NzaWJseSBjb250YWluIG9y
IG92ZXJsYXAgYW55IHJhbmdlLgoKUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCi0tLSBhL3hlbi9jb21tb24vcmFuZ2VzZXQuYworKysgYi94ZW4vY29tbW9uL3Jh
bmdlc2V0LmMKQEAgLTI1Niw2ICsyNTYsOSBAQCBib29sX3QgcmFuZ2VzZXRfY29udGFpbnNfcmFu
Z2UoCiAKICAgICBBU1NFUlQocyA8PSBlKTsKIAorICAgIGlmICggIXIgKQorICAgICAgICByZXR1
cm4gZmFsc2U7CisKICAgICByZWFkX2xvY2soJnItPmxvY2spOwogICAgIHggPSBmaW5kX3Jhbmdl
KHIsIHMpOwogICAgIGNvbnRhaW5zID0gKHggJiYgKHgtPmUgPj0gZSkpOwpAQCAtMjcyLDYgKzI3
NSw5IEBAIGJvb2xfdCByYW5nZXNldF9vdmVybGFwc19yYW5nZSgKIAogICAgIEFTU0VSVChzIDw9
IGUpOwogCisgICAgaWYgKCAhciApCisgICAgICAgIHJldHVybiBmYWxzZTsKKwogICAgIHJlYWRf
bG9jaygmci0+bG9jayk7CiAgICAgeCA9IGZpbmRfcmFuZ2UociwgZSk7CiAgICAgb3ZlcmxhcHMg
PSAoeCAmJiAocyA8PSB4LT5lKSk7CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
