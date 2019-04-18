From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 11/21] JobDB::Executive: step_*: fix log
 messages to talk about "steps"
Date: Thu, 18 Apr 2019 17:31:48 +0100
Message-ID: <20190418163158.11408-12-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xI-0001zU-67
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:08 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
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

VGhlc2UgZnVuY3Rpb25zIGFyZSBhYm91dCB0byBiZSBzb21ldGltZXMgY2FsbGVkIGZvciBub24t
c3Vic3RlcApzdGVwcy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvSm9iREIvRXhlY3V0aXZlLnBtIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL09zc3Rlc3QvSm9iREIvRXhlY3V0aXZlLnBtIGIvT3NzdGVzdC9Kb2JEQi9FeGVjdXRpdmUu
cG0KaW5kZXggZWEzNDkwNTIuLjNhNjgwYzlkIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0pvYkRCL0V4
ZWN1dGl2ZS5wbQorKysgYi9Pc3N0ZXN0L0pvYkRCL0V4ZWN1dGl2ZS5wbQpAQCAtMjgxLDcgKzI4
MSw3IEBAIEVORAogCQkJICAkbG9nZmlsZSAvLyAiJHN0ZXBuby4kc2NyaXB0LmxvZyIsCiAJCQkg
ICR0ZXN0aWQsdGltZSk7CiAgICAgfSk7Ci0gICAgbG9nbSgiLS0tLS0tLS0tLSBzdWJzdGVwICRz
dGVwbm8gJHRlc3RpZCBydW5uaW5nIC0tLS0tLS0tLS0iKTsKKyAgICBsb2dtKCItLS0tLS0tLS0t
IHN0ZXAgJHN0ZXBubyAkdGVzdGlkIHJ1bm5pbmcgLS0tLS0tLS0tLSIpOwogfQogCiBzdWIgc3Rl
cF9maW5pc2ggKCQkKSB7ICNtZXRob2QKQEAgLTMxMSw3ICszMTEsNyBAQCBFTkQKIAkgICAgdW5s
ZXNzICRvbGRzdGF0dXMgZXEgJ3J1bm5pbmcnOwogCSRzZXRxLT5leGVjdXRlKCRzdGVwc3RhdHVz
LHRpbWUsICRmbGlnaHQsJGpvYiwkdGVzdGlkLCAkc3RlcG5vKTsKICAgICB9KTsKLSAgICBsb2dt
KCItLS0tLS0tLS0tIHN1YnN0ZXAgJHN0ZXBubyAkdGVzdGlkICRzdGVwc3RhdHVzIC0tLS0tLS0t
LS0iKTsKKyAgICBsb2dtKCItLS0tLS0tLS0tIHN0ZXAgJHN0ZXBubyAkdGVzdGlkICRzdGVwc3Rh
dHVzIC0tLS0tLS0tLS0iKTsKIH0KIAogc3ViIGhvc3RfY2hlY2tfYWxsb2NhdGVkICgkJCkgeyAj
bWV0aG9kCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
