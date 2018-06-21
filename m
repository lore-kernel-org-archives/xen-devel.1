From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/2] xen-netfront: Update features after
 registering netdev
Date: Thu, 21 Jun 2018 14:00:21 +0100
Message-ID: <20180621130021.27029-3-ross.lagerwall__44106.4240098514$1529585981$gmane$org@citrix.com>
References: <20180621130021.27029-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=evb4=jh=citrix.com=prvs=70385fc13=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1fVzCY-0004qt-8N
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 13:00:38 +0000
In-Reply-To: <20180621130021.27029-1-ross.lagerwall@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: netdev@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Liam Shepherd <liam@dancer.es>, linux-kernel@vger.kernel.org, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "David S. Miller" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

VXBkYXRlIHRoZSBmZWF0dXJlcyBhZnRlciBjYWxsaW5nIHJlZ2lzdGVyX25ldGRldigpIG90aGVy
d2lzZSB0aGUKZGV2aWNlIGZlYXR1cmVzIGFyZSBub3Qgc2V0IHVwIGNvcnJlY3RseSBhbmQgaXQg
bm90IHBvc3NpYmxlIHRvIGNoYW5nZQp0aGUgTVRVIG9mIHRoZSBkZXZpY2UuIEFmdGVyIHRoaXMg
Y2hhbmdlLCB0aGUgZmVhdHVyZXMgcmVwb3J0ZWQgYnkKZXRodG9vbCBtYXRjaCB0aGUgZGV2aWNl
J3MgZmVhdHVyZXMgYmVmb3JlIHRoZSBjb21taXQgd2hpY2ggaW50cm9kdWNlZAp0aGUgaXNzdWUg
YW5kIGl0IGlzIHBvc3NpYmxlIHRvIGNoYW5nZSB0aGUgZGV2aWNlJ3MgTVRVLgoKRml4ZXM6IGY1
OTljNjRmZGY3ZCAoInhlbi1uZXRmcm9udDogRml4IHJhY2UgYmV0d2VlbiBkZXZpY2Ugc2V0dXAg
YW5kIG9wZW4iKQpSZXBvcnRlZC1ieTogTGlhbSBTaGVwaGVyZCA8bGlhbUBkYW5jZXIuZXM+ClNp
Z25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgot
LS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC94ZW4tbmV0ZnJvbnQuYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCmluZGV4IGVl
NGNiNmMuLmE1N2RhZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCisr
KyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCkBAIC0xOTUxLDEwICsxOTUxLDYgQEAgc3Rh
dGljIGludCB4ZW5uZXRfY29ubmVjdChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQogCS8qIHRhbGtf
dG9fbmV0YmFjaygpIHNldHMgdGhlIGNvcnJlY3QgbnVtYmVyIG9mIHF1ZXVlcyAqLwogCW51bV9x
dWV1ZXMgPSBkZXYtPnJlYWxfbnVtX3R4X3F1ZXVlczsKIAotCXJ0bmxfbG9jaygpOwotCW5ldGRl
dl91cGRhdGVfZmVhdHVyZXMoZGV2KTsKLQlydG5sX3VubG9jaygpOwotCiAJaWYgKGRldi0+cmVn
X3N0YXRlID09IE5FVFJFR19VTklOSVRJQUxJWkVEKSB7CiAJCWVyciA9IHJlZ2lzdGVyX25ldGRl
dihkZXYpOwogCQlpZiAoZXJyKSB7CkBAIC0xOTY0LDYgKzE5NjAsMTAgQEAgc3RhdGljIGludCB4
ZW5uZXRfY29ubmVjdChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQogCQl9CiAJfQogCisJcnRubF9s
b2NrKCk7CisJbmV0ZGV2X3VwZGF0ZV9mZWF0dXJlcyhkZXYpOworCXJ0bmxfdW5sb2NrKCk7CisK
IAkvKgogCSAqIEFsbCBwdWJsaWMgYW5kIHByaXZhdGUgc3RhdGUgc2hvdWxkIG5vdyBiZSBzYW5l
LiAgR2V0CiAJICogcmVhZHkgdG8gc3RhcnQgc2VuZGluZyBhbmQgcmVjZWl2aW5nIHBhY2tldHMg
YW5kIGdpdmUgdGhlIGRyaXZlcgotLSAKMi45LjUKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
