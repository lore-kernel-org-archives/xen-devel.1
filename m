From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 04/12] microcode: introduce a global
 cache of ucode patch
Date: Wed, 13 Mar 2019 17:04:43 +0000
Message-ID: <2fc8ac8c-c784-b2d5-d1f3-b25298ea6c89@citrix.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-5-git-send-email-chao.gao@intel.com>
 <20190312165353.j6fj53ho2y6rcxzr@Air-de-Roger>
 <5C88B3B9020000780021DF27@prv1-mh.provo.novell.com>
 <3b84e762-96ff-f1c7-7f37-4af9afb48153@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tilE=RQ=citrix.com=prvs=968d75336=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h47VE-0007UB-Er
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 17:17:16 +0000
In-Reply-To: <3b84e762-96ff-f1c7-7f37-4af9afb48153@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Chao Gao <chao.gao@intel.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMjAxOSAxMDozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8wMy8yMDE5
IDA3OjM5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTIuMDMuMTkgYXQgMTc6NTMsIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBJSVJDIHdlIGFncmVlZCB0aGF0IHN5c3Rl
bXMgd2l0aCBtaXhlZCBDUFUgdmVyc2lvbnMgYXJlIG5vdCBzdXBwb3J0ZWQsCj4+PiBoZW5jZSB0
aGUgc2FtZSBtaWNyb2NvZGUgYmxvYiBzaG91bGQgYmUgdXNlZCB0byB1cGRhdGUgYWxsIHRoZQo+
Pj4gcG9zc2libGUgQ1BVcyBvbiB0aGUgc3lzdGVtLCBzbyBhIGxpc3Qgc2hvdWxkIG5vdCBiZSBu
ZWVkZWQgaGVyZS4KPj4gVGhhdCdzIG5vdCB3aGF0IEkgcmVjYWxsLiBXZSBhZ3JlZWQgdG8gbm90
IHN0b3JlIGV2ZXJ5dGhpbmcsIGJlY2F1c2UKPj4gbWl4ZWQtZmFtaWx5IC8gbWl4ZWQtbW9kZWwg
c3lzdGVtcyBhcmUgY29tbW9ubHkgbm90IHN1cHBvcnRlZCBieQo+PiB0aGUgaHcgdmVuZG9ycy4g
QnV0IG1peGVkIHN0ZXBwaW5nIHN5c3RlbXMgbWF5IHdlbGwgYmUuCj4gVGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiBTa3lsYWtlIGFuZCBDYXNjYWRlTGFrZSBzZXJ2ZXIgQ1BVcyBpcyBvbmx5IGluCj4g
dGhlIHN0ZXBwaW5nICg0IHZzIDYpLsKgIFNhbWUgZm9yIEthYnkvQ29mZmVlL1doaXNrZXkvQW1i
ZXIgbGFrZSAodGhlCj4gbW9iaWxlIGFuZCBkZXNrdG9wIGxpbmVzIGhhdmUgYSBtb2RlbCBlYWNo
LCBhbmQgbmV3ZXIgZ2VuZXJhdGlvbnMgYXJlCj4ganVzdCBuZXcgc3RlcHBpbmdzKS4KPgo+IEkn
bGwgaGF2ZSB0byBkZWZlciB0byBJbnRlbCBhcyB0byBleGFjdGx5IHdoYXQgaXMgc3VwcG9ydGVk
LCBidXQgd2hlbiBJCj4gYXNrZWQgdGhpcyBiZWZvcmUsIHRoZSBhbnN3ZXIgd2FzIHRoYXQgbm8g
aGV0ZXJvZ2VuZWl0eSB3YXMgc3VwcG9ydGVkIGF0Cj4gYWxsLCBub3QgZXZlbiBhdCB0aGUgc3Rl
cHBpbmcgbGV2ZWwgb3IgcGxhdGZvcm0gSUQgbGV2ZWwuCgpTbywgYXMgaXQgdHVybnMgb3V0LCBY
ZW4gaW4gcHJhY3RpY2Ugb25seSBzdXBwb3J0cyBhIHNpbmdsZSBmaWxlcyB3b3J0aApvZiBtaWNy
b2NvZGUgZnJvbSAvbGliL2Zpcm13YXJlCgpUaGlzIGlzIGJlY2F1c2U6CjEpIFRoYXQgaXMgdGhl
IG9ubHkgYmVoYXZpb3VyIGRyYWt1dCBoYXMsIGFuZAoyKSBkcmFrdXQgaGFzIGJlZW4gdGhlIGRl
ZmF1bHQgaW5pdHJkLWdlbmVyYXRvciBpbiBMaW51eCBkaXN0cm9zIGZvciBmYXIKbG9uZ2VyIHRo
YW4gWGVuIGhhcyBoYWQgYm9vdCB0aW1lIG1pY3JvY29kZSBsb2FkaW5nIHN1cHBvcnQsIGFuZAoz
KSBUaGUgcnVudGltZSBtaWNyb2NvZGUgbG9hZGluZyBoeXBlcmNhbGwgaXMgY3VycmVudGx5IGNv
bXBsZXRlbHkgYnJva2VuCgpUaGVyZWZvcmUgaW4gcHJhY3RpY2UsIHRoZSBkcmFrdXQgd2F5IG9m
IGRvaW5nIHRoaW5ncyBpcyB0aGUgb25seSB3YXkKd2hpY2ggaGFzIGV2ZXIgc2VlbiBhbnkgdGVz
dGluZywgYW5kIGlzIHRoZXJlZm9yZSB0aGUgb25seSBvbmUgd2hpY2ggd29ya3MuCgpTbywgbWFr
aW5nIGEgc2ltcGxpZnlpbmcgYXNzdW1wdGlvbiBvZiAic2luZ2xlIHN0ZXBwaW5nL3BsYXRfaWQg
b25seSIgaW4KdGhlIEludGVsIGNhc2UgaXMgZmluZSBpZiBpdCB1c2VmdWwuCgpCZXlvbmQgdGhh
dCwgaXQgd291bGQgYmUgdXNlZnVsIHRvIGtub3cgd2hhdCBpcyBhbiBpc24ndCBzdXBwb3J0ZWQg
YnkKSW50ZWwsIGFuZCB3aGV0aGVyIHdlIGFyZSBsaWtlbHkgdG8gZmluZCBzeXN0ZW1zIGluIHRo
ZSB3aWxkIHdpdGggbWl4ZWQKY3B1IHBhY2thZ2VzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
