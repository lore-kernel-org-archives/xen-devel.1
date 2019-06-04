From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
Date: Tue, 04 Jun 2019 00:56:17 -0600
Message-ID: <5CF616110200007800234E4D@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
 <20190603220245.22750-3-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY3Mx-0001oi-DD
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 06:56:27 +0000
In-Reply-To: <20190603220245.22750-3-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA2LjE5IGF0IDAwOjAyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAu
Ywo+IEBAIC00ODIsNyArNDgyLDE0IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3BkeCh2b2lk
KQo+ICB7Cj4gICAgICBwYWRkcl90IGJhbmtfc3RhcnQsIGJhbmtfc2l6ZSwgYmFua19lbmQ7Cj4g
IAo+IC0gICAgdTY0IG1hc2sgPSBwZHhfaW5pdF9tYXNrKGJvb3RpbmZvLm1lbS5iYW5rWzBdLnN0
YXJ0KTsKPiArICAgIC8qCj4gKyAgICAgKiBBcm0gZG9lcyBub3QgaGF2ZSBhbnkgcmVzdHJpY3Rp
b25zIG9uIHRoZSBiaXRzIHRvIGNvbXByZXNzLiBQYXNzIDAgdG8KPiArICAgICAqIGxldCB0aGUg
Y29tbW9uIGNvZGUgZnVydGhlciByZXN0cmljdCB0aGUgbWFzay4KPiArICAgICAqCj4gKyAgICAg
KiBJZiB0aGUgbG9naWMgY2hhbmdlcyBpbiBwZm5fcGR4X2hvbGVfc2V0dXAgd2UgbWlnaHQgaGF2
ZSB0bwo+ICsgICAgICogdXBkYXRlIHRoaXMgZnVuY3Rpb24gdG9vLgo+ICsgICAgICovCj4gKyAg
ICB1NjQgbWFzayA9IHBkeF9pbml0X21hc2soMHgwKTsKClNlZWluZyBKdWxpZW4ncyBjbGFyaWZp
Y2F0aW9uIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uJ3MgZGlzY3Vzc2lvbiwKaG93IGFib3V0IHN3
aXRjaGluZyB0aGlzIG9uZSB0byB1aW50NjRfdCBhcyB3ZWxsIGF0IHRoaXMgb2NjYXNpb24/Cgo+
IC0tLSBhL3hlbi9jb21tb24vcGR4LmMKPiArKysgYi94ZW4vY29tbW9uL3BkeC5jCj4gQEAgLTUw
LDkgKzUwLDEyIEBAIHN0YXRpYyB1NjQgX19pbml0IGZpbGxfbWFzayh1NjQgbWFzaykKPiAgICAg
IHJldHVybiBtYXNrOwo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBXZSBkb24ndCBjb21wcmVzcyB0aGUg
Zmlyc3QgTUFYX09SREVSIGJpdCBvZiB0aGUgYWRkcmVzc2VzLgo+ICsgKi8KClRoaXMgaXMgYSBz
aW5nbGUgbGluZSBjb21tZW50LgoKPiAgdTY0IF9faW5pdCBwZHhfaW5pdF9tYXNrKHU2NCBiYXNl
X2FkZHIpCgpJdCB3b3VsZG4ndCBoYW1wZXIgcGF0Y2ggcmVhZGFiaWxpdHkgbXVjaCBpZiBldmVu
IHRoaXMgb25lIHdhcwpzd2l0Y2hlZCB0byB1aW50NjRfdCBhdCB0aGUgc2FtZSB0aW1lLCB0aHVz
IHJlc3RvcmluZyBjb25zaXN0ZW5jeQp3aXRoIC4uLgoKPiAgewo+IC0gICAgcmV0dXJuIGZpbGxf
bWFzayhiYXNlX2FkZHIgLSAxKTsKPiArICAgIHJldHVybiBmaWxsX21hc2sobWF4KGJhc2VfYWRk
ciwgKHU2NCkxIDw8IChNQVhfT1JERVIgKyBQQUdFX1NISUZUKSkgLSAxKTsKCi4uLiB0aGUgcmVx
dWVzdGVkIHVzZSBvZiB1aW50NjRfdCBoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
