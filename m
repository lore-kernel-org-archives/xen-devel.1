From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 3/6] xen/pvshim: identity pin shim vCPUs to pCPUs
Date: Wed, 17 Jan 2018 09:48:11 +0000
Message-ID: <20180117094814.32772-4-roger.pau@citrix.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdg0=em=citrix.com=prvs=5484ab63c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ebkM9-0004mj-41
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 09:50:05 +0000
In-Reply-To: <20180117094814.32772-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2UgVkNQVU9QX3t1cC9kb3dufSBhbHJlYWR5IGlkZW50aXR5IHBpbnMgdkNQVSBob3RwbHVn
IHRvIHBDUFUKaG90cGx1ZyBhbHNvIHBpbiB0aGUgdkNQVXMgdG8gdGhlIHBDUFVzIGluIHRoZSBz
Y2hlZHVsZXIuIFRoaXMgcHJldmVudAp2Q1BVIG1pZ3JhdGlvbiBhbmQgc2hvdWxkIGltcHJvdmUg
cGVyZm9ybWFuY2UuCgpXaGlsZSB0aGVyZSBhbHNvIHVzZSBfX2NwdW1hc2tfc2V0X2NwdSBpbnN0
ZWFkIG9mIGNwdW1hc2tfc2V0X2NwdSwKdGhlcmUncyBubyBuZWVkIHRvIHVzZSB0aGUgbG9ja2Vk
IHZhcmlhbnQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KU2hvdWxkIGJlIGJhY2twb3J0ZWQgdG8gdGhlIDQuMTAuMC1zaGltLWNvbWV0IGJyYW5j
aC4KLS0tCiB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwppbmRleCAxN2Ni
MTI3MmMxLi41NTU2NjBiODUzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKQEAgLTE0MCw5ICsxNDAsOCBAQCBzdHJ1
Y3QgdmNwdSAqX19pbml0IGRvbTBfc2V0dXBfdmNwdShzdHJ1Y3QgZG9tYWluICpkLAogICAgIHsK
ICAgICAgICAgaWYgKCBwdl9zaGltICkKICAgICAgICAgewotCi0gICAgICAgICAgICBjcHVtYXNr
X3NldGFsbCh2LT5jcHVfaGFyZF9hZmZpbml0eSk7Ci0gICAgICAgICAgICBjcHVtYXNrX3NldGFs
bCh2LT5jcHVfc29mdF9hZmZpbml0eSk7CisgICAgICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdSh2
Y3B1X2lkLCB2LT5jcHVfaGFyZF9hZmZpbml0eSk7CisgICAgICAgICAgICBfX2NwdW1hc2tfc2V0
X2NwdSh2Y3B1X2lkLCB2LT5jcHVfc29mdF9hZmZpbml0eSk7CiAgICAgICAgIH0KICAgICAgICAg
ZWxzZQogICAgICAgICB7Ci0tIAoyLjE1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
