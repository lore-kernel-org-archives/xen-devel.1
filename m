From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] build: remove shim related targets
Date: Tue, 20 Feb 2018 02:04:24 -0700
Message-ID: <5A8BF2A802000078001A97A6@prv-mh.provo.novell.com>
References: <5A8ADDCD02000078001A908E@prv-mh.provo.novell.com>
 <20180220082351.24967-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wunw=fo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eo3qm-0007ii-15
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 09:04:36 +0000
In-Reply-To: <20180220082351.24967-1-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE4IGF0IDA5OjIzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZXJlJ3Mgbm8gbmVlZCB0byBoYXZlIHNoaW0gc3BlY2lmaWMgdGFyZ2V0cywgc28ganVzdCB1
c2UgdGhlIHJlZ3VsYXIKPiB4ZW4gbWFrZWZpbGUgdGFyZ2V0cyBpbiBvcmRlciB0byBidWlsZCB0
aGUgc2hpbSBiaW5hcnkuCj4gCj4gV2hlbiB0aGUgc2hpbSBpcyBidWlsZCBhcyBwYXJ0IG9mIHRo
ZSBmaXJtd2FyZSBkaXJlY3RvcnkgdXNlIHRoZQo+IHhlbi1zeW1zIGFzIHRoZSBzaGltIGJpbmFy
eS4KCldoeSB0aGUgKG11Y2ggbGFyZ2VyKSB4ZW4tc3ltcyBpbnN0ZWFkIG9mIHhlbj8KCj4gLS0t
IGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL2Zpcm13YXJl
L3hlbi1kaXIvTWFrZWZpbGUKPiBAQCAtNDgsMTAgKzQ4LDEwIEBAIHNoaW0tJWNvbmZpZzogJChE
KSBGT1JDRQo+ICAJCUtDT05GSUdfQ09ORklHPSQoQ1VSRElSKS9zaGltLmNvbmZpZwo+ICAKPiAg
eGVuLXNoaW06ICQoRCkgc2hpbS1vbGRkZWZjb25maWcKPiAtCSQoTUFLRSkgLUMgJChEKS94ZW4g
aW5zdGFsbC1zaGltIFwKPiArCSQoTUFLRSkgLUMgJChEKS94ZW4gYnVpbGQgXAoKaW5zdGFsbC14
ZW4gPwoKPiAgCQlYRU5fQ09ORklHX0VYUEVSVD15IFwKPiAtCQlLQ09ORklHX0NPTkZJRz0kKENV
UkRJUikvc2hpbS5jb25maWcgXAo+IC0JCURFU1RESVI9JChDVVJESVIpCj4gKwkJS0NPTkZJR19D
T05GSUc9JChDVVJESVIpL3NoaW0uY29uZmlnCj4gKwljcCAkKEQpL3hlbi94ZW4tc3ltcyB4ZW4t
c2hpbQoKbG4/IE9yIGRvIGhlcmUgd2hhdCB3YXMgZG9uZSAuLi4KCj4gQEAgLTE0OSwxMSArMTQ5
LDYgQEAgJChUQVJHRVQpLXN5bXM6IHByZWxpbmsubyB4ZW4ubGRzICQoQkFTRURJUikvY29tbW9u
L3N5bWJvbHMtZHVtbXkubwo+ICAJCT4kKEBEKS8kKEBGKS5tYXAKPiAgCXJtIC1mICQoQEQpLy4k
KEBGKS5bMC05XSoKPiAgCj4gLSMgVXNlIGVsZjMyLXg4Ni02NCBpZiB0b29sY2hhaW4gc3VwcG9y
dCBleGlzdHMsIGVsZjMyLWkzODYgb3RoZXJ3aXNlLgo+IC0kKFRBUkdFVCktc2hpbTogRk9STUFU
ID0gJChmaXJzdHdvcmQgJChmaWx0ZXIgZWxmMzIteDg2LTY0LCQoc2hlbGwgCj4gJChPQkpDT1BZ
KSAtLWhlbHApKSBlbGYzMi1pMzg2KQo+IC0kKFRBUkdFVCktc2hpbTogJChUQVJHRVQpLXN5bXMK
PiAtCSQoT0JKQ09QWSkgLU8gJChGT1JNQVQpICQ8ICRACgouLi4gaGVyZSBzbyBmYXI/IFRoZSBy
ZW1vdmFsIG9mIHRoaXMgc3RlcCB3b3VsZCBvdGhlcndzaWUgcmVxdWlyZQptb3JlIGV4cGxhbmF0
aW9uIC0gSSByZWNhbGwgaGF2aW5nIGlucXVpcmVkIGFib3V0IHRoaXMgYmVmb3JlOiBJZgp0aGVy
ZSB3YXMgYSByZWFzb24gZm9yIGRvaW5nIHRoaXMsIGlmIHNob3VsZG4ndCBiZSBkcm9wcGVkIHdp
dGhvdXQKc2F5aW5nIHdoeSB0aGUgb3RoZXIgYmluYXJ5IGlzIG5vdyBzdWRkZW5seSBmaW5lLCBi
dXQgd2Fzbid0IGJhY2sKdGhlbi4gT3IgYWx0ZXJuYXRpdmVseSBpdCB3b3VsZCBuZWVkIHRvIGJl
IGNsYXJpZmllZCB0aGF0IHRoaXMgc3RlcAp3YXMgaW5kZWVkIHBvaW50bGVzcy4KCkphbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
