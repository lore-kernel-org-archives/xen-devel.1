From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.11 0/3] x86/pv: Fixes to debug register
 handling
Date: Thu, 12 Apr 2018 17:55:53 +0100
Message-ID: <1523552156-20866-1-git-send-email-andrew.cooper3@citrix.com>
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
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QXQgdGhpcyBwb2ludCwgSSB0aGluayB0aGVzZSBwYXRjaGVzIGFyZSBwbGF1c2libGUgY2FuZGlk
YXRlcyBmb3IgaW5jbHVzaW9uCmludG8gNC4xMS4gIFdoZXRoZXIgdGhleSB3YW50IGJhY2twb3J0
aW5nIGlzIGEgc2xpZ2h0bHkgaGFyZGVyIG1hdHRlciwgYXMKdGhlc2UgcGF0Y2hlcyBuZWNlc3Nl
cmlseSBhbHRlciBzb21lIGVycm9yIHZhbHVlcyBmb3IgdGhlIGdldC9zZXRfZGVidWdfcmVnKCkK
aHlwZXJjYWxscy4KCklmIGhvd2V2ZXIgdGhlcmUgaXMgb2JqZWN0aW9uIHRvIHRoZXNlIGdvaW5n
IGludG8gNC4xMSwgdGhleSBjYW4gc2l0IGluCng4Ni1uZXh0IHVudGlsIHRoZSA0LjEyIHdpbmRv
dyBvcGVucy4KCkFuZHJldyBDb29wZXIgKDMpOgogIHg4Ni9wdjogSW50cm9kdWNlIGFuZCB1c2Ug
eDg2ZW11bF9yZWFkX2RyKCkKICB4ODYvcHY6IEludHJvZHVjZSBhbmQgdXNlIHg4NmVtdWxfd3Jp
dGVfZHIoKQogIHg4Ni90cmFwczogTWlzYyBub24tZnVuY3Rpb25hbCBpbXByb3ZlbWVudHMgdG8g
c2V0X2RlYnVncmVnKCkKCiB4ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmMgICAgICAgICB8
IDI0ICstLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvcHYvbWlzYy1oeXBlcmNhbGxzLmMgICAgICB8
IDE4ICsrLS0tLS0tLQogeGVuL2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgICAgICAgICAgfCA2
NyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYveDg2X2VtdWxh
dGUuYyAgICAgICAgICAgICB8IDczICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IHhlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5oIHwgIDUgKysrCiA1IGZpbGVz
IGNoYW5nZWQsIDEyNyBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
