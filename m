From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/5] xen/domain: Audit config->max_vcpus
 during {, arch_}check_domain_config()
Date: Mon, 08 Oct 2018 07:45:47 -0600
Message-ID: <5BBB5F8B02000078001EF9C9@prv1-mh.provo.novell.com>
References: <1538751289-1109-1-git-send-email-andrew.cooper3@citrix.com>
 <1538751289-1109-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1538751289-1109-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDE2OjU0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbi5jCj4gQEAgLTYwMSw2ICs2MDEsOCBAQCB2b2lkIHZjcHVfc3dpdGNoX3RvX2FhcmNoNjRf
bW9kZShzdHJ1Y3QgdmNwdSAqdikKPiAgCj4gIGludCBhcmNoX2NoZWNrX2RvbWFpbl9jb25maWco
c3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpCj4gIHsKPiArICAgIHVuc2ln
bmVkIGludCBtYXhfdmNwdXMgPSAwOwoKSXMgdGhlIGluaXRpYWxpemVyIHJlYWxseSBuZWVkZWQg
aGVyZSBjb25zaWRlcmluZyAuLi4KCj4gQEAgLTYxOSw2ICs2MjEsMjIgQEAgaW50IGFyY2hfY2hl
Y2tfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykK
PiAgICAgICAgICB9Cj4gICAgICB9Cj4gIAo+ICsgICAgLyogQ2FsY3VsYXRlIHRoZSBtYXhpbXVt
IG51bWJlciBvZiB2Y3B1cyBmcm9tIHRoZSBzZWxlY3RlZCBHSUMgdmVyc2lvbi4uLiAqLwo+ICsg
ICAgc3dpdGNoICggY29uZmlnLT5hcmNoLmdpY192ZXJzaW9uICkKPiArICAgIHsKPiArICAgIGNh
c2UgR0lDX1YyOiBtYXhfdmNwdXMgPSA4OyAgIGJyZWFrOwo+ICsgICAgY2FzZSBHSUNfVjM6IG1h
eF92Y3B1cyA9IDI1NTsgYnJlYWs7Cj4gKwo+ICsgICAgZGVmYXVsdDoKPiArICAgICAgICByZXR1
cm4gLUVPUE5PVFNVUFA7CgouLi4gdGhpcz8KCj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+
ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiBAQCAtMjk3LDYgKzI5Nyw5IEBAIHN0YXRpYyBp
bnQgY2hlY2tfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNv
bmZpZykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9DREZfeHNfZG9t
YWluKSApCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gIAo+ICsgICAgaWYgKCBjb25maWct
Pm1heF92Y3B1cyA8IDEgKQo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAgICAgIHJl
dHVybiBhcmNoX2NoZWNrX2RvbWFpbl9jb25maWcoY29uZmlnKTsKPiAgfQoKQW55IHJlYXNvbiB5
b3UgZG9uJ3QgcmVtb3ZlIHRoZSBub3cgcmVkdW5kYW50IGNoZWNrIGZyb20KZG9tYWluX2NyZWF0
ZSgpLCB3aGljaCB3b3VsZCBhbGxvdyBkaXRjaGluZyBhbHRvZ2V0aGVyIHg4NidzCmRvbWFpbl9t
YXhfdmNwdXMoKT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
