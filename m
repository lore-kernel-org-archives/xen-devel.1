From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 12/13] x86: add iommu_ops to modify and
 flush IOMMU mappings
Date: Mon, 23 Jul 2018 14:27:48 +0000
Message-ID: <10fc2533e5694571a4942c14fed7e81f@AMSPEX02CL03.citrite.net>
References: <20180717133816.37958-1-paul.durrant@citrix.com>
 <20180717133816.37958-13-paul.durrant@citrix.com>
 <20180723142629.ytcph5yf34pi2vmg@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m7oc=kh=citrix.com=prvs=73522d08e=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fhboV-0001x0-TI
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 14:27:51 +0000
In-Reply-To: <20180723142629.ytcph5yf34pi2vmg@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgW21haWx0bzp3ZWku
bGl1MkBjaXRyaXguY29tXQo+IFNlbnQ6IDIzIEp1bHkgMjAxOCAxNToyNgo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47Cj4gQW5kcmV3IENv
b3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPiA8R2Vvcmdl
LkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+
OyBKdWxpZW4KPiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBLb25yYWQgUnplc3p1dGVr
IFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbQo+IChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMTIvMTNd
IHg4NjogYWRkIGlvbW11X29wcyB0byBtb2RpZnkgYW5kIGZsdXNoCj4gSU9NTVUgbWFwcGluZ3MK
PiAKPiBPbiBUdWUsIEp1bCAxNywgMjAxOCBhdCAwMjozODoxNVBNICswMTAwLCBQYXVsIER1cnJh
bnQgd3JvdGU6Cj4gWy4uLl0KPiA+ICtzdGF0aWMgaW50IGlvbW11b3BfdW5tYXAoc3RydWN0IHhl
bl9pb21tdV9vcF91bm1hcCAqb3ApCj4gPiArewo+IFsuLi5dCj4gPiArCj4gPiArICAgIGlmICgg
IWlvbW11X3VubWFwX3BhZ2UoY3VycmQsIGJmbikgKQo+ID4gKyAgICAgICAgcmMgPSAtRUlPOwo+
IAo+IFNvIGl0IGlzIGFuIGVycm9yIHRvIHVubWFwIHRoZSBwYWdlIHN1Y2Nlc3NmdWxseT8gSW4g
ZmFjdCB0aGlzIHNhbWUgbGluZQo+IGlzIGNoYW5nZWQgaW4gdGhlIG5leHQgcGF0Y2guIEkgc3Vw
cG9zZSB0aGUgY29kZSBoZXJlIGlzIHdyb25nLgoKWWVzLCB0aGF0IGxvb2tzIHdyb25nLiBJJ2xs
IGNoZWNrLgoKICBUaGFua3MsCgogICAgUGF1bAoKPiAKPiBXZWkuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
