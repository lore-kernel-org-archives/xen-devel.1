From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2] x86: xen: remove the use of VLAIS
Date: Mon, 8 Jan 2018 19:49:39 +0100
Message-ID: <20180108184939.6rckuyy77qt3ureg__16955.4944769063$1515437321$gmane$org@gmail.com>
References: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
 <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
 <20180108161001.GM32035@hirez.programming.kicks-ass.net>
 <892cb5f2-367b-cfbd-58b5-3d8711c3ed66@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w+pu=ed=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1eYcUS-0006xQ-QW
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 18:49:44 +0000
Received: by mail-wm0-x242.google.com with SMTP id t8so15977764wmc.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2018 10:49:43 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <892cb5f2-367b-cfbd-58b5-3d8711c3ed66@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Nick Desaulniers <nick.desaulniers@gmail.com>, ghackmann@google.com, linux-kernel@vger.kernel.org, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, kees@google.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

CiogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKCj4gT24gMDgvMDEvMTgg
MTc6MTAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+ID4gT24gU2F0LCBKYW4gMDYsIDIwMTggYXQg
MDE6Mzk6NDhQTSAtMDgwMCwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPiA+PiBWYXJpYWJsZSBM
ZW5ndGggQXJyYXlzIEluIFN0cnVjdHMgKFZMQUlTKSBpcyBub3Qgc3VwcG9ydGVkIGJ5IENsYW5n
LCBhbmQKPiA+PiBmcm93bmVkIHVwb24gYnkgb3RoZXJzLgo+ID4+Cj4gPj4gaHR0cHM6Ly9sa21s
Lm9yZy9sa21sLzIwMTMvOS8yMy81MDAKPiA+Pgo+ID4+IEhlcmUsIHRoZSBWTEFJUyB3YXMgdXNl
ZCBiZWNhdXNlIHRoZSBzaXplIG9mIHRoZSBiaXRtYXAgcmV0dXJuZWQgZnJvbQo+ID4+IHhlbl9t
Y19lbnRyeSgpIGRlcGVuZGVkIG9uIHBvc3NpYmx5IChiYXNlZCBvbiBrZXJuZWwgY29uZmlndXJh
dGlvbikKPiA+PiBydW50aW1lIHNpemVkIGRhdGEuIFJhdGhlciB0aGFuIGRlY2xhcmluZyBhcmdz
IGFzIGEgVkxBSVMgdGhlbiBjYWxsaW5nCj4gPj4gc2l6ZW9mIG9uICphcmdzLCB3ZSBjYWxjdWxh
dGUgdGhlIGFwcHJvcHJpYXRlIHNpemVvZiBhcmdzIG1hbnVhbGx5Lgo+ID4+IEZ1cnRoZXIsIHdl
IGNhbiBnZXQgcmlkIG9mIHRoZSAjaWZkZWYncyBhbmQgcmVseSBvbiBudW1fcG9zc2libGVfY3B1
cygpCj4gPj4gKHRoYW5rcyB0byBhIGhlbHBmdWwgY2hlY2twYXRjaCB3YXJuaW5nIGZyb20gYW4g
ZWFybGllciB2ZXJzaW9uIG9mIHRoaXMKPiA+PiBwYXRjaCkuCj4gPj4KPiA+PiBTdWdnZXN0ZWQt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBO
aWNrIERlc2F1bG5pZXJzIDxuaWNrLmRlc2F1bG5pZXJzQGdtYWlsLmNvbT4KPiA+PiAtLS0KPiA+
PiBDaGFuZ2VzIGluIHYyOgo+ID4+ICogQ2hhbmdlIG1hc2sgdG8gdXMgREVDTEFSRV9CSVRNQVAg
aW5zdGVhZCBvZiBwb2ludGVyLCBhcyBzdWdnZXN0ZWQuCj4gPj4gKiBVcGRhdGUgY29tbWl0IG1l
c3NhZ2UgdG8gcmVtb3ZlIG1lbnRpb24gb2YgcG9pbnRlci4KPiA+PiAqIFVwZGF0ZSBzaXplb2Yg
Y2FsY3VsYXRpb24gdG8gd29yayB3aXRoIGFycmF5IHJhdGhlciB0aGFuIHBvaW50ZXIuCj4gPj4K
PiA+PiAgYXJjaC94ODYveGVuL21tdV9wdi5jIHwgOCArKystLS0tLQo+ID4+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYwo+ID4+IGlu
ZGV4IDRkNjJjMDcuLmQ4NTA3NjIgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC94ODYveGVuL21tdV9w
di5jCj4gPj4gKysrIGIvYXJjaC94ODYveGVuL21tdV9wdi5jCj4gPj4gQEAgLTEzMjUsMjAgKzEz
MjUsMTggQEAgc3RhdGljIHZvaWQgeGVuX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgc3RydWN0IGNw
dW1hc2sgKmNwdXMsCj4gPj4gIHsKPiA+PiAgCXN0cnVjdCB7Cj4gPj4gIAkJc3RydWN0IG1tdWV4
dF9vcCBvcDsKPiA+PiAtI2lmZGVmIENPTkZJR19TTVAKPiA+PiAtCQlERUNMQVJFX0JJVE1BUCht
YXNrLCBudW1fcHJvY2Vzc29ycyk7Cj4gPj4gLSNlbHNlCj4gPj4gIAkJREVDTEFSRV9CSVRNQVAo
bWFzaywgTlJfQ1BVUyk7Cj4gPj4gLSNlbmRpZgo+ID4+ICAJfSAqYXJnczsKPiA+IAo+ID4gV2h5
IGlzIGl0IE9LIGZvciBYZW4gdG8gcGxhY2UgdGhpcyBiaXRtYXAgb24tc3RhY2sgaW4gdGhlIGZp
cnN0IHBsYWNlPwo+ID4gVGhhdCBOUl9DUFVTIHRoaW5nIGNhbiBiZSBmYWlybHkgaHVnZS4KPiAK
PiBUaGlzIG9ubHkgYSBwb2ludGVyIHRvIHRoZSBiaXRtYXAuCgpXaGF0J3MgdGhlIG1heGltdW0g
TlJfQ1BVcyBmb3IgY29uZmlncyB0aGF0IGNhbiBydW4gdGhpcyBjb2RlLCB0aW1lcyA4PwoKVGhh
bmtzLAoKCUluZ28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
