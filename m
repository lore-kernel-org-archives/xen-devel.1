From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 4/4] xen/arm: gic: Relax barrier when
 sending an SGI
Date: Wed, 24 Oct 2018 15:46:28 +0100
Message-ID: <09283c74-c4a9-9d79-fc07-8e9dffef6dfd@arm.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-5-julien.grall@arm.com>
 <0851d7c5-3da0-2749-648e-88a42b82449e@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0851d7c5-3da0-2749-648e-88a42b82449e@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8yNC8xOCAyOjMyIFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpIEFuZHJpaSwKCj4gT24gMjMuMTAuMTggMjE6MTcsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMuYyBiL3hlbi9hcmNoL2FybS9naWMuYwo+
PiBpbmRleCAwMTA4ZTk2MDNjLi4wNzdiOTQxYjc5IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vZ2ljLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy5jCj4+IEBAIC0zMDAsMTIgKzMwMCw2
IEBAIHZvaWQgc2VuZF9TR0lfbWFzayhjb25zdCBjcHVtYXNrX3QgKmNwdW1hc2ssIGVudW0gZ2lj
X3NnaSBzZ2kpCj4+ICAgIHsKPj4gICAgICAgIEFTU0VSVChzZ2kgPCAxNik7IC8qIFRoZXJlIGFy
ZSBvbmx5IDE2IFNHSXMgKi8KPj4gICAgCj4+IC0gICAvKgo+PiAtICAgICogRW5zdXJlIHRoYXQg
c3RvcmVzIHRvIE5vcm1hbCBtZW1vcnkgYXJlIHZpc2libGUgdG8gdGhlIG90aGVyIENQVXMKPj4g
LSAgICAqIGJlZm9yZSBpc3N1aW5nIHRoZSBJUEkuCj4+IC0gICAgKiBNYXRjaGVzIHRoZSByZWFk
IGJhcnJpZXIgaW4gZG9fc2dpLgo+PiAtICAgICovCj4+IC0gICAgZHNiKHN5KTsKPiBIZXJlIHlv
dSByZW1vdmUgdGhlIGNvbW1lbnQgeW91J3ZlIGp1c3QgYWRkZWQgd2l0aGluIHRoaXMgcGF0Y2gg
c2VyaWVzLAo+IGFuZCB0aGUgc2FtZSBiZWxvdy4KPiBXb3VsZG4ndCBpdCBiZXR0ZXIgdG8gcmVv
cmRlciBwYXRjaGVzLCBmaXJzdCByZWxheCB0aGUgYmFycmllciwgdGhlbgo+IGVuc3VyZSBvcmRl
cmluZyBiZXR3ZWVuIHJlYWQgb2YgSU5UQUNLIGFuZCBzaGFyZWQgZGF0YT8KCnBhdGNoICMxIGFu
ZCAjMiBzaG91bGQgYmUgYmFja3BvcnRlZC4gVGhpcyBwYXRjaCBpcyB0ZWNobmljYWxseSBub3Qg
YSAKYnVnIGZpeCBidXQgYSByZWxheGF0aW9uLiBTbyBJIGFtIG5vdCBjb21mb3J0YWJsZSB0byBz
dWdnZXN0IGJhY2twb3J0aW5nIAppdCB1cCB0byBYZW4gNC45LiBIZW5jZSB0aGUgb3JkZXJpbmcg
b2YgdGhlIHNlcmllcy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
