From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 54/62] ts-debian-hvm-install: Honour
 linux_boot_append target var
Date: Wed, 10 Apr 2019 15:24:00 +0100
Message-ID: <20190410142408.22848-55-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAb-00075Y-5R
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:45 +0000
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

VGhpcyBsb29rcyBmb3I6CiAgPGd1ZXN0Pl9saW51eF9ib290X2FwcGVuZAogIGFsbF9ndWVzdF9s
aW51eF9ib290X2FwcGVuZAoKTm90aGluZyBzZXRzIHRoZXNlIHlldC4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWRlYmlhbi1o
dm0taW5zdGFsbCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvdHMtZGViaWFuLWh2bS1pbnN0YWxsIGIvdHMtZGViaWFuLWh2bS1pbnN0YWxsCmlu
ZGV4IDU0ZDVkMWMyLi5lZDg4MDNlZCAxMDA3NTUKLS0tIGEvdHMtZGViaWFuLWh2bS1pbnN0YWxs
CisrKyBiL3RzLWRlYmlhbi1odm0taW5zdGFsbApAQCAtMTI5LDYgKzEyOSw5IEBAIHN1YiBnY21k
bGluZSAoOyQpIHsKIAkJCQkJICAgIFByZXNlZWRTY2hlbWUgPT4gJ2ZpbGUnKTsKICAgICBwdXNo
IEBkaWNtZGxpbmUsICRleHRyYSBpZiAkZXh0cmE7CiAKKyAgICBteSAkYXBwZW5kID0gdGFyZ2V0
X3ZhcigkZ2hvLCdsaW51eF9ib290X2FwcGVuZCcpOworICAgIHB1c2ggQGRpY21kbGluZSwgJGFw
cGVuZCBpZiAkYXBwZW5kOworCiAgICAgcHVzaCBAZGljbWRsaW5lLCAiLS0iOwogICAgICMgU2Vl
IGh0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9NzYyMDA3
IGZvcgogICAgICMgd2h5IGNvbnNvbGU9IGlzIHJlcGVhdGVkLgotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
