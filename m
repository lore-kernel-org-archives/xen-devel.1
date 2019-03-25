From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/microcode: always collect_cpu_info()
 during boot
Date: Mon, 25 Mar 2019 11:08:50 -0600
Message-ID: <5C990B220200007800221BB9@prv1-mh.provo.novell.com>
References: <20190325111217.25649-1-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190325111217.25649-1-sergey.dyasli@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Chao Gao <chao.gao@intel.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAzLjE5IGF0IDEyOjEyLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBDdXJyZW50bHkgY3B1X3NpZyBzdHJ1Y3QgaXMgbm90IHVwZGF0ZWQgZHVyaW5nIGJvb3Qg
d2hlbiBlaXRoZXI6Cj4gCj4gICAgIDEuIHVjb2RlX3NjYW4gaXMgc2V0IHRvIGZhbHNlIChlLmcu
IG5vICJ1Y29kZT1zY2FuIiBpbiBjbWRsaW5lKQo+ICAgICAyLiBpbml0cmQgZG9lcyBub3QgY29u
dGFpbiBhIG1pY3JvY29kZSBibG9iCgpXaGF0IGFib3V0ICJ1Y29kZT08bnVtYmVyPiI/Cgo+IFRo
ZXNlIHdpbGwgcmVzdWx0IGluIGNwdV9zaWcucmV2IGJlaW5nIDAgd2hpY2ggYWZmZWN0cyBBUElD
J3MKPiBjaGVja19kZWFkbGluZV9lcnJhdGEoKSBhbmQgcmV0cG9saW5lX3NhZmUoKSBmdW5jdGlv
bnMuCj4gCj4gRml4IHRoaXMgYnkgZ2V0dGluZyB1Y29kZSByZXZpc2lvbiBlYXJseSBkdXJpbmcg
Ym9vdCBhbmQgU01QIGJyaW5nIHVwLgoKQ2FuJ3QgeW91IHRoZW4gZHJvcCB0aGUgY2FsbCBmcm9t
IG1pY3JvY29kZV91cGRhdGVfY3B1KCk/Cgo+IEBAIC00MTMsNiArNDIxLDggQEAgaW50IF9faW5p
dCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdShib29sIHN0YXJ0X3VwZGF0ZSkKPiAgCj4gIGlu
dCBfX2luaXQgZWFybHlfbWljcm9jb2RlX2luaXQodm9pZCkKPiAgewo+ICsgICAgdW5zaWduZWQg
aW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiArICAgIHN0cnVjdCB1Y29kZV9jcHVfaW5m
byAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdSk7CgpXb3VsZCB5b3UgbWluZCBt
b3ZpbmcgdGhlc2UgZGVjbGFyYXRpb25zIC4uLgoKPiBAQCAtNDI1LDYgKzQzNSw4IEBAIGludCBf
X2luaXQgZWFybHlfbWljcm9jb2RlX2luaXQodm9pZCkKPiAgCj4gICAgICBpZiAoIG1pY3JvY29k
ZV9vcHMgKQo+ICAgICAgewo+ICsgICAgICAgIG1pY3JvY29kZV9vcHMtPmNvbGxlY3RfY3B1X2lu
Zm8oY3B1LCAmdWNpLT5jcHVfc2lnKTsKCi4uLiBpbnRvIHRoaXMgc2NvcGU/CgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
