From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH RFC 3/4] Arm64: further speed-up to hweight{32,
 64}()
Date: Fri, 31 May 2019 03:53:39 -0600
Message-ID: <5CF0F9A30200007800233E07@prv1-mh.provo.novell.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWeEL-0005hi-S0
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:53:45 +0000
In-Reply-To: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

QWNjb3JkaW5nIHRvIExpbnV4IGNvbW1pdCBlNzViZWYyYTRmICgiYXJtNjQ6IFNlbGVjdApBUkNI
X0hBU19GQVNUX01VTFRJUExJRVIiKSB0aGlzIGlzIGEgZnVydGhlciBpbXByb3ZlbWVudCBvdmVy
IHRoZQp2YXJpYW50IHVzaW5nIG9ubHkgYml0d2lzZSBvcGVyYXRpb25zIG9uIGF0IGxlYXN0IHNv
bWUgaGFyZHdhcmUsIGFuZCBubwp3b3JzZSBvbiBvdGhlci4KClN1Z2dlc3RlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KUkZDOiBUbyBiZSBob25lc3QgSSdtIG5vdCBm
dWxseSBjb252aW5jZWQgdGhpcyBpcyBhIHdpbiBpbiBwYXJ0aWN1bGFyIGluCiAgICAgdGhlIGh3
ZWlnaHQzMigpIGNhc2UsIGFzIHRoZXJlJ3Mgbm8gYWN0dWFsIHNoaWZ0IGluc24gd2hpY2ggZ2V0
cwogICAgIHJlcGxhY2VkIGJ5IHRoZSBtdWx0aXBsaWNhdGlvbi4gRXZlbiBmb3IgaHdlaWdodDY0
KCkgdGhlIGNvbXBpbGVyCiAgICAgY291bGQgZW1pdCBiZXR0ZXIgY29kZSBhbmQgYXZvaWQgdGhl
IGV4cGxpY2l0IHNoaWZ0IGJ5IDMyICh3aGljaCBpdAogICAgIGVtaXRzIGF0IGxlYXN0IGZvciBt
ZSkuCgotLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZworKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZp
ZwpAQCAtMTIsNiArMTIsNyBAQCBjb25maWcgQVJNXzMyCiBjb25maWcgQVJNXzY0CiAJZGVmX2Jv
b2wgeQogCWRlcGVuZHMgb24gNjRCSVQKKwlzZWxlY3QgSEFTX0ZBU1RfTVVMVElQTFkKIAogY29u
ZmlnIEFSTQogCWRlZl9ib29sIHkKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
