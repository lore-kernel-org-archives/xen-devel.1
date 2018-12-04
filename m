From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/4] amd-iommu: add flush iommu_ops
Date: Tue, 04 Dec 2018 07:24:49 -0700
Message-ID: <5C068E310200007800202B78@prv1-mh.provo.novell.com>
References: <20181203174017.11956-1-paul.durrant@citrix.com>
 <20181203174017.11956-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uzs+=on=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUBd8-0002WF-Gg
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 14:24:54 +0000
In-Reply-To: <20181203174017.11956-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjEyLjE4IGF0IDE4OjQwLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBmbHVzaF9jb3VudCh1bnNpZ25lZCBsb25nIGRmbiwg
dW5zaWduZWQgaW50IHBhZ2VfY291bnQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBvcmRlcikKPiArewo+ICsgICAgdW5zaWduZWQgbG9uZyBzdGFydCA9
IGRmbiAvICgxdSA8PCBvcmRlcik7Cj4gKyAgICB1bnNpZ25lZCBsb25nIGVuZCA9IERJVl9ST1VO
RF9VUChkZm4gKyBwYWdlX2NvdW50LCAoMXUgPDwgb3JkZXIpKTsKCkx1Y2tpbHkgdGhpcyBpbiBu
b3QgaW4gZ2VuZXJpYyBjb2RlLCBzbyB0aGUgYW5vbWFseSBhdCB0aGUgdXBwZXIgYWRkcmVzcwpz
cGFjZSBlbmQgaXMgbm90IGdvaW5nIHRvIHN1cmZhY2UsIGFuZCBpbiBwYXJ0aWN1bGFyIG5vdCBj
YXVzZSAuLi4KCj4gKyAgICBBU1NFUlQoZW5kID4gc3RhcnQpOwoKLi4uIHRoaXMgdG8gdHJpZ2dl
ci4gSSB0aGVyZWZvcmUgbmV2ZXJ0aGVsZXNzIHdvbmRlciB3aGV0aGVyIGl0CndvdWxkJ3QgYmUg
YmV0dGVyIHRvIHVzZQoKICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQgPSBkZm4gPj4gb3JkZXI7CiAg
ICB1bnNpZ25lZCBsb25nIGVuZCA9IChkZm4gKyBwYWdlX2NvdW50IC0gMSkgPj4gb3JkZXIpICsg
MTsKCmluc3RlYWQuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4gKysrIGIveGVu
L2luY2x1ZGUveGVuL2lvbW11LmgKPiBAQCAtNTIsNiArNTIsMTEgQEAgc3RhdGljIGlubGluZSBi
b29sX3QgZGZuX2VxKGRmbl90IHgsIGRmbl90IHkpCj4gICAgICByZXR1cm4gZGZuX3goeCkgPT0g
ZGZuX3goeSk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUgYm9vbF90IGRmbl9sdChkZm5fdCB4
LCBkZm5fdCB5KQo+ICt7Cj4gKyAgICByZXR1cm4gZGZuX3goeCkgPCBkZm5feCh5KTsKPiArfQoK
VGhlIHJldmlzaW9uIGxvZyBzYXlzIHRoaXMgaXMgZ29uZSAuLi4KCldpdGggaXQgcmVhbGx5IGdv
bmUsIGFuZCBpcnJlc3BlY3RpdmUgb2YgdGhlIG90aGVyIGNvbW1lbnQKUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCk9mIGNvdXJzZSBvbmUgb3IgYm90aCBhZGp1
c3RtZW50cyBjb3VsZCBiZSBlYXNpbHkgZG9uZSB3aGlsZQpjb21taXR0aW5nLCBwcm92aWRlZCB5
b3UgYWdyZWUgYW5kIHByb3ZpZGVkIHRoZXJlJ3Mgbm8gb3RoZXIKbmVlZCBmb3IgYSB2My4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
