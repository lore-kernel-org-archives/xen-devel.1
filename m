From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC 09/15] xen/arm: refactor construct_dom0
Date: Fri, 6 Jul 2018 16:11:17 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807061424460.13502@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1806131457490.14695@sstabellini-ThinkPad-X260>
 <1528928118-14960-9-git-send-email-sstabellini@kernel.org>
 <451e6885-58a0-3bcc-4589-7b9d64476bd9@arm.com>
 <alpine.DEB.2.10.1806141543150.14695@sstabellini-ThinkPad-X260>
 <998426f2-cafc-e201-48db-a5d5dbf4b994@arm.com>
 <alpine.DEB.2.10.1807051354270.13502@sstabellini-ThinkPad-X260>
 <d74cf367-591d-b40b-d765-006fe2425849@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d74cf367-591d-b40b-d765-006fe2425849@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: artem_mygaiev@epam.com, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, xen-devel@lists.xen.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCA1IEp1bCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwNS8wNy8yMDE4IDIxOjU1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBG
cmksIDE1IEp1biAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEhpIFN0ZWZhbm8sCj4g
PiA+IAo+ID4gPiBPbiAwNi8xNS8yMDE4IDEyOjM1IEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gPiA+ID4gT24gVGh1LCAxNCBKdW4gMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4g
PiA+ID4gT24gMTMvMDYvMTggMjM6MTUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4g
aWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGQpICkKPiA+ID4gICAgcHJlcGFyZV9kdGJfZG9tVSgu
Li4pOwo+ID4gPiBlbHNlIGlmICggYWNwaV9kaXNhYmxlZCApCj4gPiA+ICAgIHByZXBhcmVfYWNw
aV9od2RvbSguLi4pOwo+ID4gPiBlbHNlCj4gPiA+ICAgIHByZXBhcmVfZHRfaHdkb20oLi4uLik7
Cj4gPiAKPiA+IFRoZSBmZXcgcmVtYWluaW5nIHRoaW5ncyBpbiBjb25zdHJ1Y3RfZG9tMCBhbmQg
Y29uc3RydWN0X2RvbVUgYXJlCj4gPiBkaWZmZXJlbnQgZW5vdWdoIHRoYXQgSSBkb24ndCB0aGlu
ayB0aGVyZSBpcyBtdWNoIGdhaW4gaW4gdHJ5aW5nIHRvCj4gPiBtZXJnZSB0aGVtLgo+IAo+IERv
IHlvdSBoYXZlIGEgY29uY3JldGUgZXhhbXBsZT8gV2hlbiBJIGxvb2tlZCBhdCBpdCB0aGUgb25s
eSB0aGluZ3MgSSBjYW4gZmluZAo+IGRpZmZlcmVudCBhcmU6Cj4gICAgLSBpb21tdV9od2RvbV9p
bml0KCkgLT4gTW9zdCBsaWtlbHkgeW91IHdvdWxkIG5lZWQgYSBzaW1pbGFyIGNhbGwgc29tZXdo
ZXJlCj4gZm9yIEd1ZXN0IERvbVUuCj4gICAgLSBmaW5kX2dudHRhYl9yZWdpb24gLT4gSSB0aGlu
ayB0aGlzIGNvdWxkIGJlIHJlLW9yZGVyZWQKPiAgICAtIGdpY19tYXBfaHdkb21fZXh0cmFfbWFw
cGluZ3MgJiBwbGF0Zm9ybV9zcGVjaWZpY19tYXBwaW5nIC0+IFRoaXMgY2FuIGJlCj4gY2FsbGVk
IGJlZm9yZSB0aGUgY29uc3RydWN0Lgo+IAo+IFNvIEkgZG9uJ3Qgc2VlIHdoeSB3ZSBjYW4ndCBt
ZXJnZSBtb3N0IG9mIHRoZSBjb2RlIGFuZCBzdGlsbCBoYXZlIGZldyBsaW5lcwo+IGZvciBEb20w
Lgo+IAo+IE92ZXJhbGwgSSB3b3VsZCBtdWNoIHByZWZlciBpZiB3ZSBkb24ndCBkdXBsaWNhdGUg
dGhlIGFsbG9jYXRpb24gb2YgdGhlIG1lbW9yeQo+IG9yIGFueXRoaW5nIHRoYXQgaXMgbm90IERv
bTAgc3BlY2lmaWMuCgpZb3UgbWlnaHQgYmUgcmlnaHQsIGJ1dCB0aGUgc2VyaWVzIGhhcyBjaGFu
Z2VkIHNpZ25pZmljYW50bHkgc2luY2UgdGhlClJGQy4gTGV0J3MgZ2l2ZSBhIGxvb2sgYXQgdjIs
IHlvdSdsbCBnZXQgYSBtb3JlIGNvbmNyZXRlIGlkZWEuIFRoZW4sCkknbGwgZG8gYW55IHJlcXVp
cmVkIGNoYW5nZXMgaW4gdjMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
