From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 18/26] power: power_reboot_attempts:
 Honour an $approach_re
Date: Thu, 24 Jan 2019 18:46:05 +0000
Message-ID: <20190124184613.2720-19-ian.jackson@eu.citrix.com>
References: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Nn+=QA=citrix.com=prvs=9204ab04b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gmk1H-0003nQ-Md
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:46:31 +0000
In-Reply-To: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHNlbWFudGljcyBhcmUgc2xpZ2h0bHkgZGlmZmVyZW50IGhlcmU6IG5vdCBzcGVjaWZ5aW5n
IGl0IG1lYW5zIHRvCnRyeSBldmVyeXRoaW5nIHJhdGhlciB0aGFuIG9ubHkgdGhlIGhhcmRlc3Qu
ICBCdXQgdGhlIGVmZmVjdCBpcwpzaW1pbGFyOiBub3Qgc3BlY2lmeWluZyAkYXBwcm9hY2hfcmUg
bWVhbnMgd2UgbXVzdCBzdWNjZWVkLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSB8IDUgKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0K
aW5kZXggOTZkZGJjM2MuLjRlMTE5MmQ0IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0
LnBtCisrKyBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KQEAgLTk3OCw4ICs5NzgsOCBAQCBzdWIg
cG93ZXJfY3ljbGVfaG9zdF9zZXR1cCAoJCkgewogICAgICRoby0+e1Bvd2VyQXBwcm9hY2hlc30g
PSBcQGFwcHJvYWNoZXM7CiB9CiAKLXN1YiBwb3dlcl9yZWJvb3RfYXR0ZW1wdHMgKCQkJCkgewot
ICAgIG15ICgkaG8sICRzZXR1cCwgJGF3YWl0KSA9IEBfOworc3ViIHBvd2VyX3JlYm9vdF9hdHRl
bXB0cyAoJCQkOyQpIHsKKyAgICBteSAoJGhvLCAkc2V0dXAsICRhd2FpdCwgJGFwcHJvYWNoX3Jl
KSA9IEBfOwogICAgICMgUG93ZXIgY3ljbGVzICRobywgY2FsbGluZyAkc2V0dXAtPigpIHdoaWxl
IGl0IGlzIChzdXBwb3NlZGx5KSBvZmYuCiAgICAgIyBUaGVuLCBqdXN0IGFmdGVyIHR1cm5pbmcg
JGhvIG9uLCBjYWxscyAkYXdhaXQtPigpLgogICAgICMgSWYgJGF3YWl0LT4oKSBzdWNjZWVkcywg
Z3JlYXQ6IHJldHVybnMuCkBAIC05OTcsNiArOTk3LDcgQEAgc3ViIHBvd2VyX3JlYm9vdF9hdHRl
bXB0cyAoJCQkKSB7CiAJTWV0aE9ianMgPT4gcG93ZXJfY3ljbGVfcGFyc2VfbWV0aG9kKCRobywg
J3NzaCcpLAogICAgIH07CiAgICAgZm9yZWFjaCBteSAkYXBwcm9hY2ggKCRzc2gsIEB7ICRoby0+
e1Bvd2VyQXBwcm9hY2hlc30gfSkgeworCW5leHQgaWYgZGVmaW5lZCAkYXBwcm9hY2hfcmUgJiYg
JGFwcHJvYWNoLT57TmFtZX0gIX4gcXJ7JGFwcHJvYWNoX3JlfTsKIAlsb2dtKCJwb3dlcjogdHJ5
aW5nIHRvIHJlYm9vdCAkaG8tPntOYW1lfSAodXNpbmcgJGFwcHJvYWNoLT57TmFtZX0pIik7CiAJ
aWYgKGV2YWwgewogCSAgICBwb3dlcl9hcHByb2FjaF9pbnZva2UoJGhvLCAkYXBwcm9hY2gsIDAp
OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
