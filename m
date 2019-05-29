From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V1 2/2] xen/device-tree: Add ability to
 handle nodes with interrupts-extended prop
Date: Wed, 29 May 2019 20:58:43 +0300
Message-ID: <fbb40b64-c23b-be02-2c56-f0e0bf47324b@gmail.com>
References: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
 <1558460254-7127-3-git-send-email-olekstysh@gmail.com>
 <a35d398b-d2e9-9c80-8ac2-923a82c68019@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qhBv=T5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hW2qe-00024i-Nf
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:58:48 +0000
Received: by mail-lf1-x142.google.com with SMTP id u27so2822988lfg.10
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2019 10:58:47 -0700 (PDT)
In-Reply-To: <a35d398b-d2e9-9c80-8ac2-923a82c68019@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, sstabellini@kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDI5LjA1LjE5IDIwOjQ0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGksIEp1bGllbgoKCj4KPiBPbiAyMS8wNS8yMDE5IDE4OjM3LCBPbGVrc2FuZHIgVHlzaGNoZW5r
byB3cm90ZToKPj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPgo+Pgo+PiBUaGUgImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnR5IGlz
IGEgc3BlY2lhbCBmb3JtIGZvciB1c2Ugd2hlbgo+PiBhIG5vZGUgbmVlZHMgdG8gcmVmZXJlbmNl
IG11bHRpcGxlIGludGVycnVwdCBwYXJlbnRzLiA+Cj4+IEFjY29yZGluZyB0byB0aGU6Cj4KPiBO
SVQ6IHMvdGhlLy8KPgo+PiBMaW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvaW50ZXJydXB0cy50eHQgCj4+Cj4+Cj4+IEJ1dCwgdGhlcmUg
YXJlIGNhc2VzIHdoZW4gImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnR5IGlzIHVzZWQgZm9y
Cj4+ICJvdXRzaWRlIC9zb2Mgbm9kZSIgd2l0aCBhIHNpbmdsZSBpbnRlcnJ1cHQgcGFyZW50IGFz
IGFuIGVxdWl2YWxlbnQgb2YKPj4gcGFpcnMgKCJpbnRlcnJ1cHQtcGFyZW50IiArICJpbnRlcnJ1
cHRzIikuCj4+Cj4+IFRoZSBnb29kIGV4YW1wbGUgaGVyZSBpcyBBUkNIIHRpbWVyIG5vZGUgZm9y
IFItQ2FyIEdlbjMvR2VuMiBmYW1pbHksCj4KPiBOSVQ6IHMvVGhlL0EvIEkgdGhpbmsKPgo+PiB3
aGljaCBpcyBtYW5kYXRvcnkgZGV2aWNlIGZvciBYZW4gdXNhZ2Ugb24gQVJNLiBBbmQgd2l0aG91
dCBhYmlsaXR5Cj4+IHRvIGhhbmRsZSBzdWNoIG5vZGVzLCBYZW4gZmFpbHMgdG8gb3BlcmF0ZS4K
Pj4KPj4gU28sIHRoaXMgcGF0Y2ggYWRkcyByZXF1aXJlZCBzdXBwb3J0IGZvciBYZW4gdG8gYmUg
YWJsZSB0byBoYW5kbGUKPj4gbm9kZXMgd2l0aCB0aGF0IHByb3BlcnR5Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+Cj4KPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKVGhhbmsgeW91ISBJIGFzc3VtZSB5b3UgbWVhbnQgUmV2aWV3ZWQtYnk6IEp1bGll
biBHcmFsbCAKPGp1bGllbi5ncmFsbEBhcm0uY29tPiApCgpTaGFsbCBJIHNlbmQgbmV3IHZlcnNp
b24gd2l0aCBwcm9wb3NlZCBjaGFuZ2VzPwoKCj4KPiBJIHdpbGwgZ2l2ZSBhbiBvcHBvcnR1bml0
eSB0byBTdGVmYW5vIHRvIHJldmlldyBpdC4gSWYgSSBkb24ndCBoZWFyIAo+IGFueXRoaW5nIGJ5
IE1vbmRheSwgSSB3aWxsIG1lcmdlIGl0Lgo+Cj4gVGhhbmsgeW91IQo+Cj4gQ2hlZXJzLAo+Ci0t
IApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
