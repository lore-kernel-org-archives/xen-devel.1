From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/3] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
Date: Fri, 17 May 2019 09:46:29 +0100
Message-ID: <b3621bcf-89d0-22a0-2416-4cf5a341d13a@arm.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-2-alistair.francis@wdc.com>
 <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
 <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i9tk=TR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hRYVe-0003U0-AK
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 08:46:34 +0000
In-Reply-To: <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alistair Francis <alistair23@gmail.com>, Jan Beulich <JBeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNi8wNS8yMDE5IDIwOjMwLCBBbGlzdGFpciBGcmFuY2lzIHdyb3RlOgo+IE9uIFRodSwg
TWF5IDE2LCAyMDE5IGF0IDM6MzIgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3
cm90ZToKPj4KPj4+Pj4gT24gMTYuMDUuMTkgYXQgMDI6MDIsIDxhbGlzdGFpci5mcmFuY2lzQHdk
Yy5jb20+IHdyb3RlOgo+Pj4gTWFrZSB0aGUgYXNtL3ZwbDAxMS5oIGRlcGVuZGVudCBvbiB0aGUg
QVJNIGFyY2hpdGVjdHVyZS4KPj4KPj4gQnV0IHdlIG9ubHkgaGF2ZSB4ODYgYW5kIEFybSByaWdo
dCBub3cuIEEgd29yZCBtb3JlIGFib3V0Cj4+IHlvdXIgbW90aXZhdGlvbiB3b3VsZCBoZWxwLgo+
IAo+IEFzIHRoZSBjb2RlIGN1cnJlbnRseSBpcyBubyBvbmUgY2FuIGFkZCBhbm90aGVyIGFyY2hp
dGVjdHVyZS4gVGhpcyBpcwo+IGp1c3QgYSBnZW5lcmFsIGZpeHVwIGFzIGFzc3VtaW5nIFhlbiB3
aWxsIG9ubHkgZXZlciBzdXBwb3J0IHR3byBhcmNocwo+IHNlZW1zIHN0cmFuZ2UuCgpBdCB3aGlj
aCBwb2ludCwgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGF2b2lkICNpZmRlZiBBUkNIIGluIGNv
bW1vbiBjb2RlPyAKSW5zdGVhZCwgd2UgY291bGQgcHJvdmlkZSBhcmNoIGhlbHBlciBhbmQvb3Ig
bW9yZSBtZWFuaW5nIENPTkZJRyBuYW1lLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
