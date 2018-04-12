From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/xen: zero MSR_IA32_SPEC_CTRL before
 suspend
Date: Thu, 12 Apr 2018 01:53:52 -0600
Message-ID: <5ACF2CB002000078001BA984__36490.8224474222$1523519570$gmane$org@prv1-mh.provo.novell.com>
References: <20180226140818.4849-1-jgross@suse.com>
 <5AA8F00302000078001B15EE@suse.com>
 <6b59ac31-7e90-1c18-2467-d7d294da6e5b@suse.com>
 <5ACDEE5B02000078001BA2DE@prv1-mh.provo.novell.com>
 <20180411115350.lvx5yaevoq6arwg3@gmail.com>
 <5ACE149E02000078001BA424@prv1-mh.provo.novell.com>
 <20180412073219.2h5fqc7megvepoa6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9+ld=hb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f6X3M-0008HE-Pf
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 07:53:56 +0000
In-Reply-To: <20180412073219.2h5fqc7megvepoa6@gmail.com>
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

Pj4+IE9uIDEyLjA0LjE4IGF0IDA5OjMyLCA8bWluZ29Aa2VybmVsLm9yZz4gd3JvdGU6Cgo+ICog
SmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiAKPj4gPj4+IE9uIDExLjA0
LjE4IGF0IDEzOjUzLCA8bWluZ29Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gKiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+PiA+IAo+PiA+PiBBZGRpdGlvbmFsbHksIHg4
NiBtYWludGFpbmVyczogaXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbiB0aGlzIChvcgo+PiA+
PiBhbnkgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQgcGF0Y2gpIGlzbid0IHVwc3RyZWFtIHlldD8g
QXMgaW5kaWNhdGVkCj4+ID4+IGJlZm9yZSwgSSBoYWQgbm90IGJlZW4gYWJsZSB0byBmaW5kIGFu
eSBkaXNjdXNzaW9uLCBhbmQgaGVuY2UgSQo+PiA+PiBzZWUgbm8gcmVhc29uIHdoeSB0aGlzIGlz
IGEgcGF0Y2ggd2UgZWZmZWN0aXZlbHkgY2FycnkgcHJpdmF0ZWx5IGluCj4+ID4+IG91ciBkaXN0
cm8gYnJhbmNoZXMgKGFuZCBsaWtlbHkgb3RoZXIgZGlzdHJvcyBkbyBzbyB0b28pLgo+PiA+IAo+
PiA+IFRoZSBwYXRjaCB3YXMgbWVyZ2VkIDYgd2Vla3MgYWdvIGFuZCBpcyBub3cgdXBzdHJlYW06
Cj4+ID4gCj4+ID4gICA3MWMyMDhkZDU0YWI6IHg4Ni94ZW46IFplcm8gTVNSX0lBMzJfU1BFQ19D
VFJMIGJlZm9yZSBzdXNwZW5kCj4+IAo+PiBJJ20gc29ycnksIGJ1dCBubywgdGhpcyBpc24ndCB0
aGUgcGF0Y2ggSSB3YXMgaW5xdWlyaW5nIGFib3V0Lgo+PiBJbnN0ZWFkIEknbSB3b25kZXJpbmcg
b2YgdGhlIGRpc3Bvc2l0aW9uIG9mIHRoZSBwYXRjaCBkaXNhYmxpbmcKPj4gSUJSUyBhcm91bmQg
YSBDUFUgZ29pbmcgaWRsZS4KPiAKPiBHb3QgYW55IHNwZWNpZmljIGxpbmsgb3Igc3ViamVjdCBs
aW5lIGZvciB0aGF0IHN1Ym1pc3Npb24/CgpTdXJlLCBhcyB3cml0dGVuIGluIHRoZSBvcmlnaW5h
bCByZXNwb25zZSB0byBKw7xyZ2VuJ3MgcGF0Y2g6Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTAxNTM4NDMvCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
