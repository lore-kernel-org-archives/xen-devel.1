From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [Bug 198497] handle_mm_fault / xen_pmd_val /
 radix_tree_lookup_slot Null pointer
Date: Sat, 21 Apr 2018 07:35:08 -0700
Message-ID: <20180421143508.GB14610@bombadil.infradead.org>
References: <bug-198497-200779@https.bugzilla.kernel.org/>
 <bug-198497-200779-43rwxa1kcg@https.bugzilla.kernel.org/>
 <CAKf6xpuYvCMUVHdP71F8OWm=bQGFxeRd7SddH-5DDo-AQjbbQg@mail.gmail.com>
 <20180420133951.GC10788@bombadil.infradead.org>
 <CAKf6xpuVrPwc=AxYruPVfdxx1Yv7NF7NKiGx7vT2WKLogUoqfA@mail.gmail.com>
 <76a4ee3b-e00a-5032-df90-07d8e207f707@citrix.com>
 <5ADA0A6D02000078001BD177@prv1-mh.provo.novell.com>
 <CAKf6xps4RiC48zCie0o7VzTOCDu8ik1hmFP=b_qMx8qTo8F3TQ@mail.gmail.com>
 <5ADA0F1502000078001BD1D2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5ADA0F1502000078001BD1D2@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, bugzilla-daemon@bugzilla.kernel.org, xen-devel@lists.xen.org, linux-mm@kvack.org, akpm@linux-foundation.org, labbott@redhat.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjAsIDIwMTggYXQgMTA6MDI6MjlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+PiBTa3lsYWtlIDMyYml0IFBBRSBEb20wOgo+ID4+Pj4gQmFkIHN3cF9lbnRyeTog
ODAwMDAwMDAKPiA+Pj4+IG1tL3N3YXBfc3RhdGUuYzo2ODM6IGJhZCBwdGUgZDNhMzlmMWMoODAw
MDAwMDQwMDAwMDAwMCkKPiA+Pj4+Cj4gPj4+PiBJdnkgQnJpZGdlIDMyYml0IFBBRSBEb20wOgo+
ID4+Pj4gQmFkIHN3cF9lbnRyeTogNDAwMDAwMDAKPiA+Pj4+IG1tL3N3YXBfc3RhdGUuYzo2ODM6
IGJhZCBwdGUgZDNhMDVmMWMoODAwMDAwMDIwMDAwMDAwMCkKPiA+Pj4+Cj4gPj4+PiBPdGhlciAz
MmJpdCBEb21VOgo+ID4+Pj4gQmFkIHN3cF9lbnRyeTogNDAwMDAwMAo+ID4+Pj4gbW0vc3dhcF9z
dGF0ZS5jOjY4MzogYmFkIHB0ZSBlMjE4N2YzMCg4MDAwMDAwMjAwMDAwMDAwKQo+ID4+Pj4KPiA+
Pj4+IE90aGVyIDMyYml0Ogo+ID4+Pj4gQmFkIHN3cF9lbnRyeTogMjAwMDAwMAo+ID4+Pj4gbW0v
c3dhcF9zdGF0ZS5jOjY4MzogYmFkIHB0ZSBlZjNhM2YzOCg4MDAwMDAwMTAwMDAwMDAwKQoKPiBB
cyBzYWlkIGluIG15IHByZXZpb3VzIHJlcGx5IC0gYm90aCBvZiB0aGUgYml0cyBBbmRyZXcgaGFz
IG1lbnRpb25lZCBjYW4KPiBvbmx5IGV2ZXIgYmUgc2V0IHdoZW4gdGhlIHByZXNlbnQgYml0IGlz
IGFsc28gc2V0ICh3aGljaCBkb2Vzbid0IGFwcGVhciB0bwo+IGJlIHRoZSBjYXNlIGhlcmUpLiBU
aGUgc2V0IGJpdHMgYWJvdmUgYXJlIGFjdHVhbGx5IGluIHRoZSByYW5nZSBvZiBiaXRzCj4gZGVz
aWduYXRlZCB0byB0aGUgYWRkcmVzcywgd2hpY2ggWGVuIHdvdWxkbid0IGV2ZXIgcGxheSB3aXRo
LgoKSXMgaXQgcmVsZXZhbnQgdGhhdCBhbGwgdGhlIGNyYXNoZXMgd2UndmUgc2VlbiBhcmUgd2l0
aCBQQUUgaW4gdGhlIGd1ZXN0PwpJcyBpdCBwb3NzaWJsZSB0aGF0IFhlbiB0aGlua3MgdGhlIGd1
ZXN0IGlzIG5vdCB1c2luZyBQQUU/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
