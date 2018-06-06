From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 03/11] x86: Initialise debug registers
 correctly
Date: Wed, 06 Jun 2018 07:56:26 -0600
Message-ID: <5B17E80A02000078001C8C1D@prv1-mh.provo.novell.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528120755-17455-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA2LjE4IGF0IDE1OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2Rv
bWFpbi5jCj4gQEAgLTMyMiw2ICszMjIsMTQgQEAgdm9pZCBmcmVlX3ZjcHVfc3RydWN0KHN0cnVj
dCB2Y3B1ICp2KQo+ICAgICAgZnJlZV94ZW5oZWFwX3BhZ2Uodik7Cj4gIH0KPiAgCj4gK3N0YXRp
YyB2b2lkIGluaXRpYWxpc2VfcmVnaXN0ZXJzKHN0cnVjdCB2Y3B1ICp2KQo+ICt7Cj4gKyAgICB2
LT5hcmNoLnVzZXJfcmVncy5lZmxhZ3MgPSBYODZfRUZMQUdTX01CUzsKCklmIHlvdSB1c2VkIC0+
cmZsYWdzIGhlcmUsIHlvdSBjb3VsZCAoYW5kIGltbyBiZXR0ZXIgd291bGQpIGFsc28gLi4uCgo+
IEBAIC0zOTA3LDcgKzM5MDgsMTAgQEAgdm9pZCBodm1fdmNwdV9yZXNldF9zdGF0ZShzdHJ1Y3Qg
dmNwdSAqdiwgdWludDE2X3QgY3MsIHVpbnQxNl90IGlwKQo+ICAgICAgdi0+YXJjaC51c2VyX3Jl
Z3MucmZsYWdzID0gWDg2X0VGTEFHU19NQlM7Cj4gICAgICB2LT5hcmNoLnVzZXJfcmVncy5yZHgg
PSAweDAwMDAwZjAwOwo+ICAgICAgdi0+YXJjaC51c2VyX3JlZ3MucmlwID0gaXA7Cj4gLSAgICBt
ZW1zZXQoJnYtPmFyY2guZGVidWdyZWcsIDAsIHNpemVvZih2LT5hcmNoLmRlYnVncmVnKSk7Cj4g
Kwo+ICsgICAgbWVtc2V0KCZ2LT5hcmNoLmRlYnVncmVnLCAwLCBzaXplb2Yodi0+YXJjaC5kZWJ1
Z3JlZykgLSAxNik7Cj4gKyAgICB2LT5hcmNoLmRlYnVncmVnWzZdID0gWDg2X0RSNl9ERUZBVUxU
Owo+ICsgICAgdi0+YXJjaC5kZWJ1Z3JlZ1s3XSA9IFg4Nl9EUjdfREVGQVVMVDsKCi4uLiBjYWxs
IHRoYXQgZnVuY3Rpb24gZnJvbSBoZXJlIChkcm9wcGluZyB0aGUgc2V0dGluZyBvZiAucmZsYWdz
CnZpc2libGUgaW4gY29udGV4dCkuCgpJZiB5b3UgZGVjaWRlIHRvIGdvIHRoYXQgcm91dGUsClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
