From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 08/18] xen: add basic hooks for PVH in
 current code
Date: Fri, 19 Oct 2018 17:52:44 +0200
Message-ID: <f932643f-bdce-7bed-55d2-39addfda50d2__41540.8800160096$1539964288$gmane$org@suse.com>
References: <20181009110317.6022-1-jgross@suse.com>
 <20181009110317.6022-9-jgross@suse.com>
 <20181019153327.giznmhrlxxjjmjsb@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181019153327.giznmhrlxxjjmjsb@mac.bytemobile.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: hans@knorrie.org, grub-devel@gnu.org, daniel.kiper@oracle.com, xen-devel@lists.xen.org, phcoder@gmail.com
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMjAxOCAxNzozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIE9j
dCAwOSwgMjAxOCBhdCAwMTowMzowN1BNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBB
ZGQgdGhlIGhvb2tzIHRvIGN1cnJlbnQgY29kZSBuZWVkZWQgZm9yIFhlbiBQVkguCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gLS0tCj4+ICBn
cnViLWNvcmUva2Vybi9pMzg2L3hlbi9wdmguYyAgICAgICAgIHwgMzYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4gIGdydWItY29yZS9rZXJuL2kzODYveGVuL3N0YXJ0dXBf
cHZoLlMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICBncnViLWNvcmUva2Vy
bi94ZW4vaW5pdC5jICAgICAgICAgICAgIHwgIDYgKysrKysrCj4+ICBpbmNsdWRlL2dydWIvaTM4
Ni94ZW5wdmgva2VybmVsLmggICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4gIGluY2x1ZGUvZ3J1Yi94ZW4uaCAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKPj4g
IDUgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBncnViLWNvcmUva2Vybi9pMzg2L3hlbi9wdmguYwo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGdy
dWItY29yZS9rZXJuL2kzODYveGVuL3N0YXJ0dXBfcHZoLlMKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2dydWIvaTM4Ni94ZW5wdmgva2VybmVsLmgKPj4KPj4gZGlmZiAtLWdpdCBhL2dy
dWItY29yZS9rZXJuL2kzODYveGVuL3B2aC5jIGIvZ3J1Yi1jb3JlL2tlcm4vaTM4Ni94ZW4vcHZo
LmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwLi4xODJlZjk1ZjkK
Pj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9ncnViLWNvcmUva2Vybi9pMzg2L3hlbi9wdmguYwo+
PiBAQCAtMCwwICsxLDM2IEBACj4+ICsvKgo+PiArICogIEdSVUIgIC0tICBHUmFuZCBVbmlmaWVk
IEJvb3Rsb2FkZXIKPj4gKyAqICBDb3B5cmlnaHQgKEMpIDIwMTEgIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbiwgSW5jLgo+IAo+IElzbid0IHRoaXMgaGVhZGVyIChhbmQgdGhlIG9uZXMgYmVsb3cp
IGtpbmQgb2Ygb2ZmIGF0IGxlYXN0IHllYXIKPiB3aXNlPwoKSG1tLCBvbmx5IGEgbGl0dGxlIGJp
dCA6LSkKCldpbGwgdXBkYXRlLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
