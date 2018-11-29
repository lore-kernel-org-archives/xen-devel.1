From: Hans van Kranenburg <hans@knorrie.org>
Subject: Linux 4.19.5 fails to boot as Xen dom0
Date: Thu, 29 Nov 2018 02:22:16 +0100
Message-ID: <a9a32e52-f50f-7d1a-ade0-baa2348ad78a@knorrie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VHWl=OI=knorrie.org=hans@srs-us1.protection.inumbo.net>)
 id 1gSB23-0001m9-Dt
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 01:22:19 +0000
Received: from [IPv6:2001:980:4a41:fb::12] (unknown
 [IPv6:2001:980:4a41:fb::12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by syrinx.knorrie.org (Postfix) with ESMTPSA id 65AB82F8F6B23
 for <xen-devel@lists.xenproject.org>; Thu, 29 Nov 2018 02:22:16 +0100 (CET)
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

SGksCgpBcyBhbHNvIHNlZW4gYXQ6Cmh0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2NnaS1iaW4vYnVn
cmVwb3J0LmNnaT9idWc9OTE0OTUxCgpBdHRhY2hlZCB0aGVyZSBhcmUgdHdvIHNlcmlhbCBjb25z
b2xlIG91dHB1dCBsb2dzLiBPbmUgaXMgc3RhcnRpbmcgd2l0aApYZW4gNC4xMSAoZnJvbSBkZWJp
YW4gdW5zdGFibGUpIGFzIGRvbTAsIGFuZCB0aGUgb3RoZXIgb25lIHdpdGhvdXQgWGVuLgoKWyAg
ICAyLjA4NTU0M10gQlVHOiB1bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBh
dApmZmZmODg4ZDlmZmZjMDAwClsgICAgMi4wODU2MTBdIFBHRCAyMDBjMDY3IFA0RCAyMDBjMDY3
IFBVRCAwClsgICAgMi4wODU2NzRdIE9vcHM6IDAwMDAgWyMxXSBTTVAgTk9QVEkKWyAgICAyLjA4
NTczNl0gQ1BVOiAxIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQKNC4xOS4wLXRy
dW5rLWFtZDY0ICMxIERlYmlhbiA0LjE5LjUtMX5leHAxK3B2aDEKWyAgICAyLjA4NTgyM10gSGFy
ZHdhcmUgbmFtZTogSFAgUHJvTGlhbnQgREwzNjAgRzcsIEJJT1MgUDY4IDA1LzIxLzIwMTgKWyAg
ICAyLjA4NTg5NV0gUklQOiBlMDMwOnB0ZHVtcF93YWxrX3BnZF9sZXZlbF9jb3JlKzB4MWZkLzB4
NDkwClsuLi5dCgpUaGUgcHRpPW9mZiBzZXR0aW5nIG9uIHRoZSBQViBkb20wIGtlcm5lbCBpcyBs
ZWZ0IGJlaGluZCBmcm9tIHRoZSB0aW1lCndoZW4gNC45IGZhaWxlZCB0byBib290IGFzIFhlbiBk
b20wIGJlY2F1c2Ugb2YgdGhlIGJ1ZyBoYW5kbGluZyB0aGF0LgoKSGFucwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
