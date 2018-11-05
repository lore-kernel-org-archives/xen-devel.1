From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/7] vpci: fix updating the command
 register
Date: Mon, 05 Nov 2018 09:46:22 -0700
Message-ID: <5BE073DE02000078001F82F8@prv1-mh.provo.novell.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJi1D-0001XI-5j
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 16:46:27 +0000
In-Reply-To: <20181030154123.4218-5-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjEwLjE4IGF0IDE2OjQxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFdoZW4gc3dpdGNoaW5nIHRoZSBtZW1vcnkgZGVjb2RpbmcgYml0IGluIHRoZSBjb21tYW5kIHJl
Z2lzdGVyIHRoZQo+IHJlc3Qgb2YgdGhlIGNoYW5nZXMgd2hlcmUgZHJvcHBlZCwgbGVhZGluZyB0
byBvbmx5IHRoZSBtZW1vcnkgZGVjb2RpbmcKPiBiaXQgYmVpbmcgdXBkYXRlZC4KPiAKPiBGaXgg
dGhpcyBieSB1bmNvbmRpdGlvbmFsbHkgd3JpdGluZyB0aGUgZ3Vlc3QtcmVxdWVzdGVkIGNvbW1h
bmQgZXhjZXB0Cj4gZm9yIHRoZSBtZW1vcnkgZGVjb2RpbmcgYml0LCB3aGljaCB3aWxsIGJlIHVw
ZGF0ZWQgb25jZSB0aGUgcDJtCj4gY2hhbmdlcyBhcmUgcGVyZm9ybWVkLgoKQXJlIHlvdSBjb252
aW5jZWQgdGhlcmUgYXJlIG5vIGRldmljZXMgKG9yIGRyaXZlcnMpIHdpdGggZXJyYXRhCnJlcXVp
cmluZyB0aGUgd3JpdGUgdG8gaGFwcGVuIGluIGEgc2luZ2xlIHN0ZXA/IFJlbWVtYmVyIHRoYXQK
dGhlIHJlZ2lzdGVyIHZhbHVlIGltbWVkaWF0ZWx5IGJlY29tZXMgdmlzaWJsZSB0byBvdGhlciAo
dilDUFVzLgoKPiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvdnBjaS9oZWFkZXIuYwo+IEBAIC0zMzMsOCArMzMzLDEwIEBAIHN0YXRpYyB2b2lkIGNt
ZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywKPiAg
ICAgICAgICAgKiBob3BpbmcgdGhlIGd1ZXN0IHdpbGwgcmVhbGl6ZSBhbmQgdHJ5IGFnYWluLgo+
ICAgICAgICAgICAqLwo+ICAgICAgICAgIG1vZGlmeV9iYXJzKHBkZXYsIGNtZCAmIFBDSV9DT01N
QU5EX01FTU9SWSwgZmFsc2UpOwo+IC0gICAgZWxzZQo+IC0gICAgICAgIHBjaV9jb25mX3dyaXRl
MTYocGRldi0+c2VnLCBwZGV2LT5idXMsIHNsb3QsIGZ1bmMsIHJlZywgY21kKTsKPiArCj4gKyAg
ICAvKiBXcml0ZSB0aGUgbmV3IGNvbW1hbmQgd2l0aG91dCB1cGRhdGluZyB0aGUgbWVtb3J5IGRl
Y29kaW5nIGJpdC4gKi8KPiArICAgIGNtZCA9IChjbWQgJiB+UENJX0NPTU1BTkRfTUVNT1JZKSB8
IChjdXJyZW50X2NtZCAmIFBDSV9DT01NQU5EX01FTU9SWSk7Cj4gKyAgICBwY2lfY29uZl93cml0
ZTE2KHBkZXYtPnNlZywgcGRldi0+YnVzLCBzbG90LCBmdW5jLCByZWcsIGNtZCk7CgpGdXJ0aGVy
bW9yZSwgaWYgdGhlIG1hcHBpbmcgZGlkbid0IGdldCBkZWZlcnJlZCwgYXJlbid0IHlvdQpkaXNj
YXJkaW5nIHRoZSBuZXcgZGVjb2RlIGJpdCB2YWx1ZSBoZXJlLCBhcyB3cml0dGVuIGJ5Cm1vZGlm
eV9iYXJzKCkgLT4gYXBwbHlfbWFwKCkgLT4gbW9kaWZ5X2RlY29kaW5nKCk/CgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
