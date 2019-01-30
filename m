From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.12 1/8] dom0/pvh: align allocation and
 mapping order to start address
Date: Wed, 30 Jan 2019 12:37:28 +0000
Message-ID: <20190130123728.qz4lylvgdf6xsb6n@zion.uk.xensource.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cj/s=QG=citrix.com=prvs=926cecb90=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gop7U-0007Fz-Rc
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 12:37:32 +0000
Content-Disposition: inline
In-Reply-To: <20190130103646.53649-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMTE6MzY6MzlBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IER1ZSB0byB0aGUgcmVjZW50IGNoYW5nZXMgaW4gdGhlIGlvbW11IG1hcHBpbmcg
bG9naWMsIHRoZSBzdGFydAo+IGFkZHJlc3NlcyBwcm92aWRlZCBuZWVkIHRvIGJlIGFsaWduZWQg
dG8gdGhlIG9yZGVyIGludGVuZGVkIHRvIGJlCj4gbWFwcGVkLgo+IAoKQ2FuIHlvdSByZWZlcmVu
Y2Ugc29tZSBjb21taXRzIGhlcmU/IFdoYXQgd291bGQgaGFwcGVuIGlmIHRoZSBhZGRyZXNzIGlz
Cm5vdCBhbGlnbmVkPwoKPiBkb20wIFBWSCBkb21haW4gYnVpbGRlciBkaWRuJ3QgdGFrZSB0aGlz
IGludG8gYWNjb3VudCB3aGVuIHBvcHVsYXRpbmcKPiB0aGUgcDJtLCBmaXggdGhpcyBieSBtYWtp
bmcgc3VyZSB0aGUgb3JkZXIgaXMgY2hvc2VuIHNvIHRoYXQgdGhlIHN0YXJ0Cj4gYWRkcmVzcyBp
cyBhbGlnbmVkIHRvIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4g
Q2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gV2l0aG91dCB0aGlzIHBh
dGNoIHRyeWluZyB0byBjcmVhdGUgYSBQVkggZG9tMCB3aWxsIHRyaWdnZXIgYW4gYXNzZXJ0Cj4g
b24gY2VydGFpbiBoYXJkd2FyZSBkZXBlbmRpbmcgb24gdGhlIG1lbW9yeSBtYXAuCj4gLS0tCj4g
IHhlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9i
dWlsZC5jIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiBpbmRleCA1MWNmNDkwODEx
Li5hNTcxZDE1YzEzIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5j
Cj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiBAQCAtMTUyLDYgKzE1Miw4
IEBAIHN0YXRpYyBpbnQgX19pbml0IHB2aF9wb3B1bGF0ZV9tZW1vcnlfcmFuZ2Uoc3RydWN0IGRv
bWFpbiAqZCwKPiAgCj4gICAgICAgICAgb3JkZXIgPSBnZXRfb3JkZXJfZnJvbV9wYWdlcyhlbmQg
LSBzdGFydCArIDEpOwo+ICAgICAgICAgIG9yZGVyID0gbWluKG9yZGVyID8gb3JkZXIgLSAxIDog
MCwgbWF4X29yZGVyKTsKPiArICAgICAgICAvKiBUaGUgb3JkZXIgYWxsb2NhdGVkIGFuZCBwb3B1
bGF0ZWQgbXVzdCBiZSBhbGlnbmVkIHRvIHRoZSBhZGRyZXNzLiAqLwo+ICsgICAgICAgIG9yZGVy
ID0gbWluKG9yZGVyLCBzdGFydCA/IGZpbmRfZmlyc3Rfc2V0X2JpdChzdGFydCkgOiBNQVhfT1JE
RVIpOwoKSXNuJ3QgbWF4X29yZGVyIGJldHRlciBoZXJlPwoKPiAgICAgICAgICBwYWdlID0gYWxs
b2NfZG9taGVhcF9wYWdlcyhkLCBvcmRlciwgZG9tMF9tZW1mbGFncyB8IE1FTUZfbm9fc2NydWIp
Owo+ICAgICAgICAgIGlmICggcGFnZSA9PSBOVUxMICkKPiAgICAgICAgICB7Cj4gLS0gCj4gMi4y
MC4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
