From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/8] x86/SVM: Add AVIC vmexit handlers
Date: Tue, 17 Apr 2018 06:58:21 -0600
Message-ID: <5AD5EF6D02000078001BC158@prv1-mh.provo.novell.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <29be8811f7cd22aecafddcfab330ed6cd67bdc0a.1522794651.git.Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <29be8811f7cd22aecafddcfab330ed6cd67bdc0a.1522794651.git.Janakarajan.Natarajan@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE4IGF0IDAxOjAxLCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZsYXBpYy5oCj4gKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmxhcGljLmgKPiBAQCAtMTM3LDYgKzEzNywxMCBAQCB2
b2lkIHZsYXBpY19pcGkoc3RydWN0IHZsYXBpYyAqdmxhcGljLCB1aW50MzJfdCBpY3JfbG93LCAK
PiB1aW50MzJfdCBpY3JfaGlnaCk7Cj4gIAo+ICBpbnQgdmxhcGljX2FwaWN2X3dyaXRlKHN0cnVj
dCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0KTsKPiAgCj4gK3ZvaWQgdmxhcGljX3JlZ193
cml0ZShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IG9mZnNldCwgdWludDMyX3QgdmFsKTsK
PiArCj4gK3VpbnQzMl90IHZsYXBpY19yZWFkX2FsaWduZWQoY29uc3Qgc3RydWN0IHZsYXBpYyAq
dmxhcGljLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KTsKCklmIG1ha2luZyB0aGVzZSBub24tc3RhdGlj
IGlzIHJlYWxseSBuZWNlc3NhcnksIHRoZXkgc2hvdWxkIChuYW1lLXdpc2UpIGJlY29tZQpwcm9w
ZXIgcGFpcnMgb2Ygb25lIGFub3RoZXIsIGUuZy4gcmVuYW1lZCB0aGUgZm9ybWVyIHRvIHZsYXBp
Y19yZWdfcmVhZCgpLgoKQWxzbyB3aGlsZSBoZXJlIHlvdSBwcm9wZXJseSB1c2UgdWludDMyX3Qs
IGFsbW9zdCBldmVyeXdoZXJlIHlvdSB1c2UgdTMyLgpQbGVhc2Ugc3dpdGNoIHRoaXMgdGhyb3Vn
aG91dCB0aGUgc2VyaWVzLCBhbmQgb2YgY291cnNlIGZvciBhbGwgb3RoZXIgZml4ZWQKd2lkdGgg
aW50ZWdlciB0eXBlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
