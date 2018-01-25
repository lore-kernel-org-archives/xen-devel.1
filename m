From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] xen: re-enable booting as Xen PVH guest
Date: Thu, 25 Jan 2018 11:04:52 +0100
Message-ID: <20180125100454.23203-1-jgross__19971.1371482865$1516874663$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=5epa=eu=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eeePH-0000Yo-W3
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 10:05:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, rafael.j.wysocki@intel.com, mingo@redhat.com, lenb@kernel.org
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbiBQVkggYm9vdCBwcm90b2NvbCBwYXNzZXMgdml0YWwgaW5mb3JtYXRpb24gdG8gdGhl
IGtlcm5lbCB2aWEKYSBzdGFydF9pbmZvIGJsb2NrLiBPbmUgb2YgdGhlIGRhdGEgdHJhbnNmZXJy
ZWQgaXMgdGhlIHBoeXNpY2FsIGFkZHJlc3MKb2YgdGhlIFJTRFAgdGFibGUuCgpVbmZvcnR1bmF0
ZWx5IFBWSCBzdXBwb3J0IGluIHRoZSBrZXJuZWwgZGlkbid0IHVzZSB0aGF0IHBhc3NlZCBhZGRy
ZXNzCmZvciBSU0RQLCBidXQgcmVsaWVkIG9uIHRoZSBsZWdhY3kgbWVjaGFuaXNtIHNlYXJjaGlu
ZyBmb3IgdGhlIFJTRFAgaW4KbG93IG1lbW9yeS4gQWZ0ZXIgYSByZWNlbnQgY2hhbmdlIGluIFhl
biBwdXR0aW5nIHRoZSBSU0RQIHRvIGEgaGlnaGVyCmFkZHJlc3MgYm9vdGluZyBhcyBQVkggZ3Vl
c3QgaXMgbm93IGZhaWxpbmcuCgpUaGlzIHNtYWxsIHNlcmllcyByZXBhaXJzIHRoYXQgYnkgcGFz
c2luZyB0aGUgUlNEUCBhZGRyZXNzIGZyb20gdGhlCnN0YXJ0X2luZm8gYmxvY2sgdG8gQUNQSSBo
YW5kbGluZy4KCkp1ZXJnZW4gR3Jvc3MgKDIpOgogIHg4Ni9hY3BpOiBhZGQgcmV0cmlldmFsIGZ1
bmN0aW9uIGZvciByc2RwIGFkZHJlc3MKICB4ZW46IGFkZCBhY3BpX2FyY2hfZ2V0X3Jvb3RfcG9p
bnRlcigpIGZvciBwdmggZ3Vlc3RzCgogYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdmguYyB8IDE1
ICsrKysrKysrKysrKy0tLQogZHJpdmVycy9hY3BpL29zbC5jICAgICAgICAgICB8IDEwICsrKysr
KysrKy0KIGluY2x1ZGUvbGludXgvYWNwaS5oICAgICAgICAgfCAgMiArKwogMyBmaWxlcyBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTMuNgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
