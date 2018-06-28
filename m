From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v6 11/13] xen: support the Null scheduler
Date: Thu, 28 Jun 2018 09:36:54 +0200
Message-ID: <20180628073654.5wl7z2s4gc4s5by4@mac.bytemobile.com>
References: <alpine.DEB.2.10.1806131409300.14695@sstabellini-ThinkPad-X260>
 <1528924492-6579-11-git-send-email-sstabellini@kernel.org>
 <5B22706A02000078001CB4C2@prv1-mh.provo.novell.com>
 <3881fbda-d34b-caf2-23d7-5f6e0a956748@citrix.com>
 <alpine.DEB.2.10.1806141318080.14695@sstabellini-ThinkPad-X260>
 <fc748ba73ec2eacc38613883d7a80ea748cf4d37.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <fc748ba73ec2eacc38613883d7a80ea748cf4d37.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMDk6Mjc6MDhBTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gT24gVGh1LCAyMDE4LTA2LTE0IGF0IDEzOjIwIC0wNzAwLCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6Cj4gPiBPbiBUaHUsIDE0IEp1biAyMDE4LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+ID4gPiBPbiAxNC8wNi8xOCAxNDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+IEkgZG9u
J3QgdGhpbmsgaXRzIHJlYXNvbmFibGUgdG8gYWx0ZXIgdGhlIHN1cHBvcnQgc3RhdHVzIHdpdGgg
dGhpcwo+ID4gaXNzdWUKPiA+ID4gb3V0c3RhbmRpbmcuCj4gPiAKPiA+IEkgY29tcGxldGVseSBt
aXNzZWQgdGhpcyByZXBvcnQsIHByb2JhYmx5IGJlY2F1c2UgSSBoYXZlbid0IHBhaWQKPiA+IGF0
dGVudGlvbiB0byBQVi1zaGltLiBEbyB5b3UgaGF2ZSBhbnkgbW9yZSBpbmZvcm1hdGlvbiBhYm91
dCB0aGlzPwo+ID4gVGhlCj4gPiByZXBvcnQgaXMgYSBiaXQgdmFndWUuIElmIEkgY2FuJ3QgcmVw
cm8gaXQsIEkgY2FuJ3QgZml4IGl0Lgo+ID4gCj4gPiBDb3VsZG4ndCBpdCBiZSB0aGF0IGlzIG5v
cm1hbCBiZWNhdXNlIGFmdGVyIGEgd2hpbGUgeW91IHJhbiBvdXQgb2YKPiA+IHBjcHVzPwo+ID4g
Cj4gPiBEYXJpbywgZG8geW91IGhhdmUgYW55IG9waW5pb24gb24gdGhpcz8KPiA+Cj4gVGhlIGlz
c3VlIHRoYXQgSSBrbm93IG9mIGlzIHRoYXQgdGhlIG51bGwgc2NoZWR1bGVyIGRvZXMgbm90IHBy
b3Blcmx5Cj4gc3VwcG9ydCBDUFUgaG90cGx1Zy9ob3R1bnBsdWcuCj4gCj4gVGhpcyBpcyBhbiBp
c3N1ZSBvbiwgbGV0J3Mgc2F5LCBiYXJlbWV0YWwsIGlmIHlvdSB1c2UgbnVsbCwgYW5kIHRyeSB0
bwo+IGRvIENQVSBob3RwbHVnL2hvdHVucGx1Zy4gV2hlbiB0cnlpbmcgdG8gdXNlIG51bGwgYXMg
dGhlIHNjaGVkdWxlciBvZgo+IHRoZSBzaGltLCB3ZSBydW4gaW50byB0aGF0IHNhbWUgaXNzdWUs
IGV2ZW4gaWYgbm90IHNwZWNpZmljYWxseSBkb2luZwo+IENQVSBob3RwbHVnL2hvdHVucGx1ZyAo
YmVjYXVzZSB0aGUgc2hpbSB1c2UgdGhlIHNhbWUgcGF0aCBmb3IgQ1BVCj4gYnJpbmd1cCwgSUlS
QykuCgpUaGUgc2hpbSB1c2VzIENQVSBob3RwbHVnL3VucGx1ZyB3aGVuIHRoZSBndWVzdCBicmlu
Z3MgdXAvZG93biBhCnZDUFUgdXNpbmcgdGhlIFZDUFVPUF97dXAvZG93bn0gaHlwZXJjYWxsLgoK
VGhlIGJlc3QgZGVzY3JpcHRpb24gb2YgdGhlIGlzc3VlIEkgY291bGQgZmluZCBpczoKCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wMS9t
c2cwMTA4NS5odG1sCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
