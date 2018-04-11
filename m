From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/xen: zero MSR_IA32_SPEC_CTRL before
 suspend
Date: Wed, 11 Apr 2018 05:58:54 -0600
Message-ID: <5ACE149E02000078001BA424__22586.3159321763$1523447867$gmane$org@prv1-mh.provo.novell.com>
References: <20180226140818.4849-1-jgross@suse.com>
 <5AA8F00302000078001B15EE@suse.com>
 <6b59ac31-7e90-1c18-2467-d7d294da6e5b@suse.com>
 <5ACDEE5B02000078001BA2DE@prv1-mh.provo.novell.com>
 <20180411115350.lvx5yaevoq6arwg3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mmvf=ha=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f6EOy-00062D-Kd
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 11:59:00 +0000
In-Reply-To: <20180411115350.lvx5yaevoq6arwg3@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA0LjE4IGF0IDEzOjUzLCA8bWluZ29Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gKiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IAo+PiBBZGRpdGlvbmFsbHks
IHg4NiBtYWludGFpbmVyczogaXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbiB0aGlzIChvcgo+
PiBhbnkgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQgcGF0Y2gpIGlzbid0IHVwc3RyZWFtIHlldD8g
QXMgaW5kaWNhdGVkCj4+IGJlZm9yZSwgSSBoYWQgbm90IGJlZW4gYWJsZSB0byBmaW5kIGFueSBk
aXNjdXNzaW9uLCBhbmQgaGVuY2UgSQo+PiBzZWUgbm8gcmVhc29uIHdoeSB0aGlzIGlzIGEgcGF0
Y2ggd2UgZWZmZWN0aXZlbHkgY2FycnkgcHJpdmF0ZWx5IGluCj4+IG91ciBkaXN0cm8gYnJhbmNo
ZXMgKGFuZCBsaWtlbHkgb3RoZXIgZGlzdHJvcyBkbyBzbyB0b28pLgo+IAo+IFRoZSBwYXRjaCB3
YXMgbWVyZ2VkIDYgd2Vla3MgYWdvIGFuZCBpcyBub3cgdXBzdHJlYW06Cj4gCj4gICA3MWMyMDhk
ZDU0YWI6IHg4Ni94ZW46IFplcm8gTVNSX0lBMzJfU1BFQ19DVFJMIGJlZm9yZSBzdXNwZW5kCgpJ
J20gc29ycnksIGJ1dCBubywgdGhpcyBpc24ndCB0aGUgcGF0Y2ggSSB3YXMgaW5xdWlyaW5nIGFi
b3V0LgpJbnN0ZWFkIEknbSB3b25kZXJpbmcgb2YgdGhlIGRpc3Bvc2l0aW9uIG9mIHRoZSBwYXRj
aCBkaXNhYmxpbmcKSUJSUyBhcm91bmQgYSBDUFUgZ29pbmcgaWRsZS4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
