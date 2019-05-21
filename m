From: Wei Liu <wei.liu2@citrix.com>
Subject: Unhandle NONE type device model broke QDISK backend
Date: Tue, 21 May 2019 15:37:02 +0100
Message-ID: <20190521143702.GH1846@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mDO=TV=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hT5t5-00010H-MF
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:37:07 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgT2xhZgoKSXQgYXBwZWFycyB0aGVyZSBpcyBhdCBsZWFzdCBvbmUgaW5zdGFuY2UgdGhhdCdz
IG5vdCBwcm9wZXJseSBoYW5kbGVkLgoKU2VlIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnL29zc3Rlc3QvbG9ncy8xMzY0NDAvdGVzdC1hbWQ2NC1hbWQ2NC14bC1xY293Mi8xMC50
cy1kZWJpYW4tZGktaW5zdGFsbC5sb2cKCmJ4bDogZGVidWc6IGxpYnhsX2RldmljZS5jOjM4MDps
aWJ4bF9fZGV2aWNlX2Rpc2tfc2V0X2JhY2tlbmQ6IERpc2sgdmRldj14dmRhIHNwZWMuYmFja2Vu
ZD1xZGlzawpsaWJ4bDogZGVidWc6IGxpYnhsX2xpbnV4LmM6MjM1OmxpYnhsX19nZXRfaG90cGx1
Z19zY3JpcHRfaW5mbzogRG9tYWluIDE6YmFja2VuZF9raW5kIDMsIG5vIG5lZWQgdG8gZXhlY3V0
ZSBzY3JpcHRzCmxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2aWNlLmM6MTE3NDpkZXZpY2VfaG90cGx1
ZzogRG9tYWluIDE6Tm8gaG90cGx1ZyBzY3JpcHQgdG8gZXhlY3V0ZQpsaWJ4bDogZGVidWc6IGxp
YnhsX2V2ZW50LmM6Njg5OmxpYnhsX19ldl94c3dhdGNoX2RlcmVnaXN0ZXI6IHdhdGNoIHc9MHg1
NTZiZTYxNTMzNzA6IGRlcmVnaXN0ZXIgdW5yZWdpc3RlcmVkCmxpYnhsOiBlcnJvcjogbGlieGxf
ZG0uYzozMjY6bGlieGxfX2RvbWFpbl9kZXZpY2VfbW9kZWw6IGludmFsaWQgZGV2aWNlIG1vZGVs
IHZlcnNpb24gMwpsaWJ4bDogZXJyb3I6IGxpYnhsX2RtLmM6Mjc0NzpkZXZpY2VfbW9kZWxfc3Bh
d25fb3V0Y29tZTogRG9tYWluIDE6KG51bGwpOiBzcGF3biBmYWlsZWQgKHJjPS0zKQoKVGhlIHNh
bWUgdGhpbmcgc2hvd2VkIHVwIGluIHRoZSB2aGQgdGVzdC4gQm90aCB0ZXN0IGNhc2VzIHVzZSBR
RElTSwpiYWNrZW5kLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
