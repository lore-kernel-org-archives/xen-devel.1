From: Maran Wilson <maran.wilson@oracle.com>
Subject: [PATCH 0/1] x86/PVHv2: Add memory map pointer to
	hvm_start_info struct
Date: Fri,  2 Mar 2018 12:54:28 -0800
Message-ID: <1520024069-30692-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jbeulich@suse.com, andrew.cooper3@citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGVyZSBpcyB0aGUgcGF0Y2ggZm9yIHVwZGF0aW5nIHRoZSBjYW5vbmljYWwgZGVmaW5pdGlvbiBv
ZiB0aGUKaHZtX3N0YXJ0X2luZm8gc3RydWN0IGNvcnJlc3BvbmRpbmcgdG8gdGhlIGRpc2N1c3Np
b24gaGFwcGVuaW5nIG9uIHRoZQpsaW51eC1rZXJuZWwgYW5kIGt2bSBtYWlsaW5nIGxpc3RzIHJl
Z2FyZGluZyBRZW11L0tWTSB1c2Ugb2YgdGhlIFBWSAplbnRyeSBwb2ludDoKCiAgIEtWTTogeDg2
OiBBbGxvdyBRZW11L0tWTSB0byB1c2UgUFZIIGVudHJ5IHBvaW50CiAgIGh0dHBzOi8vbGttbC5v
cmcvbGttbC8yMDE4LzIvMjgvMTEyMQoKTWFyYW4gV2lsc29uICgxKToKICAgICAgeDg2L1BWSHYy
OiBBZGQgbWVtb3J5IG1hcCBwb2ludGVyIHRvIGh2bV9zdGFydF9pbmZvIHN0cnVjdAoKIHhlbi9p
bmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9odm0vc3RhcnRfaW5mby5oIHwgNTEgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
