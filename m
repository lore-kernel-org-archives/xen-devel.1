From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 2/4] xen/arm: use SYMBOL when required
Date: Mon, 07 Jan 2019 03:09:51 -0700
Message-ID: <5C33256F020000780020ABEC@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1901031114230.800@sstabellini-ThinkPad-X260>
 <1546543191-9206-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggRr4-0002T3-8i
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 10:09:58 +0000
In-Reply-To: <1546543191-9206-2-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjAxLjE5IGF0IDIwOjE5LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gVXNlIFNZTUJPTCBpbiBjYXNlcyBvZiBjb21wYXJpc29ucyBhbmQgc3VidHJhY3Rpb25zIG9m
Ogo+IAo+IF9zdGFydCwgX2VuZCwgX19pbml0X2JlZ2luLCBfX2luaXRfZW5kLCAgX18yTV90ZXh0
X2VuZCwKPiBfXzJNX3JvZGF0YV9zdGFydCwgX18yTV9yb2RhdGFfZW5kLCBfXzJNX2luaXRfc3Rh
cnQsX18yTV9pbml0X2VuZCwKPiBfXzJNX3J3ZGF0YV9zdGFydCwgX18yTV9yd2RhdGFfZW5kLCBf
c3RleHQsIF9ldGV4dCwgX3Nyb2RhdGEsIF9lcm9kYXRhLAo+IF9fZW5kX3ZwY2lfYXJyYXksIF9f
c3RhcnRfdnBjaV9hcnJheSwgX3Npbml0dGV4dCwgX2Vpbml0dGV4dCwKPiBfc3RleHRlbnRyeSwg
X2V0ZXh0ZW50cnksIF9fc3RhcnRfYnVnX2ZyYW1lcywgX19zdG9wX2J1Z19mcmFtZXNfMCwKPiBf
X3N0b3BfYnVnX2ZyYW1lc18xLCBfX3N0b3BfYnVnX2ZyYW1lc18yLF9fc3RvcF9idWdfZnJhbWVz
XzMsCj4gX19ub3RlX2dudV9idWlsZF9pZF9zdGFydCwgX19ub3RlX2dudV9idWlsZF9pZF9lbmQs
IF9fc3RhcnRfX19leF90YWJsZSwKPiBfX3N0b3BfX19leF90YWJsZSwgX19zdGFydF9fX3ByZV9l
eF90YWJsZSwgX19zdG9wX19fcHJlX2V4X3RhYmxlLAo+IF9fbG9ja19wcm9maWxlX3N0YXJ0LCBf
X2xvY2tfcHJvZmlsZV9lbmQsIF9fcGFyYW1fc3RhcnQsCj4gX19wYXJhbV9lbmQsIF9fc2V0dXBf
c3RhcnQsIF9fc2V0dXBfZW5kLCBfX2luaXRjYWxsX3N0YXJ0LAo+IF9faW5pdGNhbGxfZW5kLCBf
X3ByZXNtcF9pbml0Y2FsbF9lbmQsIF9fdHJhbXBvbGluZV9yZWxfc3RhcnQsCj4gX190cmFtcG9s
aW5lX3JlbF9zdG9wLCBfX3RyYW1wb2xpbmVfc2VnX3N0YXJ0LCBfX3RyYW1wb2xpbmVfc2VnX3N0
b3AKPiBfX2FsdF9pbnN0cnVjdGlvbnMsIF9fYWx0X2luc3RydWN0aW9uc19lbmQsIF9fY3RvcnNf
c3RhcnQsIF9fY3RvcnNfZW5kLAo+IF9fZW5kX3NjaGVkdWxlcnNfYXJyYXksIF9fc3RhcnRfc2No
ZWR1bGVyc19hcnJheSwgX19ic3Nfc3RhcnQsCj4gX19ic3NfZW5kLCBfX3Blcl9jcHVfc3RhcnQs
IF9fcGVyX2NwdV9kYXRhX2VuZCwgX3NwbGF0Zm9ybSwgX2VwbGF0Zm9ybSwKPiBfc2RldmljZSwg
X2VkZXZpY2UsIF9hc2RldmljZSwgX2FlZGV2aWNlLCBfX3Byb2NfaW5mb19zdGFydCwKPiBfX3By
b2NfaW5mb19lbmQsIF9zZHRiCgpEaWRuJ3QgeW91IGdvIGEgbGl0dGxlIHRvbyBmYXIgd2l0aCBj
b3B5LWFuZC1wYXN0ZSBoZXJlPyBJIGRvbid0IHRoaW5rCmFsbCBvZiB0aGUgc3ltYm9scyByZWFs
bHkgZXhpc3QgaW4gQXJtIChhbmQgc2ltaWxhcmx5IGluIHRoZSB4ODYgaW5zdGFuY2UKSSB0aGlu
ayB0aGVyZSBhcmUgc29tZSBBcm0tb25seSBzeW1ib2xzKS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
