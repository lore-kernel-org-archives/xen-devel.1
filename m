From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] x86/xen: zero MSR_IA32_SPEC_CTRL before
 suspend
Date: Thu, 12 Apr 2018 10:08:44 +0200
Message-ID: <20180412080844.mof7ukyeuhd3dsoq__9187.46178872443$1523520451$gmane$org@gmail.com>
References: <20180226140818.4849-1-jgross@suse.com>
 <5AA8F00302000078001B15EE@suse.com>
 <6b59ac31-7e90-1c18-2467-d7d294da6e5b@suse.com>
 <5ACDEE5B02000078001BA2DE@prv1-mh.provo.novell.com>
 <20180411115350.lvx5yaevoq6arwg3@gmail.com>
 <5ACE149E02000078001BA424@prv1-mh.provo.novell.com>
 <20180412073219.2h5fqc7megvepoa6@gmail.com>
 <5ACF2CB002000078001BA984@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gjam=hb=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1f6XHm-0001f4-4g
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 08:08:50 +0000
Received: by mail-wr0-x244.google.com with SMTP id c24so4152324wrc.6
 for <xen-devel@lists.xenproject.org>; Thu, 12 Apr 2018 01:08:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5ACF2CB002000078001BA984@prv1-mh.provo.novell.com>
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

CiogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKCj4gPj4+IE9uIDEyLjA0
LjE4IGF0IDA5OjMyLCA8bWluZ29Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4gPiAqIEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPiAKPiA+PiA+Pj4gT24gMTEuMDQuMTgg
YXQgMTM6NTMsIDxtaW5nb0BrZXJuZWwub3JnPiB3cm90ZToKPiA+PiA+ICogSmFuIEJldWxpY2gg
PEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+PiA+IAo+ID4+ID4+IEFkZGl0aW9uYWxseSwg
eDg2IG1haW50YWluZXJzOiBpcyB0aGVyZSBhIHBhcnRpY3VsYXIgcmVhc29uIHRoaXMgKG9yCj4g
Pj4gPj4gYW55IGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50IHBhdGNoKSBpc24ndCB1cHN0cmVhbSB5
ZXQ/IEFzIGluZGljYXRlZAo+ID4+ID4+IGJlZm9yZSwgSSBoYWQgbm90IGJlZW4gYWJsZSB0byBm
aW5kIGFueSBkaXNjdXNzaW9uLCBhbmQgaGVuY2UgSQo+ID4+ID4+IHNlZSBubyByZWFzb24gd2h5
IHRoaXMgaXMgYSBwYXRjaCB3ZSBlZmZlY3RpdmVseSBjYXJyeSBwcml2YXRlbHkgaW4KPiA+PiA+
PiBvdXIgZGlzdHJvIGJyYW5jaGVzIChhbmQgbGlrZWx5IG90aGVyIGRpc3Ryb3MgZG8gc28gdG9v
KS4KPiA+PiA+IAo+ID4+ID4gVGhlIHBhdGNoIHdhcyBtZXJnZWQgNiB3ZWVrcyBhZ28gYW5kIGlz
IG5vdyB1cHN0cmVhbToKPiA+PiA+IAo+ID4+ID4gICA3MWMyMDhkZDU0YWI6IHg4Ni94ZW46IFpl
cm8gTVNSX0lBMzJfU1BFQ19DVFJMIGJlZm9yZSBzdXNwZW5kCj4gPj4gCj4gPj4gSSdtIHNvcnJ5
LCBidXQgbm8sIHRoaXMgaXNuJ3QgdGhlIHBhdGNoIEkgd2FzIGlucXVpcmluZyBhYm91dC4KPiA+
PiBJbnN0ZWFkIEknbSB3b25kZXJpbmcgb2YgdGhlIGRpc3Bvc2l0aW9uIG9mIHRoZSBwYXRjaCBk
aXNhYmxpbmcKPiA+PiBJQlJTIGFyb3VuZCBhIENQVSBnb2luZyBpZGxlLgo+ID4gCj4gPiBHb3Qg
YW55IHNwZWNpZmljIGxpbmsgb3Igc3ViamVjdCBsaW5lIGZvciB0aGF0IHN1Ym1pc3Npb24/Cj4g
Cj4gU3VyZSwgYXMgd3JpdHRlbiBpbiB0aGUgb3JpZ2luYWwgcmVzcG9uc2UgdG8gSsO8cmdlbidz
IHBhdGNoOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAxNTM4NDMvCgpB
cmdoLCBpbmRlZWQgeW91IGRpZCEKCkluIGFueSBjYXNlLCB0aGlzIHN1Ym1pc3Npb24gZnJvbSBU
aW0gQ2hlbjoKCiAgIFtQQVRDSCB2MyAwLzVdIElCUlMgcGF0Y2ggc2VyaWVzCgpDb250YWluZWQg
YSBnbGFyaW5nIGJ1ZyBpbiBwYXRjaCAjMiB3aGljaCBUaG9tYXMgcG9pbnRlZCBvdXQsIGFuZCBB
RkFJQ1MgdGhlIApzZXJpZXMgd2FzIG5ldmVyIHJlc3VibWl0dGVkIHRvIGxrbWwgc28gaXQgZ290
IGxvc3QuCgpJbiBhbnkgY2FzZSB0aGFua3MgZm9yIHRoZSByZW1pbmRlciEKClRoYW5rcywKCglJ
bmdvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
