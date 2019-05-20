From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/4] mg-repro-setup: Do all builds in
 their own tasks, regardless
Date: Mon, 20 May 2019 16:41:44 +0100
Message-ID: <20190520154147.30675-2-ian.jackson@eu.citrix.com>
References: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSkR0-0006hV-Mr
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:42:42 +0000
In-Reply-To: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
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

SW4gY2FzZSBPU1NURVNUX1RBU0sgd2FzIHNldCBieSB0aGUgY2FsbGVyLCB1bnNldCBpdC4gIFVu
c2V0dGluZyBpdAp3aWxsIGNhdXNlIGVhY2ggc2ctcnVuLWpvYiAoaW5zaWRlIG1nLWV4ZWN1dGUt
dGFzaykgdG8gYmVjb21lIGl0cyBvd24KdGFzay4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1nLXJlcHJvLXNldHVwIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9tZy1yZXByby1zZXR1cCBiL21nLXJlcHJvLXNldHVwCmluZGV4IGRjNmM1Y2JiLi41YTUy
ZTYxNyAxMDA3NTUKLS0tIGEvbWctcmVwcm8tc2V0dXAKKysrIGIvbWctcmVwcm8tc2V0dXAKQEAg
LTI0Nyw3ICsyNDcsOCBAQCBwcm9ncmVzcyAibmV3IGZsaWdodCBpcyAkZmxpZ2h0IgogCiBpZiBb
ICJ4JHJlYnVpbGRzX2ZsaWdodCIgIT0geCBdOyB0aGVuCiAJcHJvZ3Jlc3MgInJ1bm5pbmcgYnVp
bGQocykgJHJlYnVpbGRzX2ZsaWdodCIKLQkuL21nLWV4ZWN1dGUtZmxpZ2h0IC1CJHJlYnVpbGRz
X2JsZXNzaW5nIC0tcHJvZ3Jlc3MtZmQ9MiBcCisJZW52IC11IE9TU1RFU1RfVEFTSyBcCisgICAg
ICAgICAgICAgICAgLi9tZy1leGVjdXRlLWZsaWdodCAtQiRyZWJ1aWxkc19ibGVzc2luZyAtLXBy
b2dyZXNzLWZkPTIgXAogCQkiJHttZ2V4ZWNmbGFnc1tAXX0iICRyZWJ1aWxkc19mbGlnaHQKIAog
CW1ybz10bXAvJHJlYnVpbGRzX2ZsaWdodC5tcm8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
