From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Wed, 27 Mar 2019 10:58:23 -0600
Message-ID: <5C9BABAF02000078002223E3@prv1-mh.provo.novell.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-2-jgross@suse.com>
 <5C9BA336020000780022235B@suse.com>
 <0b849a5c-9af8-2b47-ced3-376af22c6141@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0tC/=R6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9Bsk-0000bi-1Q
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:58:30 +0000
In-Reply-To: <0b849a5c-9af8-2b47-ced3-376af22c6141@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE5IGF0IDE3OjQ1LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Ny8wMy8yMDE5IDE3OjIyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQWxzbyB3aGlsZSBpbmRlZWQg
KGFzIHRoZSBkZXNjcmlwdGlvbiBzYXlzKSB0aGVyZSdzIG5vIG5lZWQgdG8KPj4gcnVuIHRoZSBm
dW5jdGlvbiBvbiB0aGUgQ1BVIGl0c2VsZiwgaXQncyBub3Qgb2J2aW91cyB0byBtZSB0aGF0Cj4+
IGl0J3Mgc2FmZSB0byBydW4gaXQgb3V0c2lkZSBvZiBzdG9wX21hY2hpbmUoKSBjb250ZXh0LiBP
ciB0byBiZQo+PiBtb3JlIHByZWNpc2UsIGl0J3Mgbm90IGNsZWFyIHRvIG1lIHRoYXQgbGVhdmlu
ZyBzdG9wX21hY2hpbmUoKQo+PiBjb250ZXh0IHdpdGggdGhlIGFkanVzdG1lbnRzIG5vdCBkb25l
IHlldCBpcyBub3QgZ29pbmcgdG8KPj4gbGVhZCB0byBwcm9ibGVtcyAoZHVlIHRvIHRoZSBnYXAg
YmV0d2VlbiBsZWF2aW5nIHRoYXQgY29udGV4dAo+PiBhbmQgYWNxdWlyaW5nIHRoZSBSQ1UgbG9j
aykuIENvdWxkIHlvdSBjbGFyaWZ5IHRoaXMgaW4gdGhlCj4+IGRlc2NyaXB0aW9uLCBwbGVhc2Ug
KGlmIGl0IGluZGVlZCBpcyBmaW5lIHRoaXMgd2F5KT8KPiAKPiBJdCBpcyBmaW5lLCBhcyB0aGUg
Y2hhbmNlcyBhcmUgemVybyB0aGF0IGFueSBjb2RlIHdpbGwgcnVuIG9uIHRoZSBjcHUKPiBqdXN0
IHRha2VuIGRvd24gYW5kIHRoYXQgY3B1IGlzIG5vdCBob2xkaW5nIGFueSBsb2NrcyB3ZSBtaWdo
dCBuZWVkLgoKV2VsbCwgb2YgY291cnNlIG5vdGhpbmcncyBnb2luZyB0byBydW4gb24gdGhhdCBD
UFUgYW55bW9yZS4KQnV0IHZDUFUtcyBtYXkgc3RpbGwgaGF2ZSBhc3NvY2lhdGlvbnMgd2l0aCBp
dCwgc28gd2hhdCBJJ20Kd29ycmllZCBhYm91dCBpcyBlLmcuIHNvbWV0aGluZyBmaW5kaW5nIHYt
PnByb2Nlc3NvciBwb2ludGluZwphdCBhbiBvZmZsaW5lIENQVSBhbmQgZ2V0dGluZyBjb25mdXNl
ZC4gQW5vdGhlciwgbW9yZSBleG90aWMKKG9yIHNob3VsZCBJIHNheSBjb250cml2ZWQpIHNjZW5h
cmlvIG1pZ2h0IGJlIGEgc29mdC1vbmxpbmUKcmVxdWVzdCBjb21pbmcgdmVyeSBxdWlja2x5IGFm
dGVyIGEgcHJpb3Igc29mdC1vZmZsaW5lIG9uZSwgd2l0aAp0aGlzIGZ1bmN0aW9uIG5vdCBoYXZp
bmcgZ290IGFyb3VuZCB0byBydW4geWV0LiBPciBiYXNpY2FsbHkKYW55dGhpbmcgZWxzZSB0aGF0
IGFjY2Vzc2VzIHRoZSBzYW1lIHN0YXRlIHRoZSBmdW5jdGlvbgptZWFucyB0byB1cGRhdGUgKG9y
IHVzZSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
