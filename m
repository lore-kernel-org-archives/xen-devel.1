From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 4/6] x86emul: clean up AVX2 insn use in
 test harness
Date: Mon, 3 Sep 2018 19:04:07 +0100
Message-ID: <a0041903-5604-b9ef-f11a-b287dcc59d37@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5B86AB9002000078001E31E3@prv1-mh.provo.novell.com>
 <5B86ACB602000078001E31F6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wisl=lr=citrix.com=prvs=7772440c6=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fwtCs-0007iu-Vd
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 18:04:11 +0000
In-Reply-To: <5B86ACB602000078001E31F6@prv1-mh.provo.novell.com>
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

T24gMjkvMDgvMTggMTU6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IERyb3AgdGhlIHByZXR0eSBw
b2ludGxlc3MgY29uZGl0aW9uYWxzIGZyb20gY29kZSB0ZXN0aW5nIEFWWCBpbnNucyBhbmQKPiBw
cm9wZXJseSB1c2UgQVZYMiBtbmVtb25pY3MgaW4gY29kZSB0ZXN0aW5nIEFWWDIgaW5zbnMgKHRo
ZSB0ZXN0IGhhcm5lc3MKPiBpcyBhbHJlYWR5IHJlcXVpcmluZyBzdWZmaWNpZW50bHkgbmV3IGEg
Y29tcGlsZXIvYXNzZW1ibGVyKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
