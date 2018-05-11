From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/2] doc: correct livepatch.markdown
 syntax
Date: Fri, 11 May 2018 18:58:40 +0100
Message-ID: <534355ae-f01c-1312-f191-cc02b4541845@citrix.com>
References: <20180508064731.12391-1-jgross@suse.com>
 <20180508064731.12391-2-jgross@suse.com>
 <8c20fe4f-ec3b-678d-fb16-bef1929926a5@citrix.com>
 <20180511175622.GA10866@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9qf6=h6=citrix.com=prvs=6620dc017=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fHCK1-0007ba-Bx
 for xen-devel@lists.xenproject.org; Fri, 11 May 2018 17:59:13 +0000
In-Reply-To: <20180511175622.GA10866@char.us.oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, tim@xen.org, ian.jackson@eu.citrix.com, ross.lagerwall@citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDUvMTggMTg6NTYsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPiBPbiBUdWUs
IE1heSAwOCwgMjAxOCBhdCAxMTo1MTo0N0FNICswMTAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+
PiBPbiAwNS8wOC8yMDE4IDA3OjQ3IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gIm1ha2Ug
LUMgZG9jcyBhbGwiIGZhaWxzIGR1ZSB0byBpbmNvcnJlY3QgbWFya2Rvd24gc3ludGF4IGluCj4+
PiBsaXZlcGF0Y2gubWFya2Rvd24uIENvcnJlY3QgaXQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4gR2l0IGNvbXBsYWlucyBv
ZiB0cmFpbGluZyB3aGl0ZXNwYWNlOgo+Pgo+PiBJbXBvcnRpbmcgcGF0Y2ggImRvYy1jb3JyZWN0
LWxpdmVwYXRjaC1tYXJrZG93biIgLi4uIDxzdGRpbj46Njk6Cj4+IHRyYWlsaW5nIHdoaXRlc3Bh
Y2UuCj4+Cj4+IDxzdGRpbj46NzI6IHRyYWlsaW5nIHdoaXRlc3BhY2UuCj4+Cj4+IDxzdGRpbj46
OTg6IHRyYWlsaW5nIHdoaXRlc3BhY2UuCj4+Cj4+IDxzdGRpbj46MjMyOiB0cmFpbGluZyB3aGl0
ZXNwYWNlLgo+Pgo+PiA8c3RkaW4+OjIzODogdHJhaWxpbmcgd2hpdGVzcGFjZS4KPiBUaGF0IGlz
IG9uIHB1cnBvc2UuIFRoYXQgaXMgeW91IG5lZWQgdGhvc2UgdHdvIHNwYWNlcyBhdCB0aGUgZW5k
IHRvIGZvcmNlCj4gaXQgdG8gc3RheSBpbiAnY29kZScgbW9kZS4KClBsZWFzZSBzZWUgbXkgMy41
IHdoaWNoIGRvZXMgYSBsb2FkIG9mIGNsZWFudXAuwqAgSSd2ZSBkZWxldGVkIGFsbAp0cmFpbGlu
ZyB3aGl0ZXNwYWNlIGFuZCB0aGUgZW5kIHJlc3VsdCByZW5kZXJzIGNvcnJlY3RseSBpbiBIVE1M
IGFuZCBQREYuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
