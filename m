From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: correctly set nonlazy_xstate_used when
 loading full state
Date: Tue, 26 Jun 2018 02:11:32 -0600
Message-ID: <5B31F53402000078001CDDC7@prv1-mh.provo.novell.com>
References: <5B31EF8002000078001CDD83@prv1-mh.provo.novell.com>
 <20180626075701.ekl3sifuwvre7mib@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x7n8=jm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXj4c-00011Z-4x
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 08:11:38 +0000
In-Reply-To: <20180626075701.ekl3sifuwvre7mib@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA2LjE4IGF0IDA5OjU3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKdW4gMjYsIDIwMTggYXQgMDE6NDc6MTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEluIHRoaXMgY2FzZSwganVzdCBsaWtlIHhjcjBfYWNjdW0sIG5vbmxhenlfeHN0YXRl
X3VzZWQgc2hvdWxkIGFsd2F5cyBiZQo+PiBzZXQgdG8gdGhlIGludGVuZGVkIG5ldyB2YWx1ZSwg
cmF0aGVyIHRoYW4gcG9zc2libHkgbGVhdmluZyB0aGUgZmxhZyBzZXQKPj4gZnJvbSBhIHByaW9y
IHN0YXRlIGxvYWQuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gCj4gV2h5PyBMb29raW5nIGF0IHRoZSBjb2RlIGl0IGlzIGluIGZhY3QgdXNl
ZCBhcyBhIGJvb2xlYW4uCgpJdHMgYm9vbGVhbiBuYXR1cmUgaXMgaXJyZWxldmFudC4gVGhlIHF1
ZXN0aW9uIGlzIHdoZXRoZXIgZnVsbHkgbmV3IHN0YXRlCmlzIGxvYWRlZCAoaW4gd2hpY2ggY2Fz
ZSB0aGUgZmxhZyBzaG91bGQgYmUgc2V0IGFjY29yZGluZyB0byB0aGlzIHN0YXRlLAp3aXRob3V0
IHJlZ2FyZCB0byB0aGUgcHJpb3IgdmFsdWUgb2YgdGhlIGZsYWcpIHZzIC4uLgoKPiBBbHNvIHlv
dSBzZWVtIHRvIGhhdmUgbWlzc2VkIGh2bS9zdm0vc3ZtLmMgYW5kIHhzdGF0ZS5jPwoKLi4uIGV4
aXN0aW5nIHN0YXRlIGJlaW5nIHVwZGF0ZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
