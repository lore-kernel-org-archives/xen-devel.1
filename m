From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 09/15] x86/IRQ: make fixup_irqs() skip
 unconnected internally used interrupts
Date: Fri, 17 May 2019 04:49:58 -0600
Message-ID: <5CDE91D602000078002300AE@prv1-mh.provo.novell.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaR8-00062y-9k
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:50:02 +0000
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2UgdGhlICJDYW5ub3Qgc2V0IGFmZmluaXR5IC4uLiIgd2FybmluZyBpcyBhIG9uZSB0aW1l
IG9uZSwgYXZvaWQKdHJpZ2dlcmluZyBpdCBhbHJlYWR5IGF0IGJvb3QgdGltZSB3aGVuIHBhcmtp
bmcgc2Vjb25kYXJ5IHRocmVhZHMgYW5kCnRoZSBzZXJpYWwgY29uc29sZSB1c2VzIGEgKHN0aWxs
IHVuY29ubmVjdGVkIGF0IHRoYXQgdGltZSkgUENJIElSUS4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9pcnEuYwpAQCAtMjQ1Miw4ICsyNDUyLDIwIEBAIHZvaWQgZml4dXBfaXJxcyhj
b25zdCBjcHVtYXNrX3QgKm1hc2ssIGIKICAgICAgICAgdmVjdG9yID0gaXJxX3RvX3ZlY3Rvcihp
cnEpOwogICAgICAgICBpZiAoIHZlY3RvciA+PSBGSVJTVF9ISVBSSU9SSVRZX1ZFQ1RPUiAmJgog
ICAgICAgICAgICAgIHZlY3RvciA8PSBMQVNUX0hJUFJJT1JJVFlfVkVDVE9SICkKKyAgICAgICAg
ewogICAgICAgICAgICAgY3B1bWFza19hbmQoZGVzYy0+YXJjaC5jcHVfbWFzaywgZGVzYy0+YXJj
aC5jcHVfbWFzaywgbWFzayk7CiAKKyAgICAgICAgICAgIC8qCisgICAgICAgICAgICAgKiBUaGlz
IGNhbiBpbiBwYXJ0aWN1bGFyIGhhcHBlbiB3aGVuIHBhcmtpbmcgc2Vjb25kYXJ5IHRocmVhZHMK
KyAgICAgICAgICAgICAqIGR1cmluZyBib290IGFuZCB3aGVuIHRoZSBzZXJpYWwgY29uc29sZSB3
YW50cyB0byB1c2UgYSBQQ0kgSVJRLgorICAgICAgICAgICAgICovCisgICAgICAgICAgICBpZiAo
IGRlc2MtPmhhbmRsZXIgPT0gJm5vX2lycV90eXBlICkKKyAgICAgICAgICAgIHsKKyAgICAgICAg
ICAgICAgICBzcGluX3VubG9jaygmZGVzYy0+bG9jayk7CisgICAgICAgICAgICAgICAgY29udGlu
dWU7CisgICAgICAgICAgICB9CisgICAgICAgIH0KKwogICAgICAgICBpZiAoIGRlc2MtPmFyY2gu
bW92ZV9jbGVhbnVwX2NvdW50ICkKICAgICAgICAgewogICAgICAgICAgICAgLyogVGhlIGNsZWFu
dXAgSVBJIG1heSBoYXZlIGdvdCBzZW50IHdoaWxlIHdlIHdlcmUgc3RpbGwgb25saW5lLiAqLwoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
