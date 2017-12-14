From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 10/11] mg-debian-installer-update:
	Honour OSSTEST_SPECIALKERNELDEB_<suite>_<arch>
Date: Thu, 14 Dec 2017 16:22:21 +0000
Message-ID: <1513268542-16212-10-git-send-email-ian.jackson@eu.citrix.com>
References: <1513268542-16212-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dmf7=dk=citrix.com=prvs=514febeb1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ePWI3-00081U-Om
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 16:23:19 +0000
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB2YXJpYWJsZSBjYW4gYmUgc2V0IHRvIHRoZSBhYnNvbHV0ZSBwYXRobmFtZSBvZiBhIGtl
cm5lbCAuZGViIHRvCnVzZS4gIEl0IHdpbGwgYmUgdXNlZCBvbmx5IGZvciBob3N0cyBmb3Igd2hp
Y2ggdGhlIGNvcnJlc3BvbmRpbmcKaG9zdGZsYWcgIm5lZWQta2VybmVsLWRlYi08c3VpdGU+LXNw
ZWNpYWwiIGlzIHNldC4KClRoZXJlIGlzIG5vdCBjdXJyZW50bHkgYW55IGZhY2lsaXR5IGZvciBt
b3JlIHRoYW4gb25lIHNwZWNpYWwga2VybmVsCmZvciBlYWNoIGFyY2hpdGVjdHVyZS4KCkFzIHdp
dGggYmFja3BvcnRzIGtlcm5lbHMsIHRoZSBub3JtYWwgKERlYmlhbi1zdXBwbGllZCkga2VybmVs
IGlzCmF2YWlsYWJsZSB0b28sIGFuZCBpcyB1c2VkIGZvciBob3N0cyB3aXRob3V0IGFueSBzcGVj
aWFsIGhvc3RmbGFnLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1
LmNpdHJpeC5jb20+Ci0tLQogbWctZGViaWFuLWluc3RhbGxlci11cGRhdGUgfCA5ICsrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL21nLWRlYmlhbi1pbnN0YWxsZXItdXBkYXRlIGIvbWctZGViaWFuLWluc3RhbGxlci11
cGRhdGUKaW5kZXggNGYzMThjMS4uZjFlNjgyZiAxMDA3NTUKLS0tIGEvbWctZGViaWFuLWluc3Rh
bGxlci11cGRhdGUKKysrIGIvbWctZGViaWFuLWluc3RhbGxlci11cGRhdGUKQEAgLTExNCw3ICsx
MTQsMTQgQEAgY2FzZSAke3N1aXRlfV8ke2FyY2h9IGluCiAgICAgd2hlZXp5X2FybWhmKSBicG9r
PWFybW1wOyBuZWVkX2luaXRyYW1mcz15OzsKICAgICBqZXNzaWVfYXJtNjQpIGJwb2s9YXJtNjQg
ICAgICAgICAgICAgICAgICA7OwogZXNhYwotaWYgWyB4JGJwb2sgIT0geCBdOyB0aGVuCitldmFs
ICJzcGVjaWFsZGViPVwke09TU1RFU1RfU1BFQ0lBTEtFUk5FTERFQl8ke3N1aXRlfV8ke2FyY2h9
fSIKK2lmIFsgIngkc3BlY2lhbGRlYiIgIT0geCBdOyB0aGVuCisgICAgZWNobyAidXNpbmcgc3Bl
Y2lhbCBrZXJuZWwgJHNwZWNpYWxkZWIiCisgICAgY3AgJHNwZWNpYWxkZWIgc3BlY2lhbC5kZWIK
KyAgICBzcGVjaWFsa2VybmVsPXNwZWNpYWwKKyAgICBicG9rPScnCitmaQoraWYgWyB4JGJwb2sg
IT0geCBdICYmIFsgIngkc3BlY2lhbGtlcm5lbCIgPSB4IF07IHRoZW4KICAgICBicD0iJHNiYXNl
LWJhY2twb3J0cyIKICAgICBwZmlsZT0kYnAvbWFpbi9iaW5hcnktJGFyY2gvUGFja2FnZXMuZ3oK
IAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
