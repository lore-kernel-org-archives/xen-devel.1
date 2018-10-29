From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 14/16] x86: make entry point code build
 when !CONFIG_PV
Date: Mon, 29 Oct 2018 09:03:18 -0600
Message-ID: <5BD7213602000078001F5DF4@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <af9f79239874ca4257e136b74460646d36363650.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gH94e-0000e2-32
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 15:03:24 +0000
In-Reply-To: <af9f79239874ca4257e136b74460646d36363650.1539959287.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTU0OCwxMCArNTUwLDE0IEBAIEVOVFJZKHJldF9mcm9tX2ludHIpCj4gICAgICAgICAgR0VU
X0NVUlJFTlQoYngpCj4gICAgICAgICAgdGVzdGIgJDMsIFVSRUdTX2NzKCVyc3ApCj4gICAgICAg
ICAganogICAgcmVzdG9yZV9hbGxfeGVuCj4gKyNpZmRlZiBDT05GSUdfUFYKPiAgICAgICAgICBt
b3ZxICBWQ1BVX2RvbWFpbiglcmJ4KSwgJXJheAo+ICAgICAgICAgIGNtcGIgICQwLCBET01BSU5f
aXNfMzJiaXRfcHYoJXJheCkKPiAgICAgICAgICBqZSAgICB0ZXN0X2FsbF9ldmVudHMKPiAgICAg
ICAgICBqbXAgICBjb21wYXRfdGVzdF9hbGxfZXZlbnRzCj4gKyNlbHNlCj4gKyAgICAgICAgQlVH
Cj4gKyNlbmRpZgoKSG1tLCBub3Qgc3VyZSBoZXJlIChhbmQgZWxzZXdoZXJlKTogQW5vdGhlciBv
cHRpb24gaXMgdG8Kc3RyZWFtbGluZSBleGVjdXRpb24gYnkgcmVwbGFjaW5nIHRoZSBjb25kaXRp
b25hbCBicmFuY2ggd2l0aCBhbgp1bmNvbmRpdGlvbmFsIG9uZSBpbiB0aGUgIVBWIGNhc2UuIEFu
ZHJldywgZG8geW91IGhhdmUgYW55CnRob3VnaHRzIGVpdGhlciB3YXk/Cgo+IEBAIC01OTYsOCAr
NjAyLDkgQEAgRU5UUlkoY29tbW9uX2ludGVycnVwdCkKPiAgICAgICAgICBjbW92bnogJXIxMiwg
JXIxNQo+ICAgICAgICAgIGNtb3ZueiAlcjEyZCwgJWVieAo+ICAuTGludHJfY3IzX29rYXk6Cj4g
LQo+ICsjaWZkZWYgQ09ORklHX1BWCj4gICAgICAgICAgQ1I0X1BWMzJfUkVTVE9SRQo+ICsjZW5k
aWYKCkNvdWxkbid0IHlvdSBpbnN0ZWFkIG1ha2UgdGhlIG1hY3JvIGV4cGFuZCB0byBub3RoaW5n
PwoKQWxzbyBwbGVhc2UgZG9uJ3QgcmVtb3ZlIHRoZSBibGFuayBsaW5lLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
