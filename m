From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 0/4] Use ^ for negation, not !
Date: Thu, 3 May 2018 15:58:11 +0100
Message-ID: <1525359495-30844-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t3s+=hw=citrix.com=prvs=654c57523=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fEFgd-0004vd-7Z
 for xen-devel@lists.xenproject.org; Thu, 03 May 2018 14:58:23 +0000
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

UGVvcGxlIGtlZXAgaGF2aW5nIHRyb3VibGUgd2l0aCB0aGUgISBzeW50YXggZm9yIG5lZ2F0aW9u
LCBiZWNhdXNlIG9mCnRoZSAhLWhpc3RvcnkgZmVhdHVyZSBpbiBzb21lIHNoZWxscyAobm90YWJs
eSwgZW5hYmxlZCBieSBkZWZhdWx0IGluCmJhc2ggaW4gYWxsIGRpc3Ryb3MpLgoKVGhlIHJlc3Vs
dCBpcyB0aGF0IGF0dGVtcHRzIHRvIGRlYWxsb2NhdGUgaG9zdHMsIG9yIGRvIHNvbWUgb3RoZXIK
dGhpbmdzLCBwcm9kdWNlcyBhbiBpbmNvbXByZW5zaWJsZSAiZXZlbnQgbm90IGZvdW5kIiBtZXNz
YWdlLgoKSSBkb24ndCBzdWZmZXIgZnJvbSB0aGlzIGJlY2F1c2UgSSBoYXZlIGl0IHR1cm5lZCBv
ZmYsIHdpdGggc2V0IC1ILgpJTU8gaXQgc2hvdWxkIGJlIG9mZiBieSBkZWZhdWx0LiAgKFRoaXMg
aXMgRGViaWFuICM4OTc0MjIuKQoKQXZvaWQgdGhpcyB3aG9sZSBwcm9ibGVtIGJ5IHVzaW5nIF4g
ZXZlcnl3aGVyZSB3ZSBwcmV2aW91c2x5IHVzZWQgIQpmb3IgbmVnYXRpb24uICAoV2UgY29udGlu
dWUgdG8gaG9ub3VyICEuKQoKUGxhY2VzIHdoZXJlICEgaXMgc3RpbGwgdGhlIG5lY2Vzc2FyeSBz
eW50YWN0aWMgY2hhcmFjdGVyIHRvIGRvCnNvbWV0aGluZyBpbiBvc3N0ZXN0IGFyZToKCiAqIElu
IHRoZSBtcy1xdWV1ZWRhZW1vbiBwcm90b2NvbCwgISBpcyB1c2VkIHRvIGluZGljYXRlIGFuCiAg
IHVuc29saWNpdGVkIHJlc3BvbnNlLgoKICogSW4gc2ctcnVuLWpvYiwgISBpbiBhbiBJRkZBSUwg
bWVhbnMgdG8gcnVuIGEgc3RlcCBldmVuIGlmCiAgIHRoZSBqb2IgaGFzIGZhaWxlZCBvciBpcyBi
ZWluZyB0cnVuY2F0ZWQuCgpUaGVzZSBnbyBub3doZXJlIG5lYXIgYSBzaGVsbCBhbmQgYXJlIG5v
dCwgY29uY2VwdHVhbGx5LCBuZWdhdGlvbi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
