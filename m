From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [for-4.11][PATCH v6 12/16] xen/mm: Switch
 common/memory.c to use typesafe MFN
Date: Wed, 21 Mar 2018 08:17:45 -0600
Message-ID: <5AB2779902000078001B479C@prv-mh.provo.novell.com>
References: <20180321044737.20794-1-julien.grall@arm.com>
 <20180321044737.20794-13-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180321044737.20794-13-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAzLjE4IGF0IDA1OjQ3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgX19jb3B5X21mbl90b19ndWVzdChYRU5fR1VF
U1RfSEFORExFKHhlbl9wZm5fdCkgaG5kLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzaXplX3Qgb2ZmLCBtZm5fdCBtZm4pCj4gK3sKPiArICAgIHhl
bl9wZm5fdCBtZm5fID0gbWZuX3gobWZuKTsKPiArCj4gKyAgICByZXR1cm4gX19jb3B5X3RvX2d1
ZXN0X29mZnNldChobmQsIG9mZiwgJm1mbl8sIDEpOwo+ICt9CgpJJ20gc29ycnkgZm9yIG5vdGlj
aW5nIHRoaXMgb25seSBub3csIGJ1dCBvdXIgbmFtaW5nIHNjaGVtZSBjYWxscyBmb3IKdGhlIGZ1
bmN0aW9uIHRvIGJlIGNhbGxlZCBfX2NvcHlfbWZuX3RvX2d1ZXN0X29mZnNldCgpLiBXaXRoIHRo
YXQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
