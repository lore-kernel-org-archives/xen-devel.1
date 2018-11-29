From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 0/2] xen/arm: mm: Boot fixes
Date: Thu, 29 Nov 2018 11:37:42 +0000
Message-ID: <20181129113744.2797-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I9BH=OI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gSKdk-000809-PR
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 11:37:52 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, andre.przywara@arm.com, Matthew Daley <mattd@bugfuzz.com>, Jan-Peter Larsson <Jan-Peter.Larsson@arm.com>, Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgZml4ZXMgMiBidWcgaW4gdGhlIGJvb3QgY29kZSBm
b3IgdGhlIG1lbW9yeSBtYW5hZ2VtZW50LgoKVGhlIGZpcnN0IHBhdGNoIHNob3VsZCByZXNvbHZl
IFhlbiBzdGFsbCB3aGVuIHNldHRpbmcgU0NUTFIuWE4gb24gc29tZQpwbGF0Zm9ybXMuCgpUaGUg
c2Vjb25kIHBhdGNoIHNob3VsZCBhbGxvdyB0byBib290IFhlbiBhZ2FpbiB0aGUgSGlrZXkgYm9h
cmQuCgpDaGVlcnMsCgpDYzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5r
b2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPgpDYzogSmFuLVBldGVyIExhcnNzb24gPEphbi1QZXRl
ci5MYXJzc29uQGFybS5jb20+CkNjOiBNYXR0aGV3IERhbGV5IDxtYXR0ZEBidWdmdXp6LmNvbT4K
Ckp1bGllbiBHcmFsbCAoMik6CiAgeGVuL2FybTogbW06IFNldC11cCBwYWdlIHBlcm1pc3Npb24g
Zm9yIFhlbiBtYXBwaW5ncyBlYXJsaWVyIG9uCiAgeGVuL2FybTogU3RvcCByZWxvY2F0aW5nIFhl
bgoKIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCA1NCArKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDUwICsrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgIHwg
NjcgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9h
cmNoL2FybS9zZXR1cC5jICAgICAgfCA2NSArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCAgfCAgMiArLQogNSBmaWxl
cyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxOTkgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
