From: Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.11] tools/xenstore: fix linking
 libxenstore with ldl
Date: Fri, 23 Mar 2018 08:42:53 +0100
Message-ID: <20180323074253.16695-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9yei=gn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ezHLm-0002Ia-Vf
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 07:42:58 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, wei.liu2@citrix.com, ian.jackson@eu.citrix.com, cardoe@cardoe.com
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDQ0OGMwM2IzY2JlMTQ4NyAoInRvb2xzL3hlbnN0b3JlOiB0cnkgdG8gZ2V0IG1pbmlt
dW0gdGhyZWFkCnN0YWNrIHNpemUgZm9yIHdhdGNoIHRocmVhZCIpIGFkZGVkIGEgZGVwZW5kZW5j
eSB0byBsaWJkbCB0bwpsaWJ4ZW5zdG9yZS4gVW5mb3J0dW5hdGVseSB0aGUgd2F5IGl0IHdhcyBh
ZGRlZCByZXF1aXJlcyBub3cgYWxsCnVzZXJzIG9mIGxpYnhlbnN0b3JlIHRvIHNwZWNpZnkgIi1s
ZGwiIHdoZW4gbGlua2luZy4gVGhpcyBjYW4gYmUKYXZvaWRlZCBieSBsaW5raW5nIGxpYnhlbnN0
b3JlLnNvIHNwZWNpZnlpbmcgIi1sZGwiIGFzIGEgdHJhaWxpbmcKb3B0aW9uLiBTbyB1c2UgQVBQ
RU5EX0xERkxBR1MgaW5zdGVhZCBvZiBMREZMQUdTIGZvciBhZGRpbmcgdGhlCiItbGRsIiBvcHRp
b24gd2hlbiBsaW5raW5nIGxpYnhlbnN0b3JlLnNvLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHRvb2xzL3hlbnN0b3JlL01ha2VmaWxlIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMveGVuc3RvcmUvTWFrZWZpbGUgYi90b29scy94ZW5zdG9yZS9NYWtlZmlsZQpp
bmRleCA2OWU1NWU3M2U1Li40NDVlOTkxMWIyIDEwMDY0NAotLS0gYS90b29scy94ZW5zdG9yZS9N
YWtlZmlsZQorKysgYi90b29scy94ZW5zdG9yZS9NYWtlZmlsZQpAQCAtMTA0LDcgKzEwNCw3IEBA
IGxpYnhlbnN0b3JlLnNvLiQoTUFKT1IpOiBsaWJ4ZW5zdG9yZS5zby4kKE1BSk9SKS4kKE1JTk9S
KQogeHMub3BpYzogQ0ZMQUdTICs9IC1EVVNFX1BUSFJFQUQKIGlmZXEgKCQoQ09ORklHX0xpbnV4
KSx5KQogeHMub3BpYzogQ0ZMQUdTICs9IC1EVVNFX0RMU1lNCi1saWJ4ZW5zdG9yZS5zby4kKE1B
Sk9SKS4kKE1JTk9SKTogTERGTEFHUyArPSAtbGRsCitsaWJ4ZW5zdG9yZS5zby4kKE1BSk9SKS4k
KE1JTk9SKTogQVBQRU5EX0xERkxBR1MgKz0gLWxkbAogZWxzZQogUEtHX0NPTkZJR19SRU1PVkUg
Kz0gLWxkbAogZW5kaWYKLS0gCjIuMTMuNgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
