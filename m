From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 03/10] x86/HVM: Make
 vlapic_reg_read/write() non-static
Date: Wed, 16 May 2018 08:44:58 -0600
Message-ID: <5AFC43EA02000078001C352F@prv1-mh.provo.novell.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-4-Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180507210753.2280-4-Janakarajan.Natarajan@amd.com>
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

Pj4+IE9uIDA3LjA1LjE4IGF0IDIzOjA3LCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZsYXBpYy5oCj4gKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmxhcGljLmgKPiBAQCAtMTM3LDYgKzEzNywxMCBAQCB2
b2lkIHZsYXBpY19pcGkoc3RydWN0IHZsYXBpYyAqdmxhcGljLCB1aW50MzJfdCBpY3JfbG93LCAK
PiB1aW50MzJfdCBpY3JfaGlnaCk7Cj4gIAo+ICBpbnQgdmxhcGljX2FwaWN2X3dyaXRlKHN0cnVj
dCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0KTsKPiAgCj4gK3ZvaWQgdmxhcGljX3JlZ193
cml0ZShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IG9mZnNldCwgdWludDMyX3QgdmFsKTsK
PiArCj4gK3VpbnQzMl90IHZsYXBpY19yZWdfcmVhZChjb25zdCBzdHJ1Y3QgdmxhcGljICp2bGFw
aWMsIHVuc2lnbmVkIGludCBvZmZzZXQpOwoKRm9yIHRoZW0gdG8gYmUgbWFkZSBub24tc3RhdGlj
LCB0aGV5IHNob3VsZCByZWFsbHkgYmUgY291bnRlcnBhcnRzIG9mIG9uZQphbm90aGVyLiBUaGlz
ICh0byBtZSkgaW5jbHVkZXMgc3VpdGFibHkgbWF0Y2hpbmcgcGFyYW1ldGVyIHR5cGVzIChpLmUu
IGJvdGgKc2hvdWxkIHRha2Ugc3RydWN0IHZsYXBpYyAqIG9yIHN0cnVjdCB2Y3B1ICo7IHRoZSBy
ZWFkIG9uZSBoYXZpbmcgaXQgY29uc3QgaXMKb2YgY291cnNlIGZpbmUpLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
