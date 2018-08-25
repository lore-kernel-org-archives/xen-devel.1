From: Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v1 5/5] xen: sched: null: refactor the ASSERTs
 around vcpu_deassing()
Date: Sat, 25 Aug 2018 02:22:09 +0200
Message-ID: <153515652887.7407.1971756691562721734.stgit@Palanthas.fritz.box>
References: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nupg=li=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1ftMLG-0002Ai-1S
 for xen-devel@lists.xenproject.org; Sat, 25 Aug 2018 00:22:14 +0000
Received: by mail-wm0-f66.google.com with SMTP id y2-v6so3002989wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Aug 2018 17:22:12 -0700 (PDT)
In-Reply-To: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXQgaXMgYWxsIHRoZSB0aW1lIHRoYXQgd2UgY2FsbCB2Y3B1X2RlYXNzaW5nKCkgdGhhdCB0aGUg
dmNwdSBfbXVzdF8gYmUKYXNzaWduZWQgdG8gYSBwQ1BVLCBhbmQgaGVuY2UgdGhhdCBzdWNoIHBD
UFUgY2FuJ3QgYmUgZnJlZS4KClRoZXJlZm9yZSwgbW92ZSB0aGUgQVNTRVJULXMgd2hpY2ggY2hl
Y2sgZm9yIHRoZXNlIHByb3BlcnRpZXMgaW4gdGhhdApmdW5jdGlvbiwgd2hlcmUgdGhleSBiZWxv
bmcgYmV0dGVyLgotLS0KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4
LmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkX251bGwuYyB8ICAgIDUgKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9zY2hlZF9udWxsLmMgYi94ZW4vY29tbW9uL3NjaGVkX251bGwuYwppbmRleCAzZGMy
ZjA3MzhiLi5iMzc2NGRlNjU3IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX251bGwuYwor
KysgYi94ZW4vY29tbW9uL3NjaGVkX251bGwuYwpAQCAtMzY5LDYgKzM2OSw4IEBAIHN0YXRpYyBi
b29sIHZjcHVfZGVhc3NpZ24oc3RydWN0IG51bGxfcHJpdmF0ZSAqcHJ2LCBzdHJ1Y3QgdmNwdSAq
dikKICAgICBzdHJ1Y3QgbnVsbF92Y3B1ICp3dmM7CiAKICAgICBBU1NFUlQobGlzdF9lbXB0eSgm
bnVsbF92Y3B1KHYpLT53YWl0cV9lbGVtKSk7CisgICAgQVNTRVJUKHBlcl9jcHUobnBjLCB2LT5w
cm9jZXNzb3IpLnZjcHUgPT0gdik7CisgICAgQVNTRVJUKCFjcHVtYXNrX3Rlc3RfY3B1KHYtPnBy
b2Nlc3NvciwgJnBydi0+Y3B1c19mcmVlKSk7CiAKICAgICBwZXJfY3B1KG5wYywgY3B1KS52Y3B1
ID0gTlVMTDsKICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmcHJ2LT5jcHVzX2ZyZWUpOwpAQCAt
NTM5LDkgKzU0MSw2IEBAIHN0YXRpYyB2b2lkIG51bGxfdmNwdV9yZW1vdmUoY29uc3Qgc3RydWN0
IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAgZ290byBvdXQ7CiAgICAg
fQogCi0gICAgQVNTRVJUKHBlcl9jcHUobnBjLCB2LT5wcm9jZXNzb3IpLnZjcHUgPT0gdik7Ci0g
ICAgQVNTRVJUKCFjcHVtYXNrX3Rlc3RfY3B1KHYtPnByb2Nlc3NvciwgJnBydi0+Y3B1c19mcmVl
KSk7Ci0KICAgICB2Y3B1X2RlYXNzaWduKHBydiwgdik7CiAKICBvdXQ6CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
