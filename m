From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] CONFIG_XEN_PV breaks
 xen_create_contiguous_region on ARM
Date: Tue, 16 Oct 2018 11:56:49 +0100
Message-ID: <209b46f5-54db-72be-5d08-798550bc7d02@arm.com>
References: <alpine.DEB.2.10.1810161627250.5150@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tkc3=m4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gCN1y-00013I-Rw
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 10:56:54 +0000
In-Reply-To: <alpine.DEB.2.10.1810161627250.5150@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, jgross@suse.com, vkuznets@redhat.com
Cc: xen-devel@lists.xenproject.org, Nathan.Studer@dornerworks.com, Jeff.Kubascik@dornerworks.com, Jarvis.Roach@dornerworks.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMC8xNi8yMDE4IDA5OjM4IEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4g
eGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbiBoYXMgbm93IG9ubHkgYW4gaW1wbGVtZW50YXRp
b24gaWYKPiBDT05GSUdfWEVOX1BWIGlzIGRlZmluZWQuIEhvd2V2ZXIsIG9uIEFSTSB3ZSBuZXZl
ciBzZXQgQ09ORklHX1hFTl9QViBidXQKPiB3ZSBkbyBoYXZlIGFuIGltcGxlbWVudGF0aW9uIG9m
IHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24gd2hpY2ggaXMKPiByZXF1aXJlZCBmb3Igc3dp
b3RsYi14ZW4gdG8gd29yayBjb3JyZWN0bHkgKGFsdGhvdWdoIGl0IGp1c3Qgc2V0cwo+ICpkbWFf
aGFuZGxlKS4gPgo+IFRoaXMgZml4ZXMgYSBidWcgaW50cm9kdWNlZCBieSAxNjYyNDM5MDgxNmM0
YzQwZGYzZDc3N2IzNDY2NWQzZmQwMWU2OTNkLgoKTGludXggaXMgdXNpbmcgdGhlIHRhZyAiRml4
ZXM6IHNoYTEgKCJjb21taXQgdGl0bGUiKSIgc28gaXQgY2FuIGJlIApwaWNrZWQgdXAgZm9yIGJh
Y2twb3J0aW5nLgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CgpDaGVlcnMsCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaCBiL2luY2x1
ZGUveGVuL3hlbi1vcHMuaAo+IGluZGV4IGZkMThjOTcuLjkzOWE5NjIgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS94ZW4veGVuLW9wcy5oCj4gKysrIGIvaW5jbHVkZS94ZW4veGVuLW9wcy5oCj4gQEAg
LTQxLDcgKzQxLDcgQEAgc3RhdGljIGlubGluZSB1aW50MzJfdCB4ZW5fdmNwdV9ucihpbnQgY3B1
KQo+ICAgCj4gICBleHRlcm4gdW5zaWduZWQgbG9uZyAqeGVuX2NvbnRpZ3VvdXNfYml0bWFwOwo+
ICAgCj4gLSNpZmRlZiBDT05GSUdfWEVOX1BWCj4gKyNpZmRlZiBDT05GSUdfWEVOX1BWIHx8IENP
TkZJR19BUk0gfHwgQ09ORklHX0FSTTY0Cj4gICBpbnQgeGVuX2NyZWF0ZV9jb250aWd1b3VzX3Jl
Z2lvbihwaHlzX2FkZHJfdCBwc3RhcnQsIHVuc2lnbmVkIGludCBvcmRlciwKPiAgIAkJCQl1bnNp
Z25lZCBpbnQgYWRkcmVzc19iaXRzLAo+ICAgCQkJCWRtYV9hZGRyX3QgKmRtYV9oYW5kbGUpOwo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVu
LWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKPiAK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
