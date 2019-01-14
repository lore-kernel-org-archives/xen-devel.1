From: Eric DeVolder <eric.devolder@oracle.com>
Subject: [RFC v1 4/8] kexec: xen/common/Makefile: include
 building of OpenSSL
Date: Mon, 14 Jan 2019 13:48:01 -0600
Message-ID: <1547495285-28907-5-git-send-email-eric.devolder__22927.0881195136$1547495286$gmane$org@oracle.com>
References: <1547495285-28907-1-git-send-email-eric.devolder@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1547495285-28907-1-git-send-email-eric.devolder@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: daniel.kiper@oracle.com, eric.devolder@oracle.com, kexec@lists.infradead.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

Q2hhbmdlcyBuZWVkZWQgdG8gdGhlIHhlbi9jb21tb24vTWFrZWZpbGUgaW4gb3JkZXIgdG8gc3Rp
dGNoIGluIHRoZQpjb21waWxpbmcgb2YgT3BlblNTTCBhcyB3ZWxsIGFzIHRoZSBQRUNPRkYgZmls
ZSBkZWNvZGVyIGFuZCBzaWduYXR1cmUKdmVyaWZpY2F0aW9uIGNvZGUuCgpTaWduZWQtb2ZmLWJ5
OiBFcmljIERlVm9sZGVyIDxlcmljLmRldm9sZGVyQG9yYWNsZS5jb20+Ci0tLQogeGVuL2NvbW1v
bi9NYWtlZmlsZSB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vTWFrZWZpbGUgYi94ZW4vY29tbW9uL01ha2VmaWxlCmluZGV4
IGIxYTVjNDIuLmJmOTEyMjcgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUKKysrIGIv
eGVuL2NvbW1vbi9NYWtlZmlsZQpAQCAtNzQsMyArNzQsNyBAQCBzdWJkaXItJChjb3ZlcmFnZSkg
Kz0gZ2NvdgogCiBzdWJkaXIteSArPSBsaWJlbGYKIHN1YmRpci0kKEhBU19ERVZJQ0VfVFJFRSkg
Kz0gbGliZmR0CisKK29iai0kKEhBU19LRVhFQykgKz0gcGVkLm8gdl9vcGVuc3NsLm8KK3N1YmRp
ci0kKEhBU19LRVhFQykgKz0gb3BlbnNzbC0xLjEuMGkKKwotLSAKMi43LjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
