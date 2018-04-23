From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 01/10] passthrough: rearrange x86 code
Date: Mon, 23 Apr 2018 09:27:12 -0600
Message-ID: <5ADDFB5002000078001BDA10@prv1-mh.provo.novell.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <20180221214701.1646-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jo30=hm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fAdN9-00028v-Qp
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 15:27:19 +0000
In-Reply-To: <20180221214701.1646-2-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDIyOjQ2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
Q2xlYW4gdXAgdGhlIGhpZXJhcmNoeSBvZiB0aGUgZGlyZWN0b3J5OiBwdXQgdnRkLCBhbWQgYW5k
IGlvLmMgdW5kZXIKPiB4ODYuIEFkanVzdCBtYWtlZmlsZSBhbmQgTUFJTlRBSU5FUlMuCgpDb25z
aWRlcmluZyB0aGUgaGlzdG9yeSBpbiBwYXJ0aWN1bGFyIG9mIFZULWQsIEknbSBub3QgY29udmlu
Y2VkIG9mIHRoaXMgbW92ZToKeDg2IGFuZCBpYTY0IGRpZCBzaGFyZSB0aGUgYnVsayBvZiB0aGUg
VlQtZCBjb2RlIGJhY2sgd2hlbiBpYTY0IHdhcyBzdGlsbCBpbgp0aGUgdHJlZS4gQXJndWFibHkg
dGhlIEFNRCBJT01NVSBpcyBsZXNzIGxpa2VseSB0byBiZSBsZXZlcmFnZWQgZm9yIHNvbWUKbm9u
LXg4NiBhcmNoaXRlY3R1cmUsIGJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJldHRlciBzdGF5IHRoZSB3
YXkgaXQgaXMgYXMgd2VsbC4KCkFzIHRvIGlvLmMgLSBpdCdzIG5vdCBjdXJyZW50bHkgbmVlZGVk
IGJ5IEFSTSwgYnV0IHRoZXJlIGRvZXNuJ3QgbG9vayB0byBiZQp0aGF0IG1hbnkgeDg2LXNwZWNp
ZmljIGNvZGUgaW4gdGhlcmUuIEkgd291bGQgcHJlZmVyIGlmIHRoZSBBUk0gZm9sa3MgY291bGQK
anVkZ2Ugd2hldGhlciB0aGF0J3MgY29kZSB0aGV5J3JlIG5ldmVyIGdvaW5nIHRvIHVzZSwgaW4g
d2hpY2ggY2FzZSBtb3ZpbmcKaXQgdG8geDg2LyB3b3VsZCBiZSBmaW5lIHdpdGggbWUuCgpXaGF0
IEkgZG9uJ3QgdW5kZXJzdGFuZCBoZXJlIGF0IGFsbCBpcyBob3cgdGhpcyBtb3ZlbWVudCBvZiBj
b2RlIHJlbGF0ZXMKdG8gdGhlIFBWL0hWTSBzcGxpdHRpbmcuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
