From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ping: [PATCH v2] x86: assorted array_index_nospec()
 insertions
Date: Mon, 27 Aug 2018 00:55:39 -0600
Message-ID: <5B83A06B02000078001E1FC3@prv1-mh.provo.novell.com>
References: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
 <5B752FC302000078001DEBC0@prv1-mh.provo.novell.com>
 <5f9cdf71b51f44f994399ddcd558d203@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jola=lk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuBRC-0001JL-W9
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 06:55:47 +0000
In-Reply-To: <5f9cdf71b51f44f994399ddcd558d203@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA4LjE4IGF0IDEwOjQwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTYgQXVndXN0IDIwMTggMDk6MDMKPj4g
VG86IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+Cj4+IENjOiBSYXp2
YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+OyBQYXVsIER1cnJhbnQKPj4g
PFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc+Owo+PiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+
IFN1YmplY3Q6IFBpbmc6IFtQQVRDSCB2Ml0geDg2OiBhc3NvcnRlZCBhcnJheV9pbmRleF9ub3Nw
ZWMoKSBpbnNlcnRpb25zCj4+IAo+PiA+Pj4gT24gMjYuMDcuMTggYXQgMTU6MDcsICB3cm90ZToK
Pj4gPiBEb24ndCBjaGFuY2UgaGF2aW5nIFNwZWN0cmUgdjEgKGluY2x1ZGluZyBCQ0JTKSBnYWRn
ZXRzLiBJbiBzb21lIG9mIHRoZQo+PiA+IGNhc2VzIHRoZSBpbnNlcnRpb25zIGFyZSBtb3JlIG9m
IHByZWNhdXRpb25hcnkgbmF0dXJlIHJhdGhlciB0aGFuIHRoZXJlCj4+ID4gcHJvdmFibHkgYmVp
bmcgYSBnYWRnZXQsIGJ1dCBJIHRoaW5rIHdlIHNob3VsZCBlcnIgb24gdGhlIHNhZmUgKHNlY3Vy
ZSkKPj4gPiBzaWRlIGhlcmUuCj4+ID4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+CgpUaGFua3MsIGJ1dCB5b3UnZCBnaXZlbiB0aGlzIGFscmVhZHku
IFRoZSBwaW5nIHJlYWxseSB3YXMgZm9yIEFuZHJldwp0byBnaXZlIGFuIGFjayBvciBvdGhlcndp
c2UuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
