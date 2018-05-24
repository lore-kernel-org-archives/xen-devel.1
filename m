From: Artem Mygaiev <artem_mygaiev@epam.com>
Subject: [PATCH v2] arm: clean-up: correct find_*_bit()
 functions use
Date: Thu, 24 May 2018 18:24:25 +0300
Message-ID: <07610208-7c29-f8b4-3146-6bd36a994d33@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g4nx=il=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1fLs6Y-0003Z7-MR
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 15:24:38 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

dmdpY192Y3B1X3BlbmRpbmdfaXJxKCkgdXNlcyBmaW5kX25leHRfYml0KCkgbGlicmFyeSBmdW5j
dGlvbiB3aXRoIApzaW5nbGUgJ3Vuc2lnbmVkIGxvbmcnIHZhcmlhYmxlLCB3aGlsZSBpdCBpcyBk
ZXNpZ25lZCB0byB3b3JrIHdpdGggCm1lbW9yeSByZWdpb25zIGFuZCBvZmZzZXRzLiBJdCB3b3Vs
ZCBiZSBtb3JlIGNvcnJlY3QgdG8gdXNlIHRoZSAKZmluZF9maXJzdF9iaXQoKSBmdW5jdGlvbiBp
bnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogQXJ0ZW0gTXlnYWlldiA8YXJ0ZW1fbXlnYWlldkBlcGFt
LmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyBiL3hlbi9hcmNoL2Fy
bS9naWMtdmdpYy5jCmluZGV4IGQ4MzFiMzU1MjUuLmZkNjM5MDZlOWIgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL2FybS9naWMtdmdpYy5jCisrKyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCkBAIC0z
NjIsNyArMzYyLDcgQEAgaW50IHZnaWNfdmNwdV9wZW5kaW5nX2lycShzdHJ1Y3QgdmNwdSAqdikK
ICAgICAgQVNTRVJUKHYgPT0gY3VycmVudCk7CgogICAgICBtYXNrX3ByaW9yaXR5ID0gZ2ljX2h3
X29wcy0+cmVhZF92bWNyX3ByaW9yaXR5KCk7Ci0gICAgYWN0aXZlX3ByaW9yaXR5ID0gZmluZF9u
ZXh0X2JpdCgmYXByLCAzMiwgMCk7CisgICAgYWN0aXZlX3ByaW9yaXR5ID0gZmluZF9maXJzdF9i
aXQoJmFwciwgMzIpOwoKICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnYtPmFyY2gudmdpYy5sb2Nr
LCBmbGFncyk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
