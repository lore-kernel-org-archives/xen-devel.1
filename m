From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] Backport fixes
Date: Mon, 29 Apr 2019 17:16:28 +0100
Message-ID: <1556554590-25358-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiJS=S7=citrix.com=prvs=0159f91d2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hL8xO-0004Wr-7D
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:16:42 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UGF0Y2ggMSBpcyBhcHBsaWNhYmxlIHRvIFhlbiA0LjEwIGFuZCA0LjExClBhdGNoIDIgaXMgYXBw
bGljYWJsZSB0byBqdXN0IFhlbiA0LjExCgpBbmRyZXcgQ29vcGVyICgyKToKICB4ZW46IEZpeCBi
YWNrcG9ydCBvZiAieGVuL2NtZGxpbmU6IEZpeCBidWdneSBzdHJuY21wKHMsIExJVEVSQUwsIHNz
IC0gcykgY29uc3RydWN0IgogIHhlbjogRml4IGJhY2twb3J0IG9mICJ4ODYvdHN4OiBJbXBsZW1l
bnQgY29udHJvbHMgZm9yIFJUTSBmb3JjZS1hYm9ydGUgbW9kZSIKCiB4ZW4vYXJjaC94ODYvY3B1
L3ZwbXUuYyAgICAgfCA0ICsrKysKIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICB8IDQgKyst
LQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jIHwgNCArKy0tCiAzIGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
