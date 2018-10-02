From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] tools: correct/enhance cpupool handling
Date: Tue,  2 Oct 2018 16:19:32 +0200
Message-ID: <20181002141934.21503-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ffqy=mo=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g7LWV-00043x-Km
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 14:19:39 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

TWFrZSBoYW5kbGluZyBvZiBjcHVwb29sIGRhdGEgaW4gZG9tYWluIGNvbmZpZyBtb3JlIGNvbnNp
c3RlbnQuCgpQYXRjaCAxIGlzIHVwZGF0aW5nIHRoZSBjcHVwb29sIGluIGRvbWFpbidzIGNvbmZp
ZyB3aGVuIG1vdmluZyB0aGUKZG9tYWluIHRvIGFub3RoZXIgY3B1cG9vbC4KClBhdGNoIDIgYWxs
b3dzIHRvIHNwZWNpZnkgYSBjcHVwb29sIG9uIHRoZSBkZXN0aW5hdGlvbiBob3N0IGZvciBkb21h
aW4KbWlncmF0aW9uLgoKSnVlcmdlbiBHcm9zcyAoMik6CiAgbGlieGw6IG1vZGlmeSBkb21haW4g
Y29uZmlnIHdoZW4gbW92aW5nIGRvbWFpbiB0byBhbm90aGVyIGNwdXBvb2wKICB4bDogYWRkIHRh
cmdldCBjcHVwb29sIHBhcmFtZXRlciB0byB4bCBtaWdyYXRlCgogZG9jcy9tYW4veGwucG9kLjEu
aW4gICAgICAgIHwgIDUgKysrKysKIHRvb2xzL2xpYnhsL2xpYnhsX2NwdXBvb2wuYyB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKysrKystLS0KIHRvb2xzL3hsL3hsLmggICAgICAgICAgICAgICB8
ICAxICsKIHRvb2xzL3hsL3hsX2NtZHRhYmxlLmMgICAgICB8ICAzICsrKwogdG9vbHMveGwveGxf
bWlncmF0ZS5jICAgICAgIHwgMTUgKysrKysrKysrKy0tLS0tCiB0b29scy94bC94bF9zYXZlcmVz
dG9yZS5jICAgfCAxMCArKysrKysrKystCiA2IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
