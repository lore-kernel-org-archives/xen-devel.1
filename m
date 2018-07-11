From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/8] allow cpu_down() to be called earlier
Date: Wed, 11 Jul 2018 06:06:52 -0600
Message-ID: <5B45F2DC02000078001D3136@prv1-mh.provo.novell.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t1xz=j3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdDtY-0005b2-DM
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 12:06:56 +0000
In-Reply-To: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
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

VGhlIGZ1bmN0aW9uJ3MgdXNlIG9mIHRoZSBzdG9wLW1hY2hpbmUgbG9naWMgaGFzIHNvIGZhciBw
cmV2ZW50ZWQgaXRzCnVzZSBhaGVhZCBvZiB0aGUgcHJvY2Vzc2luZyBvZiB0aGUgIm9yZGluYXJ5
IiBpbml0Y2FsbHMuIFNpbmNlIGF0IHRoaXMKZWFybHkgdGltZSB3ZSdyZSBpbiBhIGNvbnRyb2xs
ZWQgZW52aXJvbm1lbnQgYW55d2F5LCB0aGVyZSdzIG5vIG5lZWQgZm9yCnN1Y2ggYSBoZWF2eSB0
b29sLiBBZGRpdGlvbmFsbHkgdGhpcyBvdWdodCB0byBoYXZlIGxlc3Mgb2YgYSBwZXJmb3JtYW5j
ZQppbXBhY3QgZXNwZWNpYWxseSBvbiBsYXJnZSBzeXN0ZW1zLCBjb21wYXJlZCB0byB0aGUgYWx0
ZXJuYXRpdmUgb2YKbWFraW5nIHN0b3AtbWFjaGluZSBmdW5jdGlvbmFsaXR5IGF2YWlsYWJsZSBl
YXJsaWVyLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
LS0tIGEveGVuL2NvbW1vbi9jcHUuYworKysgYi94ZW4vY29tbW9uL2NwdS5jCkBAIC02NywxMiAr
NjcsMTcgQEAgdm9pZCBfX2luaXQgcmVnaXN0ZXJfY3B1X25vdGlmaWVyKHN0cnVjdAogICAgIHNw
aW5fdW5sb2NrKCZjcHVfYWRkX3JlbW92ZV9sb2NrKTsKIH0KIAotc3RhdGljIGludCB0YWtlX2Nw
dV9kb3duKHZvaWQgKnVudXNlZCkKK3N0YXRpYyB2b2lkIF90YWtlX2NwdV9kb3duKHZvaWQgKnVu
dXNlZCkKIHsKICAgICB2b2lkICpoY3B1ID0gKHZvaWQgKikobG9uZylzbXBfcHJvY2Vzc29yX2lk
KCk7CiAgICAgaW50IG5vdGlmaWVyX3JjID0gbm90aWZpZXJfY2FsbF9jaGFpbigmY3B1X2NoYWlu
LCBDUFVfRFlJTkcsIGhjcHUsIE5VTEwpOwogICAgIEJVR19PTihub3RpZmllcl9yYyAhPSBOT1RJ
RllfRE9ORSk7CiAgICAgX19jcHVfZGlzYWJsZSgpOworfQorCitzdGF0aWMgaW50IHRha2VfY3B1
X2Rvd24odm9pZCAqYXJnKQoreworICAgIF90YWtlX2NwdV9kb3duKGFyZyk7CiAgICAgcmV0dXJu
IDA7CiB9CiAKQEAgLTk4LDcgKzEwMyw5IEBAIGludCBjcHVfZG93bih1bnNpZ25lZCBpbnQgY3B1
KQogICAgICAgICBnb3RvIGZhaWw7CiAgICAgfQogCi0gICAgaWYgKCAoZXJyID0gc3RvcF9tYWNo
aW5lX3J1bih0YWtlX2NwdV9kb3duLCBOVUxMLCBjcHUpKSA8IDAgKQorICAgIGlmICggdW5saWtl
bHkoc3lzdGVtX3N0YXRlIDwgU1lTX1NUQVRFX2FjdGl2ZSkgKQorICAgICAgICBvbl9zZWxlY3Rl
ZF9jcHVzKGNwdW1hc2tfb2YoY3B1KSwgX3Rha2VfY3B1X2Rvd24sIE5VTEwsIHRydWUpOworICAg
IGVsc2UgaWYgKCAoZXJyID0gc3RvcF9tYWNoaW5lX3J1bih0YWtlX2NwdV9kb3duLCBOVUxMLCBj
cHUpKSA8IDAgKQogICAgICAgICBnb3RvIGZhaWw7CiAKICAgICBfX2NwdV9kaWUoY3B1KTsKCgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
