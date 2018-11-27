From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/3] xen/x86: support setting dom0_mem
 depending on host size
Date: Tue, 27 Nov 2018 11:33:07 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811271129330.4577@sstabellini-ThinkPad-X260>
References: <20181122164028.8451-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ef7n=og=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gRj6e-0003Xl-46
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 19:33:12 +0000
In-Reply-To: <20181122164028.8451-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgSnVlcmdlbiwKCkkgZG9uJ3QgbWVhbiB0byBzY29wZS1jcmVlcCB5b3VyIHNlcmllcywgYW5k
IEkgdGhpbmsgaXQgaXMgZmluZSBpZiB5b3UKZG9uJ3Qgd2FudCB0byBkbyBpdCwgYnV0IGl0IHdv
dWxkIGJlIGZhbnRhc3RpYyBpZiB5b3UgdG9vayB0aGUKb3Bwb3J0dW5pdHkgdG8gbWFrZSBkb20w
X21lbSBjb21tb24gYWNyb3NzIGFyY2hpdGVjdHVyZXMuCgpPbiBBUk0sIHdlIHBhcnNlIGl0IGlu
IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYzpwYXJzZV9kb20wX21lbS4KSSB0aGluayB0aGUg
QVJNIGFuZCB4ODYgaW1wbGVtZW50YXRpb25zIHNob3VsZCBiZSB0aGUgc2FtZS4KCkNoZWVycywK
ClN0ZWZhbm8KCk9uIFRodSwgMjIgTm92IDIwMTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gU2V0
dGluZyB0aGUgbWVtb3J5IHNpemUgb2YgZG9tMCBvbiBhIHNlcnZlciBmb3IgdGhlIG5vbiBhdXRv
YmFsbG9vbmluZwo+IGNhc2UgcmVxdWlyZXMgYWx3YXlzIHNwZWNpZmljYXRpb24gb2YgYSBib290
IHBhcmFtZXRlciB0b2RheS4gVGhlIHZhbHVlCj4gdG8gc2V0IHdpbGwgZGVwZW5kIG1vc3RseSBv
biB0aGUgaG9zdCBtZW1vcnkgc2l6ZS4KPiAKPiBJbiBvcmRlciB0byBzdXBwb3J0IHRoYXQgc2Nl
bmFyaW8gYWRkIHRoZSBwb3NzaWJpbGl0eSB0byBzZXQgZG9tMF9tZW0KPiBkZXBlbmRpbmcgb24g
dGhlIGFtb3VudCBvZiBwaHlzaWNhbCBtZW1vcnkgYnkgYWxsb3dpbmcgdG8gc3BlY2lmeSBhCj4g
cGVyY2VudGFnZSBvZiBob3N0IG1lbW9yeSAoZS5nLiAxMCUpIHdpdGggYW4gb2Zmc2V0IChsaWtl
IDFHKzEwJSkuCj4gCj4gVG8gbWFrZSBpdCBlYXN5IGZvciBhIGRpc3RyaWJ1dG9yIHRvIHVzZSBz
dWNoIGEgc2V0dGluZyBhcyB0aGUgZGVmYXVsdAo+IG1ha2UgdGhlIHN0YW5kYXJkIHNldHRpbmcg
Zm9yIGRvbTBfbWVtIGNvbmZpZ3VyYWJsZSB2aWEgS2NvbmZpZy4KPiAKPiBKdWVyZ2VuIEdyb3Nz
ICgzKToKPiAgIHhlbi94ODY6IGRlbGF5IHBhcnNpbmcgb2YgZG9tMF9tZW0gcGFyYW1ldGVyIHVu
dGlsIG5lZWRlZAo+ICAgeGVuL3g4NjogYWRkIGRvbTAgbWVtb3J5IHNpemluZyB2YXJpYW50cwo+
ICAgeGVuL3g4NjogYWRkIENPTkZJRyBpdGVtIGZvciBkZWZhdWx0IGRvbTAgbWVtb3J5IHNpemUK
PiAKPiAgZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24gfCAyMSArKysrKysrKy0t
LS0KPiAgeGVuL2FyY2gveDg2L0tjb25maWcgICAgICAgICAgICAgICAgfCAgOSArKysrKwo+ICB4
ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCsp
LCAyNCBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
