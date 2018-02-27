From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [v2 1/1] xen,
 mm: Allow deferred page initialization for xen pv domains
Date: Tue, 27 Feb 2018 07:59:22 +0100
Message-ID: <20180227065922.u6y7bcx3pwyags2u__18634.4382855625$1519714703$gmane$org@gmail.com>
References: <20180226160112.24724-1-pasha.tatashin@oracle.com>
 <20180226160112.24724-2-pasha.tatashin@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=u6rh=fv=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1eqZEX-00055Z-SG
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 06:59:29 +0000
Received: by mail-wr0-x242.google.com with SMTP id m12so5894000wrm.13
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2018 22:59:27 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180226160112.24724-2-pasha.tatashin@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pavel Tatashin <pasha.tatashin@oracle.com>
Cc: mhocko@suse.com, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, steven.sistare@oracle.com, hpa@zytor.com, dan.j.williams@intel.com, bhe@redhat.com, x86@kernel.org, akataria@vmware.com, daniel.m.jordan@oracle.com, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, minipli@googlemail.com, jinb.park7@gmail.com, luto@kernel.org, boris.ostrovsky@oracle.com, vbabka@suse.cz, jgross@suse.com, labbott@redhat.com, linux-kernel@vger.kernel.org, tglx@linutronix.de, zhang.jia@linux.alibaba.com, hannes@cmpxchg.org, akpm@linux-foundation.org, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

CiogUGF2ZWwgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQG9yYWNsZS5jb20+IHdyb3RlOgoKPiBK
dWVyZ2VuIEdyb3NzIG5vdGljZWQgdGhhdCBjb21taXQKPiBmN2Y5OTEwMGQ4ZCAoIm1tOiBzdG9w
IHplcm9pbmcgbWVtb3J5IGR1cmluZyBhbGxvY2F0aW9uIGluIHZtZW1tYXAiKQo+IGJyb2tlIFhF
TiBQViBkb21haW5zIHdoZW4gZGVmZXJyZWQgc3RydWN0IHBhZ2UgaW5pdGlhbGl6YXRpb24gaXMg
ZW5hYmxlZC4KPiAKPiBUaGlzIGlzIGJlY2F1c2UgdGhlIHhlbidzIFBhZ2VQaW5uZWQoKSBmbGFn
IGlzIGdldHRpbmcgZXJhc2VkIGZyb20gc3RydWN0Cj4gcGFnZXMgd2hlbiB0aGV5IGFyZSBpbml0
aWFsaXplZCBsYXRlciBpbiBib290Lgo+IAo+IEp1ZXJnZW4gZml4ZWQgdGhpcyBwcm9ibGVtIGJ5
IGRpc2FibGluZyBkZWZlcnJlZCBwYWdlcyBvbiB4ZW4gcHYgZG9tYWlucy4KPiBJdCBpcyBkZXNp
cmFibGUsIGhvd2V2ZXIsIHRvIGhhdmUgdGhpcyBmZWF0dXJlIGF2YWlsYWJsZSBhcyBpdCByZWR1
Y2VzIGJvb3QKPiB0aW1lLiBUaGlzIGZpeCByZS1lbmFibGVzIHRoZSBmZWF0dXJlIGZvciBwdi1k
bWFpbnMsIGFuZCBmaXhlcyB0aGUgcHJvYmxlbQo+IHRoZSBmb2xsb3dpbmcgd2F5Ogo+IAo+IFRo
ZSBmaXggaXMgdG8gZGVsYXkgc2V0dGluZyBQYWdlUGlubmVkIGZsYWcgdW50aWwgc3RydWN0IHBh
Z2VzIGZvciBhbGwKPiBhbGxvY2F0ZWQgbWVtb3J5IGFyZSBpbml0aWFsaXplZCwgaS5lLiB1bnRp
bCBhZnRlciBmcmVlX2FsbF9ib290bWVtKCkuCj4gCj4gQSBuZXcgeDg2X2luaXQuaHlwZXIgb3Ag
aW5pdF9hZnRlcl9ib290bWVtKCkgaXMgY2FsbGVkIHRvIGxldCB4ZW4ga25vdwo+IHRoYXQgYm9v
dCBhbGxvY2F0b3IgaXMgZG9uZSwgYW5kIGhlbmNlIHN0cnVjdCBwYWdlcyBmb3IgYWxsIHRoZSBh
bGxvY2F0ZWQKPiBtZW1vcnkgYXJlIG5vdyBpbml0aWFsaXplZC4gSWYgZGVmZXJyZWQgcGFnZSBp
bml0aWFsaXphdGlvbiBpcyBlbmFibGVkLCB0aGUKPiByZXN0IG9mIHN0cnVjdCBwYWdlcyBhcmUg
Z29pbmcgdG8gYmUgaW5pdGlhbGl6ZWQgbGF0ZXIgaW4gYm9vdCBvbmNlCj4gcGFnZV9hbGxvY19p
bml0X2xhdGUoKSBpcyBjYWxsZWQuCj4gCj4geGVuX2FmdGVyX2Jvb3RtZW0oKSB3YWxrcyBwYWdl
IHRhYmxlJ3MgcGFnZXMgYW5kIG1hcmtzIHRoZW0gcGlubmVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBvcmFjbGUuY29tPgo+IC0tLQo+ICBhcmNo
L3g4Ni9pbmNsdWRlL2FzbS94ODZfaW5pdC5oIHwgIDIgKysKPiAgYXJjaC94ODYva2VybmVsL3g4
Nl9pbml0LmMgICAgICB8ICAxICsKPiAgYXJjaC94ODYvbW0vaW5pdF8zMi5jICAgICAgICAgICB8
ICAxICsKPiAgYXJjaC94ODYvbW0vaW5pdF82NC5jICAgICAgICAgICB8ICAxICsKPiAgYXJjaC94
ODYveGVuL21tdV9wdi5jICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tCj4gIG1tL3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICAgfCAgNCAtLS0t
Cj4gIDYgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpB
Y2tlZC1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+CgpUaGFua3MsCgoJSW5nbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
