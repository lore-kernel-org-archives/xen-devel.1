From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 11/11] production-config: Update jessie
	amd64 kernel for NUMA bugfix
Date: Thu, 14 Dec 2017 16:22:22 +0000
Message-ID: <1513268542-16212-11-git-send-email-ian.jackson@eu.citrix.com>
References: <1513268542-16212-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dmf7=dk=citrix.com=prvs=514febeb1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ePWJS-0000Ck-H1
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 16:24:46 +0000
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

QnVtcCBUZnRwRGlWZXJzaW9uX2plc3NpZS4gIFRoaXMgaW5zdGFsbGVyIHdhcyBnZW5lcmF0ZWQg
YnkgbWUgdG9kYXksCndpdGggdGhlIGdpdCBicmFuY2ggaW5jbHVkaW5nIHRoZSBkaV9zcGVjaWFs
X2tlcm5lbCBzZXJpZXMsIHVzaW5nIHRoaXMKcnVuZToKCiBPU1NURVNUX1NQRUNJQUxLRVJORUxE
RUJfamVzc2llX2FtZDY0PSRQV0QvbGludXgtaW1hZ2UtMy4xNi4wLTQtYW1kNjRfMy4xNi41MS0z
fmEudGVzdF9hbWQ2NC5kZWIgLi9tZy1kZWJpYW4taW5zdGFsbGVyLXVwZGF0ZS1hbGwKClRoZSBm
aWxlIGxpbnV4LWltYWdlLTMuMTYuMC00LWFtZDY0XzMuMTYuNTEtM35hLnRlc3RfYW1kNjQuZGVi
CmNhbWUgZnJvbSBoZXJlCgogaHR0cHM6Ly9wZW9wbGUuZGViaWFuLm9yZy9+YmVuaC9wYWNrYWdl
cy9qZXNzaWUtcHUvbGludXgtaW1hZ2UtMy4xNi4wLTQtYW1kNjRfMy4xNi41MS0zfmEudGVzdF9h
bWQ2NC5kZWIKCmFwcm9wb3Mgb2YgdGhpcyBjb21tZW50IGluIHRoZSBEZWJpYW4gYnVnIHJlcG9y
dDoKCiBodHRwczovL2J1Z3MuZGViaWFuLm9yZy9jZ2ktYmluL2J1Z3JlcG9ydC5jZ2k/YnVnPTg4
MzkzOCMxNzAKClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgotLS0KIHByb2R1Y3Rpb24tY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcHJvZHVjdGlvbi1jb25m
aWcgYi9wcm9kdWN0aW9uLWNvbmZpZwppbmRleCA4ZTdjYzQzLi5jMmNhYTA1IDEwMDY0NAotLS0g
YS9wcm9kdWN0aW9uLWNvbmZpZworKysgYi9wcm9kdWN0aW9uLWNvbmZpZwpAQCAtOTIsNyArOTIs
NyBAQCBUZnRwTmV0R3J1YlRlbXBsYXRlc1JlYWwgTmV0Z3J1Yi5jZmcvJWV0aGVyJQogVGZ0cE5l
dGJvb3RHcm91cCBvc3N0ZXN0CiAjIFVwZGF0ZSB3aXRoIC4vbWctZGViaWFuLWluc3RhbGxlci11
cGRhdGUoLWFsbCkKIFRmdHBEaVZlcnNpb25fd2hlZXp5IDIwMTYtMDYtMDgKLVRmdHBEaVZlcnNp
b25famVzc2llIDIwMTctMTItMTEKK1RmdHBEaVZlcnNpb25famVzc2llIDIwMTctMTItMTQKIAog
IyBGb3IgSVNPIGluc3RhbGxzCiBEZWJpYW5JbWFnZVZlcnNpb25fd2hlZXp5IDcuMi4wCi0tIAoy
LjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
