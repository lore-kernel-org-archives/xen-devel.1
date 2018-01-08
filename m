From: Hans van Kranenburg <hans@knorrie.org>
Subject: debian bugs: kaiser patch break pvh v1
Date: Mon, 8 Jan 2018 01:40:54 +0100
Message-ID: <b0556a46-801a-9826-6ffc-8137dd0f0b06@knorrie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wnem=ed=knorrie.org=hans@srs-us1.protection.inumbo.net>)
 id 1eYLUt-0000VL-90
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 00:41:03 +0000
Received: from [IPv6:2001:980:4a41:fb::12] (unknown
 [IPv6:2001:980:4a41:fb::12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by syrinx.knorrie.org (Postfix) with ESMTPSA id D219CAFF928D
 for <xen-devel@lists.xenproject.org>; Mon,  8 Jan 2018 01:40:54 +0100 (CET)
Content-Language: en_US
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

SGksCgpBdCBkZWJpYW4sIHdlIGhhdmUgcmVwb3J0cyBvZiB1c2VycyB0aGF0IHdlcmUgYXBwYXJl
bnRseSB1c2luZyBQVkggdjEKd2l0aCBYZW4gNC44IGFuZCBMaW51eCA0LjkuIEFmdGVyIHRoZSBk
ZWJpYW4ga2VybmVsIHRlYW0gaW5jbHVkZWQgdGhlCm1lbHRkb3duIHBhdGNoZXMsIFBWSCB2MSBi
cmVha3M6CgpodHRwczovL2J1Z3MuZGViaWFuLm9yZy9jZ2ktYmluL2J1Z3JlcG9ydC5jZ2k/YnVn
PTg4NjU5MQoKU28sIG15IHF1ZXN0aW9ucyBhcmU6CgoxLiBTaG91bGQgd2UganVzdCBnZW50bHkg
dGVsbCB0aGUgdXNlcnMgdGhhdCB0aGV5IHdlcmUgbm90IHN1cHBvc2VkIHRvCmRvIHRoYXQgaW4g
dGhlIGZpcnN0IHBsYWNlLCBhbmQgdGVsbCB0aGVtIHRvIGxvb2sgZm9yIGFsdGVybmF0aXZlcz8K
CjIuIFdlbGwsIG5vdCByZWFsbHkgYSBxdWVzdGlvbiwganVzdCBhIGhlYWRzLXVwLCBtYXliZSB0
aGVyZSdzIHNvbWV0aGluZwppbiBoZXJlIHRoYXQgeW91IGZpbmQgaW50ZXJlc3RpbmcgdG8gbG9v
ayBpbnRvLiBJIGhhdmUgbm8gaWRlYSBpZiBlLmcuCnRoZSB0aGluZyBjYW4gYmUgcmVsYXRlZCB0
byBhbnkgcHJvYmxlbSBpbiA0LjE0IG9yIG5ld2VyLgoKUmVnYXJkcywKSGFucyB2YW4gS3JhbmVu
YnVyZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
