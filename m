From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v7 10/11] viridian: add implementation of
 synthetic timers
Date: Fri, 15 Mar 2019 16:18:21 +0000
Message-ID: <90eb4d70365b488c8f5ba00d49c71500@AMSPEX02CL02.citrite.net>
References: <20190314181117.1531-1-paul.durrant@citrix.com>
 <20190314181117.1531-11-paul.durrant@citrix.com>
 <5C8B7608020000780021F0B1@prv1-mh.provo.novell.com>
 <f8a9964bf2e94b3ba2d17b1037c7d31c@AMSPEX02CL02.citrite.net>
 <5C8BCFEC020000780021F635@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OLlw=RS=citrix.com=prvs=970e08f8f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h4pq9-0000Mg-6v
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 16:37:49 +0000
In-Reply-To: <5C8BCFEC020000780021F635@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTUgTWFyY2ggMjAxOSAxNjoxNwo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbT47IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEph
Y2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUKPiA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsKPiB4ZW4tZGV2ZWwgPHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT47IFRpbQo+IChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Cj4gU3ViamVjdDog
UkU6IFtQQVRDSCB2NyAxMC8xMV0gdmlyaWRpYW46IGFkZCBpbXBsZW1lbnRhdGlvbiBvZiBzeW50
aGV0aWMgdGltZXJzCj4gCj4gPj4+IE9uIDE1LjAzLjE5IGF0IDE2OjQwLCA8UGF1bC5EdXJyYW50
QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gU28sIEFJVUkgdGhlIHJlYXNvbiB5b3Ugd2FudGVkIGl0
IGFkZGVkIHdhcyB0aGF0IHlvdSB3YW50ZWQgdG8gYXZvaWQKPiA+IG11bHRpcGxlIGNhbGxzIGh2
bV92Y3B1X2hhc19wZW5kaW5nX2lycSgpIGZyb20gcmV0dXJuaW5nIGRpZmZlcmVudCBpbnRhY2sK
PiA+IHZhbHVlcz8gQnV0IGxvb2tpbmcgYWdhaW4sIHRoaXMgY291bGQgZWFzaWx5IGhhcHBlbiBp
ZiBhIGhpZ2hlciBpcnIgYml0IGdldHMKPiA+IHNldCBiZXR3ZWVuIGNhbGxzICh3aGljaCBjYW4g
YXBwYXJlbnRseSBoYXBwZW4gYXN5bmNocm9ub3VzbHkpIHNvIEknbSByZWFsbHkKPiA+IG5vIGxv
bmdlciBzdXJlIHdoeSBJIG5lZWQgdG8gYXZvaWQgbXVsdGlwbGUgcG9sbHMuIFdoYXQgaXMgdGhl
IHByb2JsZW0gdGhhdAo+ID4gbmVlZHMgdG8gYmUgYXZvaWRlZD8KPiAKPiBIbW0sIHRydWUuIExv
b2tzIGxpa2UgSSd2ZSBtaXMtZ3VpZGVkIHlvdSwgSSdtIHNvcnJ5IGZvciB0aGF0Lgo+IAoKT2su
IEknbGwgc2VuZCBhIGZvbGxvdy11cCBwYXRjaCB0byBwdWxsIGl0IG91dCwgYW5kIEkndmUgYWxz
byBqdXN0IG5vdyBmb3VuZCBhIG1pc3Rha2UgaW4gdGhlIGhhbmRsaW5nIG9mIGFic29sdXRlIHRp
bWVycyBzbyBJJ2xsIHNlbmQgYSBwYXRjaCBmb3IgdGhhdCB0b28uCgogIFBhdWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
