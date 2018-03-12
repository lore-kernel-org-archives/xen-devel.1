From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH 6/7] xen/domain: Pass the full
 domctl_createdomain struct to create_domain()
Date: Mon, 12 Mar 2018 06:57:23 -0600
Message-ID: <5AA679330200007800129C48@prv-mh.provo.novell.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-7-git-send-email-andrew.cooper3@citrix.com>
 <5AA2CBA802000078001B06F6@prv-mh.provo.novell.com>
 <29693118-367c-3734-99ed-8371d0102254@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <29693118-367c-3734-99ed-8371d0102254@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrew.cooper3@citrix.com
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, tim@xen.org, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, julien.grall@arm.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDAzLzA5LzE4IDY6
MDYgUE0gPj4+Cj5PbiAwOS8wMy8xOCAxNzowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDA5LjAzLjE4IGF0IDE0OjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+
PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21h
aW4uYwo+Pj4gQEAgLTQyNiw4ICs0MjYsOCBAQCBzdGF0aWMgYm9vbCBlbXVsYXRpb25fZmxhZ3Nf
b2soY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3QgZW1mbGFncykKPj4+ICAgICAgcmV0
dXJuIHRydWU7Cj4+PiAgfQo+Pj4gIAo+Pj4gLWludCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0
IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGRvbWNyX2ZsYWdzLAo+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHhlbl9hcmNoX2RvbWFpbmNvbmZpZyAqY29uZmlnKQo+Pj4gK2ludCBh
cmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwKPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQo+PiBJcyB0aGVy
ZSBhbnkgcmVhc29uIGZvciB0aGlzIHRvIG5vdCBiZSBjb25zdD8gVGhlcmUncyBubyB3cml0ZSBu
b3cKPj4gYWZhaWNzLCBhbmQgSSBjYW4ndCBpbWFnaW5lIHlvdSB3YW50aW5nIHRvIGFkZCBvbmUg
bGF0ZXIgb24uCj4KPkkgb3JpZ2luYWxseSBwbGFubmVkIHRvIG1ha2UgdGhlbSBjb25zdCwgYnV0
IHRoZSBBUk0gc2lkZSBwYXNzZXMgZGF0YQo+YmFjayB0byB0aGUgdG9vbHN0YWNrLCBhbmQgdGhl
IHByb3RvdHlwZSBpcyAocmlnaHRmdWxseSkgY29tbW9uLgoKT2gsIEkgc2VlIC0gY2VydGFpbmx5
IGEgbGl0dGxlIG9kZCwgYnV0IHRoYXQncyB0aGUgd2F5IGl0IGlzIHRoZW4uCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
