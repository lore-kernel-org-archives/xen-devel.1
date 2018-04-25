From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 6/9] docs/Makefile: Introduce
 GENERATE_PANDOC_RULE_RAW
Date: Wed, 25 Apr 2018 14:00:02 +0100
Message-ID: <1524661205-7088-7-git-send-email-ian.jackson@eu.citrix.com>
References: <1524661205-7088-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fg/1=ho=citrix.com=prvs=6464c4f88=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBK1x-00038p-Pd
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 13:00:17 +0000
In-Reply-To: <1524661205-7088-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gZm9ybWF0IFNVUFBPUlQubWQgd2hpY2ggZG9lcyBub3Qg
bWF0Y2ggdGhlCmZpbGVuYW1lIHBhdHRlcm5zIGluIGRvY3MvLiAgU28gcHJvdmlkZSBhIHdheSB0
byBtYWtlIGFuIGFkLWhvYyBydWxlCnVzaW5nIHBhbmRvYyB3aXRoIHRoZSBzdGFuZGFyZCBvcHRp
b25zLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW4gdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgpSZWxlYXNlLWFja2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkFja2VkLWJ5OiBMYXJzIEt1cnRoIDxs
YXJzLmt1cnRoQGNpdHJpeC5jb20+CihjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDUzOWY5Mzk0
NWNhZDA2ZmQ5MDc4NDcxNmJlMWRjOGQyNjI0YjZmNjYpCi0tLQogZG9jcy9NYWtlZmlsZSB8IDEx
ICsrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvTWFrZWZpbGUgYi9kb2NzL01ha2VmaWxlCmluZGV4IDY3
NDNmYTMuLmQ4MjQ2M2YgMTAwNjQ0Ci0tLSBhL2RvY3MvTWFrZWZpbGUKKysrIGIvZG9jcy9NYWtl
ZmlsZQpAQCAtMjM3LDE3ICsyMzcsMTggQEAgdHh0LyUudHh0OiAlLm1hcmtkb3duCiAJJChJTlNU
QUxMX0RBVEEpICQ8ICRACiAKICMgTWV0YXJ1bGUgZm9yIGdlbmVyYXRpbmcgcGFuZG9jIHJ1bGVz
LgotZGVmaW5lIEdFTkVSQVRFX1BBTkRPQ19SVUxFCi0jICQoMSkgaXMgdGhlIHRhcmdldCBkb2N1
bWVudGF0aW9uIGZvcm1hdC4gJCgyKSBpcyB0aGUgc291cmNlIGZvcm1hdC4KLQotJCgxKS8lLiQo
MSk6ICUuJCgyKQorZGVmaW5lIEdFTkVSQVRFX1BBTkRPQ19SVUxFX1JBVworJCgxKTogJCgyKQog
aWZuZXEgKCQoUEFORE9DKSwpCiAJQCQoSU5TVEFMTF9ESVIpICQkKEBEKQogCSQoUEFORE9DKSAt
LW51bWJlci1zZWN0aW9ucyAtLXRvYyAtLXN0YW5kYWxvbmUgJCQ8IC0tb3V0cHV0ICQkQAogZWxz
ZQogCUBlY2hvICJwYW5kb2Mgbm90IGluc3RhbGxlZDsgc2tpcHBpbmcgJCRAIgogZW5kaWYKLQor
ZW5kZWYKK2RlZmluZSBHRU5FUkFURV9QQU5ET0NfUlVMRQorIyAkKDEpIGlzIHRoZSB0YXJnZXQg
ZG9jdW1lbnRhdGlvbiBmb3JtYXQuICQoMikgaXMgdGhlIHNvdXJjZSBmb3JtYXQuCiskKGNhbGwg
R0VORVJBVEVfUEFORE9DX1JVTEVfUkFXLCQoMSkvJS4kKDEpLCUuJCgyKSkKIGVuZGVmCiAkKGV2
YWwgJChjYWxsIEdFTkVSQVRFX1BBTkRPQ19SVUxFLHBkZixwYW5kb2MpKSAgICMgcGRmLyUucGRm
OiAlLnBhbmRvYwogJChldmFsICQoY2FsbCBHRU5FUkFURV9QQU5ET0NfUlVMRSx0eHQscGFuZG9j
KSkgICAjIHR4dC8lLnR4dDogJS5wYW5kb2MKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
