From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 03/11] di_special_kernel: Replace
	open-coding in ts-host-install
Date: Thu, 14 Dec 2017 16:22:14 +0000
Message-ID: <1513268542-16212-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1513268542-16212-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dmf7=dk=citrix.com=prvs=514febeb1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ePWHU-0007jw-Hk
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 16:22:44 +0000
In-Reply-To: <1513268542-16212-1-git-send-email-ian.jackson@eu.citrix.com>
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

VGhlIGVmZmVjdCBpcyBzaW1wbHkgdG8gcmV1c2UgdGhlIGxvb3AgaW4gZGlfc3BlY2lhbF9rZXJu
ZWwuICBUaGUKZXh0cmEgdGVzdHMgZXRjLiB0byBjb21wdXRlICRrIGFuZCAkYyBpbiBkaV9zcGVj
aWFsX2tlcm5lbCBhcmUgb2Ygbm8KaW1wb3J0IGhlcmUsIGFuZCBhcmUgaGFybWxlc3MuICBXZSBo
YXZlIGFscmVhZHkgY2FsbGVkCmRpX3NwZWNpYWxfa2VybmVsIHNvIGlmIGl0IHdhcyBnb2luZyB0
byBmYWlsIGR1ZSB0byB0aGlzIGV4dHJhCmNvbXB1dGF0aW9uLCBpdCB3b3VsZCBkbyBzbyBlYXJs
aWVyLgoKTm8gb3ZlcmFsbCBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWhvc3QtaW5zdGFsbCB8
IDkgKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFsbCBiL3RzLWhvc3QtaW5zdGFsbAppbmRl
eCAwMWQwNGQ0Li41MjA5ODNmIDEwMDc1NQotLS0gYS90cy1ob3N0LWluc3RhbGwKKysrIGIvdHMt
aG9zdC1pbnN0YWxsCkBAIC0yMTQsMTQgKzIxNCwxMSBAQCBFTkQKIAogICAgIG15ICV4b3B0czsK
IAotICAgIGZvcmVhY2ggbXkgJGtwIChrZXlzICV7ICRoby0+e0ZsYWdzfSB9KSB7Ci0JIyBCYWNr
d2FyZHMgY29tcGF0aWJpbGl0eQotCSRrcCA9ICJuZWVkLWtlcm5lbC1kZWItd2hlZXp5LWJhY2tw
b3J0cyIgaWYgJGtwIGVxICJuZWVkLWtlcm5lbC1kZWItYXJtbXAiOwotCSRrcCA9fiBzL25lZWQt
a2VybmVsLWRlYi0kaG8tPntTdWl0ZX0tLy8gb3IgbmV4dDsKLQorICAgIGRpX3NwZWNpYWxfa2Vy
bmVsKCRobywgJGRfaSwgc3ViIHsKKyAgICAgICAgbXkgKCRrcCwkaywkYykgPSBAXzsKIAkkeG9w
dHN7ZHRic30gPSAiLyRkX2kvJGtwLWR0YnMiCiAJICAgIGlmIC1lICIkaG8tPntUZnRwfXtQYXRo
fS8kZF9pLyRrcC1kdGJzIjsKLSAgICB9CisgICAgfSk7CiAKICAgICAkeG9wdHN7ZHRic30gPSAi
LyRkX2kvZHRicyIKIAlpZiAhJHhvcHRze2R0YnN9ICYmIC1lICIkaG8tPntUZnRwfXtQYXRofS8k
ZF9pL2R0YnMiOwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
