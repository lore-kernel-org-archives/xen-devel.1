From: Andre Przywara <andre.przywara@linaro.org>
Subject: [RFC PATCH 41/49] ARM: new VGIC: dump virtual IRQ info
Date: Fri,  9 Feb 2018 14:39:29 +0000
Message-ID: <20180209143937.28866-42-andre.przywara@linaro.org>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vdwz=fd=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ek9qo-0001g0-F9
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 14:40:30 +0000
Received: by mail-wr0-x244.google.com with SMTP id 41so8461913wrc.9
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 06:40:29 -0800 (PST)
In-Reply-To: <20180209143937.28866-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiB3ZSBkdW1wIGd1ZXN0IHN0YXRlIG9uIHRoZSBYZW4gY29uc29sZSwgd2UgYWxzbyBwcmlu
dCB0aGUgc3RhdGUgb2YKSVJRcyB0aGF0IGFyZSBvbiBhIFZDUFUuCkFkZCB0aGUgY29kZSB0byBk
dW1wIHRoZSBzdGF0ZSBvZiBhbiBJUlEgaGFuZGxlZCBieSB0aGUgbmV3IFZHSUMuCgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KLS0tCiB4
ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMgfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMu
YyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwppbmRleCAzYjQ3NWVkMWE0Li45N2ZmZGJhNWFk
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKKysrIGIveGVuL2FyY2gvYXJt
L3ZnaWMvdmdpYy5jCkBAIC03NTcsNiArNzU3LDE5IEBAIHZvaWQgdmdpY19mcmVlX3ZpcnEoc3Ry
dWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHZpcnEpCiAgICAgY2xlYXJfYml0KHZpcnEsIGQt
PmFyY2gudmdpYy5hbGxvY2F0ZWRfaXJxcyk7CiB9CiAKK3ZvaWQgZ2ljX2R1bXBfdmdpY19pbmZv
KHN0cnVjdCB2Y3B1ICp2KQoreworICAgIHN0cnVjdCB2Z2ljX2NwdSAqdmdpY19jcHUgPSAmdi0+
YXJjaC52Z2ljX2NwdTsKKyAgICBzdHJ1Y3QgdmdpY19pcnEgKmlycTsKKworICAgIGxpc3RfZm9y
X2VhY2hfZW50cnkoaXJxLCAmdmdpY19jcHUtPmFwX2xpc3RfaGVhZCwgYXBfbGlzdCkKKyAgICAg
ICAgcHJpbnRrKCIgICBvbiBDUFU6ICVzICVzIGlycSAldTogJXNwZW5kaW5nLCAlc2FjdGl2ZSwg
JXNlbmFibGVkXG4iLAorICAgICAgICAgICAgICAgaXJxLT5odyA/ICJoYXJkd2FyZSIgOiAidmly
dHVhbCIsCisgICAgICAgICAgICAgICBpcnEtPmNvbmZpZyA9PSBWR0lDX0NPTkZJR19MRVZFTCA/
ICJsZXZlbCIgOiAiZWRnZSIsCisgICAgICAgICAgICAgICBpcnEtPmludGlkLCBpcnFfaXNfcGVu
ZGluZyhpcnEpID8gIiIgOiAibm90ICIsCisgICAgICAgICAgICAgICBpcnEtPmFjdGl2ZSA/ICIi
IDogIm5vdCAiLCBpcnEtPmVuYWJsZWQgPyAiIiA6ICJub3QgIik7Cit9CisKIHN0cnVjdCBpcnFf
ZGVzYyAqdmdpY19nZXRfaHdfaXJxX2Rlc2Moc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUg
KnYsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCB2
aXJxKQogewotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
