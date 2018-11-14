From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Wed, 14 Nov 2018 13:10:52 +0000
Message-ID: <0e30f5ef-59cf-57c1-40e5-5d8cb0dd862e@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
 <alpine.DEB.2.10.1811121738570.8259@sstabellini-ThinkPad-X260>
 <34830ab6-53dc-52c5-680d-a654d4b1ce4f@arm.com>
 <alpine.DEB.2.10.1811131108330.8259@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aca3=nz=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gMuwc-0006x3-LF
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 13:10:58 +0000
In-Reply-To: <alpine.DEB.2.10.1811131108330.8259@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Xen Devel <xen-devel@lists.xen.org>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMy8xMS8yMDE4IDIwOjM5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gVHVl
LCAxMyBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IElmIHdlIG1hcmsgdGhlIGRv
bVUgc2ltcGx5IGFzICJwYXVzZWQiIGl0IHdpbGwgYmUgZGlmZmljdWx0IHRvIGltcGxlbWVudAo+
IGNvcnJlY3RseSAieGwgcmVzdG9yZSIgLyAieGwgdHJpZ2dlciBzM3Jlc3VtZSIuIFdlIHNob3Vs
ZCBiZSBhYmxlIHRvCj4gZGlzdGluZ3Vpc2ggYSBkb21haW4gd2hpY2ggaXMgc2ltcGx5IG5vdCBy
dW5uaW5nIG9yIHBhdXNlZCAoYXMgaW4gInhsCj4gcGF1c2UiKSBmcm9tIG9uZSB0aGF0IGhhcyBi
ZWVuIHB1dCB0byBzbGVlcC4gIE90aGVyd2lzZSB3ZSB3b24ndCBiZSBhYmxlCj4gdG8gdXNlICJ4
bCBwYXVzZSIgaW4gaXRzIG9yaWdpbmFsIHNlbnNlIGFueW1vcmUuICJ4bCBwYXVzZSIgd2lsbCBi
ZWNvbWUKPiBlZmZlY3RpdmVseSAieGwgdHJpZ2dlciBzbGVlcCIgb24gQVJNLiBXaGljaCBpcyBz
b21ldGhpbmcgdG8gY29uc2lkZXIKPiBidXQgSSBkb24ndCB0aGluayB0aGF0IGlzIHdoYXQgd2Ug
d2FudC4KCkkgZGlkbid0IHN1Z2dlc3RlZCB0byBvbmx5IHVzZSB0aG9zZSAyIGhlbHBlcnMuIEJ1
dCB5b3UgY2FuIGJ1aWxkIHN1c3BlbmQvcmVzdW1lIApvbiB0b3Agb2YgaXQuIEFGQUlDVCwgdGhp
cyBpcyBob3cgczMgc3VzcGVuZC9yZXN1bWUgd29ya3Mgb24geDg2IEhWTS4KCj4gCj4gVGhlIG1v
c3Qgc2ltaWxhciBmZWF0dXJlIGlzIEFDUEkgUzMgaW4geDg2LWxhbmQgYnV0IHRoZSBjdXJyZW50
IGNhbGxzCj4gYXJlIHNvIEFDUEkveDg2IHNwZWNpZmljIHRoYXQgZG9uJ3QgbWFrZSBtdWNoIHNl
bnNlIG9uIGEgQUNQSS1sZXNzIEFSTQo+IGltcGxlbWVudGF0aW9uLiBJZiBJIGFtIG5vdCBtaXN0
YWtlbiwgb24geDg2IHRoZXJlIGlzIGEgc3BlY2lhbCBzdHJ1Y3QKPiBkb21haW4gZmxhZyBmb3Ig
dGhpczogZC0+YXJjaC5odm0uaXNfczNfc3VzcGVuZGVkLgo+IAo+IAo+IExldCdzIGxlYXZlIGFz
aWRlIHRoZSAid2hpY2ggY29tbWFuZHMgc2hvdWxkIHdlIHVzZSIgZGlzY3Vzc2lvbiBmb3Igbm93
Cj4gYmVjYXVzZSBpdCBkb2Vzbid0IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCBzZXJpZXMuIEl0IHNl
ZW1zIHRvIG1lIHRoYXQgdGhlCj4gYmVzdCBvcHRpb24gaXMgdG8gaW50cm9kdWNlIGEgbmV3IEFS
TSBzcGVjaWZpYyBzdHJ1Y3QgZG9tYWluIGZsYWcsCj4gc29tZXRoaW5nIGFraW4gdG8gZC0+YXJj
aC5odm0uaXNfczNfc3VzcGVuZGVkIGJ1dCBBUk0gUFNDSSBzcGVjaWZpYy4KClNlZSBhYm92ZS4K
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
