From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 17/18] xen/arm: Resume Dom0 after Xen resumes
Date: Sat, 17 Nov 2018 17:01:16 +0100
Message-ID: <CAKPH-Ngxu7a-pxoM6+ffBYiiFa3zeUt=ns6gaYpyJpFth4xE3A@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-18-git-send-email-mirela.simonovic@aggios.com>
 <77c3d2c9-a1e0-a5b3-0a4e-fc6ea079b817@arm.com>
 <CAKPH-Ngdb_w+uHKFrMd_fF62pM0idQJie2RdKDtD8HbZyNV1WQ@mail.gmail.com>
 <CAKPH-NiEnpDWwT65zwczx20hZcEN4qTayQXpO4=4iye2mcky3Q@mail.gmail.com>
 <dc9b6382-490e-fd41-6fec-faf211103cee@arm.com>
 <CAKPH-Ngn1vp0oxtXs_cO5WnCJJExg5y=QQO5tck6fd1Z76ozsg@mail.gmail.com>
 <2edccbdc-5c9e-630a-27f0-1c937f926bec@arm.com>
 <alpine.DEB.2.10.1811161056400.22115@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1811161105070.22115@sstabellini-ThinkPad-X260>
 <CAKPH-Ni3noct-9WHGLgUCG+19MKOJnbpk_uMMGcPEQ3Kd1U11Q@mail.gmail.com>
 <6b1b7986-5ce1-b3d2-11c9-63e7b17606f7@arm.com>
 <855b1bb125bb3ec2a7d51dd0144787700d6568c0.camel@suse.com>
 <alpine.DEB.2.10.1811161505530.22115@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fiwk=n4=aggios.com=mirela.simonovic@srs-us1.protection.inumbo.net>)
 id 1gO32I-0004t4-9Z
 for xen-devel@lists.xenproject.org; Sat, 17 Nov 2018 16:01:30 +0000
