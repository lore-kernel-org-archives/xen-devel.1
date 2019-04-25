From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Thu, 25 Apr 2019 05:14:42 -0600
Message-ID: <5CC196A20200007800229009@prv1-mh.provo.novell.com>
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
 <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
 <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJcL2-0003PM-Qm
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 11:14:48 +0000
In-Reply-To: <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA0LjE5IGF0IDE5OjUxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
U2ltcGx5IGNoYW5naW5nIHRvIGdldF9wYWdlIHdpdGggZG9tX2NvdyBpcyBub3QgZW5vdWdoLCBJ
IHJhbiBpbnRvCj4gaXNzdWVzIHdoZXJlIHRoZSBzeXN0ZW0gc3RpbGwgZGVhZGxvY2tzIGR1ZSB0
byB0aGUgb3JkZXJpbmcgb2YKPiBwdXRfcGFnZV9hbmRfdHlwZSBiZWluZyBjYWxsZWQgYmVmb3Jl
IG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrLiBTbyB0aGUKPiBvcmRlcmluZyBzdGlsbCBoYXMgdG8g
YmUgY2hhbmdlZC4KCkRlYWQgbG9ja3MgYmVjYXVzZSBvZiB0aGUgb3JkZXJpbmcgb2YgcmVsZWFz
ZXMgKG9yIGxvY2tzIG9yIGFsaWtlKSwKbm90IGFjcXVpcmVzPyBUaGF0IGxvb2tzIHN1c3BpY2lv
dXMgdG8gbWUsIGkuZS4gc3VnZ2VzdHMgeWV0CmFub3RoZXIgcHJvYmxlbSBlbHNld2hlcmUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
