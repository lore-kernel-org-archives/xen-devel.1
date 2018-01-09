From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86: xen: remove the use of VLAIS
Date: Tue, 9 Jan 2018 06:35:54 +0100
Message-ID: <aa844da5-4fde-d582-2878-53a193b8503d__17609.5981653363$1515476102$gmane$org@suse.com>
References: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
 <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
 <20180108161001.GM32035@hirez.programming.kicks-ass.net>
 <892cb5f2-367b-cfbd-58b5-3d8711c3ed66@suse.com>
 <20180108184939.6rckuyy77qt3ureg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=fubw=ee=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eYmZy-00080P-4z
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 05:36:06 +0000
In-Reply-To: <20180108184939.6rckuyy77qt3ureg@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Nick Desaulniers <nick.desaulniers@gmail.com>, ghackmann@google.com, linux-kernel@vger.kernel.org, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, kees@google.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDEvMTggMTk6NDksIEluZ28gTW9sbmFyIHdyb3RlOgo+IAo+ICogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAKPj4gT24gMDgvMDEvMTggMTc6MTAsIFBldGVy
IFppamxzdHJhIHdyb3RlOgo+Pj4gT24gU2F0LCBKYW4gMDYsIDIwMTggYXQgMDE6Mzk6NDhQTSAt
MDgwMCwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPj4+PiBWYXJpYWJsZSBMZW5ndGggQXJyYXlz
IEluIFN0cnVjdHMgKFZMQUlTKSBpcyBub3Qgc3VwcG9ydGVkIGJ5IENsYW5nLCBhbmQKPj4+PiBm
cm93bmVkIHVwb24gYnkgb3RoZXJzLgo+Pj4+Cj4+Pj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIw
MTMvOS8yMy81MDAKPj4+Pgo+Pj4+IEhlcmUsIHRoZSBWTEFJUyB3YXMgdXNlZCBiZWNhdXNlIHRo
ZSBzaXplIG9mIHRoZSBiaXRtYXAgcmV0dXJuZWQgZnJvbQo+Pj4+IHhlbl9tY19lbnRyeSgpIGRl
cGVuZGVkIG9uIHBvc3NpYmx5IChiYXNlZCBvbiBrZXJuZWwgY29uZmlndXJhdGlvbikKPj4+PiBy
dW50aW1lIHNpemVkIGRhdGEuIFJhdGhlciB0aGFuIGRlY2xhcmluZyBhcmdzIGFzIGEgVkxBSVMg
dGhlbiBjYWxsaW5nCj4+Pj4gc2l6ZW9mIG9uICphcmdzLCB3ZSBjYWxjdWxhdGUgdGhlIGFwcHJv
cHJpYXRlIHNpemVvZiBhcmdzIG1hbnVhbGx5Lgo+Pj4+IEZ1cnRoZXIsIHdlIGNhbiBnZXQgcmlk
IG9mIHRoZSAjaWZkZWYncyBhbmQgcmVseSBvbiBudW1fcG9zc2libGVfY3B1cygpCj4+Pj4gKHRo
YW5rcyB0byBhIGhlbHBmdWwgY2hlY2twYXRjaCB3YXJuaW5nIGZyb20gYW4gZWFybGllciB2ZXJz
aW9uIG9mIHRoaXMKPj4+PiBwYXRjaCkuCj4+Pj4KPj4+PiBTdWdnZXN0ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIERlc2F1bG5p
ZXJzIDxuaWNrLmRlc2F1bG5pZXJzQGdtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiBDaGFuZ2VzIGlu
IHYyOgo+Pj4+ICogQ2hhbmdlIG1hc2sgdG8gdXMgREVDTEFSRV9CSVRNQVAgaW5zdGVhZCBvZiBw
b2ludGVyLCBhcyBzdWdnZXN0ZWQuCj4+Pj4gKiBVcGRhdGUgY29tbWl0IG1lc3NhZ2UgdG8gcmVt
b3ZlIG1lbnRpb24gb2YgcG9pbnRlci4KPj4+PiAqIFVwZGF0ZSBzaXplb2YgY2FsY3VsYXRpb24g
dG8gd29yayB3aXRoIGFycmF5IHJhdGhlciB0aGFuIHBvaW50ZXIuCj4+Pj4KPj4+PiAgYXJjaC94
ODYveGVuL21tdV9wdi5jIHwgOCArKystLS0tLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L3hlbi9tbXVfcHYuYyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYwo+Pj4+IGluZGV4IDRkNjJjMDcu
LmQ4NTA3NjIgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC94ODYveGVuL21tdV9wdi5jCj4+Pj4gKysr
IGIvYXJjaC94ODYveGVuL21tdV9wdi5jCj4+Pj4gQEAgLTEzMjUsMjAgKzEzMjUsMTggQEAgc3Rh
dGljIHZvaWQgeGVuX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdXMs
Cj4+Pj4gIHsKPj4+PiAgCXN0cnVjdCB7Cj4+Pj4gIAkJc3RydWN0IG1tdWV4dF9vcCBvcDsKPj4+
PiAtI2lmZGVmIENPTkZJR19TTVAKPj4+PiAtCQlERUNMQVJFX0JJVE1BUChtYXNrLCBudW1fcHJv
Y2Vzc29ycyk7Cj4+Pj4gLSNlbHNlCj4+Pj4gIAkJREVDTEFSRV9CSVRNQVAobWFzaywgTlJfQ1BV
Uyk7Cj4+Pj4gLSNlbmRpZgo+Pj4+ICAJfSAqYXJnczsKPj4+Cj4+PiBXaHkgaXMgaXQgT0sgZm9y
IFhlbiB0byBwbGFjZSB0aGlzIGJpdG1hcCBvbi1zdGFjayBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4+
PiBUaGF0IE5SX0NQVVMgdGhpbmcgY2FuIGJlIGZhaXJseSBodWdlLgo+Pgo+PiBUaGlzIG9ubHkg
YSBwb2ludGVyIHRvIHRoZSBiaXRtYXAuCj4gCj4gV2hhdCdzIHRoZSBtYXhpbXVtIE5SX0NQVXMg
Zm9yIGNvbmZpZ3MgdGhhdCBjYW4gcnVuIHRoaXMgY29kZSwgdGltZXMgOD8KCldoeSBkb2VzIHRo
aXMgbWF0dGVyPyBhcmdzIGlzIGEgcG9pbnRlciBvbmx5LCBzbyBpdCBvY2N1cGllcyA4IGJ5dGVz
IG9mCnRoZSBzdGFjay4gVGhlIHN0cnVjdHVyZSBpcyBvbmx5IGZvciB0eXBlIGNvcnJlY3RuZXNz
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