Received: by mail-qk1-x741.google.com with SMTP id r71so42311270qkr.10
 for <xen-devel@lists.xenproject.org>; Sat, 17 Nov 2018 08:01:28 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1811161505530.22115@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: nd@arm.com, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>, Julien Grall <Julien.Grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiBTYXQsIE5vdiAxNywgMjAxOCBhdCAxMjowNiBBTSBTdGVmYW5vIFN0YWJlbGxpbmkK
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCAxNyBOb3YgMjAxOCwg
RGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gPiBPbiBGcmksIDIwMTgtMTEtMTYgYXQgMjE6NTggKzAw
MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gT24gMTYvMTEvMjAxOCAyMTo0MSwgTWlyZWxh
IFNpbW9ub3ZpYyB3cm90ZToKPiA+ID4gPiBPbiBGcmksIE5vdiAxNiwgMjAxOCBhdCA4OjA5IFBN
IFN0ZWZhbm8gU3RhYmVsbGluaQo+ID4gPiA+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90
ZToKPiA+ID4gPiA+ID4gSXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGZpZ3VyZSBvdXQgd2hpY2gg
ZG9tYWluIG5lZWRzIHRvCj4gPiA+ID4gPiA+IGF3YWtlbiBmcm9tCj4gPiA+ID4gPiA+IHRoZXJl
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFjdHVhbGx5LCBldnRjaG5fc2VuZCBldmVudHVhbGx5IHdp
bGwgdHJpZ2dlciBhIHByb3BlciBpbnRlcnJ1cHQKPiA+ID4gPiA+IGluamVjdGlvbiBpbnRvIHRo
ZSBkb21haW4KPiA+ID4gPiA+ICh4ZW4vYXJjaC9hcm0vdmdpYy5jOmFyY2hfZXZ0Y2huX2luamVj
dCksCj4gPiA+ID4gPiB3aGljaCB3aWxsIG5lY2Vzc2FyZWx5IHdha2UgaXQgdXAuIFNvIGl0IGlz
IHBvc3NpYmxlIHRoYXQgaXQgd2lsbAo+ID4gPiA+ID4gYWxyZWFkeSB3b3JrIHdpdGhvdXQgYW55
IG5lZWQgZm9yIGFkZGl0aW9uYWwgY2hhbmdlcz8KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBB
YnNvbHV0ZWx5LCB0aGF0IHNvdW5kcyBncmVhdCA6KSBUaGVuIHdlIGNvdWxkIGp1c3QgZHJvcCB0
aGlzCj4gPiA+ID4gcGF0Y2guCj4gPiA+Cj4gPiA+IEkgZG9uJ3QgdGhpbmsgeW91IGNhbiBkcm9w
IHRoaXMgcGF0Y2guLi4gQXMgeW91IHRpZSB0aGUgaG9zdCBzdXNwZW5kCj4gPiA+IHRvCj4gPiA+
IHRoZSBoYXJkd2FyZSBkb21haW4gc3VzcGVuZCwgaXQgbWF5IG1ha2VzIHNlbnNlIHRvIHJlc3Vt
ZSBhdCB0aGUgc2FtZQo+ID4gPiB0aW1lLgo+ID4gPgo+ID4gRldJVywgSSB0aGluayB0aGF0IHRv
by4KPiA+Cj4gPiBJbiBmYWN0LCBsZXQncyBhc3N1bWUgYSAqZnVsbHkqIGRpc2FnZ3JlZ2F0ZWQg
c2V0dXAsIHdoZXJlIGRvbTAgb25seQo+ID4gaGFzIHRoZSB0b29sc3RhY2ssIHdoaWxlIGl0IGhh
cyBubyBoYXJkd2FyZSwgbm8gUFYgYmFja2VuZCwgZXRjLi4uIElmCj4gPiB3ZSBkb24ndCByZXN1
bWUgaXQgZXhwbGljaXRseSB0b2dldGhlciB3aXRoIFhlbiwgd2hvIGlzIGdvaW5nIHRvIHJlc3Vt
ZQo+ID4gaXQ/IDotTwo+Cj4gWWVzLCB0aGF0J3MgcmlnaHQuIEhvd2V2ZXIsIGl0IHNob3VsZCB3
b3JrIGZvciBkcml2ZXIgZG9tYWluczogdGhlcmUgaXMKPiBubyBuZWVkIHRvIHdha2UgdXAgZHJp
dmVyIGRvbWFpbnMgZXhwbGljaXRseSBiZWNhdXNlIHRoZXkgd2lsbCBiZQo+IHdva2VuIHVwIGJ5
IHRoZSBmcm9udGVuZHM/Cj4KCkkgdGhpbmsgd2UgYWxsIGFncmVlLCBleGNlcHQgc29tZSBvZiB1
cyB3ZXJlbid0IHNvIGNsZWFyIGFib3V0IGl0IDopCkZvciBub3csIGRvbTAgaXNzdWVzIHN1c3Bl
bmQgYW5kIHNob3VsZCByZXN1bWUgYXMgd2VsbCB3aGVuIFhlbgpzdXNwZW5kcy4gVGhpcyBpcyBk
b25lIGluIHRoZSBzZXJpZXMsIHJlc3VtZSBpcyBjb3ZlcmVkIGJ5IHRoaXMgcGF0Y2gsCmFuZCBj
b21taXQgbWVzc2FnZSBzaG91bGQgYmUgY2xhcmlmaWVkLgoKSWYgYSBkb21VIGhhcyBhIGJhY2tl
bmQsIHdlIHNob3VsZCB2ZXJpZnkgdGhhdCBpdCBjYW4gYmUgd29rZW4tdXAgYnkKYW4gZXZlbnQg
dHJpZ2dlcmVkIGJ5IGEgZnJvbnRlbmQgZHJpdmVyIGluIGFub3RoZXIgZG9tYWluLgoKT25lIGRh
eSwgdGhpcyBwYXRjaCBjb3VsZCBiZSBkcm9wcGVkL3JldmVydGVkIGlmIG9uZSBjb21lIHVwIHdp
dGggYQpkaWZmZXJlbnQgbG9naWMgZm9yIHRyaWdnZXJpbmcgWGVuIHN1c3BlbmQuIFRoaXMgc2hv
dWxkIGJlIG9mIHRoZQp0YWJsZSBmb3Igbm93LCBidXQgYSBnb29kIG9wdGlvbiB0byByZW1lbWJl
ciBmb3IgZnV0dXJlLgoKPgo+ID4gPDxUaGlzIGhhcHBlbnMgYmVjYXVzZSBJIGNob29zZSBpdCB0
byBoYXBwZW4hPj4gKFJhaXN0bGluIE1hamVyZSkKPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiBEYXJpbyBGYWdn
aW9saSwgUGguRCwgaHR0cDovL2Fib3V0Lm1lL2RhcmlvLmZhZ2dpb2xpCj4gPiBTb2Z0d2FyZSBF
bmdpbmVlciBAIFNVU0UgaHR0cHM6Ly93d3cuc3VzZS5jb20vCj4gPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
