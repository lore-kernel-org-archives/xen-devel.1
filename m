From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Guest Testing in OSSTEST - What distros and versions
 should we test against
Date: Thu, 9 May 2019 19:28:47 -0600
Message-ID: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0ItA=TK=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hOuLH-00047u-CN
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 01:28:55 +0000
Received: by mail-vs1-xe44.google.com with SMTP id q64so2665580vsd.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 18:28:54 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Committers <committers@xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKZm9sbG93aW5nIGEgZGlzY3Vzc2lvbiB3aXRoIGNvbW1pdHRlcnMgYWJvdXQgR3Vl
c3QgdGVzdGluZyBpbiBPU1NURVNULCBpdCBzdXJmYWNlZCB0aGF0IHdlIGhhdmUgbm90IHVwZGF0
ZWQgd2hhdCBkaXN0cm9zIHdlIHRlc3QgaW4gT1NTVEVTVCBmb3IgYSB2ZXJ5IGxvbmcgdGltZS4g
QWxsIGFncmVlZCB0aGF0IHdlIHNob3VsZCByZWd1bGFybHkgcmV2aWV3IHdoYXQgd2UgdGVzdCBh
Z2FpbnN0OiBtYXliZSBhdCB0aGUgYmVnaW5uaW5nIG9mIGEgcmVsZWFzZSBjeWNsZQoKSW4gYW55
IGNhc2UsIGN1cnJlbnRseSB3ZSB0ZXN0IGFnYWluc3QKCng4NiBIVk0gZ3Vlc3RzOgogIGRlYmlh
bi05LjQuMC17aTM4NixhbWQ2NH0tQ0QtMS5pc28KICByaGVsLXNlcnZlci02LjEtaTM4Ni1kdmQu
aXNvCiAgd2luMTB2MTcwMy14ODYuaXNvCiAgd2luNy14NjQuaXNvCiAgd3MxNi14NjQuaXNvCiAg
RnJlZUJTRC0xMC4xLUNVU1RPTS17aTM4NixhbWQ2NH0tMjAxNTA1MjUucmF3Lnh6CiAgRGViaWFu
IEhWTSB7aTM4NixhbWQ2NH0gdmlhIGRlYmlhbi1pbnN0YWxsZXIgbmV0aW5zdCBbMV0KCng4NiBQ
ViBndWVzdHM6CiAgRGViaWFuIFBWIHtpMzg2LGFtZDY0fSB2aWEgZGViaWFuLWluc3RhbGxlciBu
ZXRpbnN0IFsxXQoKQVJNIGd1ZXN0czoKICBEZWJpYW4gUFYgdmlhIGRlYmlhbi1pbnN0YWxsZXIg
bmV0aW5zdCBbMV0KClsxXSB3aGF0ZXZlciBEZWJpYW4gcmVsZWFzZSBvc3N0ZXN0IGl0c2VsZiBt
b3N0bHkgcnVucwoKU28gSSBhbSBvcGVuaW5nIHRoZSBmbG9vciB0byBzdWdnZXN0aW9ucy4KCldp
dGggcmVnYXJkcyB0byBXaW5kb3dzIHRlc3Rpbmcgd2UgaGF2ZSBzb21lIHJlc3RyaWN0aW9ucy4g
V2UgaGF2ZSB0cmllZCBzZXZlcmFsIHRpbWVzIHRvIGJ1eSBhZGRpdGlvbmFsIHRlc3QgbGljZW5z
ZXMsIGJ1dCB0aGlzIG5ldmVyIHdlbnQgYW55d2hlcmUgKHNvbWUgb2YgdGhlIFZNIGxpY2Vuc2Vz
IGFyZSBub3QgYXZhaWxhYmxlIGZvciBvdXIgZW52aXJvbm1lbnQsIHVubGVzcyB5b3UgYnVsayBi
dXksIHdoaWNoIGlzIHZlcnkgZXhwZW5zaXZlKS4gVGhlIG9ubHkgYXBwcm9hY2ggdGhhdCB3b3Vs
ZCBhbGxvdyB1cyB0byB0ZXN0IGFnYWluc3QgZGlmZmVyZW50IHdpbmRvd3MgdmVyc2lvbnMgd291
bGQgYmUgdG8gcmVxdWlyZSBldmVyeW9uZSB3aG8gbWF5IHRvdWNoIE9TU1RFU1Qgd2hpY2ggaXMg
bm90IGRvYWJsZS4KCkkgY2FuIGJyaW5nIHRoaXMgdXAgd2l0aCB0aGUgTVMgb3BlbiBzb3VyY2Ug
b2ZmaWNlLCBpZiB0aGVyZSBhcmUgc3Ryb25nIGZlZWxpbmdzIGFib3V0IHRoaXMgYW5kIHRyeSBh
Z2FpbgoKTGFycwoKICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
