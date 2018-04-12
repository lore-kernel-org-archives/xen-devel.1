From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 06/11] docs/Makefile: Introduce
 GENERATE_PANDOC_RULE_RAW
Date: Thu, 12 Apr 2018 13:28:31 +0100
Message-ID: <1523536116-31316-7-git-send-email-ian.jackson@eu.citrix.com>
References: <1523536116-31316-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9+jx=hb=citrix.com=prvs=633689d9b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f6bLN-0006O6-Gc
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 12:28:49 +0000
In-Reply-To: <1523536116-31316-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gZm9ybWF0IFNVUFBPUlQubWQgd2hpY2ggZG9lcyBub3Qg
bWF0Y2ggdGhlCmZpbGVuYW1lIHBhdHRlcm5zIGluIGRvY3MvLiAgU28gcHJvdmlkZSBhIHdheSB0
byBtYWtlIGFuIGFkLWhvYyBydWxlCnVzaW5nIHBhbmRvYyB3aXRoIHRoZSBzdGFuZGFyZCBvcHRp
b25zLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW4gdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgpSZWxlYXNlLWFja2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkFja2VkLWJ5OiBMYXJzIEt1cnRoIDxs
YXJzLmt1cnRoQGNpdHJpeC5jb20+Ci0tLQogZG9jcy9NYWtlZmlsZSB8IDExICsrKysrKy0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RvY3MvTWFrZWZpbGUgYi9kb2NzL01ha2VmaWxlCmluZGV4IDY3NDNmYTMuLmQ4MjQ2
M2YgMTAwNjQ0Ci0tLSBhL2RvY3MvTWFrZWZpbGUKKysrIGIvZG9jcy9NYWtlZmlsZQpAQCAtMjM3
LDE3ICsyMzcsMTggQEAgdHh0LyUudHh0OiAlLm1hcmtkb3duCiAJJChJTlNUQUxMX0RBVEEpICQ8
ICRACiAKICMgTWV0YXJ1bGUgZm9yIGdlbmVyYXRpbmcgcGFuZG9jIHJ1bGVzLgotZGVmaW5lIEdF
TkVSQVRFX1BBTkRPQ19SVUxFCi0jICQoMSkgaXMgdGhlIHRhcmdldCBkb2N1bWVudGF0aW9uIGZv
cm1hdC4gJCgyKSBpcyB0aGUgc291cmNlIGZvcm1hdC4KLQotJCgxKS8lLiQoMSk6ICUuJCgyKQor
ZGVmaW5lIEdFTkVSQVRFX1BBTkRPQ19SVUxFX1JBVworJCgxKTogJCgyKQogaWZuZXEgKCQoUEFO
RE9DKSwpCiAJQCQoSU5TVEFMTF9ESVIpICQkKEBEKQogCSQoUEFORE9DKSAtLW51bWJlci1zZWN0
aW9ucyAtLXRvYyAtLXN0YW5kYWxvbmUgJCQ8IC0tb3V0cHV0ICQkQAogZWxzZQogCUBlY2hvICJw
YW5kb2Mgbm90IGluc3RhbGxlZDsgc2tpcHBpbmcgJCRAIgogZW5kaWYKLQorZW5kZWYKK2RlZmlu
ZSBHRU5FUkFURV9QQU5ET0NfUlVMRQorIyAkKDEpIGlzIHRoZSB0YXJnZXQgZG9jdW1lbnRhdGlv
biBmb3JtYXQuICQoMikgaXMgdGhlIHNvdXJjZSBmb3JtYXQuCiskKGNhbGwgR0VORVJBVEVfUEFO
RE9DX1JVTEVfUkFXLCQoMSkvJS4kKDEpLCUuJCgyKSkKIGVuZGVmCiAkKGV2YWwgJChjYWxsIEdF
TkVSQVRFX1BBTkRPQ19SVUxFLHBkZixwYW5kb2MpKSAgICMgcGRmLyUucGRmOiAlLnBhbmRvYwog
JChldmFsICQoY2FsbCBHRU5FUkFURV9QQU5ET0NfUlVMRSx0eHQscGFuZG9jKSkgICAjIHR4dC8l
LnR4dDogJS5wYW5kb2MKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
