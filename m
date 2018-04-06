From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH] tools/kdd: use mute -Warray-bounds only on new
 gcc version
Date: Fri,  6 Apr 2018 17:32:57 +0200
Message-ID: <20180406153258.29262-1-marmarek@invisiblethingslab.com>
References: <20180406151246.c5s6zig3m73bcmb4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180406151246.c5s6zig3m73bcmb4@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

IiNwcmFnbWEgR0NDIGRpYWdub3N0aWMgcHVzaCIgaXMgc3VwcG9ydGVkIG9ubHkgb24gZ2NjID49
IDQuNi4gQnV0IHNpbmNlCm11dGluZyB0aGlzIHRoZSB3YXJuaW5nIGlzIG5lZWRlZCBvbmx5IG9u
IGdjYyA+PSA4LCBkbyBpdCBvbmx5IHRoZW4sCmluc3RlYWQgb2YgdHJpY2tpbmcgdGhlIGNvbXBp
bGVyIGFib3V0IHRoaXMgY29kZSAoYW5kIG1ha2luZyBpdCBsZXNzCnJlYWRhYmxlIHRvIHRoZSBo
dW1hbiB0b28pLgoKVGhpcyBmaXhlcyA1ODg4ZWVjY2EwICJ0b29scy9rZGQ6IG11dGUgc3B1cmlv
dXMgZ2NjIHdhcm5pbmciLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KIHRvb2xzL2RlYnVnZ2Vy
L2tkZC9rZGQuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL2RlYnVnZ2VyL2tkZC9rZGQuYyBiL3Rvb2xzL2RlYnVnZ2VyL2tkZC9r
ZGQuYwppbmRleCA2MWQ3NjllY2U5Li45NWMzYTk0OWVjIDEwMDY0NAotLS0gYS90b29scy9kZWJ1
Z2dlci9rZGQva2RkLmMKKysrIGIvdG9vbHMvZGVidWdnZXIva2RkL2tkZC5jCkBAIC02OTUsMTAg
KzY5NSwxNCBAQCBzdGF0aWMgdm9pZCBrZGRfaGFuZGxlX3JlYWRfY3RybChrZGRfc3RhdGUgKnMp
CiAgICAgICAgICAgICBLRERfTE9HKHMsICJSZXF1ZXN0IG91dHNpZGUgb2Yga25vd24gY29udHJv
bCBzcGFjZVxuIik7CiAgICAgICAgICAgICBsZW4gPSAwOwogICAgICAgICB9IGVsc2UgeworI2lm
IF9fR05VQ19fID49IDgKICNwcmFnbWEgR0NDIGRpYWdub3N0aWMgcHVzaAogI3ByYWdtYSBHQ0Mg
ZGlhZ25vc3RpYyBpZ25vcmVkICItV2FycmF5LWJvdW5kcyIKKyNlbmRpZgogICAgICAgICAgICAg
bWVtY3B5KGJ1ZiwgKCh1aW50OF90ICopJmN0cmwuYzMyKSArIG9mZnNldCwgbGVuKTsKKyNpZiBf
X0dOVUNfXyA+PSA4CiAjcHJhZ21hIEdDQyBkaWFnbm9zdGljIHBvcAorI2VuZGlmCiAgICAgICAg
IH0KICAgICB9CiAKLS0gCjIuMTMuNgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
