From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.12 1/8] dom0/pvh: align allocation and
 mapping order to start address
Date: Wed, 30 Jan 2019 11:36:39 +0100
Message-ID: <20190130103646.53649-2-roger.pau@citrix.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CawQ=QG=citrix.com=prvs=9267fa6dd=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gonEs-0001Jl-1V
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 10:37:02 +0000
In-Reply-To: <20190130103646.53649-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RHVlIHRvIHRoZSByZWNlbnQgY2hhbmdlcyBpbiB0aGUgaW9tbXUgbWFwcGluZyBsb2dpYywgdGhl
IHN0YXJ0CmFkZHJlc3NlcyBwcm92aWRlZCBuZWVkIHRvIGJlIGFsaWduZWQgdG8gdGhlIG9yZGVy
IGludGVuZGVkIHRvIGJlCm1hcHBlZC4KCmRvbTAgUFZIIGRvbWFpbiBidWlsZGVyIGRpZG4ndCB0
YWtlIHRoaXMgaW50byBhY2NvdW50IHdoZW4gcG9wdWxhdGluZwp0aGUgcDJtLCBmaXggdGhpcyBi
eSBtYWtpbmcgc3VyZSB0aGUgb3JkZXIgaXMgY2hvc2VuIHNvIHRoYXQgdGhlIHN0YXJ0CmFkZHJl
c3MgaXMgYWxpZ25lZCB0byBpdC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KV2l0aG91dCB0aGlzIHBhdGNoIHRyeWluZyB0
byBjcmVhdGUgYSBQVkggZG9tMCB3aWxsIHRyaWdnZXIgYW4gYXNzZXJ0Cm9uIGNlcnRhaW4gaGFy
ZHdhcmUgZGVwZW5kaW5nIG9uIHRoZSBtZW1vcnkgbWFwLgotLS0KIHhlbi9hcmNoL3g4Ni9odm0v
ZG9tMF9idWlsZC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L2h2
bS9kb20wX2J1aWxkLmMKaW5kZXggNTFjZjQ5MDgxMS4uYTU3MWQxNWMxMyAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9kb20w
X2J1aWxkLmMKQEAgLTE1Miw2ICsxNTIsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhfcG9wdWxh
dGVfbWVtb3J5X3JhbmdlKHN0cnVjdCBkb21haW4gKmQsCiAKICAgICAgICAgb3JkZXIgPSBnZXRf
b3JkZXJfZnJvbV9wYWdlcyhlbmQgLSBzdGFydCArIDEpOwogICAgICAgICBvcmRlciA9IG1pbihv
cmRlciA/IG9yZGVyIC0gMSA6IDAsIG1heF9vcmRlcik7CisgICAgICAgIC8qIFRoZSBvcmRlciBh
bGxvY2F0ZWQgYW5kIHBvcHVsYXRlZCBtdXN0IGJlIGFsaWduZWQgdG8gdGhlIGFkZHJlc3MuICov
CisgICAgICAgIG9yZGVyID0gbWluKG9yZGVyLCBzdGFydCA/IGZpbmRfZmlyc3Rfc2V0X2JpdChz
dGFydCkgOiBNQVhfT1JERVIpOwogICAgICAgICBwYWdlID0gYWxsb2NfZG9taGVhcF9wYWdlcyhk
LCBvcmRlciwgZG9tMF9tZW1mbGFncyB8IE1FTUZfbm9fc2NydWIpOwogICAgICAgICBpZiAoIHBh
Z2UgPT0gTlVMTCApCiAgICAgICAgIHsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
