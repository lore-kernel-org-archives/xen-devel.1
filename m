From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 7/9] x86/IRQ: drop redundant cpumask_empty()
 from move_masked_irq()
Date: Mon, 29 Apr 2019 05:26:10 -0600
Message-ID: <5CC6DF520200007800229EC2@prv1-mh.provo.novell.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4QL-0008Fm-8s
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:26:17 +0000
In-Reply-To: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
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

VGhlIHN1YnNlcXVlbnQgY3B1bWFza19pbnRlcnNlY3RzKCkgY292ZXJzIHRoZSAiZW1wdHkiIGNh
c2UgcXVpdGUgZmluZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysgYi94ZW4vYXJjaC94ODYvaXJxLmMK
QEAgLTYzOCw5ICs2MzgsNiBAQCB2b2lkIG1vdmVfbWFza2VkX2lycShzdHJ1Y3QgaXJxX2Rlc2Mg
KmRlCiAgICAgCiAgICAgZGVzYy0+c3RhdHVzICY9IH5JUlFfTU9WRV9QRU5ESU5HOwogCi0gICAg
aWYgKHVubGlrZWx5KGNwdW1hc2tfZW1wdHkocGVuZGluZ19tYXNrKSkpCi0gICAgICAgIHJldHVy
bjsKLQogICAgIGlmICghZGVzYy0+aGFuZGxlci0+c2V0X2FmZmluaXR5KQogICAgICAgICByZXR1
cm47CiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
