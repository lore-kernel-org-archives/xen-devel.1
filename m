From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Subject: Re: Xen commit 9b0bc91b3 possibly removed too much info
 from README
Date: Sat, 13 Apr 2019 11:17:48 +0800
Message-ID: <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WTA6=SP=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hF9B3-00049h-JS
 for xen-devel@lists.xenproject.org; Sat, 13 Apr 2019 03:18:01 +0000
Received: by mail-wm1-x344.google.com with SMTP id y197so1361555wmd.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 20:18:00 -0700 (PDT)
In-Reply-To: <20190411102843.GE30543@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxMSBBcHIgMjAxOSBhdCAxODoyOSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4gd3JvdGU6Cj4KPiAuLi4KPiBTdXJlLiBJIHdpbGwgd3JpdGUgYSBwYXRjaC4KPgo+IFdlaS4K
CkNvdXBsZSBvZiBvdGhlciB0aGluZ3MgSSBub3RpY2VkIGFmdGVyIHBvc3RpbmcgdGhlIG9yaWdp
bmFsIG9ic2VydmF0aW9uLAp0aGF0IG1pZ2h0IGJlIG9mIHVzZSBpbiBwYXRjaGluZyB0aGUgZG9j
dW1lbnRhdGlvbgoKMSkKClRoZSB0b29scy9NYWtlZmlsZSBoYXMgYSBiYXJlIFBZVEhPTiBFbnZW
YXIgdGhhdCBpc24ndCBzZWVtaW5nbHkKcmVwbGFjZWQgYnkgdGhlIFBZVEhPTj0gdmFsdWUgc3Vw
cGxpZWQgdG8gY29uZmlndXJlLCBzbyBJIGFsc28KbmVlZGVkIHRvIHNwZWNpZnkgdGhlCgpQWVRI
T049L3BhdGgvdG8vaW50ZXJwcmV0ZXIKCmFzIGFuIGFyZ3VtZW50IHRvIHRoZSAibWFrZSB3b3Js
ZCIgYXMgd2VsbCBhcyB0byB0aGUgY29uZmlndXJlLgoKCjIpCgpJbiB0aGUgdG9wLWxldmVsIElO
U1RBTEwgZmlsZSwgd2UgcmVhZAoKLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8
LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0KU01CSU9TX1JFTF9E
QVRFPW1tL2RkL3l5eXkKVkdBQklPU19SRUxfREFURT0iZGQgTW9uIHl5eXkiCgpEdXJpbmcgdG9v
bHMgYnVpbGQgZXh0ZXJuYWwgcmVwb3Mgd2lsbCBiZSBjbG9uZWQgaW50byB0aGUgc291cmNlIHRy
ZWUuClRoaXMgdmFyaWFibGUgY2FuIGJlIHVzZWQgdG8gcG9pbnQgdG8gYSBkaWZmZXJlbnQgZ2l0
IGJpbmFyeSB0byBiZSB1c2VkLgpHSVQ9CgpEdXJpbmcgdG9vbHMgYnVpbGQgZXh0ZXJuYWwgcmVw
b3Mgd2lsbCBiZSBjbG9uZWQgaW50byB0aGUgc291cmNlIHRyZWUuCkR1cmluZyBzdHViZG9tIGJ1
aWxkIGV4dGVybmFsIHBhY2thZ2VzIHdpbGwgYmUgZG93bmxvYWRlZCBpbnRvIHRoZQpzb3VyY2Ug
dHJlZS4gVGhlc2UgdmFyaWFibGVzIGNhbiBiZSB1c2VkIHRvIHBvaW50IHRvIGEgZGlmZmVyZW50
CmxvY2F0aW9ucy4KWEVOX0VYVEZJTEVTX1VSTD0KT1ZNRl9VUFNUUkVBTV9VUkw9Ci0tLS04PC0t
LS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04
PC0tLS0tLS0tODwtLS0tCgpJcyB0aGF0IHNlY29uZAoKICAgRHVyaW5nIHRvb2xzIGJ1aWxkIGV4
dGVybmFsIHJlcG9zIHdpbGwgYmUgY2xvbmVkIGludG8gdGhlIHNvdXJjZSB0cmVlLgoKYWJvdmUg
dGhlCgogICBEdXJpbmcgc3R1YmRvbSBidWlsZAoKcmVxdWlyZWQgPwoKRldJVywgSSBub3RpY2Vk
ICgyKSAgYmVjYXVzZSBJIGRpZG4ndCBoYXZlIEdpdCBpbiBteSBMRlMgc3lzdGVtIGF0CnBvaW50
IHRoYXQgSSB3YXMgdHJ5aW5nIHRvIGJ1aWxkIFhlbiBpbnNpZGUgaXQuCgpLZXZpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
