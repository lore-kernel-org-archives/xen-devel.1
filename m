From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] iommu: fix order of arguments in
 iommu_map call at iommu_hwdom_init
Date: Thu, 24 Jan 2019 02:51:08 -0700
Message-ID: <5C498A8C0200007800210BB7@prv1-mh.provo.novell.com>
References: <20190123180818.78684-1-roger.pau@citrix.com>
 <5C4988310200007800210B94@prv1-mh.provo.novell.com>
 <b48d045357b24b75887d308775b3fbc4@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmbfH-0004Qf-Hu
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 09:51:15 +0000
In-Reply-To: <b48d045357b24b75887d308775b3fbc4@AMSPEX02CL03.citrite.net>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjAxLjE5IGF0IDEwOjQzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMjQgSmFudWFyeSAyMDE5IDA5OjQxCj4+
IFRvOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBDYzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbCA8eGVuLQo+PiBkZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCBmb3ItNC4xMl0g
aW9tbXU6IGZpeCBvcmRlciBvZiBhcmd1bWVudHMgaW4gaW9tbXVfbWFwCj4+IGNhbGwgYXQgaW9t
bXVfaHdkb21faW5pdAo+PiAKPj4gPj4+IE9uIDIzLjAxLjE5IGF0IDE5OjA4LCA8cm9nZXIucGF1
QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+IFRoZSBvcmRlciBvZiB0aGUgcGFnZV9vcmRlciBhbmQg
dGhlIGZsYWdzIHBhcmFtZXRlcnMgYXJlIGludmVydGVkIGluCj4+ID4gdGhlIGNhbGwgdG8gaW9t
bXVfbWFwIG1hZGUgaW4gaW9tbXVfaHdkb21faW5pdC4KPj4gPgo+PiA+IEZpeGVzOiBlOGFmZTEx
MjRjYzEgKCJpb21tdTogZWxpZGUgZmx1c2hpbmcgZm9yIGhpZ2hlciBvcmRlciBtYXAvdW5tYXAK
Pj4gb3BlcmF0aW9ucyIpCj4+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4+IAo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+PiAKPj4gSWYgeW91IGRvbid0IG1pbmQgSSdkIGNvbnZlcnQgdG8gUEFH
RV9PUkRFUl80SyB3aGlsZSBjb21taXR0aW5nLgo+IAo+IE5vLCBJIGRvbid0IHRoaW5rIHRoYXQn
cyBjb3JyZWN0IGlzIGl0PyBUaGlzIGNvZGUgaXMgY29tbW9uLCBub3QgeDg2IAo+IHNwZWNpZmlj
IGFuZCBzbyA0SyBtYXkgbm90IGJlIHRoZSBiYXNlIG9yZGVyLgoKT2gsIGluZGVlZCwgcmlnaHQg
eW91IGFyZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
