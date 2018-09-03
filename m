From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xl: refuse to set number of vcpus to 0
 via xl vcpu-set
Date: Mon,  3 Sep 2018 13:59:50 +0200
Message-ID: <20180903115950.28486-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9gce=lr=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fwnWN-0008DV-1x
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 11:59:55 +0000
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

VHJ5aW5nIHRvIHNldCB0aGUgbnVtYmVyIG9mIHZjcHVzIG9mIGEgZG9tYWluIHRvIDAgaXNuJ3Qg
cmVmdXNlZC4KV2Ugc2hvdWxkIG5vdCBhbGxvdyB0aGF0LgoKU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHRvb2xzL3hsL3hsX3ZjcHUuYyB8IDQgKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hs
L3hsX3ZjcHUuYyBiL3Rvb2xzL3hsL3hsX3ZjcHUuYwppbmRleCBhZWY0ODY4NjRjLi40NWFjMDFi
ZWRhIDEwMDY0NAotLS0gYS90b29scy94bC94bF92Y3B1LmMKKysrIGIvdG9vbHMveGwveGxfdmNw
dS5jCkBAIC0zNDEsNiArMzQxLDEwIEBAIHN0YXRpYyBpbnQgdmNwdXNldCh1aW50MzJfdCBkb21p
ZCwgY29uc3QgY2hhciogbnJfdmNwdXMsIGludCBjaGVja19ob3N0KQogICAgICAgICBmcHJpbnRm
KHN0ZGVyciwgIkVycm9yOiBJbnZhbGlkIGFyZ3VtZW50LlxuIik7CiAgICAgICAgIHJldHVybiAx
OwogICAgIH0KKyAgICBpZiAobnJfdmNwdXMgPT0gMCkgeworICAgICAgICBmcHJpbnRmKHN0ZGVy
ciwgIkVycm9yOiBTZXR0aW5nIG51bWJlciBvZiB2Y3B1cyB0byAwIGlzbid0IGFsbG93ZWQuXG4i
KTsKKyAgICAgICAgcmV0dXJuIDE7CisgICAgfQogCiAgICAgLyoKICAgICAgKiBNYXhpbXVtIGFt
b3VudCBvZiB2Q1BVUyB0aGUgZ3Vlc3QgaXMgYWxsb3dlZCB0byBzZXQgaXMgbGltaXRlZAotLSAK
Mi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
