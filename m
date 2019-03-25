From: Jennifer Herbert <Jennifer.Herbert@citrix.com>
Subject: Re: [PATCH] xen/pv: Add PV specific legacy_pic struct
 to expose legacy IRQs.
Date: Mon, 25 Mar 2019 14:23:36 +0000
Message-ID: <5C98E468.1050502__9874.24264182977$1553523880$gmane$org@citrix.com>
References: <1553025739-92245-1-git-send-email-jennifer.herbert@citrix.com>
 <2eb1fdec-6cc0-7f62-3d4f-adc5dba9971e@oracle.com>
 <5C93CEB7.9030701@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RKUi=R4=citrix.com=prvs=9809a4606=jennifer.herbert@srs-us1.protection.inumbo.net>)
 id 1h8QVu-00011U-IL
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 14:23:46 +0000
In-Reply-To: <5C93CEB7.9030701@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS8wMy8xOSAxNzo0OSwgSmVubmlmZXIgSGVyYmVydCB3cm90ZToKPgo+Cj4gT24gMTkv
MDMvMTkgMjM6MDYsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMy8xOS8xOSA0OjAyIFBN
LCBKZW5uaWZlciBIZXJiZXJ0IHdyb3RlOgo+Pj4gVGhlIEFDUEkgdGFibGVzIGRvZXNuJ3QgYWx3
YXlzIGNvbnRhaW4gYWxsIElSUXMgZm9yIGxlZ2FjeSBkZXZpY2VzCj4+PiBzdWNoIGFzIFJUQy4g
IFNpbmNlIG5vIFBJQyBjb250cm9sbGVyIGlzIHZpc2libGUgZm9yIGEgUFYgbGludXggZ3Vlc3Qs
Cj4+PiB1bmRlciBYZW4sIGxlZ2FjeV9waWMgY3VycmVudGx5IGRlZmF1bHRzIHRvIHRoZSBudWxs
X2xlZ2FjeV9waWMgLSB3aXRoCj4+PiByZXBvcnRzIG5vIGxlZ2FjeSBJUlFzLiAgU2luY2UgdGhl
IGNvbW1pdCAicnRjOiBjbW9zOiBEbyBub3QgYXNzdW1lCj4+PiBpcnEgOCBmb3IgcnRjIHdoZW4g
dGhlcmUgYXJlIG5vIGxlZ2FjeSBpcnFzIiBieSBIYW5zIGRlIEdvZWRlCj4+PiAoY29tbWl0IGlk
OiBhMWUyM2E0MmYxYmRjMDBlMzJmYzQ4NjljYWVmMTJlNGU2MjcyZjI2KSwgdGhlIHJ0YyBub3cK
Pj4+IGluY29ycmVjdGx5IGRlY2lkZXMgaXQgaGFzIG5vIGlycSBpdCBjYW4gdXNlLCBmb3Igc29t
ZSBoYXJkd2FyZS4KPj4+Cj4+PiBUaGlzIHBhdGNoIHJlY3RpZmllcyB0aGUgcHJvYmxlbSBieSBw
cm92aWRpbmcgYSB4ZW4gbGVnYWN5X3BpYwo+Pj4gc3RydWN0LCB3aGljaCBpcyBtdWNoIGxpa2Ug
dGhlIG51bGxfbGVnYWN5X3BpYyBleGNlcHQgdGhhdCBpdAo+Pj4gcmVwb3J0cyBOUl9JUlFTX0xF
R0FDWSBpcnFzLgo+PiBJIGFzc3VtZSB0aGlzIGlzIGZvciBkb20wPwo+Pgo+PiBDb3VsZCB0aGVy
ZSBiZSB0aGUgc2FtZSBwcm9ibGVtIHdpdGggUFZIIGRvbTA/IChhbmQgaWYgeWVzIHRoZW4gdGhp
cwo+PiBzaG91bGQgcHJvYmFibHkgZ28gaW50byBhcmNoL3g4Ni94ZW4vZW5saWdodGVuLmMpLgo+
Pgo+PiAtYm9yaXMKPj4KPgo+IEkgYW0gZG9pbmcgdGhpcyB0byBmaXggYSBwcm9ibGVtIHdpdGgg
ZG9tMC4gIERvbVUgZG9lc24ndCBzZWVtIHRvIGhhdmUgCj4gYW4gUlRDLCBhbmQgc28gaXQgaXMg
dW5hZmZlY3RlZC4KPgo+IEknbSBub3QgZmFtaWxpYXIgd2l0aCBQVkgsIGJ1dCBoYXZlIG5vdyBk
b25lIHNvbWUgZXhwZXJpbWVudHMuIFRoZSBSVEMgCj4gb24gUFZIIHNlZW1zIGJyb2tlbiAtIGJ1
dCBub3QgcXVpdGUgaW4gdGhlIHNhbWUgd2F5IGFzIFBWLiBNb3JlIAo+IHJlc2VhcmNoIGlzIG5l
ZWRlZCwgaG93ZXZlciBzaW1wbHkgZG9pbmcgdGhlIHNhbWUgdHJpY2sgSSBkaWQgd2l0aCBQViAK
PiB3aWxsIG5vdCBmaXggdGhlIGlzc3VlLgo+Cj4gSSdsbCBsb29rIGZ1cnRoZXIgaW50byBpdC4K
PgoKVGhlIHNhbWUgcHJvYmxlbSBkb2VzIGV4aXN0IHdpdGggUFZIIC0gaG93ZXZlciBpdHMgd29y
c2Ugd2l0aCB0aGUgCnByZXNlbmNlIG9mIHRoZSBJTy1BUElDLCBhcyB3aXRoIG15IHBhdGNoIGl0
IHRyaWVzIHRvIHNldCB1cCB3aXRoIElSUSwgCmFuZCBmYWlscy4gIEknbSBub3Qgc3VyZSBob3cg
d291bGQgYmUgYmVzdCB0byBkZWFsIHdpdGggdGhpcy4KSG93ZXZlciwgdGhlIFJUQyBzZWVtcyBi
cm9rZW4gZXZlbiBmb3IgbWFjaGluZXMgd2l0aG91dCB0aGUgQUNQSSBvbWlzc2lvbi4KSSBjYW4g
c2VlIGZpeGluZyBpdCBmb3IganVzdCBQViBkb2Vzbid0IHNlZW0gdG9vIG5pY2UsIGJ1dCB1bnN1
cmUgaG93IHRvIApmaXggdGhpcyBmb3IgUFZILiAgSSdtIG9wZW4gdG8gc3VnZ2VzdGlvbnMsIGJ1
dCBvdGhlcndpc2UgSSdsbCBwdXQgdGhpcyAKb24gaG9sZC4KCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
