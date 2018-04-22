From: Juergen Gross <jgross@suse.com>
Subject: Re: [Bug 198497] handle_mm_fault / xen_pmd_val /
 radix_tree_lookup_slot Null pointer
Date: Sun, 22 Apr 2018 07:50:17 +0200
Message-ID: <9b311a5f-1286-d3ed-fd42-d565dc7982ac@suse.com>
References: <bug-198497-200779@https.bugzilla.kernel.org/>
 <bug-198497-200779-43rwxa1kcg@https.bugzilla.kernel.org/>
 <CAKf6xpuYvCMUVHdP71F8OWm=bQGFxeRd7SddH-5DDo-AQjbbQg@mail.gmail.com>
 <20180420133951.GC10788@bombadil.infradead.org>
 <CAKf6xpuVrPwc=AxYruPVfdxx1Yv7NF7NKiGx7vT2WKLogUoqfA@mail.gmail.com>
 <76a4ee3b-e00a-5032-df90-07d8e207f707@citrix.com>
 <5ADA0A6D02000078001BD177@prv1-mh.provo.novell.com>
 <CAKf6xps4RiC48zCie0o7VzTOCDu8ik1hmFP=b_qMx8qTo8F3TQ@mail.gmail.com>
 <5ADA0F1502000078001BD1D2@prv1-mh.provo.novell.com>
 <20180421143508.GB14610@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180421143508.GB14610@bombadil.infradead.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>, Jan Beulich <JBeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, bugzilla-daemon@bugzilla.kernel.org, xen-devel@lists.xen.org, linux-mm@kvack.org, akpm@linux-foundation.org, labbott@redhat.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDQvMTggMTY6MzUsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+IE9uIEZyaSwgQXByIDIw
LCAyMDE4IGF0IDEwOjAyOjI5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gU2t5
bGFrZSAzMmJpdCBQQUUgRG9tMDoKPj4+Pj4+IEJhZCBzd3BfZW50cnk6IDgwMDAwMDAwCj4+Pj4+
PiBtbS9zd2FwX3N0YXRlLmM6NjgzOiBiYWQgcHRlIGQzYTM5ZjFjKDgwMDAwMDA0MDAwMDAwMDAp
Cj4+Pj4+Pgo+Pj4+Pj4gSXZ5IEJyaWRnZSAzMmJpdCBQQUUgRG9tMDoKPj4+Pj4+IEJhZCBzd3Bf
ZW50cnk6IDQwMDAwMDAwCj4+Pj4+PiBtbS9zd2FwX3N0YXRlLmM6NjgzOiBiYWQgcHRlIGQzYTA1
ZjFjKDgwMDAwMDAyMDAwMDAwMDApCj4+Pj4+Pgo+Pj4+Pj4gT3RoZXIgMzJiaXQgRG9tVToKPj4+
Pj4+IEJhZCBzd3BfZW50cnk6IDQwMDAwMDAKPj4+Pj4+IG1tL3N3YXBfc3RhdGUuYzo2ODM6IGJh
ZCBwdGUgZTIxODdmMzAoODAwMDAwMDIwMDAwMDAwMCkKPj4+Pj4+Cj4+Pj4+PiBPdGhlciAzMmJp
dDoKPj4+Pj4+IEJhZCBzd3BfZW50cnk6IDIwMDAwMDAKPj4+Pj4+IG1tL3N3YXBfc3RhdGUuYzo2
ODM6IGJhZCBwdGUgZWYzYTNmMzgoODAwMDAwMDEwMDAwMDAwMCkKPiAKPj4gQXMgc2FpZCBpbiBt
eSBwcmV2aW91cyByZXBseSAtIGJvdGggb2YgdGhlIGJpdHMgQW5kcmV3IGhhcyBtZW50aW9uZWQg
Y2FuCj4+IG9ubHkgZXZlciBiZSBzZXQgd2hlbiB0aGUgcHJlc2VudCBiaXQgaXMgYWxzbyBzZXQg
KHdoaWNoIGRvZXNuJ3QgYXBwZWFyIHRvCj4+IGJlIHRoZSBjYXNlIGhlcmUpLiBUaGUgc2V0IGJp
dHMgYWJvdmUgYXJlIGFjdHVhbGx5IGluIHRoZSByYW5nZSBvZiBiaXRzCj4+IGRlc2lnbmF0ZWQg
dG8gdGhlIGFkZHJlc3MsIHdoaWNoIFhlbiB3b3VsZG4ndCBldmVyIHBsYXkgd2l0aC4KPiAKPiBJ
cyBpdCByZWxldmFudCB0aGF0IGFsbCB0aGUgY3Jhc2hlcyB3ZSd2ZSBzZWVuIGFyZSB3aXRoIFBB
RSBpbiB0aGUgZ3Vlc3Q/Cj4gSXMgaXQgcG9zc2libGUgdGhhdCBYZW4gdGhpbmtzIHRoZSBndWVz
dCBpcyBub3QgdXNpbmcgUEFFPwo+IAoKQWxsIFhlbiAzMi1iaXQgUFYgZ3Vlc3RzIGFyZSB1c2lu
ZyBQQUUuIEl0cyBwYXJ0IG9mIHRoZSBQViBBQkkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
