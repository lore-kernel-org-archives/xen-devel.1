From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 26/62] persistent-net: Add overlay in
 installer >= stretch
Date: Wed, 10 Apr 2019 15:23:32 +0100
Message-ID: <20190410142408.22848-27-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAG-0006Iz-7G
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:24 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
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

V2UgYXJlIGdvaW5nIHRvIG5lZWQgdGhpcyBpbiB0aGUgaW5zdGFsbGVyIHNvIHRoYXQgdGhlIGlu
dGVyZmFjZSBuYW1lcwpmcm9tIHRoZSBpbnN0YWxsZXIgZW52aXJvbm1lbnQgYXJlIGNhcHR1cmVk
IHNvIHRoYXQgdGhleSBjYW4gYmUgdGhlCnNhbWUgb24gdGhlIGhvc3QuCgpUaGlzIHByZXBhcmVz
IHRoZSBncm91bmQgZm9yIHR1cm5pbmcgb2ZmIG5ldC5pZm5hbWVzLiAgVGhlIGFjdHVhbApydWxl
cyBhcmUgZ2F0ZWQgb24gbmV0LmlmbmFtZXMgc28gcmlnaHQgbm93IHRoZXJlIGlzIG5vIGNoYW5n
ZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIHRzLWhvc3QtaW5zdGFsbCB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFsbCBiL3RzLWhvc3QtaW5zdGFs
bAppbmRleCA5YWIzZGU2Mi4uOGVhODFlMjQgMTAwNzU1Ci0tLSBhL3RzLWhvc3QtaW5zdGFsbAor
KysgYi90cy1ob3N0LWluc3RhbGwKQEAgLTE4OCw2ICsxODgsMTMgQEAgc3ViIHNldHVwX25ldGJv
b3RfZmlyc3Rib290KCQpIHsKICAgICBzeXN0ZW0gcXcocm0gLXJmIC0tKSwiJGluaXRyZF9vdmVy
bGF5LmQiOwogICAgIG1rZGlyICIkaW5pdHJkX292ZXJsYXkuZCIgb3IgZGllICIkaW5pdHJkX292
ZXJsYXkuZDogJCEiOwogCisgICAgaWYgKCRoby0+e1N1aXRlfSAhfiBtL3doZWV6eXxqZXNzaWUv
KSB7CisJbXkgQGNtZCA9IChxdyhjcCAtZFIgb3ZlcmxheS1wZXJzaXN0ZW50LW5ldC8uKSwKKwkJ
ICAgIiRpbml0cmRfb3ZlcmxheS5kLy4iKTsKKwlsb2dtKCJ1c2luZyBwZXJzaXN0ZW50LW5ldC1n
ZW5lcmF0b3I6IEBjbWQiKTsKKwlzeXN0ZW1fY2hlY2tlZCBAY21kOworICAgIH0KKwogICAgIG15
ICRpcGFwcGVuZCA9IDI7CiAgICAgbXkgJHdhbnRwaHlzaWY9IGdldF9ob3N0X3Byb3BlcnR5KCRo
bywnaW50ZXJmYWNlIGZvcmNlJywnYXV0bycpOwogICAgIGxvZ20oIkZvcmNpbmcgaW50ZXJmYWNl
ICR3YW50cGh5c2lmIik7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
