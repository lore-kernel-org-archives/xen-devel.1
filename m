From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Wed, 24 Jan 2018 09:42:57 -0500
Message-ID: <09f251da-dc93-ab72-c076-0ab51ad5ac5e@oracle.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <cfa0d19b-ace7-4d41-7889-ec9ff6eef85a@suse.com>
 <20180118103330.6ampgvc5ovejzyfp@citrix.com>
 <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
 <CAFLBxZYaoUzqH4OGnn56qjX8KzAWWSVJqToWqRLncVC+kLxvZg@mail.gmail.com>
 <20180124105453.xlaech23qkl6ebni@MacBook-Pro-de-Roger.local>
 <ee015869-6b7d-c12a-4f2f-266c8bccb2d8@suse.com>
 <fc33fe29-9e99-56e5-e064-7fefd28f7fe7@oracle.com>
 <8bada700-d1b0-d1ef-50f0-cff8f6247340@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kpe7=et=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eeMIK-0002dV-J5
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 14:44:56 +0000
In-Reply-To: <8bada700-d1b0-d1ef-50f0-cff8f6247340@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjQvMjAxOCAwOToyNSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNC8wMS8x
OCAxNToxMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pgo+PiBJIHN1c3BlY3Qgd2UgY2FuIGRv
IGFzIGxpdHRsZSBhcyByZW1vdmluZyAiI2lmZGVmIENPTkZJR19LRVhFQyIgYXJvdW5kCj4+IGFj
cGlfcnNkcCBpbiBkcml2ZXJzL2FjcGkvb3NsLmMgYW5kIHRoZW4gYXNzaWduaW5nIGl0IHRoZSB2
YWx1ZSBpbgo+PiBwdmhfc3RhcnRfaW5mby5yc2RwX3BhZGRyLiAoSSBoYXZlbid0IHRyaWVkIGl0
KQo+IFRoYXQgd2FzIHRoZSBhcHByb2FjaCBJIHN0YXJ0ZWQgd2l0aCAobW9yZSBvciBsZXNzKS4g
SXQgd2FzIHNlZW4gYXMgYQo+IGxheWVyaW5nIHZpb2xhdGlvbi4KPgo+IEknZCByYXRoZXIgdGFr
ZSB0aGUgYXBwcm9hY2ggbGlrZSBpbgo+Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcC5naXQvY29tbWl0Lz9oPXg4Ni9ib290JmlkPTBjODlj
ZjM2NDI0ZjdjMTE3N2RlOGE1NzEyNTE0ZDdjYzJlYjM2OWYKPgo+IGFuZCBoYXZlIGEgUFZIIHNw
ZWNpZmljIGFjcGlfYXJjaF9nZXRfcm9vdF9wb2ludGVyKCkgaW5zdGVhZCBvbmUgaW4KPiBhcmNo
L3g4Ni9rZXJuZWwvYWNwaS9ib290LmMuIFRoaXMgY2FuIGxhdGVyIGJlIG1vZGlmaWVkIGVhc2ls
eSB0bwo+IHRha2UgdGhlIFJTRFAgYWRkcmVzcyBmcm9tIGJvb3QgcGFyYW1zIGluc3RlYWQuCgpT
dXJlLgoKSW4gdGhlIG1lYW50aW1lIEkgYXNzdW1lIHRoaXMgcGF0Y2ggd2lsbCBiZSByZXZlcnRl
ZCBmcm9tIHN0YWdpbmcgdW50aWwKTGludXggaXMgdGFrZW4gY2FyZSBvZj8KCi1ib3JpcwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
