From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] common/gnttab: Process softirqs while
 dumping grant tables
Date: Mon, 08 Apr 2019 03:34:54 -0600
Message-ID: <5CAB15BE0200007800225404@prv1-mh.provo.novell.com>
References: <1554481990-7569-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554481990-7569-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA0LjE5IGF0IDE4OjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT1NTVGVzdHMgdXBncmFkZSB0byBKZXNzaWUgaGFzIGlkZW50aWZpZWQgdGhhdCB3aXRo
IGEgc3VmZmljaWVudGx5IGxhcmdlIGdyYW50Cj4gdGFibGUsIGEgd2F0Y2hkb2cgdGltZW91dCBj
YW4gb2NjdXIuCgpIb3cncyB0aGlzIGRlcGVuZGVudCBvbiB0aGUgcHJlY2lzZSBkaXN0cm8gdmVy
c2lvbj8gSS5lLiBpcyB0aGVyZQpzb21ldGhpbmcgdGhhdCBtYWtlcyB0aGUgbG9nZ2luZyBzbG93
ZXIgbm93PwoKPiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiArKysgYi94ZW4vY29t
bW9uL2dyYW50X3RhYmxlLmMKPiBAQCAtMzk1Niw2ICszOTU2LDkgQEAgc3RhdGljIHZvaWQgZ250
dGFiX3VzYWdlX3ByaW50KHN0cnVjdCBkb21haW4gKnJkKQo+ICAgICAgICAgIHVpbnQxNl90IHN0
YXR1czsKPiAgICAgICAgICB1aW50NjRfdCBmcmFtZTsKPiAgCj4gKyAgICAgICAgaWYgKCAhKHJl
ZiAmIDMxKSApCj4gKyAgICAgICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOwoKSSB0
aGluayB0aGlzIGlzIGJvdGggcmlza3kgYW5kIG92ZXJseSBlYWdlcjogUmlza3kgYmVjYXVzZSBv
ZiBoYXBwZW5pbmcKd2l0aCBhIGxvY2sgaGVsZCwgYW5kIG92ZXJseSBlYWdlciBiZWNhdXNlIG5v
IG91dHB1dCBtYXkgaGF2ZSBiZWVuCmRvbmUgYXQgYWxsIGJldHdlZW4gYW55IHR3byBzdWNoIGNh
bGxzLiBUaGF0IG5vdHdpdGhzdGFuZGluZwpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgpvbiB0aGUgYmFzaXMgdGhhdCBpdCBpcyBhbiBpbXByb3ZlbWVudCwgYW5kIHRo
ZSByaXNrIGlzIC0gYWZhaWN0IC0gYSBsYXRlbnQKb25lIG9ubHkuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
