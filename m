From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v5 1/8] ARM: VGIC: drop unneeded
	gic_restore_pending_irqs()
Date: Tue,  6 Feb 2018 17:08:56 +0000
Message-ID: <20180206170903.30637-2-andre.przywara@linaro.org>
References: <20180206170903.30637-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tmtn=fa=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ej6k4-0003lD-Jq
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 17:09:12 +0000
Received: by mail-wr0-x242.google.com with SMTP id s5so2739013wra.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2018 09:09:11 -0800 (PST)
In-Reply-To: <20180206170903.30637-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SW4gZ2ljX3Jlc3RvcmVfcGVuZGluZ19pcnFzKCkgd2UgcHVzaCBvdXIgcGVuZGluZyB2aXJ0dWFs
IElSUXMgaW50byB0aGUKbGlzdCByZWdpc3RlcnMuIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIG9u
Y2UgZnJvbSBnaWNfaW5qZWN0KCksIGp1c3QKYmVmb3JlIHdlIHJldHVybiB0byB0aGUgZ3Vlc3Qs
IGJ1dCBhbHNvIGluIGdpY19yZXN0b3JlX3N0YXRlKCksIHdoZW4Kd2UgY29udGV4dC1zd2l0Y2gg
YSBWQ1BVLiBIYXZpbmcgYSBjbG9zZXIgbG9vayBpdCB0dXJucyBvdXQgdGhhdCB0aGUKbGF0ZXIg
Y2FsbCBpcyBub3QgbmVlZGVkLCBzaW5jZSB3ZSB3aWxsIGFsd2F5cyBjYWxsIGdpY19pbmplY3Qo
KSBhbnl3YXkuClNvIHJlbW92ZSB0aGF0IGNhbGwgKGFuZCB0aGUgZm9yd2FyZCBkZWNsYXJhdGlv
bikgdG8gc3RyZWFtbGluZSB0aGlzCmludGVyZmFjZSBhbmQgbWFrZSBzZXBhcmF0aW5nIHRoZSBH
SUMgZnJvbSB0aGUgVkdJQyB3b3JsZCBsYXRlci4KClNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3
YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KLS0tCiB4ZW4vYXJjaC9hcm0vZ2ljLmMgfCA0IC0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9naWMuYyBiL3hlbi9hcmNoL2FybS9naWMuYwppbmRleCBiYWM4YWRhMmJiLi43MjFhMTdhOWQ3
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLmMKKysrIGIveGVuL2FyY2gvYXJtL2dpYy5j
CkBAIC0zNiw4ICszNiw2IEBACiAjaW5jbHVkZSA8YXNtL3ZnaWMuaD4KICNpbmNsdWRlIDxhc20v
YWNwaS5oPgogCi1zdGF0aWMgdm9pZCBnaWNfcmVzdG9yZV9wZW5kaW5nX2lycXMoc3RydWN0IHZj
cHUgKnYpOwotCiBzdGF0aWMgREVGSU5FX1BFUl9DUFUodWludDY0X3QsIGxyX21hc2spOwogCiAj
ZGVmaW5lIGxyX2FsbF9mdWxsKCkgKHRoaXNfY3B1KGxyX21hc2spID09ICgoMSA8PCBnaWNfaHdf
b3BzLT5pbmZvLT5ucl9scnMpIC0gMSkpCkBAIC05MSw4ICs4OSw2IEBAIHZvaWQgZ2ljX3Jlc3Rv
cmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpCiAgICAgZ2ljX2h3X29wcy0+cmVzdG9yZV9zdGF0ZSh2
KTsKIAogICAgIGlzYigpOwotCi0gICAgZ2ljX3Jlc3RvcmVfcGVuZGluZ19pcnFzKHYpOwogfQog
CiAvKiBkZXNjLT5pcnEgbmVlZHMgdG8gYmUgZGlzYWJsZWQgYmVmb3JlIGNhbGxpbmcgdGhpcyBm
dW5jdGlvbiAqLwotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
