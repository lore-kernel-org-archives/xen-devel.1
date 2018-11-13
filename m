From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 4/3] x86/HVM: hvm_map_guest_frame_rw() should
 respect p2m_ioreq_server
Date: Tue, 13 Nov 2018 03:46:32 -0700
Message-ID: <5BEAAB8802000078001FB62A@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMWDL-00052J-Iy
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:46:35 +0000
In-Reply-To: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V3JpdGVzIHRvIHN1Y2ggcGFnZXMgd291bGQgbmVlZCB0byBiZSBoYW5kZWQgdG8gdGhlIGVtdWxh
dG9yLCB3aGljaCB3ZSdyZQpub3QgcHJlcGFyZWQgdG8gZG8gYXQgdGhpcyBwb2ludC4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMjU1Niw3ICsy
NTU2LDggQEAgc3RhdGljIHZvaWQgKl9odm1fbWFwX2d1ZXN0X2ZyYW1lKHVuc2lnbgogCiAgICAg
aWYgKCB3cml0YWJsZSApCiAgICAgewotICAgICAgICBpZiAoIHVubGlrZWx5KHAybV9pc19kaXNj
YXJkX3dyaXRlKHAybXQpKSApCisgICAgICAgIGlmICggdW5saWtlbHkocDJtX2lzX2Rpc2NhcmRf
d3JpdGUocDJtdCkpIHx8CisgICAgICAgICAgICAgdW5saWtlbHkocDJtdCA9PSBwMm1faW9yZXFf
c2VydmVyKSApCiAgICAgICAgICAgICAqd3JpdGFibGUgPSAwOwogICAgICAgICBlbHNlIGlmICgg
IXBlcm1hbmVudCApCiAgICAgICAgICAgICBwYWdpbmdfbWFya19wZm5fZGlydHkoZCwgX3Bmbihn
Zm4pKTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
