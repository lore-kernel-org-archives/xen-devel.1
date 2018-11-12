From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: [PATCH 17/18] xen/arm: Resume Dom0 after Xen resumes
Date: Mon, 12 Nov 2018 12:30:43 +0100
Message-ID: <1542022244-22977-18-git-send-email-mirela.simonovic@aggios.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xmwf=nx=aggios.com=mirela.simonovic@srs-us1.protection.inumbo.net>)
 id 1gMARF-0005mv-3e
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 11:31:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id j17-v6so8891497wrq.11
 for <xen-devel@lists.xenproject.org>; Mon, 12 Nov 2018 03:31:28 -0800 (PST)
In-Reply-To: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, dm@aggios.com, saeed.nowshadi@xilinx.com, Julien Grall <julien.grall@arm.com>, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlc3VtZSBvZiBEb20wIHNob3VsZCBhbHdheXMgZm9sbG93IFhlbidzIHJlc3VtZS4gVGhp
cyBpcwpkb25lIGJ5IHVuYmxvY2tpbmcgdGhlIGZpcnN0IHZDUFUgb2YgRG9tMC4KClNpZ25lZC1v
ZmYtYnk6IE1pcmVsYSBTaW1vbm92aWMgPG1pcmVsYS5zaW1vbm92aWNAYWdnaW9zLmNvbT4KU2ln
bmVkLW9mZi1ieTogU2FlZWQgTm93c2hhZGkgPHNhZWVkLm5vd3NoYWRpQHhpbGlueC5jb20+Ci0t
LQogeGVuL2FyY2gvYXJtL3N1c3BlbmQuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3N1c3BlbmQuYyBiL3hlbi9hcmNo
L2FybS9zdXNwZW5kLmMKaW5kZXggNDIzZDljMGU5MC4uYTA1YWVhOWMyNSAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gvYXJtL3N1c3BlbmQuYworKysgYi94ZW4vYXJjaC9hcm0vc3VzcGVuZC5jCkBAIC0x
ODksNiArMTg5LDkgQEAgcmVzdW1lX25vbmJvb3RfY3B1czoKICAgICBzeXN0ZW1fc3RhdGUgPSBT
WVNfU1RBVEVfYWN0aXZlOwogICAgIGRzYihzeSk7CiAKKyAgICAvKiBXYWtlLXVwIGhhcmR3YXJl
IGRvbWFpbiAoc2hvdWxkIGFsd2F5cyByZXN1bWUgYWZ0ZXIgWGVuKSAqLworICAgIHZjcHVfdW5i
bG9jayhoYXJkd2FyZV9kb21haW4tPnZjcHVbMF0pOworCiAgICAgcmV0dXJuIHN0YXR1czsKIH0K
IAotLSAKMi4xMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
