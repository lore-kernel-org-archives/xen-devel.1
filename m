From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] xen/domain: Prepare data for is_{pv,
 hvm}_domain() as early as possible
Date: Tue, 04 Sep 2018 06:53:04 -0600
Message-ID: <5B8E803002000078001E520C@prv1-mh.provo.novell.com>
References: <1535986020-15906-1-git-send-email-andrew.cooper3@citrix.com>
 <1535986020-15906-2-git-send-email-andrew.cooper3@citrix.com>
 <5B8D5B4F02000078001E4C4E@prv1-mh.provo.novell.com>
 <88c1b1b8-3041-3815-4741-3a1f7a2c4edd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <88c1b1b8-3041-3815-4741-3a1f7a2c4edd@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA5LjE4IGF0IDE0OjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDMvMDkvMTggMTc6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gLS0tIGEveGVu
L2NvbW1vbi9kb21haW4uYwo+Pj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwo+Pj4gQEAgLTI3
Miw4ICsyNzIsMTIgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlk
LAo+Pj4gICAgICBpZiAoIChkID0gYWxsb2NfZG9tYWluX3N0cnVjdCgpKSA9PSBOVUxMICkKPj4+
ICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+Pj4gIAo+Pj4gKyAgICAvKiBTb3J0
IG91dCBvdXIgaWRlYSBvZiBpc19zeXN0ZW1fZG9tYWluKCkuICovCj4+PiAgICAgIGQtPmRvbWFp
bl9pZCA9IGRvbWlkOwo+Pj4gIAo+Pj4gKyAgICAvKiBEZWJ1ZyBzYW5pdHkuICovCj4+PiArICAg
IEFTU0VSVChpc19zeXN0ZW1fZG9tYWluKGQpID8gY29uZmlnID09IE5VTEwgOiBjb25maWcgIT0g
TlVMTCk7Cj4+IFdvdWxkIHlvdSBtaW5kIHNob3J0ZW5pbmcgdGhpcyB0byBhdCBsZWFzdAo+Pgo+
PiAgICAgQVNTRVJUKGlzX3N5c3RlbV9kb21haW4oZCkgPyAhY29uZmlnIDogY29uZmlnKTsKPj4K
Pj4gd2hpbGUgeW91IG1vdmUgaXQ/Cj4gCj4gVW5mb3J0dW5hdGVseSBub3QuCj4gCj4gZG9tYWlu
LmM6IEluIGZ1bmN0aW9uIOKAmGRvbWFpbl9jcmVhdGXigJk6Cj4gZG9tYWluLmM6Mjk2OjY3OiBl
cnJvcjogcG9pbnRlci9pbnRlZ2VyIHR5cGUgbWlzbWF0Y2ggaW4gY29uZGl0aW9uYWwKPiBleHBy
ZXNzaW9uIFstV2Vycm9yXQo+ICAgICAgQVNTRVJUKGlzX3N5c3RlbV9kb21haW4oZCkgPyAhY29u
ZmlnIDogY29uZmlnKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRy
ZWF0ZWQgYXMgZXJyb3JzCj4gL2xvY2FsL3hlbi5naXQveGVuL1J1bGVzLm1rOjE5NDogcmVjaXBl
IGZvciB0YXJnZXQgJ2RvbWFpbi5vJyBmYWlsZWQKPiAKPiB3aGljaCByZW1pbmRzIG1lIHdoeSBJ
IHdyb3RlIGl0IHRoZSB3YXkgSSBkaWQgb3JpZ2luYWxseS4KCldlbGwsIG9rYXkgdGhlbi4gSSBz
dXBwb3NlCgogICAgQVNTRVJUKGlzX3N5c3RlbV9kb21haW4oZCkgPyAhY29uZmlnIDogISFjb25m
aWcpOwoKb3IKCiAgICBBU1NFUlQoaXNfc3lzdGVtX2RvbWFpbihkKSA9PSAhY29uZmlnKTsKCmFy
ZW4ndCByZWFsbHkgYWNjZXB0YWJsZSB0byB5b3UuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
