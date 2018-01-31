From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shim: don't use 32-bit compare on
 boolean variable
Date: Wed, 31 Jan 2018 15:36:41 +0000
Message-ID: <cbb6095a-491f-6355-f72d-700ebd28b695@citrix.com>
References: <5A71EFEA02000078001A40E6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=u0th=e2=citrix.com=prvs=562673196=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1egubU-0006NK-7u
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 15:47:16 +0000
In-Reply-To: <5A71EFEA02000078001A40E6@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDEvMTggMTU6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEN1cnJlbnQgdXBzdHJlYW0g
Z2FzIHNpbGVudGx5IGFzc3VtZXMgMzItYml0IG9wZXJhbmQgc2l6ZSBmb3IgbW9zdAo+IG9wZXJh
dGlvbnMgd2hlcmUgdGhlIHNpemUgY2FuJ3QgYmUgaW5mZXJyZWQgZnJvbSBhbiBpbnZvbHZlZCBy
ZWdpc3Rlcgo+IChteSBvd24gb25lIGRvZXNuJ3QgYW55bW9yZSwgd2hpY2ggaXMgaG93IEkndmUg
bm90aWNlZCB0aGlzKS4gSXQgaXMgcHVyZQo+IGx1Y2sgdGhhdCB0aGUgMyBieXRlcyBmb2xsb3dp
bmcgcHZoX2Jvb3QgYXJlIGN1cnJlbnRseSBwYWRkaW5nIG9uZXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlckBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
