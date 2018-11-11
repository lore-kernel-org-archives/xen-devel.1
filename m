From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V5 0/3] Fix VGA logdirty related display freezes
 with altp2m
Date: Sun, 11 Nov 2018 16:07:01 +0200
Message-ID: <1541945224-23075-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j1di=nw=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gLqOc-0004Dv-Fw
 for xen-devel@lists.xenproject.org; Sun, 11 Nov 2018 14:07:26 +0000
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B36CE3016E60
 for <xen-devel@lists.xenproject.org>; Sun, 11 Nov 2018 16:07:22 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id A6031300F727
 for <xen-devel@lists.xenproject.org>; Sun, 11 Nov 2018 16:07:22 +0200 (EET)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZXJpZXMgYWltcyB0byBwcmV2ZW50IHRoZSBkaXNwbGF5IGZyb20gZnJlZXppbmcgd2hl
bgplbmFibGluZyBhbHRwMm0gYW5kIHN3aXRjaGluZyB0byBhIG5ldyB2aWV3IChhbmQgYXNzb3J0
ZWQgcHJvYmxlbXMKd2hlbiByZXNpemluZyB0aGUgZGlzcGxheSkuIFNpbmNlIHRoZSBsYXN0IHZl
cnNpb24gb2YgdGhlIHNlcmllcywKd2hhdCB3YXMgcHJldmlvdXNseSB0aGUgc2Vjb25kIChhbmQg
bGFzdCkgcGF0Y2ggaGFzIGJlZW4gc3BsaXQgaW4KdHdvIHBhdGNoZXMsIHRoZSBmaXJzdCBvZiB3
aGljaCBvbmx5IGNvbmNlcm5zIGl0c2VsZiB3aXRoIHJhbmdlc2V0CmFsbG9jYXRpb24gLyBkZWFs
bG9jYXRpb24gLyBpbml0aWFsaXphdGlvbi4KClRoZSBmaXJzdCBwYXRjaCBwcm9wYWdhdGVzIGVw
dC5hZCBjaGFuZ2VzIHRvIGFsbCBhY3RpdmUgYWx0cDJtcywKdGhlIHNlY29uZCBvbmUgYWxsb2Nh
dGVzIGFuZCBpbml0aWFsaXplcyBhIG5ldyBsb2dkaXJ0eSByYW5nZXNldCBmb3IKZWFjaCBuZXcg
YWx0cDJtLCBhbmQgdGhlIHRoaXJkIHByb3BhZ2F0ZXMgKHVuZGVyIGxvY2spIGNoYW5nZXMgdG8g
YWxsCnAybXMuCgpbUEFUQ0ggVjUgMS8zXSB4ODYvYWx0cDJtOiBwcm9wYWdhdGUgZXB0LmFkIGNo
YW5nZXMgdG8gYWxsIGFjdGl2ZSBhbHRwMm0KW1BBVENIIFY1IDIvM10geDg2L21tOiBhbGxvY2F0
ZSBsb2dkaXJ0eV9yYW5nZXMgZm9yIGFsdHAybXMKW1BBVENIIFY1IDMvM10geDg2L2FsdHAybTog
Zml4IGRpc3BsYXkgZnJvemVuIHdoZW4gc3dpdGNoaW5nIHRvIGEgbmV3IHZpZXcgZWFybHkKCgpU
aGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
