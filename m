From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] x86/xen: zero MSR_IA32_SPEC_CTRL before
 suspend
Date: Thu, 12 Apr 2018 09:32:19 +0200
Message-ID: <20180412073219.2h5fqc7megvepoa6__29541.849208954$1523518266$gmane$org@gmail.com>
References: <20180226140818.4849-1-jgross@suse.com>
 <5AA8F00302000078001B15EE@suse.com>
 <6b59ac31-7e90-1c18-2467-d7d294da6e5b@suse.com>
 <5ACDEE5B02000078001BA2DE@prv1-mh.provo.novell.com>
 <20180411115350.lvx5yaevoq6arwg3@gmail.com>
 <5ACE149E02000078001BA424@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gjam=hb=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1f6WiX-0005PO-3h
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 07:32:25 +0000
Received: by mail-wr0-x242.google.com with SMTP id l13so3007124wrb.5
 for <xen-devel@lists.xenproject.org>; Thu, 12 Apr 2018 00:32:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5ACE149E02000078001BA424@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

CiogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKCj4gPj4+IE9uIDExLjA0
LjE4IGF0IDEzOjUzLCA8bWluZ29Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAqIEphbiBCZXVsaWNo
IDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPiAKPiA+PiBBZGRpdGlvbmFsbHksIHg4NiBt
YWludGFpbmVyczogaXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbiB0aGlzIChvcgo+ID4+IGFu
eSBmdW5jdGlvbmFsbHkgZXF1aXZhbGVudCBwYXRjaCkgaXNuJ3QgdXBzdHJlYW0geWV0PyBBcyBp
bmRpY2F0ZWQKPiA+PiBiZWZvcmUsIEkgaGFkIG5vdCBiZWVuIGFibGUgdG8gZmluZCBhbnkgZGlz
Y3Vzc2lvbiwgYW5kIGhlbmNlIEkKPiA+PiBzZWUgbm8gcmVhc29uIHdoeSB0aGlzIGlzIGEgcGF0
Y2ggd2UgZWZmZWN0aXZlbHkgY2FycnkgcHJpdmF0ZWx5IGluCj4gPj4gb3VyIGRpc3RybyBicmFu
Y2hlcyAoYW5kIGxpa2VseSBvdGhlciBkaXN0cm9zIGRvIHNvIHRvbykuCj4gPiAKPiA+IFRoZSBw
YXRjaCB3YXMgbWVyZ2VkIDYgd2Vla3MgYWdvIGFuZCBpcyBub3cgdXBzdHJlYW06Cj4gPiAKPiA+
ICAgNzFjMjA4ZGQ1NGFiOiB4ODYveGVuOiBaZXJvIE1TUl9JQTMyX1NQRUNfQ1RSTCBiZWZvcmUg
c3VzcGVuZAo+IAo+IEknbSBzb3JyeSwgYnV0IG5vLCB0aGlzIGlzbid0IHRoZSBwYXRjaCBJIHdh
cyBpbnF1aXJpbmcgYWJvdXQuCj4gSW5zdGVhZCBJJ20gd29uZGVyaW5nIG9mIHRoZSBkaXNwb3Np
dGlvbiBvZiB0aGUgcGF0Y2ggZGlzYWJsaW5nCj4gSUJSUyBhcm91bmQgYSBDUFUgZ29pbmcgaWRs
ZS4KCkdvdCBhbnkgc3BlY2lmaWMgbGluayBvciBzdWJqZWN0IGxpbmUgZm9yIHRoYXQgc3VibWlz
c2lvbj8KClRoYW5rcywKCglJbmdvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
