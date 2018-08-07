From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v15 06/14] x86/hvm: Introduce
 hvm_save_mtrr_msr_one func
Date: Tue, 07 Aug 2018 09:11:05 -0600
Message-ID: <5B69B68902000078001DBA6F@prv1-mh.provo.novell.com>
References: <1533304431-27897-1-git-send-email-aisaila@bitdefender.com>
 <1533304431-27897-7-git-send-email-aisaila@bitdefender.com>
 <5B6989DC02000078001DB863@prv1-mh.provo.novell.com>
 <1533654136.23883.4.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533654136.23883.4.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDE3OjAyLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+PiAgCj4+ID4gCj4+ID4gLSAgICAgICAgaHZtX2dldF9ndWVzdF9wYXQodiwgJmh3X210cnIu
bXNyX3BhdF9jcik7Cj4+ID4gKyAgICBtZW1jcHkoaHdfbXRyci5tc3JfbXRycl9maXhlZCwgbXRy
cl9zdGF0ZS0+Zml4ZWRfcmFuZ2VzLAo+PiA+IE5VTV9GSVhFRF9NU1IpOwo+PiBZb3Ugd2FudCB0
byBCVUlMRF9CVUdfT04oKSBhcnJheSBzaXplcyBkaWZmZXJpbmcsIGFuZCB0aGVuIHVzZQo+PiBz
aXplb2YoKSBpbiB0aGUgY2FsbCB0byBtZW1jcHkoKS4KPj4gCj4gSW4gdGhpcyBjYXNlIHNpemVz
IGFyZSBkaWZmZXJlbnQ6Cj4gbXNyX210cnJfZml4ZWRbTlVNX0ZJWEVEX01TUl07Cj4gZml4ZWRf
cmFuZ2VzW05VTV9GSVhFRF9SQU5HRVNdOwo+ICNkZWZpbmUgTlVNX0ZJWEVEX1JBTkdFUyA4OAo+
ICNkZWZpbmUgTlVNX0ZJWEVEX01TUiAxMQoKVGhlIGJhc2UgdHlwZSBvZiBtc3JfbXRycl9maXhl
ZFtdIGlzIHVpbnQ2NF90LCB3aGlsZSBmaXhlZF9yYW5nZXNbXSdzCmlzIHVpbnQ4X3QuIEkgaGFk
IHNwZWNpZmljYWxseSB1c2VkIHNpemVvZigpIGluIG15IHByZXZpb3VzIHJlcGx5IChpbnN0ZWFk
Cm9mIEFSUkFZX1NJWkUoKSkgdG8gYXZvaWQgZXhhY3RseSB0aGlzIGtpbmQgb2YgY29uZnVzaW9u
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
