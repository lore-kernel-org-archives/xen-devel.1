From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 6/6] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Mon, 26 Nov 2018 01:42:20 -0700
Message-ID: <5BFBB1EC02000078001FFBC3@prv1-mh.provo.novell.com>
References: <20181120160153.45259-7-roger.pau@citrix.com>
 <5BF43A1902000078001FE31E@prv1-mh.provo.novell.com>
 <20181120232627.GA31051@amd.com>
 <5BF523A002000078001FE537@prv1-mh.provo.novell.com>
 <20181121103744.pw6qiwasi6qsu63d@mac>
 <5BF53A5A02000078001FE684@prv1-mh.provo.novell.com>
 <20181121115131.wjpmhjsnesfdw2c4@mac>
 <5BF55C5202000078001FE816@prv1-mh.provo.novell.com>
 <20181122124744.ekm2wappzsod2opb@mac>
 <5BF6AD2E02000078001FEE49@prv1-mh.provo.novell.com>
 <20181123143651.mdmrhg5kunlmioz2@mac>
 <60B388B7020000D60063616D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRCTO-0000yQ-Rn
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 08:42:30 +0000
In-Reply-To: <60B388B7020000D60063616D@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjExLjE4IGF0IDE1OjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTm92IDIyLCAyMDE4IGF0IDA2OjIwOjQ2QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjIuMTEuMTggYXQgMTM6NDcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSSB0aGluayB0aGUgaXNfaGFyZHdhcmVfZG9tYWluIHBhcnQgY2FuIGJlIGRy
b3BwZWQgZnJvbSB0aGUKPj4gPiBjb25kaXRpb25hbCBJJ20gYWRkaW5nLiB1cGRhdGVfcGFnaW5n
X21vZGUgc2hvdWxkbid0IGJlIHVzZWQgdG8gZGVjaWRlCj4+ID4gd2hldGhlciBhIGRvbWFpbiBj
YW4gb3IgY2Fubm90IGhhdmUgYnJpZGdlcyBhdHRhY2hlZC4gV2hldGhlciBhIERvbVUKPj4gPiBj
YW4gb3IgY2Fubm90IGhhdmUgYSBob3N0IGJyaWRnZSBhc3NpZ25lZCBzaG91bGQgYmUgZGVjaWRl
ZCBhdAo+PiA+IGFzc2lnbmF0aW9uIHRpbWUsIGFuZCBoZW5jZSB1cGRhdGVfcGFnaW5nX21vZGUg
c2hvdWxkbid0IGhhdmUgaGFyZHdhcmUKPj4gPiBkb21haW4gc3BlY2lmaWMgY2hlY2tzLgo+PiAK
Pj4gT2theSwgd2UncmUgaW4gYWdyZWVtZW50IHRoZW4uCj4+IAo+PiA+IFJlZ2FyZGluZyB0aGUg
Y2hlY2sgaW4gYW1kX2lvbW11X2FkZF9kZXZpY2UsIGlmIGl0J3MgcmVtb3ZlZCBmcm9tCj4+ID4g
dGhlcmUgYW1kX2lvbW11X2FkZF9kZXZpY2Ugd291bGQgcmV0dXJuIGFuIGVycm9yIHdoZW4gYWRk
aW5nIGEgaG9zdAo+PiA+IGJyaWRnZSBkZXZpY2UsIGFuZCB0aGF0IHdvdWxkIGNhdXNlIHNldHVw
X29uZV9od2RvbV9kZXZpY2UgdG8gcmV0dXJuCj4+ID4gZWFybHkgYW5kIG5vdCBzZXR1cCB2UENJ
IGhhbmRsZXJzIGZvciBob3N0IGJyaWRnZXMsIHNvIEkgdGhpbmsgd2Ugd2FudAo+PiA+IHRvIGxl
YXZlIHRoYXQgb25lIGFzLWlzLgo+PiAKPj4gUmlnaHQsIEkgY2FuIHNlZSB3aHkgaXQgbWF5IGJl
IGJldHRlciB0byByZXRhaW4gaXQgdGhlcmUuCj4gCj4gVGhhbmtzLiBXb3VsZCB5b3UgbGlrZSBt
ZSB0byByZXNlbmQgdGhlIHNlcmllcyB3aXRoIHRoaXMgZml4LCBvcgo+IHNob3VsZCBJIHdhaXQg
Zm9yIGZlZWRiYWNrIG9uIHRoZSByZW1haW5pbmcgcGF0Y2hlcz8KCkknZCBsZWF2ZSB0aGF0IHVw
IHRvIHlvdS4gSSBoYXZlIHlldCB0byBmaW5kIHRpbWUgdG8gbG9vayBhdCBwYXRjaGVzCjEsIDIs
IGFuZCAzIGFnYWluLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
