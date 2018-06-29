From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 09/10] x86: Disable Intel Processor Trace
 when VMXON in L1 guest
Date: Fri, 29 Jun 2018 09:14:55 -0600
Message-ID: <5B364CEF02000078001CF416@prv1-mh.provo.novell.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-10-git-send-email-luwei.kang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527686884-5917-10-git-send-email-luwei.kang@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luwei Kang <luwei.kang@intel.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA1LjE4IGF0IDE1OjI4LCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
IEBAIC0xNTE5LDYgKzE1MjAsMTQgQEAgaW50IG52bXhfaGFuZGxlX3ZteG9uKHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQo+ICAgICAgdi0+YXJjaC5odm1fdm14LmxhdW5jaGVkID0gMDsKPiAg
ICAgIHZtc3VjY2VlZChyZWdzKTsKPiAgCj4gKyAgICBpZiAoIHYtPmFyY2guaHZtX3ZteC5pcHRf
ZGVzYyApCj4gKyAgICB7Cj4gKyAgICAgICAgdi0+YXJjaC5odm1fdm14LmlwdF9kZXNjLT5pcHRf
Z3Vlc3QuY3RsID0gMDsKPiArICAgICAgICB2bXhfdm1jc19lbnRlcihjdXJyZW50KTsKPiArICAg
ICAgICBfX3Ztd3JpdGUoR1VFU1RfSUEzMl9SVElUX0NUTCwgMCk7Cj4gKyAgICAgICAgdm14X3Zt
Y3NfZXhpdChjdXJyZW50KTsKPiArICAgIH0KCkkgYWdhaW4gZG9uJ3QgdW5kZXJzdGFuZCB3aHkg
ZW50ZXIgYW5kIGV4aXQgdGhlIFZNQ1MgaGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
