From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/5] pvcalls fixes
Date: Fri, 21 Dec 2018 15:06:24 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gaTsA-0008WR-Rv
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 23:06:26 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzZXJpZXMgaXMgYSBjb2xsZWN0aW9uIG9mIHNtYWxsIHB2Y2FsbHMgZml4
ZXMuCgpDaGVlcnMsCgpTdGVmYW5vCgoKU3RlZmFubyBTdGFiZWxsaW5pICg1KToKICAgICAgcHZj
YWxscy1mcm9udDogcmVhZCBhbGwgZGF0YSBiZWZvcmUgY2xvc2luZyB0aGUgY29ubmVjdGlvbgog
ICAgICBwdmNhbGxzLWZyb250OiBkb24ndCB0cnkgdG8gZnJlZSB1bmFsbG9jYXRlZCByaW5ncwog
ICAgICBwdmNhbGxzLWZyb250OiBwcm9wZXJseSBhbGxvY2F0ZSBzawogICAgICBwdmNhbGxzLWZy
b250OiBkb24ndCByZXR1cm4gZXJyb3Igd2hlbiB0aGUgcmluZyBpcyBmdWxsCiAgICAgIHB2Y2Fs
bHMtYmFjazogc2V0IC1FTk9UQ09OTiBpbiBwdmNhbGxzX2Nvbm5fYmFja19yZWFkCgogZHJpdmVy
cy94ZW4vcHZjYWxscy1iYWNrLmMgIHwgIDcgKysrKy0tLQogZHJpdmVycy94ZW4vcHZjYWxscy1m
cm9udC5jIHwgMjAgKysrKysrKysrKysrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
