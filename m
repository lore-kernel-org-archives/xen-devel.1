From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [RFC PATCH 1/2] Add Designated Reviewer (R:) to
 MAINTAINERS file and add support for it in get_maintainer.pl
Date: Fri, 13 Apr 2018 17:19:24 +0000
Message-ID: <013D718B-8390-4F8B-8721-29D5A6B2FB31@citrix.com>
References: <cover.1523635050.git.lars.kurth@citrix.com>
 <70d8b7669d8d2ab54fd68d9eef080d62593b75ed.1523635050.git.lars.kurth@citrix.com>
 <23248.58729.657638.99829@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j4gs=hc=citrix.com=prvs=634dd00d6=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1f72MN-0008GH-8I
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 17:19:39 +0000
In-Reply-To: <23248.58729.657638.99829@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <E3176B416486C449924812AD2B207A14@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDEzLzA0LzIwMTgsIDE4OjE0LCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIExhcnMgS3VydGggd3JpdGVzICgiW1JGQyBQQVRDSCAx
LzJdIEFkZCBEZXNpZ25hdGVkIFJldmlld2VyIChSOikgdG8gTUFJTlRBSU5FUlMgZmlsZSBhbmQg
YWRkIHN1cHBvcnQgZm9yIGl0IGluIGdldF9tYWludGFpbmVyLnBsIik6DQogICAgPiBUaGUgc3lu
dGF4IGhhcyBiZWVuIGNvcGllZCBmcm9tIHRoZSBMaW51eCBNYWludGFpbmVycyBmaWxlLiBJIG1v
dmVkIHRoZSBmb2xsb3dpbmcgTGludXgNCiAgICA+IGdldF9tYWludGFpbmVyLnBsIHBhdGNoZXMg
dG8gWGVuLCBmaXhpbmcgdXAgc29tZSBtZXJnZSBpc3N1ZXMgKGFuZCBhIGJ1ZykuDQogICAgLi4u
DQogICAgPiAgCQknbSEnID0+IFwkZW1haWxfbWFpbnRhaW5lciwNCiAgICA+ICsgICAgICAgICdy
IScgPT4gXCRlbWFpbF9yZXZpZXdlciwNCiAgICA+ICAJCSduIScgPT4gXCRlbWFpbF91c2VuYW1l
LA0KICAgIA0KICAgIFlvdXIgdGV4dCBlZGl0b3IgaGFzIHNvbWUgZGlmZmljdWx0eSB3aXRoIHRo
ZSB0YWJzIGhlcmUsIHJlc3VsdGluZyBpbg0KICAgIG1pc2FsaWdubWVudC4gIFNldCBpdHMgdGFi
IHdpZHRoIHRvIDggYW5kIHJlaW5kZW50Lg0KDQpJIG5vdGljZWQ6IHdpbGwgZml4Lg0KICAgIA0K
ICAgID4gKyAgICAgICAgfSBlbHNpZiAoJHB0eXBlIGVxICJSIikgew0KICAgID4gKyAgICAgICAg
bXkgKCRuYW1lLCAkYWRkcmVzcykgPSBwYXJzZV9lbWFpbCgkcHZhbHVlKTsNCiAgICA+ICsgICAg
ICAgIGlmICgkbmFtZSBlcSAiIikgew0KICAgID4gKyAgICAgICAgICAgIGlmICgkaSA+IDApIHsN
CiAgICA+ICsgICAgICAgICAgICBteSAkdHYgPSAkdHlwZXZhbHVlWyRpIC0gMV07DQogICAgPiAr
ICAgICAgICAgICAgaWYgKCR0diA9fiBtL14oW0EtWl0pOlxzKiguKikvKSB7DQogICAgPiArICAg
ICAgICAgICAgICAgIGlmICgkMSBlcSAiUCIpIHsNCiAgICA+ICsgICAgICAgICAgICAgICAgJG5h
bWUgPSAkMjsNCiAgICA+ICsgICAgICAgICAgICAgICAgJHB2YWx1ZSA9IGZvcm1hdF9lbWFpbCgk
bmFtZSwgJGFkZHJlc3MsICRlbWFpbF91c2VuYW1lKTsNCiAgICA+ICsgICAgICAgICAgICAgICAg
fQ0KICAgID4gKyAgICAgICAgICAgIH0NCiAgICA+ICsgICAgICAgICAgICB9DQogICAgPiArICAg
ICAgICB9DQogICAgDQogICAgV2hhdCBvbiBlYXJ0aCBpcyBhbGwgdGhpcyAgICBpZiAoJG5hbWUg
ZXEgIiIpICBzdHVmZiBkb2luZyA/ICBJcyBpdA0KICAgIGFwcHJvcHJpYXRlIGluIHRoaXMgY2Fz
ZSA/DQogICAgDQogICAgSWYgaXQgaXMgYWN0dWFsbHkgbmVlZGVkLCB5b3Ugc2hvdWxkIHByb2Jh
Ymx5IG5vdCBqdXN0IGN1dCBhbmQgcGFzdGUNCiAgICBpdC4NCiAgICANCkkgZG9uJ3Qga25vdyB3
aGV0aGVyIGl0IGlzIG5lZWRlZC4gVGhlIHNhbWUgY29kZSBibG9jayBvZiBjb2RlIGlzIGluIExp
bnV4IGFuZCBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtm
PXNjcmlwdHMvZ2V0X21haW50YWluZXIucGw7aD0zZmIxYWQ0YjY5NGQ2OGQ1ZjkwYWQ2NDI0MjBk
NGI1MGI5MzRlZDJiO2hiPUhFQUQgIGxpbmUgMTA4MiBvbndhcmRzDQoNCkxhcnMgDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
