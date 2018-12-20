From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 07/18] errno: add POSIX error codes
 EMSGSIZE, ECONNREFUSED to the ABI
Date: Thu, 20 Dec 2018 08:22:31 -0700
Message-ID: <5C1BB3B70200007800208203@prv1-mh.provo.novell.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
 <1545287955-27684-8-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ga09i-00083J-6v
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:22:34 +0000
In-Reply-To: <1545287955-27684-8-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDA3OjM5LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IEVNU0dTSVpFOiBBcmdvJ3Mgc2VuZHYgb3BlcmF0aW9uIHdpbGwgcmV0dXJuIEVN
U0dTSVpFIHdoZW4gYW4gZXhjZXNzIGFtb3VudAo+IG9mIGRhdGEsIGFjcm9zcyBhbGwgaW92cywg
aGFzIGJlZW4gc3VwcGxpZWQsIGV4Y2VlZGluZyBlaXRoZXIgdGhlIHN0YXRpY2FsbHkKPiBjb25m
aWd1cmVkIG1heGltdW0gc2l6ZSBvZiBhIHRyYW5zbWl0dGFibGUgbWVzc2FnZSwgb3IgdGhlICh2
YXJpYWJsZSkgc2l6ZQo+IG9mIHRoZSByaW5nIHJlZ2lzdGVyZWQgYnkgdGhlIGRlc3RpbmF0aW9u
IGRvbWFpbi4KPiAKPiBFQ09OTlJFRlVTRUQ6IEFyZ28ncyByZWdpc3RlciBvcGVyYXRpb24gd2ls
bCByZXR1cm4gRUNPTk5SRUZVU0VEIGlmIGEgcmluZwo+IGlzIGJlaW5nIHJlZ2lzdGVyZWQgdG8g
Y29tbXVuaWNhdGUgd2l0aCBhIHNwZWNpZmljIHJlbW90ZSBkb21haW4gdGhhdCBkb2VzCj4gZXhp
c3QgYnV0IGlzIG5vdCBhcmdvLWVuYWJsZWQuCj4gCj4gVGhlc2UgY29kZXMgYXJlIGRlc2NyaWJl
ZCBieSBQT1NJWCBoZXJlOgo+IGh0dHA6Ly9wdWJzLm9wZW5ncm91cC5vcmcvb25saW5lcHVicy85
Njk5OTE5Nzk5L2Jhc2VkZWZzL2Vycm5vLmguaHRtbCAKPiAgICAgRU1TR1NJWkUgICAgIDogIk1l
c3NhZ2UgdG9vIGxhcmdlIgo+ICAgICBFQ09OTlJFRlVTRUQgOiAiQ29ubmVjdGlvbiByZWZ1c2Vk
Ii4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xh
cms2QGJhZXN5c3RlbXMuY29tPgoKQWxtb3N0IC0gd2hhdCdzIHN0aWxsIG1pc3NpbmcgaXMgdGhl
IChzaW1wbGUpIHJhdGlvbmFsZSBiZWhpbmQgdGhlCnZhbHVlcyBjaG9zZW4uIFdpdGggYSBzZW50
ZW5jZSBhZGRlZCBzYXlpbmcgdGhleSBjb21lIGZyb20KTGludXggbGlrZSB0aGUgcmVzdCBvZiB0
aGUgbnVtYmVycywKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
