From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] VT-d: return full destination ID for IO-APIC
 reads
Date: Tue, 02 Apr 2019 06:56:33 -0600
Message-ID: <5CA35C010200007800223E4C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBIxy-0006mi-Kj
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 12:56:38 +0000
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
Cc: Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

SW4geDJBUElDIG1vZGUgaXQgaXMgMzIgYml0cyB3aWRlLiBOb3QgaGF2aW5nIHJldHVybmVkIHRo
ZSBmdWxsIHZhbHVlCndhcyBtb3N0bHkgYmVuaWduOiBXZSBuZXZlciBtb2RpZnkgdGhlIElEIGJh
c2VkIG9uIGl0cyBvcmlnaW5hbCB2YWx1ZTsKZnVsbCBuZXcgdmFsdWVzIGdldCB3cml0dGVuIGF0
IGFsbCB0aW1lcy4gSXQgd2FzICJqdXN0IiBkZWJ1ZyBsb2dnaW5nCndoaWNoIGVuZGVkIHVwIHdy
b25nIHRoaXMgd2F5IChhbmQgd2hpY2ggd2lsbCBuZWVkIGFkanVzdG1lbnQgaXRzZWxmIGFzCndl
bGwsIHRvIGFsc28gY29uc3VtZSB0aGUgZnVsbCB2YWx1ZSkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC92dGQvaW50cmVtYXAuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW50cmVt
YXAuYwpAQCAtMzE0LDggKzMxNCwxMyBAQCBzdGF0aWMgaW50IHJlbWFwX2VudHJ5X3RvX2lvYXBp
Y19ydGUoCiAgICAgb2xkX3J0ZS0+ZGVzdF9tb2RlID0gaXJlbWFwX2VudHJ5LT5yZW1hcC5kbTsK
ICAgICBvbGRfcnRlLT50cmlnZ2VyID0gaXJlbWFwX2VudHJ5LT5yZW1hcC50bTsKICAgICBvbGRf
cnRlLT5fX3Jlc2VydmVkXzIgPSAwOwotICAgIG9sZF9ydGUtPmRlc3QubG9naWNhbC5fX3Jlc2Vy
dmVkXzEgPSAwOwotICAgIG9sZF9ydGUtPmRlc3QubG9naWNhbC5sb2dpY2FsX2Rlc3QgPSBpcmVt
YXBfZW50cnktPnJlbWFwLmRzdCA+PiA4OworICAgIGlmICggeDJhcGljX2VuYWJsZWQgKQorICAg
ICAgICBvbGRfcnRlLT5kZXN0LmRlc3QzMiA9IGlyZW1hcF9lbnRyeS0+cmVtYXAuZHN0OworICAg
IGVsc2UKKyAgICB7CisgICAgICAgIG9sZF9ydGUtPmRlc3QubG9naWNhbC5fX3Jlc2VydmVkXzEg
PSAwOworICAgICAgICBvbGRfcnRlLT5kZXN0LmxvZ2ljYWwubG9naWNhbF9kZXN0ID0gaXJlbWFw
X2VudHJ5LT5yZW1hcC5kc3QgPj4gODsKKyAgICB9CiAKICAgICB1bm1hcF92dGRfZG9tYWluX3Bh
Z2UoaXJlbWFwX2VudHJpZXMpOwogICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlyX2N0cmwt
PmlyZW1hcF9sb2NrLCBmbGFncyk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
