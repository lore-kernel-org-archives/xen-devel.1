From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/altp2m: Fix style errors introduced
 with c/s 9abcac7ff
Date: Tue, 28 May 2019 21:43:47 -0700
Message-ID: <46e48714-74de-0222-84d3-8f844514710a@citrix.com>
References: <1559103784-23731-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PiYs=T5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hVqRS-0000bo-Qo
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 04:43:58 +0000
In-Reply-To: <1559103784-23731-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDUvMjAxOSAwNToyMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEcm9wIGludHJvZHVj
ZWQgdHJhaWxpbmcgd2hpdGVzcGFjZSwgZXhjZXNzaXZlbHkgbG9uZyBsaW5lcywgbWFsLWluZGVu
dGlvbiwKPiBzdXBlcmZsdW91cyB1c2Ugb2YgUFJJIG1hY3JvcyBmb3IgaW50LW9yLXNtYWxsZXIg
dHlwZXMsIGFuZCBpbmNvcnJlY3QgUFJJCj4gbWFjcm9zIGZvciBnZm5zIGFuZCBtZm5zLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
PiAtLS0KPiBDQzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgo+
IENDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBbmQgY2FuIEkgdGFrZSB0
aGlzIG9wcG9ydHVuaXR5IHRvIHJlbWluZCBhbGwgY29tbWl0dGVycyB0aGF0IGBnaXQgZGlmZgot
LWNoZWNrYCBleGlzdHMgYW5kIHRvIHBsZWFzZSBtYWtlIHN1cmUgaXQgaXMgdXNlZCBhcyBwYXJ0
IG9mIHByZS1wdXNoCmNoZWNrcy4KCldoZW4gdXNlZCBhZ2FpbnN0IGMucyA5YWJjYWM3ZmYsIGl0
IGlkZW50aWZpZXM6CgphbmRyZXdAYW5kcmV3LWxhcHRvcDp+L3hlbi5naXQveGVuJCBnaXQgZGlm
ZiAtLWNoZWNrIDlhYmNhYzdmZl4KeGVuL2FyY2gveDg2L2h2bS9odm0uYzoxNzY4OiB0cmFpbGlu
ZyB3aGl0ZXNwYWNlLgorwqDCoMKgwqDCoMKgwqAgLyoKeGVuL2FyY2gveDg2L21tL3AybS5jOjI0
NDM6IHRyYWlsaW5nIHdoaXRlc3BhY2UuCivCoMKgwqAKeGVuL2FyY2gveDg2L21tL3AybS5jOjI0
ODE6IHRyYWlsaW5nIHdoaXRlc3BhY2UuCivCoMKgwqAKYW5kcmV3QGFuZHJldy1sYXB0b3A6fi94
ZW4uZ2l0L3hlbiQgZWNobyAkPwoyCgooYW5kIGFsc28gc3BvdHMgdGhlIGludHJvZHVjdGlvbiBv
ZiBjb25mbGljdCBtYXJrZXJzLCBhbHRob3VnaCB0aGVyZQphcHBlYXIgdG8gYmUgbm8gaW5jaWRl
bnRzIG9mIHRoaXMgbWlzdGFrZSBpbiBYZW4ncyBoaXN0b3J5LikKCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
