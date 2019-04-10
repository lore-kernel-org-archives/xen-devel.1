From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 27/62] ts-host-install: Break out
 $persistent_net_rules
Date: Wed, 10 Apr 2019 15:23:33 +0100
Message-ID: <20190410142408.22848-28-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAI-0006Mu-Ba
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:26 +0000
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

V2UncmUgZ29pbmcgdG8gd2FudCB0byByZXVzZSB0aGlzIHZhbHVlLgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtaG9zdC1pbnN0
YWxsIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFsbCBiL3RzLWhvc3QtaW5zdGFsbAppbmRl
eCA4ZWE4MWUyNC4uZjgwYTE1MWMgMTAwNzU1Ci0tLSBhL3RzLWhvc3QtaW5zdGFsbAorKysgYi90
cy1ob3N0LWluc3RhbGwKQEAgLTE5NSw2ICsxOTUsOSBAQCBzdWIgc2V0dXBfbmV0Ym9vdF9maXJz
dGJvb3QoJCkgewogCXN5c3RlbV9jaGVja2VkIEBjbWQ7CiAgICAgfQogCisgICAgbXkgJHBlcnNp
c3RlbnRfbmV0X3J1bGVzID0KKwkiJGluaXRyZF9vdmVybGF5LmQvZXRjL3VkZXYvcnVsZXMuZC83
MC1wZXJzaXN0ZW50LW5ldC5ydWxlcyI7CisKICAgICBteSAkaXBhcHBlbmQgPSAyOwogICAgIG15
ICR3YW50cGh5c2lmPSBnZXRfaG9zdF9wcm9wZXJ0eSgkaG8sJ2ludGVyZmFjZSBmb3JjZScsJ2F1
dG8nKTsKICAgICBsb2dtKCJGb3JjaW5nIGludGVyZmFjZSAkd2FudHBoeXNpZiIpOwpAQCAtMjA2
LDcgKzIwOSw3IEBAIHN1YiBzZXR1cF9uZXRib290X2ZpcnN0Ym9vdCgkKSB7CiAJIyBpcCg4KSBt
b3ZlZCB0byAvc2JpbiBpbiBKZXNzaWUKIAlteSAkaXBjbWQgPSAkaG8tPntTdWl0ZX0gPX4gbS93
aGVlenkvID8gIi9iaW4vaXAiIDogIi9zYmluL2lwIjsKICAgICAgICAgZmlsZV9zaW1wbGVfd3Jp
dGVfY29udGVudHMKLSAgICAgICAgICAgICgiJGluaXRyZF9vdmVybGF5LmQvZXRjL3VkZXYvcnVs
ZXMuZC83MC1wZXJzaXN0ZW50LW5ldC5ydWxlcyIsCisgICAgICAgICAgICAoJHBlcnNpc3RlbnRf
bmV0X3J1bGVzLAogICAgICAgICAgICAgICRoby0+e0ZsYWdzfXsnZm9yY2UtbWFjLWFkZHJlc3Mn
fSA/IDw8RU5EIDogPDxFTkQpOwogU1VCU1lTVEVNPT0ibmV0IiwgQUNUSU9OPT0iYWRkIiwgRFJJ
VkVSUz09Ij8qIiwgS0VSTkVMPT0iJHdhbnRwaHlzaWYiLCBSVU4gKz0gIiRpcGNtZCBsaW5rIHNl
dCAkd2FudHBoeXNpZiBhZGRyZXNzICRoby0+e0V0aGVyfSIKIEVORAotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
